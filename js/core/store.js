// Armazenamento local (IndexedDB) com fila de envio ("outbox").
// Cada conta tem seu próprio banco local; quem usa sem conta fica em "local".
// Isso garante que dois usuários no mesmo aparelho não vejam os dados um do outro.
import { ALL_STORES, USER_TABLES } from './tabelas.js';
import { emit } from './bus.js';
import { nowISO, uuid } from './util.js';

const DB_VERSION = 2; // 2: progresso das aulas
let db = null, scope = null;

function openDB(name) {
  return new Promise((res, rej) => {
    const req = indexedDB.open(name, DB_VERSION);
    req.onupgradeneeded = () => {
      const d = req.result;
      for (const s of ALL_STORES) {
        if (d.objectStoreNames.contains(s)) continue;
        if (s === 'outbox') d.createObjectStore(s, { keyPath: 'seq', autoIncrement: true });
        else if (s === 'meta') d.createObjectStore(s, { keyPath: 'k' });
        else if (s === 'rejected') d.createObjectStore(s, { keyPath: 'key' });
        else d.createObjectStore(s, { keyPath: 'id' });
      }
    };
    req.onsuccess = () => res(req.result);
    req.onerror = () => rej(req.error);
    req.onblocked = () => rej(new Error('Banco local bloqueado por outra aba.'));
  });
}

const dbName = s => `educa-mais:${s}`;
export const currentScope = () => scope;

export async function useScope(s) {
  if (scope === s && db) return;
  if (db) db.close();
  db = await openDB(dbName(s));
  scope = s;
  emit('store:scope', s);
}

export async function deleteScope(s) {
  if (scope === s && db) { db.close(); db = null; scope = null; }
  await new Promise(res => { const r = indexedDB.deleteDatabase(dbName(s)); r.onsuccess = r.onerror = r.onblocked = () => res(); });
}

function tx(stores, mode = 'readonly') {
  if (!db) throw new Error('Banco local não aberto');
  return db.transaction(stores, mode);
}
const done = t => new Promise((res, rej) => { t.oncomplete = () => res(); t.onerror = () => rej(t.error); t.onabort = () => rej(t.error); });
const reqP = r => new Promise((res, rej) => { r.onsuccess = () => res(r.result); r.onerror = () => rej(r.error); });

export async function getRaw(store, key) { return reqP(tx([store]).objectStore(store).get(key)); }
export async function allRaw(store) { return reqP(tx([store]).objectStore(store).getAll()); }
export async function countRaw(store) { return reqP(tx([store]).objectStore(store).count()); }
export async function putRaw(store, rows) {
  const t = tx([store], 'readwrite'); const os = t.objectStore(store);
  for (const r of [].concat(rows)) os.put(r);
  await done(t);
}
export async function deleteRaw(store, keys) {
  const t = tx([store], 'readwrite'); const os = t.objectStore(store);
  for (const k of [].concat(keys)) os.delete(k);
  await done(t);
}
export async function clearRaw(store) { const t = tx([store], 'readwrite'); t.objectStore(store).clear(); await done(t); }

export const meta = {
  async get(k, d = null) { const r = await getRaw('meta', k); return r ? r.v : d; },
  async set(k, v) { await putRaw('meta', { k, v }); }
};

// ---------------- API de alto nível usada pelas telas ----------------

/** Todas as linhas ativas de uma tabela (sem as excluídas). */
export async function all(table, { withDeleted = false } = {}) {
  const rows = await allRaw(table);
  return withDeleted ? rows : rows.filter(r => !r.deleted_at);
}
export const get = (table, id) => getRaw(table, id);

async function enqueue(t, table, id) {
  t.objectStore('outbox').add({ table, id, at: Date.now() });
}

/** Grava (cria ou atualiza) uma linha e agenda o envio ao servidor. */
export async function put(table, row) {
  const def = USER_TABLES[table];
  const now = nowISO();
  const r = { ...row };
  if (!r.id) r.id = uuid();
  if (def?.kind === 'mutable') { r.updated_at = now; if (!r.created_at && table !== 'user_settings') r.created_at = now; }
  const t = tx([table, 'outbox'], 'readwrite');
  t.objectStore(table).put(r);
  if (def) await enqueue(t, table, r.id);
  await done(t);
  emit('store:change', { table, id: r.id });
  return r;
}

export async function patch(table, id, fields) {
  const cur = await get(table, id);
  if (!cur) return null;
  return put(table, { ...cur, ...fields });
}

/** Exclusão lógica: a linha some da tela e a exclusão é sincronizada. */
export async function remove(table, id) {
  const cur = await get(table, id);
  if (!cur) return;
  await put(table, { ...cur, deleted_at: nowISO() });
}

/** Inclui um registro de histórico (resposta, revisão, sessão). Não pode ser alterado depois. */
export async function append(table, row) {
  const r = { id: uuid(), ...row };
  const t = tx([table, 'outbox'], 'readwrite');
  t.objectStore(table).add(r);
  await enqueue(t, table, r.id);
  await done(t);
  emit('store:change', { table, id: r.id });
  return r;
}

export async function outboxAll() { return allRaw('outbox'); }
export async function pendingCount() { return reqP(tx(['outbox']).objectStore('outbox').count()); }

/** Copia todas as linhas de estudo de outro escopo (ex.: "local" → conta), enfileirando o envio. */
export async function importFrom(otherScope) {
  const other = await openDB(dbName(otherScope));
  const tables = Object.keys(USER_TABLES);
  let n = 0;
  for (const table of tables) {
    const rows = await new Promise((res, rej) => { const r = other.transaction([table]).objectStore(table).getAll(); r.onsuccess = () => res(r.result); r.onerror = () => rej(r.error); });
    if (!rows.length) continue;
    const mine = new Map((await allRaw(table)).map(r => [r.id, r]));
    const t = tx([table, 'outbox'], 'readwrite');
    for (const row of rows) {
      const existing = mine.get(row.id);
      if (table === 'user_settings' && existing) continue; // preferências da conta prevalecem
      if (existing && existing.updated_at && row.updated_at && existing.updated_at >= row.updated_at) continue;
      t.objectStore(table).put(row);
      t.objectStore('outbox').add({ table, id: row.id, at: Date.now() });
      n++;
    }
    await done(t);
  }
  other.close();
  emit('store:change', { table: '*' });
  return n;
}

export async function countUserRows(s) {
  const other = await openDB(dbName(s));
  let n = 0;
  for (const table of Object.keys(USER_TABLES)) {
    if (table === 'user_settings') continue;
    n += await new Promise(res => { const r = other.transaction([table]).objectStore(table).count(); r.onsuccess = () => res(r.result); r.onerror = () => res(0); });
  }
  other.close();
  return n;
}
