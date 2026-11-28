// Flashcards: coleções em cartões, revisão espaçada com virada 3D, criação manual e automática por tema.
import { html, useState, useEffect, useRef, useApp, useData, go, PageHead, Modal, Field, Select, Bar, Empty, Stat, toast, confirmar, subjectIcon, subjectColor, cover } from '../ui.js';
import * as store from '../../core/store.js';
import { catalog } from '../../core/conteudo.js';
import { schedule, isDue, describeInterval, stage, RATINGS } from '../../lib/srs.js';
import { nowISO, norm, plainText } from '../../core/util.js';

const novo = () => ({ is_favorite: false, ease: 2.5, interval_days: 0, repetitions: 0, lapses: 0, due_at: nowISO(), last_reviewed_at: null });

function CardForm({ cat, decks, card, deckId, onClose }) {
  const [front, setFront] = useState(card?.front || '');
  const [back, setBack] = useState(card?.back || '');
  const [deck, setDeck] = useState(card?.deck_id || deckId || decks.find(d => d.kind !== 'errors')?.id || '');
  const [subject, setSubject] = useState(card?.subject_id ? String(card.subject_id) : '');
  const save = async (again) => {
    if (!front.trim() || !back.trim()) return toast('Preencha a frente e o verso.');
    let d = deck;
    if (!d) d = (await store.put('decks', { name: 'Meus cartões', kind: 'user', subject_id: null, color: null, is_favorite: false })).id;
    const data = { front: front.trim().slice(0, 1000), back: back.trim().slice(0, 3000), deck_id: d, subject_id: subject ? +subject : null };
    if (card) await store.patch('flashcards', card.id, data); else await store.put('flashcards', { ...data, source_question_id: null, ...novo() });
    toast(card ? 'Cartão atualizado' : 'Cartão criado');
    if (again) { setFront(''); setBack(''); } else onClose();
  };
  return html`<${Modal} title=${card ? 'Editar cartão' : 'Novo cartão'} icon="🃏" onClose=${onClose} foot=${html`${!card && html`<button class="btn" onClick=${() => save(true)}>Salvar e criar outro</button>`}<button class="btn primary" onClick=${() => save(false)}>Salvar</button>`}>
    <${Field} label="Frente (pergunta)"><textarea class="input" rows="3" maxlength="1000" value=${front} onInput=${e => setFront(e.target.value)}></textarea></${Field}>
    <${Field} label="Verso (resposta)"><textarea class="input" rows="4" maxlength="3000" value=${back} onInput=${e => setBack(e.target.value)}></textarea></${Field}>
    <div class="grid g2"><${Field} label="Coleção"><${Select} value=${deck} onChange=${setDeck} all=${decks.length ? null : 'Meus cartões (nova)'} options=${decks.map(d => [d.id, d.name])} /></${Field}>
      <${Field} label="Matéria"><${Select} value=${subject} onChange=${setSubject} all="Nenhuma" options=${cat.subjects.map(s => [s.id, s.name])} /></${Field}></div>
  </${Modal}>`;
}

function TemaForm({ cat, onClose }) {
  const [tema, setTema] = useState('');
  const [n, setN] = useState('20');
  const criar = async () => {
    const palavras = norm(tema).split(/\s+/).filter(w => w.length > 2);
    if (!palavras.length) return toast('Escreva o tema.');
    const texto = q => norm([q.theme, cat.topic(q.topic_id)?.name, cat.subject(q.subject_id)?.name, q.statement, q.explanation].join(' '));
    let achadas = cat.bank.filter(q => { const t = texto(q); return palavras.every(w => t.includes(w)); });
    if (!achadas.length) achadas = cat.bank.filter(q => { const t = texto(q); return palavras.some(w => t.includes(w)); });
    if (!achadas.length) return toast('Não encontrei esse tema no banco. Tente outra palavra (ex.: "Newton", "juros").', 3500);
    const esc = achadas.sort(() => Math.random() - 0.5).slice(0, +n);
    const deck = await store.put('decks', { name: ('Tema: ' + tema.trim()).slice(0, 60), subject_id: esc[0].subject_id, kind: 'user', color: null, is_favorite: false });
    for (const q of esc) { const r = q.options.find(o => o.is_correct); await store.put('flashcards', { deck_id: deck.id, front: plainText(q.statement).slice(0, 1000), back: `${r ? plainText(r.body) + '\n\n' : ''}${q.explanation}`.slice(0, 3000), subject_id: q.subject_id, source_question_id: null, ...novo() }); }
    toast(`${esc.length} cartões criados em "${deck.name}"`, 3000); onClose(deck.id);
  };
  return html`<${Modal} title="Criar cartões de um tema" icon="✨" onClose=${() => onClose()} foot=${html`<button class="btn primary" onClick=${criar}>Criar cartões</button>`}>
    <p class="small muted">Escreva o assunto. A plataforma procura no banco de questões e monta uma coleção com a pergunta na frente e a resposta explicada no verso.</p>
    <${Field} label="Tema ou assunto"><input class="input" maxlength="80" placeholder="Ex.: Leis de Newton, porcentagem, crase, Era Vargas" value=${tema} onInput=${e => setTema(e.target.value)} onKeyDown=${e => e.key === 'Enter' && criar()} /></${Field}>
    <${Field} label="Quantos cartões"><${Select} value=${n} onChange=${setN} all=${null} options=${[[10, '10'], [20, '20'], [30, '30']]} /></${Field}>
  </${Modal}>`;
}

