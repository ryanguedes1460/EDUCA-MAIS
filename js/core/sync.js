// Sincronização entre o aparelho e o banco de dados.
// 1) Envia a fila de alterações feitas (inclusive offline).
// 2) Baixa o que mudou no servidor desde a última vez (outros aparelhos).
// 3) Atualiza a cópia local do conteúdo (questões, matérias) para uso offline.
import { sb, configured } from './backend.js';
import * as auth from './auth.js';
import * as store from './store.js';
import { USER_TABLES, PUSH_ORDER, toRemote, fromRemote, mergeRemote } from './tabelas.js';
import { emit, on } from './bus.js';
import { debounce } from './util.js';

export const status = { state: configured ? 'idle' : 'local', pending: 0, rejected: 0, lastSync: null, error: '' };
let running = null, again = false, retryMs = 5000, retryTimer = null;

function publish(patch) { Object.assign(status, patch); emit('sync:status', { ...status }); }

const isNetworkError = e => !e || e instanceof TypeError || /Failed to fetch|NetworkError|Load failed|fetch/i.test(String(e?.message)) || e.status === 0 || e.status >= 500;

async function refreshCounts() {
  if (!store.currentScope()) return;
  const [pending, rej] = [await store.pendingCount(), (await store.allRaw('rejected')).length];
  publish({ pending, rejected: rej });
}

async function sendBatch(table, rows) {
  const def = USER_TABLES[table];
  const uid = auth.state.user.id;
  const payload = rows.map(r => ({ ...toRemote(table, r), user_id: uid }));
  const q = def.kind === 'append'
    ? sb.from(table).upsert(payload, { onConflict: def.conflict, ignoreDuplicates: true })
    : sb.from(table).upsert(payload, { onConflict: def.conflict });
  const { error, status: st } = await q;
  if (error) { error.status = st; throw error; }
}

export async function push() {
  const entries = await store.outboxAll();
  if (!entries.length) return 0;
  let sent = 0;
  for (const table of PUSH_ORDER) {
    const mine = entries.filter(e => e.table === table);
    if (!mine.length) continue;
    const ids = [...new Set(mine.map(e => e.id))];
    const rows = (await Promise.all(ids.map(id => store.get(table, id)))).filter(Boolean);
    for (let i = 0; i < rows.length; i += 200) {
      const chunk = rows.slice(i, i + 200);
      try {
        await sendBatch(table, chunk);
      } catch (e) {
        if (isNetworkError(e)) throw e;
        // Erro de validação/permissão: isola a linha problemática para não travar a fila
        for (const r of chunk) {
          try { await sendBatch(table, [r]); }
          catch (e2) {
            if (isNetworkError(e2)) throw e2;
            await store.putRaw('rejected', { key: `${table}:${r.id}`, table, id: r.id, error: String(e2.message || e2).slice(0, 300), at: new Date().toISOString(), row: r });
          }
        }
      }
      const done = new Set(chunk.map(r => r.id));
      await store.deleteRaw('outbox', mine.filter(e => done.has(e.id)).map(e => e.seq));
      sent += chunk.length;
    }
    // Entradas cuja linha não existe mais no aparelho
    const missing = new Set(ids.filter(id => !rows.some(r => r.id === id)));
    if (missing.size) await store.deleteRaw('outbox', mine.filter(e => missing.has(e.id)).map(e => e.seq));
  }
  return sent;
}

export async function pull() {
  const outbox = await store.outboxAll();
  let got = 0;
  for (const table of Object.keys(USER_TABLES)) {
    const pend = new Set(outbox.filter(e => e.table === table).map(e => e.id));
    let cursor = await store.meta.get('cur:' + table, '1970-01-01T00:00:00Z');
    for (;;) {
      const { data, error } = await sb.from(table).select('*').gt('synced_at', cursor).order('synced_at').limit(500);
      if (error) throw error;
      if (!data.length) break;
      const rows = [];
      for (const rr of data) {
        const remote = fromRemote(table, rr);
        const local = await store.get(table, remote.id);
        rows.push(mergeRemote(local, remote, pend.has(remote.id)));
      }
      await store.putRaw(table, rows);
      got += rows.length;
      cursor = data[data.length - 1].synced_at;
      await store.meta.set('cur:' + table, cursor);
      if (data.length < 500) break;
    }
  }
  if (got) emit('store:change', { table: '*', source: 'remote' });
  return got;
}

