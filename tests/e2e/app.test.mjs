// Testes de ponta a ponta: navegador Chromium de verdade + Supabase local.
// Cobrem cadastro, confirmação por e-mail, login, recuperação de senha, persistência,
// memória entre aparelhos, offline e sincronização, personalização, modos de tela,
// permissões de administrador e proteção contra XSS.
import { test, describe, before, after } from 'node:test';
import assert from 'node:assert/strict';
import { randomUUID } from 'node:crypto';
import { setup, teardown, newPage, open, go, waitSynced, lastEmail, linkFrom, login, createConfirmedUser, serviceClient, sql, BASE } from './ajuda.mjs';

async function until(fn, timeout = 15000) {
  const t0 = Date.now();
  while (!fn()) { if (Date.now() - t0 > timeout) throw new Error('condição não atingida: ' + fn); await new Promise(r => setTimeout(r, 300)); }
}
const uid = () => randomUUID().slice(0, 8);
before(setup);
after(teardown);

async function answerFirstQuestionWrong(page) {
  await go(page, 'questoes');
  await page.click('[data-action=open]');
  // escolhe uma alternativa errada (a correta da EM-0001 é "7")
  await page.waitForSelector('.opt');
  const opts = page.locator('.opt');
  const n = await opts.count();
  for (let i = 0; i < n; i++) { const t = await opts.nth(i).innerText(); if (!t.includes('7')) { await opts.nth(i).click(); break; } }
  await page.click('#confirmBtn');
  await page.waitForSelector('#qExp:not([hidden])');
  await page.waitForFunction(() => /flashcard/.test(document.querySelector('#toast')?.textContent || ''));
}

