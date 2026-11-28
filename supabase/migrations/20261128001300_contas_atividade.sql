-- =====================================================================
-- Versão 2.1: controle de contas, registro de atividade e contato
--  * Cadastro com tipo de conta pedido (aluno ou professor); a administração
--    escolhe o papel e o que a conta pode usar ao liberar.
--  * Acesso diferenciado para professores (partes prof_* que podem ser desligadas).
--  * Registro de login por aparelho (device_id) e contagem de aparelhos por conta.
--  * Registro de cada ação dos usuários (activity_log), visível só para a administração.
--  * "Fale conosco": mensagens para o professor ou para o desenvolvedor, com tipo
--    (dúvida, erro ou sugestão).
-- =====================================================================

-- ---------------------------------------------------------------------
-- Partes que podem ser desligadas: as do aluno e as do professor
-- ---------------------------------------------------------------------
alter table public.student_controls drop constraint if exists student_controls_blocked_features_check;
alter table public.student_controls add constraint student_controls_blocked_features_check check (blocked_features <@ array[
  'questoes', 'flashcards', 'plano', 'foco', 'anotacoes', 'desempenho', 'resultados', 'redacao', 'aulas', 'materiais', 'turmas', 'duvidas',
  'prof_banco', 'prof_listas', 'prof_turmas', 'prof_pdf', 'prof_pesquisa', 'prof_banco_geral']);
alter table public.student_controls add column if not exists requested_role text not null default 'student'
  check (requested_role in ('student', 'teacher'));

-- Partes de aluno valem para estudantes; partes prof_* valem para professores.
create or replace function public.feature_blocked(p_feature text, p_user uuid default auth.uid())
returns boolean language sql stable security definer set search_path = ''
as $$
  select exists (select 1 from public.student_controls c join public.profiles p on p.id = c.user_id
                  where c.user_id = p_user
                    and ((p.role = 'student' and (c.pending or p_feature = any (c.blocked_features)))
                      or (p.role = 'teacher' and p_feature like 'prof\_%' and p_feature = any (c.blocked_features))))
$$;

-- Conta nova: guarda o tipo pedido no cadastro (aluno ou professor)
create or replace function public.new_student_pending()
returns trigger language plpgsql security definer set search_path = ''
as $$
declare pedido text;
begin
  select case when u.raw_user_meta_data ->> 'account_type' = 'professor' then 'teacher' else 'student' end into pedido
    from auth.users u where u.id = new.id;
  if new.role = 'student' and coalesce((select value = 'true'::jsonb from public.app_settings where key = 'liberacao_manual'), false) then
    insert into public.student_controls (user_id, pending, requested_role) values (new.id, true, coalesce(pedido, 'student'))
    on conflict (user_id) do nothing;
  end if;
  return new;
end $$;

create or replace function public.my_controls()
returns jsonb language sql stable security definer set search_path = ''
as $$
  select jsonb_build_object('blocked', coalesce(c.blocked_features, '{}'), 'pending', coalesce(c.pending, false), 'requested_role', coalesce(c.requested_role, 'student'))
  from (select 1) x left join public.student_controls c on c.user_id = auth.uid()
$$;

/** Contas novas esperando liberação, com e-mail e o tipo de conta pedido. */
drop function if exists public.admin_pending_students();
create or replace function public.admin_pending_students()
returns table (id uuid, display_name text, email text, requested_role text, study_profile text, school_year text, created_at timestamptz)
language plpgsql stable security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  return query select p.id, p.display_name, u.email::text, c.requested_role, p.study_profile, p.school_year, p.created_at
    from public.student_controls c join public.profiles p on p.id = c.user_id join auth.users u on u.id = p.id
   where c.pending order by p.created_at;
end $$;

/**
 * Libera uma conta nova escolhendo o papel (aluno ou professor), as partes bloqueadas,
 * um grupo e se libera todas as aulas e materiais publicados.
 */
create or replace function public.admin_approve_account(p_user uuid, p_role text, p_blocked text[] default '{}', p_group uuid default null, p_all_content boolean default false)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  if p_role not in ('student', 'teacher') then raise exception 'Papel inválido.' using errcode = '22023'; end if;
  if p_user = auth.uid() then raise exception 'Você não pode mudar a própria conta.' using errcode = '42501'; end if;
  perform public.admin_approve_student(p_user, p_blocked, p_group, p_all_content);
  if p_role = 'teacher' then
    perform public.admin_decide_teacher(p_user, true, 'Liberado como professor no cadastro');
  end if;
  perform public.audit('conta.liberar', 'profiles', p_user::text, jsonb_build_object('papel', p_role, 'bloqueadas', p_blocked));
end $$;

