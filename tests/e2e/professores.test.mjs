// Ponta a ponta do sistema de professores: pedido, aprovação pelo Ryan,
// banco próprio, turma, lista enviada, aluno entra pelo código e faz a lista,
// professor vê o resultado. Navegador real + Supabase local. Dados fictícios.
import { test, describe, before, after } from 'node:test';
import assert from 'node:assert/strict';
import { randomUUID } from 'node:crypto';
import { setup, teardown, newPage, open, go, waitSynced, login, createConfirmedUser, sql } from './ajuda.mjs';

const uid = () => randomUUID().slice(0, 8);
before(setup);
after(teardown);

describe('professores, turmas e listas', () => {
  const tag = uid();
  const ryanEmail = `ryan-${tag}@teste.educamais.dev`, profEmail = `prof-${tag}@teste.educamais.dev`, alunoEmail = `aluno-${tag}@teste.educamais.dev`;
  let profId, alunoId, code;
  const statement = `Qual é a unidade básica da vida? (lista e2e ${tag})`;

  before(async () => {
    await createConfirmedUser('Ryan', ryanEmail, 'adminSenha1');
    sql(`select public.bootstrap_admin('${ryanEmail}', 'Ryan')`);
    profId = await createConfirmedUser('Professora Teste', profEmail, 'profSenha12');
    alunoId = await createConfirmedUser('Aluno Teste', alunoEmail, 'alunoSenha1');
  });

  test('pedido para ser professor e aprovação pelo Ryan', async () => {
    const { context, page } = await newPage();
    await login(page, profEmail, 'profSenha12');
    assert.equal(await page.locator('#nav a[data-v=professor]').count(), 0, 'antes da aprovação não há área do professor');
    await go(page, 'professor');
    assert.equal(await page.getAttribute('html', 'data-view'), 'conta');
    await page.click('[data-action=askTeacher]');
    await page.fill('dialog [name=subjects]', 'Biologia');
    await page.fill('dialog [name=message]', 'Dou aula no ensino médio.');
    await page.click('dialog button[type=submit]');
    await page.waitForSelector('text=aguarda a aprovação');
    assert.equal(sql(`select status from public.teacher_requests where user_id = '${profId}'`), 'pending');
    assert.deepEqual(page.errors, []);

    const { context: c2, page: R } = await newPage();
    await login(R, ryanEmail, 'adminSenha1');
    await go(R, 'admin/professores');
    await R.click(`[data-action=tApprove][data-id="${profId}"]`);
    await R.waitForSelector(`[data-action=tReject][data-id="${profId}"]`);
    assert.equal(sql(`select role from public.profiles where id = '${profId}'`), 'teacher');
    assert.deepEqual(R.errors, []);
    await c2.close();
    await context.close();
  });

  test('professora cria questão privada, turma e lista e envia para a turma', async () => {
    const { context, page } = await newPage();
    await login(page, profEmail, 'profSenha12');
    await page.waitForSelector('#nav a[data-v=professor]');
    await go(page, 'professor/questoes');
    await page.click('[data-action=newQ]');
    await page.selectOption('dialog [name=subject_id]', '5');
    await page.fill('dialog [name=statement]', statement);
    await page.fill('dialog [name=opt0]', 'O átomo');
    await page.fill('dialog [name=opt1]', 'A célula');
    await page.check('dialog input[name=correct][value="1"]');
    await page.fill('dialog [name=explanation]', 'A célula é a unidade básica dos seres vivos.');
    await page.selectOption('dialog [name=status]', 'published');
    await page.click('dialog button[type=submit]');
    await page.waitForSelector('dialog', { state: 'detached' });
    await page.waitForSelector(`#myQ >> text=lista e2e ${tag}`);
    assert.equal(sql(`select owner_id || '|' || visibility from public.questions where statement = '${statement}'`), `${profId}|private`);

    await go(page, 'professor/turmas');
    await page.click('[data-action=newClass]');
    await page.fill('dialog [name=name]', `Turma ${tag}`);
    await page.click('dialog button[type=submit]');
    await page.waitForSelector('text=Código para os alunos');
    code = sql(`select join_code from public.classes where name = 'Turma ${tag}'`);
    assert.match(code, /^[0-9A-F]{8}$/);

    await go(page, 'professor/listas');
    await page.click('[data-action=newList]');
    await page.fill('dialog [name=title]', `Lista ${tag}`);
    await page.click('dialog button[type=submit]');
    await page.click('[data-action=addQ]');
    await page.check(`dialog label:has-text("lista e2e ${tag}") input`);
    await page.click('dialog [data-add]');
    await page.waitForSelector('#toast >> text=adicionada');
    await page.click('dialog [data-cancel]');
    await page.waitForSelector('text=Questões (1)');
    await page.click('[data-action=listStatus][data-s=published]');
    await page.waitForSelector('[data-action=listStatus][data-s=draft]');
    await page.click('[data-action=assign]');
    await page.click('dialog button[type=submit]');
    await page.waitForSelector('[data-action=unassign]');
    assert.equal(sql(`select count(*) from public.list_assignments a join public.lists l on l.id = a.list_id where l.title = 'Lista ${tag}' and l.status = 'published'`), '1');
    assert.deepEqual(page.errors, []);
    await context.close();
  });

  test('aluno entra pelo código, faz a lista e o resultado chega à professora', async () => {
    const { context, page } = await newPage();
    await login(page, alunoEmail, 'alunoSenha1');
    // a questão privada não aparece no banco geral
    await go(page, 'questoes');
    await page.fill('[name=q]', `lista e2e ${tag}`);
    await page.waitForSelector('text=Nenhuma questão com esses filtros');

    await go(page, 'turmas');
    await page.fill('#joinForm [name=code]', code.toLowerCase());
    await page.click('#joinForm button[type=submit]');
    await page.waitForSelector(`text=Lista ${tag}`);
    assert.match(await page.innerText('#view'), /Professora Teste/);
    await page.click('[data-action=start]');
    await page.waitForSelector('.opt');
    assert.match(await page.innerText('#qText'), new RegExp(tag));
    await page.click('.opt:has-text("A célula")');
    await page.click('#confirmBtn');
    await page.click('#nextBtn');
    await page.waitForSelector('text=Voltar para Minhas turmas');
    await page.click('text=Voltar para Minhas turmas');
    await page.waitForSelector('text=Feita: 1/1');
    await waitSynced(page);
    assert.equal(sql(`select count(*) from public.exam_attempts e join public.list_assignments a on a.id = e.assignment_id where e.user_id = '${alunoId}' and e.finished_at is not null and e.correct = 1`), '1');

    // aluno desliga o compartilhamento: professora deixa de ver
    const { context: c2, page: P } = await newPage();
    await login(P, profEmail, 'profSenha12');
    await go(P, 'professor/turmas');
    await P.click('[data-action=openClass]');
    await P.waitForSelector('text=Aluno Teste');
    await P.click(`summary:has-text("Lista ${tag}")`);
    assert.match(await P.innerText('#prof'), /1 de 1/);

    await page.uncheck('[data-onchange=share]');
    await page.waitForSelector('text=O professor não vê seus resultados');
    assert.equal(sql(`select share_progress from public.class_members where user_id = '${alunoId}'`), 'f');
    await P.click('[data-action=back]');
    await P.click('[data-action=openClass]');
    await P.waitForSelector('text=Participantes');
    assert.doesNotMatch(await P.innerText('#prof'), /1 de 1/);
    assert.deepEqual(page.errors, []); assert.deepEqual(P.errors, []);
    await c2.close();
    await context.close();
  });

  test('lista aberta com internet pode ser feita sem internet', async () => {
    const { context, page } = await newPage();
    await login(page, alunoEmail, 'alunoSenha1');
    // sem service worker neste contexto: carrega antes o código das telas usadas
    await go(page, 'questoes');
    await page.waitForSelector('#filters');
    await go(page, 'turmas');
    await page.waitForSelector(`text=Lista ${tag}`);
    await context.setOffline(true);
    await page.evaluate(() => dispatchEvent(new Event('offline')));
    await go(page, 'inicio');
    await go(page, 'turmas');
    await page.waitForSelector('text=Sem internet');
    await page.click('[data-action=start]');
    await page.waitForSelector('.opt');
    await page.click('.opt:has-text("O átomo")');
    await page.click('#confirmBtn');
    await page.waitForSelector('#qExp:not([hidden])');
    await page.click('#nextBtn');
    await page.waitForSelector('text=Voltar para Minhas turmas');
    await context.setOffline(false);
    await waitSynced(page, 30000);
    assert.equal(sql(`select count(*) from public.exam_attempts where user_id = '${alunoId}' and assignment_id is not null and finished_at is not null`), '2');
    await context.close();
  });
});
