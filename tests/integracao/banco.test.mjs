// Testes de integração do banco: rodam contra um Supabase real (local),
// passando pela mesma API que o site usa. Verificam permissões (RLS),
// correção no servidor, sincronização, administração e auditoria.
import { test, describe, before } from 'node:test';
import assert from 'node:assert/strict';
import { anonClient, newUser, newAdmin, sql, uuid, Q1, Q1_OK, Q1_BAD, serviceClient } from './ambiente.mjs';

let ana, bia, ryan;
before(async () => {
  ana = await newUser('Ana');
  bia = await newUser('Bia');
  ryan = await newAdmin('Ryan');
});

describe('cadastro e perfil', () => {
  test('cadastro cria perfil "student" e preferências automaticamente', async () => {
    const { data, error } = await ana.client.rpc('my_profile');
    assert.ifError(error);
    assert.equal(data.display_name, 'Ana');
    assert.equal(data.role, 'student');
    assert.equal(data.status, 'active');
    const { data: s } = await ana.client.from('user_settings').select('*').single();
    assert.equal(s.theme, 'auto');
  });

  test('ninguém vira admin pelos metadados do cadastro', async () => {
    const c = anonClient();
    const email = `hack-${uuid().slice(0, 6)}@teste.educamais.dev`;
    await serviceClient().auth.admin.createUser({ email, password: 'senhaTeste123', email_confirm: true, user_metadata: { display_name: 'X', role: 'admin' } });
    await c.auth.signInWithPassword({ email, password: 'senhaTeste123' });
    const { data } = await c.rpc('my_profile');
    assert.equal(data.role, 'student');
  });

  test('usuário não consegue mudar a própria categoria nem a situação', async () => {
    const r1 = await ana.client.from('profiles').update({ role: 'admin' }).eq('id', ana.id);
    assert.ok(r1.error, 'deveria negar mudança de role');
    const r2 = await ana.client.from('profiles').update({ status: 'active' }).eq('id', ana.id);
    assert.ok(r2.error, 'deveria negar mudança de status');
    const ok = await ana.client.from('profiles').update({ display_name: 'Ana Clara' }).eq('id', ana.id);
    assert.ifError(ok.error);
  });

  test('visitante sem login não lê nada além das configurações públicas', async () => {
    const c = anonClient();
    for (const t of ['profiles', 'questions', 'question_options', 'answers', 'flashcards', 'notes', 'audit_log']) {
      const { data, error } = await c.from(t).select('*').limit(1);
      assert.ok(error || data.length === 0, `anon leu ${t}`);
    }
    const { data } = await c.from('app_settings').select('key');
    assert.ok(data.length > 0 && data.every(x => ['aviso_geral', 'cadastro_aberto', 'questoes_por_simulado', 'comentarios_ativos'].includes(x.key)));
  });
});

describe('isolamento entre usuários', () => {
  test('um aluno não vê nem altera anotações e flashcards de outro', async () => {
    const note = { id: uuid(), title: 'Segredo da Ana', body: 'x', updated_at: new Date().toISOString() };
    assert.ifError((await ana.client.from('notes').insert(note)).error);
    const deck = { id: uuid(), name: 'Bio', updated_at: new Date().toISOString() };
    assert.ifError((await ana.client.from('decks').insert(deck)).error);

    const seen = await bia.client.from('notes').select('*').eq('id', note.id);
    assert.equal(seen.data.length, 0);
    const upd = await bia.client.from('notes').update({ title: 'hack' }).eq('id', note.id).select();
    assert.equal(upd.data.length, 0);
    const del = await bia.client.from('notes').delete().eq('id', note.id).select();
    assert.equal(del.data.length, 0);
    const still = await ana.client.from('notes').select('title').eq('id', note.id).single();
    assert.equal(still.data.title, 'Segredo da Ana');

    // Bia tenta gravar um cartão no baralho da Ana (chave composta impede)
    const card = await bia.client.from('flashcards').insert({ id: uuid(), deck_id: deck.id, front: 'a', back: 'b' });
    assert.ok(card.error);
  });

  test('não dá para gravar dados em nome de outro usuário', async () => {
    const r = await bia.client.from('notes').insert({ id: uuid(), user_id: ana.id, title: 'falso' });
    assert.ok(r.error);
  });

  test('upsert com id de outro usuário não sobrescreve', async () => {
    const id = uuid();
    await ana.client.from('notes').insert({ id, title: 'original', updated_at: new Date().toISOString() });
    const r = await bia.client.from('notes').upsert({ id, title: 'tomado', updated_at: new Date(Date.now() + 1000).toISOString() });
    assert.ok(r.error);
    const { data } = await ana.client.from('notes').select('title').eq('id', id).single();
    assert.equal(data.title, 'original');
  });
});

