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
