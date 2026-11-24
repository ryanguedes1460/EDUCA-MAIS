// Professores, bancos de questões individuais, turmas e listas (Supabase local real).
import { test, describe, before } from 'node:test';
import assert from 'node:assert/strict';
import { newUser, newAdmin, sql, uuid, Q1 } from './ambiente.mjs';

const opts = (correct = 1) => [0, 1, 2, 3].map(i => ({ body: 'Alternativa ' + i, is_correct: i === correct }));
const question = (statement, extra = {}) => ({ subject_id: 5, level: 'medio', difficulty: 3, statement, explanation: 'Resolução da questão de teste.', status: 'published', ...extra });

async function makeTeacher(ryan, name) {
  const u = await newUser(name);
  assert.ifError((await u.client.rpc('request_teacher', { p_message: 'Dou aula de biologia', p_subjects: 'Biologia' })).error);
  assert.ifError((await ryan.client.rpc('admin_decide_teacher', { p_user: u.id, p_approve: true, p_note: null })).error);
  return u;
}

describe('professores e bancos individuais', () => {
  let ryan, profA, profB, aluno, outro, qA, classId, code, listId, assignId;

  before(async () => {
    ryan = await newAdmin('Ryan');
    aluno = await newUser('Aluno Turma');
    outro = await newUser('Aluno de Fora');
  });

  test('ninguém vira professor sozinho; o Ryan aprova o pedido', async () => {
    const u = await newUser('Candidata');
    assert.ifError((await u.client.rpc('request_teacher', { p_message: 'Quero ensinar', p_subjects: 'Química' })).error);
    const self = await u.client.from('teacher_requests').update({ status: 'approved' }).eq('user_id', u.id).select();
    assert.ok(self.error || self.data.length === 0, 'aluno não aprova o próprio pedido');
    assert.ok((await u.client.rpc('admin_decide_teacher', { p_user: u.id, p_approve: true })).error, 'aluno não chama a função do admin');
    assert.equal((await u.client.rpc('has_permission', { perm: 'teacher.area' })).data, false);
    const { data: reqs } = await ryan.client.rpc('admin_list_teacher_requests');
    assert.ok(reqs.some(r => r.user_id === u.id && r.status === 'pending'));
    assert.ifError((await ryan.client.rpc('admin_decide_teacher', { p_user: u.id, p_approve: true, p_note: 'ok' })).error);
    assert.equal((await u.client.rpc('has_permission', { perm: 'teacher.area' })).data, true);
    assert.equal(sql(`select count(*) from public.audit_log where action = 'teacher.approve' and target_id = '${u.id}'`), '1');
    profA = await makeTeacher(ryan, 'Professora A');
    profB = await makeTeacher(ryan, 'Professor B');
  });

  test('questão do professor nasce privada e pertence só a ele', async () => {
    const { data, error } = await profA.client.rpc('save_question', { p_question: question('Qual organela faz fotossíntese? (banco da A)', { visibility: 'public' }), p_options: opts(2) });
    assert.ifError(error);
    qA = data;
    assert.equal(sql(`select owner_id || '|' || visibility from public.questions where id = '${qA}'`), `${profA.id}|private`, 'professor não publica no banco geral sozinho');
    const own = await profA.client.from('questions').select('id, question_options(id, is_correct)').eq('id', qA).single();
    assert.ifError(own.error); assert.equal(own.data.question_options.length, 4);

    // professor B não vê, não altera, não apaga
    assert.equal((await profB.client.from('questions').select('id').eq('id', qA)).data.length, 0);
    assert.equal((await profB.client.from('question_options').select('id').eq('question_id', qA)).data.length, 0);
    assert.ok((await profB.client.rpc('save_question', { p_question: question('invadido pelo B', { id: qA }), p_options: opts() })).error);
    const upd = await profB.client.from('questions').update({ statement: 'invadido pelo B' }).eq('id', qA).select();
    assert.equal(upd.data.length, 0);
    const del = await profB.client.from('questions').delete().eq('id', qA).select();
    assert.equal(del.data.length, 0);
    assert.match(sql(`select statement from public.questions where id = '${qA}'`), /banco da A/);

    // aluno também não vê a questão privada
    assert.equal((await aluno.client.from('questions').select('id').eq('id', qA)).data.length, 0);
    // nem consegue responder a ela
    const opt = sql(`select id from public.question_options where question_id = '${qA}' and position = 0`);
    const ans = await aluno.client.from('answers').insert({ id: uuid(), question_id: qA, option_id: opt, answered_at: new Date().toISOString() });
    assert.ok(ans.error, 'resposta a questão privada é recusada');
  });

  test('professor não troca o dono nem torna a questão pública pela API', async () => {
    await profA.client.from('questions').update({ owner_id: profB.id, visibility: 'public' }).eq('id', qA);
    assert.equal(sql(`select owner_id || '|' || visibility from public.questions where id = '${qA}'`), `${profA.id}|private`);
  });

  test('Ryan vê e corrige o banco de qualquer professor, com versão e autor registrados', async () => {
    const seen = await ryan.client.from('questions').select('id, owner_id').eq('id', qA).single();
    assert.equal(seen.data.owner_id, profA.id);
    assert.ifError((await ryan.client.rpc('save_question', { p_question: question('Qual organela faz fotossíntese? (corrigida pelo Ryan)', { id: qA, visibility: 'private' }), p_options: opts(1) })).error);
    const revs = sql(`select string_agg(version || ':' || changed_by, ',' order by version) from public.question_revisions where question_id = '${qA}'`);
    assert.equal(revs, `1:${profA.id},2:${ryan.id}`);
    assert.equal(sql(`select snapshot->'options'->1->>'is_correct' from public.question_revisions where question_id = '${qA}' and version = 2`), 'true');
    assert.equal(sql(`select updated_by from public.questions where id = '${qA}'`), ryan.id);
    assert.equal(sql(`select owner_id from public.questions where id = '${qA}'`), profA.id, 'continua no banco da professora');
    assert.ok(Number(sql(`select count(*) from public.audit_log where actor_id = '${ryan.id}' and target_table = 'questions' and target_id = '${qA}'`)) >= 1);
    // a professora vê o histórico da própria questão; o B não
    assert.equal((await profA.client.from('question_revisions').select('version').eq('question_id', qA)).data.length, 2);
    assert.equal((await profB.client.from('question_revisions').select('version').eq('question_id', qA)).data.length, 0);
  });

  test('turma: aluno entra pelo código; outro professor não enxerga', async () => {
    const c = await profA.client.from('classes').insert({ name: '3º ano A' }).select().single();
    assert.ifError(c.error);
    classId = c.data.id; code = c.data.join_code;
    assert.ok((await aluno.client.from('classes').insert({ name: 'turma do aluno' })).error, 'aluno não cria turma');
    assert.equal((await aluno.client.rpc('join_class', { p_code: 'ZZZZZZZZ' })).error?.message, 'Código de turma não encontrado.');
    assert.ifError((await aluno.client.rpc('join_class', { p_code: code.toLowerCase() })).error);
    const mine = await aluno.client.rpc('my_classes');
    assert.equal(mine.data[0].name, '3º ano A'); assert.equal(mine.data[0].teacher_name, 'Professora A');
    assert.equal((await profB.client.from('classes').select('id').eq('id', classId)).data.length, 0);
    assert.ok((await profB.client.rpc('class_roster', { p_class: classId })).error);
    const roster = await profA.client.rpc('class_roster', { p_class: classId });
    assert.deepEqual(roster.data.map(r => r.display_name), ['Aluno Turma']);
    // o aluno de fora não vê a turma
    assert.equal((await outro.client.from('classes').select('id').eq('id', classId)).data.length, 0);
  });

  test('lista: só questões próprias ou do banco geral; aluno da turma recebe e responde', async () => {
    const l = await profA.client.from('lists').insert({ title: 'Lista de citologia', mode: 'lista' }).select().single();
    assert.ifError(l.error); listId = l.data.id;
    assert.ifError((await profA.client.from('list_items').insert([{ list_id: listId, question_id: qA, position: 0 }, { list_id: listId, question_id: Q1, position: 1 }])).error);
    const { data: qB } = await profB.client.rpc('save_question', { p_question: question('Questão privada do professor B'), p_options: opts() });
    assert.ok((await profA.client.from('list_items').insert({ list_id: listId, question_id: qB, position: 2 })).error, 'não usa questão de outro professor');
    assert.ok((await profB.client.from('list_items').insert({ list_id: listId, question_id: qB, position: 2 })).error, 'B não mexe na lista da A');

    // rascunho ainda não aparece para o aluno
    const a = await profA.client.from('list_assignments').insert({ list_id: listId, class_id: classId, due_at: new Date(Date.now() + 7 * 864e5).toISOString() }).select().single();
    assert.ifError(a.error); assignId = a.data.id;
    assert.equal((await aluno.client.rpc('my_assignments')).data.length, 0);
    assert.ifError((await profA.client.from('lists').update({ status: 'published' }).eq('id', listId)).error);
    const asg = await aluno.client.rpc('my_assignments');
    assert.equal(asg.data.length, 1); assert.equal(Number(asg.data[0].n_questions), 2);

    // agora o aluno lê a questão privada (só por estar na lista) e responde
    const q = await aluno.client.from('questions').select('id, question_options(id, position, is_correct)').eq('id', qA).single();
    assert.ifError(q.error);
    const attempt = uuid();
    assert.ifError((await aluno.client.from('exam_attempts').insert({ id: attempt, title: 'Lista de citologia', total: 2, assignment_id: assignId })).error);
    const right = q.data.question_options.find(o => o.position === 1).id;
    assert.ifError((await aluno.client.from('answers').insert({ id: uuid(), question_id: qA, option_id: right, exam_attempt_id: attempt, is_correct: false, answered_at: new Date().toISOString() })).error);
    assert.ifError((await aluno.client.from('exam_attempts').update({ finished_at: new Date().toISOString() }).eq('id', attempt)).error);

    // o aluno de fora continua sem acesso
    assert.equal((await outro.client.from('questions').select('id').eq('id', qA)).data.length, 0);
    assert.ok((await outro.client.from('exam_attempts').insert({ id: uuid(), title: 'x', total: 1, assignment_id: assignId })).error);
    assert.equal((await outro.client.from('lists').select('id').eq('id', listId)).data.length, 0);
  });

  test('resultados: professor vê só quem aceitou compartilhar; não liga isso pelo aluno', async () => {
    let r = await profA.client.rpc('class_results', { p_class: classId });
    assert.ifError(r.error);
    const row = r.data.find(x => x.user_id === aluno.id);
    assert.equal(row.correct, 1, 'acerto corrigido no servidor');
    assert.ok((await profB.client.rpc('class_results', { p_class: classId })).error);

    assert.ifError((await aluno.client.from('class_members').update({ share_progress: false }).eq('class_id', classId).eq('user_id', aluno.id)).error);
    r = await profA.client.rpc('class_results', { p_class: classId });
    assert.equal(r.data.filter(x => x.user_id === aluno.id).length, 0);
    await profA.client.from('class_members').update({ share_progress: true }).eq('class_id', classId).eq('user_id', aluno.id);
    assert.equal(sql(`select share_progress from public.class_members where class_id = '${classId}' and user_id = '${aluno.id}'`), 'f');

    // professor remove o aluno; ele não volta sozinho
    assert.ifError((await profA.client.from('class_members').update({ status: 'removed' }).eq('class_id', classId).eq('user_id', aluno.id)).error);
    assert.ok((await aluno.client.rpc('join_class', { p_code: code })).error);
    assert.equal((await aluno.client.from('questions').select('id').eq('id', qA)).data.length, 0, 'sem turma, sem acesso à questão da lista');
  });

  test('pedido de correção e envio ao banco geral passam pelo Ryan', async () => {
    const c = await profA.client.from('correction_requests').insert({ question_id: Q1, message: 'A resolução tem um erro de digitação.' }).select().single();
    assert.ifError(c.error);
    assert.ok((await aluno.client.from('correction_requests').insert({ question_id: Q1, message: 'aluno não pede por aqui' })).error);
    assert.equal((await profB.client.from('correction_requests').select('id').eq('id', c.data.id)).data.length, 0);
    assert.ifError((await ryan.client.rpc('admin_resolve_correction', { p_id: c.data.id, p_status: 'resolved', p_response: 'Corrigido, obrigado.' })).error);
    assert.equal((await profA.client.from('correction_requests').select('status').eq('id', c.data.id).single()).data.status, 'resolved');

    assert.ifError((await profA.client.rpc('request_public', { p_question: qA })).error);
    assert.equal(sql(`select visibility from public.questions where id = '${qA}'`), 'pending_public');
    assert.equal((await outro.client.from('questions').select('id').eq('id', qA)).data.length, 0, 'ainda não está no banco geral');
    assert.ok((await profA.client.rpc('admin_set_visibility', { p_question: qA, p_visibility: 'public' })).error);
    assert.ifError((await ryan.client.rpc('admin_set_visibility', { p_question: qA, p_visibility: 'public' })).error);
    assert.equal((await outro.client.from('questions').select('id').eq('id', qA)).data.length, 1, 'agora todos os alunos veem');
    assert.ok((await profA.client.rpc('save_question', { p_question: question('mudança depois de pública', { id: qA }), p_options: opts() })).error,
      'depois de pública, só a equipe altera (o professor pede correção)');
  });

  test('Ryan encontra duplicadas e lista professores; questão respondida não é apagada', async () => {
    await ryan.client.rpc('save_question', { p_question: question('Qual organela faz fotossintese? (corrigida pelo Ryan!)', { visibility: 'private' }), p_options: opts() });
    const dup = await ryan.client.rpc('admin_find_duplicates', { p_min: 0.6 });
    assert.ifError(dup.error);
    assert.ok(dup.data.some(d => d.a === qA || d.b === qA));
    assert.ok((await profA.client.rpc('admin_find_duplicates', { p_min: 0.6 })).error);

    const t = await ryan.client.rpc('admin_list_users', { p_search: '', p_limit: 200, p_offset: 0, p_role: 'teacher' });
    assert.ifError(t.error);
    assert.ok(t.data.every(u => u.role === 'teacher') && t.data.some(u => u.id === profA.id));
    const ov = await ryan.client.rpc('admin_teacher_overview');
    assert.ok(ov.data.professores >= 2);

    assert.ok((await ryan.client.from('questions').delete().eq('id', qA)).error, 'questão já respondida não é apagada: deve ser arquivada');
    const { data: qNew } = await profB.client.rpc('save_question', { p_question: question('Questão nova do B que será apagada'), p_options: opts() });
    const d1 = await profB.client.from('questions').delete().eq('id', qNew).select();
    assert.equal(d1.data.length, 1, 'professor apaga questão própria sem respostas');
  });
  test('imagens: professor envia só na própria pasta; imagem privada só para quem vê a questão', async () => {
    const png = new Blob([Uint8Array.from([137, 80, 78, 71, 13, 10, 26, 10, 0, 0, 0, 0])], { type: 'image/png' });
    const mine = `t/${profA.id}/${uuid()}.png`;
    assert.ifError((await profA.client.storage.from('question-images').upload(mine, png, { contentType: 'image/png' })).error);
    assert.ok((await profA.client.storage.from('question-images').upload(`t/${profB.id}/${uuid()}.png`, png, { contentType: 'image/png' })).error, 'não grava na pasta de outro professor');
    assert.ok((await profA.client.storage.from('question-images').upload(`q/${uuid()}.png`, png, { contentType: 'image/png' })).error, 'pasta da equipe é só da equipe');
    assert.ok((await aluno.client.storage.from('question-images').upload(`t/${aluno.id}/${uuid()}.png`, png, { contentType: 'image/png' })).error, 'aluno não envia imagens');

    const { data: qi } = await profA.client.rpc('save_question', { p_question: question('Questão privada com imagem', { image_path: mine }), p_options: opts() });
    assert.ok(qi);
    assert.ifError((await profA.client.storage.from('question-images').download(mine)).error, 'dono lê');
    assert.ifError((await ryan.client.storage.from('question-images').download(mine)).error, 'Ryan lê');
    assert.ok((await profB.client.storage.from('question-images').download(mine)).error, 'outro professor não lê');
    assert.ok((await outro.client.storage.from('question-images').download(mine)).error, 'aluno sem a lista não lê');
  });
});
