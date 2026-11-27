-- =====================================================================
-- EDUCA MAIS · PÓS-RESTAURAÇÃO (gerado por scripts/build.mjs)
-- Rode no SQL Editor DEPOIS de restaurar um backup (docs/BANCO_DE_DADOS.md).
-- Recria o que fica fora do esquema "public": o gatilho que cria o perfil
-- no cadastro e as regras de acesso aos arquivos. Pode rodar mais de uma vez.
-- =====================================================================

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users for each row execute function public.handle_new_user();
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

drop policy if exists "imagens: leitura para logados ativos" on storage.objects;
create policy "imagens: leitura para logados ativos" on storage.objects for select to authenticated
  using (bucket_id = 'question-images' and (select public.is_active()));
drop policy if exists "imagens: envio pela equipe" on storage.objects;
create policy "imagens: envio pela equipe" on storage.objects for insert to authenticated
  with check (bucket_id = 'question-images' and (select public.has_permission('content.manage')));
drop policy if exists "imagens: edição pela equipe" on storage.objects;
create policy "imagens: edição pela equipe" on storage.objects for update to authenticated
  using (bucket_id = 'question-images' and (select public.has_permission('content.manage')));
drop policy if exists "imagens: exclusão pela equipe" on storage.objects;
create policy "imagens: exclusão pela equipe" on storage.objects for delete to authenticated
  using (bucket_id = 'question-images' and (select public.has_permission('content.manage')));

drop policy if exists "materiais: leitura com acesso registrado" on storage.objects;
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
drop policy if exists "materiais: envio pela equipe" on storage.objects;
create policy "materiais: envio pela equipe" on storage.objects for insert to authenticated
  with check (bucket_id = 'materials' and (select public.has_permission('content.manage')));
drop policy if exists "materiais: edição pela equipe" on storage.objects;
create policy "materiais: edição pela equipe" on storage.objects for update to authenticated
  using (bucket_id = 'materials' and (select public.has_permission('content.manage')));
drop policy if exists "materiais: exclusão pela equipe" on storage.objects;
create policy "materiais: exclusão pela equipe" on storage.objects for delete to authenticated
  using (bucket_id = 'materials' and (select public.has_permission('content.manage')));

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

drop policy if exists "imagens: envio pelo professor na própria pasta" on storage.objects;
create policy "imagens: envio pelo professor na própria pasta" on storage.objects for insert to authenticated
  with check (bucket_id = 'question-images' and (select public.is_teacher())
              and (storage.foldername(storage.objects.name))[1] = 't'
              and (storage.foldername(storage.objects.name))[2] = (select auth.uid())::text);
drop policy if exists "imagens: exclusão pelo professor na própria pasta" on storage.objects;
create policy "imagens: exclusão pelo professor na própria pasta" on storage.objects for delete to authenticated
  using (bucket_id = 'question-images' and (select public.is_teacher())
         and (storage.foldername(storage.objects.name))[1] = 't'
         and (storage.foldername(storage.objects.name))[2] = (select auth.uid())::text);
