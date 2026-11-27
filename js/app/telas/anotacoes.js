// Anotações: caderno digital com busca, matéria e favoritos. Salva sozinho enquanto você escreve.
import { html, useState, useEffect, useRef, useApp, useData, go, PageHead, Empty, Select, toast, confirmar, subjectIcon } from '../ui.js';
import * as store from '../../core/store.js';
import { catalog } from '../../core/conteudo.js';
import { norm, fmtDateTime } from '../../core/util.js';

function Editor({ note, cat, onDelete }) {
  const [title, setTitle] = useState(note.title || '');
  const [body, setBody] = useState(note.body || '');
  const [saved, setSaved] = useState(true);
  const t = useRef({});
  const pend = useRef({});
  const flush = async () => { const f = pend.current; pend.current = {}; if (Object.keys(f).length) { await store.patch('notes', note.id, f); setSaved(true); } };
  useEffect(() => () => { clearTimeout(t.current.x); flush(); }, []);
  const change = (k, v) => { k === 'title' ? setTitle(v) : setBody(v); setSaved(false); pend.current[k] = v.slice(0, k === 'title' ? 120 : 50000); clearTimeout(t.current.x); t.current.x = setTimeout(flush, 600); };
  const words = body.trim() ? body.trim().split(/\s+/).length : 0;
  return html`<div class="card pad col" style="gap:10px">
    <div class="row wrap between"><div class="row"><${Select} value=${note.subject_id ? String(note.subject_id) : ''} onChange=${v => store.patch('notes', note.id, { subject_id: v ? +v : null })} all="Sem matéria" options=${cat.subjects.map(s => [s.id, s.name])} style="width:auto" />
      <button class=${'star' + (note.is_favorite ? ' on' : '')} aria-pressed=${!!note.is_favorite} onClick=${() => store.patch('notes', note.id, { is_favorite: !note.is_favorite })}>${note.is_favorite ? '★' : '☆'}</button></div>
      <div class="row"><span class="tiny faint">${saved ? '✓ salvo' : 'salvando…'} · ${words} palavras</span><button class="btn ghost sm" onClick=${onDelete}>🗑</button></div></div>
    <input id="noteTitle" class="input display" style="font-size:22px;border:0;background:transparent;box-shadow:none;padding:4px 0" placeholder="Título" value=${title} maxlength="120" onInput=${e => change('title', e.target.value)} />
    <textarea id="noteBody" class="input editor-area" placeholder="Escreva aqui. Dica: resuma com as suas palavras, isso ajuda a lembrar." value=${body} onInput=${e => change('body', e.target.value)}></textarea>
  </div>`;
}

export default function Anotacoes({ params = [] }) {
  const app = useApp();
  const [cur, setCur] = useState(params[0] || null);
  const [q, setQ] = useState('');
  const [d] = useData(async () => { const [cat, notes] = await Promise.all([catalog(), store.all('notes')]); return { cat, notes: notes.sort((a, b) => (b.is_favorite - a.is_favorite) || (b.updated_at || '').localeCompare(a.updated_at || '')) }; }, [], ['notes']);
  if (!d) return html`<div class="skeleton" style="height:240px"></div>`;
  const list = d.notes.filter(n => !q || norm(n.title + ' ' + n.body).includes(norm(q)));
  const note = d.notes.find(n => n.id === cur);
  const nova = async () => { const n = await store.put('notes', { title: '', body: '', subject_id: null, is_favorite: false }); setCur(n.id); };
  return html`<div class="col fade-in" style="gap:18px">
    <${PageHead} eyebrow="Caderno digital" title="Anotações" actions=${html`<button class="btn primary" data-action="new" onClick=${nova}>+ Nova anotação</button>`}>Resumos, fórmulas e ideias, salvos na sua conta e disponíveis sem internet.</${PageHead}>
    ${!d.notes.length ? html`<div class="card"><${Empty} icon="📝" title="Nenhuma anotação ainda" action=${html`<button class="btn primary" onClick=${nova}>Escrever a primeira</button>`}>Anote o que aprendeu em cada aula ou questão.</${Empty}></div>` : html`
    <div class="notes-layout">
      <aside class="card pad col" style="gap:6px"><input class="input" type="search" placeholder="Buscar" value=${q} onInput=${e => setQ(e.target.value)} />
        ${list.map(n => html`<button class=${'note-item' + (n.id === cur ? ' on' : '')} onClick=${() => setCur(n.id)}><div class="bold ellipsis">${n.is_favorite ? '★ ' : ''}${n.title || 'Sem título'}</div><div class="tiny muted ellipsis">${n.subject_id ? subjectIcon(d.cat.subject(n.subject_id)?.name) + ' ' + (d.cat.subject(n.subject_id)?.name || '') + ' · ' : ''}${n.updated_at ? fmtDateTime(n.updated_at) : ''}</div></button>`)}
        ${!list.length && html`<p class="tiny faint">Nada encontrado.</p>`}</aside>
      ${note ? html`<${Editor} key=${note.id} note=${note} cat=${d.cat} onDelete=${async () => { if (await confirmar(app.setModal, { title: 'Excluir anotação', text: 'Excluir esta anotação?', ok: 'Excluir', danger: true })) { await store.remove('notes', note.id); setCur(null); toast('Anotação excluída'); } }} />`
        : html`<div class="card"><${Empty} icon="👈" title="Escolha uma anotação">Ou crie uma nova.</${Empty}></div>`}
    </div>`}
  </div>`;
}
