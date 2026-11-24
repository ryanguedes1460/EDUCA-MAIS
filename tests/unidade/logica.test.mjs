// Testes de unidade da lógica pura (rodam sem navegador e sem servidor).
import { test, describe } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { schedule, isDue, stage, fmtDays, describeInterval } from '../../js/lib/srs.js';
import { streak, accuracy, weakTopics, goalProgress, minutesByDay, lastDays } from '../../js/lib/stats.js';
import { mergeRemote, toRemote, fromRemote, USER_TABLES, PUSH_ORDER } from '../../js/core/tabelas.js';
import { esc, html, raw, norm, dayKey } from '../../js/core/util.js';
import { render as renderSW, renderInstaller } from '../../scripts/build.mjs';
import seed from '../../js/data/conteudo-inicial.js';

const DAY = 864e5;
const T0 = Date.UTC(2026, 10, 24, 12);

describe('revisão espaçada (SM-2)', () => {
  const novo = { ease: 2.5, interval_days: 0, repetitions: 0, lapses: 0 };
  test('acertos aumentam o intervalo progressivamente', () => {
    let c = { ...novo, ...schedule(novo, 2, T0) };
    assert.equal(c.interval_days, 1);
    c = { ...c, ...schedule(c, 2, T0) };
    assert.equal(c.interval_days, 6);
    c = { ...c, ...schedule(c, 2, T0) };
    assert.equal(c.interval_days, 15);
    assert.equal(new Date(c.due_at).getTime(), T0 + 15 * DAY);
  });
  test('"Fácil" vai mais longe que "Bom", que vai mais longe que "Difícil"', () => {
    const c = { ease: 2.5, interval_days: 10, repetitions: 3, lapses: 0 };
    const [d, b, f] = [1, 2, 3].map(r => schedule(c, r, T0).interval_days);
    assert.ok(d < b && b < f, `${d} < ${b} < ${f}`);
  });
  test('errar volta o cartão em 10 minutos, zera repetições e reduz a facilidade', () => {
    const s = schedule({ ease: 2.5, interval_days: 30, repetitions: 5, lapses: 1 }, 0, T0);
    assert.equal(s.repetitions, 0); assert.equal(s.lapses, 2); assert.equal(s.ease, 2.3);
    assert.equal(new Date(s.due_at).getTime(), T0 + 10 * 60e3);
  });
  test('facilidade tem piso 1,3 e teto 5', () => {
    let c = { ease: 1.35, interval_days: 3, repetitions: 2, lapses: 0 };
    assert.equal(schedule(c, 0, T0).ease, 1.3);
    c = { ease: 4.95, interval_days: 3, repetitions: 2, lapses: 0 };
    assert.equal(schedule(c, 3, T0).ease, 5);
  });
  test('vencimento, estágio e textos', () => {
    assert.equal(isDue({ due_at: new Date(T0 - 1).toISOString() }, T0), true);
    assert.equal(isDue({ due_at: new Date(T0 + 1).toISOString() }, T0), false);
    assert.equal(isDue({ due_at: new Date(T0 - 1).toISOString(), deleted_at: 'x' }, T0), false);
    assert.equal(stage({ repetitions: 0 }), 'novo');
    assert.equal(stage({ repetitions: 4, interval_days: 30, last_reviewed_at: 'x' }), 'dominado');
    assert.equal(fmtDays(1), '1 dia'); assert.equal(fmtDays(45), '2 meses');
    assert.equal(describeInterval(novo, 0), '10 min');
  });
});

describe('estatísticas do painel', () => {
  const day = n => new Date(T0 - n * DAY).toISOString();
  test('sequência de dias seguidos', () => {
    const days = new Set([dayKey(day(0)), dayKey(day(1)), dayKey(day(2)), dayKey(day(4))]);
    assert.equal(streak(days, new Date(T0)), 3);
    assert.equal(streak(new Set([dayKey(day(1)), dayKey(day(2))]), new Date(T0)), 2, 'conta a partir de ontem se ainda não estudou hoje');
  });
  test('acerto por disciplina e assuntos com dificuldade', () => {
    const qs = [{ id: 'a', subject_id: 1, topic_id: 10 }, { id: 'b', subject_id: 1, topic_id: 11 }];
    const ans = [{ question_id: 'a', is_correct: false }, { question_id: 'a', is_correct: false }, { question_id: 'a', is_correct: true }, { question_id: 'b', is_correct: true }, { question_id: 'b', is_correct: true }];
    const { bySubject, byTopic } = accuracy(ans, qs, [{ id: 1, name: 'Mat' }], [{ id: 10, name: 'Frações' }, { id: 11, name: 'Juros' }]);
    assert.deepEqual(bySubject.Mat, { ok: 3, n: 5 });
    const weak = weakTopics(byTopic);
    assert.equal(weak.length, 1); assert.equal(weak[0].name, 'Frações');
  });
  test('metas usam dados reais', () => {
    const now = new Date(T0);
    const sessions = [{ started_at: new Date(T0 - 3600e3).toISOString(), duration_sec: 1500 }, { started_at: day(1), duration_sec: 3000 }];
    assert.equal(goalProgress({ kind: 'daily_focus_minutes', target: 60 }, { sessions, answers: [], reviews: [] }, now).value, 25);
    const answers = [{ answered_at: new Date(T0).toISOString(), is_correct: true }, { answered_at: new Date(T0).toISOString(), is_correct: false }];
    assert.equal(goalProgress({ kind: 'target_accuracy', target: 70 }, { sessions: [], answers, reviews: [] }, now).value, 50);
    assert.equal(goalProgress({ kind: 'weekly_questions', target: 10 }, { sessions: [], answers, reviews: [] }, now).value, 2);
  });
  test('minutos por dia e janela de dias', () => {
    const m = minutesByDay([{ started_at: new Date(T0).toISOString(), duration_sec: 600 }, { started_at: new Date(T0).toISOString(), duration_sec: 300 }]);
    assert.equal(m[dayKey(new Date(T0))], 15);
    assert.equal(lastDays(7, new Date(T0)).length, 7);
  });
});

