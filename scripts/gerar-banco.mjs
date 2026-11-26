// Gera o BANCO DE QUESTÕES da Educa Mais (milhares de questões autorais no estilo ENEM/vestibular).
// As questões são originais: cada "família" (scripts/banco/*.mjs) é uma ideia de questão
// que gera várias versões parecidas, com números, contextos e exemplos diferentes.
// Saídas:
//   conteudo/banco.json                                 (o app usa sem conta e offline)
//   supabase/migrations/20261126000900_catalogo_ampliado.sql (novas matérias e conteúdos)
//   supabase/banco-de-questoes/parte-NN.sql             (colar no SQL Editor, uma parte por vez)
// Uso: node scripts/gerar-banco.mjs
import { writeFileSync, mkdirSync, readFileSync, rmSync } from 'node:fs';
import { rng } from './banco/util.mjs';
import EXATAS from './banco/exatas.mjs';
import { LINGUAGENS, HUMANAS, NATUREZA, DIREITO } from './banco/tabelas.mjs';

const root = new URL('..', import.meta.url);
const cat = JSON.parse(readFileSync(new URL('conteudo/catalogo.json', root)));

const NOVAS_MATERIAS = [
  { id: 11, area: 1, name: 'Literatura', color: '#8a4b14' },
  { id: 12, area: 4, name: 'Sociologia', color: '#a8326e' },
  { id: 13, area: 4, name: 'Filosofia', color: '#5a4fcf' }
];
const subjects = [...cat.subjects, ...NOVAS_MATERIAS];
const SIGLA = { 'Português': 'POR', 'Inglês': 'ING', 'Matemática': 'MAT', 'Raciocínio lógico': 'RLO', 'Biologia': 'BIO', 'Física': 'FIS', 'Química': 'QUI', 'História': 'HIS', 'Geografia': 'GEO', 'Direito': 'DIR', 'Literatura': 'LIT', 'Sociologia': 'SOC', 'Filosofia': 'FIL' };

// Conteúdos: reaproveita os que já existem (mesmo nome e matéria) e cria os novos a partir do id 100
const topics = cat.topics.map(t => ({ ...t }));
const novosTopicos = [];
let nextTopic = 100;
function topicId(subjectId, [pai, filho]) {
  const find = (name, parent) => topics.find(t => t.subject === subjectId && t.name === name && (parent === undefined || (t.parent ?? null) === parent));
  let p = find(pai);
  if (!p) { p = { id: nextTopic++, subject: subjectId, name: pai }; topics.push(p); novosTopicos.push(p); }
  let f = find(filho, p.id) || topics.find(t => t.subject === subjectId && t.name === filho);
  if (!f) { f = { id: nextTopic++, subject: subjectId, parent: p.id, name: filho }; topics.push(f); novosTopicos.push(f); }
  return f.id;
}

const hex = (n, w) => n.toString(16).padStart(w, '0');
export const bid = n => `e1000000-0000-4000-a000-${hex(n, 12)}`;
export const boid = (n, p) => `e1000000-0000-4000-b000-${hex(n * 10 + p, 12)}`;

const familias = [...EXATAS, ...LINGUAGENS, ...HUMANAS, ...NATUREZA, ...DIREITO];
const questoes = [];
const vistos = new Set();
const porMateria = {};
let semente = 20261126;
for (const fam of familias) {
  const subj = subjects.find(s => s.name === fam.subject);
  if (!subj) throw new Error('Matéria desconhecida: ' + fam.subject);
  const tId = topicId(subj.id, fam.topic);
  const r = rng(semente++ * 7919);
  let feitas = 0;
  for (let tent = 0; feitas < fam.n && tent < fam.n * 5; tent++) {
    const q = fam.make(r, tent);
    if (!q) continue;
    const chave = q.statement + '|' + [...q.options].sort().join('|');
    if (vistos.has(chave)) continue;
    if (q.options.length !== 5 || q.correct < 0) throw new Error('Questão mal formada em ' + fam.subject);
    vistos.add(chave);
    feitas++;
    porMateria[subj.name] = (porMateria[subj.name] || 0) + 1;
    questoes.push({ subject: subj.id, topic: tId, level: fam.level, difficulty: fam.difficulty, sigla: SIGLA[subj.name], theme: fam.topic[1], ...q });
  }
}

// Identificadores e códigos fixos (ordem determinística)
const now = '2026-11-26T00:00:00.000Z';
const contador = {};
const finais = questoes.map((q, i) => {
  contador[q.sigla] = (contador[q.sigla] || 0) + 1;
  const n = i + 1;
  return {
    id: bid(n), code: `EM-${q.sigla}-${String(contador[q.sigla]).padStart(5, '0')}`, subject_id: q.subject, topic_id: q.topic, level: q.level,
    difficulty: q.difficulty, board_id: 1, year: 2026, qtype: 'multiple_choice', theme: q.theme, statement: q.statement, image_path: null, image_alt: null,
    explanation: q.explanation, hint: q.hint || null, source: 'Questão autoral da Educa Mais no estilo ENEM/vestibular (2026).', status: 'published', updated_at: now,
    options: q.options.map((o, p) => ({ id: boid(n, p), question_id: bid(n), position: p, body: o, is_correct: p === q.correct }))
  };
});