describe('fluxo completo do estudante', () => {
  const email = `aluno-${uid()}@teste.educamais.dev`;
  const pass1 = 'primeira123', pass2 = 'segunda456';
  let ctxA, A;

  test('sem conta: estuda, erra uma questão e ela vira flashcard; dados persistem ao recarregar', async () => {
    ({ context: ctxA, page: A } = await newPage());
    await open(A, 'entrar');
    await A.click('#guest');
    await A.waitForSelector('html[data-view="inicio"]');
    await answerFirstQuestionWrong(A);
    assert.match(await A.innerText('#qExp'), /incorreta/);
    await A.reload(); await A.waitForSelector('html[data-ready="1"]');
    await go(A, 'flashcards');
    assert.match(await A.innerText('#view'), /Questões que errei/);
    await go(A, 'desempenho');
    assert.match(await A.innerText('#view'), /questões respondidas/);
  });

  test('cadastro com confirmação por e-mail e entrada na conta, levando os dados do aparelho', async () => {
    await go(A, 'entrar');
    await A.click('[data-tab=cadastro]');
    await A.fill('input[name=name]', 'Joana Teste');
    await A.fill('input[name=email]', email);
    await A.fill('input[name=password]', pass1);
    await A.fill('input[name=password2]', pass1);
    await A.check('input[name=terms]');
    const t0 = Date.now() - 2000;
    await A.click('form button[type=submit]');
    await A.waitForSelector('text=Confira seu e-mail');
    const mail = await lastEmail(email, { after: t0 });
    const link = linkFrom(mail);
    assert.match(link, /type=signup/);
    await A.goto(link);
    // pergunta se quer levar os dados feitos sem conta
    await A.waitForSelector('dialog[open]', { timeout: 15000 });
    assert.match(await A.innerText('dialog[open]'), /registros de estudo/);
    await A.click('dialog[open] [data-ok]');
    await waitSynced(A, 20000);
    assert.match(await A.innerText('#who'), /Joana Teste/);
    const { data: u } = await serviceClient().auth.admin.listUsers();
    const me = u.users.find(x => x.email === email);
    assert.ok(me.email_confirmed_at);
    await until(() => sql(`select count(*) from public.answers where user_id = '${me.id}'`) === '1');
    assert.equal(sql(`select count(*) from public.flashcards where user_id = '${me.id}' and source_question_id is not null`), '1');
    assert.equal(sql(`select is_correct from public.answers where user_id = '${me.id}'`), 'f');
  });

  test('personalização e dados aparecem em outro aparelho (memória na conta)', async () => {
    await go(A, 'aparencia');
    await A.click('[data-action=theme][data-v=dark]');
    await A.click('[data-action=color][data-f=color_primary][data-c="#1f8a4c"]');
    await go(A, 'anotacoes');
    await A.click('[data-action=new]');
    await A.fill('#noteTitle', 'Resumo de Biologia');
    await A.fill('#noteBody', 'Mitocôndria: respiração celular.');
    await A.waitForTimeout(900);
    await waitSynced(A, 20000);

    const { context: ctxB, page: B } = await newPage();
    await login(B, email, pass1);
    await waitSynced(B, 20000);
    assert.equal(await B.getAttribute('html', 'data-theme'), 'dark');
    const brand = await B.evaluate(() => getComputedStyle(document.documentElement).getPropertyValue('--brand').trim());
    assert.equal(brand, '#1f8a4c');
    await go(B, 'anotacoes');
    assert.match(await B.innerText('#view'), /Resumo de Biologia/);
    await go(B, 'flashcards');
    assert.match(await B.innerText('#view'), /Questões que errei/);
    await ctxB.close();

    // Outro usuário não é afetado pela personalização da Joana
    const other = `outro-${uid()}@teste.educamais.dev`;
    await createConfirmedUser('Outro', other, 'senhaOutro1');
    const { context: ctxC, page: C } = await newPage();
    await login(C, other, 'senhaOutro1');
    await waitSynced(C, 20000);
    assert.equal(await C.getAttribute('html', 'data-theme'), 'auto');
    await go(C, 'anotacoes');
    assert.doesNotMatch(await C.innerText('#view'), /Resumo de Biologia/);
    await ctxC.close();
  });

  test('offline: grava sem internet e sincroniza quando a conexão volta', async () => {
    // abre a tela antes (sem service worker neste contexto, o código da tela precisa já estar carregado)
    await go(A, 'plano');
    await A.waitForSelector('#newTask');
    await ctxA.setOffline(true);
    await A.evaluate(() => dispatchEvent(new Event('offline')));
    await A.fill('#newTask input[name=title]', `Revisar química offline ${email}`);
    await A.click('#newTask button[type=submit]');
    await A.waitForFunction(() => /Offline.*pendente/.test(document.querySelector('#syncLabel')?.textContent || ''));
    const label = await A.innerText('#syncLabel');
    assert.match(label, /pendente/);
    const before = sql(`select count(*) from public.plan_tasks where title = 'Revisar química offline ${email}'`);
    assert.equal(before, '0');
    await ctxA.setOffline(false);
    await A.evaluate(() => dispatchEvent(new Event('online')));
    await waitSynced(A, 20000);
    assert.equal(sql(`select count(*) from public.plan_tasks where title = 'Revisar química offline ${email}'`), '1');
  });

  test('alterar senha exige a senha atual; recuperação por e-mail funciona', async () => {
    await go(A, 'conta');
    await A.click('[data-action=password]');
    await A.fill('dialog input[name=cur]', 'senhaErrada1');
    await A.fill('dialog input[name=pw]', pass2);
    await A.fill('dialog input[name=pw2]', pass2);
    await A.click('dialog button[type=submit]');
    await A.waitForSelector('dialog [data-err]:not([hidden])');
    assert.match(await A.innerText('dialog [data-err]'), /senha atual/i);
    await A.click('dialog [data-cancel]');

    // Esqueci a senha (em outro aparelho)
    const { context: ctxR, page: R } = await newPage();
    await open(R, 'entrar');
    await R.click('[data-tab=recuperar]');
    await R.fill('input[name=email]', email);
    const t0 = Date.now() - 2000;
    await R.click('form button[type=submit]');
    await R.waitForSelector('[data-msg].ok');
    const mail = await lastEmail(email, { after: t0, subject: 'Reset' }).catch(() => lastEmail(email, { after: t0 }));
    const link = linkFrom(mail);
    assert.match(link, /type=recovery/);
    await R.goto(link);
    await R.waitForSelector('text=Crie uma nova senha', { timeout: 15000 });
    await R.fill('input[name=password]', pass2);
    await R.fill('input[name=password2]', pass2);
    await R.click('form button[type=submit]');
    await R.waitForSelector('html[data-view="inicio"]', { timeout: 15000 });
    await ctxR.close();

    const { context: ctxO, page: O } = await newPage();
    await open(O, 'entrar');
    await O.fill('input[name=email]', email); await O.fill('input[name=password]', pass1);
    await O.click('form button[type=submit]');
    await O.waitForSelector('[data-msg]:not([hidden])');
    assert.match(await O.innerText('[data-msg]'), /incorretos/);
    await O.fill('input[name=password]', pass2);
    await O.click('form button[type=submit]');
    await O.waitForSelector('html[data-view="inicio"]');
    await ctxO.close();
  });

  test('sair da conta remove os dados pessoais do aparelho', async () => {
    await go(A, 'conta');
    await A.click('[data-action=logout]');
    await A.waitForSelector('html[data-view="entrar"]');
    const dbs = await A.evaluate(async () => (await indexedDB.databases()).map(d => d.name));
    assert.ok(!dbs.some(n => /educa-mais:[0-9a-f]{8}-/.test(n)), 'banco local da conta deveria ter sido apagado: ' + dbs.join(','));
    assert.deepEqual(A.errors, []);
    await ctxA.close();
  });
});

