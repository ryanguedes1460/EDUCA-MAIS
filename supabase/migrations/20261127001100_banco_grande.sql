-- Versão 1.3: banco com mais de 10 mil questões geradas (ids e1000000-...).
-- 1) Índice de trigramas para a busca de parecidas não varrer a tabela inteira.
-- 2) A busca de duplicadas não compara as questões geradas entre si: elas seguem modelos
--    (mesma ideia com outros números) e seriam "parecidas" aos milhares. Compara cada questão
--    escrita à mão (professores, Ryan, conteúdo inicial) com todas as outras.
create index if not exists questions_statement_trgm_idx
  on public.questions using gin (public.sem_acento(statement) extensions.gin_trgm_ops);

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
    join public.questions q2 on q2.id <> q1.id
     and public.sem_acento(q1.statement) operator(extensions.%) public.sem_acento(q2.statement)
     and (q2.id::text like 'e1000000-%' or q1.id < q2.id)
   where q1.id::text not like 'e1000000-%'
     and q1.status <> 'archived' and q2.status <> 'archived'
   order by 7 desc limit 100;
end $$;