/** Recusa uma conta nova: ela fica bloqueada (a pessoa vê o aviso ao entrar). */
create or replace function public.admin_reject_account(p_user uuid, p_reason text default null)
returns void language plpgsql security definer set search_path = ''
as $$
begin
  perform public.require_permission('users.manage');
  if p_user = auth.uid() then raise exception 'Você não pode recusar a própria conta.' using errcode = '42501'; end if;
  update public.profiles set status = 'blocked', blocked_reason = left(coalesce(p_reason, 'Cadastro não aprovado.'), 300) where id = p_user;
  update public.student_controls set pending = false, updated_at = now(), updated_by = auth.uid() where user_id = p_user;
  perform public.audit('conta.recusar', 'profiles', p_user::text, jsonb_build_object('motivo', p_reason));
end $$;

-- ---------------------------------------------------------------------
-- Aparelhos: cada navegador tem um identificador aleatório guardado nele
-- ---------------------------------------------------------------------
alter table public.login_sessions add column if not exists device_id text check (device_id ~ '^[A-Za-z0-9-]{8,64}$');
alter table public.login_sessions add column if not exists platform text check (char_length(platform) <= 60);
create index if not exists login_sessions_device_idx on public.login_sessions (user_id, device_id);
grant insert (id, device, user_agent, device_id, platform) on public.login_sessions to authenticated;

-- ---------------------------------------------------------------------
-- Registro de atividade: cada ação relevante do usuário
-- ---------------------------------------------------------------------
create table if not exists public.activity_log (
  id         bigint generated always as identity primary key,
  user_id    uuid not null default auth.uid() references public.profiles (id) on delete cascade,
  action     text not null check (action ~ '^[a-z][a-z0-9_.]{1,40}$'),
  target     text check (char_length(target) <= 160),
  details    jsonb not null default '{}'::jsonb check (jsonb_typeof(details) = 'object' and pg_column_size(details) <= 2000),
  device_id  text check (device_id ~ '^[A-Za-z0-9-]{8,64}$'),
  screen     text check (char_length(screen) <= 40),
  at         timestamptz not null default now(),   -- quando aconteceu no aparelho (pode ter sido offline)
  created_at timestamptz not null default now()
);
create index if not exists activity_log_user_idx on public.activity_log (user_id, at desc);
create index if not exists activity_log_time_idx on public.activity_log (created_at desc);
create index if not exists activity_log_action_idx on public.activity_log (action, created_at desc);
comment on table public.activity_log is 'Ações dos usuários (login, telas abertas, questões, simulados, aulas...). Só a administração lê; ninguém altera ou apaga pelo app.';

create or replace function public.activity_guard()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  perform public.check_rate('activity', 1500, 3600);
  new.user_id := auth.uid();
  new.created_at := now();
  -- data do aparelho: aceita até 7 dias para trás (ações feitas offline), nunca no futuro
  if new.at is null or new.at > now() + interval '5 minutes' or new.at < now() - interval '7 days' then new.at := now(); end if;
  return new;
end $$;
drop trigger if exists activity_guard on public.activity_log;
create trigger activity_guard before insert on public.activity_log for each row execute function public.activity_guard();

alter table public.activity_log enable row level security;
grant select, insert on public.activity_log to authenticated;
create policy activity_insert on public.activity_log for insert to authenticated
  with check (user_id = (select auth.uid()) and (select public.is_active()));
create policy activity_read on public.activity_log for select to authenticated
  using ((select public.has_permission('users.view')) or (select public.has_permission('audit.view')));

/** Tudo sobre o uso de uma conta: logins, aparelhos e as últimas ações. */
create or replace function public.admin_user_activity(p_user uuid, p_limit integer default 200)
returns jsonb language plpgsql stable security definer set search_path = ''
as $$
begin
  if not (public.has_permission('users.view') or public.has_permission('audit.view')) then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
  return jsonb_build_object(
    'profile', (select jsonb_build_object('id', p.id, 'display_name', p.display_name, 'role', p.role, 'status', p.status, 'created_at', p.created_at, 'last_seen_at', p.last_seen_at, 'email', u.email)
                  from public.profiles p join auth.users u on u.id = p.id where p.id = p_user),
    'logins', coalesce((select jsonb_agg(x order by x.started_at desc) from (
        select s.id, s.started_at, s.last_seen_at, s.ended_at, s.device, s.platform, s.device_id, left(s.user_agent, 160) as user_agent
          from public.login_sessions s where s.user_id = p_user order by s.started_at desc limit 100) x), '[]'),
    'devices', coalesce((select jsonb_agg(x order by x.last_seen desc) from (
        select coalesce(s.device_id, 'ua:' || md5(coalesce(s.user_agent, ''))) as key, max(s.device) as device, max(s.platform) as platform,
               count(*) as logins, min(s.started_at) as first_seen, max(s.last_seen_at) as last_seen,
               bool_or(s.ended_at is null and s.last_seen_at > now() - interval '30 days') as active
          from public.login_sessions s where s.user_id = p_user group by 1) x), '[]'),
    'actions', coalesce((select jsonb_agg(x order by x.at desc) from (
        select a.at, a.action, a.target, a.details, a.screen, a.device_id from public.activity_log a
         where a.user_id = p_user order by a.at desc limit least(greatest(p_limit, 10), 1000)) x), '[]'),
    'counts', (select coalesce(jsonb_object_agg(action, n), '{}') from (select action, count(*) as n from public.activity_log where user_id = p_user and at > now() - interval '30 days' group by action) c)
  );