describe('questões e respostas', () => {
  test('aluno lê questões publicadas com alternativas', async () => {
    const { data, error } = await ana.client.from('questions').select('id, statement, question_options(id, position, body, is_correct)').eq('status', 'published');
    assert.ifError(error);
    assert.ok(data.length >= 25);
    assert.ok(data.every(q => q.question_options.length >= 2));
  });

  test('a correção é feita no servidor (o aparelho não consegue mentir)', async () => {
    const id = uuid();
    const r = await ana.client.from('answers').insert({ id, question_id: Q1, option_id: Q1_BAD, is_correct: true });
    assert.ifError(r.error);
    const { data } = await ana.client.from('answers').select('is_correct').eq('id', id).single();
    assert.equal(data.is_correct, false);
    const id2 = uuid();
    await ana.client.from('answers').insert({ id: id2, question_id: Q1, option_id: Q1_OK });
    const { data: d2 } = await ana.client.from('answers').select('is_correct').eq('id', id2).single();
    assert.equal(d2.is_correct, true);
  });

  test('alternativa de outra questão é rejeitada', async () => {
    const r = await ana.client.from('answers').insert({ id: uuid(), question_id: 'e0000000-0000-4000-a000-000000000002', option_id: Q1_OK });
    assert.ok(r.error);
  });

  test('histórico de respostas não pode ser editado nem apagado pelo aluno', async () => {
    const { data } = await ana.client.from('answers').select('id').limit(1);
    const u = await ana.client.from('answers').update({ is_correct: true }).eq('id', data[0].id);
    assert.ok(u.error);
    const d = await ana.client.from('answers').delete().eq('id', data[0].id).select();
    assert.ok(d.error || d.data.length === 0);
  });

  test('reenviar a mesma resposta (sincronização repetida) não duplica', async () => {
    const id = uuid();
    const row = { id, question_id: Q1, option_id: Q1_OK };
    assert.ifError((await ana.client.from('answers').upsert(row, { onConflict: 'id', ignoreDuplicates: true })).error);
    assert.ifError((await ana.client.from('answers').upsert(row, { onConflict: 'id', ignoreDuplicates: true })).error);
    const { count } = await ana.client.from('answers').select('*', { count: 'exact', head: true }).eq('id', id);
    assert.equal(count, 1);
  });

  test('simulado: total de acertos recalculado pelo servidor', async () => {
    const att = uuid();
    assert.ifError((await ana.client.from('exam_attempts').insert({ id: att, total: 2, correct: 2, updated_at: new Date().toISOString() })).error);
    await ana.client.from('answers').insert([
      { id: uuid(), question_id: Q1, option_id: Q1_OK, mode: 'simulado', exam_attempt_id: att },
      { id: uuid(), question_id: Q1, option_id: Q1_BAD, mode: 'simulado', exam_attempt_id: att }]);
    const { data } = await ana.client.from('exam_attempts').select('correct').eq('id', att).single();
    assert.equal(data.correct, 1);
  });

  test('aluno não cria nem edita questões', async () => {
    const r = await ana.client.from('questions').insert({ subject_id: 1, level: 'enem', statement: 'Questão falsa?', explanation: 'x' });
    assert.ok(r.error);
    const u = await ana.client.from('question_options').update({ is_correct: true }).eq('id', Q1_BAD).select();
    assert.ok(u.error || u.data.length === 0);
  });

  test('busca por texto sem acento funciona', async () => {
    const { data, error } = await ana.client.from('questions').select('code').textSearch('search', 'fotossintese', { config: 'portuguese' });
    assert.ifError(error);
    assert.ok(data.some(q => q.code === 'EM-0006'));
  });

  test('comentários: aluno comenta; outro aluno lê; só a equipe oculta', async () => {
    const id = uuid();
    assert.ifError((await ana.client.from('question_comments').insert({ id, question_id: Q1, body: 'Ótima questão!' })).error);
    const r = await bia.client.from('question_comments').select('body').eq('id', id);
    assert.equal(r.data.length, 1);
    const h = await bia.client.from('question_comments').update({ status: 'hidden' }).eq('id', id).select();
    assert.ok(h.error || h.data.length === 0);
    const h2 = await ryan.client.from('question_comments').update({ status: 'hidden' }).eq('id', id).select();
    assert.ifError(h2.error);
    assert.equal(h2.data[0].status, 'hidden');
    const r2 = await bia.client.from('question_comments').select('body').eq('id', id);
    assert.equal(r2.data.length, 0);
  });
});

