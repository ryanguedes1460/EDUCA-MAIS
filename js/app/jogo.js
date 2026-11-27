// Níveis, XP, conquistas, missões do dia e desafio diário.
// Tudo é CALCULADO a partir do histórico real (respostas, revisões, sessões, aulas),
// então funciona offline, sincroniza sozinho e não precisa de tabela nova no banco.
import { dayKey, DAY } from '../core/util.js';
import { activeDays, streak } from '../lib/stats.js';
import { isDue } from '../lib/srs.js';

export const XP = { acerto: 10, erro: 3, revisao: 2, minuto: 1, aula: 25, simulado: 30, desafio: 40 };

export function xpTotal({ answers = [], reviews = [], sessions = [], lessons = [], attempts = [] }) {
  let xp = 0;
  for (const a of answers) xp += a.is_correct ? XP.acerto : XP.erro;
  xp += reviews.length * XP.revisao;
  xp += Math.round(sessions.filter(s => s.kind === 'foco' || s.kind === 'leitura').reduce((t, s) => t + s.duration_sec, 0) / 60) * XP.minuto;
  xp += lessons.filter(l => l.completed_at).length * XP.aula;
  for (const t of attempts) if (t.finished_at) xp += t.filters?.desafio ? XP.desafio : XP.simulado;
  return xp;
}

// Nível L começa em 50·(L−1)·L XP: 100, 300, 600, 1000…
export const xpFor = L => 50 * (L - 1) * L;
export function level(xp) {
  const L = Math.max(1, Math.floor((1 + Math.sqrt(1 + 8 * xp / 100)) / 2));
  const base = xpFor(L), next = xpFor(L + 1);
  return { L, xp, base, next, into: xp - base, need: next - base, title: TITLES[Math.min(TITLES.length - 1, Math.floor((L - 1) / 3))] };
}
const TITLES = ['Iniciante', 'Aprendiz', 'Estudante', 'Dedicado', 'Focado', 'Avançado', 'Especialista', 'Mestre', 'Lenda'];

export function streakOf({ sessions = [], answers = [], reviews = [] }) {
  return streak(activeDays({ sessions, answers, reviews }));
}

/** Conquistas: [{id, icon, name, desc, on, progress}] */
export function achievements(d) {
  const { answers = [], reviews = [], sessions = [], lessons = [], attempts = [] } = d;
  const ok = answers.filter(a => a.is_correct).length;
  const mins = sessions.reduce((t, s) => t + s.duration_sec, 0) / 60;
  const st = longestStreak(activeDays({ sessions, answers, reviews }));
  const done = attempts.filter(a => a.finished_at);
  const desafios = done.filter(a => a.filters?.desafio).length;
  const perfeito = done.some(a => a.total >= 5 && a.correct === a.total);
  const horas = new Set([...sessions.map(s => new Date(s.started_at).getHours()), ...answers.map(a => new Date(a.answered_at).getHours())]);
  const aulas = lessons.filter(l => l.completed_at).length;
  const list = [
    ['q1', '🎯', 'Primeiro passo', 'Responder a primeira questão', answers.length, 1],
    ['q100', '💯', 'Cem na conta', 'Responder 100 questões', answers.length, 100],
    ['q1000', '🏔️', 'Maratonista', 'Responder 1.000 questões', answers.length, 1000],
    ['a500', '🧠', 'Cérebro afiado', 'Acertar 500 questões', ok, 500],
    ['s3', '🔥', 'Pegando fogo', '3 dias seguidos estudando', st, 3],
    ['s7', '⚡', 'Semana perfeita', '7 dias seguidos estudando', st, 7],
    ['s30', '🌋', 'Imparável', '30 dias seguidos estudando', st, 30],
    ['h10', '⏳', 'Dez horas', '10 horas de estudo registradas', mins / 60, 10],
    ['h100', '🏛️', 'Cem horas', '100 horas de estudo registradas', mins / 60, 100],
    ['sim1', '📝', 'Prova de fogo', 'Terminar o primeiro simulado', done.filter(a => !a.filters?.desafio).length, 1],
    ['perf', '🌟', 'Gabaritou', 'Acertar tudo num simulado de 5+ questões', perfeito ? 1 : 0, 1],
    ['des7', '🗓️', 'Desafiante', 'Completar 7 desafios do dia', desafios, 7],
    ['rev100', '🃏', 'Memória de elefante', 'Fazer 100 revisões de flashcards', reviews.length, 100],
    ['aula1', '🎬', 'Primeira aula', 'Concluir uma aula', aulas, 1],
    ['aula10', '🎓', 'Aluno exemplar', 'Concluir 10 aulas', aulas, 10],
    ['coruja', '🦉', 'Coruja', 'Estudar depois das 22h', [22, 23, 0, 1, 2, 3].some(h => horas.has(h)) ? 1 : 0, 1],
    ['cedo', '🌅', 'Madrugador', 'Estudar antes das 7h', [4, 5, 6].some(h => horas.has(h)) ? 1 : 0, 1]
  ];
  return list.map(([id, icon, name, desc, v, target]) => ({ id, icon, name, desc, on: v >= target, progress: Math.min(1, v / target), v: Math.floor(v), target }));
}

