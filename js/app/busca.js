// Busca rápida (Ctrl+K ou /): telas, matérias, questões, aulas e anotações.
import { html, useState, useEffect, useRef, useMemo, go, subjectIcon } from './ui.js';
import { norm, plainText } from '../core/util.js';
import { catalog } from '../core/conteudo.js';
import * as store from '../core/store.js';
import * as auth from '../core/auth.js';

const TELAS = [
  ['objetivo', '🎯', 'Meu objetivo', 'nota de corte, prova, plano para passar, vestibular, concurso'],
  ['trilhas', '🧠', 'Trilhas, resumos e mapas mentais', 'ensino médio completo, revisão, conteúdos que mais caem'],
  ['provas', '🏛️', 'Provas e bancas', 'ENEM oficial, vestibulares, concursos de Imperatriz, saúde, educação'],
  ['inicio', '🏠', 'Início', 'painel do dia, missões, nível'], ['estudar', '📚', 'Estudar', 'trilhas por matéria'], ['aulas', '🎬', 'Aulas', 'videoaulas liberadas'],
  ['praticar', '🎯', 'Praticar', 'modos de treino'], ['questoes', '✏️', 'Banco de questões', 'filtros por prova, matéria, dificuldade'], ['desafio', '🔥', 'Desafio do dia', '5 questões novas todo dia'],
  ['erros', '🩹', 'Caderno de erros', 'refazer o que errou'], ['flashcards', '🃏', 'Flashcards', 'revisão espaçada'], ['foco', '⏱️', 'Sala de foco', 'pomodoro, sons, meta'],
  ['progresso', '📈', 'Progresso', 'horas, acertos, conquistas'], ['cronograma', '🗓️', 'Cronograma e metas', 'plano semanal automático'], ['anotacoes', '📝', 'Anotações', 'caderno digital'],
  ['redacao', '✍️', 'Redação', 'temas e folha cronometrada'], ['perfil', '🎨', 'Perfil e mundos', 'tema, cor, letra'], ['conta', '👤', 'Minha conta', 'senha, aparelhos, dados'],
  ['duvidas', '💬', 'Fale conosco', 'dúvidas para o professor, erros para o desenvolvedor'], ['materiais', '📄', 'Materiais', 'PDFs protegidos'], ['turmas', '🏫', 'Minhas turmas', 'listas do professor']
];