describe('administração e permissões', () => {
  const adminEmail = `ryan-${uid()}@teste.educamais.dev`, studentEmail = `est-${uid()}@teste.educamais.dev`;
  let studentId;
  before(async () => {
    await createConfirmedUser('Ryan', adminEmail, 'adminSenha1');
    sql(`select public.bootstrap_admin('${adminEmail}', 'Ryan')`);
    studentId = await createConfirmedUser('Estudante', studentEmail, 'alunoSenha1');
  });

  test('estudante não vê nem acessa a administração', async () => {
    const { context, page } = await newPage();
    await login(page, studentEmail, 'alunoSenha1');
    assert.equal(await page.locator('#nav a[data-v=admin]').count(), 0);
    await go(page, 'admin');
    assert.equal(await page.getAttribute('html', 'data-view'), 'inicio');
    await context.close();
  });

  test('Ryan acessa o painel, vê estatísticas, publica questão e bloqueia um usuário', async () => {
    const { context, page } = await newPage();
    await login(page, adminEmail, 'adminSenha1');
    assert.match(await page.innerText('#who'), /Ryan/);
    await go(page, 'admin');
    await page.waitForSelector('#adm .stat');
    assert.match(await page.innerText('#adm'), /usuários/);

    // Nova questão pelo editor
    await go(page, 'admin/questoes');
    await page.click('[data-action=newQ]');
    await page.selectOption('dialog [name=subject_id]', '5');
    const tag = uid();
    await page.fill('dialog [name=statement]', `Qual organela produz energia na célula? (teste e2e ${tag})`);
    await page.fill('dialog [name=opt0]', 'Ribossomo');
    await page.fill('dialog [name=opt1]', 'Mitocôndria');
    await page.check('dialog input[name=correct][value="1"]');
    await page.fill('dialog [name=explanation]', 'A mitocôndria realiza a respiração celular.');
    await page.selectOption('dialog [name=status]', 'published');
    await page.click('dialog button[type=submit]');
    await page.waitForSelector('dialog', { state: 'detached' });
    assert.equal(sql(`select count(*) from public.questions where statement like '%(teste e2e ${tag})' and status = 'published'`), '1');

    // Bloqueio
    await go(page, 'admin/usuarios');
    await page.fill('#us input[name=s]', 'Estudante');
    await page.click('#us button');
    await page.waitForTimeout(500);
    await page.click(`[data-action=block][data-id="${studentId}"]`);
    await page.fill('dialog input[name=r]', 'Teste de bloqueio');
    await page.click('dialog button[type=submit]');
    await page.waitForSelector(`[data-action=unblock][data-id="${studentId}"]`);
    assert.equal(sql(`select status from public.profiles where id = '${studentId}'`), 'blocked');
    assert.ok(+sql(`select count(*) from public.audit_log where action = 'user.block' and target_id = '${studentId}'`) >= 1);

    // Estudante bloqueado vê o aviso
    const { context: c2, page: s } = await newPage();
    await open(s, 'entrar');
    await s.fill('input[name=email]', studentEmail); await s.fill('input[name=password]', 'alunoSenha1');
    await s.click('form button[type=submit]');
    await s.waitForSelector('text=Conta bloqueada', { timeout: 15000 });
    assert.match(await s.innerText('#view'), /Teste de bloqueio/);
    await c2.close();

    await page.click(`[data-action=unblock][data-id="${studentId}"]`);
    await page.waitForSelector(`[data-action=block][data-id="${studentId}"]`);
    assert.deepEqual(page.errors, []);
    await context.close();
  });
});

