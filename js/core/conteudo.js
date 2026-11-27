// Acesso ao conteúdo (matérias, conteúdos, bancas e questões) guardado no aparelho.
// Com conta: cópia do banco de dados, atualizada pela sincronização.
// Sem conta: conteúdo inicial que vem junto com o app.
import * as store from './store.js';
import seed from '../data/conteudo-inicial.js';
import { on, emit } from './bus.js';
import * as auth from './auth.js';
import * as banco from './banco.js';

let cache = null;
on('content:change', () => { cache = null; });
on('store:scope', () => { cache = null; });

export async function ensureSeed() {
  const n = await store.countRaw('questions');   // contar, sem carregar milhares de questões
  if (!n) {
    for (const t of ['areas', 'subjects', 'topics', 'exam_boards']) await store.putRaw(t, seed[t]);
    await store.putRaw('questions', seed.questions);
  }
  // Sem conta: junta o banco grande de questões, sem travar a abertura do app.
  // Com conta, o conteúdo vem do servidor (sincronização).
  if (!auth.isLogged() && !loading && (await store.meta.get('banco_versao', 0)) < banco.VERSAO) loading = carregarBanco().finally(() => { loading = null; });
}
let loading = null;
async function carregarBanco() {
  const escopo = store.currentScope();
  try {
    const b = await banco.baixar();
    if (store.currentScope() !== escopo) return;
    await store.putRaw('subjects', b.subjects); await store.putRaw('topics', b.topics); if (b.boards.length) await store.putRaw('exam_boards', b.boards);
    for (let i = 0; i < b.questions.length; i += 500) {
      if (store.currentScope() !== escopo) return;   // a pessoa entrou na conta no meio: para
      await store.putRaw('questions', b.questions.slice(i, i + 500));
    }
    await store.meta.set('banco_versao', banco.VERSAO);
    cache = null; emit('content:change');
  } catch { /* sem internet na primeira vez: tenta de novo na próxima abertura */ }
}
export const bancoCarregando = () => loading;

export async function catalog() {
  if (cache) return cache;
  const [areas, subjects, topics, boards, questions] = await Promise.all(['areas', 'subjects', 'topics', 'exam_boards', 'questions'].map(t => store.allRaw(t)));
  areas.sort((a, b) => a.position - b.position || a.name.localeCompare(b.name));
  subjects.sort((a, b) => a.position - b.position || a.name.localeCompare(b.name));
  topics.sort((a, b) => a.name.localeCompare(b.name));
  // Com mais de 10 mil questões, compara os códigos direto (localeCompare é lento) e usa um mapa por id
  const published = questions.filter(q => q.status === 'published').sort((a, b) => ((a.code || '') < (b.code || '') ? -1 : (a.code || '') > (b.code || '') ? 1 : 0));
  const porId = new Map(published.map(q => [q.id, q]));
  cache = {
    areas, subjects, topics, boards, questions: published,
    // banco geral (o que aparece na tela Questões); questões de listas dos professores ficam fora
    bank: published.filter(q => !q.visibility || q.visibility === 'public'),
    subject: id => subjects.find(s => s.id === id), topic: id => topics.find(t => t.id === id),
    board: id => boards.find(b => b.id === id), area: id => areas.find(a => a.id === id),
    question: id => porId.get(id)
  };
  return cache;
}

export const LEVELS = { fundamental: 'Ensino fundamental', medio: 'Ensino médio', enem: 'ENEM e vestibular', concurso: 'Concursos' };
export const DIFFICULTY = { 1: 'Muito fácil', 2: 'Fácil', 3: 'Média', 4: 'Difícil', 5: 'Muito difícil' };
export const QTYPES = { multiple_choice: 'Múltipla escolha', true_false: 'Certo ou errado' };
