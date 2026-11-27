// Banco de questões, prática com correção na hora, simulado como prova real (correção no fim),
// desafio do dia, revisão do caderno de erros e listas do professor.
import { html, useState, useEffect, useRef, useMemo, useApp, go, PageHead, Field, Select, Bar, Empty, Loading, toast, confirmar, subjectIcon } from '../ui.js';
import * as store from '../../core/store.js';
import * as auth from '../../core/auth.js';
import { sb } from '../../core/backend.js';
import { catalog, LEVELS, DIFFICULTY, QTYPES, bancoCarregando } from '../../core/conteudo.js';
import { notaTRI } from '../../lib/tri.js';
import { norm, nowISO, uuid, dayKey, friendlyError, pct } from '../../core/util.js';
import * as aparencia from '../../core/aparencia.js';
import { dailyQuestions, wrongNow, XP } from '../jogo.js';
import { SimuladoModal } from './praticar.js';

const PAGE = 20;
const EMPTY = { area: '', subject: '', topic: '', level: '', difficulty: '', board: '', year: '', qtype: '', situacao: '', q: '' };
let lastFilters = { ...EMPTY };
const LETRAS = 'ABCDEF';

function descendants(topics, id) {
  const out = new Set([id]); let grew = true;
  while (grew) { grew = false; for (const t of topics) if (t.parent_id && out.has(t.parent_id) && !out.has(t.id)) { out.add(t.id); grew = true; } }
  return out;
}

async function errorsDeck() {
  const decks = await store.all('decks');
  return decks.find(x => x.kind === 'errors') || store.put('decks', { name: 'Questões que errei', kind: 'errors', subject_id: null, color: null, is_favorite: false });
}
async function wrongToFlashcard(q) {
  const cards = await store.all('flashcards');
  if (cards.some(c => c.source_question_id === q.id)) return false;
  const d = await errorsDeck();
  const right = q.options.find(o => o.is_correct);
  await store.put('flashcards', { deck_id: d.id, front: q.statement.slice(0, 1000), back: `${right ? right.body + '\n\n' : ''}${q.explanation}`.slice(0, 3000), subject_id: q.subject_id, is_favorite: false, source_question_id: q.id, ease: 2.5, interval_days: 0, repetitions: 0, lapses: 0, due_at: nowISO(), last_reviewed_at: null });
  return true;
}
const imgCache = new Map();
async function imageUrl(path) {
  if (!path || !sb || !auth.isLogged() || !navigator.onLine) return null;
  if (imgCache.has(path)) return imgCache.get(path);
  const { data } = await sb.storage.from('question-images').createSignedUrl(path, 3600);
  const u = data?.signedUrl || null; imgCache.set(path, u); return u;
}

