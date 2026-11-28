// Testes de unidade da lógica pura (rodam sem navegador e sem servidor).
import { test, describe } from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { schedule, isDue, stage, fmtDays, describeInterval } from '../../js/lib/srs.js';
import { streak, accuracy, weakTopics, goalProgress, minutesByDay, lastDays } from '../../js/lib/stats.js';
import { mergeRemote, toRemote, fromRemote, USER_TABLES, PUSH_ORDER } from '../../js/core/tabelas.js';
import { esc, html, raw, norm, dayKey } from '../../js/core/util.js';
import { render as renderSW, renderInstaller, renderPostRestore } from '../../scripts/build.mjs';
import seed from '../../js/data/conteudo-inicial.js';
import { normalizar, montarPlano, notaAtual, corteSugerido } from '../../js/lib/objetivo.js';

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
    const pos = readFileSync(new URL('../../supabase/pos-restauracao.sql', import.meta.url), 'utf8');
    assert.equal(pos, renderPostRestore(), 'supabase/pos-restauracao.sql desatualizado: rode "npm run build"');
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

// ---------------- 1.2: banco de questões, TRI e cronograma ----------------
import { expandir, bid } from '../../js/core/banco.js';
import { notaTRI } from '../../js/lib/tri.js';
import { montarCronograma } from '../../js/lib/cronograma.js';
import { readFileSync as rfs } from 'node:fs';

