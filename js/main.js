// Educa Mais 2.0 · inicialização, navegação e estrutura da tela (estilo Nexus).
// A parte de dados (conta, sincronização, banco offline, liberação por aluno) continua
// em js/core; as telas novas ficam em js/app/telas.
import { html, render, useState, useEffect, useRef, AppCtx, Modal, Loading, ErrorBox, go } from './app/ui.js';
import { toast, confirmDialog, debounce } from './core/util.js';
import { configured, configError } from './core/backend.js';
import * as auth from './core/auth.js';
import * as store from './core/store.js';
import * as sync from './core/sync.js';
import * as aparencia from './core/aparencia.js';
import { ensureSeed, catalog } from './core/conteudo.js';
import { migrateV02 } from './lib/migrar-v02.js';
import { on, emit } from './core/bus.js';
import * as controles from './core/controles.js';
import * as protecao from './core/protecao.js';
import { startWorlds, applyWorld, WORLDS, worldOf, setWorld } from './app/mundos.js';
import { Busca } from './app/busca.js';

export const VERSION = '2.0.0-dev';

// ---------------- Telas ----------------
// feature = parte que a professora pode liberar ou bloquear para cada aluno (js/core/controles.js)
const T = p => () => import(`./app/telas/${p}.js`);
const L = p => () => import(`./views/${p}.js`);
export const VIEWS = {
  inicio: { load: T('inicio'), title: 'Início' },
  estudar: { load: T('estudar'), title: 'Estudar' },
  aulas: { legacy: L('aulas'), title: 'Aulas', feature: 'aulas', needs: 'login' },
  praticar: { load: T('praticar'), title: 'Praticar' },
  questoes: { load: T('questoes'), title: 'Questões', feature: 'questoes' },
  desafio: { load: T('questoes'), title: 'Desafio do dia', feature: 'questoes', props: { modo: 'desafio' } },
  erros: { load: T('erros'), title: 'Caderno de erros', feature: 'questoes' },
  flashcards: { load: T('flashcards'), title: 'Flashcards', feature: 'flashcards' },
  foco: { load: T('foco'), title: 'Sala de foco', feature: 'foco', full: true },
  progresso: { load: T('progresso'), title: 'Progresso', feature: 'desempenho' },
  cronograma: { load: T('cronograma'), title: 'Cronograma e metas', feature: 'plano' },
  anotacoes: { load: T('anotacoes'), title: 'Anotações', feature: 'anotacoes' },
  redacao: { load: T('redacao'), title: 'Redação', feature: 'redacao' },
  perfil: { load: T('perfil'), title: 'Perfil' },
  // Telas da conta, da professora e da administração (dentro do visual novo)
  entrar: { legacy: L('entrar'), title: 'Entrar', bare: true },
  conta: { legacy: L('conta'), title: 'Minha conta' },
  materiais: { legacy: L('materiais'), title: 'Materiais', feature: 'materiais', needs: 'login' },
  duvidas: { legacy: L('duvidas'), title: 'Falar com a professora', feature: 'duvidas', needs: 'login' },
  turmas: { legacy: L('turmas'), title: 'Minhas turmas', feature: 'turmas', needs: 'login' },
  professor: { legacy: L('professor'), title: 'Área do professor', needs: 'teacher.area' },
  admin: { legacy: L('admin'), title: 'Painel da professora', needs: 'admin.access' }
};
// Endereços da versão anterior continuam funcionando
const ALIAS = { desempenho: 'progresso', resultados: 'progresso', plano: 'cronograma', aparencia: 'perfil', inicio: 'inicio' };

export function parseHash() {
  const raw = location.hash.slice(1);
  if (/access_token=|error_description=|type=recovery/.test(raw)) return { view: 'inicio', params: [] };
  const [v, ...params] = raw.split('/').map(s => { try { return decodeURIComponent(s); } catch { return s; } });
  const view = ALIAS[v] || v;
  return { view: VIEWS[view] ? view : 'inicio', params };
}

export const NAV = [['inicio', '🏠', 'Início'], ['estudar', '📚', 'Estudar'], ['praticar', '🎯', 'Praticar'], ['progresso', '📈', 'Progresso']];

