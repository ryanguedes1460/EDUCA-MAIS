// Ferramentas do professor: montar PDF com questões (do banco da plataforma ou do próprio banco)
// e pesquisar na internet sem sair da plataforma (Wikipédia + atalhos para buscadores).
// A administração pode ligar ou desligar cada ferramenta por professor (prof_pdf, prof_pesquisa).
import { html, useState, useEffect, useMemo, useApp, go, PageHead, Field, Select, Tabs, Empty, Loading, toast, subjectIcon } from '../ui.js';
import * as auth from '../../core/auth.js';
import * as controles from '../../core/controles.js';
import { sb, configured } from '../../core/backend.js';
import { catalog, DIFFICULTY, bancoCarregando } from '../../core/conteudo.js';
import { on } from '../../core/bus.js';
import { norm, esc, richText, plainText } from '../../core/util.js';
import { registrar } from '../../core/atividade.js';
import { oficial, referencia } from './questoes.js';

const LETRAS = ['A', 'B', 'C', 'D', 'E', 'F'];
// Sem conta configurada (modo local / prévia) as ferramentas ficam abertas para demonstração.
const pode = f => !configured || controles.profPode(f);

// ------------------------------------------------------------------ PDF
function embaralhar(arr, seed) { const a = [...arr]; let s = seed || 1; const r = () => (s = (s * 16807) % 2147483647) / 2147483647; for (let i = a.length - 1; i > 0; i--) { const j = Math.floor(r() * (i + 1)); [a[i], a[j]] = [a[j], a[i]]; } return a; }

function montarHTML(qs, o, cat) {
  const cab = [o.escola, o.professor && 'Professor(a): ' + o.professor, o.turma && 'Turma: ' + o.turma, o.data && 'Data: ' + o.data].filter(Boolean).map(esc).join(' · ');
  const item = (q, i) => `<section class="pq"><div class="pq-h"><b>Questão ${i + 1}</b>${o.referencia ? ` <span>(${esc(referencia(q, cat))})</span>` : ''}</div>
    <div class="pq-t">${richText(q.statement)}</div>
    <ol class="pq-o">${q.options.map((op, k) => `<li><b>${LETRAS[k]})</b> <span>${richText(op.body)}</span></li>`).join('')}</ol></section>`;
  const gab = o.gabarito ? `<section class="pg"><h2>Gabarito</h2><div class="pg-l">${qs.map((q, i) => `<span>${i + 1}: <b>${LETRAS[q.options.findIndex(x => x.is_correct)] || '–'}</b></span>`).join('')}</div>
    ${o.resolucao ? qs.map((q, i) => `<p><b>${i + 1}.</b> ${esc(plainText(q.explanation))}</p>`).join('') : ''}</section>` : '';
  return `<header class="ph"><h1>${esc(o.titulo || 'Lista de exercícios')}</h1>${cab ? `<p>${cab}</p>` : ''}
    ${o.nome ? '<p class="pn">Nome: ______________________________________________ Nº: ______</p>' : ''}${o.instrucoes ? `<p class="pi">${esc(o.instrucoes)}</p>` : ''}</header>
    <main class="${o.colunas ? 'p2' : ''}">${qs.map(item).join('')}</main>${gab}
    <footer class="pf">Gerado na Educa Mais · ${qs.length} questões${qs.some(oficial) ? ' · Questões do ENEM: provas oficiais do INEP' : ''}</footer>`;
}

function imprimir(conteudo) {
  let root = document.getElementById('print-root');
  if (!root) { root = document.createElement('div'); root.id = 'print-root'; document.body.appendChild(root); }
  root.innerHTML = conteudo;
  document.documentElement.dataset.printing = '1';
  const fim = () => { delete document.documentElement.dataset.printing; root.innerHTML = ''; window.removeEventListener('afterprint', fim); };
  window.addEventListener('afterprint', fim);
  // espera as imagens carregarem antes de abrir a janela de impressão
  const imgs = [...root.querySelectorAll('img')];
  Promise.all(imgs.map(i => i.complete ? 1 : new Promise(r => { i.onload = i.onerror = r; setTimeout(r, 4000); }))).then(() => setTimeout(() => window.print(), 50));
}