// ---------------- Banco ----------------
function Banco({ cat, start, initial }) {
  const app = useApp();
  const [f, setF] = useState(initial || lastFilters);
  const [page, setPage] = useState(0);
  const [mine, setMine] = useState({ answers: [], favs: [] });
  const [tick, setTick] = useState(0);
  useEffect(() => { Promise.all([store.all('answers'), store.all('favorites')]).then(([answers, favs]) => setMine({ answers, favs })); }, [tick]);
  useEffect(() => { lastFilters = f; setPage(0); }, [JSON.stringify(f)]);
  const set = (k, v) => setF(x => ({ ...x, [k]: v, ...(k === 'area' ? { subject: '', topic: '' } : k === 'subject' ? { topic: '' } : {}) }));
  const res = useMemo(() => {
    const last = new Map();
    for (const a of mine.answers.slice().sort((x, y) => x.answered_at.localeCompare(y.answered_at))) last.set(a.question_id, a.is_correct);
    const favSet = new Set(mine.favs.map(x => x.id));
    const topicSet = f.topic ? descendants(cat.topics, +f.topic) : null;
    const terms = norm(f.q).split(/\s+/).filter(Boolean);
    return cat.bank.filter(q => {
      if (f.area && cat.subject(q.subject_id)?.area_id !== +f.area) return false;
      if (f.subject && q.subject_id !== +f.subject) return false;
      if (topicSet && !topicSet.has(q.topic_id)) return false;
      if (f.level && q.level !== f.level) return false;
      if (f.difficulty && q.difficulty !== +f.difficulty) return false;
      if (f.board && q.board_id !== +f.board) return false;
      if (f.year && q.year !== +f.year) return false;
      if (f.qtype && q.qtype !== f.qtype) return false;
      if (f.situacao === 'nao' && last.has(q.id)) return false;
      if (f.situacao === 'erradas' && last.get(q.id) !== false) return false;
      if (f.situacao === 'certas' && last.get(q.id) !== true) return false;
      if (f.situacao === 'favoritas' && !favSet.has(q.id)) return false;
      if (terms.length) { const hay = norm([q.statement, q.theme, q.code, cat.topic(q.topic_id)?.name].join(' ')); if (!terms.every(t => hay.includes(t))) return false; }
      return true;
    }).map(q => ({ q, last: last.get(q.id), fav: favSet.has(q.id) }));
  }, [f, mine, cat]);
  const pages = Math.max(1, Math.ceil(res.length / PAGE));
  const usedBoards = new Set(cat.bank.map(q => q.board_id));
  const tops = cat.topics.filter(t => f.subject && t.subject_id === +f.subject);
  const orderedTopics = tops.filter(t => !t.parent_id).flatMap(p => [p, ...tops.filter(c => c.parent_id === p.id)]);
  const fav = async id => { const cur = await store.get('favorites', id); if (cur && !cur.deleted_at) await store.remove('favorites', id); else await store.put('favorites', { ...(cur || {}), id, deleted_at: null }); setTick(t => t + 1); };
  const nFiltros = Object.entries(f).filter(([k, v]) => v && k !== 'q').length;
  return html`<div class="col fade-in" style="gap:18px">
    <${PageHead} eyebrow="Banco de questões" title="Questões" actions=${html`<button class="btn" onClick=${() => app.setModal(html`<${SimuladoModal} cat=${cat} onClose=${() => app.setModal(null)} />`)}>📝 Montar simulado</button>`}>${cat.bank.length.toLocaleString('pt-BR')} questões autorais em ${usedBoards.size} estilos de prova. Errou? A questão vira flashcard e entra no caderno de erros.</${PageHead}>
    <div class="bank-layout">
      <aside class="card pad bank-filters" aria-label="Filtros">
        <${Field} label="Buscar"><input class="input" type="search" value=${f.q} placeholder="Ex.: crase, juros, Newton" onInput=${e => set('q', e.target.value)} /></${Field}>
        <${Field} label="Estilo de prova"><${Select} value=${f.board} onChange=${v => set('board', v)} options=${cat.boards.filter(b => usedBoards.has(b.id)).map(b => [b.id, b.name])} /></${Field}>
        <${Field} label="Área"><${Select} value=${f.area} onChange=${v => set('area', v)} options=${cat.areas.map(a => [a.id, a.name])} /></${Field}>
        <${Field} label="Matéria"><${Select} value=${f.subject} onChange=${v => set('subject', v)} options=${cat.subjects.filter(s => !f.area || s.area_id === +f.area).map(s => [s.id, s.name])} /></${Field}>
        ${f.subject && html`<${Field} label="Conteúdo"><${Select} value=${f.topic} onChange=${v => set('topic', v)} options=${orderedTopics.map(t => [t.id, (t.parent_id ? '— ' : '') + t.name])} /></${Field}>`}
        <${Field} label="Nível"><${Select} value=${f.level} onChange=${v => set('level', v)} options=${Object.entries(LEVELS)} /></${Field}>
        <${Field} label="Dificuldade"><${Select} value=${f.difficulty} onChange=${v => set('difficulty', v)} options=${Object.entries(DIFFICULTY)} /></${Field}>
        <${Field} label="Tipo"><${Select} value=${f.qtype} onChange=${v => set('qtype', v)} options=${Object.entries(QTYPES)} /></${Field}>
        <${Field} label="Situação"><${Select} value=${f.situacao} onChange=${v => set('situacao', v)} options=${[['nao', 'Não respondidas'], ['erradas', 'Errei da última vez'], ['certas', 'Acertei da última vez'], ['favoritas', 'Favoritas']]} /></${Field}>
        ${(nFiltros > 0 || f.q) && html`<button class="btn ghost sm" onClick=${() => setF({ ...EMPTY })}>Limpar filtros</button>`}
      </aside>
      <div class="col" style="gap:12px">
        <div class="card pad row wrap between"><span><b class="num" style="font-size:20px">${res.length.toLocaleString('pt-BR')}</b> ${res.length === 1 ? 'questão encontrada' : 'questões encontradas'}</span>
          <div class="row wrap"><button class="btn primary" disabled=${!res.length} onClick=${() => start({ mode: 'pratica', qs: res.map(r => r.q) })}>▶ Praticar estas</button>
            <button class="btn" disabled=${!res.length} onClick=${() => start({ mode: 'simulado', qs: res.map(r => r.q).sort(() => Math.random() - 0.5).slice(0, 10), title: 'Simulado rápido · ' + new Date().toLocaleDateString('pt-BR'), limitMs: 0 })}>📝 Simulado com 10</button></div></div>
        ${res.length ? res.slice(page * PAGE, page * PAGE + PAGE).map(({ q, last, fav: isFav }, i) => html`<div class="card qitem" key=${q.id}>
            <button class="grow" data-action="open" style="all:unset;cursor:pointer;flex:1;min-width:0" onClick=${() => { const list = res.map(r => r.q); const k = page * PAGE + i; start({ mode: 'pratica', qs: [...list.slice(k), ...list.slice(0, k)] }); }}>
              <div class="q-meta"><span class="chip accent">${subjectIcon(cat.subject(q.subject_id)?.name)} ${cat.subject(q.subject_id)?.name || ''}</span>${q.topic_id && html`<span class="chip">${cat.topic(q.topic_id)?.name}</span>`}<span class="chip">${DIFFICULTY[q.difficulty]}</span>${last === true ? html`<span class="chip ok">acertou</span>` : last === false ? html`<span class="chip danger">errou</span>` : null}</div>
              <p style="margin-top:8px;font-weight:500">${q.statement.length > 200 ? q.statement.slice(0, 200) + '…' : q.statement}</p>
              <p class="tiny faint" style="margin-top:6px">${q.code}${q.board_id ? ' · ' + (cat.board(q.board_id)?.name || '') : ''}</p></button>
            <button class=${'star' + (isFav ? ' on' : '')} aria-pressed=${isFav} aria-label=${isFav ? 'Remover dos favoritos' : 'Favoritar'} onClick=${() => fav(q.id)}>${isFav ? '★' : '☆'}</button></div>`)
          : html`<div class="card"><${Empty} icon="🔎" title="Nenhuma questão com esses filtros">Tente limpar alguns filtros.</${Empty}></div>`}
        ${pages > 1 && html`<div class="row" style="justify-content:center"><button class="btn sm" disabled=${!page} onClick=${() => { setPage(page - 1); window.scrollTo(0, 0); }}>← Anterior</button><span class="muted small num">Página ${page + 1} de ${pages}</span><button class="btn sm" disabled=${page >= pages - 1} onClick=${() => { setPage(page + 1); window.scrollTo(0, 0); }}>Próxima →</button></div>`}
      </div>
    </div></div>`;
}