/** Copia o conteúdo publicado para o aparelho (para estudar offline). */
export async function pullContent() {
  for (const t of ['areas', 'subjects', 'topics', 'exam_boards']) {
    const { data, error } = await sb.from(t).select('*').limit(5000);
    if (error) throw error;
    await store.clearRaw(t);
    await store.putRaw(t, data);
  }
  let cursor = await store.meta.get('cur:questions', '1970-01-01T00:00:00Z');
  for (;;) {
    const { data, error } = await sb.from('questions')
      .select('id, code, subject_id, topic_id, level, difficulty, board_id, year, qtype, theme, statement, image_path, image_alt, explanation, hint, source, status, updated_at, question_options(id, question_id, position, body, is_correct)')
      .eq('status', 'published').gt('updated_at', cursor).order('updated_at').limit(500);
    if (error) throw error;
    if (!data.length) break;
    await store.putRaw('questions', data.map(q => ({ ...q, options: (q.question_options || []).sort((a, b) => a.position - b.position), question_options: undefined })));
    cursor = data[data.length - 1].updated_at;
    await store.meta.set('cur:questions', cursor);
    if (data.length < 500) break;
  }
  // Remove do aparelho questões que deixaram de estar publicadas
  const ids = new Set();
  for (let from = 0; ; from += 1000) {
    const { data, error } = await sb.from('questions').select('id').eq('status', 'published').range(from, from + 999);
    if (error) throw error;
    data.forEach(r => ids.add(r.id));
    if (data.length < 1000) break;
  }
  const local = await store.allRaw('questions');
  const gone = local.filter(q => !ids.has(q.id)).map(q => q.id);
  if (gone.length) await store.deleteRaw('questions', gone);
  const { data: settings } = await sb.from('app_settings').select('key, value');
  if (settings) await store.meta.set('app_settings', Object.fromEntries(settings.map(s => [s.key, s.value])));
  await store.meta.set('content_synced_at', new Date().toISOString());
  emit('content:change');
}

export function syncNow({ content = false } = {}) {
  if (running) { again = true; return running; }
  running = (async () => {
    if (!configured || !auth.state.user || !store.currentScope() || store.currentScope() === 'local') { publish({ state: configured ? 'guest' : 'local' }); await refreshCounts(); return; }
    if (!navigator.onLine) { publish({ state: 'offline' }); await refreshCounts(); return; }
    if (auth.isBlocked()) { publish({ state: 'blocked' }); return; }
    publish({ state: 'syncing', error: '' });
    try {
      await push();
      await pull();
      if (content || !(await store.meta.get('content_synced_at'))) await pullContent();
      auth.touchLoginSession().catch(() => {});
      retryMs = 5000;
      publish({ state: 'idle', lastSync: new Date().toISOString() });
    } catch (e) {
      console.warn('sincronização', e);
      const offline = isNetworkError(e);
      publish({ state: offline ? 'offline' : 'error', error: offline ? '' : String(e.message || e) });
      if (/JWT|expired/i.test(String(e.message))) auth.loadProfile().catch(() => {});
      clearTimeout(retryTimer); retryTimer = setTimeout(() => syncNow(), retryMs); retryMs = Math.min(retryMs * 2, 5 * 60e3);
    } finally {
      await refreshCounts();
    }
  })().finally(() => { running = null; if (again) { again = false; syncNow(); } });
  return running;
}

const soon = debounce(() => syncNow(), 1500);

export function start() {
  on('store:change', ({ source } = {}) => { if (source !== 'remote') { refreshCounts(); soon(); } });
  addEventListener('online', () => syncNow({ content: true }));
  addEventListener('offline', () => publish({ state: 'offline' }));
  document.addEventListener('visibilitychange', () => { if (document.visibilityState === 'visible') syncNow(); });
  setInterval(() => { if (document.visibilityState === 'visible') syncNow(); }, 60e3);
  setInterval(() => { if (document.visibilityState === 'visible') syncNow({ content: true }); }, 30 * 60e3);
}

export async function retryRejected() {
  const rej = await store.allRaw('rejected');
  for (const r of rej) await store.put(r.table, r.row);
  await store.clearRaw('rejected');
  return syncNow();
}
export async function discardRejected() { await store.clearRaw('rejected'); await refreshCounts(); }
export { refreshCounts };