function GerarPDF({ cat }) {
  const [fonte, setFonte] = useState('plataforma');
  const [meu, setMeu] = useState(null);
  const [f, setF] = useState({ subject: '', topic: '', origem: '', year: '', difficulty: '', q: '' });
  const [sel, setSel] = useState([]);
  const [o, setO] = useState({ titulo: 'Lista de exercícios', escola: '', professor: auth.state.profile?.display_name || '', turma: '', data: new Date().toLocaleDateString('pt-BR'), instrucoes: 'Leia com atenção e marque uma alternativa em cada questão.', nome: true, referencia: true, gabarito: true, resolucao: false, colunas: false, embaralhar: false });
  const [qtd, setQtd] = useState(10);
  const podeMeu = configured && auth.isLogged() && controles.profPode('prof_banco');
  const podeGeral = !configured || controles.profPode('prof_banco_geral');

  useEffect(() => {
    if (fonte !== 'meu' || meu || !podeMeu) return;
    sb.from('questions').select('id, code, subject_id, topic_id, level, difficulty, board_id, year, theme, statement, explanation, source, question_options(id, position, body, is_correct)').eq('owner_id', auth.state.user.id).neq('status', 'archived').order('updated_at', { ascending: false }).limit(1000)
      .then(({ data, error }) => { if (error) { toast('Não foi possível abrir o seu banco: ' + error.message); setMeu([]); return; } setMeu(data.map(q => ({ ...q, options: (q.question_options || []).sort((a, b) => a.position - b.position) }))); });
  }, [fonte]);

  const base = fonte === 'meu' ? (meu || []) : podeGeral ? cat.bank : [];
  const set = (k, v) => setF(x => ({ ...x, [k]: v, ...(k === 'subject' ? { topic: '' } : {}) }));
  const res = useMemo(() => {
    const t = norm(f.q).split(/\s+/).filter(Boolean);
    return base.filter(q => (!f.subject || q.subject_id === +f.subject) && (!f.topic || q.topic_id === +f.topic || cat.topic(q.topic_id)?.parent_id === +f.topic)
      && (!f.origem || (f.origem === 'oficial') === oficial(q)) && (!f.year || q.year === +f.year) && (!f.difficulty || q.difficulty === +f.difficulty)
      && (!t.length || t.every(w => norm(q.statement + ' ' + (q.theme || '') + ' ' + (q.code || '')).includes(w))));
  }, [base, f]);
  const selIds = new Set(sel.map(q => q.id));
  const toggle = q => setSel(s => selIds.has(q.id) ? s.filter(x => x.id !== q.id) : [...s, q]);
  const sortear = () => { const livres = res.filter(q => !selIds.has(q.id)); setSel(s => [...s, ...embaralhar(livres, Date.now() % 100000).slice(0, Math.max(1, Math.min(100, +qtd || 10)))]); };
  const anos = useMemo(() => [...new Set(cat.bank.filter(oficial).map(q => q.year))].sort((a, b) => b - a), [cat]);
  const tops = cat.topics.filter(t => f.subject && t.subject_id === +f.subject && !t.parent_id);
  const gerar = () => {
    if (!sel.length) return toast('Escolha pelo menos uma questão.');
    const qs = o.embaralhar ? embaralhar(sel, Date.now() % 100000) : sel;
    imprimir(montarHTML(qs, o, cat));
    registrar('pdf.gerar', o.titulo, { questoes: qs.length, fonte });
  };
  const opt = (k, label) => html`<label class="check"><input type="checkbox" checked=${o[k]} onChange=${e => setO({ ...o, [k]: e.target.checked })} /> ${label}</label>`;
  const txt = (k, label, ph) => html`<${Field} label=${label}><input class="input" value=${o[k]} placeholder=${ph || ''} maxlength="160" onInput=${e => setO({ ...o, [k]: e.target.value })} /></${Field}>`;

  return html`<div class="col" style="gap:16px">
    <div class="grid-2">
      <section class="card pad col" style="gap:10px"><h3>1. De onde vêm as questões</h3>
        <div class="seg">${[['plataforma', `Banco da plataforma (${cat.bank.length.toLocaleString('pt-BR')})`], ['meu', 'Meu banco de questões']].map(([k, n]) => html`<button class=${fonte === k ? 'on' : ''} onClick=${() => setFonte(k)}>${n}</button>`)}</div>
        ${fonte === 'meu' && !podeMeu && html`<p class="small muted">O seu banco próprio aparece aqui quando você entra com uma conta de professor liberada.</p>`}
        ${fonte === 'plataforma' && !podeGeral && html`<p class="small muted">O uso do banco geral não está liberado para a sua conta.</p>`}
        <div class="grid-2">
          <${Field} label="Matéria"><${Select} value=${f.subject} onChange=${v => set('subject', v)} options=${cat.subjects.map(s => [s.id, s.name])} /></${Field}>
          ${f.subject ? html`<${Field} label="Conteúdo"><${Select} value=${f.topic} onChange=${v => set('topic', v)} options=${tops.map(t => [t.id, t.name])} /></${Field}>` : html`<${Field} label="Dificuldade"><${Select} value=${f.difficulty} onChange=${v => set('difficulty', v)} options=${Object.entries(DIFFICULTY)} /></${Field}>`}
          <${Field} label="Origem"><${Select} value=${f.origem} onChange=${v => set('origem', v)} all="Todas" options=${[['oficial', 'Provas oficiais (ENEM)'], ['autoral', 'Autorais']]} /></${Field}>
          <${Field} label="Ano da prova"><${Select} value=${f.year} onChange=${v => set('year', v)} options=${anos.map(a => [a, String(a)])} /></${Field}>
        </div>
        <${Field} label="Palavra-chave"><input class="input" type="search" value=${f.q} placeholder="Ex.: porcentagem, Balaiada, fotossíntese" onInput=${e => set('q', e.target.value)} /></${Field}>
        <div class="row wrap"><span class="small"><b>${res.length.toLocaleString('pt-BR')}</b> questões encontradas</span>
          <input class="input" type="number" min="1" max="100" value=${qtd} onInput=${e => setQtd(e.target.value)} style="width:80px" aria-label="Quantidade" />
          <button class="btn" disabled=${!res.length} onClick=${sortear}>🎲 Sortear</button></div>
        <div class="pick-list">${res.slice(0, 60).map(q => html`<label class=${'pick' + (selIds.has(q.id) ? ' on' : '')}><input type="checkbox" checked=${selIds.has(q.id)} onChange=${() => toggle(q)} />
          <span><span class="tiny faint">${q.code} · ${referencia(q, cat)} · ${cat.subject(q.subject_id)?.name || ''}</span><br />${(t => t.length > 160 ? t.slice(0, 160) + '…' : t)(plainText(q.statement))}</span></label>`)}
          ${res.length > 60 && html`<p class="tiny faint">Mostrando 60 de ${res.length}. Use os filtros ou o sorteio.</p>`}
          ${fonte === 'meu' && podeMeu && !meu && html`<${Loading} />`}</div>
      </section>
      <section class="card pad col" style="gap:10px"><h3>2. Cabeçalho e opções</h3>
        ${txt('titulo', 'Título', 'Lista de exercícios')}
        <div class="grid-2">${txt('escola', 'Escola ou curso')}${txt('professor', 'Professor(a)')}${txt('turma', 'Turma')}${txt('data', 'Data')}</div>
        ${txt('instrucoes', 'Instruções')}
        <div class="grid-2">${opt('nome', 'Linha para o nome do aluno')}${opt('referencia', 'Mostrar referência (prova e ano)')}${opt('gabarito', 'Gabarito no final')}${opt('resolucao', 'Resolução no gabarito')}${opt('colunas', 'Duas colunas')}${opt('embaralhar', 'Embaralhar a ordem')}</div>
        <h3 class="mt">3. Questões escolhidas (${sel.length})</h3>
        ${sel.length ? html`<ol class="sel-list">${sel.map((q, i) => html`<li><span class="grow small">${q.code} · ${(t => t.slice(0, 80))(plainText(q.statement))}…</span>
          <button class="btn ghost sm" title="Subir" disabled=${!i} onClick=${() => setSel(s => { const a = [...s]; [a[i - 1], a[i]] = [a[i], a[i - 1]]; return a; })}>↑</button>
          <button class="btn ghost sm" title="Tirar" onClick=${() => toggle(q)}>✕</button></li>`)}</ol>
          <button class="btn ghost sm" onClick=${() => setSel([])}>Limpar seleção</button>` : html`<p class="small muted">Marque questões na lista ou use o sorteio.</p>`}
        <button class="btn primary lg mt" disabled=${!sel.length} onClick=${gerar}>📄 Gerar PDF</button>
        <p class="tiny faint">Na janela que abrir, escolha "Salvar como PDF" (ou a impressora). No celular: Compartilhar › Imprimir › Salvar PDF.</p>
      </section>
    </div></div>`;
}

