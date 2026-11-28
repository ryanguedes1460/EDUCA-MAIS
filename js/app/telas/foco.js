// Sala de foco: tela cheia com Pomodoro, sons ambientes gerados no aparelho (funcionam offline),
// meta da sessão e registro automático das horas.
import { html, useState, useEffect, useData, go, Bar, Field, Select, toast } from '../ui.js';
import * as store from '../../core/store.js';
import * as aparencia from '../../core/aparencia.js';
import { catalog } from '../../core/conteudo.js';
import { dayKey, fmtMin } from '../../core/util.js';

const MODES = [['foco', 'Foco'], ['curta', 'Pausa curta'], ['longa', 'Pausa longa']];
// O estado do timer sobrevive à troca de tela
const T = { mode: 'foco', left: null, running: false, endAt: 0, cycle: 0, startedAt: null, subject: '', goal: '', todos: [] };
let tick = null;
const subs = new Set();
const notify = () => subs.forEach(f => f());
const dur = () => { const s = aparencia.settings(); return { foco: s.focus_minutes || 25, curta: s.short_break_min || 5, longa: s.long_break_min || 15 }; };

// ---------- sons ----------
let actx = null, som = null, somId = 'silencio';
function audio() { actx = actx || new (window.AudioContext || window.webkitAudioContext)(); if (actx.state === 'suspended') actx.resume(); return actx; }
function noiseBuffer(ctx, kind) {
  const len = ctx.sampleRate * 4, buf = ctx.createBuffer(1, len, ctx.sampleRate), d = buf.getChannelData(0);
  let last = 0, b0 = 0, b1 = 0, b2 = 0;
  for (let i = 0; i < len; i++) {
    const w = Math.random() * 2 - 1;
    if (kind === 'marrom') { last = (last + 0.02 * w) / 1.02; d[i] = last * 3.5; }
    else if (kind === 'rosa') { b0 = 0.99765 * b0 + w * 0.099; b1 = 0.963 * b1 + w * 0.2965; b2 = 0.57 * b2 + w * 1.0526; d[i] = (b0 + b1 + b2 + w * 0.1848) * 0.11; }
    else d[i] = w * 0.5;
  }
  return buf;
}
export const SONS = [['silencio', '🔇', 'Silêncio'], ['chuva', '🌧️', 'Chuva'], ['marrom', '🌫️', 'Ruído marrom'], ['ondas', '🌊', 'Ondas'], ['cafe', '☕', 'Cafeteria'], ['rosa', '🎧', 'Ruído rosa']];
function tocar(id) {
  if (som) { try { som.stop(); } catch {} som = null; }
  somId = id; if (id === 'silencio') return;
  try {
    const ctx = audio();
    const src = ctx.createBufferSource(); src.buffer = noiseBuffer(ctx, id === 'marrom' || id === 'ondas' ? 'marrom' : id === 'rosa' ? 'rosa' : 'branco'); src.loop = true;
    const gain = ctx.createGain(); gain.gain.value = id === 'chuva' ? 0.18 : id === 'cafe' ? 0.12 : 0.35;
    let node = src;
    if (id === 'chuva' || id === 'cafe') { const f = ctx.createBiquadFilter(); f.type = id === 'chuva' ? 'highpass' : 'bandpass'; f.frequency.value = id === 'chuva' ? 900 : 500; f.Q.value = id === 'cafe' ? 0.6 : 0.7; node.connect(f); node = f; }
    if (id === 'ondas') { const lfo = ctx.createOscillator(), lg = ctx.createGain(); lfo.frequency.value = 0.09; lg.gain.value = 0.25; lfo.connect(lg); lg.connect(gain.gain); lfo.start(); }
    node.connect(gain); gain.connect(ctx.destination); src.start();
    som = { stop: () => src.stop() };
  } catch { toast('Este aparelho não conseguiu tocar o som.'); }
}
function beep() { try { const ctx = audio(); [0, .25, .5].forEach(t => { const o = ctx.createOscillator(), g = ctx.createGain(); o.frequency.value = 880; g.gain.setValueAtTime(.0001, ctx.currentTime + t); g.gain.exponentialRampToValueAtTime(.25, ctx.currentTime + t + .02); g.gain.exponentialRampToValueAtTime(.0001, ctx.currentTime + t + .2); o.connect(g); g.connect(ctx.destination); o.start(ctx.currentTime + t); o.stop(ctx.currentTime + t + .22); }); } catch {} }

