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
