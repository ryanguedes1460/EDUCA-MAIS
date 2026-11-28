// Gera o banco de PROVAS da Educa Mais (conteudo/provas.json), que completa o banco autoral:
//   1) Questões OFICIAIS do ENEM de 2009 a 2023, com a referência real (ano, dia e número da questão).
//      Fonte dos textos: projeto aberto github.com/yunger7/enem-api, que reúne as provas publicadas pelo INEP.
//      Matéria e conteúdo são classificados automaticamente (scripts/provas/classificar.mjs).
//   2) Questões AUTORAIS no estilo dos concursos do Maranhão e de prefeituras (scripts/provas/concursos.mjs).
// Saídas:
//   conteudo/provas.json                                    (o app usa sem conta e offline)
//   conteudo/enem/<ano>/*.webp                              (imagens das questões do ENEM)
//   supabase/migrations/20261128001200_catalogo_provas.sql  (matérias, conteúdos e bancas novas)
//   supabase/banco-de-questoes/provas-NN.sql                (colar no SQL Editor, uma parte por vez)
// Uso: node scripts/gerar-provas.mjs   (baixa o ENEM na primeira vez para scripts/.cache/)
import { writeFileSync, mkdirSync, readFileSync, readdirSync, existsSync, rmSync } from 'node:fs';
import { execFileSync } from 'node:child_process';
import { classificar, diaDaProva } from './provas/classificar.mjs';
import { MARANHAO, PREFEITURAS, INFORMATICA, CIDADES_PREFEITURAS } from './provas/concursos.mjs';
import EXATAS from './banco/exatas.mjs';
import EXATAS2 from './banco/exatas2.mjs';
import { rng, CIDADES } from './banco/util.mjs';

const root = new URL('..', import.meta.url);
const P = rel => new URL(rel, root).pathname;
const CACHE_Q = P('scripts/.cache/enem-q/'), CACHE_IMG = P('scripts/.cache/enem-img/');
const RAW = 'https://raw.githubusercontent.com/yunger7/enem-api/main/public/';

// ---------------- 0) Baixa o ENEM (uma vez) ----------------
async function baixarEnem() {
  mkdirSync(CACHE_Q, { recursive: true }); mkdirSync(CACHE_IMG, { recursive: true });
  if (readdirSync(CACHE_Q).length > 2500) return;
  const exams = await (await fetch(RAW + 'exams.json')).json();
  const jobs = [];
  for (const e of exams) { const d = await (await fetch(RAW + e.year + '/details.json')).json(); for (const q of d.questions) jobs.push([e.year, q.index + (q.language ? '-' + q.language : '')]); }
  let i = 0;
  const w = async () => { while (i < jobs.length) { const [y, k] = jobs[i++]; const f = `${CACHE_Q}${y}-${k}.json`; if (existsSync(f)) continue; const r = await fetch(`${RAW}${y}/questions/${k}/details.json`); if (r.ok) writeFileSync(f, await r.text()); } };
  await Promise.all(Array.from({ length: 16 }, w));
}
await baixarEnem();

