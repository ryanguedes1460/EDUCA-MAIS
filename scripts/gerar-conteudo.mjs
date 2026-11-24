// Gera, a partir de conteudo/*.json, os dois lugares onde o conteúdo inicial vive:
//   1) supabase/migrations/20261124000500_conteudo_inicial.sql  (banco de dados)
//   2) js/data/conteudo-inicial.js                               (cópia para uso sem conta/offline)
// Os identificadores são fixos, então respostas dadas sem conta continuam válidas ao entrar.
// Uso: node scripts/gerar-conteudo.mjs
import { readFileSync, writeFileSync } from 'node:fs';

const root = new URL('..', import.meta.url);
const cat = JSON.parse(readFileSync(new URL('conteudo/catalogo.json', root)));
const qs = JSON.parse(readFileSync(new URL('conteudo/questoes-iniciais.json', root)));

const hex = (n, w) => n.toString(16).padStart(w, '0');
export const qid = n => `e0000000-0000-4000-a000-${hex(n, 12)}`;
export const oid = (n, p) => `e0000000-0000-4000-b000-${hex(n * 10 + p, 12)}`;
const lit = v => v == null ? 'null' : typeof v === 'number' ? String(v) : `'${String(v).replace(/'/g, "''")}'`;

const sql = [];
sql.push('-- Gerado por scripts/gerar-conteudo.mjs. Não edite à mão: edite conteudo/*.json e rode o script.');
sql.push('-- Conteúdo inicial: áreas, disciplinas, conteúdos, bancas e questões autorais.');
sql.push('insert into public.areas (id, name, position) overriding system value values');
sql.push(cat.areas.map(a => `  (${a.id}, ${lit(a.name)}, ${a.position})`).join(',\n') + '\non conflict (id) do nothing;');
sql.push('insert into public.subjects (id, area_id, name, color, position) overriding system value values');
sql.push(cat.subjects.map((s, i) => `  (${s.id}, ${s.area}, ${lit(s.name)}, ${lit(s.color)}, ${i})`).join(',\n') + '\non conflict (id) do nothing;');
sql.push('insert into public.topics (id, subject_id, parent_id, name) overriding system value values');
sql.push(cat.topics.map(t => `  (${t.id}, ${t.subject}, ${t.parent ?? 'null'}, ${lit(t.name)})`).join(',\n') + '\non conflict (id) do nothing;');
sql.push('insert into public.exam_boards (id, name, kind) overriding system value values');
sql.push(cat.boards.map(b => `  (${b.id}, ${lit(b.name)}, ${lit(b.kind)})`).join(',\n') + '\non conflict (id) do nothing;');
for (const t of ['areas', 'subjects', 'topics', 'exam_boards'])
  sql.push(`select setval(pg_get_serial_sequence('public.${t}', 'id'), greatest((select max(id) from public.${t}), 1000));`);

sql.push('insert into public.questions (id, code, subject_id, topic_id, level, difficulty, board_id, year, qtype, statement, explanation, hint, source, status) values');
sql.push(qs.map((q, i) => `  (${lit(qid(i + 1))}, ${lit(q.code)}, ${q.subject}, ${q.topic ?? 'null'}, ${lit(q.level)}, ${q.difficulty}, ${q.board ?? 'null'}, ${q.year ?? 'null'}, ${lit(q.qtype)}, ${lit(q.statement)}, ${lit(q.explanation)}, ${lit(q.hint)}, ${lit(q.source)}, 'published')`).join(',\n') + '\non conflict (id) do nothing;');
sql.push('insert into public.question_options (id, question_id, position, body, is_correct) values');
sql.push(qs.flatMap((q, i) => q.options.map((o, p) => `  (${lit(oid(i + 1, p))}, ${lit(qid(i + 1))}, ${p}, ${lit(o)}, ${p === q.correct})`)).join(',\n') + '\non conflict (id) do nothing;');
writeFileSync(new URL('supabase/migrations/20261124000500_conteudo_inicial.sql', root), sql.join('\n') + '\n');

const now = '2026-11-24T00:00:00.000Z';
const data = {
  areas: cat.areas.map(a => ({ id: a.id, name: a.name, position: a.position })),
  subjects: cat.subjects.map((s, i) => ({ id: s.id, area_id: s.area, name: s.name, color: s.color, position: i })),
  topics: cat.topics.map(t => ({ id: t.id, subject_id: t.subject, parent_id: t.parent ?? null, name: t.name })),
  exam_boards: cat.boards.map(b => ({ id: b.id, name: b.name, kind: b.kind })),
  questions: qs.map((q, i) => ({
    id: qid(i + 1), code: q.code, subject_id: q.subject, topic_id: q.topic ?? null, level: q.level, difficulty: q.difficulty,
    board_id: q.board ?? null, year: q.year ?? null, qtype: q.qtype, theme: q.theme ?? null, statement: q.statement,
    image_path: null, image_alt: null, explanation: q.explanation, hint: q.hint, source: q.source, status: 'published', updated_at: now,
    options: q.options.map((o, p) => ({ id: oid(i + 1, p), question_id: qid(i + 1), position: p, body: o, is_correct: p === q.correct }))
  }))
};
writeFileSync(new URL('js/data/conteudo-inicial.js', root),
  '// Gerado por scripts/gerar-conteudo.mjs. Não edite à mão.\n' +
  '// Cópia do conteúdo inicial do banco, usada sem conta e como reserva offline.\n' +
  'export default ' + JSON.stringify(data) + ';\n');
console.log(`ok: ${qs.length} questões, ${cat.topics.length} conteúdos`);