// ---------------- Telas antigas dentro do visual novo ----------------
function Legacy({ load, params }) {
  const ref = useRef(null);
  const [err, setErr] = useState(null);
  useEffect(() => {
    let dead = false, cleanup = null;
    const el = ref.current; el.innerHTML = '';
    load().then(m => dead ? null : m.default.render(el, params, ctx)).then(c => { cleanup = c; if (dead && typeof c === 'function') c(); }).catch(e => { console.error(e); setErr(e); });
    return () => { dead = true; if (typeof cleanup === 'function') { try { cleanup(); } catch {} } };
  }, []);
  if (err) return html`<${ErrorBox} error=${err} />`;
  return html`<div class="legacy fade-in" ref=${ref}></div>`;
}

function Screen({ def, params, view }) {
  const [Comp, setComp] = useState(null);
  const [err, setErr] = useState(null);
  useEffect(() => {
    let ok = true;
    def.load().then(m => { if (ok) setComp(() => m.default); }).catch(e => { console.error(e); if (ok) setErr(e); });
    return () => { ok = false; };
  }, [view]);
  if (err) return html`<${ErrorBox} error=${err} />`;
  if (!Comp) return html`<${Loading} />`;
  return html`<${Comp} params=${params} ...${def.props || {}} />`;
}

function Pending() {
  const [busy, setBusy] = useState(false);
  return html`<div class="card hero fade-in" style="max-width:760px;margin:20px auto">
    <div class="chip accent" style="margin-bottom:14px">⏳ Aguardando liberação</div>
    <h1>Sua conta está quase pronta</h1>
    <p>Recebemos o seu cadastro. Agora a professora vai liberar as aulas, as questões e as ferramentas da sua conta. Assim que ela liberar, tudo aparece aqui sozinho.</p>
    <div class="row wrap mt"><button class="btn primary" disabled=${busy} onClick=${async () => { setBusy(true); await controles.load().catch(() => {}); setBusy(false); toast(controles.isPending() ? 'Ainda aguardando a liberação.' : 'Conta liberada!'); }}>🔄 Verificar de novo</button>
      <button class="btn ghost" onClick=${() => go('conta')}>Minha conta</button></div></div>`;
}

function Blocked({ reason }) {
  return html`<div class="card pad-lg fade-in" style="max-width:700px;margin:20px auto" role="alert"><h2>${reason === 'conta' ? 'Conta bloqueada' : 'Parte desativada'}</h2>
    <p class="muted mt">${reason === 'conta' ? html`Sua conta foi bloqueada pela administração${auth.state.profile?.blocked_reason ? html`: <b>${auth.state.profile.blocked_reason}</b>` : ''}. Se acha que é um engano, fale com a equipe da Educa Mais.` : 'Esta parte da plataforma não está liberada para a sua conta. Se precisar dela, fale com a professora.'}</p>
    <div class="row mt"><button class="btn" onClick=${() => go(reason === 'conta' ? 'conta' : 'inicio')}>${reason === 'conta' ? 'Minha conta' : 'Voltar ao início'}</button></div></div>`;
}

const SYNC = {
  local: ['💾', 'Modo local', 'Os dados ficam só neste aparelho.', 'warn'],
  guest: ['💾', 'Sem conta', 'Os dados ficam só neste aparelho.', 'warn'],
  idle: ['', 'Sincronizado', 'Tudo salvo na sua conta.', 'ok'],
  syncing: ['🔄', 'Sincronizando', 'Enviando e recebendo dados.', ''],
  offline: ['📴', 'Offline', 'Sem internet: tudo continua funcionando e é enviado quando a conexão voltar.', 'warn'],
  error: ['⚠️', 'Erro ao sincronizar', 'Tentaremos de novo automaticamente.', 'danger'],
  blocked: ['⛔', 'Conta bloqueada', '', 'danger']
};

