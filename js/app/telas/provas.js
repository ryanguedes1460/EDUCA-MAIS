// Provas: todas as provas e estilos de prova do banco, separados em ENEM, vestibulares e concursos.
// Cada cartão leva às questões daquela prova. Oficial é só o ENEM (INEP); o resto é autoral, no estilo da banca.
import { html, useState, useData, go, PageHead, Seg, Empty } from '../ui.js';
import { catalog } from '../../core/conteudo.js';
import { norm } from '../../core/util.js';

const CONCURSO = new Set([3, 4, 6, 60, 61, 65, 66, 67, 68]);
const grupo = b => b.id === 2 || b.id === 20 ? 'enem' : CONCURSO.has(b.id) ? 'concursos' : 'vestibulares';
const GRUPOS = [['enem', '🎓 ENEM'], ['vestibulares', '🏛️ Vestibulares'], ['concursos', '🏢 Concursos']];
const TEXTO = {
  enem: 'Questões oficiais do ENEM (INEP), com o texto original e a referência de cada uma, e questões autorais no estilo do ENEM.',
  vestibulares: 'Questões autorais da Educa Mais no estilo de cada vestibular, para treinar o jeito de cada prova. Não são questões oficiais.',
  concursos: 'Questões autorais no estilo das bancas e dos concursos do Maranhão, de Imperatriz e região, dos estados vizinhos e por profissão. Não são questões oficiais.'
};

export default function Provas({ params = [] }) {
  const [aba, setAba] = useState(GRUPOS.some(([k]) => k === params[0]) ? params[0] : 'enem');
  const [q, setQ] = useState('');
  const [d] = useData(catalog, []);
  if (!d) return html`<div class="skeleton" style="height:240px"></div>`;
  const cont = new Map(); for (const x of d.bank) cont.set(x.board_id, (cont.get(x.board_id) || 0) + 1);
  const oficiais = d.bank.filter(x => x.board_id === 2).length;
  const boards = d.boards.filter(b => cont.get(b.id) && grupo(b) === aba && (!q || norm(b.name).includes(norm(q)))).sort((a, b) => (b.id === 2) - (a.id === 2) || (b.id === 20) - (a.id === 20) || cont.get(b.id) - cont.get(a.id));
  const nome = b => b.id === 2 ? 'ENEM oficial (INEP)' : (n => n[0].toUpperCase() + n.slice(1))(b.name.replace(/^Estilo /, ''));
  return html`<div class="col fade-in" style="gap:20px">
    <${PageHead} eyebrow="Banco de provas" title="Provas e bancas" actions=${html`<input class="input" style="width:220px" placeholder="Buscar prova ou banca" value=${q} onInput=${e => setQ(e.target.value)} />`}>
      ${d.bank.length.toLocaleString('pt-BR')} questões, ${oficiais.toLocaleString('pt-BR')} delas oficiais do ENEM. Escolha a prova para treinar no jeito dela.</${PageHead}>
    <${Seg} value=${aba} onChange=${setAba} items=${GRUPOS} />
    <p class="small muted" style="margin:-6px 0 0">${TEXTO[aba]}</p>
    <div class="grid feature-grid">${boards.map(b => html`<button class="card feature" onClick=${() => go('questoes', 'banca', b.id)}>
      <div class="ic">${b.id === 2 ? '✅' : aba === 'concursos' ? '🏢' : aba === 'enem' ? '🎓' : '🏛️'}</div>
      <div class="grow"><div class="bold">${nome(b)}</div><div class="small muted">${cont.get(b.id).toLocaleString('pt-BR')} questões · ${b.id === 2 ? 'oficiais' : b.id === 1 ? 'autorais' : 'autorais no estilo'}</div></div></button>`)}</div>
    ${!boards.length && html`<div class="card"><${Empty} icon="🔎" title="Nenhuma prova com esse nome" /></div>`}
    ${aba !== 'concursos' && html`<div class="card pad row wrap between"><div><b>🧠 Revise antes de treinar</b><div class="small muted">Resumos e mapas mentais de todo o ensino médio, do que mais cai ao resto.</div></div><button class="btn" onClick=${() => go('trilhas')}>Abrir trilhas</button></div>`}
  </div>`;
}