end $$;

/** Linha do tempo geral: últimas ações de todos os usuários (com filtro opcional). */
create or replace function public.admin_activity_feed(p_limit integer default 200, p_before timestamptz default null, p_action text default null, p_user uuid default null)
returns table (at timestamptz, user_id uuid, display_name text, role text, action text, target text, details jsonb, screen text, device_id text)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not (public.has_permission('users.view') or public.has_permission('audit.view')) then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
  return query select a.at, a.user_id, p.display_name, p.role, a.action, a.target, a.details, a.screen, a.device_id
    from public.activity_log a join public.profiles p on p.id = a.user_id
   where (p_before is null or a.at < p_before) and (p_action is null or a.action like p_action || '%') and (p_user is null or a.user_id = p_user)
   order by a.at desc limit least(greatest(p_limit, 10), 500);
end $$;

/** Resumo por conta: aparelhos diferentes, logins e ações dos últimos 30 dias. */
create or replace function public.admin_accounts_overview()
returns table (user_id uuid, display_name text, email text, role text, status text, devices bigint, active_devices bigint, logins_30d bigint, actions_30d bigint, last_action timestamptz)
language plpgsql stable security definer set search_path = ''
as $$
begin
  if not (public.has_permission('users.view') or public.has_permission('audit.view')) then
    raise exception 'Acesso negado.' using errcode = '42501';
  end if;
  return query select p.id, p.display_name, u.email::text, p.role, p.status,
      (select count(distinct coalesce(s.device_id, md5(coalesce(s.user_agent, '')))) from public.login_sessions s where s.user_id = p.id),
      (select count(distinct coalesce(s.device_id, md5(coalesce(s.user_agent, '')))) from public.login_sessions s where s.user_id = p.id and s.ended_at is null and s.last_seen_at > now() - interval '30 days'),
      (select count(*) from public.login_sessions s where s.user_id = p.id and s.started_at > now() - interval '30 days'),
      (select count(*) from public.activity_log a where a.user_id = p.id and a.at > now() - interval '30 days'),
      (select max(a.at) from public.activity_log a where a.user_id = p.id)
    from public.profiles p join auth.users u on u.id = p.id
   order by 10 desc nulls last, p.display_name limit 500;
end $$;

-- ---------------------------------------------------------------------
-- Fale conosco: para quem vai a mensagem e de que tipo é
-- ---------------------------------------------------------------------
alter table public.doubts add column if not exists recipient text not null default 'professor' check (recipient in ('professor', 'desenvolvedor'));
alter table public.doubts add column if not exists kind text not null default 'duvida' check (kind in ('duvida', 'erro', 'sugestao'));
alter table public.doubts add column if not exists page text check (char_length(page) <= 200);   -- tela em que estava ao relatar um erro
alter table public.doubts add column if not exists device text check (char_length(device) <= 200);
create index if not exists doubts_recipient_idx on public.doubts (recipient, status, created_at);

-- O aluno com "dúvidas" desligado ainda pode relatar erro ao desenvolvedor.
create or replace function public.doubt_guard()
returns trigger language plpgsql security definer set search_path = ''
as $$
begin
  if tg_op = 'INSERT' then
    if public.feature_blocked('duvidas') and not (new.recipient = 'desenvolvedor') then
      raise exception 'O envio de dúvidas está desativado para sua conta.' using errcode = '42501';
    end if;
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
  -- o aluno só pode marcar como lida ou encerrar a própria mensagem
  if new.body is distinct from old.body or new.answer is distinct from old.answer or new.user_id is distinct from old.user_id
     or new.answered_by is distinct from old.answered_by or new.answered_at is distinct from old.answered_at
     or new.recipient is distinct from old.recipient or new.kind is distinct from old.kind
     or (new.status is distinct from old.status and new.status <> 'fechada') then
    raise exception 'Alteração não permitida.' using errcode = '42501';
  end if;
  return new;
end $$;

grant execute on function public.admin_approve_account(uuid, text, text[], uuid, boolean), public.admin_reject_account(uuid, text),
  public.admin_user_activity(uuid, integer), public.admin_activity_feed(integer, timestamptz, text, uuid), public.admin_accounts_overview(),
  public.admin_pending_students() to authenticated;
