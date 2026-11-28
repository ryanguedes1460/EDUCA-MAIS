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