describe('sincronização: última edição vence', () => {
  test('versão antiga que chega depois não sobrescreve a nova', async () => {
    const id = uuid();
    const t0 = Date.now();
    await ana.client.from('notes').insert({ id, title: 'v1', updated_at: new Date(t0).toISOString() });
    await ana.client.from('notes').upsert({ id, title: 'v3 (nova)', updated_at: new Date(t0 + 2000).toISOString() });
    await ana.client.from('notes').upsert({ id, title: 'v2 (antiga, offline)', updated_at: new Date(t0 + 1000).toISOString() });
    const { data } = await ana.client.from('notes').select('title').eq('id', id).single();
    assert.equal(data.title, 'v3 (nova)');
  });

  test('synced_at é do servidor e avança a cada gravação', async () => {
    const id = uuid();
    const a = await ana.client.from('notes').insert({ id, title: 'a', updated_at: new Date().toISOString() }).select('synced_at').single();
    const b = await ana.client.from('notes').upsert({ id, title: 'b', updated_at: new Date(Date.now() + 10).toISOString() }).select('synced_at').single();
    assert.ok(new Date(b.data.synced_at) > new Date(a.data.synced_at));
  });

  test('exclusão lógica chega aos outros aparelhos', async () => {
    const id = uuid();
    await ana.client.from('notes').insert({ id, title: 'apagar', updated_at: new Date().toISOString() });
    await ana.client.from('notes').upsert({ id, title: 'apagar', deleted_at: new Date().toISOString(), updated_at: new Date(Date.now() + 5).toISOString() });
    const { data } = await ana.client.from('notes').select('deleted_at').eq('id', id).single();
    assert.ok(data.deleted_at);
  });

  test('validações do banco recusam dados inválidos', async () => {
    const bad = await ana.client.from('user_settings').update({ color_primary: 'red;}' }).eq('user_id', ana.id);
    assert.ok(bad.error);
    const bad2 = await ana.client.from('plan_tasks').insert({ id: uuid(), title: 'x', weekday: 9 });
    assert.ok(bad2.error);
    const ok = await ana.client.from('user_settings').update({ color_primary: '#123abc', device_mode: 'tablet', updated_at: new Date(Date.now() + 1000).toISOString() }).eq('user_id', ana.id);
    assert.ifError(ok.error);
  });
});