function App() {
  const [route, setRoute] = useState(parseHash());
  const [modal, setModal] = useState(null);
  const [busca, setBusca] = useState(false);
  const [sst, setSst] = useState({ ...sync.status });
  const [aviso, setAviso] = useState('');
  const [, force] = useState(0);
  const [upd, setUpd] = useState(!!updateReady);

  useEffect(() => {
    const onHash = () => { setRoute(parseHash()); window.scrollTo(0, 0); };
    window.addEventListener('hashchange', onHash);
    const offs = [
      on('sync:status', s => setSst({ ...s })),
      on('auth:profile', () => force(x => x + 1)),
      on('controles:change', () => force(x => x + 1)),
      on('shell:refresh', () => { force(x => x + 1); setRoute(parseHash()); }),
      on('app:update', () => setUpd(true)),
      on('content:change', () => loadAviso())
    ];
    const loadAviso = () => store.meta.get('app_settings', {}).then(s => setAviso(s?.aviso_geral || '')).catch(() => {});
    loadAviso();
    const key = e => { if ((e.ctrlKey || e.metaKey) && e.key.toLowerCase() === 'k') { e.preventDefault(); setBusca(b => !b); } if (e.key === '/' && !e.target.closest?.('input, textarea, select, [contenteditable]')) { e.preventDefault(); setBusca(true); } };
    document.addEventListener('keydown', key);
    return () => { window.removeEventListener('hashchange', onHash); offs.forEach(f => f()); document.removeEventListener('keydown', key); };
  }, []);

  let { view, params } = route;
  if (configured && !auth.isLogged() && view !== 'entrar') view = 'entrar';
  if (auth.state.recovery && view !== 'entrar') { view = 'entrar'; params = ['nova-senha']; }
  if (view === 'professor' && configured && auth.isLogged() && !auth.can('teacher.area')) { view = 'conta'; params = []; history.replaceState(null, '', '#conta'); toast('A área do professor é liberada depois que a administração aprova o seu pedido (em Minha conta).'); }
  if (view === 'admin' && configured && auth.isLogged() && !auth.can('admin.access')) { view = 'inicio'; params = []; history.replaceState(null, '', '#inicio'); toast('Área restrita à administração.'); }
  const def = VIEWS[view];
  let gate = null;
  if (auth.isBlocked() && view !== 'conta') gate = html`<${Blocked} reason="conta" />`;
  else if (def.needs === 'login' && !auth.isLogged() && configured) gate = null;
  else if (def.needs && def.needs !== 'login' && !auth.can(def.needs)) gate = html`<${Blocked} />`;
  else if (def.feature && controles.isBlocked(def.feature)) gate = controles.isPending() ? html`<${Pending} />` : html`<${Blocked} />`;
  document.documentElement.dataset.view = view;
  useEffect(() => { document.title = `${def.title} · Educa Mais`; if (!['entrar', 'conta', 'perfil', 'admin'].includes(view)) saveLastView(view); }, [view]);

  const app = {
    route: { view, params }, setModal, openBusca: () => setBusca(true),
    user: auth.state.user, profile: auth.state.profile, logged: auth.isLogged(), configured,
    can: p => auth.can(p), pending: controles.isPending(), blocked: f => controles.isBlocked(f)
  };
  const key = view + '/' + params.join('/');
  const content = gate || (def.legacy ? html`<${Legacy} key=${key} load=${def.legacy} params=${params} />` : html`<${Screen} key=${key} def=${def} params=${params} view=${key} />`);

  if (def.bare) {
    return html`<${AppCtx.Provider} value=${app}><div class="auth-wrap">
      <section class="auth-art"><a class="brand" href="#inicio"><span class="brand-mark">E+</span><span class="brand-name">EDUCA <b>MAIS</b></span></a>
        <div class="col" style="gap:14px"><div class="chip accent" style="align-self:flex-start">✦ ENEM, vestibulares, fundamental e médio</div><h1>Estude com <span class="hl">tudo num só lugar</span>.</h1>
          <p class="muted hide-sm" style="font-size:17px;max-width:540px">Mais de 13 mil questões, simulados com nota estilo TRI, flashcards inteligentes, aulas, sala de foco, redação e o seu progresso salvo em qualquer aparelho. Funciona até sem internet.</p>
          <div class="stat-row hide-sm"><div><b>13 mil+</b><span class="small muted">questões</span></div><div><b>32</b><span class="small muted">estilos de prova</span></div><div><b>10</b><span class="small muted">mundos visuais</span></div></div></div>
        <span class="tiny faint hide-sm">Educa Mais · plataforma de estudos</span></section>
      <section class="auth-side">${content}</section></div>${modal}</${AppCtx.Provider}>`;
  }
  const [sIc, sLabel, sTitle, sCls] = SYNC[sst.state] || SYNC.idle;
  const nome = auth.state.profile?.display_name || auth.state.user?.email || '';
  const w = WORLDS.find(x => x.id === worldOf(aparencia.settings().theme)) || WORLDS[0];
  const cycle = () => { const i = WORLDS.indexOf(w); const n = WORLDS[(i + 1) % WORLDS.length]; setWorld(n.id); toast('Mundo: ' + n.label); };
  const active = k => view === k || (k === 'estudar' && ['aulas', 'anotacoes', 'materiais', 'redacao'].includes(view)) || (k === 'praticar' && ['questoes', 'desafio', 'erros', 'flashcards'].includes(view)) || (k === 'progresso' && ['cronograma'].includes(view));
  return html`<${AppCtx.Provider} value=${app}>
    <div class="app">
      <header class="topbar">
        <a class="brand" href="#inicio" aria-label="Educa Mais, início"><span class="brand-mark">E+</span><span class="brand-name">EDUCA <b>MAIS</b></span></a>
        <nav class="nav" id="nav" aria-label="Seções">${NAV.map(([k, ic, l]) => html`<a href=${'#' + k} data-v=${k} class=${active(k) ? 'active' : ''} aria-current=${active(k) ? 'page' : null}>${l}</a>`)}
          <a href="#foco" data-v="foco" class=${view === 'foco' ? 'active' : ''}>Foco</a>
          ${auth.can('teacher.area') && html`<a href="#professor" data-v="professor" class=${view === 'professor' ? 'active' : ''}>Professor</a>`}
          ${auth.can('admin.access') && html`<a href="#admin" data-v="admin" class=${view === 'admin' ? 'active' : ''}>Painel</a>`}</nav>
        <span class="spacer"></span>
        <button class="searchbtn" onClick=${() => setBusca(true)} aria-label="Buscar (Ctrl+K)">🔎 <span class="txt">Buscar em tudo</span><span class="kbd">Ctrl K</span></button>
        ${(configured || sst.state !== 'local') && html`<button class=${'chip hide-sm ' + sCls} title=${sTitle} disabled=${!auth.isLogged()} onClick=${() => sync.syncNow({ content: true }).then(() => toast('Sincronizado'))}>${sCls === 'ok' ? html`<span class="dot"></span>` : sIc} <span id="syncLabel">${sLabel}${sst.pending ? ` · ${sst.pending} pendente${sst.pending > 1 ? 's' : ''}` : ''}</span></button>`}
        <button class="btn ghost icon" onClick=${cycle} title=${'Trocar mundo (agora: ' + w.label + ')'} aria-label="Trocar mundo visual">${w.icon}</button>
        <button class="btn ghost" id="who" style="padding:3px" onClick=${() => go('perfil')} aria-label="Perfil"><span class="avatar">${(nome[0] || '★').toUpperCase()}</span><span class="sr-only">${nome}</span></button>
      </header>
      ${configError && html`<div class="banner-top bad" role="alert">${configError}</div>`}
      ${aviso && html`<div class="banner-top" role="status">📣 ${aviso}</div>`}
      ${upd && html`<div class="banner-top">✨ Uma nova versão da Educa Mais está pronta. <button class="btn sm primary" onClick=${() => updateReady?.postMessage('SKIP_WAITING')}>Atualizar agora</button></div>`}
      <main class=${'main' + (def.full && !gate ? ' full' : '')} id="view" tabindex="-1">${content}</main>
      ${!(def.full && !gate) && html`<nav class="bottom-nav" aria-label="Seções">${NAV.slice(0, 2).map(([k, ic, l]) => html`<button class=${active(k) ? 'active' : ''} onClick=${() => go(k)}><span class="i">${ic}</span>${l}</button>`)}
        <button class="fab" onClick=${() => go('foco')}><span class="i">⏱️</span>Foco</button>
        ${NAV.slice(2).map(([k, ic, l]) => html`<button class=${active(k) ? 'active' : ''} onClick=${() => go(k)}><span class="i">${ic}</span>${l}</button>`)}</nav>`}
      ${busca && html`<${Busca} onClose=${() => setBusca(false)} />`}
      ${modal}
    </div>
  </${AppCtx.Provider}>`;
}

