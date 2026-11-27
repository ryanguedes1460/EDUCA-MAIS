// Banco de questões grande (conteudo/banco.json): milhares de questões autorais.
// Usado por quem estuda sem conta e como reserva offline. O arquivo é compacto;
// aqui ele vira o mesmo formato das questões do banco de dados, com os mesmos ids.
const hex = (n, w) => n.toString(16).padStart(w, '0');
export const bid = n => `e1000000-0000-4000-a000-${hex(n, 12)}`;
export const boid = (n, p) => `e1000000-0000-4000-b000-${hex(n * 10 + p, 12)}`;
export const VERSAO = 2;
// Todas as questões do arquivo têm esta data no banco de dados e ids nesta faixa:
// quem já tem o arquivo no aparelho só precisa baixar do servidor o que mudou depois.
export const DATA = '2026-11-26T00:00:00.000Z';
export const ID_MIN = 'e1000000-0000-4000-a000-000000000000', ID_MAX = 'e1000000-0000-4000-a000-ffffffffffff';

export function expandir(raw) {
  const now = '2026-11-26T00:00:00.000Z';
  const nomes = Object.fromEntries((raw.boards || []).map(b => [b.id, b.name.replace('Estilo ', '')]));
  const questions = raw.q.map(([code, subject_id, topic_id, level, difficulty, theme, statement, explanation, hint, opts, correct, board], i) => {
    const n = i + 1, id = bid(n), board_id = board || 1;
    return {
      id, code, subject_id, topic_id, level, difficulty, board_id, year: 2026, qtype: 'multiple_choice', theme, statement,
      image_path: null, image_alt: null, explanation, hint,
      source: board_id === 1 ? 'Questão autoral da Educa Mais (2026).' : `Questão autoral da Educa Mais no estilo da prova ${nomes[board_id]} (2026). Não é uma questão oficial.`,
      status: 'published', visibility: 'public', updated_at: now,
      options: opts.map((body, p) => ({ id: boid(n, p), question_id: id, position: p, body, is_correct: p === correct }))
    };
  });
  return { subjects: raw.subjects, topics: raw.topics, boards: raw.boards || [], questions };
}

export async function baixar() {
  const r = await fetch(new URL('../../conteudo/banco.json', import.meta.url));
  if (!r.ok) throw new Error('Banco de questões indisponível');
  return expandir(await r.json());
}