export function Busca({ onClose }) {
  const [q, setQ] = useState('');
  const [sel, setSel] = useState(0);
  const [dados, setDados] = useState(null);
  const inp = useRef(null);
  useEffect(() => {
    inp.current?.focus();
    Promise.all([catalog(), store.all('notes'), store.meta.get('aulas:lista', []), import('../data/resumos.js').then(m => m.RESUMOS).catch(() => [])]).then(([cat, notes, aulas, resumos]) => setDados({ cat, notes, aulas, resumos })).catch(() => setDados({ cat: null, notes: [], aulas: [], resumos: [] }));
  }, []);
  const extra = [];
  if (auth.can('teacher.area')) extra.push(['professor', '🧑‍🏫', 'Área do professor', 'banco próprio, turmas, listas']);
  if (auth.can('admin.access')) extra.push(['admin', '🛡️', 'Painel da professora', 'liberar alunos, aulas, questões']);

  const results = useMemo(() => {
    const t = norm(q).trim();
    const groups = [];
    const telas = [...TELAS, ...extra].filter(([, , n, d]) => !t || norm(n + ' ' + d).includes(t)).map(([v, ic, n, d]) => ({ ic, n, d, run: () => go(v) }));
    groups.push(['Ir para', telas.slice(0, t ? 6 : 8)]);
    if (t && dados?.cat) {
      const { cat } = dados;
      const subs = cat.subjects.filter(s => norm(s.name).includes(t)).slice(0, 4).map(s => ({ ic: subjectIcon(s.name), n: s.name, d: 'praticar questões desta matéria', run: () => go('questoes', 'materia', s.id) }));
      if (subs.length) groups.push(['Matérias', subs]);
      const res = (dados.resumos || []).filter(r => norm(r.titulo + ' ' + r.ideia).includes(t)).slice(0, 4).map(r => ({ ic: '🧠', n: r.titulo, d: 'resumo e mapa mental', run: () => go('resumo', r.id) }));
      if (res.length) groups.push(['Resumos', res]);
      const tops = cat.topics.filter(x => norm(x.name).includes(t)).slice(0, 4).map(x => ({ ic: '🔖', n: x.name, d: cat.subject(x.subject_id)?.name || 'conteúdo', run: () => go('questoes', 'conteudo', x.id) }));
      if (tops.length) groups.push(['Conteúdos', tops]);
      if (t.length >= 3) {
        const up = q.trim().toUpperCase();
        const qs = []; for (const x of cat.bank) { if (x.code === up || (t.length >= 4 && norm(x.statement).includes(t))) { qs.push(x); if (qs.length >= 5) break; } }
        if (qs.length) groups.push(['Questões', qs.map(x => ({ ic: '❓', n: (t => t.slice(0, 90) + (t.length > 90 ? '…' : ''))(plainText(x.statement)), d: x.code + ' · ' + (cat.subject(x.subject_id)?.name || ''), run: () => go('questoes', 'codigos', x.code) }))]);
      }
      const aulas = (dados.aulas || []).filter(l => norm(l.title + ' ' + (l.module || '')).includes(t)).slice(0, 4).map(l => ({ ic: '🎬', n: l.title, d: 'aula', run: () => go('aulas', l.id) }));
      if (aulas.length) groups.push(['Aulas', aulas]);
      const notas = (dados.notes || []).filter(n => norm(n.title + ' ' + n.body).includes(t)).slice(0, 4).map(n => ({ ic: '📝', n: n.title || 'Sem título', d: 'anotação', run: () => go('anotacoes', n.id) }));
      if (notas.length) groups.push(['Anotações', notas]);
    }
    return groups.filter(g => g[1].length);
  }, [q, dados]);
  const flat = results.flatMap(g => g[1]);
  useEffect(() => setSel(0), [q]);
  const run = it => { onClose(); setTimeout(it.run, 0); };
  const key = e => {
    if (e.key === 'ArrowDown') { e.preventDefault(); setSel(s => Math.min(flat.length - 1, s + 1)); }
    else if (e.key === 'ArrowUp') { e.preventDefault(); setSel(s => Math.max(0, s - 1)); }
    else if (e.key === 'Enter' && flat[sel]) run(flat[sel]);
    else if (e.key === 'Escape') onClose();
  };
  let i = -1;
  return html`<div class="modal-bg" onClick=${e => { if (e.target === e.currentTarget) onClose(); }}>
    <div class="modal palette" role="dialog" aria-modal="true" aria-label="Busca rápida">
      <input ref=${inp} class="input" placeholder="Buscar telas, matérias, conteúdos, código de questão, aulas…" value=${q} onInput=${e => setQ(e.target.value)} onKeyDown=${key} aria-label="Buscar" />
      <div class="palette-list">
        ${results.map(([g, items]) => html`<div class="palette-group">${g}</div>${items.map(it => { i++; const me = i; return html`<button class=${'palette-item' + (me === sel ? ' on' : '')} onMouseEnter=${() => setSel(me)} onClick=${() => run(it)}><span class="ic">${it.ic}</span><span class="grow"><div class="ellipsis">${it.n}</div><div class="tiny muted ellipsis">${it.d}</div></span></button>`; })}`)}
        ${!flat.length && html`<div class="empty small">Nada encontrado para “${q}”.</div>`}
      </div>
      <div class="modal-foot" style="justify-content:space-between"><span class="tiny muted"><span class="kbd">↑</span> <span class="kbd">↓</span> navegar · <span class="kbd">Enter</span> abrir</span><span class="tiny muted"><span class="kbd">Esc</span> fechar</span></div>
    </div></div>`;
}
