-- =====================================================================
-- EDUCA MAIS · INSTALADOR DO BANCO DE DADOS (gerado por scripts/build.mjs)
-- Como usar: Supabase > SQL Editor > New query > cole TODO este arquivo > Run.
-- Rode UMA vez, num projeto novo. Para atualizações futuras, rode só as
-- migrações novas (veja docs/MANUTENCAO.md).
-- Arquivos incluídos: 20261124000100_estrutura.sql, 20261124000200_funcoes.sql, 20261124000300_seguranca_rls.sql, 20261124000400_armazenamento.sql, 20261124000500_conteudo_inicial.sql, 20261124000600_admin_questoes.sql, 20261125000700_professores.sql, 20261125000800_armazenamento_professores.sql, 20261126000900_catalogo_ampliado.sql, 20261126001000_aulas_acesso_duvidas.sql
-- =====================================================================

-- >>>>>>>>>> 20261124000100_estrutura.sql
-- =====================================================================
-- Educa Mais · Migração 1: estrutura do banco (tabelas, chaves, índices)
-- Banco: PostgreSQL (Supabase). Segurança (RLS) fica na migração 3.
-- Convenções:
--   * Dados do aluno: id uuid gerado no aparelho (funciona offline),
--     user_id = dono, updated_at = hora da última edição (decide conflitos),
--     deleted_at = exclusão lógica (para sincronizar exclusões entre aparelhos),
--     synced_at = hora em que o SERVIDOR recebeu a versão (cursor de sincronização).
--   * Conteúdo (matérias, questões): mantido pelo administrador.
-- =====================================================================

create extension if not exists unaccent with schema extensions;

-- Função imutável de "tirar acentos", usada na busca de questões.
create or replace function public.sem_acento(t text)
returns text language sql immutable parallel safe
set search_path = ''
as $$ select extensions.unaccent('extensions.unaccent'::regdictionary, coalesce(t, '')) $$;

