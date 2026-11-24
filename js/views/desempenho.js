// Painel de desempenho: tempo de estudo, questões, acerto, evolução por matéria,
// assuntos com dificuldade, revisões pendentes, metas, frequência e histórico.
import { html, setHTML, fmtMin, dayKey, weekStart, DAY, pct, plural } from '../core/util.js';
import * as store from '../core/store.js';
import * as auth from '../core/auth.js';
import { on } from '../core/bus.js';
import { catalog } from '../core/conteudo.js';
import { minutesByDay, activeDays, streak, accuracy, weakTopics, lastDays, goalProgress, GOAL_KINDS, dueCount, timeline } from '../lib/stats.js';
import { columns, percentBars, line, heatmap, ring } from '../lib/graficos.js';

let period = 30;

export default {
  title: 'Desempenho',
  async render(el) {
    const draw = async () => {
      const [cat, answers, sessions, reviews, cards, goals] = await Promise.all([catalog(), store.all('answers'), store.all('study_sessions'), store.all('flashcard_reviews'), store.all('flashcards'), store.all('goals')]);
      const since = Date.now() - period * DAY;
      const A = answers.filter(a => new Date(a.answered_at) >= since);
      const S = sessions.filter(s => new Date(s.started_at) >= since);
      const R = reviews.filter(r => new Date(r.reviewed_at) >= since);
      const mins = minutesByDay(S);
      const totalMin = Object.values(mins).reduce((a, b) => a + b, 0);
      const ok = A.filter(a => a.is_correct).length;
      const days = activeDays({ sessions, answers, reviews });
      const { bySubject, byTopic } = accuracy(A, cat.questions, cat.subjects, cat.topics);
      const weak = weakTopics(byTopic);
      const dayList = lastDays(Math.min(period, 30));
      // Evolução semanal do acerto (últimas 8 semanas)
      const weeks = [];
      for (let i = 7; i >= 0; i--) {
        const s = weekStart(new Date(Date.now() - i * 7 * DAY)).getTime(), e = s + 7 * DAY;
        const w = answers.filter(a => { const t = new Date(a.answered_at).getTime(); return t >= s && t < e; });
        weeks.push({ label: new Date(s).toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit' }), value: w.length ? pct(w.filter(a => a.is_correct).length, w.length) : null });
      }
      // Mapa de frequência: últimas 18 semanas
      const start = weekStart(new Date(Date.now() - 17 * 7 * DAY));
      const allMins = minutesByDay(sessions);
      const heat = [];
      for (let t = start.getTime(); t <= Date.now(); t += DAY) { const k = dayKey(t); heat.push({ key: k, value: (allMins[k] || 0) + (days.has(k) && !allMins[k] ? 1 : 0) }); }
      const activeGoals = goals.filter(g => g.active !== false);
      const tl = timeline({ answers, reviews, sessions, questions: cat.questions }, 25);

      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Seu progresso</span><h1>Desempenho</h1><p>Calculado com o seu histórico real${auth.isLogged() ? ', salvo na sua conta' : ' neste aparelho'}.</p></div>
          <label class="f">Período<select class="input" id="period">${[[7, 'Últimos 7 dias'], [30, 'Últimos 30 dias'], [90, 'Últimos 90 dias'], [3650, 'Todo o período']].map(([v, n]) => html`<option value="${v}" ${period === v ? 'selected' : ''}>${n}</option>`)}</select></label></div>
        <div class="grid g4">
          ${[[fmtMin(totalMin), 'tempo de estudo'], [A.length, 'questões respondidas'], [A.length ? pct(ok, A.length) + '%' : '–', 'taxa de acerto'], [dueCount(cards), 'revisões pendentes'], [streak(days), 'dias seguidos'], [days.size, 'dias com estudo (total)'], [R.length, 'revisões de flashcards'], [S.filter(s => s.kind === 'foco').length, 'blocos de foco']].map(([v, k]) => html`<div class="card stat"><div class="v num">${v}</div><div class="k">${k}</div></div>`)}
        </div>
        <div class="grid g2">
          <div class="card"><h3>Minutos de estudo por dia</h3>${columns(dayList.map(d => ({ label: d.slice(8), value: Math.round(mins[d] || 0) })), { unit: ' min', title: 'Minutos de estudo por dia' })}</div>
          <div class="card"><h3>Evolução do acerto por semana</h3>${weeks.some(w => w.value != null) ? line(weeks, { title: 'Taxa de acerto semanal' }) : html`<p class="muted small">Responda questões para ver sua evolução.</p>`}</div>
        </div>
        <div class="grid g2">
          <div class="card"><h3>Acerto por disciplina</h3>${percentBars(Object.entries(bySubject).map(([label, v]) => ({ label, ...v })).sort((a, b) => a.ok / a.n - b.ok / b.n))}</div>
          <div class="card stack"><h3>Assuntos para reforçar</h3>${weak.length ? html`<div class="list">${weak.slice(0, 8).map(t => html`<div class="row between"><span><b>${t.name}</b> <span class="muted small">${t.subject}</span></span><span class="chip bad num">${Math.round(t.rate * 100)}% · ${t.ok}/${t.n}</span></div>`)}</div><a class="btn ghost sm" href="#questoes">Praticar questões</a>` : html`<p class="muted small">Nenhum assunto abaixo de 60% de acerto (com pelo menos 2 respostas). Continue assim!</p>`}</div>
        </div>
        <div class="grid g2">
          <div class="card stack"><h3>Frequência de estudos</h3>${heatmap(heat)}<p class="muted small">Cada quadrado é um dia (últimas 18 semanas). Mais escuro = mais minutos.</p></div>
          <div class="card stack"><div class="row between"><h3>Metas</h3><a class="btn ghost sm" href="#plano/metas">Gerenciar</a></div>${activeGoals.length ? html`<div class="grid g2">${activeGoals.map(g => { const p = goalProgress(g, { sessions, answers, reviews }); return html`<div class="row" style="flex-wrap:nowrap">${ring(p.value, p.target, GOAL_KINDS[g.kind]?.name)}<div><b class="small">${GOAL_KINDS[g.kind]?.name}</b><p class="muted small num">${p.value}${p.unit || ''} de ${p.target}${p.unit || ''}</p></div></div>`; })}</div>` : html`<p class="muted small">Você ainda não definiu metas.</p>`}</div>
        </div>
        <div class="card"><h3>Histórico recente</h3>${tl.length ? html`<div class="list">${tl.map(i => html`<div class="row between" style="flex-wrap:nowrap"><span style="min-width:0;overflow:hidden;text-overflow:ellipsis;white-space:nowrap">${i.kind === 'answer' ? (i.ok ? '✅ ' : '❌ ') : i.kind === 'review' ? '🔁 ' : '⏱️ '}${i.text.slice(0, 90)}</span><span class="muted small num" style="white-space:nowrap">${i.min ? plural(i.min, 'min', 'min') + ' · ' : ''}${new Date(i.at).toLocaleString('pt-BR', { day: '2-digit', month: '2-digit', hour: '2-digit', minute: '2-digit' })}</span></div>`)}</div>` : html`<p class="muted small">Seu histórico aparece aqui conforme você estuda.</p>`}</div>
      </div>`);
      el.querySelector('#period').onchange = e => { period = +e.target.value; draw(); };
    };
    await draw();
    return on('store:change', ({ source }) => { if (source === 'remote') draw(); });
  }
};
