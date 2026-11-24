// Acesso ao conteúdo (matérias, conteúdos, bancas e questões) guardado no aparelho.
// Com conta: cópia do banco de dados, atualizada pela sincronização.
// Sem conta: conteúdo inicial que vem junto com o app.
import * as store from './store.js';
import seed from '../data/conteudo-inicial.js';
import { on } from './bus.js';

let cache = null;
on('content:change', () => { cache = null; });
on('store:scope', () => { cache = null; });

export async function ensureSeed() {
  const n = (await store.allRaw('questions')).length;
  if (n) return;
  for (const t of ['areas', 'subjects', 'topics', 'exam_boards']) await store.putRaw(t, seed[t]);
  await store.putRaw('questions', seed.questions);
}

export async function catalog() {
  if (cache) return cache;
  const [areas, subjects, topics, boards, questions] = await Promise.all(['areas', 'subjects', 'topics', 'exam_boards', 'questions'].map(t => store.allRaw(t)));
  areas.sort((a, b) => a.position - b.position || a.name.localeCompare(b.name));
  subjects.sort((a, b) => a.position - b.position || a.name.localeCompare(b.name));
  topics.sort((a, b) => a.name.localeCompare(b.name));
  const published = questions.filter(q => q.status === 'published').sort((a, b) => (a.code || '').localeCompare(b.code || ''));
  cache = {
    areas, subjects, topics, boards, questions: published,
    subject: id => subjects.find(s => s.id === id), topic: id => topics.find(t => t.id === id),
    board: id => boards.find(b => b.id === id), area: id => areas.find(a => a.id === id),
    question: id => published.find(q => q.id === id)
  };
  return cache;
}

export const LEVELS = { fundamental: 'Ensino fundamental', medio: 'Ensino médio', enem: 'ENEM e vestibular', concurso: 'Concursos' };
export const DIFFICULTY = { 1: 'Muito fácil', 2: 'Fácil', 3: 'Média', 4: 'Difícil', 5: 'Muito difícil' };
export const QTYPES = { multiple_choice: 'Múltipla escolha', true_false: 'Certo ou errado' };