// ---------------- Resolução ----------------
function Comentarios({ q }) {
  const [list, setList] = useState(null);
  const [body, setBody] = useState('');
  const load = () => sb.from('question_comments').select('id, body, created_at, user_id, status').eq('question_id', q.id).order('created_at').limit(100).then(({ data }) => setList(data || []));
  useEffect(() => { if (sb && auth.isLogged() && navigator.onLine) load(); }, [q.id]);
  if (!sb || !auth.isLogged()) return null;
  if (!navigator.onLine) return html`<p class="tiny faint">Os comentários aparecem quando houver internet.</p>`;
  const send = async () => { if (body.trim().length < 2) return; const { error } = await sb.from('question_comments').insert({ id: uuid(), question_id: q.id, body: body.trim() }); if (error) toast(friendlyError(error)); else { setBody(''); toast('Comentário publicado'); load(); } };
  return html`<details class="card pad"><summary style="cursor:pointer;font-weight:700">💬 Comentários ${list ? `(${list.length})` : ''}</summary>
    <div class="col mt">${(list || []).map(c => html`<div style="border-bottom:1px solid var(--line);padding-bottom:8px"><p class="pre">${c.body}</p><p class="tiny faint">${new Date(c.created_at).toLocaleString('pt-BR')}${c.user_id === auth.state.user.id ? ' · você' : ''}</p></div>`)}
      <textarea class="input" rows="2" maxlength="2000" placeholder="Escreva um comentário" value=${body} onInput=${e => setBody(e.target.value)}></textarea><div><button class="btn sm" onClick=${send}>Comentar</button></div></div></details>`;
}