function Revisao({ cards, title, onDone }) {
  const [queue, setQueue] = useState(() => cards.slice().sort((a, b) => (a.due_at || '').localeCompare(b.due_at || '')));
  const [flip, setFlip] = useState(false);
  const [done, setDone] = useState(0);
  const t0 = useRef(Date.now());
  const c = queue[0];
  const rate = async r => {
    if (!c || !flip) return;
    const next = schedule(c, r);
    await store.patch('flashcards', c.id, next);
    await store.append('flashcard_reviews', { card_id: c.id, rating: r, interval_before: c.interval_days || 0, interval_after: next.interval_days, reviewed_at: nowISO() });
    const q = queue.slice(1);
    if (r === 0) q.splice(Math.min(3, q.length), 0, { ...c, ...next });
    setQueue(q); setFlip(false); if (r > 0) setDone(x => x + 1);
  };
  useEffect(() => {
    const k = e => { if (/INPUT|TEXTAREA|SELECT/.test(e.target.tagName)) return; if (e.code === 'Space') { e.preventDefault(); setFlip(f => !f); } if (flip && ['1', '2', '3', '4'].includes(e.key)) rate(+e.key - 1); };
    document.addEventListener('keydown', k); return () => document.removeEventListener('keydown', k);
  });
  useEffect(() => () => { const secs = Math.round((Date.now() - t0.current) / 1000); if (secs >= 30) store.append('study_sessions', { kind: 'revisao', subject: null, started_at: new Date(t0.current).toISOString(), duration_sec: Math.min(secs, 86400) }); }, []);
  const total = done + queue.length;
  if (!c) return html`<div class="card hero center fade-in" style="max-width:640px;margin:0 auto;display:grid;justify-items:center;gap:10px"><div style="font-size:56px">🎉</div><h1>Revisão concluída!</h1><p>${done} ${done === 1 ? 'cartão revisado' : 'cartões revisados'}. Eles voltam na hora certa para você não esquecer.</p><button class="btn primary" onClick=${onDone}>Voltar às coleções</button></div>`;
  return html`<div class="col fade-in" style="gap:16px;max-width:760px;margin:0 auto">
    <div class="row between"><button class="btn ghost sm" onClick=${onDone}>✕ Sair</button><b>${title}</b><span class="chip num">${done}/${total}</span></div>
    <${Bar} value=${done} max=${total} />
    <div class=${'flip' + (flip ? ' on' : '')} onClick=${() => setFlip(!flip)} role="button" tabindex="0" aria-label="Virar cartão">
      <div class="flip-in"><div class="card face"><small>Pergunta</small><div>${c.front}</div><span class="tiny faint">Toque ou aperte espaço para virar</span></div><div class="card face back"><small>Resposta</small><div>${c.back}</div></div></div></div>
    ${flip ? html`<div class="rate">${RATINGS.map((r, i) => html`<button class=${'btn r' + i} onClick=${() => rate(i)}>${r}<small>${describeInterval(c, i)}</small></button>`)}</div>`
      : html`<button class="btn primary lg" onClick=${() => setFlip(true)}>Mostrar resposta</button>`}
    <p class="tiny faint center">Atalhos: espaço vira, 1 a 4 avaliam.</p>
  </div>`;
}