describe('interface, segurança e offline', () => {
  test('modos de dispositivo: detecção automática e escolha manual', async () => {
    const { context, page } = await newPage({ context: { viewport: { width: 390, height: 800 } } });
    await open(page, 'entrar'); await page.click('#guest');
    assert.equal(await page.getAttribute('html', 'data-device'), 'mobile');
    assert.ok(await page.locator('.nav-more').isVisible());
    const overflow = await page.evaluate(() => document.documentElement.scrollWidth > innerWidth);
    assert.equal(overflow, false, 'não pode haver rolagem horizontal no celular');
    await page.setViewportSize({ width: 900, height: 800 }); await page.waitForTimeout(300);
    assert.equal(await page.getAttribute('html', 'data-device'), 'tablet');
    await page.setViewportSize({ width: 1300, height: 800 }); await page.waitForTimeout(300);
    assert.equal(await page.getAttribute('html', 'data-device'), 'desktop');
    await go(page, 'aparencia');
    await page.click('[data-action=device][data-v=mobile]');
    await page.waitForSelector('html[data-device="mobile"]', { timeout: 3000 }).catch(() => {});
    assert.equal(await page.getAttribute('html', 'data-device'), 'mobile');
    await page.waitForTimeout(500); // a tela muda na hora; a gravação no aparelho termina logo depois
    await page.reload(); await page.waitForSelector('html[data-ready="1"]');
    assert.equal(await page.getAttribute('html', 'data-device'), 'mobile', 'preferência salva');
    await page.goto(BASE + '#aparencia'); await page.waitForSelector('html[data-ready="1"]');
    await page.click('[data-action=device][data-v=auto]');
    await page.waitForSelector('html[data-device="desktop"]', { timeout: 3000 }).catch(() => {});
    assert.equal(await page.getAttribute('html', 'data-device'), 'desktop');
    await context.close();
  });

  test('texto malicioso não executa código (XSS)', async () => {
    const { context, page } = await newPage();
    await open(page, 'entrar'); await page.click('#guest');
    await go(page, 'anotacoes');
    await page.click('[data-action=new]');
    await page.fill('#noteTitle', '<img src=x onerror="window.__xss=1">');
    await page.fill('#noteBody', '<script>window.__xss=2</script>');
    await page.waitForTimeout(800);
    await go(page, 'inicio'); await go(page, 'anotacoes');
    assert.equal(await page.evaluate(() => window.__xss), undefined);
    assert.match(await page.innerText('.item-btn'), /<img src=x/);
    await context.close();
  });

  test('funciona offline depois da primeira visita (service worker)', async () => {
    const { context, page } = await newPage({ sw: true });
    await open(page, 'entrar'); await page.click('#guest');
    await page.evaluate(() => navigator.serviceWorker.ready);
    await page.reload(); await page.waitForSelector('html[data-ready="1"]');
    await context.setOffline(true);
    await page.reload(); await page.waitForSelector('html[data-ready="1"]', { timeout: 15000 });
    await go(page, 'questoes');
    assert.match(await page.innerText('#view'), /questões disponíveis/);
    await context.close();
  });

  test('a política de segurança (CSP) não bloqueia nada do próprio app', async () => {
    const { context, page } = await newPage();
    const csp = [];
    page.on('console', m => { if (/Content Security Policy/i.test(m.text())) csp.push(m.text()); });
    await open(page, 'entrar'); await page.click('#guest');
    for (const v of ['questoes', 'flashcards', 'plano', 'foco', 'anotacoes', 'desempenho', 'aparencia', 'conta']) await go(page, v);
    assert.deepEqual(csp, []);
    assert.deepEqual(page.errors, []);
    await context.close();
  });
});
