// Praticar: escolha do modo de treino.
import { html, useState, useApp, useData, go, PageHead, Modal, Field, Select, toast, subjectIcon } from '../ui.js';
import * as store from '../../core/store.js';
import { catalog, DIFFICULTY } from '../../core/conteudo.js';
import { isDue } from '../../lib/srs.js';
import { wrongNow } from '../jogo.js';
import { dayKey } from '../../core/util.js';

export function SimuladoModal({ cat, onClose }) {
  const [n, setN] = useState('20');
  const [min, setMin] = useState('60');
  const [board, setBoard] = useState('');
  const [subject, setSubject] = useState('');
  const [dif, setDif] = useState('');
  const used = new Set(cat.bank.map(q => q.board_id));
  const pool = cat.bank.filter(q => (!board || q.board_id === +board) && (!subject || q.subject_id === +subject) && (!dif || q.difficulty === +dif));
  const start = () => {
    const ids = pool.slice().sort(() => Math.random() - 0.5).slice(0, +n).map(q => q.id);
    if (!ids.length) return toast('Nenhuma questão com essas escolhas.');
    sessionStorage.setItem('em:novoSimulado', JSON.stringify({ ids, min: +min, title: `Simulado${board ? ' ' + (cat.board(+board)?.name || '') : ''} · ${new Date().toLocaleDateString('pt-BR')}` }));
    onClose(); go('questoes', 'novo-simulado', Date.now());
  };
  return html`<${Modal} title="Montar simulado" icon="📝" onClose=${onClose} foot=${html`<button class="btn ghost" onClick=${onClose}>Cancelar</button><button class="btn primary" onClick=${start} disabled=${!pool.length}>Começar (${Math.min(+n, pool.length)} questões)</button>`}>
    <p class="muted small">Como na prova de verdade: você marca as respostas, pode voltar e trocar, e só vê a correção no final, com nota estimada estilo TRI.</p>
    <div class="grid g2">
      <${Field} label="Estilo de prova"><${Select} value=${board} onChange=${setBoard} all="Misturar todos" options=${cat.boards.filter(b => used.has(b.id)).map(b => [b.id, b.name])} /></${Field}>
      <${Field} label="Matéria"><${Select} value=${subject} onChange=${setSubject} all="Todas as matérias" options=${cat.subjects.map(s => [s.id, s.name])} /></${Field}>
      <${Field} label="Dificuldade"><${Select} value=${dif} onChange=${setDif} all="Variada" options=${Object.entries(DIFFICULTY)} /></${Field}>
      <${Field} label="Quantidade"><${Select} value=${n} onChange=${setN} all=${null} options=${[5, 10, 20, 30, 45, 90].map(x => [x, x + ' questões'])} /></${Field}>
      <${Field} label="Tempo"><${Select} value=${min} onChange=${setMin} all=${null} options=${[['0', 'Sem limite'], ['15', '15 min'], ['30', '30 min'], ['60', '1 hora'], ['90', '1h30'], ['180', '3 horas'], ['330', '5h30 (como o ENEM)']]} /></${Field}>
    </div>
    <p class="tiny faint">${pool.length.toLocaleString('pt-BR')} questões disponíveis com essas escolhas.</p>
  </${Modal}>`;
}

export default function Praticar() {
  const app = useApp();
  const [d] = useData(async () => {
    const [cat, answers, cards, attempts] = await Promise.all([catalog(), store.all('answers'), store.all('flashcards'), store.all('exam_attempts')]);
    return { cat, erros: wrongNow(answers).length, due: cards.filter(c => isDue(c)).length, desafio: attempts.some(a => a.filters?.desafio === dayKey() && a.finished_at), aberto: attempts.find(a => !a.finished_at && a.filters?.ids && !a.assignment_id && !a.filters?.desafio) };
  }, [], ['answers', 'flashcards', 'exam_attempts']);
  if (!d) return html`<div class="skeleton" style="height:240px"></div>`;
  const modes = [
    ['🔥', 'Desafio do dia', '5 questões escolhidas para hoje, da mais fácil para a mais difícil. Vale +40 XP.', () => go('desafio'), d.desafio ? html`<span class="chip ok tag">✓ feito hoje</span>` : html`<span class="chip accent tag">novo</span>`],
    ['✏️', 'Banco de questões', `${d.cat.bank.length.toLocaleString('pt-BR')} questões com filtros por estilo de prova, matéria, conteúdo e dificuldade.`, () => go('questoes')],
    ['📝', 'Simulado', 'Cronometrado, com correção no final e nota estimada estilo TRI.', () => app.setModal(html`<${SimuladoModal} cat=${d.cat} onClose=${() => app.setModal(null)} />`), d.aberto ? html`<span class="chip warn tag">1 em andamento</span>` : null],
    ['🩹', 'Caderno de erros', d.erros ? `${d.erros} questões que você errou da última vez. Refaça até acertar.` : 'Quando você errar, a questão aparece aqui para refazer.', () => go('erros'), d.erros ? html`<span class="chip danger tag">${d.erros}</span>` : null],
    ['🃏', 'Flashcards', d.due ? `${d.due} cartões para revisar hoje. Revisão espaçada como no Anki.` : 'Revisão espaçada: o cartão volta logo antes de você esquecer.', () => go('flashcards'), d.due ? html`<span class="chip accent tag">${d.due}</span>` : null],
    ['✍️', 'Redação', 'Temas no estilo ENEM, folha de 30 linhas e cronômetro.', () => go('redacao')]
  ];
  return html`<div class="col fade-in" style="gap:22px">
    <${PageHead} eyebrow="Treino" title="Praticar">Escolha como quer treinar hoje. Tudo conta para o seu nível, as missões e o progresso.</${PageHead}>
    ${d.aberto && html`<div class="card pad row wrap between"><div class="row"><span style="font-size:28px">⏸️</span><div><b>${d.aberto.title}</b><div class="small muted">Simulado em andamento</div></div></div><button class="btn primary" onClick=${() => go('questoes', 'simulado', d.aberto.id)}>Continuar</button></div>`}
    <div class="grid mode-grid">${modes.map(([ic, t, desc, fn, tag]) => html`<button class="card mode" onClick=${fn}>${tag}<span class="ic">${ic}</span><h3>${t}</h3><p class="small muted">${desc}</p></button>`)}</div>
    <section><h2 class="mb">Praticar por matéria</h2>
      <div class="row wrap">${d.cat.subjects.filter(s => d.cat.bank.some(q => q.subject_id === s.id)).map(s => html`<button class="chip" style="padding:7px 14px;font-size:14px" onClick=${() => go('questoes', 'materia', s.id)}>${subjectIcon(s.name)} ${s.name}</button>`)}</div></section>
  </div>`;
}
