// Educa Mais · inicialização do app, navegação e estrutura da tela.
import { $, html, setHTML, toast, confirmDialog, actions, debounce } from './core/util.js';
import { icon } from './core/icones.js';
import { configured, configError } from './core/backend.js';
import * as auth from './core/auth.js';
import * as store from './core/store.js';
import * as sync from './core/sync.js';
import * as aparencia from './core/aparencia.js';
import { ensureSeed } from './core/conteudo.js';
import { migrateV02 } from './lib/migrar-v02.js';
import { on, emit } from './core/bus.js';
import * as controles from './core/controles.js';
import * as protecao from './core/protecao.js';

export const VERSION = '1.2.0-dev';

const NAV = [
  { id: 'inicio', name: 'Início', mobile: true },
  { id: 'questoes', name: 'Questões', mobile: true },
  { id: 'flashcards', name: 'Flashcards', mobile: true },
  { id: 'plano', name: 'Plano e metas' },
  { id: 'foco', name: 'Foco' },
  { id: 'anotacoes', name: 'Anotações' },
  { id: 'desempenho', name: 'Desempenho', mobile: true },
  { id: 'resultados', name: 'Resultados' },
  { id: 'redacao', name: 'Temas de redação' },
  { id: 'aulas', name: 'Aulas', needs: 'login' },
  { id: 'materiais', name: 'Materiais', needs: 'login' },
  { id: 'duvidas', name: 'Tirar dúvidas', needs: 'login' },
  { id: 'turmas', name: 'Minhas turmas', needs: 'login' },
  { id: 'professor', name: 'Área do professor', needs: 'teacher.area' },
  { sep: true },
  { id: 'conta', name: 'Minha conta' },
  { id: 'aparencia', name: 'Aparência' },
  { id: 'admin', name: 'Administração', needs: 'admin.access' }
];
const VIEWS = {
  entrar: () => import('./views/entrar.js'), inicio: () => import('./views/inicio.js'), questoes: () => import('./views/questoes.js'),
  flashcards: () => import('./views/flashcards.js'), plano: () => import('./views/plano.js'), foco: () => import('./views/foco.js'),
  anotacoes: () => import('./views/anotacoes.js'), desempenho: () => import('./views/desempenho.js'), materiais: () => import('./views/materiais.js'),
  conta: () => import('./views/conta.js'), aparencia: () => import('./views/aparencia.js'), admin: () => import('./views/admin.js'),
  turmas: () => import('./views/turmas.js'), professor: () => import('./views/professor.js'),
  aulas: () => import('./views/aulas.js'), resultados: () => import('./views/resultados.js'), redacao: () => import('./views/redacao.js'), duvidas: () => import('./views/duvidas.js')
};

const visible = n => (!n.needs || (n.needs === 'login' ? auth.isLogged() : auth.can(n.needs))) && !controles.isBlocked(n.id);

function renderShell() {
  const items = NAV.filter(n => n.sep || visible(n));
  setHTML($('#app'), html`
  <div class="app">
    <aside class="side">
      <a class="logo" href="#inicio"><span class="logo-mark" aria-hidden="true">E</span><span class="logo-text">Educa Mais</span></a>
      <nav class="nav" aria-label="Seções" id="nav">
        ${items.map(n => n.sep ? html`<div class="sep" role="separator"></div>` : html`<a href="#${n.id}" data-v="${n.id}" ${n.mobile ? html`data-mobile` : ''}>${icon(n.id)}<span>${n.name}</span></a>`)}
        <button class="nav-more" type="button" data-action="more" aria-haspopup="dialog">${icon('mais')}<span>Mais</span></button>
      </nav>
      <div class="side-foot"><span id="syncFoot"></span><span>Versão ${VERSION}</span></div>
    </aside>
    <main>
      <div class="wrap">
        <div class="topbar">
          <a class="logo mobile-logo" href="#inicio"><span class="logo-mark" aria-hidden="true">E</span>Educa Mais</a>
          <div class="row" id="topStatus"></div>
          <div class="who" id="who"></div>
        </div>
        <div id="banners"></div>
        <div id="view" tabindex="-1"></div>
      </div>
    </main>
  </div>`);
  actions($('#app'), { more: openMore, sync: () => sync.syncNow({ content: true }).then(() => toast('Sincronizado')), entrar: () => { location.hash = '#entrar'; } });
  renderWho(); renderStatus(sync.status); renderBanners();
}

