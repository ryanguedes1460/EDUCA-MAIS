// Materiais protegidos (PDFs etc.). Cada abertura é registrada no banco e gera
// um link temporário (60 s). Observação honesta: o que é exibido no navegador
// pode ser salvo por alguém determinado; o controle impede acesso de quem não tem conta,
// registra quem acessou e detecta downloads em massa.
import { html, setHTML, actions, toast, friendlyError } from '../core/util.js';
import { sb } from '../core/backend.js';
import { catalog } from '../core/conteudo.js';

export default {
  title: 'Materiais',
  async render(el) {
    const cat = await catalog();
    if (!navigator.onLine) { setHTML(el, html`<div class="card"><h1>Materiais</h1><p class="muted">Os materiais protegidos só abrem com internet, para que cada acesso seja verificado.</p></div>`); return; }
    const { data, error } = await sb.from('materials').select('id, title, description, subject_id, mime_type, size_bytes, created_at').eq('status', 'published').order('created_at', { ascending: false });
    setHTML(el, html`<div class="stack" style="gap:var(--gap)">
      <div class="head"><div><span class="eyebrow">Biblioteca</span><h1>Materiais</h1><p>Apostilas e arquivos da Educa Mais, disponíveis para quem tem conta. Cada link vale por 60 segundos.</p></div></div>
      ${error ? html`<p class="err">Não foi possível carregar os materiais.</p>` : data.length ? html`<div class="grid g2">${data.map(m => html`<div class="card stack"><h3>${m.title}</h3>${m.description ? html`<p class="muted small">${m.description}</p>` : ''}
        <div class="q-meta">${m.subject_id ? html`<span class="chip">${cat.subject(m.subject_id)?.name || ''}</span>` : ''}${m.mime_type ? html`<span class="chip">${m.mime_type.split('/')[1]?.toUpperCase()}</span>` : ''}${m.size_bytes ? html`<span class="chip">${(m.size_bytes / 1048576).toFixed(1).replace('.', ',')} MB</span>` : ''}</div>
        <div><button class="btn sm" type="button" data-action="open" data-id="${m.id}">Abrir</button></div></div>`)}</div>` : html`<div class="empty">Nenhum material publicado ainda.</div>`}
    </div>`);
    actions(el, {
      async open(b) {
        b.disabled = true;
        const win = window.open('about:blank', '_blank'); if (win) win.opener = null;
        try {
          const { data: path, error: e1 } = await sb.rpc('request_material', { p_material: b.dataset.id });
          if (e1) throw e1;
          const { data: s, error: e2 } = await sb.storage.from('materials').createSignedUrl(path, 60);
          if (e2) throw e2;
          if (win) win.location = s.signedUrl; else location.href = s.signedUrl;
        } catch (e) { win?.close(); toast(friendlyError(e)); }
        b.disabled = false;
      }
    });
  }
};
