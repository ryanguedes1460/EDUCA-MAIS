// Banco de questões grande, em dois arquivos compactos:
//   conteudo/banco.json   milhares de questões autorais (ids e1000000-…)
//   conteudo/provas.json  questões oficiais do ENEM 2009–2023 e autorais de concursos (ids e2000000-…)
// Usado por quem estuda sem conta e como reserva offline.
// Aqui eles viram o mesmo formato das questões do banco de dados, com os mesmos ids.
const hex = (n, w) => n.toString(16).padStart(w, '0');
export const bid = n => `e1000000-0000-4000-a000-${hex(n, 12)}`;
export const boid = (n, p) => `e1000000-0000-4000-b000-${hex(n * 10 + p, 12)}`;
export const pid = n => `e2000000-0000-4000-a000-${hex(n, 12)}`;
export const poid = (n, p) => `e2000000-0000-4000-b000-${hex(n * 10 + p, 12)}`;
export const VERSAO = 4;
// As questões dos arquivos têm, no banco de dados, data até esta e ids nesta faixa:
// quem já tem os arquivos no aparelho só precisa baixar do servidor o que mudou depois.
export const DATA = '2026-11-28T00:00:00.000Z';
export const ID_MIN = 'e1000000-0000-4000-a000-000000000000', ID_MAX = 'e2000000-0000-4000-a000-ffffffffffff';

/** Converte um arquivo compacto no formato das tabelas. prefixo 'e2' usa os ids de provas.json. */
export function expandir(raw, prefixo = 'e1') {
  const now = prefixo === 'e2' ? '2026-11-28T00:00:00.000Z' : '2026-11-26T00:00:00.000Z';
  const qid = prefixo === 'e2' ? pid : bid, oid = prefixo === 'e2' ? poid : boid;
  const nomes = Object.fromEntries((raw.boards || []).map(b => [b.id, b.name.replace('Estilo ', '')]));
  const questions = raw.q.map(([code, subject_id, topic_id, level, difficulty, theme, statement, explanation, hint, opts, correct, board, year, source], i) => {
    const n = i + 1, id = qid(n), board_id = board || 1;
    return {
      id, code, subject_id, topic_id, level, difficulty, board_id, year: year || 2026, qtype: 'multiple_choice', theme, statement,
      image_path: null, image_alt: null, explanation, hint,
      source: source || (board_id === 1 ? 'Questão autoral da Educa Mais (2026).' : `Questão autoral da Educa Mais no estilo da prova ${nomes[board_id]} (2026). Não é uma questão oficial.`),
      status: 'published', visibility: 'public', updated_at: now,
      options: opts.map((body, p) => ({ id: oid(n, p), question_id: id, position: p, body, is_correct: p === correct }))
    };
  });
  return { subjects: raw.subjects, topics: raw.topics, boards: raw.boards || [], questions };
}

async function json(nome) {
  const r = await fetch(new URL('../../conteudo/' + nome, import.meta.url));
  if (!r.ok) throw new Error('Banco de questões indisponível');
  return r.json();
}

export async function baixar() {
  const [a, b] = await Promise.all([json('banco.json'), json('provas.json')]);
  const x = expandir(a, 'e1'), y = expandir(b, 'e2');
  return { subjects: [...x.subjects, ...y.subjects], topics: [...x.topics, ...y.topics], boards: [...x.boards, ...y.boards], questions: [...x.questions, ...y.questions] };
}
