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