-- ---------------------------------------------------------------------
-- Categorias de usuário e permissões
-- ---------------------------------------------------------------------
create table public.roles (
  id          text primary key check (id ~ '^[a-z][a-z0-9_]{1,30}$'),
  name        text not null check (char_length(name) between 2 and 60),
  description text check (char_length(description) <= 300),
  permissions text[] not null default '{}',
  is_system   boolean not null default false,   -- categorias que não podem ser apagadas
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
comment on table public.roles is 'Categorias de usuário (administrador, estudante, professor...) e suas permissões.';

insert into public.roles (id, name, description, permissions, is_system) values
  ('admin',   'Administrador', 'Acesso total às ferramentas administrativas.', array['*'], true),
  ('student', 'Estudante',     'Usuário comum da plataforma.', array[]::text[], true),
  ('teacher', 'Professor',     'Categoria futura: pode gerenciar conteúdos.', array['admin.access','content.manage','stats.view'], false);

-- ---------------------------------------------------------------------
-- Perfis (1 por conta do Supabase Auth)
-- ---------------------------------------------------------------------
create table public.profiles (
  id             uuid primary key references auth.users (id) on delete cascade,
  display_name   text not null check (char_length(btrim(display_name)) between 1 and 60),
  role           text not null default 'student' references public.roles (id) on update cascade,
  status         text not null default 'active' check (status in ('active', 'blocked')),
  blocked_reason text check (char_length(blocked_reason) <= 300),
  study_profile  text not null default 'enem' check (study_profile in ('enem', 'medio', 'fundamental', 'concurso')),
  school_year    text check (char_length(school_year) <= 40),
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now(),
  last_seen_at   timestamptz
);
create index profiles_role_idx on public.profiles (role);
create index profiles_status_idx on public.profiles (status);
comment on table public.profiles is 'Perfil público mínimo de cada conta. Senhas ficam no Supabase Auth (criptografadas com bcrypt), nunca aqui.';

-- Preferências individuais e personalização visual
create table public.user_settings (
  user_id         uuid primary key references public.profiles (id) on delete cascade,
  theme           text not null default 'auto' check (theme in ('auto', 'light', 'dark', 'sepia', 'ocean', 'forest', 'contrast')),
  color_primary   text check (color_primary ~ '^#[0-9a-fA-F]{6}$'),
  color_secondary text check (color_secondary ~ '^#[0-9a-fA-F]{6}$'),
  color_accent    text check (color_accent ~ '^#[0-9a-fA-F]{6}$'),
  device_mode     text not null default 'auto' check (device_mode in ('auto', 'desktop', 'tablet', 'mobile')),
  card_style      text not null default 'elevated' check (card_style in ('elevated', 'flat', 'outlined')),
  density         text not null default 'comfortable' check (density in ('comfortable', 'compact')),
  font_scale      numeric(3, 2) not null default 1.00 check (font_scale between 0.85 and 1.30),
  reduce_motion   boolean not null default false,
  home_sections   text[] not null default array['continuar', 'metas', 'revisoes', 'trilha', 'ferramentas'],
  daily_goal_min  integer not null default 60 check (daily_goal_min between 10 and 720),
  focus_minutes   integer not null default 25 check (focus_minutes between 1 and 180),
  short_break_min integer not null default 5 check (short_break_min between 1 and 60),
  long_break_min  integer not null default 15 check (long_break_min between 1 and 90),
  last_view       text check (char_length(last_view) <= 40),
  updated_at      timestamptz not null default now(),
  synced_at       timestamptz not null default now()
);

-- ---------------------------------------------------------------------
-- Catálogo de conteúdo: área (matéria) > disciplina > conteúdo > subconteúdo
-- ---------------------------------------------------------------------
create table public.areas (
  id         bigint generated always as identity primary key,
  name       text not null unique check (char_length(name) between 2 and 80),
  position   smallint not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.areas is 'Matérias/áreas do conhecimento (ex.: Ciências da Natureza).';

create table public.subjects (
  id         bigint generated always as identity primary key,
  area_id    bigint not null references public.areas (id) on delete restrict,
  name       text not null unique check (char_length(name) between 2 and 80),
  color      text check (color ~ '^#[0-9a-fA-F]{6}$'),
  position   smallint not null default 0,
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
create index subjects_area_idx on public.subjects (area_id);
comment on table public.subjects is 'Disciplinas (ex.: Biologia).';

create table public.topics (
  id         bigint generated always as identity primary key,
  subject_id bigint not null references public.subjects (id) on delete cascade,
  parent_id  bigint references public.topics (id) on delete cascade,
  name       text not null check (char_length(name) between 2 and 120),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now(),
  constraint topics_not_self check (parent_id is distinct from id)
);
create unique index topics_unique_name on public.topics (subject_id, coalesce(parent_id, 0), lower(name));
create index topics_parent_idx on public.topics (parent_id);
comment on table public.topics is 'Conteúdos (parent_id nulo) e subconteúdos (parent_id preenchido).';

create table public.exam_boards (
  id         bigint generated always as identity primary key,
  name       text not null unique check (char_length(name) between 2 and 80),
  kind       text not null default 'banca' check (kind in ('banca', 'instituicao', 'escola', 'autoral')),
  created_at timestamptz not null default now(),
  updated_at timestamptz not null default now()
);
comment on table public.exam_boards is 'Instituição ou banca (INEP, FUVEST, Cebraspe, Autoral Educa Mais...).';

-- ---------------------------------------------------------------------
-- Questões e alternativas
-- ---------------------------------------------------------------------
create table public.questions (
  id          uuid primary key default gen_random_uuid(),
  code        text unique check (code ~ '^[A-Z0-9-]{3,30}$'),
  subject_id  bigint not null references public.subjects (id) on delete restrict,
  topic_id    bigint references public.topics (id) on delete set null,
  level       text not null check (level in ('fundamental', 'medio', 'enem', 'concurso')),
  difficulty  smallint not null default 2 check (difficulty between 1 and 5),
  board_id    bigint references public.exam_boards (id) on delete set null,
  year        smallint check (year between 1950 and 2100),
  qtype       text not null default 'multiple_choice' check (qtype in ('multiple_choice', 'true_false')),
  theme       text check (char_length(theme) <= 120),
  statement   text not null check (char_length(statement) between 5 and 8000),
  image_path  text check (image_path ~ '^[A-Za-z0-9/_.-]{3,200}$'),
  image_alt   text check (char_length(image_alt) <= 300),
  explanation text not null check (char_length(explanation) between 2 and 8000),
  hint        text check (char_length(hint) <= 1000),
  source      text check (char_length(source) <= 300),
  status      text not null default 'draft' check (status in ('draft', 'published', 'archived')),
  created_by  uuid references public.profiles (id) on delete set null,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  search      tsvector generated always as (
    to_tsvector('portuguese', public.sem_acento(coalesce(statement, '') || ' ' || coalesce(theme, '') || ' ' || coalesce(explanation, '')))
  ) stored
);
create index questions_filter_idx on public.questions (status, subject_id, level, difficulty);
create index questions_topic_idx on public.questions (topic_id);
create index questions_board_year_idx on public.questions (board_id, year);
create index questions_updated_idx on public.questions (updated_at);
create index questions_search_idx on public.questions using gin (search);

create table public.question_options (
  id          uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.questions (id) on delete cascade,
  position    smallint not null check (position between 0 and 5),
  body        text not null check (char_length(body) between 1 and 2000),
  is_correct  boolean not null default false,
  updated_at  timestamptz not null default now(),
  constraint question_options_position_key unique (question_id, position) deferrable initially deferred
);
create index question_options_q_idx on public.question_options (question_id);

create table public.question_comments (
  id          uuid primary key default gen_random_uuid(),
  question_id uuid not null references public.questions (id) on delete cascade,
  user_id     uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  body        text not null check (char_length(btrim(body)) between 2 and 2000),
  status      text not null default 'visible' check (status in ('visible', 'hidden')),
  created_at  timestamptz not null default now()
);
create index question_comments_q_idx on public.question_comments (question_id, created_at);

-- ---------------------------------------------------------------------
-- Dados de estudo do aluno (memória persistente)
-- ---------------------------------------------------------------------
create table public.exam_attempts (
  id          uuid primary key,
  user_id     uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  title       text check (char_length(title) <= 120),
  filters     jsonb not null default '{}'::jsonb,
  total       smallint not null default 0 check (total between 0 and 300),
  correct     smallint not null default 0 check (correct >= 0),
  started_at  timestamptz not null default now(),
  finished_at timestamptz,
  updated_at  timestamptz not null default now(),
  deleted_at  timestamptz,
  synced_at   timestamptz not null default now(),
  unique (id, user_id)
);
create index exam_attempts_user_idx on public.exam_attempts (user_id, synced_at);

create table public.answers (
  id              uuid primary key,
  user_id         uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  question_id     uuid not null references public.questions (id) on delete restrict,  -- questão respondida deve ser arquivada, não apagada
  option_id       uuid references public.question_options (id) on delete set null,
  is_correct      boolean not null default false,   -- calculado pelo servidor (gatilho)
  time_spent_ms   integer check (time_spent_ms between 0 and 7200000),
  used_hint       boolean not null default false,
  mode            text not null default 'pratica' check (mode in ('pratica', 'simulado', 'revisao')),
  exam_attempt_id uuid,
  answered_at     timestamptz not null default now(),
  synced_at       timestamptz not null default now(),
  foreign key (exam_attempt_id, user_id) references public.exam_attempts (id, user_id) on delete cascade
);
create index answers_user_time_idx on public.answers (user_id, answered_at desc);
create index answers_user_q_idx on public.answers (user_id, question_id);
create index answers_user_sync_idx on public.answers (user_id, synced_at);
create index answers_question_idx on public.answers (question_id);

create table public.favorites (
  user_id     uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  question_id uuid not null references public.questions (id) on delete cascade,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  deleted_at  timestamptz,
  synced_at   timestamptz not null default now(),
  primary key (user_id, question_id)
);
create index favorites_user_sync_idx on public.favorites (user_id, synced_at);

create table public.decks (
  id          uuid primary key,
  user_id     uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  name        text not null check (char_length(btrim(name)) between 1 and 60),
  subject_id  bigint references public.subjects (id) on delete set null,
  color       text check (color ~ '^#[0-9a-fA-F]{6}$'),
  is_favorite boolean not null default false,
  kind        text not null default 'user' check (kind in ('user', 'errors')),
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  deleted_at  timestamptz,
  synced_at   timestamptz not null default now(),
  unique (id, user_id)
);
create index decks_user_sync_idx on public.decks (user_id, synced_at);

create table public.flashcards (
  id                 uuid primary key,
  user_id            uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  deck_id            uuid not null,
  front              text not null check (char_length(btrim(front)) between 1 and 1000),
  back               text not null check (char_length(btrim(back)) between 1 and 3000),
  subject_id         bigint references public.subjects (id) on delete set null,
  is_favorite        boolean not null default false,
  source_question_id uuid references public.questions (id) on delete set null,
  ease               real not null default 2.5 check (ease between 1.3 and 5),
  interval_days      real not null default 0 check (interval_days between 0 and 36500),
  repetitions        integer not null default 0 check (repetitions >= 0),
  lapses             integer not null default 0 check (lapses >= 0),
  due_at             timestamptz not null default now(),
  last_reviewed_at   timestamptz,
  created_at         timestamptz not null default now(),
  updated_at         timestamptz not null default now(),
  deleted_at         timestamptz,
  synced_at          timestamptz not null default now(),
  unique (id, user_id),
  foreign key (deck_id, user_id) references public.decks (id, user_id) on delete cascade
);
create index flashcards_user_due_idx on public.flashcards (user_id, due_at) where deleted_at is null;
create index flashcards_user_sync_idx on public.flashcards (user_id, synced_at);
create index flashcards_deck_idx on public.flashcards (deck_id);

create table public.flashcard_reviews (
  id             uuid primary key,
  user_id        uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  card_id        uuid not null,
  rating         smallint not null check (rating between 0 and 3), -- 0 errei, 1 difícil, 2 bom, 3 fácil
  interval_before real not null default 0,
  interval_after real not null default 0,
  reviewed_at    timestamptz not null default now(),
  synced_at      timestamptz not null default now(),
  foreign key (card_id, user_id) references public.flashcards (id, user_id) on delete cascade
);
create index flashcard_reviews_user_idx on public.flashcard_reviews (user_id, reviewed_at desc);
create index flashcard_reviews_sync_idx on public.flashcard_reviews (user_id, synced_at);
create index flashcard_reviews_card_idx on public.flashcard_reviews (card_id);

create table public.notes (
  id          uuid primary key,
  user_id     uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  title       text not null default '' check (char_length(title) <= 120),
  body        text not null default '' check (char_length(body) <= 50000),
  subject_id  bigint references public.subjects (id) on delete set null,
  is_favorite boolean not null default false,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  deleted_at  timestamptz,
  synced_at   timestamptz not null default now()
);
create index notes_user_sync_idx on public.notes (user_id, synced_at);

create table public.plan_tasks (
  id           uuid primary key,
  user_id      uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  title        text not null check (char_length(btrim(title)) between 1 and 60),
  weekday      smallint not null check (weekday between 0 and 6),   -- 0 = segunda
  start_time   time not null default '19:00',
  duration_min smallint not null default 50 check (duration_min between 5 and 600),
  done_on      date,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now(),
  deleted_at   timestamptz,
  synced_at    timestamptz not null default now()
);
create index plan_tasks_user_sync_idx on public.plan_tasks (user_id, synced_at);

create table public.goals (
  user_id     uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  kind        text not null check (kind in ('daily_focus_minutes', 'weekly_questions', 'weekly_reviews', 'target_accuracy', 'weekly_study_days')),
  target      integer not null check (target between 1 and 100000),
  active      boolean not null default true,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now(),
  deleted_at  timestamptz,
  synced_at   timestamptz not null default now(),
  primary key (user_id, kind)
);
create index goals_user_sync_idx on public.goals (user_id, synced_at);

create table public.study_sessions (
  id           uuid primary key,
  user_id      uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  kind         text not null check (kind in ('foco', 'questoes', 'revisao', 'leitura')),
  subject      text check (char_length(subject) <= 60),
  started_at   timestamptz not null,
  duration_sec integer not null check (duration_sec between 1 and 86400),
  synced_at    timestamptz not null default now()
);
create index study_sessions_user_idx on public.study_sessions (user_id, started_at desc);
create index study_sessions_sync_idx on public.study_sessions (user_id, synced_at);

-- Histórico de acessos (sessões de login) por aparelho
create table public.login_sessions (
  id           uuid primary key,
  user_id      uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  device       text check (char_length(device) <= 40),
  user_agent   text check (char_length(user_agent) <= 300),
  started_at   timestamptz not null default now(),
  last_seen_at timestamptz not null default now(),
  ended_at     timestamptz
);
create index login_sessions_user_idx on public.login_sessions (user_id, started_at desc);

-- ---------------------------------------------------------------------
-- Materiais protegidos (PDFs etc.) e registros de acesso
-- ---------------------------------------------------------------------
create table public.materials (
  id           uuid primary key default gen_random_uuid(),
  title        text not null check (char_length(btrim(title)) between 2 and 160),
  description  text check (char_length(description) <= 1000),
  subject_id   bigint references public.subjects (id) on delete set null,
  storage_path text not null unique check (storage_path ~ '^[A-Za-z0-9/_.-]{3,200}$'),
  mime_type    text check (char_length(mime_type) <= 100),
  size_bytes   bigint check (size_bytes between 0 and 104857600),
  access       text not null default 'authenticated' check (access in ('authenticated', 'staff')),
  status       text not null default 'published' check (status in ('draft', 'published', 'archived')),
  created_by   uuid references public.profiles (id) on delete set null,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now()
);

create table public.material_access_log (
  id          bigint generated always as identity primary key,
  material_id uuid not null references public.materials (id) on delete cascade,
  user_id     uuid not null references public.profiles (id) on delete cascade,
  accessed_at timestamptz not null default now()
);
create index material_access_user_idx on public.material_access_log (user_id, accessed_at desc);
create index material_access_mat_idx on public.material_access_log (material_id, accessed_at desc);

-- ---------------------------------------------------------------------
-- Administração: configurações globais, auditoria, eventos de segurança, limites
-- ---------------------------------------------------------------------
create table public.app_settings (
  key         text primary key check (key ~ '^[a-z][a-z0-9_.]{1,60}$'),
  value       jsonb not null,
  description text check (char_length(description) <= 300),
  is_public   boolean not null default false,   -- pode ser lida sem login (ex.: aviso de manutenção)
  updated_at  timestamptz not null default now(),
  updated_by  uuid references public.profiles (id) on delete set null
);

insert into public.app_settings (key, value, description, is_public) values
  ('aviso_geral',        '""'::jsonb,  'Mensagem exibida no topo para todos (deixe vazio para não mostrar).', true),
  ('cadastro_aberto',    'true'::jsonb, 'Se falso, o app esconde o formulário de cadastro (desligue também em Auth > Sign up no Supabase).', true),
  ('questoes_por_simulado', '10'::jsonb, 'Quantidade padrão de questões em um simulado.', true),
  ('comentarios_ativos', 'true'::jsonb, 'Permite que estudantes comentem nas questões.', true);

create table public.audit_log (
  id           bigint generated always as identity primary key,
  actor_id     uuid,
  action       text not null,
  target_table text,
  target_id    text,
  details      jsonb not null default '{}'::jsonb,
  created_at   timestamptz not null default now()
);
create index audit_log_time_idx on public.audit_log (created_at desc);
create index audit_log_actor_idx on public.audit_log (actor_id, created_at desc);
comment on table public.audit_log is 'Registro de ações administrativas. Ninguém (nem admin) pode alterar ou apagar pelo app.';

create table public.security_events (
  id         bigint generated always as identity primary key,
  user_id    uuid references public.profiles (id) on delete set null,
  kind       text not null,
  details    jsonb not null default '{}'::jsonb,
  created_at timestamptz not null default now()
);
create index security_events_time_idx on public.security_events (created_at desc);

create table public.rate_counters (
  user_id      uuid not null,
  bucket       text not null,
  window_start timestamptz not null,
  hits         integer not null default 0,
  primary key (user_id, bucket, window_start)
);


-- >>>>>>>>>> 20261124000200_funcoes.sql
-- =====================================================================
-- Educa Mais · Migração 2: funções e gatilhos (regras no servidor)
-- Toda função "security definer" fixa search_path vazio e qualifica nomes,
-- evitando sequestro de esquema.
-- =====================================================================

-- ---------------------------------------------------------------------
-- Funções auxiliares de permissão
-- ---------------------------------------------------------------------
create or replace function public.is_active()
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (select 1 from public.profiles p where p.id = auth.uid() and p.status = 'active')
$$;

create or replace function public.has_permission(perm text)
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (
    select 1 from public.profiles p join public.roles r on r.id = p.role
    where p.id = auth.uid() and p.status = 'active'
      and ('*' = any (r.permissions) or perm = any (r.permissions))
  )
$$;

create or replace function public.is_admin()
returns boolean language sql stable security definer set search_path = ''
as $$ select public.has_permission('admin.access') $$;

-- Registro de auditoria (usado por funções internas)
create or replace function public.audit(p_action text, p_table text, p_target text, p_details jsonb default '{}'::jsonb)
returns void language sql security definer set search_path = ''
as $$
  insert into public.audit_log (actor_id, action, target_table, target_id, details)
  values (auth.uid(), p_action, p_table, p_target, coalesce(p_details, '{}'::jsonb))
$$;

-- ---------------------------------------------------------------------
-- Novo usuário: cria perfil e preferências automaticamente
-- ---------------------------------------------------------------------
create or replace function public.handle_new_user()
returns trigger language plpgsql security definer set search_path = ''
as $$
declare
  nome text := left(btrim(regexp_replace(coalesce(new.raw_user_meta_data ->> 'display_name', ''), '[<>\u0000-\u001f]', '', 'g')), 60);
  perfil text := coalesce(new.raw_user_meta_data ->> 'study_profile', 'enem');
begin
  if nome = '' then nome := split_part(coalesce(new.email, 'Estudante'), '@', 1); end if;
  if perfil not in ('enem', 'medio', 'fundamental', 'concurso') then perfil := 'enem'; end if;
  -- Sempre "student": ninguém vira administrador pelo cadastro.
  insert into public.profiles (id, display_name, study_profile) values (new.id, left(nome, 60), perfil);
  insert into public.user_settings (user_id) values (new.id);
  return new;
end $$;

create trigger on_auth_user_created
  after insert on auth.users for each row execute function public.handle_new_user();

-- ---------------------------------------------------------------------
-- updated_at automático (conteúdo administrado)
-- ---------------------------------------------------------------------
create or replace function public.touch_updated_at()
returns trigger language plpgsql set search_path = ''
as $$ begin new.updated_at := now(); return new; end $$;

do $$
declare t text;
begin
  foreach t in array array['roles', 'profiles', 'areas', 'subjects', 'topics', 'exam_boards', 'questions', 'question_options', 'materials', 'app_settings']
  loop
    execute format('create trigger touch_%1$s before update on public.%1$I for each row execute function public.touch_updated_at()', t);
  end loop;
end $$;

-- ---------------------------------------------------------------------
-- Sincronização: "última edição vence" e cursor do servidor
-- ---------------------------------------------------------------------
create or replace function public.sync_guard()
returns trigger language plpgsql set search_path = ''
as $$
begin
  -- Relógio do aparelho muito adiantado: usa a hora do servidor.
  if new.updated_at is null or new.updated_at > now() + interval '5 minutes' then
    new.updated_at := now();
  end if;
  if tg_op = 'UPDATE' then
    new.user_id := old.user_id;                 -- dono nunca muda
    if new.updated_at < old.updated_at then     -- versão mais antiga chegou depois: ignora
      return old;
    end if;
  end if;
  new.synced_at := clock_timestamp();
  return new;
end $$;

do $$
declare t text;
begin
  foreach t in array array['user_settings', 'exam_attempts', 'favorites', 'decks', 'flashcards', 'notes', 'plan_tasks', 'goals']
  loop
    execute format('create trigger sync_guard before insert or update on public.%1$I for each row execute function public.sync_guard()', t);
  end loop;
end $$;

-- Tabelas só de inclusão (histórico): marca cursor e impede datas no futuro.
create or replace function public.append_guard()
returns trigger language plpgsql set search_path = ''
as $$
begin
  new.synced_at := clock_timestamp();
  return new;
end $$;

create trigger append_guard before insert on public.study_sessions for each row execute function public.append_guard();
create trigger append_guard before insert on public.flashcard_reviews for each row execute function public.append_guard();

-- ---------------------------------------------------------------------
-- Limite de requisições por usuário (proteção contra abuso/automação)
-- Uso no gatilho: enforce_rate_limit('<balde>', '<máximo>', '<janela em segundos>')
-- ---------------------------------------------------------------------
create or replace function public.check_rate(p_bucket text, p_max integer, p_window_sec integer)
returns void language plpgsql security definer set search_path = ''
as $$
declare
  uid uuid := auth.uid();
  win timestamptz;
  n integer;
begin
  if uid is null then return; end if;  -- chamadas internas/administrativas
  win := to_timestamp(floor(extract(epoch from now()) / p_window_sec) * p_window_sec);
  insert into public.rate_counters as rc (user_id, bucket, window_start, hits)
  values (uid, p_bucket, win, 1)
  on conflict (user_id, bucket, window_start) do update set hits = rc.hits + 1
  returning hits into n;
  if n > p_max then
    raise exception 'Limite de uso atingido (%). Aguarde alguns minutos.', p_bucket using errcode = 'P0429';
  end if;
end $$;

create or replace function public.enforce_rate_limit()
returns trigger language plpgsql set search_path = ''
as $$
begin
  perform public.check_rate(tg_argv[0], tg_argv[1]::integer, tg_argv[2]::integer);
  return new;
end $$;

create trigger rate_answers before insert on public.answers for each row execute function public.enforce_rate_limit('answers', '1500', '3600');
create trigger rate_comments before insert on public.question_comments for each row execute function public.enforce_rate_limit('comments', '30', '3600');
create trigger rate_flashcards before insert on public.flashcards for each row execute function public.enforce_rate_limit('flashcards', '3000', '3600');
create trigger rate_notes before insert on public.notes for each row execute function public.enforce_rate_limit('notes', '600', '3600');
create trigger rate_reviews before insert on public.flashcard_reviews for each row execute function public.enforce_rate_limit('reviews', '5000', '3600');

-- Limpeza de contadores antigos (chamada pelo backup/manutenção ou pg_cron)
create or replace function public.cleanup_rate_counters()
returns void language sql security definer set search_path = ''
as $$ delete from public.rate_counters where window_start < now() - interval '2 days' $$;

-- ---------------------------------------------------------------------
-- Respostas: correção automática NO SERVIDOR
-- ---------------------------------------------------------------------
create or replace function public.grade_answer()
returns trigger language plpgsql security definer set search_path = ''
as $$
declare
  ok boolean;
  st text;
begin
  select q.status into st from public.questions q where q.id = new.question_id;
  if st is null or (st <> 'published' and not public.has_permission('content.manage')) then
    raise exception 'Questão indisponível.' using errcode = '23503';
  end if;
  if new.option_id is null then
    new.is_correct := false;
  else
    select o.is_correct into ok from public.question_options o
     where o.id = new.option_id and o.question_id = new.question_id;
    if ok is null then
      raise exception 'Alternativa não pertence à questão.' using errcode = '23514';
    end if;
    new.is_correct := ok;   -- o valor enviado pelo aparelho é ignorado
  end if;
  if new.answered_at > now() + interval '5 minutes' then new.answered_at := now(); end if;
  new.synced_at := clock_timestamp();
  return new;
end $$;

create trigger grade_answer before insert on public.answers for each row execute function public.grade_answer();

-- Simulados: o total de acertos é recalculado pelo servidor a partir das respostas.
create or replace function public.recount_attempt()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  if new.exam_attempt_id is not null then
    update public.exam_attempts a
       set correct = (select count(*) from public.answers x where x.exam_attempt_id = a.id and x.is_correct),
           synced_at = clock_timestamp()
     where a.id = new.exam_attempt_id;
  end if;
  return null;
end $$;
create trigger recount_attempt after insert on public.answers for each row execute function public.recount_attempt();

-- ---------------------------------------------------------------------
-- Integridade das questões: publicada precisa de 2+ alternativas e exatamente 1 correta
-- ---------------------------------------------------------------------
create or replace function public.validate_question(qid uuid)
returns void language plpgsql set search_path = ''
as $$
declare
  st text; tp text; n integer; c integer; subj bigint; top bigint; top_subj bigint;
begin
  select status, qtype, subject_id, topic_id into st, tp, subj, top from public.questions where id = qid;
  if st is null then return; end if;
  if top is not null then
    select subject_id into top_subj from public.topics where id = top;
    if top_subj is distinct from subj then
      raise exception 'O conteúdo escolhido não pertence a esta disciplina.' using errcode = '23514';
    end if;
  end if;
  if st <> 'published' then return; end if;
  select count(*), count(*) filter (where is_correct) into n, c from public.question_options where question_id = qid;
  if c <> 1 then
    raise exception 'Uma questão publicada precisa de exatamente uma alternativa correta.' using errcode = '23514';
  end if;
  if (tp = 'true_false' and n <> 2) or (tp = 'multiple_choice' and n < 2) then
    raise exception 'Número de alternativas inválido para o tipo da questão.' using errcode = '23514';
  end if;
end $$;

create or replace function public.validate_question_trg()
returns trigger language plpgsql set search_path = ''
as $$
begin
  if tg_table_name = 'questions' then
    perform public.validate_question(new.id);
  else
    perform public.validate_question(coalesce(new.question_id, old.question_id));
  end if;
  return null;
end $$;

create constraint trigger validate_question after insert or update on public.questions
  deferrable initially deferred for each row execute function public.validate_question_trg();
create constraint trigger validate_options after insert or update or delete on public.question_options
  deferrable initially deferred for each row execute function public.validate_question_trg();

-- Quem cria a questão fica registrado
create or replace function public.set_created_by()
returns trigger language plpgsql set search_path = ''
as $$ begin new.created_by := coalesce(new.created_by, auth.uid()); return new; end $$;
create trigger set_created_by before insert on public.questions for each row execute function public.set_created_by();
create trigger set_created_by before insert on public.materials for each row execute function public.set_created_by();

-- ---------------------------------------------------------------------
-- Auditoria automática das alterações de conteúdo e configurações
-- ---------------------------------------------------------------------
create or replace function public.audit_trg()
returns trigger language plpgsql security definer set search_path = ''
as $$
declare
  rid text;
  info jsonb := '{}'::jsonb;
begin
  rid := coalesce((to_jsonb(new) ->> 'id'), (to_jsonb(old) ->> 'id'), (to_jsonb(new) ->> 'key'), (to_jsonb(old) ->> 'key'));
  if tg_table_name = 'questions' then
    info := jsonb_build_object('code', coalesce(to_jsonb(new) ->> 'code', to_jsonb(old) ->> 'code'),
                               'status', coalesce(to_jsonb(new) ->> 'status', to_jsonb(old) ->> 'status'));
  elsif tg_table_name = 'app_settings' then
    info := jsonb_build_object('value', to_jsonb(new) -> 'value');
  elsif tg_table_name = 'roles' then
    info := jsonb_build_object('permissions', coalesce(to_jsonb(new) -> 'permissions', to_jsonb(old) -> 'permissions'));
  elsif to_jsonb(coalesce(new, old)) ? 'name' then
    info := jsonb_build_object('name', to_jsonb(coalesce(new, old)) ->> 'name');
  end if;
  insert into public.audit_log (actor_id, action, target_table, target_id, details)
  values (auth.uid(), lower(tg_op), tg_table_name, rid, info);
  return null;
end $$;

do $$
declare t text;
begin
  foreach t in array array['roles', 'areas', 'subjects', 'topics', 'exam_boards', 'questions', 'materials', 'app_settings']
  loop
    execute format('create trigger audit_%1$s after insert or update or delete on public.%1$I for each row execute function public.audit_trg()', t);
  end loop;
end $$;

-- Categoria "admin" e "student" não podem ser apagadas nem perder o essencial
create or replace function public.protect_roles()
returns trigger language plpgsql set search_path = ''
as $$
begin
  if tg_op = 'DELETE' then
    if old.is_system then raise exception 'Esta categoria é do sistema e não pode ser apagada.' using errcode = '42501'; end if;
    return old;
  end if;
  if old.id = 'admin' and not ('*' = any (new.permissions)) then
    raise exception 'A categoria Administrador precisa manter acesso total.' using errcode = '42501';
  end if;
  new.is_system := old.is_system;
  new.id := old.id;
  return new;
end $$;
create trigger protect_roles before update or delete on public.roles for each row execute function public.protect_roles();

-- ---------------------------------------------------------------------
-- Funções para o próprio usuário (LGPD: consultar, corrigir, excluir)
-- ---------------------------------------------------------------------
create or replace function public.my_profile()
returns jsonb language sql stable security definer set search_path = ''
as $$
  select jsonb_build_object(
    'id', p.id, 'display_name', p.display_name, 'role', p.role, 'status', p.status,
    'blocked_reason', p.blocked_reason, 'study_profile', p.study_profile, 'school_year', p.school_year,
    'created_at', p.created_at, 'permissions', r.permissions, 'role_name', r.name)
  from public.profiles p join public.roles r on r.id = p.role
  where p.id = auth.uid()
$$;

create or replace function public.export_my_data()
returns jsonb language plpgsql stable security definer set search_path = ''
as $$
declare uid uuid := auth.uid(); out jsonb;
begin
  if uid is null then raise exception 'Faça login.' using errcode = '42501'; end if;
  select jsonb_build_object(
    'gerado_em', now(),
    'perfil', (select to_jsonb(p) from public.profiles p where p.id = uid),
    'conta', (select jsonb_build_object('email', u.email, 'criada_em', u.created_at, 'ultimo_login', u.last_sign_in_at) from auth.users u where u.id = uid),
    'preferencias', (select to_jsonb(s) from public.user_settings s where s.user_id = uid),
    'respostas', coalesce((select jsonb_agg(to_jsonb(a) order by a.answered_at) from public.answers a where a.user_id = uid), '[]'),
    'simulados', coalesce((select jsonb_agg(to_jsonb(a)) from public.exam_attempts a where a.user_id = uid), '[]'),
    'favoritos', coalesce((select jsonb_agg(to_jsonb(f)) from public.favorites f where f.user_id = uid), '[]'),
    'colecoes', coalesce((select jsonb_agg(to_jsonb(d)) from public.decks d where d.user_id = uid), '[]'),
    'flashcards', coalesce((select jsonb_agg(to_jsonb(c)) from public.flashcards c where c.user_id = uid), '[]'),
    'revisoes', coalesce((select jsonb_agg(to_jsonb(r)) from public.flashcard_reviews r where r.user_id = uid), '[]'),
    'anotacoes', coalesce((select jsonb_agg(to_jsonb(n)) from public.notes n where n.user_id = uid), '[]'),
    'cronograma', coalesce((select jsonb_agg(to_jsonb(t)) from public.plan_tasks t where t.user_id = uid), '[]'),
    'metas', coalesce((select jsonb_agg(to_jsonb(g)) from public.goals g where g.user_id = uid), '[]'),
    'sessoes_de_estudo', coalesce((select jsonb_agg(to_jsonb(s)) from public.study_sessions s where s.user_id = uid), '[]'),
    'acessos', coalesce((select jsonb_agg(to_jsonb(l)) from public.login_sessions l where l.user_id = uid), '[]'),
    'comentarios', coalesce((select jsonb_agg(to_jsonb(c)) from public.question_comments c where c.user_id = uid), '[]')
  ) into out;
  return out;
end $$;

-- Apaga o histórico de estudo (mantém a conta)
create or replace function public.reset_my_study_data()
returns void language plpgsql security definer set search_path = ''
as $$
declare uid uuid := auth.uid();
begin
  if uid is null then raise exception 'Faça login.' using errcode = '42501'; end if;
  delete from public.answers where user_id = uid;
  delete from public.exam_attempts where user_id = uid;
  delete from public.flashcard_reviews where user_id = uid;
  delete from public.study_sessions where user_id = uid;
  delete from public.flashcards where user_id = uid;
  delete from public.decks where user_id = uid;
  delete from public.notes where user_id = uid;
  delete from public.plan_tasks where user_id = uid;
  delete from public.goals where user_id = uid;
  delete from public.favorites where user_id = uid;
end $$;

-- Exclui a conta e TODOS os dados ligados a ela (cascata)
create or replace function public.delete_my_account()
returns void language plpgsql security definer set search_path = ''
as $$
declare uid uuid := auth.uid();
begin
  if uid is null then raise exception 'Faça login.' using errcode = '42501'; end if;
  if exists (select 1 from public.profiles where id = uid and role = 'admin')
     and (select count(*) from public.profiles where role = 'admin' and status = 'active') <= 1 then
    raise exception 'Você é o único administrador. Nomeie outro administrador antes de excluir a conta.' using errcode = '42501';
  end if;
  insert into public.audit_log (actor_id, action, target_table, target_id) values (uid, 'account.self_delete', 'profiles', uid::text);
  delete from auth.users where id = uid;
end $$;

-- ---------------------------------------------------------------------
-- Ferramentas do administrador (sempre verificam permissão no servidor)
-- ---------------------------------------------------------------------
create or replace function public.require_permission(perm text)
returns void language plpgsql stable security definer set search_path = ''
as $$
begin
  if not public.has_permission(perm) then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
end $$;

create or replace function public.admin_list_users(p_search text default '', p_limit integer default 50, p_offset integer default 0)
returns table (id uuid, email text, display_name text, role text, status text, blocked_reason text,
               created_at timestamptz, last_sign_in_at timestamptz, answers bigint, total bigint)
language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.view');
  return query
  with base as (
    select p.id, u.email::text as email, p.display_name, p.role, p.status, p.blocked_reason, p.created_at, u.last_sign_in_at
      from public.profiles p join auth.users u on u.id = p.id
     where coalesce(p_search, '') = ''
        or p.display_name ilike '%' || p_search || '%'
        or u.email ilike '%' || p_search || '%'
  )
  select b.id, b.email, b.display_name, b.role, b.status, b.blocked_reason, b.created_at, b.last_sign_in_at,
         (select count(*) from public.answers a where a.user_id = b.id),
         count(*) over ()
    from base b
   order by b.created_at desc
   limit least(greatest(p_limit, 1), 200) offset greatest(p_offset, 0);
end $$;

create or replace function public.admin_set_user_status(p_user uuid, p_status text, p_reason text default null)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  if p_status not in ('active', 'blocked') then raise exception 'Situação inválida.' using errcode = '22023'; end if;
  if p_user = auth.uid() then raise exception 'Você não pode bloquear a própria conta.' using errcode = '42501'; end if;
  update public.profiles set status = p_status,
         blocked_reason = case when p_status = 'blocked' then left(p_reason, 300) else null end
   where id = p_user;
  if not found then raise exception 'Usuário não encontrado.' using errcode = 'P0002'; end if;
  -- Bloqueio também encerra as sessões ativas no Auth
  if p_status = 'blocked' then
    delete from auth.sessions where user_id = p_user;
  end if;
  perform public.audit('user.' || case when p_status = 'blocked' then 'block' else 'unblock' end, 'profiles', p_user::text,
                       jsonb_build_object('reason', p_reason));
end $$;

create or replace function public.admin_set_user_role(p_user uuid, p_role text)
returns void language plpgsql security definer set search_path = ''
as $$
declare old_role text;
begin
  perform public.require_permission('roles.manage');
  if not exists (select 1 from public.roles where id = p_role) then raise exception 'Categoria inexistente.' using errcode = '22023'; end if;
  if p_user = auth.uid() then raise exception 'Você não pode mudar a própria categoria.' using errcode = '42501'; end if;
  select role into old_role from public.profiles where id = p_user for update;
  if old_role is null then raise exception 'Usuário não encontrado.' using errcode = 'P0002'; end if;
  update public.profiles set role = p_role where id = p_user;
  perform public.audit('user.role', 'profiles', p_user::text, jsonb_build_object('from', old_role, 'to', p_role));
end $$;

create or replace function public.admin_overview()
returns jsonb language plpgsql stable security definer set search_path = ''
as $$
declare out jsonb;
begin
  perform public.require_permission('stats.view');
  select jsonb_build_object(
    'usuarios', (select count(*) from public.profiles),
    'usuarios_bloqueados', (select count(*) from public.profiles where status = 'blocked'),
    'novos_7d', (select count(*) from public.profiles where created_at > now() - interval '7 days'),
    'ativos_7d', (select count(distinct user_id) from public.answers where answered_at > now() - interval '7 days'),
    'respostas', (select count(*) from public.answers),
    'respostas_7d', (select count(*) from public.answers where answered_at > now() - interval '7 days'),
    'taxa_acerto', (select round(100.0 * avg(case when is_correct then 1 else 0 end), 1) from public.answers),
    'questoes_publicadas', (select count(*) from public.questions where status = 'published'),
    'questoes_rascunho', (select count(*) from public.questions where status = 'draft'),
    'flashcards', (select count(*) from public.flashcards where deleted_at is null),
    'minutos_estudo_7d', (select coalesce(sum(duration_sec), 0) / 60 from public.study_sessions where started_at > now() - interval '7 days'),
    'eventos_seguranca_7d', (select count(*) from public.security_events where created_at > now() - interval '7 days'),
    'por_dia', coalesce((
      select jsonb_agg(jsonb_build_object('dia', d::date, 'respostas', (select count(*) from public.answers a where a.answered_at::date = d::date)) order by d)
        from generate_series(current_date - 13, current_date, interval '1 day') d), '[]'),
    'por_disciplina', coalesce((
      select jsonb_agg(x order by x ->> 'disciplina') from (
        select jsonb_build_object('disciplina', s.name, 'respostas', count(a.*), 'acerto', round(100.0 * avg(case when a.is_correct then 1 else 0 end), 1)) x
          from public.answers a join public.questions q on q.id = a.question_id join public.subjects s on s.id = q.subject_id
         group by s.name) t), '[]')
  ) into out;
  return out;
end $$;

-- Estatística de cada questão (para o admin revisar questões muito difíceis/fáceis)
create or replace function public.admin_question_stats()
returns table (question_id uuid, answers bigint, accuracy numeric)
language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('stats.view');
  return query select a.question_id, count(*), round(100.0 * avg(case when a.is_correct then 1 else 0 end), 1)
    from public.answers a group by a.question_id;
end $$;

-- ---------------------------------------------------------------------
-- Materiais protegidos: acesso registrado + detecção de uso suspeito
-- O app chama esta função; só depois consegue gerar um link temporário
-- (a política do Storage exige um registro de acesso recente).
-- ---------------------------------------------------------------------
create or replace function public.request_material(p_material uuid)
returns text language plpgsql security definer set search_path = ''
as $$
declare m record; recent integer;
begin
  if not public.is_active() then raise exception 'Faça login.' using errcode = '42501'; end if;
  select * into m from public.materials where id = p_material;
  if m.id is null or (m.status <> 'published' and not public.has_permission('content.manage')) then
    raise exception 'Material não encontrado.' using errcode = 'P0002';
  end if;
  if m.access = 'staff' and not public.has_permission('content.manage') then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
  perform public.check_rate('materials', 60, 3600);
  insert into public.material_access_log (material_id, user_id) values (m.id, auth.uid());
  select count(distinct material_id) into recent from public.material_access_log
   where user_id = auth.uid() and accessed_at > now() - interval '10 minutes';
  if recent >= 15 then
    insert into public.security_events (user_id, kind, details)
    values (auth.uid(), 'material.bulk_access', jsonb_build_object('materiais_em_10min', recent));
  end if;
  return m.storage_path;
end $$;

-- ---------------------------------------------------------------------
-- Criação SEGURA do primeiro administrador
-- Só pode ser executada no SQL Editor do Supabase (usuário postgres).
-- Ninguém consegue chamá-la pelo site.
-- ---------------------------------------------------------------------
create or replace function public.bootstrap_admin(p_email text, p_display_name text default 'Ryan')
returns text language plpgsql security definer set search_path = ''
as $$
declare uid uuid;
begin
  select id into uid from auth.users where lower(email) = lower(btrim(p_email));
  if uid is null then
    raise exception 'Nenhuma conta com o e-mail %. Cadastre-se primeiro pelo site e confirme o e-mail.', p_email;
  end if;
  update public.profiles set role = 'admin', status = 'active', display_name = left(btrim(p_display_name), 60) where id = uid;
  insert into public.audit_log (actor_id, action, target_table, target_id, details)
  values (null, 'admin.bootstrap', 'profiles', uid::text, jsonb_build_object('display_name', p_display_name));
  return 'Pronto: ' || p_display_name || ' agora é administrador.';
end $$;


-- >>>>>>>>>> 20261124000300_seguranca_rls.sql
-- =====================================================================
-- Educa Mais · Migração 3: permissões e segurança por linha (RLS)
-- Regra de ouro: o banco decide quem vê o quê. A interface só esconde botões.
-- =====================================================================

-- 1) Começa do zero: ninguém do site (anon/authenticated) tem acesso a nada.
revoke all on all tables in schema public from anon, authenticated;
revoke all on all sequences in schema public from anon, authenticated;
revoke execute on all functions in schema public from public, anon, authenticated;
alter default privileges in schema public revoke all on tables from anon, authenticated;
alter default privileges in schema public revoke execute on functions from public, anon, authenticated;

-- 2) Liga RLS em todas as tabelas
do $$
declare t record;
begin
  for t in select tablename from pg_tables where schemaname = 'public' loop
    execute format('alter table public.%I enable row level security', t.tablename);
  end loop;
end $$;

-- 3) Funções que o site pode chamar
grant execute on function
  public.is_active(), public.has_permission(text), public.is_admin(), public.sem_acento(text),
  public.my_profile(), public.export_my_data(), public.reset_my_study_data(), public.delete_my_account(),
  public.admin_list_users(text, integer, integer), public.admin_set_user_status(uuid, text, text),
  public.admin_set_user_role(uuid, text), public.admin_overview(), public.admin_question_stats(),
  public.request_material(uuid)
