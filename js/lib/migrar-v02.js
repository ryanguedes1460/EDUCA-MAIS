// Traz para o novo formato os dados que o aluno já tinha na versão 0.2
// (que ficavam no localStorage com prefixo "em:"). Roda uma única vez por aparelho.
// Nada é apagado do localStorage antigo, por segurança.
import * as store from '../core/store.js';
import { uuid, nowISO, DAY } from '../core/util.js';

const read = k => { try { const v = localStorage.getItem('em:' + k); return v ? JSON.parse(v) : null; } catch { return null; } };

export async function migrateV02() {
  if (await store.meta.get('migrou_v02')) return 0;
  let n = 0;
  const decks = read('decks');
  if (Array.isArray(decks)) {
    for (const d of decks) {
      const deckId = uuid();
      await store.put('decks', { id: deckId, name: String(d.name || 'Baralho').slice(0, 60), kind: d.id === 'erros' ? 'errors' : 'user', subject_id: null, color: null, is_favorite: false });
      for (const c of d.cards || []) {
        const ivl = Number(c.ivl) || 0;
        await store.put('flashcards', {
          id: uuid(), deck_id: deckId, front: String(c.f || '').slice(0, 1000) || '?', back: String(c.b || '').slice(0, 3000) || '?',
          subject_id: null, is_favorite: false, source_question_id: null, ease: 2.5, interval_days: ivl, repetitions: ivl ? 2 : 0, lapses: 0,
          due_at: new Date(c.due || Date.now()).toISOString(), last_reviewed_at: c.due ? new Date(c.due - ivl * DAY).toISOString() : null
        });
        n++;
      }
    }
  }
  const tasks = read('tasks');
  if (Array.isArray(tasks)) for (const t of tasks) {
    await store.put('plan_tasks', { id: uuid(), title: String(t.n || 'Estudo').slice(0, 60), weekday: Math.min(6, Math.max(0, +t.d || 0)), start_time: /^\d\d:\d\d$/.test(t.t) ? t.t : '19:00', duration_min: Math.min(600, Math.max(5, +t.m || 50)), done_on: null });
    n++;
  }
  const notes = read('notes');
  if (Array.isArray(notes)) for (const x of notes) {
    await store.put('notes', { id: uuid(), title: String(x.t || '').slice(0, 120), body: String(x.b || '').slice(0, 50000), subject_id: null, is_favorite: false });
    n++;
  }
  const stats = read('stats');
  if (stats && typeof stats === 'object') for (const [day, d] of Object.entries(stats)) {
    for (const l of d.log || []) {
      const [h, m] = String(l.h || '12:00').split(':').map(Number);
      const start = new Date(`${day}T00:00:00`); start.setHours(h || 12, m || 0);
      await store.append('study_sessions', { kind: 'foco', subject: String(l.s || '').slice(0, 60) || null, started_at: start.toISOString(), duration_sec: Math.max(60, (+l.m || 25) * 60) });
      n++;
    }
  }
  const goal = read('goal'), fDur = read('fDur'), theme = read('theme'), perfil = read('perfil');
  if (goal || fDur || theme) {
    const cur = await store.get('user_settings', 'me') || { id: 'me' };
    await store.put('user_settings', { ...cur, daily_goal_min: goal || cur.daily_goal_min, focus_minutes: fDur?.foco || cur.focus_minutes, short_break_min: fDur?.curta || cur.short_break_min, long_break_min: fDur?.longa || cur.long_break_min, theme: ['light', 'dark'].includes(theme) ? theme : cur.theme });
  }
  if (perfil) await store.meta.set('study_profile', perfil);
  await store.meta.set('migrou_v02', nowISO());
  return n;
}