function openMore() {
  const items = NAV.filter(n => !n.sep && !n.mobile && visible(n));
  const d = document.createElement('div');
  d.className = 'sheet'; d.setAttribute('role', 'dialog'); d.setAttribute('aria-label', 'Mais seções');
  setHTML(d, html`<div class="sheet-in">${items.map(n => html`<a href="#${n.id}">${icon(n.id)}${n.name}</a>`)}</div>`);
  d.onclick = e => { if (e.target === d || e.target.closest('a')) d.remove(); };
  document.body.appendChild(d);
}

function renderWho() {
  const el = $('#who'); if (!el) return;
  if (auth.isLogged()) {
    const name = auth.state.profile?.display_name || auth.state.user.email;
    setHTML(el, html`<a href="#conta" class="row" style="text-decoration:none;color:inherit;gap:8px"><span class="avatar" aria-hidden="true">${(name[0] || '?').toUpperCase()}</span><span class="hide-mobile"><b>${name}</b>${auth.state.profile?.role === 'admin' ? html` <span class="chip on">Admin</span>` : ''}</span></a>`);
  } else if (configured) {
    setHTML(el, html`<button class="btn sm" type="button" data-action="entrar">Entrar ou criar conta</button>`);
  } else setHTML(el, '');
}

const STATUS = {
  local: ['Modo local', 'Os dados ficam só neste aparelho (servidor ainda não configurado).', ''],
  guest: ['Sem conta', 'Os dados ficam só neste aparelho. Entre para salvar na nuvem.', 'warn'],
  idle: ['Sincronizado', 'Tudo salvo na sua conta.', 'good'],
  syncing: ['Sincronizando…', 'Enviando e recebendo dados.', ''],
  offline: ['Offline', 'Sem internet: tudo continua funcionando e será enviado quando a conexão voltar.', 'warn'],
  error: ['Erro ao sincronizar', 'Tentaremos de novo automaticamente.', 'bad'],
  blocked: ['Conta bloqueada', '', 'bad']
};
function renderStatus(s) {
  const el = $('#topStatus'); if (!el) return;
  const [label, title, cls] = STATUS[s.state] || STATUS.idle;
  const pend = s.pending ? ` · ${s.pending} pendente${s.pending > 1 ? 's' : ''}` : '';
  setHTML(el, html`<button type="button" class="chip ${cls}" data-action="sync" title="${title}" aria-label="${label}${pend}. ${title}" ${!auth.isLogged() ? 'disabled' : ''}>${icon('sync')}<span id="syncLabel">${label}${pend}</span></button>${s.rejected ? html`<a class="chip bad" href="#conta/dados">${s.rejected} com erro</a>` : ''}`);
  const f = $('#syncFoot'); if (f) f.textContent = s.lastSync ? `Última sincronização: ${new Date(s.lastSync).toLocaleTimeString('pt-BR', { hour: '2-digit', minute: '2-digit' })}` : '';
}

async function renderBanners() {
  const el = $('#banners'); if (!el) return;
  const s = await store.meta.get('app_settings', {}).catch(() => ({}));
  const parts = [];
  if (configError) parts.push(html`<div class="banner bad" role="alert">${configError}</div>`);
  if (s?.aviso_geral) parts.push(html`<div class="banner" role="status">${s.aviso_geral}</div>`);
  if (updateReady) parts.push(html`<div class="banner row between"><span>Uma nova versão da Educa Mais está pronta.</span><button class="btn sm" type="button" id="doUpdate">Atualizar agora</button></div>`);
  setHTML(el, html`${parts}`);
  const b = $('#doUpdate'); if (b) b.onclick = () => { updateReady?.postMessage('SKIP_WAITING'); };
}

// ---------------- Rotas ----------------
let cleanup = null, routing = 0;
export function parseHash() {
  const h = decodeURIComponent(location.hash.slice(1));
  if (/access_token=|error_description=|type=recovery/.test(h)) return { view: 'inicio', params: [] };
  const [view, ...params] = h.split('/');
  return { view: VIEWS[view] ? view : 'inicio', params };
}

