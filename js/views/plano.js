// Plano e metas: cronograma semanal (da v0.2) e metas de estudo com progresso real.
import { html, setHTML, actions, toast, formDialog, confirmDialog, weekdayIdx, weekStart, dayKey, DAY } from '../core/util.js';
import * as store from '../core/store.js';
import { goalProgress, GOAL_KINDS } from '../lib/stats.js';
import { ring } from '../lib/graficos.js';

const DAYS = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'];
const COLORS = ['#2340b8', '#1f8a4c', '#b7791f', '#c2362f', '#7b3fb8', '#0e7c86', '#b8407b'];
const colorOf = name => { let h = 0; for (const ch of name.toLowerCase()) h = (h * 31 + ch.charCodeAt(0)) >>> 0; return COLORS[h % COLORS.length]; };
// Uma tarefa conta como feita se foi marcada nesta semana
const doneThisWeek = t => t.done_on && new Date(t.done_on + 'T12:00:00') >= weekStart();

export default {
  title: 'Plano e metas',
  async render(el, params) {
    let tab = params[0] === 'metas' ? 'metas' : 'cronograma';
    const draw = async () => {
      const [tasks, goals, sessions, answers, reviews] = await Promise.all([store.all('plan_tasks'), store.all('goals'), store.all('study_sessions'), store.all('answers'), store.all('flashcard_reviews')]);
      const today = weekdayIdx();
      const done = tasks.filter(doneThisWeek).length;
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Planejamento</span><h1>Plano e metas</h1><p>Organize a semana e acompanhe suas metas com base no que você realmente estudou.</p></div></div>
        <div class="tabs" role="tablist"><button type="button" role="tab" aria-selected="${tab === 'cronograma'}" data-action="tab" data-t="cronograma">Cronograma da semana</button><button type="button" role="tab" aria-selected="${tab === 'metas'}" data-action="tab" data-t="metas">Metas</button></div>
        ${tab === 'cronograma' ? html`
          <form class="card form-grid" id="newTask">
            <label class="f">Matéria ou atividade<input class="input" name="title" placeholder="Ex.: Português" required maxlength="60"></label>
            <label class="f">Dia<select class="input" name="weekday">${DAYS.map((d, i) => html`<option value="${i}" ${i === today ? 'selected' : ''}>${d}</option>`)}</select></label>
            <label class="f">Horário<input class="input" name="start_time" type="time" value="19:00" required></label>
            <label class="f">Duração (min)<input class="input" name="duration_min" type="number" min="5" max="600" step="5" value="50" required></label>
            <button class="btn" type="submit">Adicionar</button>
          </form>
          <div class="row between"><span class="chip num">${done} de ${tasks.length} concluídas nesta semana</span>${done ? html`<button class="btn ghost sm" type="button" data-action="resetWeek">Desmarcar todas</button>` : ''}</div>
          <div class="week-scroll"><div class="week">${DAYS.map((d, i) => {
            const list = tasks.filter(t => t.weekday === i).sort((a, b) => a.start_time.localeCompare(b.start_time));
            const mins = list.reduce((s, t) => s + (+t.duration_min || 0), 0);
            return html`<div class="day ${i === today ? 'today' : ''}"><h3>${d}<span class="muted num small">${mins ? (mins / 60).toFixed(1).replace('.', ',') + ' h' : ''}</span></h3>
              ${list.length ? list.map(t => html`<div class="task ${doneThisWeek(t) ? 'done' : ''}" style="--c:${colorOf(t.title)}"><input type="checkbox" data-action="toggle" data-id="${t.id}" ${doneThisWeek(t) ? 'checked' : ''} aria-label="Concluir ${t.title}"><span><span class="t-name">${t.title}</span><br><span class="t-time">${t.start_time.slice(0, 5)} · ${t.duration_min} min</span></span><span class="row" style="gap:0;flex-wrap:nowrap"><button class="x" type="button" data-action="edit" data-id="${t.id}" aria-label="Editar ${t.title}">✎</button><button class="x" type="button" data-action="del" data-id="${t.id}" aria-label="Remover ${t.title}">×</button></span></div>`) : html`<span class="muted small">Livre</span>`}</div>`;
          })}</div></div>`
        : html`
          <div class="grid g2">${Object.entries(GOAL_KINDS).map(([kind, info]) => {
            const g = goals.find(x => x.kind === kind && x.active !== false);
            const p = g ? goalProgress(g, { sessions, answers, reviews }) : null;
            return html`<div class="card row" style="align-items:center;flex-wrap:nowrap;gap:16px">${g ? ring(p.value, p.target, info.name) : ''}
              <div style="flex:1;min-width:0" class="stack"><h3>${info.name}</h3>
                ${g ? html`<p class="num">${p.value}${p.unit || ''} de ${p.target}${p.unit || ''} <span class="muted small">${p.label}</span></p>` : html`<p class="muted small">Meta desativada.</p>`}
                <div class="row"><button class="btn sm ${g ? 'ghost' : ''}" type="button" data-action="goal" data-k="${kind}">${g ? 'Alterar' : 'Ativar'}</button>${g ? html`<button class="btn ghost sm" type="button" data-action="goalOff" data-k="${kind}">Desativar</button>` : ''}</div></div></div>`;
          })}</div>
          <p class="muted small">As metas usam seus registros reais: sessões de foco, questões respondidas e revisões de flashcards.</p>`}
      </div>`);
      const f = el.querySelector('#newTask');
      if (f) f.onsubmit = async e => {
        e.preventDefault();
        const title = f.title.value.trim(); if (!title) return;
        await store.put('plan_tasks', { title, weekday: +f.weekday.value, start_time: f.start_time.value || '19:00', duration_min: Math.min(600, Math.max(5, +f.duration_min.value || 50)), done_on: null });
        toast('Adicionado ao cronograma'); draw();
      };
    };
    actions(el, {
      tab(b) { tab = b.dataset.t; history.replaceState(null, '', tab === 'metas' ? '#plano/metas' : '#plano'); draw(); },
      async toggle(b) { const t = await store.get('plan_tasks', b.dataset.id); await store.patch('plan_tasks', t.id, { done_on: b.checked ? dayKey() : null }); draw(); },
      async del(b) { const t = await store.get('plan_tasks', b.dataset.id); if (await confirmDialog(`Remover "${t.title}" do cronograma?`, { ok: 'Remover', danger: true })) { await store.remove('plan_tasks', t.id); toast('Tarefa removida'); draw(); } },
      async edit(b) {
        const t = await store.get('plan_tasks', b.dataset.id);
        const fd = await formDialog('Editar tarefa', html`<div class="form-grid">
          <label class="f">Matéria ou atividade<input class="input" name="title" required maxlength="60" value="${t.title}"></label>
          <label class="f">Dia<select class="input" name="weekday">${DAYS.map((d, i) => html`<option value="${i}" ${i === t.weekday ? 'selected' : ''}>${d}</option>`)}</select></label>
          <label class="f">Horário<input class="input" name="start_time" type="time" value="${t.start_time.slice(0, 5)}"></label>
          <label class="f">Duração (min)<input class="input" name="duration_min" type="number" min="5" max="600" value="${t.duration_min}"></label></div>`,
          { validate: f => String(f.get('title')).trim() ? null : 'Informe a atividade.' });
        if (fd) { await store.patch('plan_tasks', t.id, { title: String(fd.get('title')).trim(), weekday: +fd.get('weekday'), start_time: fd.get('start_time') || '19:00', duration_min: Math.min(600, Math.max(5, +fd.get('duration_min') || 50)) }); draw(); }
      },
      async resetWeek() { for (const t of (await store.all('plan_tasks')).filter(doneThisWeek)) await store.patch('plan_tasks', t.id, { done_on: null }); draw(); },
      async goal(b) {
        const kind = b.dataset.k, info = GOAL_KINDS[kind], cur = await store.get('goals', kind);
        const fd = await formDialog(info.name, html`<label class="f">Meta<input class="input" name="target" type="number" min="1" max="${info.max}" value="${cur?.active !== false && cur?.target || info.def}" required></label>`,
          { validate: f => { const v = +f.get('target'); return v >= 1 && v <= info.max ? null : `Use um valor entre 1 e ${info.max}.`; } });
        if (fd) { await store.put('goals', { ...(cur || {}), id: kind, kind, target: +fd.get('target'), active: true, deleted_at: null }); toast('Meta salva'); draw(); }
      },
      async goalOff(b) { await store.patch('goals', b.dataset.k, { active: false }); draw(); }
    });
    await draw();
  }
};
