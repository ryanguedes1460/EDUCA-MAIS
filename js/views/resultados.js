// Resultados: horas estudadas por mês (com o registro de cada sessão: dia, hora, matéria),
// histórico de respostas, simulados com nota estilo TRI e evolução dos flashcards.
import { html, setHTML, actions, fmtMin, fmtDateTime, pct, DAY } from '../core/util.js';
import * as store from '../core/store.js';
import { catalog } from '../core/conteudo.js';
import { columns, percentBars } from '../lib/graficos.js';

const MESES = ['jan', 'fev', 'mar', 'abr', 'mai', 'jun', 'jul', 'ago', 'set', 'out', 'nov', 'dez'];
const KIND = { foco: 'Timer de foco', questoes: 'Questões', flashcards: 'Flashcards', revisao: 'Revisão', aula: 'Aula' };
const mesKey = d => { const x = new Date(d); return `${x.getFullYear()}-${String(x.getMonth() + 1).padStart(2, '0')}`; };
const mesNome = k => { const [y, m] = k.split('-'); return `${MESES[+m - 1]}/${y}`; };

export default {
  title: 'Resultados',
  async render(el, params) {
    let aba = ['horas', 'respostas', 'simulados', 'flashcards'].includes(params[0]) ? params[0] : 'horas';
    let mes = mesKey(new Date());
    const draw = async () => {
      const [cat, sessions, answers, attempts, cards, reviews] = await Promise.all([catalog(), store.all('study_sessions'), store.all('answers'), store.all('exam_attempts'), store.all('flashcards'), store.all('flashcard_reviews')]);
      const tabs = html`<div class="tabs" role="tablist">${[['horas', 'Horas de estudo'], ['respostas', 'Respostas'], ['simulados', 'Simulados'], ['flashcards', 'Evolução dos flashcards']].map(([k, n]) => html`<button type="button" role="tab" aria-selected="${aba === k}" data-action="aba" data-v="${k}">${n}</button>`)}</div>`;
      let corpo = '';
      if (aba === 'horas') {
        const porMes = {};
        for (const s of sessions) porMes[mesKey(s.started_at)] = (porMes[mesKey(s.started_at)] || 0) + s.duration_sec / 60;
        const ult = []; const d = new Date(); d.setDate(1);
        for (let i = 11; i >= 0; i--) { const x = new Date(d.getFullYear(), d.getMonth() - i, 1); ult.push(mesKey(x)); }
        const doMes = sessions.filter(s => mesKey(s.started_at) === mes).sort((a, b) => b.started_at.localeCompare(a.started_at));
        const porMateria = {};
        doMes.forEach(s => { const k = s.subject || KIND[s.kind] || 'Outros'; porMateria[k] = (porMateria[k] || 0) + s.duration_sec / 60; });
        const totalMes = doMes.reduce((a, s) => a + s.duration_sec / 60, 0);
        const dias = new Set(doMes.map(s => new Date(s.started_at).toDateString())).size;
        corpo = html`<div class="grid g3">${[[fmtMin(totalMes), `estudados em ${mesNome(mes)}`], [dias, 'dias com estudo no mês'], [fmtMin(Object.values(porMes).reduce((a, b) => a + b, 0)), 'total desde o início']].map(([v, k]) => html`<div class="card stat"><div class="v num">${v}</div><div class="k">${k}</div></div>`)}</div>
          <section class="card stack"><h2>Horas por mês</h2>${columns(ult.map(k => ({ label: mesNome(k).slice(0, 3), value: Math.round((porMes[k] || 0) / 6) / 10, title: `${mesNome(k)}: ${fmtMin(porMes[k] || 0)}` })), { unit: ' h' })}
            <label class="f" style="max-width:240px">Ver o mês<select class="input" data-f="mes">${ult.slice().reverse().map(k => html`<option value="${k}" ${k === mes ? 'selected' : ''}>${mesNome(k)} · ${fmtMin(porMes[k] || 0)}</option>`)}</select></label></section>
          ${Object.keys(porMateria).length ? html`<section class="card stack"><h2>O que você estudou em ${mesNome(mes)}</h2>${Object.entries(porMateria).sort((a, b) => b[1] - a[1]).map(([k, v]) => html`<div class="hbar"><div class="row between"><span>${k}</span><span class="num muted small">${fmtMin(v)} · ${pct(v, totalMes)}%</span></div><div class="bar"><i style="width:${pct(v, totalMes)}%"></i></div></div>`)}</section>` : ''}
          <section class="card stack"><h2>Registro de cada sessão</h2>
            ${doMes.length ? html`<div class="table-wrap"><table class="t"><thead><tr><th>Dia e hora em que começou</th><th>O que estudou</th><th>Como</th><th>Duração</th></tr></thead><tbody>
              ${doMes.map(s => html`<tr><td class="num">${fmtDateTime(s.started_at)}</td><td>${s.subject || '–'}</td><td>${KIND[s.kind] || s.kind}</td><td class="num">${fmtMin(s.duration_sec / 60)}</td></tr>`)}</tbody></table></div>`
              : html`<p class="muted small">Nenhuma sessão neste mês. Use o Timer de foco, faça questões ou revise flashcards e tudo fica registrado aqui.</p>`}</section>`;
      } else if (aba === 'respostas') {
        const ult = answers.slice().sort((a, b) => b.answered_at.localeCompare(a.answered_at));
        const por = {};
        answers.forEach(a => { const q = cat.question(a.question_id); const k = cat.subject(q?.subject_id)?.name || 'Outras'; (por[k] ||= [0, 0]); por[k][1]++; if (a.is_correct) por[k][0]++; });
        const ok = answers.filter(a => a.is_correct).length;
        corpo = html`<div class="grid g3">${[[answers.length, 'questões respondidas'], [ok, 'acertos'], [answers.length ? pct(ok, answers.length) + '%' : '–', 'taxa de acerto']].map(([v, k]) => html`<div class="card stat"><div class="v num">${v}</div><div class="k">${k}</div></div>`)}</div>
          ${Object.keys(por).length ? html`<section class="card stack"><h2>Acerto por matéria</h2>${percentBars(Object.entries(por).sort((a, b) => b[1][1] - a[1][1]).map(([k, [a, b]]) => ({ label: k, ok: a, n: b })))}</section>` : ''}
          <section class="card stack"><h2>Histórico de respostas</h2>${ult.length ? html`<div class="table-wrap"><table class="t"><thead><tr><th>Quando</th><th>Questão</th><th>Matéria</th><th>Resultado</th></tr></thead><tbody>
            ${ult.slice(0, 200).map(a => { const q = cat.question(a.question_id); return html`<tr><td class="num small">${fmtDateTime(a.answered_at)}</td><td class="small">${q ? html`<b>${q.code || ''}</b> ${String(q.statement).slice(0, 70)}…` : 'questão removida'}</td><td class="small">${cat.subject(q?.subject_id)?.name || ''}</td><td>${a.is_correct ? html`<span class="chip good">acertou</span>` : html`<span class="chip bad">errou</span>`}</td></tr>`; })}</tbody></table></div>${ult.length > 200 ? html`<p class="muted small">Mostrando as 200 mais recentes.</p>` : ''}` : html`<p class="muted small">Você ainda não respondeu questões.</p>`}</section>`;
      } else if (aba === 'simulados') {
        const feitos = attempts.filter(a => a.finished_at).sort((a, b) => b.finished_at.localeCompare(a.finished_at));
        const notas = await Promise.all(feitos.map(a => store.meta.get('tri:' + a.id, null)));
        corpo = html`<section class="card stack"><h2>Simulados e listas feitos</h2>${feitos.length ? html`<div class="table-wrap"><table class="t"><thead><tr><th>Quando</th><th>Simulado</th><th>Acertos</th><th>Nota estilo TRI</th></tr></thead><tbody>
          ${feitos.map((a, i) => html`<tr><td class="num small">${fmtDateTime(a.finished_at)}</td><td>${a.title || 'Simulado'}</td><td class="num">${a.correct}/${a.total} (${pct(a.correct, a.total)}%)</td><td class="num">${notas[i] ?? '–'}</td></tr>`)}</tbody></table></div>` : html`<p class="muted small">Nenhum simulado concluído. Monte um em Questões > "Fazer simulado".</p>`}
          <p class="muted small">A nota estilo TRI é uma estimativa para treino: como no ENEM, a coerência pesa (acertar as fáceis conta muito).</p></section>`;
      } else {
        const ativos = cards.filter(c => !c.deleted_at);
        const est = { novos: 0, aprendendo: 0, jovens: 0, maduros: 0 };
        ativos.forEach(c => { if (!c.repetitions && !c.last_reviewed_at) est.novos++; else if ((c.interval_days || 0) < 3) est.aprendendo++; else if (c.interval_days < 21) est.jovens++; else est.maduros++; });
        const sem = []; const now = Date.now();
        for (let i = 7; i >= 0; i--) { const a = now - (i + 1) * 7 * DAY, b = now - i * 7 * DAY; const rs = reviews.filter(r => { const t = new Date(r.reviewed_at).getTime(); return t >= a && t < b; }); sem.push({ label: i ? `-${i}s` : 'esta', value: rs.length, title: `${rs.length} revisões, ${pct(rs.filter(r => r.rating >= 2).length, rs.length)}% lembradas` }); }
        const lembradas = reviews.filter(r => r.rating >= 2).length;
        corpo = html`<div class="grid g4">${[[est.novos, 'novos (nunca revisados)'], [est.aprendendo, 'aprendendo'], [est.jovens, 'em fixação (até 3 semanas)'], [est.maduros, 'dominados (3 semanas ou mais)']].map(([v, k]) => html`<div class="card stat"><div class="v num">${v}</div><div class="k">${k}</div></div>`)}</div>
          <section class="card stack"><h2>Revisões por semana</h2>${columns(sem)}<p class="small">Você lembrou de <b>${reviews.length ? pct(lembradas, reviews.length) : 0}%</b> dos cartões em ${reviews.length} revisões.</p></section>
          ${ativos.length ? html`<section class="card stack"><h2>Cartões mais difíceis</h2><div class="list">${ativos.filter(c => c.lapses).sort((a, b) => b.lapses - a.lapses).slice(0, 10).map(c => html`<div class="row between small"><span>${String(c.front).slice(0, 90)}</span><span class="chip bad">${c.lapses} erro(s)</span></div>`)}</div></section>` : ''}`;
      }
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Estatísticas</span><h1>Resultados</h1><p>Tudo o que você estudou fica gravado aqui: horas por mês, cada sessão, respostas, simulados e a evolução dos flashcards.</p></div></div>
        ${tabs}${corpo}</div>`);
      const sel = el.querySelector('[data-f=mes]'); if (sel) sel.onchange = () => { mes = sel.value; draw(); };
    };
    actions(el, { aba(b) { aba = b.dataset.v; history.replaceState(null, '', '#resultados/' + aba); draw(); } });
    await draw();
  }
};
