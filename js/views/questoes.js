// Banco de questões: filtros, busca, prática, simulado cronometrado,
// correção automática, dica do tutor, resolução, favoritos e comentários.
import { html, raw, setHTML, $, actions, toast, norm, plural, friendlyError, uuid, nowISO, confirmDialog } from '../core/util.js';
import * as store from '../core/store.js';
import * as auth from '../core/auth.js';
import { sb } from '../core/backend.js';
import { catalog, LEVELS, DIFFICULTY, QTYPES, bancoCarregando } from '../core/conteudo.js';
import { notaTRI } from '../lib/tri.js';

const PAGE = 20;
let filters = { area: '', subject: '', topic: '', level: '', difficulty: '', board: '', year: '', qtype: '', situacao: '', q: '' };
let page = 0;
let run = null; // sessão de questões em andamento
const imgCache = new Map();

function descendants(topics, id) {
  const out = new Set([id]); let grew = true;
  while (grew) { grew = false; for (const t of topics) if (t.parent_id && out.has(t.parent_id) && !out.has(t.id)) { out.add(t.id); grew = true; } }
  return out;
}

function applyFilters(cat, answers, favs) {
  const last = new Map();
  for (const a of answers.slice().sort((x, y) => x.answered_at.localeCompare(y.answered_at))) last.set(a.question_id, a.is_correct);
  const favSet = new Set(favs.map(f => f.id));
  const topicSet = filters.topic ? descendants(cat.topics, +filters.topic) : null;
  const terms = norm(filters.q).split(/\s+/).filter(Boolean);
  return cat.bank.filter(q => {
    const s = cat.subject(q.subject_id);
    if (filters.area && s?.area_id !== +filters.area) return false;
    if (filters.subject && q.subject_id !== +filters.subject) return false;
    if (topicSet && !topicSet.has(q.topic_id)) return false;
    if (filters.level && q.level !== filters.level) return false;
    if (filters.difficulty && q.difficulty !== +filters.difficulty) return false;
    if (filters.board && q.board_id !== +filters.board) return false;
    if (filters.year && q.year !== +filters.year) return false;
    if (filters.qtype && q.qtype !== filters.qtype) return false;
    if (filters.situacao === 'nao' && last.has(q.id)) return false;
    if (filters.situacao === 'erradas' && last.get(q.id) !== false) return false;
    if (filters.situacao === 'certas' && last.get(q.id) !== true) return false;
    if (filters.situacao === 'favoritas' && !favSet.has(q.id)) return false;
    if (terms.length) {
      const hay = norm([q.statement, q.theme, q.explanation, q.code, s?.name, cat.topic(q.topic_id)?.name, ...(q.options || []).map(o => o.body)].join(' '));
      if (!terms.every(t => hay.includes(t))) return false;
    }
    return true;
  }).map(q => ({ q, last: last.get(q.id), fav: favSet.has(q.id) }));
}

async function imageUrl(path) {
  if (!path || !sb || !auth.isLogged() || !navigator.onLine) return null;
  if (imgCache.has(path)) return imgCache.get(path);
  const { data } = await sb.storage.from('question-images').createSignedUrl(path, 3600);
  const u = data?.signedUrl || null; imgCache.set(path, u); return u;
}

async function errorsDeck() {
  const decks = await store.all('decks');
  let d = decks.find(x => x.kind === 'errors');
  if (!d) d = await store.put('decks', { name: 'Questões que errei', kind: 'errors', subject_id: null, color: null, is_favorite: false });
  return d;
}

/** Erro vira flashcard automaticamente (uma vez por questão). */
async function wrongToFlashcard(q) {
  const d = await errorsDeck();
  const cards = await store.all('flashcards');
  if (cards.some(c => c.source_question_id === q.id)) return false;
  const right = q.options.find(o => o.is_correct);
  await store.put('flashcards', {
    deck_id: d.id, front: q.statement.slice(0, 1000), back: `${right ? right.body + '\n\n' : ''}${q.explanation}`.slice(0, 3000),
    subject_id: q.subject_id, is_favorite: false, source_question_id: q.id, ease: 2.5, interval_days: 0, repetitions: 0, lapses: 0, due_at: nowISO(), last_reviewed_at: null
  });
  return true;
}

