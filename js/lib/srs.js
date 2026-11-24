// Revisão espaçada (variação do algoritmo SM-2, o mesmo princípio do Anki).
// Cada cartão tem "facilidade" (ease), intervalo em dias e repetições.
// Avaliações: 0 = Errei, 1 = Difícil, 2 = Bom, 3 = Fácil.
export const RATINGS = ['Errei', 'Difícil', 'Bom', 'Fácil'];
const DAY = 864e5;
const RELEARN_MIN = 10; // cartão errado volta em 10 minutos

export function schedule(card, rating, now = Date.now()) {
  let ease = card.ease ?? 2.5, ivl = card.interval_days ?? 0, reps = card.repetitions ?? 0, lapses = card.lapses ?? 0;
  if (rating === 0) {
    lapses += 1; reps = 0; ease = Math.max(1.3, ease - 0.2); ivl = 0;
    return { ease: round(ease), interval_days: 0, repetitions: reps, lapses, due_at: new Date(now + RELEARN_MIN * 60e3).toISOString(), last_reviewed_at: new Date(now).toISOString() };
  }
  if (reps === 0) ivl = rating === 1 ? 1 : rating === 2 ? 1 : 4;
  else if (reps === 1) ivl = rating === 1 ? Math.max(2, ivl * 1.2) : rating === 2 ? 6 : 8;
  else {
    const base = Math.max(ivl, 1);
    if (rating === 1) ivl = base * 1.2;
    else if (rating === 2) ivl = base * ease;
    else ivl = base * ease * 1.3;
    ivl = Math.max(ivl, base + 1);
  }
  if (rating === 1) ease = Math.max(1.3, ease - 0.15);
  if (rating === 3) ease = Math.min(5, ease + 0.15);
  reps += 1;
  ivl = Math.min(Math.round(ivl * 10) / 10, 3650);
  return { ease: round(ease), interval_days: ivl, repetitions: reps, lapses, due_at: new Date(now + ivl * DAY).toISOString(), last_reviewed_at: new Date(now).toISOString() };
}

const round = v => Math.round(v * 100) / 100;
export const isDue = (card, now = Date.now()) => !card.deleted_at && new Date(card.due_at || 0).getTime() <= now;

/** Texto curto para o botão: "10 min", "1 dia", "6 dias", "2 meses". */
export function describeInterval(card, rating, now = Date.now()) {
  const s = schedule(card, rating, now);
  if (rating === 0) return '10 min';
  return fmtDays(s.interval_days);
}
export function fmtDays(d) {
  if (d < 1) return 'hoje';
  if (d < 1.5) return '1 dia';
  if (d < 30) return `${Math.round(d)} dias`;
  const m = Math.round(d / 30);
  if (m < 12) return m === 1 ? '1 mês' : `${m} meses`;
  const y = Math.round(d / 365 * 10) / 10;
  return `${String(y).replace('.', ',')} ${y === 1 ? 'ano' : 'anos'}`;
}

/** Estágio do cartão, para o painel de evolução. */
export function stage(card) {
  if (!card.repetitions && !card.last_reviewed_at) return 'novo';
  if ((card.interval_days || 0) >= 21) return 'dominado';
  return 'aprendendo';
}
