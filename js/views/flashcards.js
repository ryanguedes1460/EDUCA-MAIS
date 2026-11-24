// Flashcards: coleções, cartões (criar, editar, excluir, favoritar, mover),
// revisão espaçada e evolução. Evolui o módulo de flashcards da v0.2 (sem duplicar).
import { html, raw, setHTML, $, actions, toast, formDialog, confirmDialog, norm, plural, nowISO, dayKey } from '../core/util.js';
import * as store from '../core/store.js';
import { on } from '../core/bus.js';
import { catalog } from '../core/conteudo.js';
import { schedule, isDue, describeInterval, RATINGS, stage, fmtDays } from '../lib/srs.js';
import { columns } from '../lib/graficos.js';
import { lastDays } from '../lib/stats.js';

let deckSel = 'all';  // 'all', 'fav' ou id da coleção
let tab = 'revisar';
let subjectFilter = '';

export default {
  title: 'Flashcards',
  async render(el) {
    const cat = await catalog();
    let queue = [], flipped = false, sessionStart = Date.now(), reviewed = 0, cram = false;

    const load = async () => {
      const [decks, cards, reviews] = await Promise.all([store.all('decks'), store.all('flashcards'), store.all('flashcard_reviews')]);
      decks.sort((a, b) => (b.kind === 'errors') - (a.kind === 'errors') || (b.is_favorite - a.is_favorite) || a.name.localeCompare(b.name));
      if (deckSel !== 'all' && deckSel !== 'fav' && !decks.some(d => d.id === deckSel)) deckSel = 'all';
      return { decks, cards, reviews };
    };
    const inSel = c => (deckSel === 'all' || (deckSel === 'fav' ? c.is_favorite : c.deck_id === deckSel)) && (!subjectFilter || c.subject_id === +subjectFilter);
    const buildQueue = (cards, all = false) => { cram = all; queue = cards.filter(c => inSel(c) && (all || isDue(c))).sort((a, b) => new Date(a.due_at) - new Date(b.due_at)); flipped = false; };

    async function draw() {
      const { decks, cards, reviews } = await load();
      if (!queue.length || queue.some(q => !cards.find(c => c.id === q.id))) buildQueue(cards, cram);
      const selName = deckSel === 'all' ? 'Todos os cartões' : deckSel === 'fav' ? 'Favoritos' : decks.find(d => d.id === deckSel)?.name;
      const selDeck = decks.find(d => d.id === deckSel);
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Memorização</span><h1>Flashcards</h1>
          <p>Revisão espaçada: cada cartão volta logo antes de você esquecer. Avalie com sinceridade; o intervalo se ajusta ao seu desempenho.</p></div>
          <div class="row"><button class="btn" type="button" data-action="newCard">Novo cartão</button><button class="btn ghost" type="button" data-action="newDeck">Nova coleção</button></div></div>
        <div class="split">
          <div class="card stack sticky">
            <h3>Coleções</h3>
            <div class="stack" style="gap:6px">
              ${[['all', 'Todos os cartões', cards], ['fav', '★ Favoritos', cards.filter(c => c.is_favorite)], ...decks.map(d => [d.id, (d.is_favorite ? '★ ' : '') + d.name, cards.filter(c => c.deck_id === d.id)])].map(([id, name, list]) => {
                const due = list.filter(c => isDue(c)).length;
                return html`<button class="item-btn" type="button" data-action="deck" data-id="${id}" aria-pressed="${deckSel === id}"><span style="min-width:0"><b>${name}</b><span class="muted small">${plural(list.length, 'cartão', 'cartões')}</span></span><span class="chip num ${due ? 'on' : ''}">${due ? due + ' hoje' : 'em dia'}</span></button>`;
              })}
            </div>
            <label class="f">Filtrar por disciplina<select class="input" data-onchange="subject"><option value="">Todas</option>${cat.subjects.map(s => html`<option value="${s.id}" ${String(subjectFilter) === String(s.id) ? 'selected' : ''}>${s.name}</option>`)}</select></label>
          </div>
          <div class="stack" style="min-width:0">
            <div class="row between"><h2>${selName}</h2>
              ${selDeck ? html`<div class="row"><button class="btn ghost sm" type="button" data-action="favDeck">${selDeck.is_favorite ? 'Desfavoritar' : 'Favoritar'} coleção</button>${selDeck.kind !== 'errors' ? html`<button class="btn ghost sm" type="button" data-action="renameDeck">Renomear</button>` : ''}<button class="btn ghost sm" type="button" data-action="delDeck">Excluir</button></div>` : ''}</div>
            <div class="tabs" role="tablist">${[['revisar', 'Revisar'], ['cartoes', 'Cartões'], ['evolucao', 'Evolução']].map(([k, n]) => html`<button type="button" role="tab" aria-selected="${tab === k}" data-action="tab" data-t="${k}">${n}</button>`)}</div>
            <div id="fcBody"></div>
          </div>
        </div></div>`);
      const body = $('#fcBody', el);
      if (tab === 'revisar') drawReview(body, cards);
      else if (tab === 'cartoes') drawList(body, cards, decks);
      else drawEvolution(body, cards, reviews);
    }

    function drawReview(body, cards) {
      const c = queue[0];
      const total = reviewed + queue.length;
      if (!c) {
        const list = cards.filter(inSel);
        const next = list.length ? list.reduce((m, x) => Math.min(m, new Date(x.due_at).getTime()), Infinity) : 0;
        setHTML(body, html`<div class="card stack" style="text-align:center;justify-items:center;padding:28px">
          ${list.length ? html`<h2>Tudo em dia! 🎉</h2><p class="muted">${reviewed ? `Você revisou ${plural(reviewed, 'cartão', 'cartões')} agora. ` : ''}Próxima revisão ${next > Date.now() ? 'em ' + fmtDays((next - Date.now()) / 864e5) : 'agora'}.</p>
            <button class="btn ghost" type="button" data-action="cram">Revisar mesmo assim</button>`
          : html`<h2>Nenhum cartão aqui ainda</h2><p class="muted">Crie cartões ou resolva questões: os erros viram cartões automaticamente.</p><button class="btn" type="button" data-action="newCard">Criar cartão</button>`}</div>`);
        return;
      }
      setHTML(body, html`<div class="stack">
        <div class="row between small"><span class="muted">${reviewed} de ${total} ${cram ? 'na revisão extra' : 'para hoje'}</span><span class="muted">${cat.subject(c.subject_id)?.name || ''}</span></div>
        <div class="bar"><i style="width:${total ? Math.round(reviewed / total * 100) : 0}%"></i></div>
        <div class="flip ${flipped ? 'on' : ''}" id="flip" tabindex="0" role="button" aria-label="Virar cartão" data-action="flip">
          <div class="flip-in"><div class="face front"><small>Pergunta</small><span>${c.front}</span></div><div class="face back"><small>Resposta</small><span>${c.back}</span></div></div>
        </div>
        <div class="rate" ${flipped ? '' : 'hidden'} id="rate">${RATINGS.map((r, i) => html`<button class="btn r${i}" type="button" data-action="rate" data-r="${i}">${r}<small>${describeInterval(c, i)}</small></button>`)}</div>
        ${flipped ? '' : html`<button class="btn" type="button" data-action="flip">Mostrar resposta</button>`}
        <p class="muted small hide-mobile">Atalhos: espaço vira o cartão; 1, 2, 3 e 4 avaliam.</p></div>`);
    }

    function drawList(body, cards, decks) {
      let q = body.dataset.q || '';
      const render = () => {
        const list = cards.filter(inSel).filter(c => !q || norm(c.front + ' ' + c.back).includes(norm(q))).sort((a, b) => (b.updated_at || '').localeCompare(a.updated_at || ''));
        setHTML(body, html`<div class="stack">
          <input class="input" type="search" placeholder="Buscar nos cartões" value="${q}" data-oninput="cardSearch" aria-label="Buscar nos cartões">
          ${list.length ? html`<div class="stack">${list.slice(0, 200).map(c => html`<div class="card row between" style="align-items:flex-start;flex-wrap:nowrap;padding:12px">
            <div style="min-width:0;flex:1"><b class="pre">${c.front}</b><p class="muted small pre" style="margin-top:4px">${c.back.length > 160 ? c.back.slice(0, 160) + '…' : c.back}</p>
              <div class="q-meta" style="margin-top:6px"><span class="chip">${decks.find(d => d.id === c.deck_id)?.name || ''}</span><span class="chip">${{ novo: 'Novo', aprendendo: 'Aprendendo', dominado: 'Dominado' }[stage(c)]}</span>${c.lapses ? html`<span class="chip bad">${plural(c.lapses, 'erro', 'erros')}</span>` : ''}<span class="chip">Próxima: ${isDue(c) ? 'hoje' : new Date(c.due_at).toLocaleDateString('pt-BR')}</span></div></div>
            <div class="row" style="flex-wrap:nowrap;gap:2px"><button class="star" type="button" data-action="favCard" data-id="${c.id}" aria-pressed="${!!c.is_favorite}" aria-label="Favoritar cartão">${c.is_favorite ? '★' : '☆'}</button>
              <button class="btn ghost sm" type="button" data-action="editCard" data-id="${c.id}">Editar</button><button class="btn ghost sm" type="button" data-action="delCard" data-id="${c.id}" aria-label="Excluir cartão">Excluir</button></div></div>`)}</div>
            ${list.length > 200 ? html`<p class="muted small">Mostrando 200 de ${list.length}. Use a busca.</p>` : ''}` : html`<div class="empty">Nenhum cartão encontrado.</div>`}</div>`);
        const i = body.querySelector('[data-oninput]'); i.oninput = () => { q = i.value; body.dataset.q = q; const pos = i.selectionStart; render(); const j = body.querySelector('[data-oninput]'); j.focus(); j.setSelectionRange(pos, pos); };
      };
      render();
    }

    function drawEvolution(body, cards, reviews) {
      const list = cards.filter(inSel);
      const ids = new Set(list.map(c => c.id));
      const rv = reviews.filter(r => ids.has(r.card_id));
      const st = { novo: 0, aprendendo: 0, dominado: 0 }; list.forEach(c => st[stage(c)]++);
      const days = lastDays(14);
      const perDay = Object.fromEntries(days.map(d => [d, 0])); rv.forEach(r => { const k = dayKey(r.reviewed_at); if (k in perDay) perDay[k]++; });
      const hard = list.filter(c => c.lapses).sort((a, b) => b.lapses - a.lapses).slice(0, 8);
      const okRate = rv.length ? Math.round(rv.filter(r => r.rating >= 2).length / rv.length * 100) : 0;
      setHTML(body, html`<div class="stack">
        <div class="grid g4">${[[st.novo, 'novos'], [st.aprendendo, 'aprendendo'], [st.dominado, 'dominados (21+ dias)'], [rv.length ? okRate + '%' : '–', 'lembrou (Bom ou Fácil)']].map(([v, k]) => html`<div class="card stat"><div class="v num">${v}</div><div class="k">${k}</div></div>`)}</div>
        <div class="card"><h3>Revisões nos últimos 14 dias</h3>${columns(days.map(d => ({ label: d.slice(8), value: perDay[d] })), { title: 'Revisões por dia' })}</div>
        <div class="card"><h3>Cartões com mais dificuldade</h3>${hard.length ? html`<div class="list">${hard.map(c => html`<div class="row between"><span>${c.front.slice(0, 90)}</span><span class="chip bad">${plural(c.lapses, 'erro', 'erros')}</span></div>`)}</div>` : html`<p class="muted small">Nenhum erro registrado até agora.</p>`}</div></div>`);
    }

    async function cardForm(card) {
      const { decks } = await load();
      let target = card?.deck_id || (deckSel !== 'all' && deckSel !== 'fav' ? deckSel : decks.find(d => d.kind !== 'errors')?.id);
      if (!decks.length) { const d = await store.put('decks', { name: 'Meus cartões', kind: 'user', subject_id: null, color: null, is_favorite: false }); decks.push(d); target = d.id; }
      const fd = await formDialog(card ? 'Editar cartão' : 'Novo cartão', html`
        <label class="f">Pergunta (frente)<textarea class="input" name="front" rows="2" required maxlength="1000">${card?.front || ''}</textarea></label>
        <label class="f">Resposta (verso)<textarea class="input" name="back" rows="3" required maxlength="3000">${card?.back || ''}</textarea></label>
        <div class="form-grid"><label class="f">Coleção<select class="input" name="deck">${decks.map(d => html`<option value="${d.id}" ${d.id === target ? 'selected' : ''}>${d.name}</option>`)}</select></label>
        <label class="f">Disciplina<select class="input" name="subject"><option value="">Nenhuma</option>${cat.subjects.map(s => html`<option value="${s.id}" ${card?.subject_id === s.id ? 'selected' : ''}>${s.name}</option>`)}</select></label></div>`,
        { validate: f => (!String(f.get('front')).trim() || !String(f.get('back')).trim()) ? 'Preencha a pergunta e a resposta.' : null });
      if (!fd) return;
      const data = { front: String(fd.get('front')).trim(), back: String(fd.get('back')).trim(), deck_id: fd.get('deck'), subject_id: fd.get('subject') ? +fd.get('subject') : null };
      if (card) { await store.patch('flashcards', card.id, data); toast('Cartão atualizado'); }
      else { await store.put('flashcards', { ...data, is_favorite: false, source_question_id: null, ease: 2.5, interval_days: 0, repetitions: 0, lapses: 0, due_at: nowISO(), last_reviewed_at: null }); toast('Cartão criado'); }
      queue = []; draw();
    }

    async function rate(r) {
      const c = queue[0]; if (!c || !flipped) return;
      const before = c.interval_days || 0;
      const next = schedule(c, r);
      await store.patch('flashcards', c.id, next);
      await store.append('flashcard_reviews', { card_id: c.id, rating: r, interval_before: before, interval_after: next.interval_days, reviewed_at: nowISO() });
      queue.shift();
      if (r === 0) queue.splice(Math.min(3, queue.length), 0, { ...c, ...next }); else reviewed++;
      flipped = false; draw();
    }

    actions(el, {
      deck(b) { deckSel = b.dataset.id; queue = []; reviewed = 0; draw(); },
      tab(b) { tab = b.dataset.t; draw(); },
      flip() { if (queue[0]) { flipped = !flipped; draw(); } },
      rate(b) { rate(+b.dataset.r); },
      async cram() { const { cards } = await load(); buildQueue(cards, true); reviewed = 0; draw(); },
      newCard() { cardForm(null); },
      async editCard(b) { cardForm(await store.get('flashcards', b.dataset.id)); },
      async delCard(b) { if (await confirmDialog('Excluir este cartão?', { ok: 'Excluir', danger: true })) { await store.remove('flashcards', b.dataset.id); queue = []; toast('Cartão excluído'); draw(); } },
      async favCard(b) { const c = await store.get('flashcards', b.dataset.id); await store.patch('flashcards', c.id, { is_favorite: !c.is_favorite }); draw(); },
      async newDeck() {
        const fd = await formDialog('Nova coleção', html`<label class="f">Nome<input class="input" name="name" required maxlength="60"></label><label class="f">Disciplina (opcional)<select class="input" name="subject"><option value="">Nenhuma</option>${cat.subjects.map(s => html`<option value="${s.id}">${s.name}</option>`)}</select></label>`, { ok: 'Criar', validate: f => String(f.get('name')).trim() ? null : 'Dê um nome à coleção.' });
        if (!fd) return;
        const d = await store.put('decks', { name: String(fd.get('name')).trim(), subject_id: fd.get('subject') ? +fd.get('subject') : null, kind: 'user', color: null, is_favorite: false });
        deckSel = d.id; queue = []; toast('Coleção criada'); draw();
      },
      async renameDeck() {
        const d = await store.get('decks', deckSel);
        const fd = await formDialog('Renomear coleção', html`<label class="f">Nome<input class="input" name="name" required maxlength="60" value="${d.name}"></label>`, { validate: f => String(f.get('name')).trim() ? null : 'Dê um nome.' });
        if (fd) { await store.patch('decks', d.id, { name: String(fd.get('name')).trim() }); draw(); }
      },
      async favDeck() { const d = await store.get('decks', deckSel); await store.patch('decks', d.id, { is_favorite: !d.is_favorite }); draw(); },
      async delDeck() {
        const d = await store.get('decks', deckSel); const cards = (await store.all('flashcards')).filter(c => c.deck_id === d.id);
        if (!(await confirmDialog(`Excluir a coleção "${d.name}" e ${plural(cards.length, 'cartão', 'cartões')}?`, { ok: 'Excluir tudo', danger: true }))) return;
        for (const c of cards) await store.remove('flashcards', c.id);
        await store.remove('decks', d.id); deckSel = 'all'; queue = []; toast('Coleção excluída'); draw();
      }
    });
    el.addEventListener('change', e => { if (e.target.dataset.onchange === 'subject') { subjectFilter = e.target.value; queue = []; draw(); } });
    const key = e => {
      if (tab !== 'revisar' || /INPUT|TEXTAREA|SELECT/.test(e.target.tagName) || document.querySelector('dialog[open]')) return;
      if (e.code === 'Space') { e.preventDefault(); if (queue[0]) { flipped = !flipped; draw(); } }
      if (['1', '2', '3', '4'].includes(e.key) && flipped) rate(+e.key - 1);
    };
    document.addEventListener('keydown', key);
    const off = on('store:change', ({ source }) => { if (source === 'remote') { queue = []; draw(); } });
    await draw();
    return () => {
      document.removeEventListener('keydown', key); off();
      const secs = Math.round((Date.now() - sessionStart) / 1000);
      if (reviewed > 0 && secs >= 30) store.append('study_sessions', { kind: 'revisao', subject: null, started_at: new Date(sessionStart).toISOString(), duration_sec: Math.min(secs, reviewed * 120, 86400) });
    };
  }
};
