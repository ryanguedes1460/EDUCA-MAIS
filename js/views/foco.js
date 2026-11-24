// Timer de foco (Pomodoro). Cada bloco concluído vira uma sessão de estudo no histórico.
import { html, setHTML, $, actions, toast, dayKey } from '../core/util.js';
import * as store from '../core/store.js';
import * as aparencia from '../core/aparencia.js';
import { catalog } from '../core/conteudo.js';

const MODES = [['foco', 'Foco'], ['curta', 'Pausa curta'], ['longa', 'Pausa longa']];
const C = 326.73;
// Estado do timer sobrevive à troca de tela
const T = { mode: 'foco', left: null, running: false, endAt: 0, cycle: 0, startedAt: null, subject: '' };
let tick = null, actx = null;

function beep() { try { actx = actx || new (window.AudioContext || window.webkitAudioContext)(); [0, .25, .5].forEach(t => { const o = actx.createOscillator(), g = actx.createGain(); o.frequency.value = 880; g.gain.setValueAtTime(.0001, actx.currentTime + t); g.gain.exponentialRampToValueAtTime(.25, actx.currentTime + t + .02); g.gain.exponentialRampToValueAtTime(.0001, actx.currentTime + t + .2); o.connect(g).connect(actx.destination); o.start(actx.currentTime + t); o.stop(actx.currentTime + t + .22); }); } catch {} }

