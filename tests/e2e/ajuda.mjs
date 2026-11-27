// Ajudantes dos testes de ponta a ponta (navegador real + Supabase local).
import { chromium } from 'playwright';
import { env, serviceClient, sql } from '../integracao/ambiente.mjs';
import { startServer } from '../../scripts/servidor.mjs';

export { env, serviceClient, sql };
export const PORT = 8123;
export const BASE = `http://127.0.0.1:${PORT}/`;

let server, browser;
export async function setup() {
  server = await startServer(PORT, { url: env().url, key: env().anon });
  browser = await chromium.launch();
  return browser;
}
export async function teardown() { await browser?.close(); server?.close(); }

/** Novo contexto (como outro navegador/aparelho), com coleta de erros. */
export async function newPage(opts = {}) {
  const context = await browser.newContext({ viewport: { width: 1280, height: 850 }, serviceWorkers: opts.sw ? 'allow' : 'block', ...opts.context });
  const page = await context.newPage();
  page.errors = [];
  page.on('pageerror', e => page.errors.push('pageerror: ' + e.message));
  page.on('console', m => { if (m.type() === 'error' && !/Failed to load resource|net::ERR|status of 4\d\d/.test(m.text())) page.errors.push(m.text()); });
  return { context, page };
}

export async function open(page, hash = '') {
  await page.goto(BASE + (hash ? '#' + hash : ''));
  await page.waitForSelector('html[data-ready="1"]', { timeout: 15000 });
}

export async function go(page, hash) {
  await page.evaluate(h => { location.hash = h; }, hash);
  await page.waitForTimeout(300);
  // Com o banco grande, a primeira tela depois de abrir o app pode levar um pouco mais para montar
  await page.waitForFunction(() => (document.querySelector('#view')?.innerText || '').trim().length > 0, null, { timeout: 15000 }).catch(() => {});
  await page.waitForTimeout(100);
}

/** Espera a sincronização terminar (chip "Sincronizado" sem pendências). */
export async function waitSynced(page, timeout = 15000) {
  await page.waitForFunction(() => /^Sincronizado$/.test(document.querySelector('#syncLabel')?.textContent || ''), null, { timeout });
}

// ---------- E-mails (Mailpit do Supabase local) ----------
export async function lastEmail(to, { subject = '', after = 0, timeout = 15000 } = {}) {
  const t0 = Date.now();
  while (Date.now() - t0 < timeout) {
    const r = await fetch(`${env().mail}/api/v1/search?query=${encodeURIComponent(`to:"${to}"`)}`).then(r => r.json()).catch(() => null);
    const msg = r?.messages?.find(m => new Date(m.Created).getTime() >= after && (!subject || m.Subject.includes(subject)));
    if (msg) {
      const full = await fetch(`${env().mail}/api/v1/message/${msg.ID}`).then(r => r.json());
      return full;
    }
    await new Promise(r => setTimeout(r, 500));
  }
  throw new Error('e-mail não chegou para ' + to);
}
export function linkFrom(mail) {
  const m = (mail.HTML || mail.Text).match(/href="([^"]+verify[^"]+)"/) || (mail.Text || '').match(/(http\S+verify\S+)/);
  return m[1].replace(/&amp;/g, '&');
}

export async function login(page, email, password) {
  await open(page, 'entrar');
  await page.fill('input[name=email]', email);
  await page.fill('input[name=password]', password);
  await page.click('form button[type=submit]');
  await page.waitForSelector('html[data-view="inicio"]', { timeout: 15000 });
}

export async function createConfirmedUser(name, email, password) {
  const { data, error } = await serviceClient().auth.admin.createUser({ email, password, email_confirm: true, user_metadata: { display_name: name } });
  if (error) throw error;
  return data.user.id;
}
