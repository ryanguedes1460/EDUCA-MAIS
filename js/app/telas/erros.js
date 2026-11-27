// Caderno de erros: o que você errou da última vez, por matéria, para refazer até acertar.
import { html, useData, go, PageHead, Empty, Bar, subjectIcon } from '../ui.js';
import * as store from '../../core/store.js';
import { catalog } from '../../core/conteudo.js';
import { wrongNow } from '../jogo.js';
import { fmtDate } from '../../core/util.js';

export default function Erros() {
  const [d] = useData(async () => {
    const [cat, answers] = await Promise.all([catalog(), store.all('answers')]);
    const wrong = wrongNow(answers).map(a => ({ a, q: cat.question(a.question_id) })).filter(x => x.q);
    const fixed = new Set(); const seenWrong = new Set();
    for (const a of answers.slice().sort((x, y) => x.answered_at.localeCompare(y.answered_at))) { if (!a.is_correct) seenWrong.add(a.question_id); else if (seenWrong.has(a.question_id)) fixed.add(a.question_id); }
    return { cat, wrong, fixed: fixed.size };
  }, [], ['answers']);
  if (!d) return html`<div class="skeleton" style="height:200px"></div>`;
  const by = new Map();
  for (const x of d.wrong) { const s = d.cat.subject(x.q.subject_id); const k = s?.id ?? 0; if (!by.has(k)) by.set(k, { s, list: [] }); by.get(k).list.push(x); }
  const total = d.wrong.length + d.fixed;
  return html`<div class="col fade-in" style="gap:20px">
    <${PageHead} eyebrow="Revisão inteligente" title="Caderno de erros" actions=${d.wrong.length > 0 && html`<button class="btn primary" onClick=${() => go('questoes', 'revisar')}>🩹 Refazer erros (${Math.min(30, d.wrong.length)})</button>`}>Toda questão que você errou fica aqui até você acertar de novo. Quando acerta, ela sai sozinha.</${PageHead}>
    ${total > 0 && html`<div class="card pad"><div class="row between small"><span>Erros corrigidos</span><span class="num muted">${d.fixed} de ${total}</span></div><div class="mt" style="margin-top:8px"><${Bar} value=${d.fixed} max=${total} ok /></div></div>`}
    ${!d.wrong.length ? html`<div class="card"><${Empty} icon="🎉" title="Nenhum erro pendente" action=${html`<button class="btn primary" onClick=${() => go('questoes')}>Praticar questões</button>`}>Quando você errar uma questão, ela aparece aqui para você refazer.</${Empty}></div>`
      : [...by.values()].sort((a, b) => b.list.length - a.list.length).map(({ s, list }) => html`<section class="card pad col">
        <div class="row between"><h3>${subjectIcon(s?.name)} ${s?.name || 'Outras'} <span class="chip danger">${list.length}</span></h3><button class="btn sm" onClick=${() => go('questoes', 'revisar', s?.id)}>Refazer ${s?.name || ''}</button></div>
        ${list.slice(0, 6).map(({ a, q }) => html`<button class="card qitem" style="padding:10px 14px" onClick=${() => go('questoes', 'codigos', q.code)}><span class="grow"><span class="small">${q.statement.slice(0, 150)}${q.statement.length > 150 ? '…' : ''}</span><div class="tiny faint">${q.code} · errou em ${fmtDate(a.answered_at)}</div></span></button>`)}
        ${list.length > 6 && html`<p class="tiny muted">e mais ${list.length - 6}.</p>`}</section>`)}
  </div>`;
}