function Resolver({ run, setRun, cat, onFinish, onQuit }) {
  const q = run.qs[run.i];
  const exam = run.mode === 'simulado';
  const answered = run.res[run.i] !== undefined;
  const [sel, setSel] = useState(run.chosen[run.i] || null);
  const [cut, setCut] = useState(new Set());
  const [hint, setHint] = useState(false);
  const [img, setImg] = useState(null);
  const [fav, setFav] = useState(false);
  const [, tick] = useState(0);
  const tq = useRef(Date.now());
  useEffect(() => { setSel(run.chosen[run.i] || null); setCut(new Set()); setHint(false); setImg(null); tq.current = Date.now(); store.get('favorites', q.id).then(x => setFav(!!x && !x.deleted_at)); if (q.image_path) imageUrl(q.image_path).then(setImg); }, [run.i, q.id]);
  useEffect(() => { const t = setInterval(() => { tick(x => x + 1); if (run.limitMs && Date.now() - run.t0 >= run.limitMs) { clearInterval(t); toast('O tempo acabou! Sem resposta conta como erro.', 4000); onFinish(); } }, 1000); return () => clearInterval(t); }, [run.t0]);
  const elapsed = Date.now() - run.t0;
  const sec = Math.floor((run.limitMs ? Math.max(0, run.limitMs - elapsed) : elapsed) / 1000);
  const clock = `${sec >= 3600 ? Math.floor(sec / 3600) + ':' : ''}${String(Math.floor(sec / 60) % 60).padStart(2, '0')}:${String(sec % 60).padStart(2, '0')}`;
  const spent = () => { const s = Date.now() - tq.current; run.active += Math.min(s, 15 * 60e3); return Math.min(s, 7200000); };

  const pick = id => { if (answered && !exam) return; setSel(id); if (exam) { const chosen = [...run.chosen]; chosen[run.i] = id; spent(); tq.current = Date.now(); setRun({ ...run, chosen }); store.meta.set('sim:' + run.attempt?.id, chosen).catch(() => {}); } };
  const confirm = async () => {
    if (!sel || answered || run.busy) return;
    run.busy = true;
    const ok = q.options.find(o => o.id === sel)?.is_correct === true;
    const res = [...run.res]; res[run.i] = ok; const chosen = [...run.chosen]; chosen[run.i] = sel;
    setRun({ ...run, res, chosen });
    await store.append('answers', { question_id: q.id, option_id: sel, is_correct: ok, time_spent_ms: spent(), used_hint: hint, mode: run.mode === 'revisao' ? 'revisao' : 'pratica', exam_attempt_id: run.attempt?.id || null, answered_at: nowISO() });
    if (!ok && await wrongToFlashcard(q)) toast('Erro guardado como flashcard e no caderno de erros');
    else if (ok) toast(['Boa! +10 XP', 'Acertou! +10 XP', 'Mandou bem! +10 XP'][Math.floor(Math.random() * 3)], 1200);
  };
  const next = () => { if (run.i < run.qs.length - 1) setRun({ ...run, i: run.i + 1 }); else onFinish(); };
  const prev = () => run.i > 0 && setRun({ ...run, i: run.i - 1 });
  useEffect(() => {
    const k = e => {
      if (e.target.closest?.('input, textarea, select')) return;
      const idx = 'abcdef'.indexOf(e.key.toLowerCase());
      if (idx >= 0 && q.options[idx] && !(answered && !exam)) { e.preventDefault(); pick(q.options[idx].id); }
      else if (e.key === 'Enter') { e.preventDefault(); if (exam || answered) next(); else confirm(); }
      else if (e.key === 'ArrowRight' && (exam || answered)) next();
      else if (e.key === 'ArrowLeft' && exam) prev();
    };
    document.addEventListener('keydown', k); return () => document.removeEventListener('keydown', k);
  });
  const toggleFav = async () => { const cur = await store.get('favorites', q.id); if (fav) await store.remove('favorites', q.id); else await store.put('favorites', { ...(cur || {}), id: q.id, deleted_at: null }); setFav(!fav); };
  const s = cat.subject(q.subject_id), tp = cat.topic(q.topic_id), b = cat.board(q.board_id);
  const label = { pratica: 'Prática', simulado: 'Simulado', desafio: 'Desafio do dia', revisao: 'Caderno de erros' }[run.mode] || 'Prática';
  const right = q.options.find(o => o.is_correct);
  const nRespondidas = exam ? run.chosen.filter(Boolean).length : run.res.filter(x => x !== undefined).length;

  return html`<div class="col fade-in" style="gap:14px;max-width:920px;margin:0 auto">
    <div class="card pad row wrap between" style="position:sticky;top:64px;z-index:5;padding:10px 14px">
      <div class="row"><button class="btn ghost sm" onClick=${onQuit}>✕ Sair</button><span class="bold">${run.title || label}</span><span class="chip num">${run.i + 1} / ${run.qs.length}</span></div>
      <div class="row"><span class=${'chip num ' + (run.limitMs && sec < 300 ? 'danger' : 'accent')}>⏱ ${run.limitMs ? 'restam ' : ''}${clock}</span>${exam && html`<button class="btn sm primary" onClick=${onFinish}>Entregar prova (${nRespondidas}/${run.qs.length})</button>`}</div>
      <div style="width:100%"><${Bar} value=${nRespondidas} max=${run.qs.length} /></div>
    </div>
    ${run.qs.length <= 90 && html`<div class="dots" aria-label="Questões">${run.qs.map((_, i) => html`<button class=${[i === run.i ? 'cur' : '', exam ? (run.chosen[i] ? 'ans' : '') : run.res[i] === true ? 'ok' : run.res[i] === false ? 'no' : ''].join(' ')} onClick=${() => (exam || run.res[i] !== undefined || i <= run.res.length) && setRun({ ...run, i })}>${i + 1}</button>`)}</div>`}
    <article class="card pad-lg">
      <div class="row between top"><div class="q-meta"><span class="chip accent">${subjectIcon(s?.name)} ${s?.name || ''}</span>${tp && html`<span class="chip">${tp.name}</span>`}<span class="chip">${DIFFICULTY[q.difficulty]}</span>${b && html`<span class="chip">${b.name}</span>`}</div>
        <button class=${'star' + (fav ? ' on' : '')} aria-pressed=${fav} aria-label="Favoritar" onClick=${toggleFav}>${fav ? '★' : '☆'}</button></div>
      <p class="q-text" id="qText">${q.statement}</p>
      ${q.image_path && (img ? html`<img class="q-img" src=${img} alt=${q.image_alt || 'Imagem da questão'} />` : html`<p class="small muted">${q.image_alt ? 'Imagem: ' + q.image_alt : 'Imagem da questão (aparece com internet).'}</p>`)}
      <div class="q-opts" role="radiogroup">${q.options.map((o, i) => {
        const show = answered && !exam;
        const cls = ['opt', sel === o.id && !show ? 'sel' : '', show && o.is_correct ? 'ok' : '', show && o.id === run.chosen[run.i] && !o.is_correct ? 'no' : '', cut.has(o.id) && !show ? 'cut' : ''].join(' ');
        return html`<div class="row" style="gap:6px;align-items:stretch"><button class=${cls + ' grow'} role="radio" aria-checked=${sel === o.id} disabled=${show} onClick=${() => pick(o.id)}><span class="L">${q.qtype === 'true_false' ? (i ? 'E' : 'C') : LETRAS[i]}</span><span>${o.body}</span></button>
          ${!show && q.options.length > 2 && html`<button class="btn ghost icon" style="height:auto" title="Riscar esta alternativa" aria-label="Riscar alternativa" onClick=${() => { const c = new Set(cut); c.has(o.id) ? c.delete(o.id) : c.add(o.id); setCut(c); }}>✂</button>`}</div>`;
      })}</div>
      ${hint && html`<div class="explain mt">💡 <b>Dica:</b> ${q.hint}</div>`}
      ${answered && !exam && html`<div class="explain mt" id="qExp" aria-live="polite"><b style=${{ color: run.res[run.i] ? 'var(--ok)' : 'var(--danger)' }}>${run.res[run.i] ? '✓ Correto!' : '✗ Resposta incorreta.'}</b>${!run.res[run.i] && right ? html` A certa é a <b>${LETRAS[q.options.indexOf(right)]}</b>.` : ''} ${q.explanation}
        ${auth.isLogged() && html`<div class="mt small"><a href=${'#duvidas/nova/questao/' + q.id}>Ainda com dúvida? Pergunte à professora →</a></div>`}</div>`}
      ${q.source && html`<p class="tiny faint mt">${q.source}</p>`}
    </article>
    <div class="row wrap between">
      <div class="row">${exam && html`<button class="btn" disabled=${!run.i} onClick=${prev}>← Anterior</button>`}${!exam && !answered && q.hint && !hint && html`<button class="btn ghost" onClick=${() => setHint(true)}>💡 Pedir dica</button>`}</div>
      <div class="row"><span class="tiny faint hide-sm">Teclas A–E e Enter</span>
        ${exam ? html`<button class="btn primary" onClick=${next}>${run.i === run.qs.length - 1 ? 'Ver resumo' : 'Próxima →'}</button>`
          : answered ? html`<button class="btn primary" id="nextBtn" onClick=${next}>${run.i === run.qs.length - 1 ? 'Ver resultado' : 'Próxima →'}</button>`
          : html`<button class="btn primary" id="confirmBtn" disabled=${!sel} onClick=${confirm}>Confirmar resposta</button>`}</div>
    </div>
    ${answered && !exam && html`<${Comentarios} q=${q} />`}
  </div>`;
}

