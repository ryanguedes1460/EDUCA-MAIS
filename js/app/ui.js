// Educa Mais 2.0 · peças da interface (Preact + htm, sem etapa de compilação).
import * as store from '../core/store.js';
import { on } from '../core/bus.js';
import { toast as baseToast } from '../core/util.js';

export const { h, html, render, useState, useEffect, useRef, useMemo, useCallback, createContext, useContext, useLayoutEffect } = window.__P;

export const toast = (msg, ms) => baseToast(msg, ms);

// ---------- contexto do app (navegação, modais) ----------
export const AppCtx = createContext(null);
export const useApp = () => useContext(AppCtx);

/** Navega para "#view/param1/param2". */
export const go = (view, ...params) => { const h = '#' + [view, ...params.filter(p => p != null && p !== '')].map(encodeURIComponent).join('/'); if (location.hash === h) window.dispatchEvent(new HashChangeEvent('hashchange')); else location.hash = h; };

// ---------- dados ----------
/** Executa uma função assíncrona e refaz quando as tabelas indicadas mudam. */
export function useData(fn, deps = [], tables = '*') {
  const [st, setSt] = useState({ data: null, loading: true, error: null });
  const [tick, setTick] = useState(0);
  const alive = useRef(true);
  useEffect(() => () => { alive.current = false; }, []);
  useEffect(() => {
    let off1 = on('store:change', ({ table } = {}) => { if (tables === '*' || table === '*' || [].concat(tables).includes(table)) setTick(t => t + 1); });
    let off2 = on('content:change', () => setTick(t => t + 1));
    return () => { off1(); off2(); };
  }, []);
  useEffect(() => {
    let ok = true;
    Promise.resolve().then(fn).then(data => { if (ok && alive.current) setSt({ data, loading: false, error: null }); })
      .catch(error => { console.error(error); if (ok && alive.current) setSt({ data: null, loading: false, error }); });
    return () => { ok = false; };
  }, [...deps, tick]);
  return [st.data, st.loading, st.error, () => setTick(t => t + 1)];
}

/** Carrega as tabelas pessoais mais usadas de uma vez. */
export async function loadMine(...tables) {
  const out = {};
  await Promise.all(tables.map(async t => { out[t] = await store.all(t); }));
  return out;
}

export function useNow(ms = 30000) {
  const [n, setN] = useState(Date.now());
  useEffect(() => { const t = setInterval(() => setN(Date.now()), ms); return () => clearInterval(t); }, [ms]);
  return n;
}

export function useMedia(q) {
  const [m, setM] = useState(() => window.matchMedia(q).matches);
  useEffect(() => { const mq = window.matchMedia(q); const f = () => setM(mq.matches); mq.addEventListener('change', f); return () => mq.removeEventListener('change', f); }, [q]);
  return m;
}

// ---------- componentes ----------
export function Modal({ title, icon, onClose, children, foot, wide }) {
  useEffect(() => {
    const k = e => { if (e.key === 'Escape') onClose?.(); };
    document.addEventListener('keydown', k);
    return () => document.removeEventListener('keydown', k);
  }, []);
  return html`<div class="modal-bg" onClick=${e => { if (e.target === e.currentTarget) onClose?.(); }}>
    <div class=${'modal' + (wide ? ' wide' : '')} role="dialog" aria-modal="true" aria-label=${title}>
      <div class="modal-head">${icon && html`<span style="font-size:22px">${icon}</span>`}<h3 class="grow display" style="font-size:19px">${title}</h3><button class="btn ghost icon" onClick=${onClose} aria-label="Fechar">✕</button></div>
      <div class="modal-body">${children}</div>
      ${foot && html`<div class="modal-foot">${foot}</div>`}
    </div></div>`;
}

export function Empty({ icon = '✨', title, children, action }) {
  return html`<div class="empty"><div class="big">${icon}</div>${title && html`<h3>${title}</h3>`}<div class="small">${children}</div>${action && html`<div class="mt">${action}</div>`}</div>`;
}

export function PageHead({ eyebrow, title, children, actions }) {
  return html`<div class="row wrap between" style="align-items:flex-end;gap:16px">
    <div class="col" style="gap:6px;max-width:760px">${eyebrow && html`<span class="eyebrow">${eyebrow}</span>`}<h1>${title}</h1>${children && html`<p class="muted" style="font-size:15.5px">${children}</p>`}</div>
    ${actions && html`<div class="row wrap">${actions}</div>`}
  </div>`;
}

export function Bar({ value, max = 100, ok, lg }) {
  const p = Math.max(0, Math.min(100, max ? (value / max) * 100 : 0));
  return html`<div class=${'bar' + (lg ? ' lg' : '') + (ok ? ' ok' : '')} role="progressbar" aria-valuenow=${Math.round(p)} aria-valuemin="0" aria-valuemax="100"><i style=${{ width: p + '%' }}></i></div>`;
}

