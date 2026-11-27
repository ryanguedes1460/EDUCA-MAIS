// Cálculos do painel de desempenho a partir do histórico real do estudante
// (respostas, revisões e sessões gravadas no banco e espelhadas no aparelho).
import { dayKey, weekStart, DAY } from '../core/util.js';
import { isDue } from './srs.js';

export function lastDays(n, end = new Date()) {
  const out = [];
  for (let i = n - 1; i >= 0; i--) out.push(dayKey(new Date(end.getTime() - i * DAY)));
  return out;
}

/** Minutos estudados por dia (sessões de foco, de questões e de revisão). */
export function minutesByDay(sessions) {
  const m = {};
  for (const s of sessions) { const k = dayKey(s.started_at); m[k] = (m[k] || 0) + s.duration_sec / 60; }
  return m;
}

export function activeDays({ sessions = [], answers = [], reviews = [] }) {
  const s = new Set();
  sessions.forEach(x => s.add(dayKey(x.started_at)));
  answers.forEach(x => s.add(dayKey(x.answered_at)));
  reviews.forEach(x => s.add(dayKey(x.reviewed_at)));
  return s;
}

/** Sequência de dias seguidos estudando (conta hoje se já estudou, senão a partir de ontem). */
export function streak(days, today = new Date()) {
  let n = 0; let d = new Date(today);
  if (!days.has(dayKey(d))) d = new Date(d.getTime() - DAY);
  while (days.has(dayKey(d))) { n++; d = new Date(d.getTime() - DAY); }
  return n;
}

/** Acerto por disciplina e por conteúdo, a partir das respostas + questões. */
export function accuracy(answers, questions, subjects, topics) {
  const qmap = new Map(questions.map(q => [q.id, q]));
  const sname = new Map(subjects.map(s => [s.id, s.name]));
  const tname = new Map(topics.map(t => [t.id, t.name]));
  const bySubject = {}, byTopic = {};
  for (const a of answers) {
    const q = qmap.get(a.question_id); if (!q) continue;
    const sk = sname.get(q.subject_id) || 'Outras';
    (bySubject[sk] ||= { ok: 0, n: 0 }); bySubject[sk].n++; if (a.is_correct) bySubject[sk].ok++;
    if (q.topic_id) {
      const tk = q.topic_id;
      (byTopic[tk] ||= { ok: 0, n: 0, name: tname.get(tk) || 'Conteúdo', subject: sk }); byTopic[tk].n++; if (a.is_correct) byTopic[tk].ok++;
    }
  }
  return { bySubject, byTopic };
}

/** Assuntos com dificuldade: acerto abaixo de 60% com pelo menos 2 respostas, piores primeiro. */
export function weakTopics(byTopic, min = 2) {
  return Object.entries(byTopic).map(([id, v]) => ({ id: +id, ...v, rate: v.ok / v.n }))
    .filter(t => t.n >= min && t.rate < 0.6).sort((a, b) => a.rate - b.rate || b.n - a.n);
}

export function inWeek(ts, ref = new Date()) {
  const s = weekStart(ref).getTime(); const t = new Date(ts).getTime();
  return t >= s && t < s + 7 * DAY;
}

/** Progresso de cada meta, com base nos dados reais. */
export function goalProgress(goal, { sessions, answers, reviews }, now = new Date()) {
  const today = dayKey(now);
  switch (goal.kind) {
    case 'daily_focus_minutes': {
      const v = Math.round(sessions.filter(s => dayKey(s.started_at) === today).reduce((a, s) => a + s.duration_sec, 0) / 60);
      return { value: v, target: goal.target, label: 'minutos de estudo hoje' };
    }
    case 'weekly_questions': return { value: answers.filter(a => inWeek(a.answered_at, now)).length, target: goal.target, label: 'questões nesta semana' };
    case 'weekly_reviews': return { value: reviews.filter(r => inWeek(r.reviewed_at, now)).length, target: goal.target, label: 'revisões de flashcards nesta semana' };
    case 'target_accuracy': {
      const w = answers.filter(a => inWeek(a.answered_at, now));
      return { value: w.length ? Math.round(w.filter(a => a.is_correct).length / w.length * 100) : 0, target: goal.target, label: '% de acerto nesta semana', unit: '%' };
    }
    case 'weekly_study_days': {
      const d = activeDays({ sessions: sessions.filter(s => inWeek(s.started_at, now)), answers: answers.filter(a => inWeek(a.answered_at, now)), reviews: reviews.filter(r => inWeek(r.reviewed_at, now)) });
      return { value: d.size, target: goal.target, label: 'dias com estudo nesta semana' };
    }
    default: return { value: 0, target: goal.target, label: goal.kind };
  }
}

export const GOAL_KINDS = {
  daily_focus_minutes: { name: 'Minutos de estudo por dia', def: 60, max: 720 },
  weekly_questions: { name: 'Questões por semana', def: 50, max: 5000 },
  weekly_reviews: { name: 'Revisões de flashcards por semana', def: 100, max: 10000 },
  target_accuracy: { name: 'Taxa de acerto na semana (%)', def: 70, max: 100 },
  weekly_study_days: { name: 'Dias de estudo por semana', def: 5, max: 7 }
};

export function dueCount(cards, now = Date.now()) { return cards.filter(c => isDue(c, now)).length; }

/** Linha do tempo de atividades recentes (histórico). */
export function timeline({ answers, reviews, sessions, questions }, limit = 30) {
  const qmap = new Map(questions.map(q => [q.id, q]));
  const items = [
    ...answers.map(a => ({ at: a.answered_at, kind: 'answer', ok: a.is_correct, text: qmap.get(a.question_id)?.statement || 'Questão' })),
    ...reviews.map(r => ({ at: r.reviewed_at, kind: 'review', ok: r.rating > 0, text: 'Revisão de flashcard' })),
    ...sessions.map(s => ({ at: s.started_at, kind: 'session', text: `${s.kind === 'foco' ? 'Bloco de foco' : 'Estudo'}${s.subject ? ': ' + s.subject : ''}`, min: Math.round(s.duration_sec / 60) }))
  ];
  return items.sort((a, b) => new Date(b.at) - new Date(a.at)).slice(0, limit);
}