to authenticated;
grant execute on function public.sem_acento(text), public.is_active(), public.has_permission(text) to anon;
-- Funções internas usadas por gatilhos/políticas também precisam de EXECUTE para o papel que dispara
grant execute on function public.check_rate(text, integer, integer), public.audit(text, text, text, jsonb),
  public.require_permission(text), public.validate_question(uuid) to authenticated;
-- bootstrap_admin NÃO recebe grant: só o usuário postgres (SQL Editor) executa.
revoke execute on function public.bootstrap_admin(text, text) from public, anon, authenticated;

-- Atalhos usados nas políticas (avaliados uma vez por consulta)
-- dono ativo:   user_id = (select auth.uid()) and (select public.is_active())

-- ---------------------------------------------------------------------
-- roles
-- ---------------------------------------------------------------------
grant select on public.roles to authenticated;
grant insert, update, delete on public.roles to authenticated;
create policy roles_read on public.roles for select to authenticated using ((select public.is_active()));
create policy roles_write on public.roles for all to authenticated
  using ((select public.has_permission('roles.manage'))) with check ((select public.has_permission('roles.manage')));

-- ---------------------------------------------------------------------
-- profiles: cada um vê o seu; admin vê todos. Papel/situação só por funções do admin.
-- ---------------------------------------------------------------------
grant select on public.profiles to authenticated;
grant update (display_name, study_profile, school_year, last_seen_at) on public.profiles to authenticated;
create policy profiles_self_read on public.profiles for select to authenticated
  using (id = (select auth.uid()) or (select public.has_permission('users.view')));
create policy profiles_self_update on public.profiles for update to authenticated
  using (id = (select auth.uid()) and (select public.is_active()))
  with check (id = (select auth.uid()));

-- ---------------------------------------------------------------------
-- user_settings: só o dono
-- ---------------------------------------------------------------------
grant select, insert, update on public.user_settings to authenticated;
create policy settings_own on public.user_settings for all to authenticated
  using (user_id = (select auth.uid()) and (select public.is_active()))
  with check (user_id = (select auth.uid()) and (select public.is_active()));

-- ---------------------------------------------------------------------
-- Catálogo e questões: leitura para quem está logado e ativo; escrita para content.manage
-- ---------------------------------------------------------------------
do $$
declare t text;
begin
  foreach t in array array['areas', 'subjects', 'topics', 'exam_boards'] loop
    execute format('grant select, insert, update, delete on public.%I to authenticated', t);
    execute format('create policy %1$s_read on public.%1$I for select to authenticated using ((select public.is_active()))', t);
    execute format('create policy %1$s_write on public.%1$I for insert to authenticated with check ((select public.has_permission(''content.manage'')))', t);
    execute format('create policy %1$s_update on public.%1$I for update to authenticated using ((select public.has_permission(''content.manage''))) with check ((select public.has_permission(''content.manage'')))', t);
    execute format('create policy %1$s_delete on public.%1$I for delete to authenticated using ((select public.has_permission(''content.manage'')))', t);
  end loop;
end $$;
grant usage on all sequences in schema public to authenticated;

grant select, insert, update, delete on public.questions to authenticated;
create policy questions_read on public.questions for select to authenticated
  using (((select public.is_active()) and status = 'published') or (select public.has_permission('content.manage')));
create policy questions_insert on public.questions for insert to authenticated
  with check ((select public.has_permission('content.manage')));
create policy questions_update on public.questions for update to authenticated
  using ((select public.has_permission('content.manage'))) with check ((select public.has_permission('content.manage')));
create policy questions_delete on public.questions for delete to authenticated
  using ((select public.has_permission('content.manage')));

grant select, insert, update, delete on public.question_options to authenticated;
create policy options_read on public.question_options for select to authenticated
  using (exists (select 1 from public.questions q where q.id = question_id
                  and ((q.status = 'published' and (select public.is_active())) or (select public.has_permission('content.manage')))));
create policy options_write on public.question_options for insert to authenticated with check ((select public.has_permission('content.manage')));
create policy options_update on public.question_options for update to authenticated
  using ((select public.has_permission('content.manage'))) with check ((select public.has_permission('content.manage')));
create policy options_delete on public.question_options for delete to authenticated using ((select public.has_permission('content.manage')));

-- Comentários: todos (ativos) leem os visíveis; autor lê os seus; staff modera
grant select, insert, delete on public.question_comments to authenticated;
grant update (status) on public.question_comments to authenticated;
create policy comments_read on public.question_comments for select to authenticated
  using (((select public.is_active()) and (status = 'visible' or user_id = (select auth.uid()))) or (select public.has_permission('content.manage')));
create policy comments_insert on public.question_comments for insert to authenticated
  with check (user_id = (select auth.uid()) and (select public.is_active())
              and coalesce((select (value)::boolean from public.app_settings where key = 'comentarios_ativos'), true));
create policy comments_moderate on public.question_comments for update to authenticated
  using ((select public.has_permission('content.manage'))) with check ((select public.has_permission('content.manage')));
create policy comments_delete on public.question_comments for delete to authenticated
  using (user_id = (select auth.uid()) or (select public.has_permission('content.manage')));