// ------------------------------------------------------------------ Pesquisa
const BUSCADORES = [
  ['Google', t => 'https://www.google.com/search?q=' + encodeURIComponent(t)],
  ['Google Acadêmico', t => 'https://scholar.google.com.br/scholar?q=' + encodeURIComponent(t)],
  ['YouTube', t => 'https://www.youtube.com/results?search_query=' + encodeURIComponent(t)],
  ['Wikipédia', t => 'https://pt.wikipedia.org/w/index.php?search=' + encodeURIComponent(t)],
  ['Khan Academy', t => 'https://pt.khanacademy.org/search?page_search_query=' + encodeURIComponent(t)],
  ['Portal do INEP', t => 'https://www.google.com/search?q=' + encodeURIComponent('site:gov.br/inep ' + t)]
];

function Pesquisa({ cat }) {
  const [t, setT] = useState('');
  const [res, setRes] = useState(null);
  const [aberto, setAberto] = useState(null);
  const [busy, setBusy] = useState(false);
  const buscar = async e => {
    e?.preventDefault(); const termo = t.trim(); if (termo.length < 2) return;
    registrar('pesquisa.web', termo.slice(0, 100));
    if (!navigator.onLine) { setRes({ erro: 'Sem internet agora. Os resultados do banco de questões continuam abaixo.' }); return; }
    setBusy(true); setAberto(null);
    try {
      const r = await fetch('https://pt.wikipedia.org/w/api.php?action=query&list=search&format=json&origin=*&srlimit=8&srsearch=' + encodeURIComponent(termo));
      const j = await r.json();
      setRes({ itens: (j.query?.search || []).map(x => ({ title: x.title, snippet: x.snippet.replace(/<[^>]+>/g, '') })) });
    } catch { setRes({ erro: 'A pesquisa na Wikipédia não respondeu. Use os atalhos para os buscadores.' }); }
    setBusy(false);
  };
  const abrir = async title => {
    setAberto({ title, loading: true });
    try {
      const r = await fetch('https://pt.wikipedia.org/w/api.php?action=query&prop=extracts&explaintext=1&exintro=0&exchars=3000&format=json&origin=*&titles=' + encodeURIComponent(title));
      const j = await r.json(); const pg = Object.values(j.query?.pages || {})[0];
      setAberto({ title, texto: pg?.extract || 'Sem resumo disponível.', url: 'https://pt.wikipedia.org/wiki/' + encodeURIComponent(title.replace(/ /g, '_')) });
    } catch { setAberto({ title, texto: 'Não foi possível abrir o artigo agora.' }); }
  };
  const copiar = async a => { const txt = `${a.texto}\n\nFonte: Wikipédia, "${a.title}". Disponível em: ${a.url}. Acesso em: ${new Date().toLocaleDateString('pt-BR')}.`; try { await navigator.clipboard.writeText(txt); toast('Texto copiado com a fonte'); } catch { toast('Não foi possível copiar. Selecione o texto e copie.'); } };
  const criarQuestao = async a => {
    if (!configured || !auth.isLogged() || !controles.profPode('prof_banco')) return toast('Entre com uma conta de professor para criar questões no seu banco.');
    const { editQuestion, loadCatalog } = await import('../../lib/editor-questao.js');
    await editQuestion({ cat: await loadCatalog(), base: { statement: a.texto.slice(0, 1500), source: `Texto-base: Wikipédia, "${a.title}" (${a.url}).` } });
  };
  const doBanco = useMemo(() => { const w = norm(t).split(/\s+/).filter(x => x.length > 2); if (!w.length || !res) return []; return cat.bank.filter(q => w.every(x => norm(q.statement + ' ' + (q.theme || '')).includes(x))).slice(0, 5); }, [res]);
  return html`<div class="col" style="gap:16px">
    <form class="card pad col" style="gap:10px" onSubmit=${buscar}><h3>Pesquisar na internet</h3>
      <div class="row"><input class="input grow" type="search" value=${t} placeholder="Ex.: Balaiada, efeito estufa, Lei 14.133" onInput=${e => setT(e.target.value)} /><button class="btn primary" disabled=${busy}>${busy ? 'Buscando…' : '🔎 Pesquisar'}</button></div>
      <div class="row wrap">${BUSCADORES.map(([n, u]) => html`<a class="btn ghost sm" href=${t.trim() ? u(t.trim()) : '#'} target="_blank" rel="noopener noreferrer" onClick=${e => { if (!t.trim()) { e.preventDefault(); toast('Escreva o que quer pesquisar.'); } else registrar('pesquisa.web', t.trim().slice(0, 100), { em: n }); }}>${n} ↗</a>`)}</div>
      <p class="tiny faint">A Wikipédia aparece aqui mesmo. Os outros buscadores abrem em uma nova aba. Sempre confira a fonte antes de usar um texto em sala.</p></form>
    ${res?.erro && html`<p class="banner warn">${res.erro}</p>`}
    ${res?.itens && html`<div class="grid-2">
      <section class="card pad col" style="gap:8px"><h3>Wikipédia</h3>${res.itens.length ? res.itens.map(x => html`<button class=${'pick' + (aberto?.title === x.title ? ' on' : '')} onClick=${() => abrir(x.title)} style="text-align:left"><span><b>${x.title}</b><br /><span class="small muted">${x.snippet}…</span></span></button>`) : html`<p class="small muted">Nada encontrado.</p>`}</section>
      <section class="card pad col" style="gap:8px">${aberto ? html`<h3>${aberto.title}</h3>${aberto.loading ? html`<${Loading} />` : html`<p class="small pre" style="max-height:420px;overflow:auto">${aberto.texto}</p>
        <div class="row wrap">${aberto.url && html`<a class="btn ghost sm" href=${aberto.url} target="_blank" rel="noopener noreferrer">Abrir artigo ↗</a>`}<button class="btn ghost sm" onClick=${() => copiar(aberto)}>📋 Copiar com a fonte</button><button class="btn sm" onClick=${() => criarQuestao(aberto)}>✏️ Criar questão com este texto</button></div>`}`
        : html`<${Empty} icon="📖" title="Escolha um resultado">O resumo aparece aqui, com a fonte para citar.</${Empty}>`}</section></div>`}
    ${doBanco.length > 0 && html`<section class="card pad col" style="gap:8px"><h3>No banco de questões da plataforma</h3>${doBanco.map(q => html`<button class="pick" onClick=${() => go('questoes', 'codigos', q.code)} style="text-align:left"><span><span class="tiny faint">${q.code} · ${referencia(q, cat)}</span><br />${plainText(q.statement).slice(0, 180)}…</span></button>`)}</section>`}
  </div>`;
}

