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
