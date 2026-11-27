// Partes do app que a administração desligou para este aluno (tabela student_controls).
// O servidor também confere: aulas, materiais e dúvidas bloqueados não abrem nem pela API.
import { sb } from './backend.js';
import * as auth from './auth.js';
import * as store from './store.js';
import { emit } from './bus.js';

let blocked = new Set(), pending = false;
export const FEATURES = { questoes: 'Questões', flashcards: 'Flashcards', plano: 'Cronograma e metas', foco: 'Foco', anotacoes: 'Anotações', desempenho: 'Desempenho', resultados: 'Resultados', redacao: 'Temas de redação', aulas: 'Aulas', materiais: 'Materiais', turmas: 'Minhas turmas', duvidas: 'Dúvidas' };
export const isPending = () => pending && !auth.can('admin.access');
export const isBlocked = f => (f in FEATURES) && (pending || blocked.has(f)) && !auth.can('admin.access');

export async function load() {
  if (!auth.isLogged()) { blocked = new Set(); pending = false; return; }
  const salvo = await store.meta.get('controles', { blocked: [], pending: false });
  blocked = new Set(salvo.blocked || []); pending = !!salvo.pending;
  if (!navigator.onLine) return;
  const { data, error } = await sb.rpc('my_controls');
  if (error || !data) return;      // servidor antigo (sem a função) ou falha: mantém o que havia
  const novo = { blocked: data.blocked || [], pending: !!data.pending };
  if (novo.blocked.join() !== [...blocked].join() || novo.pending !== pending) {
    blocked = new Set(novo.blocked); pending = novo.pending; await store.meta.set('controles', novo); emit('controles:change');
  }
}