const saveLastView = debounce(v => { if (aparencia.settings().last_view !== v) aparencia.save({ last_view: v }).catch(() => {}); }, 4000);
export const guestChosen = () => { try { return localStorage.getItem('em:guest') === '1'; } catch { return false; } };
export const chooseGuest = v => { try { v ? localStorage.setItem('em:guest', '1') : localStorage.removeItem('em:guest'); } catch {} };

// Contexto usado pelas telas da conta e da administração
export const ctx = {
  refreshShell: () => emit('shell:refresh'),
  go: h => { if (location.hash === '#' + h) emit('shell:refresh'); else location.hash = '#' + h; },
  rerender: () => emit('shell:refresh'),
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
  await aparencia.load(); applyWorld();
  await controles.load().catch(() => {});
  chooseGuest(false);
  emit('shell:refresh');
  await sync.syncNow({ content: true });
  await aparencia.load(); applyWorld();
  if (parseHash().view === 'entrar' || !location.hash) location.hash = '#inicio'; else emit('shell:refresh');
}

async function leaveAccount() {
  const uid = store.currentScope();
  const pending = uid && uid !== 'local' ? await store.pendingCount().catch(() => 0) : 0;
  await store.useScope('local');
  if (uid && uid !== 'local' && !pending) await store.deleteScope(uid);
  await store.useScope('local');
  await ensureSeed();
  await aparencia.load(); applyWorld();
  await controles.load();
  location.hash = '#entrar';
  emit('shell:refresh');
}