function longestStreak(days) {
  const sorted = [...days].sort();
  let best = 0, cur = 0, prev = null;
  for (const k of sorted) {
    const t = new Date(k + 'T12:00:00').getTime();
    cur = prev != null && Math.round((t - prev) / DAY) === 1 ? cur + 1 : 1;
    best = Math.max(best, cur); prev = t;
  }
  return best;
}

/** Missões de hoje, com progresso real. */
export function missions({ answers = [], reviews = [], sessions = [], cards = [], attempts = [] }, goalMin = 60) {
  const hoje = dayKey();
  const aHoje = answers.filter(a => dayKey(a.answered_at) === hoje).length;
  const rHoje = reviews.filter(r => dayKey(r.reviewed_at) === hoje).length;
  const mHoje = Math.round(sessions.filter(s => dayKey(s.started_at) === hoje).reduce((t, s) => t + s.duration_sec, 0) / 60);
  const due = cards.filter(c => isDue(c)).length;
  const desafio = attempts.some(a => a.filters?.desafio === hoje && a.finished_at);
  return [
    { id: 'desafio', icon: '🎯', t: 'Fazer o desafio do dia (5 questões)', done: desafio, go: ['desafio'], xp: XP.desafio },
    { id: 'questoes', icon: '✏️', t: `Responder 20 questões (${Math.min(aHoje, 20)}/20)`, done: aHoje >= 20, go: ['questoes'], xp: 100 },
    { id: 'revisar', icon: '🃏', t: due ? `Revisar os ${due} flashcards de hoje` : `Revisar flashcards (${rHoje} hoje)`, done: due === 0 && (rHoje > 0 || cards.length === 0), go: ['flashcards', 'revisar'], xp: 20 },
    { id: 'foco', icon: '⏱️', t: `Estudar ${goalMin} min (${Math.min(mHoje, goalMin)}/${goalMin})`, done: mHoje >= goalMin, go: ['foco'], xp: goalMin }
  ];
}

// Gerador pseudoaleatório com semente (o desafio do dia é o mesmo o dia todo)
function seeded(seed) { let s = 0; for (const c of seed) s = (s * 31 + c.charCodeAt(0)) >>> 0; return () => { s = (s * 1664525 + 1013904223) >>> 0; return s / 4294967296; }; }

/** 5 questões do dia, variando matérias e com dificuldade crescente. */
export function dailyQuestions(bank, perfil = 'enem', day = dayKey()) {
  const rnd = seeded('educa:' + day + ':' + perfil);
  const nivel = { fundamental: 'fundamental', medio: 'medio', enem: 'enem', concurso: 'concurso' }[perfil] || 'enem';
  let pool = bank.filter(q => q.level === nivel);
  if (pool.length < 50) pool = bank;
  const bySubj = new Map();
  for (const q of pool) { if (!bySubj.has(q.subject_id)) bySubj.set(q.subject_id, []); bySubj.get(q.subject_id).push(q); }
  const subs = [...bySubj.keys()].sort((a, b) => a - b);
  const out = [];
  const used = new Set();
  for (let i = 0; out.length < 5 && i < 40; i++) {
    const s = subs[Math.floor(rnd() * subs.length)];
    if (used.has(s) && used.size < subs.length) continue;
    used.add(s);
    const qs = bySubj.get(s).filter(q => q.difficulty === Math.min(5, 2 + Math.floor(out.length / 2)));
    const arr = qs.length ? qs : bySubj.get(s);
    out.push(arr[Math.floor(rnd() * arr.length)]);
  }
  return out;
}

/** Caderno de erros: questões cuja ÚLTIMA resposta foi errada. */
export function wrongNow(answers) {
  const last = new Map();
  for (const a of answers.slice().sort((x, y) => x.answered_at.localeCompare(y.answered_at))) last.set(a.question_id, a);
  return [...last.values()].filter(a => !a.is_correct);
}