export default function Flashcards({ params = [] }) {
  const app = useApp();
  const [rev, setRev] = useState(null);
  const [sel, setSel] = useState(params[0] === 'materia' ? 'm:' + params[1] : 'all');
  const [d] = useData(async () => { const [cat, decks, cards] = await Promise.all([catalog(), store.all('decks'), store.all('flashcards')]); return { cat, decks, cards }; }, [], ['decks', 'flashcards']);
  useEffect(() => { if (params[0] === 'revisar' && d && !rev) { const due = d.cards.filter(c => isDue(c)); if (due.length) setRev({ cards: due, title: 'Revisão de hoje' }); } }, [d]);
  if (!d) return html`<div class="skeleton" style="height:200px"></div>`;
  if (rev) return html`<${Revisao} cards=${rev.cards} title=${rev.title} onDone=${() => { setRev(null); history.replaceState(null, '', '#flashcards'); }} />`;
  const { cat, decks, cards } = d;
  const due = cards.filter(c => isDue(c));
  const st = { novo: 0, aprendendo: 0, dominado: 0 }; cards.forEach(c => st[stage(c)]++);
  const inSel = c => sel === 'all' || (sel.startsWith('m:') ? String(c.subject_id) === sel.slice(2) : c.deck_id === sel);
  const lista = cards.filter(inSel);
  const deck = decks.find(x => x.id === sel);
  const modal = m => app.setModal(m);
  const close = () => app.setModal(null);
  const deckCard = (dk) => {
    const cs = cards.filter(c => c.deck_id === dk.id), du = cs.filter(c => isDue(c)).length, s = cat.subject(dk.subject_id);
    const color = dk.kind === 'errors' ? '#dc2626' : subjectColor(s);
    return html`<button class="card tcard" key=${dk.id} onClick=${() => setSel(dk.id)} style=${sel === dk.id ? { borderColor: 'var(--accent)' } : null}>
      <div class="tcover" style=${{ background: cover(color), height: '80px' }}><span class="emo" style="font-size:40px">${dk.kind === 'errors' ? '🩹' : subjectIcon(s?.name || dk.name)}</span><div class="chips"><span class="chip">${cs.length} cartões</span>${du > 0 && html`<span class="chip">⏰ ${du} hoje</span>`}</div></div>
      <div class="tbody"><h3 style="font-size:16px">${dk.name}</h3><${Bar} value=${cs.filter(c => stage(c) === 'dominado').length} max=${cs.length || 1} /><span class="tiny muted">${cs.filter(c => stage(c) === 'dominado').length} dominados</span></div></button>`;
  };
  return html`<div class="col fade-in" style="gap:20px">
    <${PageHead} eyebrow="Revisão espaçada" title="Flashcards" actions=${html`<button class="btn" onClick=${() => modal(html`<${TemaForm} cat=${cat} onClose=${id => { close(); if (id) setSel(id); }} />`)}>✨ Criar de um tema</button><button class="btn" onClick=${() => modal(html`<${CardForm} cat=${cat} decks=${decks} deckId=${deck?.id} onClose=${close} />`)}>+ Cartão</button>
      <button class="btn primary" disabled=${!due.length} onClick=${() => setRev({ cards: due, title: 'Revisão de hoje' })}>▶ Revisar ${due.length}</button>`}>O cartão volta logo antes de você esquecer. Questões erradas viram cartões sozinhas.</${PageHead}>
    <div class="stats"><${Stat} icon="⏰" v=${due.length} k="para revisar hoje" /><${Stat} icon="🌱" v=${st.novo} k="novos" /><${Stat} icon="🔁" v=${st.aprendendo} k="aprendendo" /><${Stat} icon="🏆" v=${st.dominado} k="dominados (21+ dias)" /></div>
    ${!cards.length ? html`<div class="card"><${Empty} icon="🃏" title="Nenhum cartão ainda" action=${html`<button class="btn primary" onClick=${() => modal(html`<${TemaForm} cat=${cat} onClose=${id => { close(); if (id) setSel(id); }} />`)}>✨ Criar cartões de um tema</button>`}>Crie cartões de um tema em 1 clique, escreva os seus ou erre uma questão (ela vira cartão).</${Empty}></div>` : html`
    <section><div class="row between mb"><h2>Coleções</h2><button class=${'chip' + (sel === 'all' ? ' on' : '')} onClick=${() => setSel('all')}>Todas</button></div>
      <div class="grid tables-grid">${decks.slice().sort((a, b) => (b.kind === 'errors') - (a.kind === 'errors') || b.is_favorite - a.is_favorite).map(deckCard)}</div></section>
    <section class="card pad col">
      <div class="row wrap between"><h3>${deck ? deck.name : sel.startsWith('m:') ? cat.subject(+sel.slice(2))?.name : 'Todos os cartões'} <span class="muted small">(${lista.length})</span></h3>
        <div class="row wrap"><button class="btn sm" disabled=${!lista.length} onClick=${() => setRev({ cards: lista.slice().sort(() => Math.random() - 0.5), title: 'Treino livre' })}>🔀 Treinar todos</button>
          ${deck && deck.kind !== 'errors' && html`<button class="btn sm ghost" onClick=${async () => { if (await confirmar(app.setModal, { title: 'Excluir coleção', text: `Excluir "${deck.name}" e os ${lista.length} cartões?`, ok: 'Excluir', danger: true })) { for (const c of lista) await store.remove('flashcards', c.id); await store.remove('decks', deck.id); setSel('all'); toast('Coleção excluída'); } }}>🗑 Excluir coleção</button>`}</div></div>
      ${lista.slice(0, 60).map(c => html`<div class="row" style="border-bottom:1px solid var(--line);padding:8px 0"><span class=${'chip ' + (isDue(c) ? 'accent' : '')}>${{ novo: '🌱', aprendendo: '🔁', dominado: '🏆' }[stage(c)]}</span><span class="grow small ellipsis">${c.front}</span>
        <button class="btn ghost xs" onClick=${() => modal(html`<${CardForm} cat=${cat} decks=${decks} card=${c} onClose=${close} />`)}>Editar</button><button class="btn ghost xs" onClick=${async () => { await store.remove('flashcards', c.id); toast('Cartão excluído'); }}>✕</button></div>`)}
      ${lista.length > 60 && html`<p class="tiny muted">Mostrando 60 de ${lista.length}.</p>`}
    </section>`}
  </div>`;
}
