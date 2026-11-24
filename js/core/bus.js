// Canal de eventos simples entre módulos.
const subs = new Map();
export const on = (ev, fn) => { if (!subs.has(ev)) subs.set(ev, new Set()); subs.get(ev).add(fn); return () => subs.get(ev).delete(fn); };
export const emit = (ev, data) => { for (const fn of subs.get(ev) || []) { try { fn(data); } catch (e) { console.error(e); } } };