export function Ring({ value, max = 100, size = 84, stroke = 9, label, children }) {
  const p = Math.max(0, Math.min(1, max ? value / max : 0)), r = (size - stroke) / 2, C = 2 * Math.PI * r;
  return html`<div style=${{ position: 'relative', width: size + 'px', height: size + 'px', flex: 'none' }} role="img" aria-label=${(label || '') + ' ' + Math.round(p * 100) + '%'}>
    <svg width=${size} height=${size} style="transform:rotate(-90deg)"><circle cx=${size / 2} cy=${size / 2} r=${r} fill="none" stroke="var(--panel2)" stroke-width=${stroke} />
      <circle cx=${size / 2} cy=${size / 2} r=${r} fill="none" stroke=${p >= 1 ? 'var(--ok)' : 'var(--accent)'} stroke-width=${stroke} stroke-linecap="round" stroke-dasharray=${C} stroke-dashoffset=${C * (1 - p)} style="transition:stroke-dashoffset .5s" /></svg>
    <div style="position:absolute;inset:0;display:grid;place-items:center;font-weight:800;font-size:${Math.round(size / 5)}px">${children ?? Math.round(p * 100) + '%'}</div></div>`;
}

export function Stat({ v, k, icon }) {
  return html`<div class="card stat">${icon && html`<div style="font-size:20px;margin-bottom:4px">${icon}</div>`}<div class="v num">${v}</div><div class="k">${k}</div></div>`;
}

export function Tabs({ value, onChange, items }) {
  return html`<div class="tabs" role="tablist">${items.map(([k, label]) => html`<button role="tab" aria-selected=${value === k} class=${value === k ? 'active' : ''} onClick=${() => onChange(k)}>${label}</button>`)}</div>`;
}

export function Seg({ value, onChange, items }) {
  return html`<div class="seg">${items.map(([k, label]) => html`<button class=${value === k ? 'on' : ''} onClick=${() => onChange(k)} aria-pressed=${value === k}>${label}</button>`)}</div>`;
}

export function Field({ label, hint, children }) {
  return html`<label class="field"><span>${label}</span>${children}${hint && html`<span class="tiny faint" style="font-weight:400">${hint}</span>`}</label>`;
}

export function Select({ value, onChange, options, all = 'Todos', ...rest }) {
  return html`<select class="input" value=${value} onChange=${e => onChange(e.target.value)} ...${rest}>
    ${all != null && html`<option value="">${all}</option>`}
    ${options.map(([v, t]) => html`<option value=${v} selected=${String(value) === String(v)}>${t}</option>`)}</select>`;
}

export function Loading({ text = 'Carregando…' }) {
  return html`<div class="boot" style="min-height:40vh"><div><div class="brand-mark">E+</div><div class="small">${text}</div></div></div>`;
}

export function ErrorBox({ error }) {
  return html`<div class="card pad"><${Empty} icon="⚠️" title="Não foi possível abrir esta parte" action=${html`<button class="btn ghost sm" onClick=${() => go('duvidas', 'erro', document.documentElement.dataset.view || '')}>🐞 Relatar ao desenvolvedor</button>`}>${String(error?.message || error || '')}. Recarregue a página. Se estiver sem internet, abra o app uma vez com conexão.</${Empty}></div>`;
}

// ---------- matérias: ícone e cor ----------
const ICONS = [
  [/portugu|gramát|língua/i, '📖'], [/literat/i, '📚'], [/reda/i, '✍️'], [/ingl/i, '🇬🇧'], [/espanh/i, '🇪🇸'], [/arte/i, '🎨'], [/educação física/i, '🏃'],
  [/matem|raciocínio|lógic/i, '📐'], [/físic/i, '⚛️'], [/quím/i, '⚗️'], [/biolog|ciênc/i, '🧬'],
  [/maranh/i, '🌴'], [/atendimento/i, '🤝'], [/hist/i, '🏛️'], [/geograf/i, '🌎'], [/filosof/i, '🦉'], [/sociolog/i, '👥'], [/direito|legisla|constitu/i, '⚖️'], [/informát|tecnolog/i, '💻'], [/atualidade/i, '📰'], [/administra|economia|finan/i, '💼']
];
export const subjectIcon = name => (ICONS.find(([r]) => r.test(name || '')) || [, '📘'])[1];
export const subjectColor = s => (s?.color && /^#[0-9a-f]{6}$/i.test(s.color) ? s.color : '#6d28d9');
export const cover = color => `linear-gradient(135deg, ${color}, color-mix(in srgb, ${color} 45%, #000))`;

export function confirmar(setModal, { title, text, ok = 'Confirmar', danger }) {
  return new Promise(res => {
    const close = v => { setModal(null); res(v); };
    setModal(html`<${Modal} title=${title} onClose=${() => close(false)} foot=${html`<button class="btn ghost" onClick=${() => close(false)}>Cancelar</button><button class=${'btn ' + (danger ? 'danger' : 'primary')} onClick=${() => close(true)}>${ok}</button>`}><p>${text}</p></${Modal}>`);
  });
}