function Resultado({ run, cat, onBack }) {
  const n = run.qs.length, ok = run.res.filter(x => x === true).length;
  const secs = Math.floor((run.endAt - run.t0) / 1000);
  const by = {};
  run.qs.forEach((q, i) => { const k = cat.subject(q.subject_id)?.name || 'Outras'; (by[k] ||= [0, 0]); by[k][1]++; if (run.res[i]) by[k][0]++; });
  const weak = Object.entries(by).filter(([, [a, b]]) => a < b).map(([s]) => s);
  const p = Math.round(ok / Math.max(1, n) * 100);
  const [ver, setVer] = useState(false);
  return html`<div class="col fade-in" style="gap:18px;max-width:860px;margin:0 auto">
    <section class="card hero center" style="display:grid;justify-items:center;gap:8px">
      <span class="eyebrow">Resultado · ${run.title || 'Prática'}</span>
      <div class="big-score num">${ok}/${n}</div>
      <p class="num">${p}% de acerto em ${Math.floor(secs / 60)} min ${secs % 60} s</p>
      <div style="font-size:34px">${p >= 90 ? '🏆' : p >= 70 ? '🌟' : p >= 50 ? '💪' : '📚'}</div>
      <p style="max-width:56ch">${p >= 90 ? 'Excelente! Você está voando.' : p >= 70 ? 'Muito bom! Falta pouco para gabaritar.' : p >= 50 ? 'Bom caminho. Revise os erros e tente de novo.' : 'Errar faz parte. Cada erro virou flashcard para você revisar.'}</p>
      ${run.tri && html`<div class="card pad" style="max-width:460px;text-align:left;background:var(--panel2)"><div class="row between"><b>Nota estimada estilo TRI</b><span class="big-score num" style="font-size:36px">${run.tri.nota}</span></div>
        <p class="small muted">Como no ENEM, acertar as fáceis pesa na coerência da nota.${run.tri.coerencia === 'baixa' ? ' Você errou fáceis e acertou difíceis, por isso a nota ficou menor.' : ''} É uma estimativa para treino, não a nota oficial.</p></div>`}
    </section>
    <section class="card pad col"><h3>Por matéria</h3>${Object.entries(by).map(([k, [a, b]]) => html`<div class="hbar"><div class="row between small"><span>${subjectIcon(k)} ${k}</span><span class="num muted">${a}/${b}</span></div><${Bar} value=${a} max=${b} ok=${a === b} /></div>`)}
      ${weak.length > 0 && html`<p class="small mt">Vale reforçar <b>${weak.join(', ')}</b>. Os erros já estão no <a href="#erros">caderno de erros</a> e nos flashcards.</p>`}</section>
    <div class="row wrap" style="justify-content:center">
      ${run.assignment ? html`<button class="btn primary" onClick=${() => go('turmas')}>Voltar para Minhas turmas</button>` : html`<button class="btn primary" onClick=${onBack}>Continuar praticando</button>`}
      <button class="btn" onClick=${() => setVer(!ver)}>${ver ? 'Esconder' : 'Ver'} correção</button>
      ${weak.length > 0 && html`<button class="btn ghost" onClick=${() => go('erros')}>Refazer os erros</button>`}
      <button class="btn ghost" onClick=${() => go('progresso')}>Ver progresso</button></div>
    ${ver && run.qs.map((q, i) => { const ch = q.options.find(o => o.id === run.chosen[i]); const r = q.options.find(o => o.is_correct); return html`<div class="card pad col" style="gap:6px"><div class="row between"><b>Questão ${i + 1}</b><span class=${'chip ' + (run.res[i] ? 'ok' : 'danger')}>${run.res[i] ? 'acertou' : ch ? 'errou' : 'sem resposta'}</span></div>
      <p class="small">${q.statement.slice(0, 260)}${q.statement.length > 260 ? '…' : ''}</p>${ch && !run.res[i] && html`<p class="small" style="color:var(--danger)">Sua resposta: ${ch.body}</p>`}<p class="small" style="color:var(--ok)">Certa: ${r?.body}</p><p class="small muted">${q.explanation}</p></div>`; })}
  </div>`;
}

