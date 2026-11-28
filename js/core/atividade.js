// Registro de atividade: cada ação relevante do usuário vai para a tabela activity_log,
// que só a administração lê (painel > Atividade). Sem conta, nada é registrado.
// As ações ficam numa fila no aparelho e sobem em lote; sem internet, esperam (até 300).
import { sb } from './backend.js';
import * as auth from './auth.js';
import { on } from './bus.js';

const KEY = 'em:atividade';
const MAX = 300;
let fila = [];
let timer = null, enviando = false, telaAtual = '';
try { fila = JSON.parse(localStorage.getItem(KEY) || '[]'); if (!Array.isArray(fila)) fila = []; } catch { fila = []; }
const salvar = () => { try { localStorage.setItem(KEY, JSON.stringify(fila.slice(-MAX))); } catch {} };

/**
 * Registra uma ação. action: 'tela.abrir', 'questao.responder', 'simulado.entregar'...
 * target: código ou nome do que foi usado. details: dados curtos (sem texto pessoal).
 */
export function registrar(action, target = null, details = {}) {
  if (!auth.isLogged() || !/^[a-z][a-z0-9_.]{1,40}$/.test(action)) return;
  fila.push({ action, target: target == null ? null : String(target).slice(0, 160), details: details || {}, screen: telaAtual.slice(0, 40) || null, device_id: auth.deviceId(), at: new Date().toISOString() });
  if (fila.length > MAX) fila = fila.slice(-MAX);
  salvar();
  clearTimeout(timer); timer = setTimeout(enviar, fila.length >= 20 ? 500 : 8000);
}

export async function enviar() {
  if (enviando || !fila.length || !auth.isLogged() || !navigator.onLine || !sb) return;
  enviando = true;
  const lote = fila.slice(0, 100);
  try {
    const { error } = await sb.from('activity_log').insert(lote);
    if (!error || /activity_log|relation|does not exist/i.test(error.message || '')) {
      // enviado (ou o servidor ainda não tem a tabela: não acumula para sempre)
      fila = fila.slice(lote.length); salvar();
    }
  } catch { /* sem internet: tenta depois */ }
  enviando = false;
  if (fila.length && auth.isLogged()) { clearTimeout(timer); timer = setTimeout(enviar, 3000); }
}

// Gravações no aparelho que viram ação no registro (as respostas de questões são registradas na tela).
const TABELAS = {
  flashcard_reviews: 'flashcard.revisar', flashcards: 'flashcard.salvar', decks: 'baralho.salvar', study_sessions: 'estudo.sessao',
  notes: 'anotacao.salvar', plan_tasks: 'cronograma.tarefa', goals: 'meta.salvar', favorites: 'questao.favoritar',
  lesson_progress: 'aula.progresso', exam_attempts: 'prova.tentativa'
};
const recentes = new Map();
function porTabela({ table, id }) {
  const action = TABELAS[table]; if (!action) return;
  const k = action + ':' + id, agora = Date.now();
  if (agora - (recentes.get(k) || 0) < 60000) return;   // a mesma anotação salva várias vezes conta uma vez por minuto
  recentes.set(k, agora); if (recentes.size > 500) recentes.clear();
  registrar(action, id);
}

export function iniciar() {
  on('store:change', porTabela);
  on('view:change', ({ view, params }) => {
    telaAtual = view;
    registrar('tela.abrir', [view, ...(params || [])].join('/').slice(0, 160));
  });
  on('auth:change', ({ event }) => { if (event === 'SIGNED_OUT') { fila = []; salvar(); } });
  auth.antesDeSair.push(async () => { registrar('conta.sair'); await enviar(); });
  window.addEventListener('online', () => enviar());
  document.addEventListener('visibilitychange', () => { if (document.visibilityState === 'hidden') enviar(); });
}
