// Mundos visuais (temas no estilo Nexus). Cada mundo é guardado na conta com um dos
// nomes de tema que o banco de dados já aceita, então não precisa mudar o banco.
import * as aparencia from '../core/aparencia.js';
import { on } from '../core/bus.js';

export const WORLDS = [
  { id: 'noite', theme: 'dark', label: 'Noite de estudo', icon: '🕯️', dark: true, prev: ['#0e0b09', '#e0a83b'] },
  { id: 'espaco', theme: 'meia-noite', label: 'Espaço', icon: '🚀', dark: true, prev: ['#050a14', '#38bdf8'] },
  { id: 'neon', theme: 'roxo', label: 'Neon', icon: '🌆', dark: true, prev: ['#0b0710', '#facc15'] },
  { id: 'floresta', theme: 'forest', label: 'Floresta', icon: '🌿', dark: true, prev: ['#070d09', '#86efac'] },
  { id: 'oceano', theme: 'ocean', label: 'Oceano', icon: '🌊', dark: true, prev: ['#04121a', '#2dd4bf'] },
  { id: 'cafe', theme: 'cafe', label: 'Cafeteria', icon: '☕', dark: true, prev: ['#140e0a', '#e0a46b'] },
  { id: 'biblioteca', theme: 'sepia', label: 'Biblioteca (claro)', icon: '📜', dark: false, prev: ['#f3ead7', '#9a3412'] },
  { id: 'aurora', theme: 'light', label: 'Aurora (claro)', icon: '☀️', dark: false, prev: ['#f5f7fb', '#6d28d9'] },
  { id: 'sakura', theme: 'rosa', label: 'Sakura (claro)', icon: '🌸', dark: false, prev: ['#fff5f8', '#db2777'] },
  { id: 'contraste', theme: 'contrast', label: 'Alto contraste', icon: '◐', dark: true, prev: ['#000000', '#ffd400'] }
];
// Temas da versão anterior que não existem mais viram o mundo mais parecido
const LEGADO = { azul: 'aurora', preto: 'espaco', verde: 'floresta', laranja: 'noite', vermelho: 'noite', lilas: 'aurora', menta: 'oceano', girassol: 'biblioteca' };
export const ACCENTS = ['#e0a83b', '#f97316', '#ef4444', '#ec4899', '#a855f7', '#6366f1', '#38bdf8', '#2dd4bf', '#22c55e', '#facc15'];

const prefersDark = () => window.matchMedia?.('(prefers-color-scheme: dark)').matches !== false;

export function worldOf(theme) {
  if (!theme || theme === 'auto') return prefersDark() ? 'noite' : 'aurora';
  const w = WORLDS.find(x => x.theme === theme);
  return w ? w.id : LEGADO[theme] || 'noite';
}

function hexToRgba(hex, a) { const n = parseInt(hex.slice(1), 16); return `rgba(${(n >> 16) & 255},${(n >> 8) & 255},${n & 255},${a})`; }
function inkFor(hex) {
  const n = parseInt(hex.slice(1), 16), c = [(n >> 16) & 255, (n >> 8) & 255, n & 255].map(v => { v /= 255; return v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4; });
  return 0.2126 * c[0] + 0.7152 * c[1] + 0.0722 * c[2] > 0.4 ? '#111111' : '#ffffff';
}

export function applyWorld(s = aparencia.settings()) {
  const root = document.documentElement;
  const w = worldOf(s.theme);
  root.dataset.world = w;
  const st = root.style;
  // aparencia.js usa --brand; aqui a cor escolhida vira o destaque do mundo
  for (const p of ['--brand', '--brand-ink', '--second', '--second-ink', '--mark', '--mark-ink']) st.removeProperty(p);
  const c = s.color_primary;
  if (typeof c === 'string' && /^#[0-9a-fA-F]{6}$/.test(c)) { st.setProperty('--accent', c); st.setProperty('--glow', hexToRgba(c, 0.35)); st.setProperty('--accent-ink', inkFor(c)); }
  else { st.removeProperty('--accent'); st.removeProperty('--glow'); st.removeProperty('--accent-ink'); }
  const meta = document.querySelector('meta[name="theme-color"]');
  if (meta) meta.content = getComputedStyle(root).getPropertyValue('--bg').trim() || '#0e0b09';
}

export function setWorld(id) {
  const w = WORLDS.find(x => x.id === id) || WORLDS[0];
  return aparencia.save({ theme: w.theme });
}

export function startWorlds() {
  applyWorld();
  on('aparencia:change', s => applyWorld(s));
  on('store:change', ({ table }) => { if (table === 'user_settings' || table === '*') setTimeout(() => applyWorld(), 50); });
  window.matchMedia?.('(prefers-color-scheme: dark)').addEventListener?.('change', () => applyWorld());
}