// ---------------- Tela ----------------
export default function Questoes({ params = [], modo }) {
  const app = useApp();
  const [cat, setCat] = useState(null);
  const [run, setRun] = useState(null);
  const [fim, setFim] = useState(null);
  const [msg, setMsg] = useState('');
  const [initial, setInitial] = useState(null);
  const runRef = useRef(null); runRef.current = run;

  const begin = async ({ mode, qs, title, limitMs = 0, attempt, assignment, chosen, res, extra = {} }) => {
    if (!qs.length) return toast('Nenhuma questão para praticar.');
    const t = Date.now();
    let att = attempt;
    if (!att && (mode === 'simulado' || mode === 'desafio')) att = await store.put('exam_attempts', { title: (title || 'Simulado').slice(0, 120), filters: { ids: qs.map(q => q.id), limitMs, ...extra }, total: qs.length, correct: 0, started_at: nowISO(), finished_at: null, assignment_id: assignment?.assignment_id || null });
    if (att && mode === 'simulado' && !attempt) history.replaceState(null, '', '#questoes/simulado/' + att.id);
    setFim(null);
    setRun({ mode, qs, i: 0, res: res || [], chosen: chosen || [], t0: att ? new Date(att.started_at).getTime() : t, active: 0, attempt: att, title, limitMs, assignment });
    window.scrollTo(0, 0);
  };

  const saveSession = async r => {
    const dur = Math.round(r.active / 1000);
    if (dur >= 30) await store.append('study_sessions', { kind: 'questoes', subject: null, started_at: new Date(r.t0).toISOString(), duration_sec: Math.min(dur, 86400) });
  };

  const finish = async () => {
    const r = runRef.current; if (!r) return;
    let res = r.res;
    if (r.mode === 'simulado') {
      // prova real: grava as respostas só agora, de uma vez
      const ja = new Set((await store.all('answers')).filter(a => a.exam_attempt_id === r.attempt?.id).map(a => a.question_id));
      res = r.qs.map((q, i) => { const o = q.options.find(x => x.id === r.chosen[i]); return o ? o.is_correct === true : false; });
      for (let i = 0; i < r.qs.length; i++) {
        const q = r.qs[i]; if (!r.chosen[i] || ja.has(q.id)) continue;
        await store.append('answers', { question_id: q.id, option_id: r.chosen[i], is_correct: res[i], time_spent_ms: Math.round(r.active / r.qs.length), used_hint: false, mode: 'simulado', exam_attempt_id: r.attempt?.id || null, answered_at: nowISO() });
        if (!res[i]) await wrongToFlashcard(q);
      }
      store.meta.set('sim:' + r.attempt?.id, null).catch(() => {});
    }
    const ok = res.filter(x => x === true).length;
    const tri = (r.mode === 'simulado' || r.mode === 'desafio') && r.qs.length >= 5 ? notaTRI(r.qs.map((q, i) => ({ difficulty: q.difficulty, ok: res[i] === true }))) : null;
    if (r.attempt) { await store.patch('exam_attempts', r.attempt.id, { finished_at: nowISO(), correct: ok, total: r.qs.length }); if (tri) await store.meta.set('tri:' + r.attempt.id, tri.nota); }
    await saveSession(r);
    if (r.mode === 'desafio') toast(`Desafio concluído! +${XP.desafio} XP`, 3000);
    setFim({ ...r, res, endAt: Date.now(), tri });
    setRun(null);
    if (!r.assignment) history.replaceState(null, '', '#questoes');
    window.scrollTo(0, 0);
  };

  const quit = async () => {
    const r = runRef.current;
    if (r?.attempt && (r.mode === 'simulado' ? r.chosen.filter(Boolean).length : r.res.length) < r.qs.length) {
      const ok = await confirmar(app.setModal, { title: 'Sair agora?', text: r.assignment ? 'Você pode continuar depois em Minhas turmas.' : 'Suas respostas ficam guardadas e você pode continuar depois pelo Praticar.', ok: 'Sair' });
      if (!ok) return;
    }
    if (r) await saveSession(r);
    setRun(null);
    if (r?.assignment) return go('turmas');
    if (modo === 'desafio' || r?.mode === 'revisao') return go('praticar');
    history.replaceState(null, '', '#questoes');
  };

  useEffect(() => {
    let ok = true;
    (async () => {
      if (bancoCarregando()) { setMsg('Preparando o banco com milhares de questões neste aparelho. Isso só acontece na primeira vez…'); await bancoCarregando(); }
      let c = await catalog(); if (!ok) return; setCat(c); setMsg('');
      const [p0, p1] = params;
      const resume = async (att, mode, extra = {}) => {
        const qs = (att.filters?.ids || []).map(id => c.question(id)).filter(Boolean); if (!qs.length) return false;
        const answered = (await store.all('answers')).filter(a => a.exam_attempt_id === att.id);
        if (mode === 'simulado') { const chosen = (await store.meta.get('sim:' + att.id, null)) || qs.map(q => answered.find(a => a.question_id === q.id)?.option_id); await begin({ mode, qs, attempt: att, title: att.title, limitMs: att.filters?.limitMs || extra.limitMs || 0, chosen, ...extra }); }
        else { const res = qs.map(q => { const a = answered.find(x => x.question_id === q.id); return a ? a.is_correct : undefined; }); const chosen = qs.map(q => answered.find(x => x.question_id === q.id)?.option_id); const first = res.findIndex(x => x === undefined); await begin({ mode, qs, attempt: att, title: att.title, res, chosen, ...extra }); setRun(r => r && { ...r, i: first < 0 ? qs.length - 1 : first }); }
        return true;
      };
      if (modo === 'desafio') {
        const hoje = dayKey();
        const atts = await store.all('exam_attempts');
        const feito = atts.find(a => a.filters?.desafio === hoje && a.finished_at);
        const aberto = atts.find(a => a.filters?.desafio === hoje && !a.finished_at);
        if (feito) { setMsg('feito'); return; }
        if (aberto && await resume(aberto, 'desafio')) return;
        const qs = dailyQuestions(c.bank, auth.state.profile?.study_profile || 'enem');
        await begin({ mode: 'desafio', qs, title: 'Desafio do dia · ' + new Date().toLocaleDateString('pt-BR'), extra: { desafio: hoje } });
      } else if (p0 === 'simulado' && p1) {
        const att = await store.get('exam_attempts', p1);
        if (!(att && !att.finished_at && await resume(att, 'simulado'))) history.replaceState(null, '', '#questoes');
      } else if (p0 === 'novo-simulado') {
        const cfg = JSON.parse(sessionStorage.getItem('em:novoSimulado') || 'null'); sessionStorage.removeItem('em:novoSimulado');
        if (cfg) await begin({ mode: 'simulado', qs: cfg.ids.map(id => c.question(id)).filter(Boolean), title: cfg.title, limitMs: cfg.min * 60e3 });
        else history.replaceState(null, '', '#questoes');
      } else if (p0 === 'materia' && p1) setInitial({ ...EMPTY, subject: p1 });
      else if (p0 === 'conteudo' && p1) { const t = c.topic(+p1); setInitial({ ...EMPTY, subject: t ? String(t.subject_id) : '', topic: p1 }); }
      else if (p0 === 'codigos' && p1) { const qs = p1.split(',').map(x => c.questions.find(q => q.code === x.trim().toUpperCase())).filter(Boolean); if (qs.length) await begin({ mode: 'pratica', qs }); }
      else if (p0 === 'revisar') {
        const erros = wrongNow(await store.all('answers'));
        const only = p1 ? erros.filter(a => String(c.question(a.question_id)?.subject_id) === p1) : erros;
        const qs = only.map(a => c.question(a.question_id)).filter(Boolean).sort(() => Math.random() - 0.5).slice(0, 30);
        if (qs.length) await begin({ mode: 'revisao', qs, title: 'Caderno de erros' }); else { toast('Nenhum erro para refazer. 🎉'); go('erros'); }
      } else if (p0 === 'lista' && p1) {
        const asg = (await store.meta.get('turmas:cache', { assignments: [] })).assignments.find(a => a.assignment_id === p1);
        if (!asg) { setMsg('Esta lista não está disponível neste aparelho. Abra Minhas turmas com internet para baixá-la.'); return; }
        let ids = await store.meta.get('list:' + asg.list_id, null);
        if (!ids && navigator.onLine) { try { await (await import('../../views/turmas.js')).cacheLists([asg]); c = await catalog(); setCat(c); ids = await store.meta.get('list:' + asg.list_id, null); } catch (e) { setMsg(friendlyError(e)); return; } }
        if (!ids?.length) { setMsg('As questões desta lista ainda não foram baixadas. Abra Minhas turmas com internet.'); return; }
        const mode = asg.mode === 'simulado' ? 'simulado' : 'pratica';
        const extra = { assignment: asg, limitMs: asg.time_limit_min ? asg.time_limit_min * 60e3 : 0 };
        const open = (await store.all('exam_attempts')).find(x => x.assignment_id === asg.assignment_id && !x.finished_at);
        if (!(open && await resume(open, mode, extra))) {
          const qs = ids.map(id => c.question(id)).filter(Boolean);
          const att = await store.put('exam_attempts', { title: asg.title.slice(0, 120), filters: { ids: qs.map(q => q.id), lista: asg.list_id, limitMs: extra.limitMs }, total: qs.length, correct: 0, started_at: nowISO(), finished_at: null, assignment_id: asg.assignment_id });
          await begin({ mode, qs, attempt: att, title: asg.title, ...extra });
        }
      }
    })().catch(e => { console.error(e); setMsg(friendlyError(e)); });
    return () => { ok = false; const r = runRef.current; if (r) saveSession(r); };
  }, []);

  if (msg === 'feito') return html`<div class="card hero center fade-in" style="max-width:700px;margin:0 auto;display:grid;justify-items:center;gap:10px"><div style="font-size:56px">🏆</div><h1>Desafio de hoje concluído!</h1><p>Volte amanhã para um desafio novo. Enquanto isso, que tal refazer os erros ou fazer um simulado?</p><div class="row wrap" style="justify-content:center"><button class="btn primary" onClick=${() => go('erros')}>Caderno de erros</button><button class="btn" onClick=${() => go('questoes')}>Banco de questões</button></div></div>`;
  if (msg) return html`<div class="card pad">${msg.includes('Preparando') ? html`<${Loading} text=${msg} />` : html`<${Empty} icon="📋" title="Lista">${msg}</${Empty}><div class="center"><button class="btn" onClick=${() => go('turmas')}>Minhas turmas</button></div>`}</div>`;
  if (!cat) return html`<${Loading} />`;
  if (fim) return html`<${Resultado} run=${fim} cat=${cat} onBack=${() => { setFim(null); if (modo === 'desafio') go('praticar'); }} />`;
  if (run) return html`<${Resolver} key=${run.attempt?.id || run.t0} run=${run} setRun=${setRun} cat=${cat} onFinish=${finish} onQuit=${quit} />`;
  if (modo === 'desafio') return html`<${Loading} text="Preparando o desafio do dia…" />`;
  return html`<${Banco} cat=${cat} initial=${initial} key=${JSON.stringify(initial)} start=${begin} />`;
}