async function route() {
  const my = ++routing;
  let { view, params } = parseHash();
  if (configured && !auth.isLogged() && view !== 'entrar') view = 'entrar'; // sempre a tela de entrada primeiro
  if (auth.state.recovery && view !== 'entrar') { view = 'entrar'; params = ['nova-senha']; }
  if (view === 'professor' && !auth.can('teacher.area')) { view = 'conta'; toast('A área do professor é liberada depois que o administrador aprova o seu pedido (em Minha conta).'); history.replaceState(null, '', '#conta'); }
  if (view === 'admin' && !auth.can('admin.access')) { view = 'inicio'; toast('Área restrita à administração.'); history.replaceState(null, '', '#inicio'); }
  if (['materiais', 'turmas', 'aulas', 'duvidas'].includes(view) && !auth.isLogged()) { view = 'entrar'; }
  if (controles.isBlocked(view)) {
    if (typeof cleanup === 'function') { try { cleanup(); } catch {} } cleanup = null;
    const o = $('#view'); const e2 = o.cloneNode(false); o.replaceWith(e2);
    setHTML(e2, controles.isPending()
      ? html`<div class="card stack" role="status"><h1>Sua conta está quase pronta</h1><p>Recebemos o seu cadastro. Agora a professora vai liberar as aulas, os materiais e as ferramentas da sua conta. Assim que ela liberar, tudo aparece aqui sozinho.</p><div class="row"><button class="btn" type="button" id="recheck">Verificar de novo</button><a class="btn ghost" href="#conta">Minha conta</a></div></div>`
      : html`<div class="card stack" role="alert"><h1>Parte desativada</h1><p>Esta parte da plataforma não está liberada para a sua conta. Se precisar dela, fale com a administração.</p><div><a class="btn ghost" href="#inicio">Voltar ao início</a></div></div>`);
    const rc = $('#recheck', e2); if (rc) rc.onclick = () => controles.load().then(() => { if (!controles.isPending()) toast('Conta liberada!'); else toast('Ainda aguardando a liberação.'); });
    return;
  }
  if (auth.isBlocked() && view !== 'conta') view = 'bloqueado';
  if (typeof cleanup === 'function') { try { cleanup(); } catch {} } cleanup = null;
  // Cada tela recebe um contêiner novo (evita acumular eventos de telas anteriores)
  const old = $('#view'); const el = old.cloneNode(false); old.replaceWith(el);
  document.querySelectorAll('#nav a').forEach(a => a.toggleAttribute('aria-current', a.dataset.v === view) && a.setAttribute('aria-current', 'page'));
  document.documentElement.dataset.view = view;
  if (view === 'bloqueado') {
    setHTML(el, html`<div class="card stack" role="alert"><h1>Conta bloqueada</h1><p>Sua conta foi bloqueada pela administração${auth.state.profile?.blocked_reason ? html`: <b>${auth.state.profile.blocked_reason}</b>` : ''}.</p><p class="muted">Enquanto estiver bloqueada, você não consegue ver nem alterar dados. Se acha que é um engano, entre em contato com a equipe da Educa Mais.</p><div><a class="btn ghost" href="#conta">Minha conta</a></div></div>`);
    return;
  }
  try {
    const mod = (await VIEWS[view]()).default;
    if (my !== routing) return;
    setHTML(el, '');
    document.title = `${mod.title || 'Educa Mais'} · Educa Mais`;
    cleanup = await mod.render(el, params, ctx);
    if (!['entrar', 'conta', 'aparencia', 'admin'].includes(view)) saveLastView(view);
  } catch (e) {
    console.error(e);
    setHTML(el, html`<div class="card"><h2>Não foi possível abrir esta tela</h2><p class="muted">Recarregue a página. Se estiver offline, abra o app uma vez com internet.</p></div>`);
  }
  if (location.hash && el) el.focus({ preventScroll: true });
  window.scrollTo(0, 0);
}

const saveLastView = debounce(v => { if (aparencia.settings().last_view !== v) aparencia.save({ last_view: v }).catch(() => {}); }, 4000);
export const guestChosen = () => { try { return localStorage.getItem('em:guest') === '1'; } catch { return false; } };
export const chooseGuest = v => { try { v ? localStorage.setItem('em:guest', '1') : localStorage.removeItem('em:guest'); } catch {} };

