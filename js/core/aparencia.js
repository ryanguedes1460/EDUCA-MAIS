// Personalização visual e modo de dispositivo, aplicados a partir das
// preferências da conta (tabela user_settings). Cada usuário tem as suas.
import * as store from './store.js';
import { on, emit } from './bus.js';

export const DEFAULTS = {
  id: 'me', theme: 'auto', color_primary: null, color_secondary: null, color_accent: null, device_mode: 'auto',
  card_style: 'elevated', density: 'comfortable', font_scale: 1, reduce_motion: false,
  home_sections: ['continuar', 'metas', 'revisoes', 'trilha', 'ferramentas'], daily_goal_min: 60,
  focus_minutes: 25, short_break_min: 5, long_break_min: 15, last_view: null
};

export const THEMES = [
  { id: 'auto', name: 'Automático', prev: ['#f6f7fb', '#0f1324', '#2340b8'] },
  { id: 'light', name: 'Claro', prev: ['#f6f7fb', '#ffffff', '#2340b8'] },
  { id: 'dark', name: 'Escuro', prev: ['#0f1324', '#171c33', '#7d95ff'] },
  { id: 'sepia', name: 'Sépia (leitura)', prev: ['#f4ecdc', '#fbf6ea', '#8a4b14'] },
  { id: 'ocean', name: 'Oceano', prev: ['#0b1d2a', '#10283a', '#38bdf8'] },
  { id: 'forest', name: 'Floresta', prev: ['#f1f6f0', '#ffffff', '#2f6b3a'] },
  { id: 'contrast', name: 'Alto contraste', prev: ['#000000', '#000000', '#ffd400'] }
];
export const PALETTE = ['#2340b8', '#4f46e5', '#7b3fb8', '#b8407b', '#c2362f', '#d9480f', '#b7791f', '#1f8a4c', '#0e7c86', '#0369a1', '#334155', '#ffd23f'];

let current = { ...DEFAULTS };
export const settings = () => current;

export async function load() {
  const s = await store.get('user_settings', 'me');
  current = { ...DEFAULTS, ...(s || {}) };
  apply();
  return current;
}

export async function save(patch) {
  const s = { ...DEFAULTS, ...(await store.get('user_settings', 'me') || {}), ...patch, id: 'me' };
  await store.put('user_settings', s);
  current = s;
  apply();
  emit('aparencia:change', current);
}

// Contraste: escolhe texto preto ou branco sobre a cor
function inkFor(hex) {
  const n = parseInt(hex.slice(1), 16), r = (n >> 16) & 255, g = (n >> 8) & 255, b = n & 255;
  const L = [r, g, b].map(v => { v /= 255; return v <= 0.03928 ? v / 12.92 : ((v + 0.055) / 1.055) ** 2.4; });
  const lum = 0.2126 * L[0] + 0.7152 * L[1] + 0.0722 * L[2];
  return lum > 0.4 ? '#111111' : '#ffffff';
}
const okHex = v => typeof v === 'string' && /^#[0-9a-fA-F]{6}$/.test(v);

export function apply(s = current) {
  const root = document.documentElement;
  root.dataset.theme = s.theme || 'auto';
  root.dataset.cards = s.card_style || 'elevated';
  root.dataset.density = s.density || 'comfortable';
  root.dataset.motion = s.reduce_motion ? 'reduce' : 'normal';
  root.style.fontSize = `${Math.round(16 * (Number(s.font_scale) || 1))}px`;
  root.style.setProperty('--fs', `${(15 * (Number(s.font_scale) || 1)).toFixed(1)}px`);
  const set = (v, name, ink) => {
    if (okHex(v)) { root.style.setProperty(name, v); root.style.setProperty(ink, inkFor(v)); }
    else { root.style.removeProperty(name); root.style.removeProperty(ink); }
  };
  set(s.color_primary, '--brand', '--brand-ink');
  set(s.color_secondary, '--second', '--second-ink');
  set(s.color_accent, '--mark', '--mark-ink');
  const meta = document.querySelector('meta[name="theme-color"]');
  if (meta) meta.content = okHex(s.color_primary) ? s.color_primary : '#2340b8';
  applyDevice();
}

// ---------- Modo de dispositivo ----------
export function detectDevice(width = innerWidth) {
  if (width < 700) return 'mobile';
  if (width < 1100) return 'tablet';
  return 'desktop';
}
export function applyDevice() {
  const mode = current.device_mode && current.device_mode !== 'auto' ? current.device_mode : detectDevice();
  const root = document.documentElement;
  if (root.dataset.device !== mode) { root.dataset.device = mode; emit('device:change', mode); }
  root.dataset.deviceChoice = current.device_mode || 'auto';
}

export function startWatchers() {
  let t; addEventListener('resize', () => { clearTimeout(t); t = setTimeout(applyDevice, 120); });
  on('store:change', ({ table, source }) => { if ((table === 'user_settings' || table === '*') && source === 'remote') load(); });
}