-- ---------------------------------------------------------------------
-- Dados pessoais de estudo: SOMENTE o dono (e só se a conta estiver ativa)
-- Histórico (respostas, revisões, sessões) não pode ser editado, só incluído.
-- ---------------------------------------------------------------------
do $$
declare t text;
begin
  -- tabelas editáveis (sincronizadas com "última edição vence")
  foreach t in array array['exam_attempts', 'favorites', 'decks', 'flashcards', 'notes', 'plan_tasks', 'goals'] loop
    execute format('grant select, insert, update, delete on public.%I to authenticated', t);
    execute format('create policy %1$s_own on public.%1$I for all to authenticated
                    using (user_id = (select auth.uid()) and (select public.is_active()))
                    with check (user_id = (select auth.uid()) and (select public.is_active()))', t);
  end loop;
  -- tabelas de histórico (somente inclusão e leitura)
  foreach t in array array['answers', 'flashcard_reviews', 'study_sessions'] loop
    execute format('grant select, insert on public.%I to authenticated', t);
    execute format('create policy %1$s_read on public.%1$I for select to authenticated
                    using (user_id = (select auth.uid()) and (select public.is_active()))', t);
    execute format('create policy %1$s_insert on public.%1$I for insert to authenticated
                    with check (user_id = (select auth.uid()) and (select public.is_active()))', t);
  end loop;
end $$;

-- Histórico de acessos: o dono vê e encerra os seus
grant select, insert, update (last_seen_at, ended_at) on public.login_sessions to authenticated;
create policy login_sessions_own on public.login_sessions for all to authenticated
  using (user_id = (select auth.uid()))
  with check (user_id = (select auth.uid()));

-- ---------------------------------------------------------------------
-- Materiais
-- ---------------------------------------------------------------------
grant select, insert, update, delete on public.materials to authenticated;
create policy materials_read on public.materials for select to authenticated
  using (((select public.is_active()) and status = 'published' and access = 'authenticated') or (select public.has_permission('content.manage')));
create policy materials_insert on public.materials for insert to authenticated with check ((select public.has_permission('content.manage')));
create policy materials_update on public.materials for update to authenticated
  using ((select public.has_permission('content.manage'))) with check ((select public.has_permission('content.manage')));
create policy materials_delete on public.materials for delete to authenticated using ((select public.has_permission('content.manage')));

grant select on public.material_access_log to authenticated;
create policy material_log_read on public.material_access_log for select to authenticated
  using (user_id = (select auth.uid()) or (select public.has_permission('audit.view')));

-- ---------------------------------------------------------------------
-- Administração
-- ---------------------------------------------------------------------
grant select on public.app_settings to anon, authenticated;
grant insert, update, delete on public.app_settings to authenticated;
create policy settings_public_read on public.app_settings for select to anon, authenticated
  using (is_public or (select public.has_permission('settings.manage')));
create policy settings_write on public.app_settings for insert to authenticated with check ((select public.has_permission('settings.manage')));
create policy settings_update on public.app_settings for update to authenticated
  using ((select public.has_permission('settings.manage'))) with check ((select public.has_permission('settings.manage')));
create policy settings_delete on public.app_settings for delete to authenticated using ((select public.has_permission('settings.manage')));

-- Auditoria e eventos de segurança: somente leitura para quem tem audit.view
grant select on public.audit_log, public.security_events to authenticated;
create policy audit_read on public.audit_log for select to authenticated using ((select public.has_permission('audit.view')));
create policy security_events_read on public.security_events for select to authenticated using ((select public.has_permission('audit.view')));

-- rate_counters: sem acesso pelo site (só funções internas)

-- updated_by automático nas configurações globais
create or replace function public.set_updated_by()
returns trigger language plpgsql set search_path = ''
as $$ begin new.updated_by := auth.uid(); return new; end $$;
create trigger set_updated_by before insert or update on public.app_settings for each row execute function public.set_updated_by();


-- >>>>>>>>>> 20261124000400_armazenamento.sql
-- =====================================================================
-- Educa Mais · Migração 4: armazenamento de arquivos (Supabase Storage)
--   question-images : imagens das questões (privado; só logados leem)
--   materials       : materiais protegidos (PDFs). Para baixar é preciso
--                     chamar request_material() antes: o acesso fica
--                     registrado e o link gerado expira em 60 segundos.
-- =====================================================================

insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types) values
  ('question-images', 'question-images', false, 2097152, array['image/png', 'image/jpeg', 'image/webp', 'image/gif']),
  ('materials', 'materials', false, 52428800, array['application/pdf', 'image/png', 'image/jpeg', 'audio/mpeg', 'video/mp4'])
on conflict (id) do nothing;

create policy "imagens: leitura para logados ativos" on storage.objects for select to authenticated
  using (bucket_id = 'question-images' and (select public.is_active()));
create policy "imagens: envio pela equipe" on storage.objects for insert to authenticated
  with check (bucket_id = 'question-images' and (select public.has_permission('content.manage')));
create policy "imagens: edição pela equipe" on storage.objects for update to authenticated
  using (bucket_id = 'question-images' and (select public.has_permission('content.manage')));
create policy "imagens: exclusão pela equipe" on storage.objects for delete to authenticated
  using (bucket_id = 'question-images' and (select public.has_permission('content.manage')));

create policy "materiais: leitura com acesso registrado" on storage.objects for select to authenticated
  using (
    bucket_id = 'materials' and (
      (select public.has_permission('content.manage'))
      or exists (
        select 1 from public.material_access_log l join public.materials m on m.id = l.material_id
         where m.storage_path = storage.objects.name and l.user_id = (select auth.uid())
           and l.accessed_at > now() - interval '2 minutes')
    )
  );
create policy "materiais: envio pela equipe" on storage.objects for insert to authenticated
  with check (bucket_id = 'materials' and (select public.has_permission('content.manage')));
create policy "materiais: edição pela equipe" on storage.objects for update to authenticated
  using (bucket_id = 'materials' and (select public.has_permission('content.manage')));
create policy "materiais: exclusão pela equipe" on storage.objects for delete to authenticated
  using (bucket_id = 'materials' and (select public.has_permission('content.manage')));


-- >>>>>>>>>> 20261124000500_conteudo_inicial.sql
-- Gerado por scripts/gerar-conteudo.mjs. Não edite à mão: edite conteudo/*.json e rode o script.
-- Conteúdo inicial: áreas, disciplinas, conteúdos, bancas e questões autorais.
insert into public.areas (id, name, position) overriding system value values
  (1, 'Linguagens', 1),
  (2, 'Matemática e Raciocínio', 2),
  (3, 'Ciências da Natureza', 3),
  (4, 'Ciências Humanas', 4),
  (5, 'Conhecimentos para concursos', 5)
on conflict (id) do nothing;
insert into public.subjects (id, area_id, name, color, position) overriding system value values
  (1, 1, 'Português', '#2340b8', 0),
  (2, 1, 'Inglês', '#0e7c86', 1),
  (3, 2, 'Matemática', '#b7791f', 2),
  (4, 2, 'Raciocínio lógico', '#7b3fb8', 3),
  (5, 3, 'Biologia', '#1f8a4c', 4),
  (6, 3, 'Física', '#c2362f', 5),
  (7, 3, 'Química', '#b8407b', 6),
  (8, 4, 'História', '#8a5a1f', 7),
  (9, 4, 'Geografia', '#2f7d4f', 8),
  (10, 5, 'Direito', '#3b4a6b', 9)
on conflict (id) do nothing;
insert into public.topics (id, subject_id, parent_id, name) overriding system value values
  (1, 3, null, 'Álgebra'),
  (2, 3, 1, 'Equações do 1º grau'),
  (3, 3, null, 'Geometria'),
  (4, 3, 3, 'Polígonos'),
  (5, 3, null, 'Matemática financeira'),
  (6, 3, 5, 'Juros simples'),
  (7, 3, 5, 'Porcentagem'),
  (8, 3, null, 'Aritmética'),
  (9, 3, 8, 'Frações'),
  (10, 1, null, 'Gramática'),
  (11, 1, 10, 'Crase'),
  (12, 1, 10, 'Concordância verbal'),
  (13, 1, null, 'Redação'),
  (14, 1, 13, 'Proposta de intervenção'),
  (15, 1, null, 'Sintaxe'),
  (16, 1, 15, 'Sujeito'),
  (17, 5, null, 'Botânica'),
  (18, 5, 17, 'Fotossíntese'),
  (19, 5, null, 'Citologia'),
  (20, 5, 19, 'Organelas'),
  (21, 6, null, 'Dinâmica'),
  (22, 6, 21, 'Leis de Newton'),
  (23, 6, null, 'Cinemática'),
  (24, 6, 23, 'Velocidade média'),
  (25, 7, null, 'Físico-química'),
  (26, 7, 25, 'pH e acidez'),
  (27, 7, null, 'Química geral'),
  (28, 7, 27, 'Fórmulas químicas'),
  (29, 8, null, 'Brasil Império'),
  (30, 8, 29, 'Independência'),
  (31, 8, null, 'Brasil República'),
  (32, 8, 31, 'Proclamação da República'),
  (33, 9, null, 'Cartografia'),
  (34, 9, 33, 'Coordenadas geográficas'),
  (35, 9, null, 'Biomas brasileiros'),
  (36, 10, null, 'Direito Administrativo'),
  (37, 10, 36, 'Princípios da administração pública'),
  (38, 10, null, 'Direito Constitucional'),
  (39, 10, 38, 'Princípios fundamentais'),
  (40, 4, null, 'Sequências'),
  (41, 4, null, 'Lógica proposicional'),
  (42, 4, 41, 'Negação'),
  (43, 2, null, 'Vocabulário'),
  (44, 2, 43, 'Falsos cognatos'),
  (45, 2, null, 'Gramática da língua inglesa'),
  (46, 2, 45, 'Presente simples')
on conflict (id) do nothing;
insert into public.exam_boards (id, name, kind) overriding system value values
  (1, 'Autoral Educa Mais', 'autoral'),
  (2, 'INEP (ENEM)', 'instituicao'),
  (3, 'Cebraspe', 'banca'),
  (4, 'FGV', 'banca'),
  (5, 'FUVEST', 'instituicao'),
  (6, 'Vunesp', 'banca')
on conflict (id) do nothing;
select setval(pg_get_serial_sequence('public.areas', 'id'), greatest((select max(id) from public.areas), 1000));
select setval(pg_get_serial_sequence('public.subjects', 'id'), greatest((select max(id) from public.subjects), 1000));
select setval(pg_get_serial_sequence('public.topics', 'id'), greatest((select max(id) from public.topics), 1000));
select setval(pg_get_serial_sequence('public.exam_boards', 'id'), greatest((select max(id) from public.exam_boards), 1000));
insert into public.questions (id, code, subject_id, topic_id, level, difficulty, board_id, year, qtype, statement, explanation, hint, source, status) values
  ('e0000000-0000-4000-a000-000000000001', 'EM-0001', 3, 2, 'fundamental', 1, 1, 2026, 'multiple_choice', 'Qual é o valor de x na equação 2x + 6 = 20?', '2x = 20 − 6 = 14, então x = 14 ÷ 2 = 7.', 'Primeiro passe o 6 para o outro lado, trocando o sinal.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000002', 'EM-0002', 3, 4, 'medio', 2, 1, 2026, 'multiple_choice', 'Qual é a soma dos ângulos internos de um hexágono?', 'S = (n − 2) × 180° = (6 − 2) × 180° = 720°.', 'Use S = (n − 2) × 180°, onde n é o número de lados.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000003', 'EM-0003', 3, 6, 'concurso', 2, 1, 2026, 'multiple_choice', 'Um capital de R$ 1.000,00 aplicado a juros simples de 2% ao mês rende quanto em 6 meses?', 'Juros simples: J = C · i · t = 1.000 × 0,02 × 6 = R$ 120,00.', 'Nos juros simples, os juros de cada mês são sempre iguais.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000004', 'EM-0004', 1, 11, 'medio', 2, 1, 2026, 'multiple_choice', 'Em qual alternativa a crase está empregada corretamente?', '"Ir a" + "a praia" = "à praia". Não há crase antes de palavra masculina (pé), pronome pessoal (ela) ou verbo (chover).', 'Troque a palavra feminina por uma masculina: se virar "ao", tem crase.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000005', 'EM-0005', 1, 14, 'enem', 2, 1, 2026, 'multiple_choice', 'Na redação do ENEM, a proposta de intervenção deve aparecer principalmente:', 'A proposta de intervenção, com agente, ação, meio, finalidade e detalhamento, costuma fechar o texto na conclusão.', 'É a parte em que você propõe uma solução para o problema discutido.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000006', 'EM-0006', 5, 18, 'fundamental', 1, 1, 2026, 'multiple_choice', 'Qual gás as plantas absorvem do ar para fazer a fotossíntese?', 'Na fotossíntese, as plantas usam gás carbônico, água e luz para produzir glicose, liberando oxigênio.', 'É o mesmo gás que nós liberamos ao respirar.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000007', 'EM-0007', 6, 22, 'enem', 2, 1, 2026, 'multiple_choice', 'Um corpo de 2 kg recebe uma força resultante de 10 N. Qual é sua aceleração?', 'Segunda lei de Newton: F = m · a, então a = 10 ÷ 2 = 5 m/s².', 'Use a segunda lei de Newton e isole a aceleração.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000008', 'EM-0008', 8, 30, 'fundamental', 1, 1, 2026, 'multiple_choice', 'Em que ano o Brasil declarou sua independência de Portugal?', 'A Independência foi proclamada em 7 de setembro de 1822, por D. Pedro I.', 'Foi às margens do rio Ipiranga, no começo do século XIX.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000009', 'EM-0009', 9, 34, 'medio', 1, 1, 2026, 'multiple_choice', 'Qual linha imaginária divide a Terra em hemisférios Norte e Sul?', 'A Linha do Equador (latitude 0°) separa os hemisférios Norte e Sul. Greenwich separa Leste e Oeste.', 'É a linha de latitude 0°.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-00000000000a', 'EM-0010', 7, 26, 'medio', 2, 1, 2026, 'multiple_choice', 'Uma solução com pH igual a 3 é:', 'Na escala de pH a 25 °C, abaixo de 7 é ácido, 7 é neutro e acima de 7 é básico.', 'O ponto neutro da escala é 7.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-00000000000b', 'EM-0011', 10, 37, 'concurso', 2, 1, 2026, 'multiple_choice', 'Os princípios da administração pública no caput do art. 37 da CF/88 são:', 'O caput do art. 37 traz cinco princípios, lembrados pela sigla LIMPE: Legalidade, Impessoalidade, Moralidade, Publicidade e Eficiência.', 'Existe uma sigla famosa de cinco letras para lembrar.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-00000000000c', 'EM-0012', 4, 40, 'concurso', 2, 1, 2026, 'multiple_choice', 'Qual é o próximo número da sequência 2, 6, 18, 54, …?', 'Cada termo é o anterior multiplicado por 3: 54 × 3 = 162.', 'Veja o que acontece de um número para o seguinte: soma ou multiplicação?', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-00000000000d', 'EM-0013', 2, 44, 'enem', 2, 1, 2026, 'multiple_choice', 'A palavra "actually", em inglês, significa:', '"Actually" é um falso cognato: quer dizer "na verdade". "Atualmente" é "currently" ou "nowadays".', 'Cuidado: é um falso cognato.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-00000000000e', 'EM-0014', 3, 9, 'fundamental', 1, 1, 2026, 'multiple_choice', 'Quanto é 3/4 de 80?', '80 ÷ 4 = 20, e 20 × 3 = 60.', 'Divida 80 em 4 partes iguais primeiro.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-00000000000f', 'EM-0015', 3, 7, 'enem', 1, 1, 2026, 'multiple_choice', 'Um produto de R$ 200,00 recebe 15% de desconto. Qual é o novo preço?', '15% de 200 = 30. Então 200 − 30 = R$ 170,00.', 'Calcule quanto valem 10% e depois 5% de 200.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000010', 'EM-0016', 6, 24, 'medio', 1, 1, 2026, 'multiple_choice', 'Um ônibus percorre 120 km em 2 horas. Qual é a sua velocidade média?', 'Velocidade média = distância ÷ tempo = 120 km ÷ 2 h = 60 km/h.', 'Lembre: velocidade = distância dividida pelo tempo.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000011', 'EM-0017', 1, 16, 'fundamental', 1, 1, 2026, 'multiple_choice', 'Na frase "Os alunos estudaram muito para a prova", qual é o sujeito?', 'Quem pratica a ação de estudar são "os alunos". É um sujeito simples, com um só núcleo.', 'Pergunte ao verbo: quem estudou?', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000012', 'EM-0018', 1, 12, 'concurso', 3, 1, 2026, 'multiple_choice', 'Assinale a frase escrita de acordo com a norma-padrão.', 'O verbo "fazer" indicando tempo decorrido é impessoal e fica no singular. O mesmo vale para "haver" no sentido de existir: "Houve muitos candidatos".', 'Quando um verbo indica tempo passado, ele concorda com alguém?', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000013', 'EM-0019', 5, 20, 'medio', 2, 1, 2026, 'multiple_choice', 'Qual organela é responsável pela respiração celular?', 'Na mitocôndria ocorre a respiração celular, que produz a maior parte do ATP da célula.', 'Pense em qual organela é chamada de “usina de energia” da célula.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000014', 'EM-0020', 8, 32, 'enem', 1, 1, 2026, 'multiple_choice', 'Em que ano foi proclamada a República no Brasil?', 'A República foi proclamada em 15 de novembro de 1889. 1822 é a Independência e 1888, a Lei Áurea.', 'Uma dessas datas é a Independência e outra a abolição da escravidão.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000015', 'EM-0021', 9, 35, 'fundamental', 1, 1, 2026, 'multiple_choice', 'Qual é o maior bioma brasileiro em extensão?', 'A Amazônia ocupa cerca de metade do território brasileiro.', 'Esse bioma cobre boa parte da região Norte.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000016', 'EM-0022', 10, 39, 'concurso', 3, 1, 2026, 'multiple_choice', 'Segundo o art. 1º da Constituição Federal de 1988, NÃO é fundamento da República:', 'Garantir o desenvolvimento nacional é um OBJETIVO fundamental (art. 3º), não um fundamento (art. 1º).', 'Compare o art. 1º (fundamentos) com o art. 3º (objetivos).', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000017', 'EM-0023', 4, 42, 'concurso', 3, 1, 2026, 'multiple_choice', 'Qual é a negação de "Todos os candidatos estudaram"?', 'Para negar "todos", basta existir pelo menos um que não cumpre a condição: "Algum candidato não estudou".', 'Para negar “todos”, basta encontrar uma exceção.', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000018', 'EM-0024', 2, 46, 'medio', 1, 1, 2026, 'multiple_choice', 'Complete: "She ___ to school every day."', 'No presente simples, a 3ª pessoa do singular (she) recebe -es em "go": "goes".', 'She é terceira pessoa do singular. O que muda no verbo?', 'Questão autoral escrita para a Educa Mais (2026).', 'published'),
  ('e0000000-0000-4000-a000-000000000019', 'EM-0025', 7, 28, 'enem', 1, 1, 2026, 'multiple_choice', 'Qual é a fórmula química da água?', 'A molécula de água tem dois átomos de hidrogênio e um de oxigênio: H₂O.', 'Dois hidrogênios e um oxigênio.', 'Questão autoral escrita para a Educa Mais (2026).', 'published')
on conflict (id) do nothing;
insert into public.question_options (id, question_id, position, body, is_correct) values
  ('e0000000-0000-4000-b000-00000000000a', 'e0000000-0000-4000-a000-000000000001', 0, '5', false),
  ('e0000000-0000-4000-b000-00000000000b', 'e0000000-0000-4000-a000-000000000001', 1, '7', true),
  ('e0000000-0000-4000-b000-00000000000c', 'e0000000-0000-4000-a000-000000000001', 2, '13', false),
  ('e0000000-0000-4000-b000-00000000000d', 'e0000000-0000-4000-a000-000000000001', 3, '8', false),
  ('e0000000-0000-4000-b000-000000000014', 'e0000000-0000-4000-a000-000000000002', 0, '360°', false),
  ('e0000000-0000-4000-b000-000000000015', 'e0000000-0000-4000-a000-000000000002', 1, '540°', false),
  ('e0000000-0000-4000-b000-000000000016', 'e0000000-0000-4000-a000-000000000002', 2, '720°', true),
  ('e0000000-0000-4000-b000-000000000017', 'e0000000-0000-4000-a000-000000000002', 3, '900°', false),
  ('e0000000-0000-4000-b000-00000000001e', 'e0000000-0000-4000-a000-000000000003', 0, 'R$ 60,00', false),
  ('e0000000-0000-4000-b000-00000000001f', 'e0000000-0000-4000-a000-000000000003', 1, 'R$ 120,00', true),
  ('e0000000-0000-4000-b000-000000000020', 'e0000000-0000-4000-a000-000000000003', 2, 'R$ 126,16', false),
  ('e0000000-0000-4000-b000-000000000021', 'e0000000-0000-4000-a000-000000000003', 3, 'R$ 200,00', false),
  ('e0000000-0000-4000-b000-000000000028', 'e0000000-0000-4000-a000-000000000004', 0, 'Vou à pé.', false),
  ('e0000000-0000-4000-b000-000000000029', 'e0000000-0000-4000-a000-000000000004', 1, 'Entreguei o livro à ela.', false),
  ('e0000000-0000-4000-b000-00000000002a', 'e0000000-0000-4000-a000-000000000004', 2, 'Fomos à praia ontem.', true),
  ('e0000000-0000-4000-b000-00000000002b', 'e0000000-0000-4000-a000-000000000004', 3, 'Começou à chover.', false),
  ('e0000000-0000-4000-b000-000000000032', 'e0000000-0000-4000-a000-000000000005', 0, 'no título', false),
  ('e0000000-0000-4000-b000-000000000033', 'e0000000-0000-4000-a000-000000000005', 1, 'na introdução', false),
  ('e0000000-0000-4000-b000-000000000034', 'e0000000-0000-4000-a000-000000000005', 2, 'na conclusão', true),
  ('e0000000-0000-4000-b000-000000000035', 'e0000000-0000-4000-a000-000000000005', 3, 'em nenhuma parte', false),
  ('e0000000-0000-4000-b000-00000000003c', 'e0000000-0000-4000-a000-000000000006', 0, 'Oxigênio', false),
  ('e0000000-0000-4000-b000-00000000003d', 'e0000000-0000-4000-a000-000000000006', 1, 'Gás carbônico', true),
  ('e0000000-0000-4000-b000-00000000003e', 'e0000000-0000-4000-a000-000000000006', 2, 'Nitrogênio', false),
  ('e0000000-0000-4000-b000-00000000003f', 'e0000000-0000-4000-a000-000000000006', 3, 'Hélio', false),
  ('e0000000-0000-4000-b000-000000000046', 'e0000000-0000-4000-a000-000000000007', 0, '0,2 m/s²', false),
  ('e0000000-0000-4000-b000-000000000047', 'e0000000-0000-4000-a000-000000000007', 1, '5 m/s²', true),
  ('e0000000-0000-4000-b000-000000000048', 'e0000000-0000-4000-a000-000000000007', 2, '12 m/s²', false),
  ('e0000000-0000-4000-b000-000000000049', 'e0000000-0000-4000-a000-000000000007', 3, '20 m/s²', false),
  ('e0000000-0000-4000-b000-000000000050', 'e0000000-0000-4000-a000-000000000008', 0, '1500', false),
  ('e0000000-0000-4000-b000-000000000051', 'e0000000-0000-4000-a000-000000000008', 1, '1808', false),
  ('e0000000-0000-4000-b000-000000000052', 'e0000000-0000-4000-a000-000000000008', 2, '1822', true),
  ('e0000000-0000-4000-b000-000000000053', 'e0000000-0000-4000-a000-000000000008', 3, '1889', false),
  ('e0000000-0000-4000-b000-00000000005a', 'e0000000-0000-4000-a000-000000000009', 0, 'Meridiano de Greenwich', false),
  ('e0000000-0000-4000-b000-00000000005b', 'e0000000-0000-4000-a000-000000000009', 1, 'Linha do Equador', true),
  ('e0000000-0000-4000-b000-00000000005c', 'e0000000-0000-4000-a000-000000000009', 2, 'Trópico de Capricórnio', false),
  ('e0000000-0000-4000-b000-00000000005d', 'e0000000-0000-4000-a000-000000000009', 3, 'Círculo Polar Ártico', false),
  ('e0000000-0000-4000-b000-000000000064', 'e0000000-0000-4000-a000-00000000000a', 0, 'ácida', true),
  ('e0000000-0000-4000-b000-000000000065', 'e0000000-0000-4000-a000-00000000000a', 1, 'neutra', false),
  ('e0000000-0000-4000-b000-000000000066', 'e0000000-0000-4000-a000-00000000000a', 2, 'básica', false),
  ('e0000000-0000-4000-b000-000000000067', 'e0000000-0000-4000-a000-00000000000a', 3, 'impossível', false),
  ('e0000000-0000-4000-b000-00000000006e', 'e0000000-0000-4000-a000-00000000000b', 0, 'legalidade, impessoalidade, moralidade, publicidade e eficiência', true),
  ('e0000000-0000-4000-b000-00000000006f', 'e0000000-0000-4000-a000-00000000000b', 1, 'legalidade, celeridade, moralidade, publicidade e economia', false),
  ('e0000000-0000-4000-b000-000000000070', 'e0000000-0000-4000-a000-00000000000b', 2, 'soberania, cidadania, moralidade, publicidade e eficiência', false),
  ('e0000000-0000-4000-b000-000000000071', 'e0000000-0000-4000-a000-00000000000b', 3, 'legalidade, impessoalidade, proporcionalidade, publicidade e eficiência', false),
  ('e0000000-0000-4000-b000-000000000078', 'e0000000-0000-4000-a000-00000000000c', 0, '108', false),
  ('e0000000-0000-4000-b000-000000000079', 'e0000000-0000-4000-a000-00000000000c', 1, '72', false),
  ('e0000000-0000-4000-b000-00000000007a', 'e0000000-0000-4000-a000-00000000000c', 2, '162', true),
  ('e0000000-0000-4000-b000-00000000007b', 'e0000000-0000-4000-a000-00000000000c', 3, '216', false),
  ('e0000000-0000-4000-b000-000000000082', 'e0000000-0000-4000-a000-00000000000d', 0, 'atualmente', false),
  ('e0000000-0000-4000-b000-000000000083', 'e0000000-0000-4000-a000-00000000000d', 1, 'na verdade', true),
  ('e0000000-0000-4000-b000-000000000084', 'e0000000-0000-4000-a000-00000000000d', 2, 'ativamente', false),
  ('e0000000-0000-4000-b000-000000000085', 'e0000000-0000-4000-a000-00000000000d', 3, 'exatamente', false),
  ('e0000000-0000-4000-b000-00000000008c', 'e0000000-0000-4000-a000-00000000000e', 0, '40', false),
  ('e0000000-0000-4000-b000-00000000008d', 'e0000000-0000-4000-a000-00000000000e', 1, '60', true),
  ('e0000000-0000-4000-b000-00000000008e', 'e0000000-0000-4000-a000-00000000000e', 2, '64', false),
  ('e0000000-0000-4000-b000-00000000008f', 'e0000000-0000-4000-a000-00000000000e', 3, '75', false),
  ('e0000000-0000-4000-b000-000000000096', 'e0000000-0000-4000-a000-00000000000f', 0, 'R$ 185,00', false),
  ('e0000000-0000-4000-b000-000000000097', 'e0000000-0000-4000-a000-00000000000f', 1, 'R$ 175,00', false),
  ('e0000000-0000-4000-b000-000000000098', 'e0000000-0000-4000-a000-00000000000f', 2, 'R$ 170,00', true),
  ('e0000000-0000-4000-b000-000000000099', 'e0000000-0000-4000-a000-00000000000f', 3, 'R$ 150,00', false),
  ('e0000000-0000-4000-b000-0000000000a0', 'e0000000-0000-4000-a000-000000000010', 0, '50 km/h', false),
  ('e0000000-0000-4000-b000-0000000000a1', 'e0000000-0000-4000-a000-000000000010', 1, '60 km/h', true),
  ('e0000000-0000-4000-b000-0000000000a2', 'e0000000-0000-4000-a000-000000000010', 2, '80 km/h', false),
  ('e0000000-0000-4000-b000-0000000000a3', 'e0000000-0000-4000-a000-000000000010', 3, '240 km/h', false),
  ('e0000000-0000-4000-b000-0000000000aa', 'e0000000-0000-4000-a000-000000000011', 0, 'muito', false),
  ('e0000000-0000-4000-b000-0000000000ab', 'e0000000-0000-4000-a000-000000000011', 1, 'para a prova', false),
  ('e0000000-0000-4000-b000-0000000000ac', 'e0000000-0000-4000-a000-000000000011', 2, 'Os alunos', true),
  ('e0000000-0000-4000-b000-0000000000ad', 'e0000000-0000-4000-a000-000000000011', 3, 'estudaram', false),
  ('e0000000-0000-4000-b000-0000000000b4', 'e0000000-0000-4000-a000-000000000012', 0, 'Fazem dois anos que estudo.', false),
  ('e0000000-0000-4000-b000-0000000000b5', 'e0000000-0000-4000-a000-000000000012', 1, 'Faz dois anos que estudo.', true),
  ('e0000000-0000-4000-b000-0000000000b6', 'e0000000-0000-4000-a000-000000000012', 2, 'Houveram muitos candidatos.', false),
  ('e0000000-0000-4000-b000-0000000000b7', 'e0000000-0000-4000-a000-000000000012', 3, 'Haviam muitos candidatos.', false),
  ('e0000000-0000-4000-b000-0000000000be', 'e0000000-0000-4000-a000-000000000013', 0, 'Ribossomo', false),
  ('e0000000-0000-4000-b000-0000000000bf', 'e0000000-0000-4000-a000-000000000013', 1, 'Mitocôndria', true),
  ('e0000000-0000-4000-b000-0000000000c0', 'e0000000-0000-4000-a000-000000000013', 2, 'Complexo de Golgi', false),
  ('e0000000-0000-4000-b000-0000000000c1', 'e0000000-0000-4000-a000-000000000013', 3, 'Lisossomo', false),
  ('e0000000-0000-4000-b000-0000000000c8', 'e0000000-0000-4000-a000-000000000014', 0, '1822', false),
  ('e0000000-0000-4000-b000-0000000000c9', 'e0000000-0000-4000-a000-000000000014', 1, '1888', false),
  ('e0000000-0000-4000-b000-0000000000ca', 'e0000000-0000-4000-a000-000000000014', 2, '1889', true),
  ('e0000000-0000-4000-b000-0000000000cb', 'e0000000-0000-4000-a000-000000000014', 3, '1930', false),
  ('e0000000-0000-4000-b000-0000000000d2', 'e0000000-0000-4000-a000-000000000015', 0, 'Cerrado', false),
  ('e0000000-0000-4000-b000-0000000000d3', 'e0000000-0000-4000-a000-000000000015', 1, 'Mata Atlântica', false),
  ('e0000000-0000-4000-b000-0000000000d4', 'e0000000-0000-4000-a000-000000000015', 2, 'Caatinga', false),
  ('e0000000-0000-4000-b000-0000000000d5', 'e0000000-0000-4000-a000-000000000015', 3, 'Amazônia', true),
  ('e0000000-0000-4000-b000-0000000000dc', 'e0000000-0000-4000-a000-000000000016', 0, 'a soberania', false),
  ('e0000000-0000-4000-b000-0000000000dd', 'e0000000-0000-4000-a000-000000000016', 1, 'a cidadania', false),
  ('e0000000-0000-4000-b000-0000000000de', 'e0000000-0000-4000-a000-000000000016', 2, 'a garantia do desenvolvimento nacional', true),
  ('e0000000-0000-4000-b000-0000000000df', 'e0000000-0000-4000-a000-000000000016', 3, 'o pluralismo político', false),
  ('e0000000-0000-4000-b000-0000000000e6', 'e0000000-0000-4000-a000-000000000017', 0, 'Nenhum candidato estudou.', false),
  ('e0000000-0000-4000-b000-0000000000e7', 'e0000000-0000-4000-a000-000000000017', 1, 'Algum candidato não estudou.', true),
  ('e0000000-0000-4000-b000-0000000000e8', 'e0000000-0000-4000-a000-000000000017', 2, 'Todos os candidatos não estudaram.', false),
  ('e0000000-0000-4000-b000-0000000000e9', 'e0000000-0000-4000-a000-000000000017', 3, 'Algum candidato estudou.', false),
  ('e0000000-0000-4000-b000-0000000000f0', 'e0000000-0000-4000-a000-000000000018', 0, 'go', false),
  ('e0000000-0000-4000-b000-0000000000f1', 'e0000000-0000-4000-a000-000000000018', 1, 'goes', true),
  ('e0000000-0000-4000-b000-0000000000f2', 'e0000000-0000-4000-a000-000000000018', 2, 'going', false),
  ('e0000000-0000-4000-b000-0000000000f3', 'e0000000-0000-4000-a000-000000000018', 3, 'gone', false),
  ('e0000000-0000-4000-b000-0000000000fa', 'e0000000-0000-4000-a000-000000000019', 0, 'CO₂', false),
  ('e0000000-0000-4000-b000-0000000000fb', 'e0000000-0000-4000-a000-000000000019', 1, 'H₂O', true),
  ('e0000000-0000-4000-b000-0000000000fc', 'e0000000-0000-4000-a000-000000000019', 2, 'O₂', false),
  ('e0000000-0000-4000-b000-0000000000fd', 'e0000000-0000-4000-a000-000000000019', 3, 'NaCl', false)
on conflict (id) do nothing;


-- >>>>>>>>>> 20261124000600_admin_questoes.sql
-- =====================================================================
-- Educa Mais · Migração 6: salvar questão + alternativas numa única transação
-- (as regras de integridade são conferidas no fim, tudo ou nada)
-- =====================================================================
create or replace function public.admin_save_question(p_question jsonb, p_options jsonb)
returns uuid language plpgsql security definer set search_path = ''
as $$
declare
  qid uuid := nullif(p_question ->> 'id', '')::uuid;
  o jsonb;
  oid uuid;
  incoming uuid[] := '{}';
  i integer := 0;
  st text := coalesce(nullif(p_question ->> 'status', ''), 'draft');
begin
  perform public.require_permission('content.manage');
  if jsonb_typeof(p_options) <> 'array' or jsonb_array_length(p_options) < 2 or jsonb_array_length(p_options) > 6 then
    raise exception 'A questão precisa ter de 2 a 6 alternativas.' using errcode = '22023';
  end if;
  if qid is null then
    insert into public.questions (code, subject_id, topic_id, level, difficulty, board_id, year, qtype, theme, statement, image_path, image_alt, explanation, hint, source, status)
    values (nullif(p_question ->> 'code', ''), (p_question ->> 'subject_id')::bigint, nullif(p_question ->> 'topic_id', '')::bigint,
            p_question ->> 'level', coalesce(nullif(p_question ->> 'difficulty', '')::smallint, 2), nullif(p_question ->> 'board_id', '')::bigint,
            nullif(p_question ->> 'year', '')::smallint, coalesce(nullif(p_question ->> 'qtype', ''), 'multiple_choice'), nullif(p_question ->> 'theme', ''),
            p_question ->> 'statement', nullif(p_question ->> 'image_path', ''), nullif(p_question ->> 'image_alt', ''), p_question ->> 'explanation',
            nullif(p_question ->> 'hint', ''), nullif(p_question ->> 'source', ''), st)
    returning id into qid;
    update public.questions set code = 'Q-' || upper(substr(replace(qid::text, '-', ''), 1, 8)) where id = qid and code is null;
  else
    update public.questions set
      code = coalesce(nullif(p_question ->> 'code', ''), code), subject_id = (p_question ->> 'subject_id')::bigint, topic_id = nullif(p_question ->> 'topic_id', '')::bigint,
      level = p_question ->> 'level', difficulty = coalesce(nullif(p_question ->> 'difficulty', '')::smallint, 2), board_id = nullif(p_question ->> 'board_id', '')::bigint,
      year = nullif(p_question ->> 'year', '')::smallint, qtype = coalesce(nullif(p_question ->> 'qtype', ''), 'multiple_choice'), theme = nullif(p_question ->> 'theme', ''),
      statement = p_question ->> 'statement', image_path = nullif(p_question ->> 'image_path', ''), image_alt = nullif(p_question ->> 'image_alt', ''),
      explanation = p_question ->> 'explanation', hint = nullif(p_question ->> 'hint', ''), source = nullif(p_question ->> 'source', ''), status = st
    where id = qid;
    if not found then raise exception 'Questão não encontrada.' using errcode = 'P0002'; end if;
  end if;

  for o in select value from jsonb_array_elements(p_options) loop
    oid := nullif(o ->> 'id', '')::uuid;
    if oid is not null then incoming := incoming || oid; end if;
  end loop;
  delete from public.question_options where question_id = qid and not (id = any (incoming));

  for o in select value from jsonb_array_elements(p_options) loop
    oid := nullif(o ->> 'id', '')::uuid;
    if oid is not null and exists (select 1 from public.question_options where id = oid and question_id = qid) then
      update public.question_options set position = i, body = o ->> 'body', is_correct = coalesce((o ->> 'is_correct')::boolean, false) where id = oid;
    else
      insert into public.question_options (question_id, position, body, is_correct) values (qid, i, o ->> 'body', coalesce((o ->> 'is_correct')::boolean, false));
    end if;
    i := i + 1;
  end loop;
  return qid;
end $$;

revoke execute on function public.admin_save_question(jsonb, jsonb) from public, anon;
grant execute on function public.admin_save_question(jsonb, jsonb) to authenticated;


-- >>>>>>>>>> 20261125000700_professores.sql
-- =====================================================================
-- Educa Mais · Migração 7: professores, bancos de questões individuais,
-- turmas, listas/simulados, versões das questões e pedidos de correção.
--
-- Regras principais (todas conferidas no banco, não no site):
--  * Professor = conta aprovada pelo administrador (pedido em teacher_requests).
--  * Cada questão tem dono (owner_id). Questão de professor nasce PRIVADA:
--    só o dono e a equipe (content.manage) veem e alteram.
--  * Aluno vê: questões públicas publicadas + questões das listas enviadas às
--    turmas em que ele está.
--  * Uma questão só entra no banco geral (public) quando o admin aprova.
--  * Toda mudança de questão/alternativas gera uma versão com autor e data.
--  * Professor só vê resultados de quem está na turma e aceitou compartilhar.
-- Nada aqui apaga dados existentes.
-- =====================================================================

create extension if not exists pg_trgm with schema extensions;

-- ---------------------------------------------------------------------
-- Papel de professor: deixa de ter acesso a todo o conteúdo
-- ---------------------------------------------------------------------
update public.roles
   set permissions = array['teacher.area'],
       description = 'Professor aprovado: banco de questões próprio, turmas e listas.'
 where id = 'teacher';

create or replace function public.is_teacher()
returns boolean language sql stable security definer set search_path = ''
as $$ select public.is_active() and public.has_permission('teacher.area') $$;

-- ---------------------------------------------------------------------
-- Questões: dono, visibilidade e último autor
-- ---------------------------------------------------------------------
alter table public.questions
  add column if not exists owner_id   uuid references public.profiles (id) on delete set null,
  add column if not exists visibility text not null default 'public'
      check (visibility in ('private', 'pending_public', 'public')),
  add column if not exists updated_by uuid references public.profiles (id) on delete set null;
create index if not exists questions_owner_idx on public.questions (owner_id, updated_at desc);
create index if not exists questions_visibility_idx on public.questions (visibility, status);
create index if not exists questions_trgm_idx on public.questions
  using gin (public.sem_acento(statement) extensions.gin_trgm_ops);

create or replace function public.set_question_authors()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  new.updated_by := coalesce(auth.uid(), new.updated_by);
  if tg_op = 'INSERT' then
    new.owner_id := coalesce(new.owner_id, new.created_by, auth.uid());
  elsif not public.has_permission('content.manage') then
    -- professor não troca o dono nem publica no banco geral sozinho
    new.owner_id := old.owner_id;
    if new.visibility = 'public' and old.visibility <> 'public' then new.visibility := old.visibility; end if;
  end if;
  return new;
end $$;
create trigger set_question_authors before insert or update on public.questions
  for each row execute function public.set_question_authors();

-- ---------------------------------------------------------------------
-- Turmas
-- ---------------------------------------------------------------------
create table public.classes (
  id          uuid primary key default gen_random_uuid(),
  owner_id    uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  name        text not null check (char_length(btrim(name)) between 2 and 80),
  description text check (char_length(description) <= 500),
  join_code   text not null unique default upper(substr(replace(gen_random_uuid()::text, '-', ''), 1, 8))
              check (join_code ~ '^[A-Z0-9]{6,12}$'),
  is_open     boolean not null default true,
  archived_at timestamptz,
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create index classes_owner_idx on public.classes (owner_id);

create table public.class_members (
  class_id       uuid not null references public.classes (id) on delete cascade,
  user_id        uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  status         text not null default 'active' check (status in ('active', 'left', 'removed')),
  share_progress boolean not null default true,
  joined_at      timestamptz not null default now(),
  updated_at     timestamptz not null default now(),
  primary key (class_id, user_id)
);
create index class_members_user_idx on public.class_members (user_id, status);

-- ---------------------------------------------------------------------
-- Listas e simulados do professor
-- ---------------------------------------------------------------------
create table public.lists (
  id             uuid primary key default gen_random_uuid(),
  owner_id       uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  title          text not null check (char_length(btrim(title)) between 2 and 120),
  description    text check (char_length(description) <= 1000),
  mode           text not null default 'lista' check (mode in ('lista', 'simulado')),
  time_limit_min smallint check (time_limit_min between 1 and 600),
  status         text not null default 'draft' check (status in ('draft', 'published', 'archived')),
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now()
);
create index lists_owner_idx on public.lists (owner_id, updated_at desc);

create table public.list_items (
  list_id     uuid not null references public.lists (id) on delete cascade,
  question_id uuid not null references public.questions (id) on delete restrict,
  position    smallint not null check (position between 0 and 299),
  primary key (list_id, question_id)
);
create index list_items_q_idx on public.list_items (question_id);

create table public.list_assignments (
  id         uuid primary key default gen_random_uuid(),
  list_id    uuid not null references public.lists (id) on delete cascade,
  class_id   uuid not null references public.classes (id) on delete cascade,
  opens_at   timestamptz not null default now(),
  due_at     timestamptz,
  created_by uuid default auth.uid() references public.profiles (id) on delete set null,
  created_at timestamptz not null default now(),
  unique (list_id, class_id),
  check (due_at is null or due_at > opens_at)
);
create index list_assignments_class_idx on public.list_assignments (class_id);

-- Tentativa do aluno = um simulado (exam_attempts) ligado ao envio da lista
alter table public.exam_attempts
  add column if not exists assignment_id uuid references public.list_assignments (id) on delete set null;
create index if not exists exam_attempts_assignment_idx on public.exam_attempts (assignment_id);

-- ---------------------------------------------------------------------
-- Pedidos: ser professor / corrigir questão
-- ---------------------------------------------------------------------
create table public.teacher_requests (
  user_id    uuid primary key default auth.uid() references public.profiles (id) on delete cascade,
  message    text check (char_length(message) <= 1000),
  subjects   text check (char_length(subjects) <= 300),
  status     text not null default 'pending' check (status in ('pending', 'approved', 'rejected')),
  note       text check (char_length(note) <= 500),
  decided_by uuid references public.profiles (id) on delete set null,
  decided_at timestamptz,
  created_at timestamptz not null default now()
);

create table public.correction_requests (
  id           uuid primary key default gen_random_uuid(),
  question_id  uuid not null references public.questions (id) on delete cascade,
  requested_by uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  message      text not null check (char_length(btrim(message)) between 5 and 2000),
  status       text not null default 'open' check (status in ('open', 'resolved', 'rejected')),
  response     text check (char_length(response) <= 2000),
  resolved_by  uuid references public.profiles (id) on delete set null,
  resolved_at  timestamptz,
  created_at   timestamptz not null default now()
);
create index correction_requests_status_idx on public.correction_requests (status, created_at desc);

-- ---------------------------------------------------------------------
-- Versões das questões (uma por transação, com autor)
-- ---------------------------------------------------------------------
create table public.question_revisions (
  id          bigint generated always as identity primary key,
  question_id uuid not null,
  version     integer not null,
  snapshot    jsonb not null,
  changed_by  uuid references public.profiles (id) on delete set null,
  changed_at  timestamptz not null default now(),
  tx          bigint not null default txid_current(),
  unique (question_id, tx),
  unique (question_id, version)
);
create index question_revisions_q_idx on public.question_revisions (question_id, version desc);

create or replace function public.snapshot_question(p_id uuid)
returns jsonb language sql stable security definer set search_path = ''
as $$
  select to_jsonb(q) - 'search' || jsonb_build_object('options',
           coalesce((select jsonb_agg(jsonb_build_object('id', o.id, 'position', o.position, 'body', o.body, 'is_correct', o.is_correct) order by o.position)
                       from public.question_options o where o.question_id = q.id), '[]'::jsonb))
    from public.questions q where q.id = p_id
$$;

create or replace function public.record_question_revision()
returns trigger language plpgsql security definer set search_path = ''
as $$
declare qid uuid; snap jsonb; v integer;
begin
  if tg_table_name = 'questions' then qid := (to_jsonb(coalesce(new, old)) ->> 'id')::uuid;
  else qid := (to_jsonb(coalesce(new, old)) ->> 'question_id')::uuid; end if;
  snap := public.snapshot_question(qid);
  if snap is null then return null; end if;   -- questão apagada
  update public.question_revisions set snapshot = snap, changed_at = now()
   where question_id = qid and tx = txid_current();
  if not found then
    -- nada mudou de fato (ex.: tentativa de alteração bloqueada): não cria versão
    if exists (select 1 from public.question_revisions r where r.question_id = qid
                and r.version = (select max(version) from public.question_revisions where question_id = qid)
                and (r.snapshot - 'updated_at' - 'updated_by') = (snap - 'updated_at' - 'updated_by')) then
      return null;
    end if;
    select coalesce(max(version), 0) + 1 into v from public.question_revisions where question_id = qid;
    insert into public.question_revisions (question_id, version, snapshot, changed_by) values (qid, v, snap, auth.uid());
  end if;
  return null;
end $$;
create constraint trigger question_revision after insert or update on public.questions
  deferrable initially deferred for each row execute function public.record_question_revision();
create constraint trigger question_option_revision after insert or update or delete on public.question_options
  deferrable initially deferred for each row execute function public.record_question_revision();

-- versão inicial das questões que já existem
insert into public.question_revisions (question_id, version, snapshot, changed_by, tx)
select q.id, 1, public.snapshot_question(q.id), q.created_by, 0
  from public.questions q
 where not exists (select 1 from public.question_revisions r where r.question_id = q.id);

-- ---------------------------------------------------------------------
-- Funções de acesso usadas nas regras
-- ---------------------------------------------------------------------
create or replace function public.owns_class(p_class uuid)
returns boolean language sql stable security definer set search_path = ''
as $$ select exists (select 1 from public.classes c where c.id = p_class and c.owner_id = auth.uid()) and public.is_teacher() $$;

create or replace function public.in_class(p_class uuid)
returns boolean language sql stable security definer set search_path = ''
as $$ select public.is_active() and exists (select 1 from public.class_members m where m.class_id = p_class and m.user_id = auth.uid() and m.status = 'active') $$;

create or replace function public.list_visible_to_me(p_list uuid)
returns boolean language sql stable security definer set search_path = ''
as $$
  select public.is_active() and exists (
    select 1 from public.list_assignments a
      join public.lists l on l.id = a.list_id and l.status = 'published'
      join public.class_members m on m.class_id = a.class_id and m.user_id = auth.uid() and m.status = 'active'
     where a.list_id = p_list and a.opens_at <= now())
$$;

create or replace function public.question_in_my_lists(p_question uuid)
returns boolean language sql stable security definer set search_path = ''
as $$
  select public.is_active() and exists (
    select 1 from public.list_items i
      join public.list_assignments a on a.list_id = i.list_id and a.opens_at <= now()
      join public.lists l on l.id = i.list_id and l.status = 'published'
      join public.class_members m on m.class_id = a.class_id and m.user_id = auth.uid() and m.status = 'active'
     where i.question_id = p_question)
$$;

create or replace function public.can_read_question(p_question uuid)
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (
    select 1 from public.questions q where q.id = p_question and (
      (q.status = 'published' and q.visibility = 'public' and public.is_active())
      or public.has_permission('content.manage')
      or (q.owner_id = auth.uid() and public.is_teacher())
      or (q.status = 'published' and public.question_in_my_lists(q.id))))
$$;

create or replace function public.can_edit_question(p_question uuid)
returns boolean language sql stable security definer set search_path = ''
as $$
  select public.has_permission('content.manage') or exists (
    select 1 from public.questions q where q.id = p_question and q.owner_id = auth.uid()
       and q.visibility <> 'public' and public.is_teacher())
$$;

-- A resposta só vale para questões que o aluno pode ver
create or replace function public.grade_answer()
returns trigger language plpgsql security definer set search_path = ''
as $$
declare ok boolean; st text;
begin
  select q.status into st from public.questions q where q.id = new.question_id;
  if st is null or not public.can_read_question(new.question_id)
     or (st <> 'published' and not public.can_edit_question(new.question_id)) then
    raise exception 'Questão indisponível.' using errcode = '23503';
  end if;
  if new.option_id is null then
    new.is_correct := false;
  else
    select o.is_correct into ok from public.question_options o where o.id = new.option_id and o.question_id = new.question_id;
    if ok is null then raise exception 'Alternativa não pertence à questão.' using errcode = '23514'; end if;
    new.is_correct := ok;
  end if;
  return new;
end $$;

-- Tentativa ligada a uma lista: o aluno precisa estar na turma
create or replace function public.check_attempt_assignment()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  if new.assignment_id is not null and (tg_op = 'INSERT' or new.assignment_id is distinct from old.assignment_id) then
    if not exists (select 1 from public.list_assignments a where a.id = new.assignment_id
                    and public.list_visible_to_me(a.list_id) and public.in_class(a.class_id)) then
      raise exception 'Lista indisponível para você.' using errcode = '42501';
    end if;
  end if;
  return new;
end $$;
create trigger check_attempt_assignment before insert or update on public.exam_attempts
  for each row execute function public.check_attempt_assignment();

-- Lista só pode conter questões que o dono da lista pode usar
create or replace function public.check_list_item()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  if not exists (select 1 from public.questions q join public.lists l on l.id = new.list_id
                  where q.id = new.question_id
                    and (q.owner_id = l.owner_id or (q.visibility = 'public' and q.status = 'published')
                         or public.has_permission('content.manage'))) then
    raise exception 'Esta questão não pode entrar na lista.' using errcode = '42501';
  end if;
  return new;
end $$;
create trigger check_list_item before insert or update on public.list_items
  for each row execute function public.check_list_item();

-- ---------------------------------------------------------------------
-- Regras de acesso (RLS)
-- ---------------------------------------------------------------------
alter table public.classes enable row level security;
alter table public.class_members enable row level security;
alter table public.lists enable row level security;
alter table public.list_items enable row level security;
alter table public.list_assignments enable row level security;
alter table public.teacher_requests enable row level security;
alter table public.correction_requests enable row level security;
alter table public.question_revisions enable row level security;
revoke all on public.classes, public.class_members, public.lists, public.list_items, public.list_assignments,
  public.teacher_requests, public.correction_requests, public.question_revisions from anon, authenticated;

-- Questões
drop policy if exists questions_read on public.questions;
drop policy if exists questions_insert on public.questions;
drop policy if exists questions_update on public.questions;
drop policy if exists questions_delete on public.questions;
create policy questions_read on public.questions for select to authenticated
  using ((select public.has_permission('content.manage'))
         or ((select public.is_active()) and status = 'published' and visibility = 'public')
         or (owner_id = (select auth.uid()) and (select public.is_teacher()))
         or (status = 'published' and public.question_in_my_lists(id)));
create policy questions_insert on public.questions for insert to authenticated
  with check ((select public.has_permission('content.manage'))
              or ((select public.is_teacher()) and owner_id = (select auth.uid()) and visibility = 'private'));
create policy questions_update on public.questions for update to authenticated
  using ((select public.has_permission('content.manage'))
         or ((select public.is_teacher()) and owner_id = (select auth.uid()) and visibility <> 'public'))
  with check ((select public.has_permission('content.manage'))
              or ((select public.is_teacher()) and owner_id = (select auth.uid()) and visibility <> 'public'));
create policy questions_delete on public.questions for delete to authenticated
  using ((select public.has_permission('content.manage'))
         or ((select public.is_teacher()) and owner_id = (select auth.uid()) and visibility <> 'public'));

drop policy if exists options_read on public.question_options;
drop policy if exists options_write on public.question_options;
drop policy if exists options_update on public.question_options;
drop policy if exists options_delete on public.question_options;
create policy options_read on public.question_options for select to authenticated
  using (public.can_read_question(question_id));
create policy options_write on public.question_options for insert to authenticated
  with check (public.can_edit_question(question_id));
create policy options_update on public.question_options for update to authenticated
  using (public.can_edit_question(question_id)) with check (public.can_edit_question(question_id));
create policy options_delete on public.question_options for delete to authenticated
  using (public.can_edit_question(question_id));

drop policy if exists comments_read on public.question_comments;
create policy comments_read on public.question_comments for select to authenticated
  using ((((select public.is_active()) and (status = 'visible' or user_id = (select auth.uid())))
          and public.can_read_question(question_id))
         or (select public.has_permission('content.manage')));

-- Turmas: dono gerencia; membro lê a turma (dados básicos via função)
grant select, insert, update, delete on public.classes to authenticated;
create policy classes_owner on public.classes for all to authenticated
  using ((owner_id = (select auth.uid()) and (select public.is_teacher())) or (select public.has_permission('content.manage')))
  with check ((owner_id = (select auth.uid()) and (select public.is_teacher())) or (select public.has_permission('content.manage')));
create policy classes_member_read on public.classes for select to authenticated
  using (public.in_class(id));

-- Membros: aluno vê e muda a própria participação (share_progress, saída) ; dono vê e remove
grant select on public.class_members to authenticated;
grant update (status, share_progress) on public.class_members to authenticated;
create policy members_read on public.class_members for select to authenticated
  using (user_id = (select auth.uid()) or public.owns_class(class_id) or (select public.has_permission('content.manage')));
create policy members_self_update on public.class_members for update to authenticated
  using (user_id = (select auth.uid()))
  with check (user_id = (select auth.uid()) and status in ('active', 'left'));
create policy members_owner_update on public.class_members for update to authenticated
  using (public.owns_class(class_id)) with check (public.owns_class(class_id) and status in ('active', 'removed'));

create or replace function public.protect_member_update()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  -- o professor não liga o compartilhamento por conta própria
  if new.user_id <> auth.uid() then new.share_progress := old.share_progress; end if;
  -- quem foi removido não volta sozinho
  if old.status = 'removed' and new.user_id = auth.uid() then new.status := old.status; end if;
  new.updated_at := now();
  return new;
end $$;
create trigger protect_member_update before update on public.class_members
  for each row execute function public.protect_member_update();

-- Listas
grant select, insert, update, delete on public.lists to authenticated;
create policy lists_owner on public.lists for all to authenticated
  using ((owner_id = (select auth.uid()) and (select public.is_teacher())) or (select public.has_permission('content.manage')))
  with check ((owner_id = (select auth.uid()) and (select public.is_teacher())) or (select public.has_permission('content.manage')));
create policy lists_student_read on public.lists for select to authenticated
  using (status = 'published' and public.list_visible_to_me(id));

grant select, insert, update, delete on public.list_items to authenticated;
create policy items_owner on public.list_items for all to authenticated
  using (exists (select 1 from public.lists l where l.id = list_id
                  and ((l.owner_id = (select auth.uid()) and (select public.is_teacher())) or (select public.has_permission('content.manage')))))
  with check (exists (select 1 from public.lists l where l.id = list_id
                  and ((l.owner_id = (select auth.uid()) and (select public.is_teacher())) or (select public.has_permission('content.manage')))));
create policy items_student_read on public.list_items for select to authenticated
  using (public.list_visible_to_me(list_id));

grant select, insert, update, delete on public.list_assignments to authenticated;
create policy assign_owner on public.list_assignments for all to authenticated
  using ((public.owns_class(class_id) and exists (select 1 from public.lists l where l.id = list_id and l.owner_id = (select auth.uid())))
         or (select public.has_permission('content.manage')))
  with check ((public.owns_class(class_id) and exists (select 1 from public.lists l where l.id = list_id and l.owner_id = (select auth.uid())))
              or (select public.has_permission('content.manage')));
create policy assign_student_read on public.list_assignments for select to authenticated
  using (public.in_class(class_id) and opens_at <= now());

-- Pedidos de professor: o próprio usuário cria e lê o seu; admin decide (pela função)
grant select, insert on public.teacher_requests to authenticated;
create policy treq_own on public.teacher_requests for select to authenticated
  using (user_id = (select auth.uid()) or (select public.has_permission('users.manage')));
create policy treq_insert on public.teacher_requests for insert to authenticated
  with check (user_id = (select auth.uid()) and (select public.is_active()) and status = 'pending'
              and decided_by is null and decided_at is null and note is null);

-- Pedidos de correção: professor pede sobre questão que pode ler; equipe resolve (pela função)
grant select, insert on public.correction_requests to authenticated;
create policy creq_read on public.correction_requests for select to authenticated
  using (requested_by = (select auth.uid()) or (select public.has_permission('content.manage')));
create policy creq_insert on public.correction_requests for insert to authenticated
  with check (requested_by = (select auth.uid()) and (select public.is_teacher()) and status = 'open'
              and resolved_by is null and response is null and public.can_read_question(question_id));

-- Versões: quem pode editar a questão vê o histórico dela
grant select on public.question_revisions to authenticated;
create policy revisions_read on public.question_revisions for select to authenticated
  using (public.can_edit_question(question_id) or (select public.has_permission('content.manage')));

-- Auditoria: identifica também linhas sem "id" e a questão de cada alternativa
create or replace function public.audit_trg()
returns trigger language plpgsql security definer set search_path = ''
as $$
declare
  r jsonb := to_jsonb(coalesce(new, old));
  rid text;
  info jsonb := '{}'::jsonb;
begin
  rid := coalesce(r ->> 'id', r ->> 'key', r ->> 'user_id');
  if tg_table_name = 'questions' then
    info := jsonb_build_object('code', r ->> 'code', 'status', r ->> 'status', 'visibility', r ->> 'visibility', 'owner_id', r ->> 'owner_id');
  elsif tg_table_name = 'question_options' then
    info := jsonb_build_object('question_id', r ->> 'question_id', 'is_correct', r ->> 'is_correct');
  elsif tg_table_name = 'app_settings' then
    info := jsonb_build_object('value', to_jsonb(new) -> 'value');
  elsif tg_table_name = 'roles' then
    info := jsonb_build_object('permissions', r -> 'permissions');
  elsif r ? 'name' then
    info := jsonb_build_object('name', r ->> 'name');
  elsif r ? 'title' then
    info := jsonb_build_object('title', r ->> 'title');
  elsif r ? 'status' then
    info := jsonb_build_object('status', r ->> 'status');
  end if;
  insert into public.audit_log (actor_id, action, target_table, target_id, details)
  values (auth.uid(), lower(tg_op), tg_table_name, rid, info);
  return null;
end $$;

-- datas de alteração e auditoria das tabelas novas
do $$
declare t text;
begin
  foreach t in array array['classes', 'class_members', 'lists'] loop
    execute format('create trigger touch_%1$s before update on public.%1$I for each row execute function public.touch_updated_at()', t);
  end loop;
  foreach t in array array['classes', 'lists', 'list_assignments', 'teacher_requests', 'correction_requests', 'question_options'] loop
    execute format('create trigger audit_%1$s after insert or update or delete on public.%1$I for each row execute function public.audit_trg()', t);
  end loop;
end $$;

create trigger rate_classes before insert on public.classes for each row execute function public.enforce_rate_limit('classes', '30', '3600');
create trigger rate_lists before insert on public.lists for each row execute function public.enforce_rate_limit('lists', '120', '3600');
create trigger rate_correction before insert on public.correction_requests for each row execute function public.enforce_rate_limit('corrections', '30', '3600');

-- ---------------------------------------------------------------------
-- Funções (RPC)
-- ---------------------------------------------------------------------

-- Salvar questão + alternativas (professor no próprio banco; equipe em qualquer uma)
create or replace function public.save_question(p_question jsonb, p_options jsonb)
returns uuid language plpgsql security definer set search_path = ''
as $$
declare
  qid uuid := nullif(p_question ->> 'id', '')::uuid;
  staff boolean := public.has_permission('content.manage');
  vis text := coalesce(nullif(p_question ->> 'visibility', ''), case when public.has_permission('content.manage') then 'public' else 'private' end);
  o jsonb; oid uuid; incoming uuid[] := '{}'; i integer := 0;
  st text := coalesce(nullif(p_question ->> 'status', ''), 'draft');
begin
  if not staff and not public.is_teacher() then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
  if not staff and vis = 'public' then vis := 'private'; end if;
  if qid is not null and not public.can_edit_question(qid) then
    raise exception 'Você não pode alterar esta questão.' using errcode = '42501';
  end if;
  if jsonb_typeof(p_options) <> 'array' or jsonb_array_length(p_options) < 2 or jsonb_array_length(p_options) > 6 then
    raise exception 'A questão precisa ter de 2 a 6 alternativas.' using errcode = '22023';
  end if;
  if qid is null then
    insert into public.questions (code, subject_id, topic_id, level, difficulty, board_id, year, qtype, theme, statement, image_path, image_alt,
                                  explanation, hint, source, status, visibility, owner_id)
    values (nullif(p_question ->> 'code', ''), (p_question ->> 'subject_id')::bigint, nullif(p_question ->> 'topic_id', '')::bigint,
            p_question ->> 'level', coalesce(nullif(p_question ->> 'difficulty', '')::smallint, 2), nullif(p_question ->> 'board_id', '')::bigint,
            nullif(p_question ->> 'year', '')::smallint, coalesce(nullif(p_question ->> 'qtype', ''), 'multiple_choice'), nullif(p_question ->> 'theme', ''),
            p_question ->> 'statement', nullif(p_question ->> 'image_path', ''), nullif(p_question ->> 'image_alt', ''), p_question ->> 'explanation',
            nullif(p_question ->> 'hint', ''), nullif(p_question ->> 'source', ''), st, vis, auth.uid())
    returning id into qid;
    update public.questions set code = 'Q-' || upper(substr(replace(qid::text, '-', ''), 1, 8)) where id = qid and code is null;
  else
    update public.questions set
      code = coalesce(nullif(p_question ->> 'code', ''), code), subject_id = (p_question ->> 'subject_id')::bigint, topic_id = nullif(p_question ->> 'topic_id', '')::bigint,
      level = p_question ->> 'level', difficulty = coalesce(nullif(p_question ->> 'difficulty', '')::smallint, 2), board_id = nullif(p_question ->> 'board_id', '')::bigint,
      year = nullif(p_question ->> 'year', '')::smallint, qtype = coalesce(nullif(p_question ->> 'qtype', ''), 'multiple_choice'), theme = nullif(p_question ->> 'theme', ''),
      statement = p_question ->> 'statement', image_path = nullif(p_question ->> 'image_path', ''), image_alt = nullif(p_question ->> 'image_alt', ''),
      explanation = p_question ->> 'explanation', hint = nullif(p_question ->> 'hint', ''), source = nullif(p_question ->> 'source', ''), status = st,
      visibility = case when staff then vis else visibility end
    where id = qid;
    if not found then raise exception 'Questão não encontrada.' using errcode = 'P0002'; end if;
  end if;

  for o in select value from jsonb_array_elements(p_options) loop
    oid := nullif(o ->> 'id', '')::uuid;
    if oid is not null then incoming := incoming || oid; end if;
  end loop;
  delete from public.question_options where question_id = qid and not (id = any (incoming));
  for o in select value from jsonb_array_elements(p_options) loop
    oid := nullif(o ->> 'id', '')::uuid;
    if oid is not null and exists (select 1 from public.question_options where id = oid and question_id = qid) then
      update public.question_options set position = i, body = o ->> 'body', is_correct = coalesce((o ->> 'is_correct')::boolean, false) where id = oid;
    else
      insert into public.question_options (question_id, position, body, is_correct) values (qid, i, o ->> 'body', coalesce((o ->> 'is_correct')::boolean, false));
    end if;
    i := i + 1;
  end loop;
  return qid;
end $$;

-- O editor antigo do admin passa a usar a mesma função
create or replace function public.admin_save_question(p_question jsonb, p_options jsonb)
returns uuid language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('content.manage');
  return public.save_question(p_question, p_options);
end $$;

-- Professor pede para o admin colocar a questão no banco geral
create or replace function public.request_public(p_question uuid)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  update public.questions set visibility = 'pending_public'
   where id = p_question and owner_id = auth.uid() and visibility = 'private' and status = 'published' and public.is_teacher();
  if not found then raise exception 'Só questões suas, publicadas e privadas podem ser enviadas ao banco geral.' using errcode = '42501'; end if;
end $$;

-- Pedido para ser professor
create or replace function public.request_teacher(p_message text, p_subjects text)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  if not public.is_active() then raise exception 'Faça login.' using errcode = '42501'; end if;
  if public.is_teacher() then raise exception 'Você já é professor.' using errcode = '22023'; end if;
  insert into public.teacher_requests (user_id, message, subjects)
  values (auth.uid(), left(btrim(p_message), 1000), left(btrim(p_subjects), 300))
  on conflict (user_id) do update set message = excluded.message, subjects = excluded.subjects, status = 'pending',
    note = null, decided_by = null, decided_at = null, created_at = now()
  where public.teacher_requests.status <> 'approved';
end $$;

create or replace function public.admin_decide_teacher(p_user uuid, p_approve boolean, p_note text default null)
returns void language plpgsql security definer set search_path = ''
as $$
declare cur text;
begin
  perform public.require_permission('users.manage');
  select role into cur from public.profiles where id = p_user;
  if cur is null then raise exception 'Usuário não encontrado.' using errcode = 'P0002'; end if;
  update public.teacher_requests set status = case when p_approve then 'approved' else 'rejected' end,
         note = left(p_note, 500), decided_by = auth.uid(), decided_at = now()
   where user_id = p_user;
  if not found then
    insert into public.teacher_requests (user_id, status, note, decided_by, decided_at)
    values (p_user, case when p_approve then 'approved' else 'rejected' end, left(p_note, 500), auth.uid(), now());
  end if;
  if p_approve and cur = 'student' then
    update public.profiles set role = 'teacher' where id = p_user;
  elsif not p_approve and cur = 'teacher' then
    update public.profiles set role = 'student' where id = p_user;
  end if;
  perform public.audit(case when p_approve then 'teacher.approve' else 'teacher.reject' end, 'profiles', p_user::text,
                       jsonb_build_object('note', p_note));
end $$;

create or replace function public.admin_list_teacher_requests()
returns table (user_id uuid, display_name text, email text, message text, subjects text, status text, created_at timestamptz)
language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  return query select r.user_id, p.display_name, u.email::text, r.message, r.subjects, r.status, r.created_at
    from public.teacher_requests r join public.profiles p on p.id = r.user_id join auth.users u on u.id = r.user_id
   order by (r.status = 'pending') desc, r.created_at desc limit 200;
end $$;

-- Aluno entra numa turma pelo código
create or replace function public.join_class(p_code text)
returns uuid language plpgsql security definer set search_path = ''
as $$
declare c record;
begin
  if not public.is_active() then raise exception 'Faça login.' using errcode = '42501'; end if;
  perform public.check_rate('join_class', 20, 3600);
  select * into c from public.classes where join_code = upper(btrim(p_code)) and archived_at is null;
  if c.id is null then raise exception 'Código de turma não encontrado.' using errcode = 'P0002'; end if;
  if not c.is_open then raise exception 'Esta turma não está aceitando novos alunos.' using errcode = '42501'; end if;
  if c.owner_id = auth.uid() then raise exception 'Você é o professor desta turma.' using errcode = '22023'; end if;
  if exists (select 1 from public.class_members where class_id = c.id and user_id = auth.uid() and status = 'removed') then
    raise exception 'O professor removeu você desta turma.' using errcode = '42501';
  end if;
  insert into public.class_members (class_id, user_id) values (c.id, auth.uid())
  on conflict (class_id, user_id) do update set status = 'active', updated_at = now();
  return c.id;
end $$;

-- Turmas do aluno, com o nome do professor
create or replace function public.my_classes()
returns table (class_id uuid, name text, description text, teacher_name text, share_progress boolean, joined_at timestamptz)
language sql stable security definer set search_path = ''
as $$
  select c.id, c.name, c.description, p.display_name, m.share_progress, m.joined_at
    from public.class_members m join public.classes c on c.id = m.class_id join public.profiles p on p.id = c.owner_id
   where m.user_id = auth.uid() and m.status = 'active' and c.archived_at is null and public.is_active()
   order by m.joined_at desc
$$;

-- Listas pendentes/feitas do aluno
create or replace function public.my_assignments()
returns table (assignment_id uuid, list_id uuid, class_name text, title text, description text, mode text, time_limit_min smallint,
               opens_at timestamptz, due_at timestamptz, n_questions bigint)
language sql stable security definer set search_path = ''
as $$
  select a.id, l.id, c.name, l.title, l.description, l.mode, l.time_limit_min, a.opens_at, a.due_at,
         (select count(*) from public.list_items i where i.list_id = l.id)
    from public.list_assignments a
    join public.lists l on l.id = a.list_id and l.status = 'published'
    join public.classes c on c.id = a.class_id and c.archived_at is null
    join public.class_members m on m.class_id = c.id and m.user_id = auth.uid() and m.status = 'active'
   where a.opens_at <= now() and public.is_active()
   order by coalesce(a.due_at, a.opens_at + interval '100 years'), a.opens_at desc
$$;

-- Alunos da turma (para o professor): nome, e se compartilha resultados
create or replace function public.class_roster(p_class uuid)
returns table (user_id uuid, display_name text, status text, share_progress boolean, joined_at timestamptz)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not (public.owns_class(p_class) or public.has_permission('content.manage')) then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
  return query select m.user_id, p.display_name, m.status, m.share_progress, m.joined_at
    from public.class_members m join public.profiles p on p.id = m.user_id
   where m.class_id = p_class order by p.display_name;
end $$;

-- Resultados das listas da turma: só de quem aceitou compartilhar
create or replace function public.class_results(p_class uuid)
returns table (assignment_id uuid, list_title text, user_id uuid, display_name text, total integer, correct integer,
               started_at timestamptz, finished_at timestamptz)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not (public.owns_class(p_class) or public.has_permission('content.manage')) then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
  return query
  select a.id, l.title, m.user_id, p.display_name, e.total::integer, e.correct::integer, e.started_at, e.finished_at
    from public.list_assignments a
    join public.lists l on l.id = a.list_id
    join public.class_members m on m.class_id = a.class_id and m.status = 'active' and m.share_progress
    join public.profiles p on p.id = m.user_id
    left join lateral (select x.total, x.correct, x.started_at, x.finished_at from public.exam_attempts x
                        where x.assignment_id = a.id and x.user_id = m.user_id and x.deleted_at is null
                        order by x.finished_at desc nulls last, x.started_at desc limit 1) e on true
   where a.class_id = p_class
   order by a.created_at desc, p.display_name;
end $$;

-- Pedido de correção resolvido pela equipe
create or replace function public.admin_resolve_correction(p_id uuid, p_status text, p_response text)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('content.manage');
  if p_status not in ('resolved', 'rejected') then raise exception 'Situação inválida.' using errcode = '22023'; end if;
  update public.correction_requests set status = p_status, response = left(p_response, 2000), resolved_by = auth.uid(), resolved_at = now()
   where id = p_id;
  if not found then raise exception 'Pedido não encontrado.' using errcode = 'P0002'; end if;
end $$;

-- Aprovar/recusar a entrada de uma questão no banco geral
create or replace function public.admin_set_visibility(p_question uuid, p_visibility text)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('content.manage');
  if p_visibility not in ('private', 'public') then raise exception 'Visibilidade inválida.' using errcode = '22023'; end if;
  update public.questions set visibility = p_visibility where id = p_question;
  if not found then raise exception 'Questão não encontrada.' using errcode = 'P0002'; end if;
end $$;

-- Possíveis questões duplicadas (texto parecido)
create or replace function public.admin_find_duplicates(p_min real default 0.6)
returns table (a uuid, a_code text, a_statement text, b uuid, b_code text, b_statement text, similarity real)
language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('content.manage');
  perform set_config('pg_trgm.similarity_threshold', greatest(least(p_min, 0.99), 0.3)::text, true);
  return query
  select q1.id, q1.code, left(q1.statement, 200), q2.id, q2.code, left(q2.statement, 200),
         extensions.similarity(public.sem_acento(q1.statement), public.sem_acento(q2.statement))
    from public.questions q1
    join public.questions q2 on q1.id < q2.id
     and public.sem_acento(q1.statement) operator(extensions.%) public.sem_acento(q2.statement)
   where q1.status <> 'archived' and q2.status <> 'archived'
   order by 7 desc limit 100;
end $$;

-- Usuários filtrados por papel (para o admin ver alunos e professores)
create or replace function public.admin_list_users(p_search text, p_limit integer, p_offset integer, p_role text)
returns table (id uuid, email text, display_name text, role text, status text, blocked_reason text,
               created_at timestamptz, last_sign_in_at timestamptz, answers bigint, total bigint)
language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.view');
  return query
  with base as (
    select p.id, u.email::text as email, p.display_name, p.role, p.status, p.blocked_reason, p.created_at, u.last_sign_in_at
      from public.profiles p join auth.users u on u.id = p.id
     where (coalesce(p_role, '') = '' or p.role = p_role)
       and (coalesce(p_search, '') = '' or p.display_name ilike '%' || p_search || '%' or u.email ilike '%' || p_search || '%')
  )
  select b.id, b.email, b.display_name, b.role, b.status, b.blocked_reason, b.created_at, b.last_sign_in_at,
         (select count(*) from public.answers a where a.user_id = b.id), count(*) over ()
    from base b order by b.created_at desc
   limit least(greatest(p_limit, 1), 200) offset greatest(p_offset, 0);
end $$;

-- Visão geral ganha números de professores, turmas e listas
create or replace function public.admin_teacher_overview()
returns jsonb language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('stats.view');
  return jsonb_build_object(
    'professores', (select count(*) from public.profiles where role = 'teacher' and status = 'active'),
    'pedidos_professor', (select count(*) from public.teacher_requests where status = 'pending'),
    'turmas', (select count(*) from public.classes where archived_at is null),
    'listas', (select count(*) from public.lists where status = 'published'),
    'questoes_professores', (select count(*) from public.questions where owner_id is not null and visibility <> 'public'),
    'aguardando_banco_geral', (select count(*) from public.questions where visibility = 'pending_public'),
    'correcoes_abertas', (select count(*) from public.correction_requests where status = 'open'));
end $$;

-- Permissões das funções
do $$
declare f text;
begin
  foreach f in array array[
    'public.is_teacher()', 'public.owns_class(uuid)', 'public.in_class(uuid)', 'public.list_visible_to_me(uuid)',
    'public.question_in_my_lists(uuid)', 'public.can_read_question(uuid)', 'public.can_edit_question(uuid)',
    'public.save_question(jsonb, jsonb)', 'public.admin_save_question(jsonb, jsonb)', 'public.request_public(uuid)',
    'public.request_teacher(text, text)', 'public.admin_decide_teacher(uuid, boolean, text)', 'public.admin_list_teacher_requests()',
    'public.join_class(text)', 'public.my_classes()', 'public.my_assignments()', 'public.class_roster(uuid)', 'public.class_results(uuid)',
    'public.admin_resolve_correction(uuid, text, text)', 'public.admin_set_visibility(uuid, text)', 'public.admin_find_duplicates(real)',
    'public.admin_list_users(text, integer, integer, text)', 'public.admin_teacher_overview()', 'public.snapshot_question(uuid)'] loop
    execute format('revoke execute on function %s from public, anon', f);
    execute format('grant execute on function %s to authenticated', f);
  end loop;
end $$;
revoke execute on function public.snapshot_question(uuid) from authenticated;


-- >>>>>>>>>> 20261125000800_armazenamento_professores.sql
-- =====================================================================
-- Educa Mais · Migração 8: imagens das questões dos professores
--   Cada professor envia imagens só para a própria pasta t/<id do professor>/.
--   Imagens de questões privadas só são lidas por quem pode ver a questão
--   (o dono, a equipe ou alunos de turmas que receberam a lista).
--   As imagens da equipe (pasta q/) continuam como antes.
-- =====================================================================

drop policy if exists "imagens: leitura para logados ativos" on storage.objects;
create policy "imagens: leitura para logados ativos" on storage.objects for select to authenticated
  using (bucket_id = 'question-images' and (select public.is_active()) and (
    storage.objects.name not like 't/%'
    or (storage.foldername(storage.objects.name))[2] = (select auth.uid())::text
    or (select public.has_permission('content.manage'))
    or exists (select 1 from public.questions q
                where q.image_path = storage.objects.name and public.can_read_question(q.id))));

create policy "imagens: envio pelo professor na própria pasta" on storage.objects for insert to authenticated
  with check (bucket_id = 'question-images' and (select public.is_teacher())
              and (storage.foldername(storage.objects.name))[1] = 't'
              and (storage.foldername(storage.objects.name))[2] = (select auth.uid())::text);
create policy "imagens: exclusão pelo professor na própria pasta" on storage.objects for delete to authenticated
  using (bucket_id = 'question-images' and (select public.is_teacher())
         and (storage.foldername(storage.objects.name))[1] = 't'
         and (storage.foldername(storage.objects.name))[2] = (select auth.uid())::text);


-- >>>>>>>>>> 20261126000900_catalogo_ampliado.sql
-- Gerado por scripts/gerar-banco.mjs. Novas matérias e conteúdos usados pelo banco de questões.
insert into public.subjects (id, area_id, name, color, position) overriding system value values
  (11, 1, 'Literatura', '#8a4b14', 10),
  (12, 4, 'Sociologia', '#a8326e', 11),
  (13, 4, 'Filosofia', '#5a4fcf', 12)
on conflict (id) do nothing;
insert into public.topics (id, subject_id, parent_id, name) overriding system value values
  (104, 3, null, 'Estatística'),
  (106, 3, null, 'Probabilidade'),
  (109, 3, null, 'Sequências'),
  (111, 3, null, 'Análise combinatória'),
  (113, 3, null, 'Funções'),
  (115, 3, null, 'Grandezas e medidas'),
  (118, 6, null, 'Energia'),
  (120, 6, null, 'Eletricidade'),
  (123, 6, null, 'Termologia'),
  (125, 6, null, 'Ondulatória'),
  (127, 6, null, 'Hidrostática'),
  (130, 7, null, 'Soluções'),
  (133, 7, null, 'Radioatividade'),
  (135, 7, null, 'Estequiometria'),
  (138, 1, null, 'Semântica e estilística'),
  (140, 1, null, 'Interpretação de texto'),
  (143, 1, null, 'Linguagem e sociedade'),
  (145, 11, null, 'Escolas literárias'),
  (148, 8, null, 'História do Brasil'),
  (151, 8, null, 'História Geral'),
  (154, 9, null, 'Geografia humana e ambiental'),
  (157, 9, null, 'População'),
  (159, 12, null, 'Teoria sociológica'),
  (161, 13, null, 'História da filosofia'),
  (163, 5, null, 'Saúde'),
  (165, 5, null, 'Genética'),
  (167, 5, null, 'Ecologia'),
  (100, 3, 5, 'Juros compostos'),
  (101, 3, 3, 'Áreas'),
  (102, 3, 3, 'Teorema de Pitágoras'),
  (103, 3, 3, 'Volumes'),
  (105, 3, 104, 'Média, moda e mediana'),
  (107, 3, 106, 'Probabilidade simples'),
  (108, 3, 8, 'Regra de três'),
  (110, 3, 109, 'Progressão aritmética'),
  (112, 3, 111, 'Princípio multiplicativo'),
  (114, 3, 113, 'Função afim'),
  (116, 3, 115, 'Escala'),
  (117, 6, 23, 'Conversão de unidades'),
  (119, 6, 118, 'Energia cinética e potencial'),
  (121, 6, 120, 'Consumo de energia elétrica'),
  (122, 6, 120, 'Lei de Ohm'),
  (124, 6, 123, 'Calorimetria'),
  (126, 6, 125, 'Equação fundamental da onda'),
  (128, 6, 127, 'Densidade e pressão'),
  (129, 7, 27, 'Massa molar'),
  (131, 7, 130, 'Concentração comum'),
  (132, 7, 130, 'Diluição'),
  (134, 7, 133, 'Meia-vida'),
  (136, 7, 135, 'Proporção em massa'),
  (137, 4, 40, 'Sequências numéricas'),
  (139, 1, 138, 'Figuras de linguagem'),
  (141, 1, 140, 'Funções da linguagem'),
  (142, 1, 10, 'Concordância verbal e nominal'),
  (144, 1, 143, 'Variação linguística'),
  (146, 11, 145, 'Escolas literárias brasileiras'),
  (147, 2, 45, 'Tempos verbais'),
  (149, 8, 148, 'Linha do tempo do Brasil'),
  (150, 8, 148, 'Cronologia'),
  (152, 8, 151, 'Grandes acontecimentos'),
  (153, 9, 35, 'Características dos biomas'),
  (155, 9, 154, 'Conceitos geográficos'),
  (156, 9, 33, 'Fusos horários'),
  (158, 9, 157, 'Densidade demográfica'),
  (160, 12, 159, 'Pensadores e conceitos'),
  (162, 13, 161, 'Filósofos e ideias'),
  (164, 5, 163, 'Doenças e prevenção'),
  (166, 5, 165, 'Primeira lei de Mendel'),
  (168, 5, 167, 'Cadeias alimentares e energia'),
  (169, 5, 165, 'Sistema ABO')
on conflict (id) do nothing;
select setval(pg_get_serial_sequence('public.subjects', 'id'), greatest((select max(id) from public.subjects), 1000));
select setval(pg_get_serial_sequence('public.topics', 'id'), greatest((select max(id) from public.topics), 1000));


-- >>>>>>>>>> 20261126001000_aulas_acesso_duvidas.sql
-- =====================================================================
-- Educa Mais · Migração 10: aulas, controle de acesso por aluno,
-- grupos de alunos, dúvidas com a professora e novas preferências.
-- Regra: o banco decide o que cada aluno vê; a tela só esconde botões.
-- =====================================================================

-- ---------------------------------------------------------------------
-- Aulas (vídeo + material de apoio), organizadas por matéria e módulo
-- ---------------------------------------------------------------------
create table public.lessons (
  id             uuid primary key default gen_random_uuid(),
  title          text not null check (char_length(btrim(title)) between 2 and 160),
  description    text check (char_length(description) <= 2000),
  subject_id     bigint references public.subjects (id) on delete set null,
  module         text check (char_length(module) <= 120),            -- ex.: "Módulo 1: Funções"
  position       integer not null default 0,
  video_provider text check (video_provider in ('youtube', 'vimeo', 'arquivo', 'link')),
  video_ref      text check (char_length(video_ref) <= 500),         -- id do YouTube/Vimeo, caminho no Storage ou https://
  body           text check (char_length(body) <= 60000),            -- material de apoio escrito (texto simples)
  material_id    uuid references public.materials (id) on delete set null,
  duration_min   smallint check (duration_min between 1 and 600),
  pre_codes      text[] not null default '{}' check (cardinality(pre_codes) <= 50),   -- questões para fazer ANTES da aula (códigos)
  post_codes     text[] not null default '{}' check (cardinality(post_codes) <= 50),  -- questões para fazer DEPOIS da aula
  access         text not null default 'liberados' check (access in ('todos', 'liberados')),
  status         text not null default 'draft' check (status in ('draft', 'published', 'archived')),
  created_by     uuid references public.profiles (id) on delete set null,
  created_at     timestamptz not null default now(),
  updated_at     timestamptz not null default now(),
  constraint lessons_video_ok check (
    video_provider is null
    or (video_provider = 'youtube' and video_ref ~ '^[A-Za-z0-9_-]{6,20}$')
    or (video_provider = 'vimeo' and video_ref ~ '^[0-9]{5,12}$')
    or (video_provider = 'arquivo' and video_ref ~ '^[A-Za-z0-9/_.-]{3,200}$')
    or (video_provider = 'link' and video_ref ~ '^https://[^\s<>"]{4,490}$')
  )
);
create index lessons_subject_idx on public.lessons (subject_id, module, position);
comment on table public.lessons is 'Aulas da plataforma. access = liberados (padrão: só quem a administração liberar) ou todos (todo aluno com conta).';

-- Materiais também podem ser "só para liberados"
alter table public.materials add column if not exists visibility text not null default 'todos' check (visibility in ('todos', 'liberados'));

-- ---------------------------------------------------------------------
-- Grupos de alunos (ex.: "Turma ENEM 2027") para liberar de uma vez
-- ---------------------------------------------------------------------
create table public.student_groups (
  id          uuid primary key default gen_random_uuid(),
  name        text not null unique check (char_length(btrim(name)) between 2 and 80),
  description text check (char_length(description) <= 300),
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create table public.student_group_members (
  group_id   uuid not null references public.student_groups (id) on delete cascade,
  user_id    uuid not null references public.profiles (id) on delete cascade,
  added_at   timestamptz not null default now(),
  primary key (group_id, user_id)
);
create index student_group_members_user_idx on public.student_group_members (user_id);

-- ---------------------------------------------------------------------
-- Regras de acesso: liberar (allow = true) ou bloquear (allow = false)
-- uma aula ou um material para um aluno ou para um grupo.
-- Ordem de decisão: regra do aluno > regra de grupo > padrão do item.
-- ---------------------------------------------------------------------
create table public.access_rules (
  id          bigint generated always as identity primary key,
  item_kind   text not null check (item_kind in ('lesson', 'material')),
  item_id     uuid not null,
  target_kind text not null check (target_kind in ('user', 'group')),
  target_id   uuid not null,
  allow       boolean not null,
  created_by  uuid default auth.uid() references public.profiles (id) on delete set null,
  created_at  timestamptz not null default now(),
  unique (item_kind, item_id, target_kind, target_id)
);
create index access_rules_target_idx on public.access_rules (target_kind, target_id);

-- Partes do app que a administração pode desligar para um aluno
create table public.student_controls (
  user_id           uuid primary key references public.profiles (id) on delete cascade,
  blocked_features  text[] not null default '{}' check (blocked_features <@ array['questoes', 'flashcards', 'plano', 'foco', 'anotacoes', 'desempenho', 'resultados', 'redacao', 'aulas', 'materiais', 'turmas', 'duvidas']),
  note              text check (char_length(note) <= 500),   -- anotação interna da administração (o aluno não vê)
  pending           boolean not null default false,          -- conta nova esperando a liberação da administração
  approved_at       timestamptz,
  updated_at        timestamptz not null default now(),
  updated_by        uuid references public.profiles (id) on delete set null
);

create or replace function public.feature_blocked(p_feature text, p_user uuid default auth.uid())
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (select 1 from public.student_controls c join public.profiles p on p.id = c.user_id
                  where c.user_id = p_user and p.role = 'student' and (c.pending or p_feature = any (c.blocked_features)))
$$;

-- Liberação manual: com "liberacao_manual" ligada, toda conta nova de estudante começa sem acesso
-- e aparece no painel da administração para ser liberada.
insert into public.app_settings (key, value, description, is_public) values
  ('liberacao_manual', 'true'::jsonb, 'Se verdadeiro, contas novas de estudantes começam sem acesso e esperam a liberação no painel.', false)
on conflict (key) do nothing;

create or replace function public.new_student_pending()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  if new.role = 'student' and coalesce((select value = 'true'::jsonb from public.app_settings where key = 'liberacao_manual'), false) then
    insert into public.student_controls (user_id, pending) values (new.id, true) on conflict (user_id) do nothing;
  end if;
  return new;
end $$;
create trigger new_student_pending after insert on public.profiles for each row execute function public.new_student_pending();

/** Decide se o aluno pode abrir uma aula ou material. */
create or replace function public.item_allowed(p_kind text, p_item uuid, p_access text, p_user uuid default auth.uid())
returns boolean language plpgsql stable security definer set search_path = ''
as $$
declare r boolean; g_allow boolean; g_deny boolean;
begin
  if p_user is null then return false; end if;
  if not exists (select 1 from public.profiles p where p.id = p_user and p.status = 'active') then return false; end if;
  if public.feature_blocked(case p_kind when 'lesson' then 'aulas' else 'materiais' end, p_user) then return false; end if;
  select allow into r from public.access_rules where item_kind = p_kind and item_id = p_item and target_kind = 'user' and target_id = p_user;
  if r is not null then return r; end if;
  select bool_or(a.allow), bool_or(not a.allow) into g_allow, g_deny
    from public.access_rules a join public.student_group_members m on m.group_id = a.target_id
   where a.item_kind = p_kind and a.item_id = p_item and a.target_kind = 'group' and m.user_id = p_user;
  if g_allow then return true; end if;
  if g_deny then return false; end if;
  return p_access = 'todos';
end $$;

-- ---------------------------------------------------------------------
-- Progresso do aluno nas aulas (sincronizado; funciona como as outras tabelas do aluno)
-- ---------------------------------------------------------------------
create table public.lesson_progress (
  user_id      uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  lesson_id    uuid not null references public.lessons (id) on delete cascade,
  completed_at timestamptz,
  created_at   timestamptz not null default now(),
  updated_at   timestamptz not null default now(),
  deleted_at   timestamptz,
  synced_at    timestamptz not null default now(),
  primary key (user_id, lesson_id)
);
create index lesson_progress_sync_idx on public.lesson_progress (user_id, synced_at);
create trigger sync_guard before insert or update on public.lesson_progress for each row execute function public.sync_guard();

-- Registro de quem abriu cada aula
create table public.lesson_access_log (
  id          bigint generated always as identity primary key,
  lesson_id   uuid not null references public.lessons (id) on delete cascade,
  user_id     uuid not null references public.profiles (id) on delete cascade,
  accessed_at timestamptz not null default now()
);
create index lesson_access_lesson_idx on public.lesson_access_log (lesson_id, accessed_at desc);
create index lesson_access_user_idx on public.lesson_access_log (user_id, accessed_at desc);

create or replace function public.open_lesson(p_lesson uuid)
returns void language plpgsql security definer set search_path = ''
as $$
declare l record;
begin
  if not public.is_active() then raise exception 'Faça login.' using errcode = '42501'; end if;
  select * into l from public.lessons where id = p_lesson;
  if l.id is null or (l.status <> 'published' and not public.has_permission('content.manage'))
     or not (public.has_permission('content.manage') or public.item_allowed('lesson', l.id, l.access)) then
    raise exception 'Aula não disponível para você.' using errcode = '42501';
  end if;
  perform public.check_rate('lessons', 120, 3600);
  insert into public.lesson_access_log (lesson_id, user_id) values (l.id, auth.uid());
end $$;

-- Material protegido: agora respeita liberação por aluno e bloqueio da parte "materiais"
create or replace function public.request_material(p_material uuid)
returns text language plpgsql security definer set search_path = ''
as $$
declare m record; recent integer;
begin
  if not public.is_active() then raise exception 'Faça login.' using errcode = '42501'; end if;
  select * into m from public.materials where id = p_material;
  if m.id is null or (m.status <> 'published' and not public.has_permission('content.manage')) then
    raise exception 'Material não encontrado.' using errcode = 'P0002';
  end if;
  if not public.has_permission('content.manage') and (m.access = 'staff' or not public.item_allowed('material', m.id, m.visibility)) then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
  perform public.check_rate('materials', 60, 3600);
  insert into public.material_access_log (material_id, user_id) values (m.id, auth.uid());
  select count(distinct material_id) into recent from public.material_access_log
   where user_id = auth.uid() and accessed_at > now() - interval '10 minutes';
  if recent >= 15 then
    insert into public.security_events (user_id, kind, details)
    values (auth.uid(), 'material.bulk_access', jsonb_build_object('materiais_em_10min', recent));
  end if;
  return m.storage_path;
end $$;

-- ---------------------------------------------------------------------
-- Dúvidas: o aluno pergunta, a professora (administração) responde
-- ---------------------------------------------------------------------
create table public.doubts (
  id          uuid primary key default gen_random_uuid(),
  user_id     uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  subject_id  bigint references public.subjects (id) on delete set null,
  lesson_id   uuid references public.lessons (id) on delete set null,
  question_id uuid references public.questions (id) on delete set null,
  body        text not null check (char_length(btrim(body)) between 5 and 4000),
  status      text not null default 'aberta' check (status in ('aberta', 'respondida', 'fechada')),
  answer      text check (char_length(answer) <= 8000),
  answered_by uuid references public.profiles (id) on delete set null,
  answered_at timestamptz,
  seen_at     timestamptz,                 -- quando o aluno leu a resposta
  created_at  timestamptz not null default now(),
  updated_at  timestamptz not null default now()
);
create index doubts_user_idx on public.doubts (user_id, created_at desc);
create index doubts_status_idx on public.doubts (status, created_at);

create or replace function public.doubt_guard()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  if tg_op = 'INSERT' then
    if public.feature_blocked('duvidas') then raise exception 'O envio de dúvidas está desativado para sua conta.' using errcode = '42501'; end if;
    perform public.check_rate('doubts', 20, 86400);
    new.user_id := auth.uid(); new.status := 'aberta'; new.answer := null; new.answered_by := null; new.answered_at := null; new.seen_at := null;
    return new;
  end if;
  new.updated_at := now();
  if public.has_permission('users.manage') then
    if new.answer is distinct from old.answer and new.answer is not null then
      new.answered_by := auth.uid(); new.answered_at := now(); new.status := 'respondida'; new.seen_at := null;
    end if;
    return new;
  end if;
  -- o aluno só pode marcar como lida ou encerrar a própria dúvida
  if new.body is distinct from old.body or new.answer is distinct from old.answer or new.user_id is distinct from old.user_id
     or new.answered_by is distinct from old.answered_by or new.answered_at is distinct from old.answered_at
     or (new.status is distinct from old.status and new.status <> 'fechada') then
    raise exception 'Alteração não permitida.' using errcode = '42501';
  end if;
  return new;
end $$;
create trigger doubt_guard before insert or update on public.doubts for each row execute function public.doubt_guard();

-- ---------------------------------------------------------------------
-- Funções da administração para o controle de cada aluno
-- ---------------------------------------------------------------------
/** Tudo que um aluno pode ou não abrir, com o motivo (para a tela do Ryan). */
create or replace function public.admin_student_access(p_user uuid)
returns jsonb language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  return jsonb_build_object(
    'profile', (select jsonb_build_object('id', p.id, 'display_name', p.display_name, 'status', p.status, 'study_profile', p.study_profile, 'school_year', p.school_year, 'created_at', p.created_at, 'last_seen_at', p.last_seen_at) from public.profiles p where p.id = p_user),
    'last_login', (select max(s.started_at) from public.login_sessions s where s.user_id = p_user),
    'recent_lessons', coalesce((select jsonb_agg(x order by x.accessed_at desc) from (select a.accessed_at, l.id as lesson_id, l.title from public.lesson_access_log a join public.lessons l on l.id = a.lesson_id where a.user_id = p_user order by a.accessed_at desc limit 30) x), '[]'),
    'recent_materials', coalesce((select jsonb_agg(x order by x.accessed_at desc) from (select a.accessed_at, m.title from public.material_access_log a join public.materials m on m.id = a.material_id where a.user_id = p_user order by a.accessed_at desc limit 20) x), '[]'),
    'study_7d_min', (select coalesce(round(sum(duration_sec) / 60.0), 0) from public.study_sessions where user_id = p_user and started_at > now() - interval '7 days'),
    'answers_total', (select count(*) from public.answers where user_id = p_user),
    'answers_correct', (select count(*) from public.answers where user_id = p_user and is_correct),
    'controls', (select to_jsonb(c) from public.student_controls c where c.user_id = p_user),
    'groups', coalesce((select jsonb_agg(m.group_id) from public.student_group_members m where m.user_id = p_user), '[]'),
    'lessons', coalesce((select jsonb_agg(jsonb_build_object('id', l.id, 'title', l.title, 'subject_id', l.subject_id, 'module', l.module, 'access', l.access, 'status', l.status,
        'rule', (select a.allow from public.access_rules a where a.item_kind = 'lesson' and a.item_id = l.id and a.target_kind = 'user' and a.target_id = p_user),
        'allowed', public.item_allowed('lesson', l.id, l.access, p_user)) order by l.subject_id, l.module, l.position, l.title) from public.lessons l where l.status <> 'archived'), '[]'),
    'materials', coalesce((select jsonb_agg(jsonb_build_object('id', m.id, 'title', m.title, 'subject_id', m.subject_id, 'access', m.visibility, 'status', m.status,
        'rule', (select a.allow from public.access_rules a where a.item_kind = 'material' and a.item_id = m.id and a.target_kind = 'user' and a.target_id = p_user),
        'allowed', public.item_allowed('material', m.id, m.visibility, p_user)) order by m.title) from public.materials m where m.status <> 'archived' and m.access <> 'staff'), '[]'),
    'progress', coalesce((select jsonb_agg(jsonb_build_object('lesson_id', p.lesson_id, 'completed_at', p.completed_at)) from public.lesson_progress p where p.user_id = p_user and p.deleted_at is null), '[]')
  );
end $$;

/** Liberar (true), bloquear (false) ou voltar ao padrão (null) um item para um aluno ou grupo. */
create or replace function public.admin_set_access(p_kind text, p_item uuid, p_target_kind text, p_target uuid, p_allow boolean)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  if p_allow is null then
    delete from public.access_rules where item_kind = p_kind and item_id = p_item and target_kind = p_target_kind and target_id = p_target;
  else
    insert into public.access_rules (item_kind, item_id, target_kind, target_id, allow) values (p_kind, p_item, p_target_kind, p_target, p_allow)
    on conflict (item_kind, item_id, target_kind, target_id) do update set allow = excluded.allow, created_by = auth.uid(), created_at = now();
  end if;
  perform public.audit('access.' || coalesce(case when p_allow then 'liberar' when not p_allow then 'bloquear' end, 'padrao'), p_kind, p_item::text,
    jsonb_build_object('alvo', p_target_kind, 'alvo_id', p_target));
end $$;

create or replace function public.admin_set_features(p_user uuid, p_blocked text[], p_note text default null)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  insert into public.student_controls (user_id, blocked_features, note, pending, approved_at, updated_at, updated_by)
  values (p_user, coalesce(p_blocked, '{}'), p_note, false, now(), now(), auth.uid())
  on conflict (user_id) do update set blocked_features = excluded.blocked_features, note = excluded.note, pending = false,
    approved_at = coalesce(public.student_controls.approved_at, now()), updated_at = now(), updated_by = auth.uid();
  perform public.audit('aluno.partes', 'student_controls', p_user::text, jsonb_build_object('bloqueadas', p_blocked));
end $$;

/** O que está desligado para mim (o app usa para esconder telas). */
create or replace function public.my_controls()
returns jsonb language sql stable security definer set search_path = ''
as $$
  select jsonb_build_object('blocked', coalesce(c.blocked_features, '{}'), 'pending', coalesce(c.pending, false))
  from (select 1) x left join public.student_controls c on c.user_id = auth.uid()
$$;

/** Contas novas esperando liberação. */
create or replace function public.admin_pending_students()
returns table (id uuid, display_name text, study_profile text, school_year text, created_at timestamptz)
language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  return query select p.id, p.display_name, p.study_profile, p.school_year, p.created_at
    from public.student_controls c join public.profiles p on p.id = c.user_id where c.pending order by p.created_at;
end $$;

/** Libera a conta nova: escolhe as partes bloqueadas, um grupo e se libera todas as aulas e materiais. */
create or replace function public.admin_approve_student(p_user uuid, p_blocked text[] default '{}', p_group uuid default null, p_all_content boolean default false)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  insert into public.student_controls (user_id, blocked_features, pending, approved_at, updated_at, updated_by)
  values (p_user, coalesce(p_blocked, '{}'), false, now(), now(), auth.uid())
  on conflict (user_id) do update set blocked_features = excluded.blocked_features, pending = false, approved_at = now(), updated_at = now(), updated_by = auth.uid();
  if p_group is not null then insert into public.student_group_members (group_id, user_id) values (p_group, p_user) on conflict do nothing; end if;
  if p_all_content then
    insert into public.access_rules (item_kind, item_id, target_kind, target_id, allow)
      select 'lesson', l.id, 'user', p_user, true from public.lessons l where l.status = 'published'
      union all select 'material', m.id, 'user', p_user, true from public.materials m where m.status = 'published' and m.access = 'authenticated'
    on conflict (item_kind, item_id, target_kind, target_id) do update set allow = true;
  end if;
  perform public.audit('aluno.liberar', 'student_controls', p_user::text, jsonb_build_object('bloqueadas', p_blocked, 'grupo', p_group, 'tudo', p_all_content));
end $$;

-- ---------------------------------------------------------------------
-- Novas preferências: mais temas, fundo e temas salvos pelo aluno
-- ---------------------------------------------------------------------
alter table public.user_settings drop constraint if exists user_settings_theme_check;
alter table public.user_settings add constraint user_settings_theme_check check (theme in (
  'auto', 'light', 'dark', 'sepia', 'ocean', 'forest', 'contrast',
  'azul', 'preto', 'rosa', 'roxo', 'verde', 'laranja', 'vermelho', 'lilas', 'cafe', 'meia-noite', 'menta', 'girassol'));
alter table public.user_settings add column if not exists background text not null default 'none'
  check (background in ('none', 'pontos', 'grade', 'ondas', 'degrade', 'estrelas', 'cadernos'));
alter table public.user_settings add column if not exists radius text not null default 'normal' check (radius in ('reto', 'normal', 'redondo'));
alter table public.user_settings add column if not exists font_family text not null default 'padrao' check (font_family in ('padrao', 'arredondada', 'leitura', 'dislexia'));
alter table public.user_settings add column if not exists custom_themes jsonb not null default '[]'::jsonb
  check (jsonb_typeof(custom_themes) = 'array' and jsonb_array_length(custom_themes) <= 12 and pg_column_size(custom_themes) < 8000);
alter table public.user_settings add column if not exists protect_content boolean not null default true;

-- Cronograma: tarefa ligada a uma matéria e com observação
alter table public.plan_tasks add column if not exists subject_id bigint references public.subjects (id) on delete set null;
alter table public.plan_tasks add column if not exists note text check (char_length(note) <= 300);
alter table public.plan_tasks add column if not exists auto boolean not null default false;   -- criada pelo gerador automático

-- ---------------------------------------------------------------------
-- Segurança (RLS) das tabelas novas
-- ---------------------------------------------------------------------
alter table public.lessons enable row level security;
alter table public.student_groups enable row level security;
alter table public.student_group_members enable row level security;
alter table public.access_rules enable row level security;
alter table public.student_controls enable row level security;
alter table public.lesson_progress enable row level security;
alter table public.lesson_access_log enable row level security;
alter table public.doubts enable row level security;

create trigger touch_lessons before update on public.lessons for each row execute function public.touch_updated_at();
create trigger touch_student_groups before update on public.student_groups for each row execute function public.touch_updated_at();
create trigger set_created_by before insert on public.lessons for each row execute function public.set_created_by();
create trigger audit_lessons after insert or update or delete on public.lessons for each row execute function public.audit_trg();
create trigger audit_student_groups after insert or update or delete on public.student_groups for each row execute function public.audit_trg();

grant select, insert, update, delete on public.lessons to authenticated;
create policy lessons_read on public.lessons for select to authenticated
  using ((select public.has_permission('content.manage')) or (status = 'published' and public.item_allowed('lesson', id, access)));
create policy lessons_write on public.lessons for all to authenticated
  using ((select public.has_permission('content.manage'))) with check ((select public.has_permission('content.manage')));

drop policy if exists materials_read on public.materials;
create policy materials_read on public.materials for select to authenticated
  using ((select public.has_permission('content.manage'))
    or ((select public.is_active()) and status = 'published' and access = 'authenticated' and public.item_allowed('material', id, visibility)));

grant select, insert, update, delete on public.student_groups, public.student_group_members to authenticated;
create policy groups_admin on public.student_groups for all to authenticated
  using ((select public.has_permission('users.manage'))) with check ((select public.has_permission('users.manage')));
create policy group_members_admin on public.student_group_members for all to authenticated
  using ((select public.has_permission('users.manage'))) with check ((select public.has_permission('users.manage')));
create policy group_members_self on public.student_group_members for select to authenticated using (user_id = (select auth.uid()));

grant select on public.access_rules, public.student_controls to authenticated;
create policy access_rules_admin on public.access_rules for select to authenticated using ((select public.has_permission('users.manage')));
create policy student_controls_admin on public.student_controls for select to authenticated
  using ((select public.has_permission('users.manage')) or user_id = (select auth.uid()));

grant select, insert, update, delete on public.lesson_progress to authenticated;
create policy lesson_progress_own on public.lesson_progress for all to authenticated
  using (user_id = (select auth.uid()) and (select public.is_active()))
  with check (user_id = (select auth.uid()) and (select public.is_active()));
create policy lesson_progress_admin on public.lesson_progress for select to authenticated using ((select public.has_permission('users.manage')));

grant select on public.lesson_access_log to authenticated;
create policy lesson_log_read on public.lesson_access_log for select to authenticated
  using (user_id = (select auth.uid()) or (select public.has_permission('audit.view')));

grant select, insert, update on public.doubts to authenticated;
create policy doubts_read on public.doubts for select to authenticated
  using ((user_id = (select auth.uid()) and (select public.is_active())) or (select public.has_permission('users.manage')));
create policy doubts_insert on public.doubts for insert to authenticated
  with check (user_id = (select auth.uid()) and (select public.is_active()));
create policy doubts_update on public.doubts for update to authenticated
  using ((user_id = (select auth.uid()) and (select public.is_active())) or (select public.has_permission('users.manage')));

-- Vídeos próprios das aulas: pasta privada; só abre quem tem a aula liberada
insert into storage.buckets (id, name, public, file_size_limit, allowed_mime_types)
values ('aulas', 'aulas', false, 524288000, array['video/mp4', 'video/webm', 'application/pdf', 'image/png', 'image/jpeg'])
on conflict (id) do nothing;
drop policy if exists "aulas: ler se liberada" on storage.objects;
create policy "aulas: ler se liberada" on storage.objects for select to authenticated
  using (bucket_id = 'aulas' and ((select public.has_permission('content.manage')) or exists (
    select 1 from public.lessons l where l.video_provider = 'arquivo' and l.video_ref = name and l.status = 'published' and public.item_allowed('lesson', l.id, l.access))));
drop policy if exists "aulas: enviar (conteúdo)" on storage.objects;
create policy "aulas: enviar (conteúdo)" on storage.objects for insert to authenticated
  with check (bucket_id = 'aulas' and (select public.has_permission('content.manage')));
drop policy if exists "aulas: alterar (conteúdo)" on storage.objects;
create policy "aulas: alterar (conteúdo)" on storage.objects for update to authenticated
  using (bucket_id = 'aulas' and (select public.has_permission('content.manage')));
drop policy if exists "aulas: apagar (conteúdo)" on storage.objects;
create policy "aulas: apagar (conteúdo)" on storage.objects for delete to authenticated
  using (bucket_id = 'aulas' and (select public.has_permission('content.manage')));

-- Funções que o site pode chamar
grant execute on function public.feature_blocked(text, uuid), public.item_allowed(text, uuid, text, uuid), public.open_lesson(uuid),
  public.admin_student_access(uuid), public.admin_set_access(text, uuid, text, uuid, boolean), public.admin_set_features(uuid, text[], text),
  public.my_controls(), public.admin_pending_students(), public.admin_approve_student(uuid, text[], uuid, boolean) to authenticated;

-- O aluno que apaga o histórico também apaga o progresso das aulas
create or replace function public.reset_lesson_progress()
returns void language sql security definer set search_path = ''
as $$ delete from public.lesson_progress where user_id = auth.uid() $$;
grant execute on function public.reset_lesson_progress() to authenticated;
