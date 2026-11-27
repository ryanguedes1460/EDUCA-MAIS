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