export default {
  title: 'Foco',
  async render(el) {
    const cat = await catalog();
    const dur = () => { const s = aparencia.settings(); return { foco: s.focus_minutes || 25, curta: s.short_break_min || 5, longa: s.long_break_min || 15 }; };
    if (T.left == null) T.left = dur()[T.mode] * 60;

    const paint = () => {
      const c = $('#clock', el); if (!c) return;
      const m = Math.floor(T.left / 60), s = T.left % 60;
      c.textContent = `${String(m).padStart(2, '0')}:${String(s).padStart(2, '0')}`;
      $('#ringArc', el).style.strokeDashoffset = C * (1 - T.left / (dur()[T.mode] * 60));
      $('#tStart', el).textContent = T.running ? 'Pausar' : (T.left < dur()[T.mode] * 60 ? 'Continuar' : 'Começar');
      document.title = T.running ? `${c.textContent} · Educa Mais` : 'Foco · Educa Mais';
    };

    const draw = async () => {
      const sessions = await store.all('study_sessions');
      const today = sessions.filter(s => dayKey(s.started_at) === dayKey()).sort((a, b) => b.started_at.localeCompare(a.started_at));
      const mins = Math.round(today.reduce((a, s) => a + s.duration_sec, 0) / 60);
      const goal = aparencia.settings().daily_goal_min || 60;
      const d = dur();
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Concentração</span><h1>Timer de foco</h1><p>Blocos de estudo sem distração, com pausas curtas. A cada 4 blocos, uma pausa longa. Cada bloco concluído entra no seu histórico.</p></div></div>
        <div class="split-r">
          <div class="card timer">
            <div class="row" role="group" aria-label="Modo">${MODES.map(([k, n]) => html`<button type="button" class="chip ${k === T.mode ? 'on' : ''}" data-action="mode" data-m="${k}">${n}</button>`)}</div>
            <div class="ring"><svg viewBox="0 0 120 120" aria-hidden="true"><circle cx="60" cy="60" r="52" fill="none" stroke="var(--surface-2)" stroke-width="10"/><circle id="ringArc" cx="60" cy="60" r="52" fill="none" stroke="${T.mode === 'foco' ? 'var(--brand)' : 'var(--good)'}" stroke-width="10" stroke-linecap="round" stroke-dasharray="326.73"/></svg>
              <div class="t"><div><b id="clock" role="timer" aria-live="off">--:--</b><span>${MODES.find(x => x[0] === T.mode)[1]}</span></div></div></div>
            <div class="row" style="justify-content:center"><button class="btn" id="tStart" type="button" data-action="start" style="min-width:120px">Começar</button><button class="btn ghost" type="button" data-action="reset">Reiniciar</button><button class="btn ghost" type="button" data-action="skip">Pular</button></div>
            <label class="f" style="width:min(320px,100%)">Estou estudando<input class="input" id="subj" list="subjList" value="${T.subject}" placeholder="Ex.: Matemática" maxlength="60"><datalist id="subjList">${cat.subjects.map(s => html`<option value="${s.name}">`)}</datalist></label>
          </div>
          <div class="stack">
            <div class="card"><div class="row between"><h3>Meta do dia</h3><span class="num muted small">${mins} de ${goal} min</span></div><div class="bar lg" style="margin-top:10px"><i style="width:${Math.min(100, mins / goal * 100)}%"></i></div><p class="muted small" style="margin-top:6px">${mins >= goal ? 'Meta batida! 🎉' : `Faltam ${goal - mins} min.`} A meta inclui foco, questões e revisões.</p></div>
            <div class="card stack"><h3>Duração (minutos)</h3><div class="grid g3">${MODES.map(([k, n]) => html`<label class="f">${n}<input class="input num" type="number" min="1" max="${k === 'foco' ? 180 : 90}" value="${d[k]}" data-dur="${k}"></label>`)}</div>
              <label class="f">Meta diária (min)<input class="input num" type="number" min="10" max="720" step="5" value="${goal}" id="goalIn"></label></div>
            <div class="card"><h3>Hoje</h3>${today.length ? html`<div class="list">${today.map(s => html`<div class="row between small"><span>${s.kind === 'foco' ? 'Foco' : s.kind === 'questoes' ? 'Questões' : s.kind === 'revisao' ? 'Revisão' : 'Estudo'}${s.subject ? ': ' + s.subject : ''}</span><span class="muted num">${new Date(s.started_at).toTimeString().slice(0, 5)} · ${Math.round(s.duration_sec / 60)} min</span></div>`)}</div>` : html`<p class="muted small">Nenhuma sessão hoje. Comece o primeiro bloco!</p>`}</div>
          </div></div></div>`);
      $('#subj', el).oninput = e => { T.subject = e.target.value; };
      el.querySelectorAll('[data-dur]').forEach(i => i.onchange = async () => {
        const k = i.dataset.dur, v = Math.min(+i.max, Math.max(1, +i.value || d[k]));
        await aparencia.save({ [{ foco: 'focus_minutes', curta: 'short_break_min', longa: 'long_break_min' }[k]]: v });
        if (!T.running && k === T.mode) T.left = v * 60; paint();
      });
      $('#goalIn', el).onchange = async e => { await aparencia.save({ daily_goal_min: Math.min(720, Math.max(10, +e.target.value || 60)) }); draw(); };
      paint();
    };

    const stop = () => { T.running = false; clearInterval(tick); tick = null; };
    const setMode = m => { stop(); T.mode = m; T.left = dur()[m] * 60; T.startedAt = null; draw(); };
    const finish = async () => {
      stop(); beep();
      if (T.mode === 'foco') {
        T.cycle++;
        const secs = dur().foco * 60;
        await store.append('study_sessions', { kind: 'foco', subject: (T.subject || '').trim().slice(0, 60) || null, started_at: T.startedAt || new Date(Date.now() - secs * 1000).toISOString(), duration_sec: secs });
        toast('Bloco concluído e registrado! Hora da pausa.');
        if (document.hidden && 'Notification' in window && Notification.permission === 'granted') new Notification('Educa Mais', { body: 'Bloco de foco concluído. Hora da pausa!' });
        setMode(T.cycle % 4 === 0 ? 'longa' : 'curta');
      } else { toast('Pausa encerrada. Bora voltar!'); setMode('foco'); }
    };
    const run = () => {
      tick = setInterval(() => { T.left = Math.max(0, Math.round((T.endAt - Date.now()) / 1000)); if (document.body.contains(el)) paint(); if (T.left <= 0) finish(); }, 250);
    };
    actions(el, {
      start() {
        if (T.running) { stop(); paint(); return; }
        try { actx = actx || new (window.AudioContext || window.webkitAudioContext)(); } catch {}
        if ('Notification' in window && Notification.permission === 'default') Notification.requestPermission().catch(() => {});
        T.running = true; T.endAt = Date.now() + T.left * 1000; if (!T.startedAt) T.startedAt = new Date().toISOString();
        run(); paint();
      },
      reset() { setMode(T.mode); },
      skip() { if (T.mode === 'foco') setMode(T.cycle % 4 === 3 ? 'longa' : 'curta'); else setMode('foco'); },
      mode(b) { setMode(b.dataset.m); }
    });
    await draw();
    if (T.running && !tick) run();
    return () => { /* o timer continua contando em segundo plano */ };
  }
};