export default function Ferramentas({ params = [] }) {
  const [cat, setCat] = useState(null);
  useEffect(() => {
    let vivo = true;
    const ler = async () => { if (bancoCarregando()) { await bancoCarregando(); } const c = await catalog(); if (vivo) setCat(c); };
    ler(); const off = on('content:change', ler);
    return () => { vivo = false; off && off(); };
  }, []);
  const tab = params[0] === 'pesquisa' ? 'pesquisa' : 'pdf';
  const ehProfessor = !configured || auth.can('teacher.area') || auth.can('admin.access');
  if (!ehProfessor) return html`<div class="card"><${Empty} icon="🧑‍🏫" title="Ferramentas do professor">Estas ferramentas são para contas de professor liberadas pela administração.</${Empty}></div>`;
  if (!cat) return html`<${Loading} />`;
  const liberada = tab === 'pdf' ? pode('prof_pdf') : pode('prof_pesquisa');
  return html`<div class="col fade-in" style="gap:18px">
    <${PageHead} eyebrow="Professor" title="Ferramentas do professor" actions=${configured && auth.can('teacher.area') && html`<a class="btn" href="#professor">Meu banco e turmas</a>`}>Monte provas e listas em PDF com questões da plataforma ou do seu banco, e pesquise na internet sem sair daqui.</${PageHead}>
    <${Tabs} value=${tab} onChange=${v => go('ferramentas', v)} items=${[['pdf', '📄 Gerar PDF'], ['pesquisa', '🔎 Pesquisar na internet']]} />
    ${!liberada ? html`<div class="card"><${Empty} icon="🔒" title="Ferramenta não liberada">A administração ainda não liberou esta ferramenta para a sua conta.</${Empty}></div>`
      : tab === 'pdf' ? html`<${GerarPDF} cat=${cat} />` : html`<${Pesquisa} cat=${cat} />`}
  </div>`;
}