// ---------------- Catálogo ----------------
const cat = JSON.parse(readFileSync(P('conteudo/catalogo.json')));
const banco = JSON.parse(readFileSync(P('conteudo/banco.json')));
const NOVAS_MATERIAS = [
  { id: 14, area: 1, name: 'Espanhol', color: '#c2410c' },
  { id: 15, area: 1, name: 'Artes', color: '#db2777' },
  { id: 16, area: 1, name: 'Educação Física', color: '#16a34a' },
  { id: 17, area: 5, name: 'Conhecimentos do Maranhão', color: '#b91c1c' },
  { id: 18, area: 5, name: 'Informática', color: '#0369a1' },
  { id: 19, area: 5, name: 'Atendimento ao público', color: '#7c3aed' }
];
const NOVAS_BANCAS = [
  { id: 60, name: 'Estilo concursos do Maranhão', kind: 'estilo' },
  { id: 61, name: 'Estilo concursos de prefeituras', kind: 'estilo' }
];
const subjects = [...cat.subjects.map(s => ({ id: s.id, name: s.name })), ...banco.subjects.map(s => ({ id: s.id, name: s.name })), ...NOVAS_MATERIAS];
const topics = [...cat.topics.map(t => ({ id: t.id, subject: t.subject_id ?? t.subject, parent: t.parent_id ?? t.parent ?? null, name: t.name })), ...banco.topics.map(t => ({ id: t.id, subject: t.subject_id, parent: t.parent_id ?? null, name: t.name }))];
const novosTopicos = [];
let nextTopic = 400;
const sid = name => { const s = subjects.find(x => x.name === name); if (!s) throw new Error('Matéria desconhecida: ' + name); return s.id; };
function topicId(subjectId, [pai, filho]) {
  let p = topics.find(t => t.subject === subjectId && t.name === pai && !t.parent);
  if (!p) { p = { id: nextTopic++, subject: subjectId, parent: null, name: pai }; topics.push(p); novosTopicos.push(p); }
  let f = topics.find(t => t.subject === subjectId && t.name === filho && t.parent === p.id) || topics.find(t => t.subject === subjectId && t.name === filho && t.parent);
  if (!f) { f = { id: nextTopic++, subject: subjectId, parent: p.id, name: filho }; topics.push(f); novosTopicos.push(f); }
  return f.id;
}
const SIGLA = { 'Português': 'POR', 'Inglês': 'ING', 'Matemática': 'MAT', 'Raciocínio lógico': 'RLO', 'Biologia': 'BIO', 'Física': 'FIS', 'Química': 'QUI', 'História': 'HIS', 'Geografia': 'GEO', 'Direito': 'DIR', 'Literatura': 'LIT', 'Sociologia': 'SOC', 'Filosofia': 'FIL', 'Espanhol': 'ESP', 'Artes': 'ART', 'Educação Física': 'EDF', 'Conhecimentos do Maranhão': 'CMA', 'Informática': 'INF', 'Atendimento ao público': 'ATP' };

