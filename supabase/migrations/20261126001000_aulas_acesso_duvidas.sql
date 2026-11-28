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