// Contexto compartilhado com as telas
export const ctx = {
  refreshShell: () => { renderShell(); route(); },
  go: h => { if (location.hash === '#' + h) route(); else location.hash = '#' + h; },
  rerender: () => route(),
  chooseGuest: v => chooseGuest(v),
  enterAccount: () => enterAccount(),
  leaveAccount: () => leaveAccount()
};

// ---------------- Troca de conta ----------------
async function enterAccount() {
  const uid = auth.state.user.id;
  const guestRows = store.currentScope() === 'local' ? await store.countUserRows('local') : 0;
  await store.useScope(uid);
  await ensureSeed();
  if (guestRows > 0 && (await store.meta.get('local_rows_asked')) !== guestRows) {
    const ok = await confirmDialog(`Encontramos ${guestRows} registros de estudo feitos neste aparelho sem conta (inclusive da versão anterior do app). Quer levar esses dados para a sua conta?`, { ok: 'Sim, levar para a conta' });
    if (ok) {
      const n = await store.importFrom('local'); toast(`${n} registros adicionados à sua conta`);
      await store.deleteScope('local');
      await store.useScope(uid);
      await sync.refreshCounts();
    } else await store.meta.set('local_rows_asked', guestRows);
  }
  await aparencia.load();
  await controles.load().catch(() => {});
  chooseGuest(false);
  renderShell();
  await sync.syncNow({ content: true });
  await aparencia.load();
  if (parseHash().view === 'entrar' || !location.hash) location.hash = '#inicio'; else route();
}

async function leaveAccount() {
  const uid = store.currentScope();
  const pending = uid && uid !== 'local' ? await store.pendingCount().catch(() => 0) : 0;
  await store.useScope('local');
  // Não deixa dados pessoais no aparelho, a menos que ainda haja algo não enviado
  if (uid && uid !== 'local' && !pending) await store.deleteScope(uid);
  await store.useScope('local');
  await ensureSeed();
  await aparencia.load();
  await controles.load();
  renderShell();
  location.hash = '#entrar';
  route();
}

// ---------------- Atualização controlada do app ----------------
let updateReady = null;
async function registerSW() {
  if (!('serviceWorker' in navigator) || !/^https?:$/.test(location.protocol)) return;
  try {
    const hadController = !!navigator.serviceWorker.controller; // na 1ª instalação não recarrega
    const reg = await navigator.serviceWorker.register('sw.js');
    const watch = w => w && w.addEventListener('statechange', () => { if (w.state === 'installed' && navigator.serviceWorker.controller) { updateReady = w; renderBanners(); } });
    if (reg.waiting && navigator.serviceWorker.controller) { updateReady = reg.waiting; renderBanners(); }
    reg.addEventListener('updatefound', () => watch(reg.installing));
    let reloaded = false;
    navigator.serviceWorker.addEventListener('controllerchange', () => { if (hadController && !reloaded) { reloaded = true; location.reload(); } });
    setInterval(() => reg.update().catch(() => {}), 60 * 60e3);
  } catch (e) { console.warn('service worker', e); }
}

// ---------------- Início ----------------
async function boot() {
  try {
    await auth.init();
  } catch (e) { console.warn(e); }
  await store.useScope('local');
  await migrateV02().catch(e => console.warn('migração v0.2', e));
  await ensureSeed();
  await aparencia.load();
  aparencia.startWatchers();
  renderShell();
  on('sync:status', renderStatus);
  on('content:change', renderBanners);
  on('controles:change', () => { renderShell(); route(); });
  protecao.start();
  on('auth:profile', () => { renderWho(); });
  on('auth:change', async ({ event }) => {
    if (event === 'SIGNED_IN' && auth.state.user && store.currentScope() !== auth.state.user.id) await enterAccount();
    if (event === 'SIGNED_OUT') await leaveAccount();
  });
  on('auth:recovery', () => { location.hash = '#entrar/nova-senha'; route(); });
  window.addEventListener('hashchange', route);
  sync.start();
  if (auth.isLogged()) await enterAccount();
  else { await route(); sync.refreshCounts(); }
  registerSW();
  emit('app:ready');
  document.documentElement.dataset.ready = '1';
}

boot();