describe('administração', () => {
  test('aluno não acessa ferramentas do administrador', async () => {
    for (const [fn, args] of [['admin_list_users', {}], ['admin_overview', {}], ['admin_set_user_status', { p_user: bia.id, p_status: 'blocked' }], ['admin_set_user_role', { p_user: ana.id, p_role: 'admin' }]]) {
      const { error } = await ana.client.rpc(fn, args);
      assert.ok(error, `${fn} deveria negar`);
    }
    const a = await ana.client.from('audit_log').select('*');
    assert.equal(a.data.length, 0);
  });

  test('bootstrap_admin não pode ser chamado pelo site', async () => {
    const { error } = await ana.client.rpc('bootstrap_admin', { p_email: ana.email });
    assert.ok(error);
  });

  test('admin Ryan lista usuários e vê estatísticas', async () => {
    const { data: me } = await ryan.client.rpc('my_profile');
    assert.equal(me.role, 'admin');
    assert.equal(me.display_name, 'Ryan');
    const { data, error } = await ryan.client.rpc('admin_list_users', { p_search: 'Bia' });
    assert.ifError(error);
    assert.ok(data.some(u => u.id === bia.id));
    const ov = await ryan.client.rpc('admin_overview');
    assert.ifError(ov.error);
    assert.ok(ov.data.usuarios >= 3);
  });

  test('bloqueio: conta bloqueada perde acesso aos dados; desbloqueio devolve', async () => {
    const u = await newUser('Caio');
    await u.client.from('notes').insert({ id: uuid(), title: 'nota do Caio', updated_at: new Date().toISOString() });
    assert.ifError((await ryan.client.rpc('admin_set_user_status', { p_user: u.id, p_status: 'blocked', p_reason: 'teste' })).error);
    const r = await u.client.from('notes').select('*');
    assert.equal(r.data.length, 0);
    const w = await u.client.from('notes').insert({ id: uuid(), title: 'x' });
    assert.ok(w.error);
    const q = await u.client.from('questions').select('id').limit(1);
    assert.equal(q.data.length, 0);
    const { data: p } = await u.client.rpc('my_profile');
    assert.equal(p.status, 'blocked');
    assert.ifError((await ryan.client.rpc('admin_set_user_status', { p_user: u.id, p_status: 'active' })).error);
    const r2 = await u.client.from('notes').select('*');
    assert.equal(r2.data.length, 1);
  });

  test('admin não consegue bloquear a si mesmo nem mudar a própria categoria', async () => {
    assert.ok((await ryan.client.rpc('admin_set_user_status', { p_user: ryan.id, p_status: 'blocked' })).error);
    assert.ok((await ryan.client.rpc('admin_set_user_role', { p_user: ryan.id, p_role: 'student' })).error);
  });

  test('admin cadastra questão; publicação exige exatamente 1 alternativa correta', async () => {
    const c = ryan.client;
    const { data: q, error } = await c.from('questions').insert({ subject_id: 3, topic_id: 2, level: 'enem', statement: 'Quanto é 2 + 2?', explanation: '2 + 2 = 4.', status: 'draft' }).select().single();
    assert.ifError(error);
    assert.ifError((await c.from('question_options').insert([{ question_id: q.id, position: 0, body: '3' }, { question_id: q.id, position: 1, body: '4' }])).error);
    const pub = await c.from('questions').update({ status: 'published' }).eq('id', q.id);
    assert.ok(pub.error, 'sem alternativa correta não publica');
    await c.from('question_options').update({ is_correct: true }).eq('question_id', q.id).eq('position', 1);
    assert.ifError((await c.from('questions').update({ status: 'published' }).eq('id', q.id)).error);
    const seen = await ana.client.from('questions').select('id').eq('id', q.id);
    assert.equal(seen.data.length, 1);
    const wrongTopic = await c.from('questions').update({ topic_id: 11 }).eq('id', q.id);
    assert.ok(wrongTopic.error, 'conteúdo de outra disciplina é recusado');
  });

  test('rascunho não aparece para alunos', async () => {
    const { data: q } = await ryan.client.from('questions').insert({ subject_id: 1, level: 'medio', statement: 'Rascunho secreto?', explanation: 'Explicação.', status: 'draft' }).select().single();
    const r = await ana.client.from('questions').select('id').eq('id', q.id);
    assert.equal(r.data.length, 0);
  });

  test('auditoria registra ações e não pode ser apagada', async () => {
    const { data, error } = await ryan.client.from('audit_log').select('action, actor_id').order('id', { ascending: false }).limit(50);
    assert.ifError(error);
    const acts = data.map(x => x.action);
    assert.ok(acts.includes('user.block') && acts.includes('user.unblock') && acts.includes('insert'));
    const d = await ryan.client.from('audit_log').delete().gt('id', 0).select();
    assert.ok(d.error || d.data.length === 0);
    assert.ok(sql(`select count(*) from public.audit_log where action = 'admin.bootstrap'`) >= '1');
  });

  test('categorias: admin muda categoria de outro; a categoria admin não perde acesso total', async () => {
    const u = await newUser('Prof');
    assert.ifError((await ryan.client.rpc('admin_set_user_role', { p_user: u.id, p_role: 'teacher' })).error);
    // professor tem só a própria área, não o conteúdo de toda a plataforma
    const { data } = await u.client.rpc('has_permission', { perm: 'teacher.area' });
    assert.equal(data, true);
    const { data: d1 } = await u.client.rpc('has_permission', { perm: 'content.manage' });
    assert.equal(d1, false);
    const { data: d2 } = await u.client.rpc('has_permission', { perm: 'users.manage' });
    assert.equal(d2, false);
    const r = await ryan.client.from('roles').update({ permissions: ['admin.access'] }).eq('id', 'admin');
    assert.ok(r.error);
    const del = await ryan.client.from('roles').delete().eq('id', 'student');
    assert.ok(del.error);
  });

  test('configurações globais: só admin altera; aluno lê as públicas', async () => {
    const a = await ana.client.from('app_settings').update({ value: '"oi"' }).eq('key', 'aviso_geral').select();
    assert.ok(a.error || a.data.length === 0);
    assert.ifError((await ryan.client.from('app_settings').update({ value: 'Manutenção às 22h' }).eq('key', 'aviso_geral')).error);
    const { data } = await ana.client.from('app_settings').select('value').eq('key', 'aviso_geral').single();
    assert.equal(data.value, 'Manutenção às 22h');
    await ryan.client.from('app_settings').update({ value: '' }).eq('key', 'aviso_geral');
  });
});