// ---------- timer ----------
const stop = () => { T.running = false; clearInterval(tick); tick = null; notify(); };
const setMode = m => { stop(); T.mode = m; T.left = dur()[m] * 60; T.startedAt = null; notify(); };
async function finish() {
  stop(); beep();
  if (T.mode === 'foco') {
    T.cycle++;
    const secs = dur().foco * 60;
    await store.append('study_sessions', { kind: 'foco', subject: (T.subject || '').trim().slice(0, 60) || null, started_at: T.startedAt || new Date(Date.now() - secs * 1000).toISOString(), duration_sec: secs });
    toast(`Bloco concluído! +${dur().foco} XP. Hora da pausa.`, 3000);
    if (document.hidden && 'Notification' in window && Notification.permission === 'granted') new Notification('Educa Mais', { body: 'Bloco de foco concluído. Hora da pausa!' });
    setMode(T.cycle % 4 === 0 ? 'longa' : 'curta');
  } else { toast('Pausa encerrada. Bora voltar!'); setMode('foco'); }
}
function run() { clearInterval(tick); tick = setInterval(() => { T.left = Math.max(0, Math.round((T.endAt - Date.now()) / 1000)); notify(); if (T.left <= 0) finish(); }, 250); }
function toggle() {
  if (T.running) { stop(); return; }
  try { audio(); } catch {}
  if ('Notification' in window && Notification.permission === 'default') Notification.requestPermission().catch(() => {});
  T.running = true; T.endAt = Date.now() + T.left * 1000; if (!T.startedAt) T.startedAt = new Date().toISOString();
  run(); notify();
}