// 1) Arquivo para o app (sem conta / offline)
const app = {
  versao: 1,
  subjects: NOVAS_MATERIAS.map((s, i) => ({ id: s.id, area_id: s.area, name: s.name, color: s.color, position: cat.subjects.length + i })),
  topics: novosTopicos.map(t => ({ id: t.id, subject_id: t.subject, parent_id: t.parent ?? null, name: t.name })),
  // formato compacto: [código, matéria, conteúdo, nível, dificuldade, tema, enunciado, resolução, dica, alternativas, índice da correta]
  // o id de cada questão é derivado da posição (js/core/banco.js), igual ao do banco de dados
  q: finais.map(q => [q.code, q.subject_id, q.topic_id, q.level, q.difficulty, q.theme, q.statement, q.explanation, q.hint, q.options.map(o => o.body), q.options.findIndex(o => o.is_correct)])
};
writeFileSync(new URL('conteudo/banco.json', root), JSON.stringify(app));

// 2) Migração com o catálogo ampliado
const lit = v => v == null ? 'null' : typeof v === 'number' ? String(v) : `'${String(v).replace(/'/g, "''")}'`;
const mig = [
  '-- Gerado por scripts/gerar-banco.mjs. Novas matérias e conteúdos usados pelo banco de questões.',
  'insert into public.subjects (id, area_id, name, color, position) overriding system value values',
  app.subjects.map(s => `  (${s.id}, ${s.area_id}, ${lit(s.name)}, ${lit(s.color)}, ${s.position})`).join(',\n') + '\non conflict (id) do nothing;',
  'insert into public.topics (id, subject_id, parent_id, name) overriding system value values',
  app.topics.filter(t => !t.parent_id).concat(app.topics.filter(t => t.parent_id)).map(t => `  (${t.id}, ${t.subject_id}, ${t.parent_id ?? 'null'}, ${lit(t.name)})`).join(',\n') + '\non conflict (id) do nothing;',
  "select setval(pg_get_serial_sequence('public.subjects', 'id'), greatest((select max(id) from public.subjects), 1000));",
  "select setval(pg_get_serial_sequence('public.topics', 'id'), greatest((select max(id) from public.topics), 1000));"
];
writeFileSync(new URL('supabase/migrations/20261126000900_catalogo_ampliado.sql', root), mig.join('\n') + '\n');

// 3) Questões em partes (o SQL Editor do Supabase aceita bem arquivos de até ~1 MB)
const dir = new URL('supabase/banco-de-questoes/', root);
rmSync(dir, { recursive: true, force: true });
mkdirSync(dir, { recursive: true });
const POR_PARTE = 600;
const partes = Math.ceil(finais.length / POR_PARTE);
for (let p = 0; p < partes; p++) {
  const lote = finais.slice(p * POR_PARTE, (p + 1) * POR_PARTE);
  const s = [`-- Educa Mais · banco de questões, parte ${p + 1} de ${partes} (gerado por scripts/gerar-banco.mjs)`,
    '-- Cole no Supabase > SQL Editor e clique em Run. Pode rodar de novo sem duplicar nada.',
    'begin;',
    'insert into public.questions (id, code, subject_id, topic_id, level, difficulty, board_id, year, qtype, theme, statement, explanation, hint, source, status) values',
    lote.map(q => `  (${lit(q.id)}, ${lit(q.code)}, ${q.subject_id}, ${q.topic_id}, ${lit(q.level)}, ${q.difficulty}, ${q.board_id}, ${q.year}, 'multiple_choice', ${lit(q.theme)}, ${lit(q.statement)}, ${lit(q.explanation)}, ${lit(q.hint)}, ${lit(q.source)}, 'published')`).join(',\n') + '\non conflict (id) do nothing;',
    'insert into public.question_options (id, question_id, position, body, is_correct) values',
    lote.flatMap(q => q.options.map(o => `  (${lit(o.id)}, ${lit(q.id)}, ${o.position}, ${lit(o.body)}, ${o.is_correct})`)).join(',\n') + '\non conflict (id) do nothing;',
    'commit;'];
  writeFileSync(new URL(`parte-${String(p + 1).padStart(2, '0')}.sql`, dir), s.join('\n') + '\n');
}

console.log(`ok: ${finais.length} questões em ${partes} partes, ${novosTopicos.length} conteúdos novos`);
console.log(Object.entries(porMateria).map(([k, v]) => `  ${k}: ${v}`).join('\n'));