describe('materiais protegidos', () => {
  test('download só com acesso registrado; link expira; acesso fica no log', async () => {
    const path = `teste/${uuid()}.pdf`;
    const pdf = new Blob(['%PDF-1.4 teste'], { type: 'application/pdf' });
    assert.ifError((await ryan.client.storage.from('materials').upload(path, pdf, { contentType: 'application/pdf' })).error);
    const { data: m, error } = await ryan.client.from('materials').insert({ title: 'Apostila teste', storage_path: path, mime_type: 'application/pdf' }).select().single();
    assert.ifError(error);

    // Sem registrar acesso: não gera link
    const direct = await ana.client.storage.from('materials').createSignedUrl(path, 60);
    assert.ok(direct.error, 'link sem registro deveria falhar');

    const { data: p, error: e2 } = await ana.client.rpc('request_material', { p_material: m.id });
    assert.ifError(e2);
    const signed = await ana.client.storage.from('materials').createSignedUrl(p, 60);
    assert.ifError(signed.error);
    const res = await fetch(signed.data.signedUrl);
    assert.equal(res.status, 200);

    const log = await ryan.client.from('material_access_log').select('*').eq('material_id', m.id);
    assert.equal(log.data.length, 1);
    const other = await bia.client.from('material_access_log').select('*').eq('material_id', m.id);
    assert.equal(other.data.length, 0);
  });

  test('visitante sem login não lê nenhum arquivo', async () => {
    const { data } = await anonClient().storage.from('materials').list('teste');
    assert.equal((data || []).length, 0);
  });
});

describe('limites de uso', () => {
  test('excesso de comentários é bloqueado pelo banco', async () => {
    const u = await newUser('Spam');
    let blocked = false;
    for (let i = 0; i < 35; i++) {
      const r = await u.client.from('question_comments').insert({ id: uuid(), question_id: Q1, body: 'comentário ' + i });
      if (r.error) { blocked = /Limite/.test(r.error.message); break; }
    }
    assert.ok(blocked);
  });
});