export default function Foco() {
  const [, force] = useState(0);
  const [som2, setSom] = useState(somId);
  const [todo, setTodo] = useState('');
  useEffect(() => { const f = () => force(x => x + 1); subs.add(f); if (T.left == null) T.left = dur()[T.mode] * 60; f(); return () => subs.delete(f); }, []);
  useEffect(() => { const m = String(Math.floor(T.left / 60)).padStart(2, '0') + ':' + String(T.left % 60).padStart(2, '0'); document.title = T.running ? `${m} · Foco` : 'Sala de foco · Educa Mais'; });
  const [d] = useData(async () => { const [cat, sessions] = await Promise.all([catalog(), store.all('study_sessions')]); return { cat, sessions }; }, [], ['study_sessions']);
  const total = dur()[T.mode] * 60;
  const left = T.left ?? total;
  const m = Math.floor(left / 60), s = left % 60;
  const r = 46, C = 2 * Math.PI * r;
  const hoje = (d?.sessions || []).filter(x => dayKey(x.started_at) === dayKey());
  const mins = Math.round(hoje.reduce((a, x) => a + x.duration_sec, 0) / 60);
  const goal = aparencia.settings().daily_goal_min || 60;
  const D = dur();
  const setDur = async (k, v) => { const col = { foco: 'focus_minutes', curta: 'short_break_min', longa: 'long_break_min' }[k]; await aparencia.save({ [col]: +v }); if (!T.running && k === T.mode) T.left = +v * 60; force(x => x + 1); };
  const full = () => { if (document.fullscreenElement) document.exitFullscreen(); else document.documentElement.requestFullscreen?.().catch(() => {}); };
  return html`<div class="room fade-in">
    <section class="room-stage">
      <div class="row wrap" style="justify-content:center">
        <button class="btn ghost sm" onClick=${() => go('inicio')}>← Sair da sala</button>
        <div class="seg">${MODES.map(([k, n]) => html`<button class=${T.mode === k ? 'on' : ''} onClick=${() => setMode(k)}>${n}</button>`)}</div>
        <button class="btn ghost sm hide-sm" onClick=${full}>⛶ Tela cheia</button>
      </div>
      <div class="ring-xl"><svg viewBox="0 0 100 100"><circle cx="50" cy="50" r=${r} fill="none" stroke="var(--panel2)" stroke-width="4" /><circle cx="50" cy="50" r=${r} fill="none" stroke=${T.mode === 'foco' ? 'var(--accent)' : 'var(--ok)'} stroke-width="4" stroke-linecap="round" stroke-dasharray=${C} stroke-dashoffset=${C * (1 - left / total)} style="transition:stroke-dashoffset .3s linear" /></svg>
        <div class="t"><div><div class="clock" role="timer">${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}</div><div class="lbl">${MODES.find(x => x[0] === T.mode)[1]}${T.subject ? ' · ' + T.subject : ''}</div><div class="tiny faint mt">Bloco ${T.cycle % 4 + 1} de 4</div></div></div></div>
      ${T.goal && html`<div class="chip accent" style="font-size:14px;padding:6px 14px">🎯 ${T.goal}</div>`}
      <div class="row"><button class="btn primary lg" style="min-width:160px" onClick=${toggle}>${T.running ? '⏸ Pausar' : left < total ? '▶ Continuar' : '▶ Começar'}</button><button class="btn" onClick=${() => setMode(T.mode)}>↺</button><button class="btn" onClick=${() => T.mode === 'foco' ? setMode(T.cycle % 4 === 3 ? 'longa' : 'curta') : setMode('foco')}>⏭</button></div>
    </section>
    <aside class="room-side">
      <div><div class="row between small"><b>Meta do dia</b><span class="num muted">${mins} de ${goal} min</span></div><div class="mt" style="margin-top:8px"><${Bar} lg value=${mins} max=${goal} ok=${mins >= goal} /></div></div>
      <${Field} label="Estou estudando"><${Select} value=${T.subject} onChange=${v => { T.subject = v; force(x => x + 1); }} all="Escolha a matéria" options=${(d?.cat.subjects || []).map(x => [x.name, x.name])} /></${Field}>
      <${Field} label="Meta desta sessão"><input class="input" maxlength="80" placeholder="Ex.: terminar a lista de funções" value=${T.goal} onInput=${e => { T.goal = e.target.value; force(x => x + 1); }} /></${Field}>
      <div class="col" style="gap:6px"><span class="small muted bold">Tarefas da sessão</span>
        ${T.todos.map((t, i) => html`<label class="check"><input type="checkbox" checked=${t.done} onChange=${() => { t.done = !t.done; force(x => x + 1); }} /><span style=${t.done ? 'text-decoration:line-through;color:var(--muted)' : ''}>${t.t}</span><button class="x" onClick=${() => { T.todos.splice(i, 1); force(x => x + 1); }} aria-label="Remover">×</button></label>`)}
        <input class="input sm" placeholder="+ adicionar tarefa e Enter" value=${todo} onInput=${e => setTodo(e.target.value)} onKeyDown=${e => { if (e.key === 'Enter' && todo.trim()) { T.todos.push({ t: todo.trim(), done: false }); setTodo(''); } }} /></div>
      <div class="col" style="gap:6px"><span class="small muted bold">Som ambiente (funciona sem internet)</span>
        <div class="sound-grid">${SONS.map(([k, ic, n]) => html`<button class=${som2 === k ? 'on' : ''} onClick=${() => { tocar(k); setSom(k); }}><span class="i">${ic}</span>${n}</button>`)}</div></div>
      <div class="grid g3" style="gap:8px">${MODES.map(([k, n]) => html`<${Field} label=${n}><input class="input sm num" type="number" min="1" max=${k === 'foco' ? 180 : 90} value=${D[k]} onChange=${e => setDur(k, Math.min(+e.target.max, Math.max(1, +e.target.value || D[k])))} /></${Field}>`)}</div>
      <div><span class="small muted bold">Hoje</span>${hoje.length ? hoje.slice().reverse().slice(0, 8).map(x => html`<div class="row between small" style="padding:5px 0;border-bottom:1px solid var(--line)"><span>${{ foco: '⏱️ Foco', questoes: '✏️ Questões', revisao: '🃏 Revisão', leitura: '📖 Leitura' }[x.kind] || 'Estudo'}${x.subject ? ': ' + x.subject : ''}</span><span class="muted num">${new Date(x.started_at).toTimeString().slice(0, 5)} · ${fmtMin(x.duration_sec / 60)}</span></div>`) : html`<p class="tiny faint">Nenhuma sessão hoje ainda.</p>`}</div>
    </aside>
  </div>`;
}