describe('sincronização', () => {
  test('última edição vence; alteração local pendente mais nova é preservada', () => {
    const local = { id: '1', title: 'local', updated_at: '2026-11-24T10:00:02Z' };
    const remote = { id: '1', title: 'remoto', updated_at: '2026-11-24T10:00:01Z' };
    assert.equal(mergeRemote(local, remote, true).title, 'local');
    assert.equal(mergeRemote({ ...local, updated_at: '2026-11-24T10:00:00Z' }, remote, true).title, 'remoto');
    assert.equal(mergeRemote(null, remote, false).title, 'remoto');
  });
  test('resposta do servidor substitui a correção local (servidor decide)', () => {
    const local = { id: 'x', is_correct: true, answered_at: 'a' };
    assert.equal(mergeRemote(local, { id: 'x', is_correct: false, answered_at: 'a' }, false).is_correct, false);
  });
  test('só colunas permitidas são enviadas; chaves especiais são convertidas', () => {
    const r = toRemote('notes', { id: '1', title: 't', body: 'b', _local: 1, user_id: 'hack', synced_at: 'x' });
    assert.deepEqual(Object.keys(r).sort(), ['body', 'id', 'title']);
    assert.deepEqual(toRemote('favorites', { id: 'q1', updated_at: 'u' }), { question_id: 'q1', updated_at: 'u' });
    assert.equal(fromRemote('goals', { kind: 'weekly_questions', user_id: 'u', synced_at: 's' }).id, 'weekly_questions');
    assert.equal(fromRemote('user_settings', { user_id: 'u', theme: 'dark' }).id, 'me');
    assert.equal(fromRemote('notes', { id: '1', user_id: 'u' }).user_id, undefined);
  });
  test('a ordem de envio cobre todas as tabelas e respeita as dependências', () => {
    assert.deepEqual([...PUSH_ORDER].sort(), Object.keys(USER_TABLES).sort());
    assert.ok(PUSH_ORDER.indexOf('decks') < PUSH_ORDER.indexOf('flashcards'));
    assert.ok(PUSH_ORDER.indexOf('flashcards') < PUSH_ORDER.indexOf('flashcard_reviews'));
    assert.ok(PUSH_ORDER.indexOf('exam_attempts') < PUSH_ORDER.indexOf('answers'));
  });
});

describe('proteção da interface', () => {
  test('esc e html escapam conteúdo do usuário', () => {
    assert.equal(esc('<img src=x onerror=alert(1)>'), '&lt;img src=x onerror=alert(1)&gt;');
    const name = '"><script>alert(1)</script>';
    const out = String(html`<input value="${name}"><b>${name}</b>${raw('<i>ok</i>')}${[name, 1]}`);
    assert.ok(!out.includes('<script>'));
    assert.ok(out.includes('&quot;&gt;&lt;script&gt;'));
    assert.ok(out.includes('<i>ok</i>'));
  });
  test('busca ignora acentos e maiúsculas', () => { assert.equal(norm('FOTOSSÍNTESE Ação'), 'fotossintese acao'); });
});

describe('conteúdo e empacotamento', () => {
  test('conteúdo inicial é consistente (1 correta por questão, ids fixos, conteúdo da disciplina certa)', () => {
    const topics = new Map(seed.topics.map(t => [t.id, t]));
    assert.ok(seed.questions.length >= 25);
    for (const q of seed.questions) {
      assert.equal(q.options.filter(o => o.is_correct).length, 1, q.code);
      if (q.topic_id) assert.equal(topics.get(q.topic_id).subject_id, q.subject_id, q.code);
      assert.match(q.id, /^e0000000-0000-4000-a000-/);
    }
    const sql = readFileSync(new URL('../../supabase/migrations/20261124000500_conteudo_inicial.sql', import.meta.url), 'utf8');
    for (const q of seed.questions) assert.ok(sql.includes(q.id), 'questão ausente no banco: ' + q.code);
  });
  test('sw.js está atualizado com todos os arquivos do app (rode npm run build)', () => {
    const current = readFileSync(new URL('../../sw.js', import.meta.url), 'utf8');
    assert.equal(current, renderSW(), 'sw.js desatualizado: rode "npm run build"');
    const inst = readFileSync(new URL('../../supabase/instalar.sql', import.meta.url), 'utf8');
    assert.equal(inst, renderInstaller(), 'supabase/instalar.sql desatualizado: rode "npm run build"');
  });
  test('nenhuma chave secreta no código público', () => {
    const files = ['config.js', 'index.html', 'js/core/backend.js'];
    for (const f of files) {
      const s = readFileSync(new URL('../../' + f, import.meta.url), 'utf8');
      assert.ok(!/sb_secret_[A-Za-z0-9_-]{10,}/.test(s), f);
      for (const jwt of s.match(/eyJ[\w-]+\.[\w-]+\.[\w-]+/g) || []) {
        const payload = JSON.parse(Buffer.from(jwt.split('.')[1], 'base64url').toString());
        assert.notEqual(payload.role, 'service_role', f);
      }
    }
  });
});