describe('dados pessoais (LGPD)', () => {
  test('exportar, apagar histórico e excluir a conta', async () => {
    const u = await newUser('Dani');
    await u.client.from('answers').insert({ id: uuid(), question_id: Q1, option_id: Q1_OK });
    const ex = await u.client.rpc('export_my_data');
    assert.ifError(ex.error);
    assert.equal(ex.data.respostas.length, 1);
    assert.equal(ex.data.conta.email, u.email);
    assert.ifError((await u.client.rpc('reset_my_study_data')).error);
    const { count } = await u.client.from('answers').select('*', { count: 'exact', head: true });
    assert.equal(count, 0);
    assert.ifError((await u.client.rpc('delete_my_account')).error);
    assert.equal(sql(`select count(*) from auth.users where id = '${u.id}'`), '0');
    assert.equal(sql(`select count(*) from public.profiles where id = '${u.id}'`), '0');
  });

  test('o único administrador não consegue se excluir por engano', async () => {
    const admins = +sql(`select count(*) from public.profiles where role = 'admin' and status = 'active'`);
    if (admins === 1) assert.ok((await ryan.client.rpc('delete_my_account')).error);
  });
});

describe('editor de questões do administrador', () => {
  test('salva questão e alternativas numa só transação; troca a correta de uma publicada', async () => {
    const q = { subject_id: 3, topic_id: 2, level: 'enem', difficulty: 2, statement: 'Quanto é 3 + 3?', explanation: '3 + 3 = 6.', status: 'published' };
    const { data: id, error } = await ryan.client.rpc('admin_save_question', { p_question: q, p_options: [{ body: '5' }, { body: '6', is_correct: true }, { body: '7' }] });
    assert.ifError(error);
    const { data: opts } = await ryan.client.from('question_options').select('id, position, body, is_correct').eq('question_id', id).order('position');
    assert.equal(opts.length, 3);
    // inverte a ordem e muda a correta, removendo uma alternativa
    const r = await ryan.client.rpc('admin_save_question', { p_question: { ...q, id }, p_options: [{ id: opts[2].id, body: '7', is_correct: true }, { id: opts[1].id, body: '6' }] });
    assert.ifError(r.error);
    const { data: after } = await ryan.client.from('question_options').select('id, position, is_correct').eq('question_id', id).order('position');
    assert.deepEqual(after.map(o => [o.id, o.is_correct]), [[opts[2].id, true], [opts[1].id, false]]);
    const { data: qq } = await ryan.client.from('questions').select('code').eq('id', id).single();
    assert.match(qq.code, /^Q-[0-9A-F]{8}$/);
  });

  test('publicar sem alternativa correta é recusado e nada é gravado', async () => {
    const r = await ryan.client.rpc('admin_save_question', { p_question: { subject_id: 3, level: 'enem', statement: 'Questão sem gabarito?', explanation: 'Sem gabarito.', status: 'published' }, p_options: [{ body: 'a' }, { body: 'b' }] });
    assert.ok(r.error);
    const { data } = await ryan.client.from('questions').select('id').eq('statement', 'Questão sem gabarito?');
    assert.equal(data.length, 0);
  });

  test('aluno não usa o editor de questões', async () => {
    const r = await ana.client.rpc('admin_save_question', { p_question: { subject_id: 3, level: 'enem', statement: 'Hack?', explanation: 'x.', status: 'draft' }, p_options: [{ body: 'a', is_correct: true }, { body: 'b' }] });
    assert.ok(r.error);
  });

  test('questão já respondida não pode ser apagada (deve ser arquivada)', async () => {
    const d = await ryan.client.from('questions').delete().eq('id', Q1);
    assert.ok(d.error);
    assert.ifError((await ryan.client.from('questions').update({ status: 'archived' }).eq('id', Q1)).error);
    const seen = await ana.client.from('questions').select('id').eq('id', Q1);
    assert.equal(seen.data.length, 0);
    await ryan.client.from('questions').update({ status: 'published' }).eq('id', Q1);
  });
});
