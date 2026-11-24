// Anotações: caderno com busca, disciplina, favoritos e salvamento automático.
import { html, setHTML, $, actions, toast, confirmDialog, norm, fmtDateTime, debounce } from '../core/util.js';
import * as store from '../core/store.js';
import { catalog } from '../core/conteudo.js';

let curId = null, query = '', onlyFav = false;

export default {
  title: 'Anotações',
  async render(el) {
    const cat = await catalog();
    const save = debounce(async (id, fields) => { await store.patch('notes', id, fields); const m = $('#noteMeta', el); if (m) m.textContent = 'Salvo ' + fmtDateTime(Date.now()); }, 600);

    const draw = async () => {
      const notes = (await store.all('notes')).sort((a, b) => (b.updated_at || '').localeCompare(a.updated_at || ''));
      const list = notes.filter(n => (!onlyFav || n.is_favorite) && (!query || norm(n.title + ' ' + n.body).includes(norm(query))));
      if (!notes.find(n => n.id === curId)) curId = list[0]?.id || null;
      const n = notes.find(x => x.id === curId);
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Caderno</span><h1>Anotações</h1><p>Resumos e lembretes. Tudo é salvo automaticamente e vai para a sua conta.</p></div><button class="btn" type="button" data-action="new">Nova anotação</button></div>
        <div class="split">
          <div class="stack">
            <input class="input" type="search" id="noteSearch" placeholder="Buscar nas anotações" value="${query}" aria-label="Buscar nas anotações">
            <label class="check"><input type="checkbox" id="onlyFav" ${onlyFav ? 'checked' : ''}> Só favoritas</label>
            <div class="stack" style="gap:6px;max-height:560px;overflow:auto">${list.length ? list.map(x => html`<button type="button" class="item-btn" data-action="open" data-id="${x.id}" aria-current="${x.id === curId}" style="display:grid;gap:2px"><b>${x.is_favorite ? '★ ' : ''}${x.title || 'Sem título'}</b><span class="muted small" style="overflow:hidden;text-overflow:ellipsis;white-space:nowrap">${(x.body.split('\n')[0] || 'Vazia').slice(0, 80)}</span></button>`) : html`<div class="empty">${query || onlyFav ? 'Nada encontrado.' : 'Nenhuma anotação ainda.'}</div>`}</div>
          </div>
          ${n ? html`<div class="card stack editor">
            <input class="input" id="noteTitle" placeholder="Título" maxlength="120" value="${n.title}" style="font-family:var(--f-display);font-weight:700;font-size:1.2rem" aria-label="Título">
            <div class="row"><label class="f" style="flex:1">Disciplina<select class="input" id="noteSubj"><option value="">Nenhuma</option>${cat.subjects.map(s => html`<option value="${s.id}" ${n.subject_id === s.id ? 'selected' : ''}>${s.name}</option>`)}</select></label>
              <button class="star" type="button" data-action="fav" aria-pressed="${!!n.is_favorite}" aria-label="Favoritar anotação">${n.is_favorite ? '★' : '☆'}</button></div>
            <textarea class="input" id="noteBody" placeholder="Escreva aqui…" maxlength="50000" aria-label="Texto da anotação">${n.body}</textarea>
            <div class="row between"><span class="muted small" id="noteMeta">Salvo ${fmtDateTime(n.updated_at)}</span><button class="btn ghost sm" type="button" data-action="del">Excluir</button></div>
          </div>` : html`<div class="empty">Crie uma anotação para começar.</div>`}
        </div></div>`);
      const s = $('#noteSearch', el); s.oninput = debounce(() => { query = s.value; draw().then(() => { const i = $('#noteSearch', el); i.focus(); i.setSelectionRange(i.value.length, i.value.length); }); }, 250);
      $('#onlyFav', el).onchange = e => { onlyFav = e.target.checked; draw(); };
      if (n) {
        $('#noteTitle', el).oninput = e => save(n.id, { title: e.target.value.slice(0, 120) });
        $('#noteBody', el).oninput = e => save(n.id, { body: e.target.value });
        $('#noteSubj', el).onchange = e => store.patch('notes', n.id, { subject_id: e.target.value ? +e.target.value : null });
      }
    };
    actions(el, {
      async new() { const n = await store.put('notes', { title: '', body: '', subject_id: null, is_favorite: false }); curId = n.id; query = ''; await draw(); $('#noteTitle', el)?.focus(); },
      open(b) { curId = b.dataset.id; draw(); },
      async fav() { const n = await store.get('notes', curId); await store.patch('notes', n.id, { is_favorite: !n.is_favorite }); draw(); },
      async del() { if (await confirmDialog('Excluir esta anotação?', { ok: 'Excluir', danger: true })) { await store.remove('notes', curId); curId = null; toast('Anotação excluída'); draw(); } }
    });
    await draw();
  }
};
