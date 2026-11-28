// Versão 1.2: aulas, liberação por aluno e por grupo, contas novas aguardando liberação,
// partes do app desligadas por aluno e dúvidas com a professora. Tudo conferido no banco real (local).
import { test, describe, before, after } from 'node:test';
import assert from 'node:assert/strict';
import { newUser, newAdmin, sql } from './ambiente.mjs';

let ryan, ana, bia, aula, aulaTodos;
before(async () => {
  ryan = await newAdmin('Ryan');
  ana = await newUser('Ana Aulas');
  bia = await newUser('Bia Aulas');
  const r1 = await ryan.client.from('lessons').insert({ title: 'Funções do 1º grau', subject_id: 3, video_provider: 'youtube', video_ref: 'dQw4w9WgXcQ', status: 'published', pre_codes: ['EM-0001'] }).select().single();
  assert.ifError(r1.error); aula = r1.data;
  const r2 = await ryan.client.from('lessons').insert({ title: 'Boas-vindas', access: 'todos', status: 'published' }).select().single();
  assert.ifError(r2.error); aulaTodos = r2.data;
});
after(() => sql("update public.app_settings set value = 'false'::jsonb where key = 'liberacao_manual'"));

const minhasAulas = async c => (await c.from('lessons').select('id')).data.map(l => l.id);

describe('aulas e liberação', () => {
  test('aula nova nasce "só para liberados": o aluno não vê até a professora liberar', async () => {
    assert.equal(aula.access, 'liberados');
    const ids = await minhasAulas(ana.client);
    assert.ok(!ids.includes(aula.id));
    assert.ok(ids.includes(aulaTodos.id), 'aula aberta para todos aparece');
    const { error } = await ana.client.rpc('open_lesson', { p_lesson: aula.id });
    assert.ok(error, 'nem pela API o aluno abre a aula');
  });

  test('Ryan libera para um aluno: só ele passa a ver, e a abertura fica registrada', async () => {
    const { error } = await ryan.client.rpc('admin_set_access', { p_kind: 'lesson', p_item: aula.id, p_target_kind: 'user', p_target: ana.id, p_allow: true });
    assert.ifError(error);
    assert.ok((await minhasAulas(ana.client)).includes(aula.id));
    assert.ok(!(await minhasAulas(bia.client)).includes(aula.id));
    assert.ifError((await ana.client.rpc('open_lesson', { p_lesson: aula.id })).error);
    const acc = (await ryan.client.rpc('admin_student_access', { p_user: ana.id })).data;
    assert.equal(acc.recent_lessons[0].lesson_id, aula.id);
    assert.equal(acc.lessons.find(l => l.id === aula.id).allowed, true);
  });

  test('liberar por grupo vale para os membros, e o bloqueio individual vence o grupo', async () => {
    const g = (await ryan.client.from('student_groups').insert({ name: 'Turma ENEM teste ' + Date.now() }).select().single()).data;
    assert.ifError((await ryan.client.from('student_group_members').insert({ group_id: g.id, user_id: bia.id })).error);
    assert.ifError((await ryan.client.rpc('admin_set_access', { p_kind: 'lesson', p_item: aula.id, p_target_kind: 'group', p_target: g.id, p_allow: true })).error);
    assert.ok((await minhasAulas(bia.client)).includes(aula.id));
    await ryan.client.rpc('admin_set_access', { p_kind: 'lesson', p_item: aula.id, p_target_kind: 'user', p_target: bia.id, p_allow: false });
    assert.ok(!(await minhasAulas(bia.client)).includes(aula.id));
  });

  test('aluno não cria regras, não se coloca em grupo e não edita aulas', async () => {
    assert.ok((await ana.client.rpc('admin_set_access', { p_kind: 'lesson', p_item: aula.id, p_target_kind: 'user', p_target: bia.id, p_allow: true })).error);
    const g = (await ryan.client.from('student_groups').insert({ name: 'Grupo fechado ' + Date.now() }).select().single()).data;
    assert.ok((await ana.client.from('student_group_members').insert({ group_id: g.id, user_id: ana.id })).error);
    const up = await ana.client.from('lessons').update({ title: 'hack' }).eq('id', aula.id).select();
    assert.equal(up.data?.length || 0, 0);
  });

  test('progresso da aula sincroniza e o Ryan vê quem concluiu', async () => {
    const { error } = await ana.client.from('lesson_progress').upsert({ lesson_id: aula.id, completed_at: new Date().toISOString(), updated_at: new Date().toISOString() }, { onConflict: 'user_id,lesson_id' });
    assert.ifError(error);
    const acc = (await ryan.client.rpc('admin_student_access', { p_user: ana.id })).data;
    assert.ok(acc.progress.some(p => p.lesson_id === aula.id && p.completed_at));
    assert.equal((await bia.client.from('lesson_progress').select('*')).data.length, 0, 'um aluno não vê o progresso do outro');
  });
});