export default {
  title: 'Questões',
  async render(el, params, ctx) {
    if (bancoCarregando()) { setHTML(el, html`<div class="card"><h1>Questões</h1><p class="muted">Preparando o banco com milhares de questões neste aparelho. Isso só acontece na primeira vez…</p></div>`); await bancoCarregando(); }
    let cat = await catalog();
    let porCodigo = null;
    // Retoma uma tentativa guardada (simulado ou lista do professor)
    const resume = async (att, mode, extra = {}) => {
      const answered = (await store.all('answers')).filter(a => a.exam_attempt_id === att.id);
      const qs = att.filters.ids.map(id => cat.question(id)).filter(Boolean);
      if (!qs.length) return false;
      const res = qs.map(q => { const a = answered.find(x => x.question_id === q.id); return a ? a.is_correct : undefined; });
      const first = res.findIndex(x => x === undefined);
      run = { mode, attempt: att, qs, i: first < 0 ? qs.length - 1 : first, res, t0: new Date(att.started_at).getTime(), tq: Date.now(), active: 0, ...extra };
      return true;
    };
    if (params[0] === 'simulado' && params[1]) {
      const att = await store.get('exam_attempts', params[1]);
      if (att && !att.finished_at && att.filters?.ids) await resume(att, 'simulado');
    } else if (params[0] === 'lista' && params[1]) {
      run = null;
      const back = msg => { setHTML(el, html`<div class="card stack"><h1>Lista</h1><p>${msg}</p><div><a class="btn" href="#turmas">Voltar para Minhas turmas</a></div></div>`); };
      const asg = (await store.meta.get('turmas:cache', { assignments: [] })).assignments.find(a => a.assignment_id === params[1]);
      if (!asg) return back('Esta lista não está disponível neste aparelho. Abra Minhas turmas com internet para baixá-la.');
      let ids = await store.meta.get('list:' + asg.list_id, null);
      if (!ids && navigator.onLine) { try { await (await import('./turmas.js')).cacheLists([asg]); cat = await catalog(); ids = await store.meta.get('list:' + asg.list_id, null); } catch (e) { return back(friendlyError(e)); } }
      if (!ids || !ids.length) return back('As questões desta lista ainda não foram baixadas. Abra Minhas turmas com internet.');
      const mode = asg.mode === 'simulado' ? 'simulado' : 'pratica';
      const extra = { assignment: asg, limitMs: asg.time_limit_min ? asg.time_limit_min * 60e3 : 0 };
      const open = (await store.all('exam_attempts')).find(x => x.assignment_id === asg.assignment_id && !x.finished_at);
      if (!(open && await resume(open, mode, extra))) {
        const qs = ids.map(id => cat.question(id)).filter(Boolean);
        if (!qs.length) return back('As questões desta lista não estão mais disponíveis.');
        const att = await store.put('exam_attempts', { title: asg.title.slice(0, 120), filters: { ids: qs.map(q => q.id), lista: asg.list_id }, total: qs.length, correct: 0, started_at: nowISO(), finished_at: null, assignment_id: asg.assignment_id });
        const t = Date.now();
        run = { mode, attempt: att, qs, i: 0, res: [], t0: t, tq: t, active: 0, ...extra };
      }
    } else if (params[0] === 'materia' && params[1]) {
      run = null; filters = { ...filters, area: '', subject: params[1], topic: '' }; page = 0;
    } else if (params[0] === 'codigos' && params[1]) {
      run = null;
      porCodigo = params[1].split(',').map(c => cat.questions.find(q => q.code === c.trim().toUpperCase())).filter(Boolean);
    } else if (params[0] !== 'run') run = null;

    let timer = null;
    const stopTimer = () => clearInterval(timer);

    async function drawBank() {
      stopTimer();
      const [answers, favs, settings] = await Promise.all([store.all('answers'), store.all('favorites'), store.meta.get('app_settings', {})]);
      const res = applyFilters(cat, answers, favs);
      const pages = Math.max(1, Math.ceil(res.length / PAGE)); page = Math.min(page, pages - 1);
      const subs = cat.subjects.filter(s => !filters.area || s.area_id === +filters.area);
      const tops = cat.topics.filter(t => filters.subject && t.subject_id === +filters.subject);
      const years = [...new Set(cat.bank.map(q => q.year).filter(Boolean))].sort((a, b) => b - a);
      const usedBoards = new Set(cat.bank.map(q => q.board_id));
      const nSim = Math.min(res.length, +(settings?.questoes_por_simulado) || 10);
      const sel = (name, label, opts, value) => html`<label class="f">${label}<select class="input" data-onchange="filter" name="${name}"><option value="">Todos</option>${opts.map(([v, t]) => html`<option value="${v}" ${String(value) === String(v) ? 'selected' : ''}>${t}</option>`)}</select></label>`;
      const topicLabel = t => (t.parent_id ? '— ' : '') + t.name;
      const orderedTopics = tops.filter(t => !t.parent_id).flatMap(p => [p, ...tops.filter(c => c.parent_id === p.id)]);

      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Banco de questões</span><h1>Questões</h1>
          <p>${plural(cat.bank.length, 'questão disponível', 'questões disponíveis')}. Erros viram flashcards automaticamente para você revisar.</p></div></div>
        <div class="split">
          <form class="card stack sticky" id="filters" role="search" aria-label="Filtros de questões">
            <label class="f">Buscar<input class="input" type="search" name="q" value="${filters.q}" placeholder="Ex.: crase, juros, Newton" data-oninput="search"></label>
            ${sel('area', 'Área (matéria)', cat.areas.map(a => [a.id, a.name]), filters.area)}
            ${sel('subject', 'Disciplina', subs.map(s => [s.id, s.name]), filters.subject)}
            ${filters.subject ? sel('topic', 'Conteúdo', orderedTopics.map(t => [t.id, topicLabel(t)]), filters.topic) : ''}
            ${sel('level', 'Nível', Object.entries(LEVELS), filters.level)}
            ${sel('difficulty', 'Dificuldade', Object.entries(DIFFICULTY), filters.difficulty)}
            ${sel('board', 'Instituição ou banca', cat.boards.filter(b => usedBoards.has(b.id)).map(b => [b.id, b.name]), filters.board)}
            ${sel('year', 'Ano', years.map(y => [y, y]), filters.year)}
            ${sel('qtype', 'Tipo', Object.entries(QTYPES), filters.qtype)}
            ${sel('situacao', 'Situação', [['nao', 'Não respondidas'], ['erradas', 'Errei da última vez'], ['certas', 'Acertei da última vez'], ['favoritas', 'Favoritas']], filters.situacao)}
            <button class="btn ghost sm" type="button" data-action="clear">Limpar filtros</button>
          </form>
          <div class="stack">
            <div class="card row between">
              <span><b class="num">${res.length}</b> ${res.length === 1 ? 'questão encontrada' : 'questões encontradas'}</span>
              <div class="row">
                <button class="btn" type="button" data-action="practice" ${res.length ? '' : 'disabled'}>Praticar estas</button>
                <button class="btn second" type="button" data-action="exam" ${res.length ? '' : 'disabled'}>Simulado com ${nSim}</button>
              </div>
            </div>
            ${res.length ? html`<div class="stack">${res.slice(page * PAGE, page * PAGE + PAGE).map(({ q, last, fav }) => html`
              <div class="card row between" style="align-items:flex-start;flex-wrap:nowrap">
                <button type="button" class="linkbtn" style="text-decoration:none;color:inherit;text-align:left;flex:1;min-width:0" data-action="open" data-id="${q.id}">
                  <div class="q-meta"><span class="chip">${cat.subject(q.subject_id)?.name || ''}</span>${q.topic_id ? html`<span class="chip">${cat.topic(q.topic_id)?.name}</span>` : ''}<span class="chip">${LEVELS[q.level]}</span><span class="chip">${DIFFICULTY[q.difficulty]}</span>${last === true ? html`<span class="chip good">Acertou</span>` : last === false ? html`<span class="chip bad">Errou</span>` : ''}</div>
                  <p style="margin-top:8px;font-weight:600">${q.statement.length > 180 ? q.statement.slice(0, 180) + '…' : q.statement}</p>
                  <p class="muted small">${q.code || ''}${q.board_id ? ' · ' + (cat.board(q.board_id)?.name || '') : ''}${q.year ? ' · ' + q.year : ''}</p>
                </button>
                <button type="button" class="star" data-action="fav" data-id="${q.id}" aria-pressed="${fav}" aria-label="${fav ? 'Remover dos favoritos' : 'Favoritar'}">${fav ? '★' : '☆'}</button>
              </div>`)}</div>
              ${pages > 1 ? html`<div class="row" style="justify-content:center"><button class="btn ghost sm" type="button" data-action="page" data-d="-1" ${page ? '' : 'disabled'}>Anterior</button><span class="muted num">Página ${page + 1} de ${pages}</span><button class="btn ghost sm" type="button" data-action="page" data-d="1" ${page < pages - 1 ? '' : 'disabled'}>Próxima</button></div>` : ''}`
            : html`<div class="empty">Nenhuma questão com esses filtros. Tente limpar alguns.</div>`}
          </div>
        </div></div>`);
      el._res = res;
    }

    async function startRun(mode, list) {
      const t = Date.now();
      run = { mode, qs: list, i: 0, res: [], t0: t, tq: t, active: 0 };
      if (mode === 'simulado') {
        run.attempt = await store.put('exam_attempts', { title: `Simulado · ${new Date().toLocaleDateString('pt-BR')}`, filters: { ...filters, ids: list.map(q => q.id) }, total: list.length, correct: 0, started_at: nowISO(), finished_at: null });
        history.replaceState(null, '', `#questoes/simulado/${run.attempt.id}`);
      }
      drawQuestion();
    }

    async function drawQuestion() {
      const q = run.qs[run.i];
      run.sel = null; run.hint = false; run.tq = Date.now(); run.answered = run.res[run.i] !== undefined;
      const favs = await store.all('favorites');
      const fav = favs.some(f => f.id === q.id);
      const s = cat.subject(q.subject_id), tp = cat.topic(q.topic_id), b = cat.board(q.board_id);
      const letters = 'ABCDEF';
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="row between"><div class="dots" aria-label="Progresso">${run.qs.map((_, i) => html`<span class="${i === run.i ? 'cur' : ''} ${run.res[i] === true ? 'ok' : run.res[i] === false ? 'no' : ''}">${i + 1}</span>`)}</div>
          <span class="chip num" id="clock" aria-label="Tempo"></span></div>
        <article class="card" aria-labelledby="qText">
          <div class="row between" style="align-items:flex-start"><div class="q-meta"><span class="chip on">${s?.name || ''}</span>${tp ? html`<span class="chip">${tp.name}</span>` : ''}<span class="chip">${LEVELS[q.level]}</span><span class="chip">${DIFFICULTY[q.difficulty]}</span>${b ? html`<span class="chip">${b.name}${q.year ? ' · ' + q.year : ''}</span>` : ''}</div>
            <button type="button" class="star" data-action="fav" data-id="${q.id}" aria-pressed="${fav}" aria-label="${fav ? 'Remover dos favoritos' : 'Favoritar'}">${fav ? '★' : '☆'}</button></div>
          <p class="q-text" id="qText">${q.statement}</p>
          ${q.image_path ? html`<div id="qImg" class="muted small">${q.image_alt ? `Imagem: ${q.image_alt}` : 'Imagem da questão (disponível com internet).'}</div>` : ''}
          <div class="q-opts" role="radiogroup" aria-labelledby="qText">${q.options.map((o, i) => html`<button type="button" class="opt" role="radio" aria-checked="false" data-action="pick" data-o="${o.id}"><span class="L">${q.qtype === 'true_false' ? (i ? 'E' : 'C') : letters[i]}</span><span>${o.body}</span></button>`)}</div>
          <div class="explain" id="qHint" hidden style="margin-top:12px"></div>
          <div class="explain" id="qExp" hidden style="margin-top:12px" aria-live="polite"></div>
          ${q.source ? html`<p class="muted small" style="margin-top:10px">Fonte: ${q.source}</p>` : ''}
        </article>
        <div class="row between">
          <div class="row"><button class="btn ghost" type="button" data-action="quit">Sair</button>${q.hint && run.mode !== 'simulado' ? html`<button class="btn mark" type="button" data-action="hint" id="hintBtn">Pedir dica ao tutor</button>` : ''}</div>
          <div class="row"><button class="btn" type="button" data-action="confirm" id="confirmBtn" disabled>Confirmar resposta</button><button class="btn" type="button" data-action="next" id="nextBtn" hidden>${run.i === run.qs.length - 1 ? 'Ver resultado' : 'Próxima'}</button></div>
        </div>
        <section class="card stack" id="comments" hidden aria-label="Comentários"></section>
      </div>`);
      stopTimer();
      const label = run.assignment ? (run.mode === 'simulado' ? 'Simulado do professor' : 'Lista do professor') : run.mode === 'simulado' ? 'Simulado' : 'Prática';
      const tick = () => {
        if (!run) return stopTimer();
        const ms = Date.now() - run.t0, sec = Math.floor((run.limitMs ? Math.max(0, run.limitMs - ms) : ms) / 1000);
        const c = $('#clock', el); if (c) c.textContent = `${label} · ${run.limitMs ? 'restam ' : ''}${String(Math.floor(sec / 60)).padStart(2, '0')}:${String(sec % 60).padStart(2, '0')}`;
        if (run.limitMs && ms >= run.limitMs) { toast('O tempo acabou. As questões sem resposta contam como erradas.', 4000); drawResult(); }
      };
      tick(); timer = setInterval(tick, 500);
      if (q.image_path) imageUrl(q.image_path).then(u => { const box = $('#qImg', el); if (u && box) setHTML(box, html`<img class="q-img" src="${u}" alt="${q.image_alt || 'Imagem da questão'}">`); });
      if (run.answered) { // simulado retomado: mostra a correção já registrada
        const ans = (await store.all('answers')).find(a => a.question_id === q.id && a.exam_attempt_id === run.attempt?.id);
        showCorrection(q, ans?.option_id);
      }
    }

    function showCorrection(q, chosen) {
      const ok = q.options.find(o => o.id === chosen)?.is_correct === true;
      el.querySelectorAll('.opt').forEach(x => { x.disabled = true; x.classList.remove('sel'); const o = q.options.find(o => o.id === x.dataset.o); if (o.is_correct) x.classList.add('ok'); else if (o.id === chosen) x.classList.add('no'); });
      const exp = $('#qExp', el); exp.hidden = false;
      setHTML(exp, html`<b style="color:${raw(ok ? 'var(--good)' : 'var(--bad)')}">${ok ? 'Correto!' : 'Resposta incorreta.'}</b> ${q.explanation}${auth.isLogged() ? html` <a class="small" href="#duvidas/nova/questao/${q.id}">Ainda com dúvida? Pergunte à professora</a>` : ''}`);
      $('#confirmBtn', el).hidden = true; $('#nextBtn', el).hidden = false;
      const hb = $('#hintBtn', el); if (hb) hb.hidden = true;
      loadComments(q);
      return ok;
    }

    async function loadComments(q) {
      const box = $('#comments', el); if (!box) return;
      if (!sb || !auth.isLogged()) { box.hidden = false; setHTML(box, html`<h3>Comentários</h3><p class="muted small">Entre na sua conta para ver e escrever comentários.</p>`); return; }
      if (!navigator.onLine) { box.hidden = false; setHTML(box, html`<h3>Comentários</h3><p class="muted small">Os comentários aparecem quando houver internet.</p>`); return; }
      const settings = await store.meta.get('app_settings', {});
      const { data, error } = await sb.from('question_comments').select('id, body, created_at, user_id, status').eq('question_id', q.id).order('created_at').limit(100);
      box.hidden = false;
      const canMod = auth.can('content.manage');
      setHTML(box, html`<h3>Comentários ${data ? html`<span class="muted small">(${data.length})</span>` : ''}</h3>
        ${error ? html`<p class="err">Não foi possível carregar os comentários.</p>` : (data.length ? html`<div class="list">${data.map(c => html`<div><p class="pre">${c.body}</p><p class="muted small">${new Date(c.created_at).toLocaleString('pt-BR')}${c.user_id === auth.state.user.id ? ' · você' : ''}${c.status === 'hidden' ? ' · oculto' : ''}
          ${c.user_id === auth.state.user.id || canMod ? html` · <button class="linkbtn" type="button" data-action="delComment" data-id="${c.id}">excluir</button>` : ''}</p></div>`)}</div>` : html`<p class="muted small">Seja o primeiro a comentar.</p>`)}
        ${settings?.comentarios_ativos === false ? html`<p class="muted small">Comentários desativados pela administração.</p>` : html`<form class="stack" data-q="${q.id}" id="commentForm"><label class="f">Seu comentário<textarea class="input" name="body" rows="2" maxlength="2000" required></textarea></label><div><button class="btn sm" type="submit">Comentar</button></div></form>`}`);
      const f = $('#commentForm', box);
      if (f) f.onsubmit = async e => {
        e.preventDefault(); const body = f.body.value.trim(); if (body.length < 2) return;
        const { error: err } = await sb.from('question_comments').insert({ id: uuid(), question_id: q.id, body });
        if (err) toast(friendlyError(err)); else { toast('Comentário publicado'); loadComments(q); }
      };
    }

    async function drawResult() {
      stopTimer();
      const n = run.qs.length, ok = run.res.filter(x => x === true).length, secs = Math.floor((Date.now() - run.t0) / 1000);
      const bySubj = {};
      run.qs.forEach((q, i) => { const k = cat.subject(q.subject_id)?.name || 'Outras'; (bySubj[k] ||= [0, 0]); bySubj[k][1]++; if (run.res[i]) bySubj[k][0]++; });
      const weak = Object.entries(bySubj).filter(([, [a, b]]) => a < b).map(([s]) => s);
      if (run.attempt) await store.patch('exam_attempts', run.attempt.id, { finished_at: nowISO(), correct: ok, total: n });
      await saveSession();
      const fromList = !!run.assignment;
      const tri = run.mode === 'simulado' && n >= 5 ? notaTRI(run.qs.map((q, i) => ({ difficulty: q.difficulty, ok: run.res[i] === true ? true : false }))) : null;
      if (tri && run.attempt) await store.meta.set('tri:' + run.attempt.id, tri.nota);
      history.replaceState(null, '', '#questoes'); // o link "Voltar para Minhas turmas" muda o endereço e abre a tela
      setHTML(el, html`<div class="card stack" style="text-align:center;justify-items:center;padding:32px">
        <span class="eyebrow">Resultado ${run.mode === 'simulado' ? 'do simulado' : 'da prática'}</span>
        <div style="font-family:var(--f-display);font-size:3.2rem;font-weight:800" class="num">${ok}/${n}</div>
        <p class="muted num">${Math.round(ok / n * 100)}% de acerto em ${Math.floor(secs / 60)} min ${secs % 60} s</p>
        ${tri ? html`<div class="card stack" style="max-width:460px;text-align:left"><div class="row between"><b>Nota estimada estilo TRI</b><span class="num" style="font-family:var(--f-display);font-size:1.8rem;font-weight:800">${tri.nota}</span></div>
          <p class="small muted">Como no ENEM, acertar questões fáceis vale mais para a coerência da nota, e acertar difíceis errando fáceis parece chute.${tri.coerencia === 'baixa' ? ' Neste simulado você errou questões fáceis e acertou difíceis, por isso a nota ficou menor.' : ''} É uma estimativa para treino, não a nota oficial.</p></div>` : ''}
        <div style="width:min(440px,100%);text-align:left" class="stack">${Object.entries(bySubj).map(([s, [a, b]]) => html`<div><div class="row between small"><span>${s}</span><span class="num muted">${a}/${b}</span></div><div class="bar"><i style="width:${Math.round(a / b * 100)}%;background:${raw(a === b ? 'var(--good)' : a === 0 ? 'var(--bad)' : 'var(--warn)')}"></i></div></div>`)}</div>
        <p style="max-width:56ch">${weak.length ? html`Vale reforçar <b>${weak.join(', ')}</b>. As questões erradas viraram flashcards no baralho <b>Questões que errei</b>.` : 'Mandou muito bem! Tente outro nível para se desafiar.'}</p>
        <div class="row" style="justify-content:center">${fromList ? html`<a class="btn" href="#turmas">Voltar para Minhas turmas</a>` : html`<button class="btn" type="button" data-action="back">Voltar ao banco</button>`}${weak.length ? html`<a class="btn ghost" href="#flashcards">Revisar meus erros</a>` : ''}<a class="btn ghost" href="#desempenho">Ver desempenho</a></div></div>`);
      run = null;
    }

    async function saveSession() {
      if (!run || run.saved) return;
      const dur = Math.round(run.active / 1000);
      if (dur >= 30) await store.append('study_sessions', { kind: 'questoes', subject: null, started_at: new Date(run.t0).toISOString(), duration_sec: Math.min(dur, 86400) });
      run.saved = true;
    }

    actions(el, {
      clear() { filters = { area: '', subject: '', topic: '', level: '', difficulty: '', board: '', year: '', qtype: '', situacao: '', q: '' }; page = 0; drawBank(); },
      page(b) { page += +b.dataset.d; drawBank(); },
      practice() { startRun('pratica', el._res.map(r => r.q)); },
      exam() {
        const list = el._res.map(r => r.q).sort(() => Math.random() - 0.5);
        store.meta.get('app_settings', {}).then(s => startRun('simulado', list.slice(0, +(s?.questoes_por_simulado) || 10)));
      },
      open(b) { const i = el._res.findIndex(r => r.q.id === b.dataset.id); const list = el._res.map(r => r.q); startRun('pratica', [...list.slice(i), ...list.slice(0, i)]); },
      async fav(b) {
        const id = b.dataset.id, cur = await store.get('favorites', id);
        if (cur && !cur.deleted_at) await store.remove('favorites', id); else await store.put('favorites', { ...(cur || {}), id, deleted_at: null });
        const on = !(cur && !cur.deleted_at);
        b.setAttribute('aria-pressed', on); b.textContent = on ? '★' : '☆'; b.setAttribute('aria-label', on ? 'Remover dos favoritos' : 'Favoritar');
        toast(on ? 'Adicionada aos favoritos' : 'Removida dos favoritos');
      },
      pick(b) {
        if (b.disabled) return; run.sel = b.dataset.o;
        el.querySelectorAll('.opt').forEach(x => { x.classList.toggle('sel', x === b); x.setAttribute('aria-checked', x === b); });
        $('#confirmBtn', el).disabled = false;
      },
      hint() { const q = run.qs[run.i]; run.hint = true; const h = $('#qHint', el); h.hidden = false; setHTML(h, html`<b>Tutor:</b> ${q.hint} <span class="muted">(A dica ajuda a pensar, sem entregar a resposta.)</span>`); $('#hintBtn', el).hidden = true; },
      async confirm() {
        const q = run.qs[run.i]; if (!run.sel) return;
        const spent = Date.now() - run.tq; run.active += Math.min(spent, 15 * 60e3);
        const ok = showCorrection(q, run.sel);
        run.res[run.i] = ok;
        await store.append('answers', { question_id: q.id, option_id: run.sel, is_correct: ok, time_spent_ms: Math.min(spent, 7200000), used_hint: !!run.hint, mode: run.mode, exam_attempt_id: run.attempt?.id || null, answered_at: nowISO() });
        if (!ok && await wrongToFlashcard(q)) toast('Erro guardado como flashcard para revisar');
        el.querySelector('.dots').children[run.i].classList.add(ok ? 'ok' : 'no');
        $('#nextBtn', el).focus();
      },
      next() { if (run.i < run.qs.length - 1) { run.i++; drawQuestion(); } else drawResult(); },
      async quit() {
        if (run?.attempt && run.res.filter(x => x !== undefined).length < run.qs.length) {
          const ok = await confirmDialog(run.assignment ? 'Sair da lista? Você pode continuar depois em Minhas turmas.' : 'Sair do simulado? Você pode continuar depois pela tela Início.', { ok: 'Sair' });
          if (!ok) return;
        }
        const fromList = !!run?.assignment;
        await saveSession(); run = null;
        if (fromList) { location.hash = '#turmas'; return; }
        history.replaceState(null, '', '#questoes'); drawBank();
      },
      back() { drawBank(); },
      async delComment(b) {
        if (!(await confirmDialog('Excluir este comentário?', { ok: 'Excluir', danger: true }))) return;
        const { error } = await sb.from('question_comments').delete().eq('id', b.dataset.id);
        if (error) toast(friendlyError(error)); else loadComments(run.qs[run.i]);
      }
    });
    el.addEventListener('change', e => { if (e.target.dataset.onchange === 'filter') { filters[e.target.name] = e.target.value; if (e.target.name === 'area') { filters.subject = ''; filters.topic = ''; } if (e.target.name === 'subject') filters.topic = ''; page = 0; drawBank(); } });
    let st; el.addEventListener('input', e => { if (e.target.dataset.oninput === 'search') { clearTimeout(st); st = setTimeout(async () => { filters.q = e.target.value; page = 0; const pos = e.target.selectionStart; await drawBank(); const i = el.querySelector('[name=q]'); i.focus(); i.setSelectionRange(pos, pos); }, 250); } });
    el.addEventListener('submit', e => { if (e.target.id === 'filters') e.preventDefault(); });

    if (run) drawQuestion(); else if (porCodigo?.length) await startRun('pratica', porCodigo); else await drawBank();
    return () => { stopTimer(); if (run) saveSession(); };
  }
};