// ---------------- 1) ENEM oficial ----------------
const imagens = [];   // [origem, destino] para converter
const quebradas = /broken-image/;
function imagem(url, ano, chave) {
  const nome = url.split('/').pop().replace(/\.[a-z]+$/i, '');
  const local = `conteudo/enem/${ano}/${chave}-${nome.slice(0, 8)}.webp`;
  imagens.push([CACHE_IMG + url.replace('https://enem.dev/', '').replace(/\//g, '__'), P(local)]);
  return local;
}
async function garantirImagem(url) {
  const f = CACHE_IMG + url.replace('https://enem.dev/', '').replace(/\//g, '__');
  if (existsSync(f)) return;
  const r = await fetch(url.replace('https://enem.dev/', RAW));
  if (!r.ok) throw new Error('Imagem não encontrada: ' + url);
  writeFileSync(f, Buffer.from(await r.arrayBuffer()));
}
const md = (txt, ano, chave) => String(txt || '').replace(/!\[[^\]]*\]\((https:\/\/enem\.dev\/[^)\s]+)\)/g, (_, u) => `![](${imagem(u, ano, chave)})`).replace(/\r/g, '').replace(/\n{3,}/g, '\n\n').trim();

const enem = [];
let puladas = 0;
const arquivos = readdirSync(CACHE_Q).sort((a, b) => { const [ya, ia] = a.split('-').map(x => parseInt(x)); const [yb, ib] = b.split('-').map(x => parseInt(x)); return ya - yb || ia - ib || a.localeCompare(b); });
for (const f of arquivos) {
  const q = JSON.parse(readFileSync(CACHE_Q + f));
  const tudo = [q.context, ...(q.files || []), ...q.alternatives.map(a => a.file || '')].join(' ');
  if (quebradas.test(tudo) || q.alternatives.length !== 5 || q.alternatives.some(a => !a.text && !a.file)) { puladas++; continue; }
  const urls = [...tudo.matchAll(/https:\/\/enem\.dev\/[^\s)"]+/g)].map(m => m[0]);
  for (const u of urls) await garantirImagem(u);
  const chave = String(q.index) + (q.language ? '-' + q.language : '');
  const { subject, topic } = classificar(q);
  const s = sid(subject);
  let statement = md(q.context, q.year, chave);
  const intro = md(q.alternativesIntroduction, q.year, chave);
  statement = [statement, intro].filter(Boolean).join('\n\n');
  if (statement.length < 5 || statement.length > 8000) { puladas++; continue; }
  const opts = q.alternatives.map(a => a.file ? `![](${imagem(a.file, q.year, chave + '-' + a.letter.toLowerCase())})${a.text ? '\n' + md(a.text, q.year, chave) : ''}` : md(a.text, q.year, chave));
  if (new Set(opts).size !== 5 || opts.some(o => !o || o.length > 2000)) { puladas++; continue; }
  const correta = 'ABCDE'.indexOf(q.correctAlternative);
  const lingua = q.language === 'ingles' ? ' (Inglês)' : q.language === 'espanhol' ? ' (Espanhol)' : '';
  enem.push({
    code: `ENEM-${q.year}-${String(q.index).padStart(3, '0')}${q.language ? '-' + q.language.slice(0, 3).toUpperCase() : ''}`,
    subject: s, topic: topicId(s, topic), level: 'enem', difficulty: 3, theme: topic[1], statement,
    explanation: `Gabarito oficial do INEP: alternativa ${q.correctAlternative}.`, hint: null, options: opts, correct: correta, board: 2, year: q.year,
    source: `ENEM ${q.year} · ${diaDaProva(q.year, q.index)}º dia · Questão ${q.index}${lingua} · Prova oficial aplicada pelo INEP.`
  });
}

// ---------------- 2) Concursos (autorais) ----------------
const vistos = new Set(banco.q.map(x => x[6]));
const concursos = [];
const contador = {};
function gerar(familias, board, fator = 1, cidades = null) {
  let semente = 20261128 + board * 1000;
  for (const fam of familias) {
    const s = sid(fam.subject), t = topicId(s, fam.topic);
    const r = rng(semente++ * 7919);
    const alvo = Math.max(1, Math.round(fam.n * fator));
    let feitas = 0;
    for (let tent = 0; feitas < alvo && tent < alvo * 8; tent++) {
      if (cidades) CIDADES.splice(0, CIDADES.length, ...cidades);
      const q = fam.make(r, tent);
      if (!q || vistos.has(q.statement) || /NaN|undefined|Infinity|\[object/.test(q.statement + q.explanation + q.options.join('|'))) continue;
      if (q.options.length !== 5 || new Set(q.options).size !== 5) continue;
      vistos.add(q.statement); feitas++;
      const nomeBanca = board === 60 ? 'concursos do Maranhão' : 'concursos de prefeituras';
      concursos.push({ subject: s, topic: t, level: 'concurso', difficulty: fam.difficulty, theme: fam.topic[1], statement: q.statement, explanation: q.explanation, hint: q.hint || null, options: q.options, correct: q.correct, board, year: 2026, source: `Questão autoral da Educa Mais no estilo dos ${nomeBanca} (2026). Não é uma questão oficial.` });
    }
  }
}
const CIDADES_PADRAO = [...CIDADES];
gerar(MARANHAO, 60);
gerar([...PREFEITURAS, ...INFORMATICA], 61);
// Matemática e raciocínio lógico com situações de cidades do interior do Maranhão
const exatas = [...EXATAS, ...EXATAS2].filter(f => ['Matemática', 'Raciocínio lógico'].includes(f.subject) && f.level !== 'medio');
gerar(exatas, 61, 0.35, CIDADES_PREFEITURAS);
CIDADES.splice(0, CIDADES.length, ...CIDADES_PADRAO);

// ---------------- Saídas ----------------
const hex = (n, w) => n.toString(16).padStart(w, '0');
const pid = n => `e2000000-0000-4000-a000-${hex(n, 12)}`;
const poid = (n, p) => `e2000000-0000-4000-b000-${hex(n * 10 + p, 12)}`;
const todas = [...enem, ...concursos].map((q, i) => {
  if (!q.code) { const sg = SIGLA[subjects.find(s => s.id === q.subject).name]; contador[sg] = (contador[sg] || 0) + 1; q.code = `CO-${sg}-${String(contador[sg]).padStart(5, '0')}`; }
  return { ...q, id: pid(i + 1), n: i + 1 };
});
const VERSAO = 1;
const app = {
  versao: VERSAO,
  boards: NOVAS_BANCAS,
  subjects: NOVAS_MATERIAS.map((s, i) => ({ id: s.id, area_id: s.area, name: s.name, color: s.color, position: 20 + i })),
  topics: novosTopicos.map(t => ({ id: t.id, subject_id: t.subject, parent_id: t.parent, name: t.name })),
  // [código, matéria, conteúdo, nível, dificuldade, tema, enunciado, resolução, dica, alternativas, correta, banca, ano, referência]
  q: todas.map(q => [q.code, q.subject, q.topic, q.level, q.difficulty, q.theme, q.statement, q.explanation, q.hint, q.options, q.correct, q.board, q.year, q.source])
};
writeFileSync(P('conteudo/provas.json'), JSON.stringify(app));

// Imagens
const lista = P('scripts/.cache/imagens.json');
writeFileSync(lista, JSON.stringify(imagens));
execFileSync('python3', [P('scripts/provas/converter_imagens.py'), lista], { stdio: 'inherit' });

// Migração do catálogo
const lit = v => v == null ? 'null' : typeof v === 'number' ? String(v) : `'${String(v).replace(/'/g, "''")}'`;
const mig = [
  '-- Gerado por scripts/gerar-provas.mjs. Matérias, conteúdos e bancas usados pelas questões do ENEM e dos concursos.',
  'insert into public.exam_boards (id, name, kind) overriding system value values',
  app.boards.map(b => `  (${b.id}, ${lit(b.name)}, 'estilo')`).join(',\n') + '\non conflict (id) do nothing;',
  'insert into public.subjects (id, area_id, name, color, position) overriding system value values',
  app.subjects.map(s => `  (${s.id}, ${s.area_id}, ${lit(s.name)}, ${lit(s.color)}, ${s.position})`).join(',\n') + '\non conflict (id) do nothing;',
  'insert into public.topics (id, subject_id, parent_id, name) overriding system value values',
  app.topics.filter(t => !t.parent_id).concat(app.topics.filter(t => t.parent_id)).map(t => `  (${t.id}, ${t.subject_id}, ${t.parent_id ?? 'null'}, ${lit(t.name)})`).join(',\n') + '\non conflict (id) do nothing;'
];
writeFileSync(P('supabase/migrations/20261128001200_catalogo_provas.sql'), mig.join('\n') + '\n');

const dir = P('supabase/banco-de-questoes/');
for (const f of readdirSync(dir).filter(f => f.startsWith('provas-'))) rmSync(dir + f);
const now = '2026-11-28T00:00:00.000Z';
const POR_PARTE = 500;
const partes = Math.ceil(todas.length / POR_PARTE);
for (let p = 0; p < partes; p++) {
  const lote = todas.slice(p * POR_PARTE, (p + 1) * POR_PARTE);
  const s = [`-- Educa Mais · provas (ENEM oficial e concursos), parte ${p + 1} de ${partes} (gerado por scripts/gerar-provas.mjs)`,
    '-- Cole no Supabase > SQL Editor e clique em Run. Pode rodar de novo sem duplicar nada.',
    'begin;',
    'insert into public.questions (id, code, subject_id, topic_id, level, difficulty, board_id, year, qtype, theme, statement, explanation, hint, source, status, updated_at) values',
    lote.map(q => `  (${lit(q.id)}, ${lit(q.code)}, ${q.subject}, ${q.topic}, ${lit(q.level)}, ${q.difficulty}, ${q.board}, ${q.year}, 'multiple_choice', ${lit(q.theme)}, ${lit(q.statement)}, ${lit(q.explanation)}, ${lit(q.hint)}, ${lit(q.source)}, 'published', ${lit(now)})`).join(',\n') + '\non conflict (id) do nothing;',
    'insert into public.question_options (id, question_id, position, body, is_correct) values',
    lote.flatMap(q => q.options.map((o, i) => `  (${lit(poid(q.n, i))}, ${lit(q.id)}, ${i}, ${lit(o)}, ${i === q.correct})`)).join(',\n') + '\non conflict (id) do nothing;',
    'commit;'];
  writeFileSync(`${dir}provas-${String(p + 1).padStart(2, '0')}.sql`, s.join('\n') + '\n');
}

const porMateria = {};
for (const q of todas) { const n = subjects.find(s => s.id === q.subject).name; porMateria[n] = (porMateria[n] || 0) + 1; }
console.log(`ok: ${enem.length} questões do ENEM (${puladas} puladas), ${concursos.length} de concursos, ${imagens.length} imagens, ${novosTopicos.length} conteúdos novos, ${partes} partes SQL`);
console.log(Object.entries(porMateria).map(([k, v]) => `  ${k}: ${v}`).join('\n'));