// ---------------- Atualização controlada do app ----------------
let updateReady = null;
async function registerSW() {
  if (!('serviceWorker' in navigator) || !/^https?:$/.test(location.protocol)) return;
  try {
    const hadController = !!navigator.serviceWorker.controller;
    const reg = await navigator.serviceWorker.register('sw.js');
    const ready = w => { updateReady = w; emit('app:update'); };
    const watch = w => w && w.addEventListener('statechange', () => { if (w.state === 'installed' && navigator.serviceWorker.controller) ready(w); });
    if (reg.waiting && navigator.serviceWorker.controller) ready(reg.waiting);
    reg.addEventListener('updatefound', () => watch(reg.installing));
    let reloaded = false;
    navigator.serviceWorker.addEventListener('controllerchange', () => { if (hadController && !reloaded) { reloaded = true; location.reload(); } });
    setInterval(() => reg.update().catch(() => {}), 60 * 60e3);
  } catch (e) { console.warn('service worker', e); }
}

// ---------------- Início ----------------
async function boot() {
  try { await auth.init(); } catch (e) { console.warn(e); }
  await store.useScope('local');
  await migrateV02().catch(e => console.warn('migração v0.2', e));
  await ensureSeed();
  await aparencia.load();
  aparencia.startWatchers();
  startWorlds();
  protecao.start();
  on('auth:change', async ({ event }) => {
    if (event === 'SIGNED_IN' && auth.state.user && store.currentScope() !== auth.state.user.id) await enterAccount();
    if (event === 'SIGNED_OUT') await leaveAccount();
  });
  on('auth:recovery', () => { location.hash = '#entrar/nova-senha'; });
  sync.start();
  if (auth.isLogged()) await enterAccount();
  else sync.refreshCounts();
  const root = document.getElementById('app');
  root.innerHTML = '';
  render(html`<${App} />`, root);
  registerSW();
  emit('app:ready');
  document.documentElement.dataset.ready = '1';
  const aquecer = () => setTimeout(() => (window.requestIdleCallback || setTimeout)(() => catalog().catch(() => {})), 1500);
  aquecer(); on('content:change', aquecer);
}

boot();