describe('banco de questões (1.3: mais de 10 mil)', () => {
  const raw = JSON.parse(rfs(new URL('../../conteudo/banco.json', import.meta.url), 'utf8'));
  const b = expandir(raw);
  test('tem milhares de questões, todas com 5 alternativas e uma correta', () => {
    assert.ok(b.questions.length >= 10000, `só ${b.questions.length}`);
    for (const q of b.questions) {
      assert.equal(q.options.length, 5, q.code);
      assert.equal(q.options.filter(o => o.is_correct).length, 1, q.code);
      assert.equal(new Set(q.options.map(o => o.body)).size, 5, 'alternativas repetidas em ' + q.code);
      assert.ok(q.explanation && q.statement.length > 10, q.code);
    }
  });
  test('códigos únicos e ids iguais aos do SQL do banco', () => {
    assert.equal(new Set(b.questions.map(q => q.code)).size, b.questions.length);
    const sql = rfs(new URL('../../supabase/banco-de-questoes/parte-01.sql', import.meta.url), 'utf8');
    assert.ok(sql.includes(`'${bid(1)}', '${b.questions[0].code}'`));
  });
  test('nenhum enunciado repetido e nenhuma alternativa estranha (NaN, "0 N", "R$ 0,00")', () => {
    assert.equal(new Set(b.questions.map(q => q.statement)).size, b.questions.length);
    for (const q of b.questions) {
      const txt = q.statement + q.explanation + q.options.map(o => o.body).join('|');
      assert.doesNotMatch(txt, /NaN|undefined|Infinity|\[object/, q.code);
      const certa = q.options.find(o => o.is_correct).body;
      if (!/^(R\$ )?0(,0+)? \S/.test(certa)) for (const o of q.options) assert.doesNotMatch(o.body, /^(R\$ )?0(,0+)? \S/, q.code);
    }
  });
  test('separado por estilo de prova, com as provas pedidas e o aviso de que não é oficial', () => {
    const nomes = new Map(raw.boards.map(x => [x.id, x.name]));
    const usados = new Set(b.questions.map(q => nomes.get(q.board_id)).filter(Boolean));
    for (const n of ['ENEM', 'FUVEST', 'UNICAMP', 'ITA', 'IME', 'UFMG', 'PAS/UnB', 'UEMA', 'UNITINS']) assert.ok(usados.has('Estilo ' + n), 'falta o estilo ' + n);
    for (const q of b.questions) if (q.board_id !== 1) assert.match(q.source, /Não é uma questão oficial/);
    assert.ok(b.questions.filter(q => nomes.get(q.board_id) === 'Estilo ITA').every(q => q.difficulty >= 4), 'ITA só com questões difíceis');
  });
  test('cobre todas as áreas do ENEM', () => {
    const mats = new Set(b.questions.map(q => q.subject_id));
    for (const id of [1, 2, 3, 5, 6, 7, 8, 9, 11, 12, 13]) assert.ok(mats.has(id), 'falta a matéria ' + id);
  });
});

describe('nota estilo TRI', () => {
  test('acertar tudo dá nota alta; errar tudo dá nota baixa', () => {
    const itens = d => [1, 2, 3, 4, 5, 2, 3, 4].map(x => ({ difficulty: x, ok: d }));
    assert.ok(notaTRI(itens(true)).nota > 650);
    assert.ok(notaTRI(itens(false)).nota < 450);
  });
  test('mesmo número de acertos: coerente vale mais que chute', () => {
    const coerente = [1, 1, 2, 2, 5, 5].map((d, i) => ({ difficulty: d, ok: i < 4 }));
    const chute = [1, 1, 2, 2, 5, 5].map((d, i) => ({ difficulty: d, ok: i >= 2 }));
    assert.ok(notaTRI(coerente).nota > notaTRI(chute).nota);
    assert.equal(notaTRI(chute).coerencia, 'baixa');
  });
});

describe('cronograma automático', () => {
  test('respeita os dias e o tempo, sem repetir matéria no mesmo dia', () => {
    const out = montarCronograma({ objetivo: 'enem', dias: [0, 2, 4], inicio: '18:30', horas: 3, bloco: 50, materias: [{ id: 3, name: 'Matemática' }] });
    assert.ok(out.length >= 9);
    assert.deepEqual([...new Set(out.map(t => t.weekday))], [0, 2, 4]);
    for (const d of [0, 2]) { const n = out.filter(t => t.weekday === d).map(t => t.title); assert.equal(new Set(n).size, n.length); }
    assert.equal(out[0].start_time, '18:30');
    assert.ok(out.some(t => t.subject_id === 3));
  });
  test('usa as matérias do edital com peso', () => {
    const out = montarCronograma({ edital: 'Direito Penal: 3\nPortuguês: 1', dias: [0, 1, 2, 3], horas: 2, bloco: 50 });
    const pen = out.filter(t => t.title === 'Direito Penal').length, por = out.filter(t => t.title === 'Português').length;
    assert.ok(pen > por);
  });
});

describe('objetivo e nota de corte', () => {
  test('limpa as respostas e respeita a escala', () => {
    const o = normalizar({ tipo: 'enem', ja_fez: true, notas: { lc: '620', ch: 5000, mt: '540,5' }, meta: '720', curso: 'Direito', dificuldades: ['Matemática', 42] });
    assert.deepEqual(o.notas, { lc: 620, mt: 540.5 });
    assert.equal(o.meta, 720);
    assert.deepEqual(o.dificuldades, ['Matemática', '42']);
    assert.equal(normalizar({ tipo: 'concurso', meta: 140 }).meta, null);
    assert.equal(normalizar({ tipo: 'xyz' }).tipo, 'enem');
  });
  test('calcula quanto falta e dá mais peso à área mais fraca', () => {
    const o = normalizar({ tipo: 'enem', ja_fez: true, notas: { lc: 650, ch: 650, cn: 600, mt: 500, red: 700 }, meta: 720, data_prova: '2027-11-07' });
    assert.equal(notaAtual(o), 620);
    const p = montarPlano(o, {}, new Date('2027-05-09T12:00:00'));
    assert.equal(p.falta, 100);
    assert.equal(p.semanas, 26);
    assert.equal(p.distrib[0].materia, 'Matemática');
    assert.equal(p.fraquezas[0].area, 'Matemática');
    assert.ok(Math.abs(p.distrib.reduce((a, d) => a + d.horas, 0) - p.horas) <= 3);
  });
  test('concurso usa as matérias do concurso escolhido', () => {
    const p = montarPlano(normalizar({ tipo: 'concurso', prova: 'Prefeituras do Maranhão', dificuldades: ['Informática'] }));
    assert.ok(p.distrib.some(d => d.materia === 'Conhecimentos do Maranhão'));
    assert.equal(p.falta, null);
    assert.equal(corteSugerido('Medicina') > corteSugerido('Pedagogia'), true);
  });
});

// ---------------- 2.3: ensino médio completo, figuras, resumos e selos ----------------
import { RESUMOS, DISCIPLINAS } from '../../js/data/resumos.js';
import { CURRICULO } from '../../js/data/curriculo.js';
import { richText } from '../../js/core/util.js';
import { existsSync } from 'node:fs';

describe('versão 2.3: conteúdo do ensino médio', () => {
  const provas = JSON.parse(rfs(new URL('../../conteudo/provas.json', import.meta.url)));
  test('toda figura citada num enunciado existe e é um SVG com fundo branco', () => {
    const figs = new Set();
    for (const q of provas.q) for (const m of q[6].matchAll(/\(conteudo\/figuras\/([a-f0-9]{14})\.svg\)/g)) figs.add(m[1]);
    assert.ok(figs.size >= 300, 'poucas figuras: ' + figs.size);
    for (const f of figs) {
      const p = new URL(`../../conteudo/figuras/${f}.svg`, import.meta.url);
      assert.ok(existsSync(p), 'falta ' + f);
      assert.match(rfs(p, 'utf8'), /^<svg [^>]*><rect [^>]*fill="#fff"\/>/);
    }
  });
  test('o texto da questão mostra figuras autorais e recusa outros caminhos', () => {
    assert.match(richText('![Figura](conteudo/figuras/0123456789abcd.svg)'), /<img class="q-img"[^>]+src="conteudo\/figuras\/0123456789abcd\.svg"/);
    assert.doesNotMatch(richText('![x](https://site.com/a.svg)'), /<img/);
    assert.doesNotMatch(richText('![x](conteudo/figuras/../../x.svg)'), /<img/);
  });
  test('tem gravitação e os conteúdos novos, e nenhuma autoral finge ser oficial', () => {
    const temas = new Set(provas.q.map(q => q[5]));
    for (const t of ['Lei da Gravitação Universal', 'Leis de Kepler', 'Movimento harmônico simples (MHS)', 'Pilhas e diferença de potencial', 'Segunda lei de Mendel', 'Princípios e diretrizes do SUS', 'Imperatriz e região tocantina'])
      assert.ok(temas.has(t), 'falta ' + t);
    assert.ok(provas.q.filter(q => /Gravit|Kepler|orbital|astros|altitude/.test(q[5])).length >= 200);
    for (const q of provas.q) if (q[11] !== 2) {
      assert.doesNotMatch(q[13], /Prova oficial/, q[0]);
      assert.match(q[13], /Não é uma questão oficial|Autoral|autoral/i, q[0]);
    }
  });
  test('resumos: ids únicos, matérias conhecidas e ao menos três tópicos', () => {
    const ids = new Set(RESUMOS.map(r => r.id));
    assert.equal(ids.size, RESUMOS.length);
    assert.ok(RESUMOS.length >= 100);
    for (const r of RESUMOS) {
      assert.ok(DISCIPLINAS.some(d => d.id === r.disc), r.id);
      assert.ok([1, 2, 3].includes(r.prioridade), r.id);
      assert.ok(r.ramos.length >= 1 && r.ramos.every(([t, i]) => t && i.length), r.id);
      assert.ok(r.ideia && r.cai && r.busca, r.id);
    }
    assert.ok(RESUMOS.some(r => r.id === 'fis-gravitacao'));
  });
  test('mapa de conteúdos liga cada módulo a um resumo que existe', () => {
    const ids = new Set(RESUMOS.map(r => r.id));
    let n = 0;
    for (const [d, mods] of Object.entries(CURRICULO)) for (const [nome, p, rid] of mods) {
      n++; assert.ok(nome && [1, 2, 3].includes(p), d + ' ' + nome);
      if (rid) assert.ok(ids.has(rid), `${d}: ${nome} → ${rid}`);
    }
    assert.ok(n >= 500);
  });
});