describe('contas novas e partes do app', () => {
  test('com liberação manual, conta nova entra "aguardando" e aparece para o Ryan', async () => {
    sql("update public.app_settings set value = 'true'::jsonb where key = 'liberacao_manual'");
    const nova = await newUser('Carla Nova');
    const mc = (await nova.client.rpc('my_controls')).data;
    assert.equal(mc.pending, true);
    assert.ok((await nova.client.from('lessons').select('id')).data.length === 0, 'não vê nem as aulas abertas');
    const pend = (await ryan.client.rpc('admin_pending_students')).data;
    assert.ok(pend.some(p => p.id === nova.id));
    assert.ifError((await ryan.client.rpc('admin_approve_student', { p_user: nova.id, p_blocked: ['materiais'], p_group: null, p_all_content: true })).error);
    const mc2 = (await nova.client.rpc('my_controls')).data;
    assert.equal(mc2.pending, false); assert.deepEqual(mc2.blocked, ['materiais']);
    assert.ok((await minhasAulas(nova.client)).includes(aula.id), '"liberar tudo" libera as aulas publicadas');
    sql("update public.app_settings set value = 'false'::jsonb where key = 'liberacao_manual'");
  });

  test('parte "aulas" desligada esconde as aulas até no banco', async () => {
    assert.ifError((await ryan.client.rpc('admin_set_features', { p_user: ana.id, p_blocked: ['aulas'], p_note: null })).error);
    assert.equal((await ana.client.from('lessons').select('id')).data.length, 0);
    await ryan.client.rpc('admin_set_features', { p_user: ana.id, p_blocked: [], p_note: null });
    assert.ok((await minhasAulas(ana.client)).includes(aula.id));
  });
});

describe('dúvidas com a professora', () => {
  test('aluno envia, só ele e o Ryan veem, e o Ryan responde', async () => {
    const ins = await ana.client.from('doubts').insert({ body: 'Não entendi juros compostos', subject_id: 3, lesson_id: aula.id }).select().single();
    assert.ifError(ins.error);
    assert.equal((await bia.client.from('doubts').select('id').eq('id', ins.data.id)).data.length, 0);
    assert.ifError((await ryan.client.from('doubts').update({ answer: 'Multiplique por (1 + i) a cada mês.' }).eq('id', ins.data.id)).error);
    const d = (await ana.client.from('doubts').select('*').eq('id', ins.data.id).single()).data;
    assert.equal(d.status, 'respondida'); assert.equal(d.answered_by, ryan.id);
  });

  test('aluno não escreve a própria resposta nem altera a dúvida depois', async () => {
    const ins = (await ana.client.from('doubts').insert({ body: 'Outra dúvida aqui' }).select().single()).data;
    assert.ok((await ana.client.from('doubts').update({ answer: 'eu mesmo' }).eq('id', ins.id)).error);
    assert.ifError((await ana.client.from('doubts').update({ status: 'fechada' }).eq('id', ins.id)).error);
  });

  test('dúvidas desligadas para o aluno são recusadas pelo banco', async () => {
    await ryan.client.rpc('admin_set_features', { p_user: bia.id, p_blocked: ['duvidas'], p_note: null });
    assert.ok((await bia.client.from('doubts').insert({ body: 'Posso perguntar?' })).error);
  });
});
