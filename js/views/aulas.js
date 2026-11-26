// Aulas: vídeos e material de apoio dentro da plataforma.
// O banco só entrega as aulas liberadas para este aluno (regras do painel da administração).
// As aulas ficam protegidas com bloqueio de cópia e escurecem fora da janela (js/core/protecao.js).
import { html, setHTML, actions, toast, friendlyError, norm, fmtMin } from '../core/util.js';
import { sb } from '../core/backend.js';
import * as store from '../core/store.js';
import { catalog } from '../core/conteudo.js';
import { proteger } from '../core/protecao.js';

const CACHE = 'aulas:lista';
const COLS = 'id, title, description, subject_id, module, position, video_provider, video_ref, body, material_id, duration_min, pre_codes, post_codes, access, status, updated_at';

async function carregar() {
  if (!navigator.onLine) return { lista: await store.meta.get(CACHE, []), offline: true };
  const { data, error } = await sb.from('lessons').select(COLS).eq('status', 'published').order('subject_id').order('module').order('position').order('title');
  if (error) throw error;
  await store.meta.set(CACHE, data);
  return { lista: data, offline: false };
}

export function embed(l) {
  if (l.video_provider === 'youtube') return html`<iframe src="https://www.youtube-nocookie.com/embed/${l.video_ref}?rel=0&modestbranding=1&playsinline=1" title="${l.title}" allow="encrypted-media; picture-in-picture; fullscreen" allowfullscreen referrerpolicy="strict-origin-when-cross-origin" loading="lazy"></iframe>`;
  if (l.video_provider === 'vimeo') return html`<iframe src="https://player.vimeo.com/video/${l.video_ref}?dnt=1&title=0&byline=0&portrait=0" title="${l.title}" allow="fullscreen; picture-in-picture" allowfullscreen loading="lazy"></iframe>`;
  if (l.video_provider === 'arquivo') return html`<video id="vid" controls playsinline controlslist="nodownload noremoteplayback" disablepictureinpicture preload="metadata" aria-label="${l.title}"></video>`;
  return '';
}

export default {
  title: 'Aulas',
  async render(el, params) {
    let filtro = { subject: '', q: '' };
    let dados;
    try { dados = await carregar(); }
    catch (e) { setHTML(el, html`<div class="card"><h1>Aulas</h1><p class="err">${friendlyError(e)}</p></div>`); return; }
    const cat = await catalog();
    const progresso = async () => new Map((await store.all('lesson_progress')).filter(p => p.completed_at).map(p => [p.id, p.completed_at]));

    const lista = async () => {
      const feitas = await progresso();
      const vis = dados.lista.filter(l => (!filtro.subject || String(l.subject_id) === filtro.subject) && (!filtro.q || norm(l.title + ' ' + (l.description || '') + ' ' + (l.module || '')).includes(norm(filtro.q))));
      const grupos = new Map();
      for (const l of vis) { const k = `${cat.subject(l.subject_id)?.name || 'Geral'}|${l.module || ''}`; if (!grupos.has(k)) grupos.set(k, []); grupos.get(k).push(l); }
      const total = dados.lista.length, feitasN = dados.lista.filter(l => feitas.has(l.id)).length;
      const materias = [...new Set(dados.lista.map(l => l.subject_id))].map(id => cat.subject(id)).filter(Boolean);
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Videoaulas e material de apoio</span><h1>Aulas</h1><p>Assista às aulas liberadas para você e marque o que já concluiu.${dados.offline ? ' Você está sem internet: a lista é a última que foi carregada e os vídeos só tocam com conexão.' : ''}</p></div>
          ${total ? html`<span class="chip num">${feitasN} de ${total} concluídas</span>` : ''}</div>
        ${total ? html`<div class="card form-grid">
          <label class="f">Matéria<select class="input" data-f="subject"><option value="">Todas</option>${materias.map(s => html`<option value="${s.id}" ${filtro.subject === String(s.id) ? 'selected' : ''}>${s.name}</option>`)}</select></label>
          <label class="f">Buscar<input class="input" data-f="q" value="${filtro.q}" placeholder="Nome da aula ou módulo"></label></div>` : ''}
        ${!total ? html`<div class="empty">Nenhuma aula liberada para você ainda. Quando a administração publicar ou liberar aulas, elas aparecem aqui.</div>`
          : !vis.length ? html`<div class="empty">Nenhuma aula encontrada com esses filtros.</div>`
          : [...grupos].map(([k, ls]) => { const [mat, mod] = k.split('|'); return html`<section class="stack" style="gap:10px"><h2>${mat}${mod ? html` <span class="muted" style="font-weight:600">· ${mod}</span>` : ''}</h2>
            <div class="grid g2">${ls.map(l => html`<a class="card row" href="#aulas/${l.id}" style="text-decoration:none;color:inherit;flex-wrap:nowrap;gap:14px;align-items:center">
              <span class="chip ${feitas.has(l.id) ? 'good' : ''}" aria-hidden="true" style="flex:none">${feitas.has(l.id) ? '✓' : '▶'}</span>
              <span style="min-width:0"><b>${l.title}</b><br><span class="muted small">${[l.video_provider ? 'Vídeo' : 'Texto', l.duration_min ? fmtMin(l.duration_min) : '', l.material_id ? 'com material' : ''].filter(Boolean).join(' · ')}</span></span></a>`)}</div></section>`; })}
      </div>`);
      el.querySelectorAll('[data-f]').forEach(i => { i.oninput = i.onchange = () => { filtro[i.dataset.f] = i.value; clearTimeout(i._t); i._t = setTimeout(async () => { const pos = i.selectionStart; await lista(); const n = el.querySelector(`[data-f="${i.dataset.f}"]`); if (n && i.dataset.f === 'q') { n.focus(); n.setSelectionRange(pos, pos); } }, i.dataset.f === 'q' ? 250 : 0); }; });
    };

    let desligar = null;
    const aula = async id => {
      const l = dados.lista.find(x => x.id === id);
      if (!l) { setHTML(el, html`<div class="card stack"><h1>Aula não disponível</h1><p class="muted">Esta aula não existe ou não está liberada para você.</p><div><a class="btn ghost" href="#aulas">Voltar às aulas</a></div></div>`); return; }
      if (navigator.onLine) { const { error } = await sb.rpc('open_lesson', { p_lesson: id }); if (error) { setHTML(el, html`<div class="card stack"><h1>Aula não disponível</h1><p class="muted">${friendlyError(error)}</p><div><a class="btn ghost" href="#aulas">Voltar</a></div></div>`); return; } }
      const feitas = await progresso();
      const mesmas = dados.lista.filter(x => x.subject_id === l.subject_id);
      const i = mesmas.indexOf(l), ant = mesmas[i - 1], prox = mesmas[i + 1];
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div><a class="linkbtn" href="#aulas">← Todas as aulas</a></div>
        <div class="head"><div><span class="eyebrow">${cat.subject(l.subject_id)?.name || 'Aula'}${l.module ? ' · ' + l.module : ''}</span><h1>${l.title}</h1>${l.description ? html`<p>${l.description}</p>` : ''}</div></div>
        ${l.video_provider && l.video_provider !== 'link' ? html`<div class="card video-box" id="prot-video" style="padding:0;overflow:hidden;position:relative;aspect-ratio:16/9;background:#000">${navigator.onLine ? embed(l) : html`<p style="color:#fff;padding:20px">O vídeo precisa de internet.</p>`}</div>` : ''}
        ${l.video_provider === 'link' ? html`<div class="card row between"><span>Esta aula está num link externo.</span><a class="btn" href="${l.video_ref}" target="_blank" rel="noopener noreferrer">Abrir aula</a></div>` : ''}
        ${l.body ? html`<section class="card stack" id="prot-texto" aria-label="Material de apoio"><h2>Material de apoio</h2><div class="pre">${l.body}</div></section>` : ''}
        ${(l.pre_codes || []).length || (l.post_codes || []).length ? html`<div class="card row between"><span><b>Praticar</b><br><span class="muted small">Faça as questões antes para ver o que já sabe e depois para fixar.</span></span><span class="row" style="gap:6px">${(l.pre_codes || []).length ? html`<a class="btn ghost sm" href="#questoes/codigos/${l.pre_codes.join(',')}">Questões antes da aula (${l.pre_codes.length})</a>` : ''}${(l.post_codes || []).length ? html`<a class="btn sm" href="#questoes/codigos/${l.post_codes.join(',')}">Questões depois da aula (${l.post_codes.length})</a>` : ''}</span></div>` : ''}
        <div class="row">
          <button class="btn ${feitas.has(l.id) ? 'ghost' : ''}" type="button" data-action="feita">${feitas.has(l.id) ? 'Desmarcar como concluída' : 'Marcar como concluída'}</button>
          ${l.material_id ? html`<button class="btn ghost" type="button" data-action="material" data-id="${l.material_id}">Abrir material (PDF)</button>` : ''}
          <a class="btn ghost" href="#duvidas/nova/aula/${l.id}">Tenho uma dúvida sobre esta aula</a>
        </div>
        <div class="row between">${ant ? html`<a class="btn ghost sm" href="#aulas/${ant.id}">← ${ant.title}</a>` : html`<span></span>`}${prox ? html`<a class="btn ghost sm" href="#aulas/${prox.id}">${prox.title} →</a>` : ''}</div>
        <p class="muted small">Conteúdo exclusivo da Educa Mais. Cada acesso fica registrado. Não compartilhe.</p>
      </div>`);
      const offs = ['#prot-video', '#prot-texto'].map(s => el.querySelector(s)).filter(Boolean).map(proteger);
      desligar = () => offs.forEach(f => f());
      if (l.video_provider === 'arquivo' && navigator.onLine) {
        const { data, error } = await sb.storage.from('aulas').createSignedUrl(l.video_ref, 60 * 60);
        const v = el.querySelector('#vid');
        if (error || !v) toast('Não foi possível carregar o vídeo.'); else v.src = data.signedUrl;
      }
      actions(el, {
        async feita() {
          const cur = await store.get('lesson_progress', l.id);
          if (cur?.completed_at) await store.patch('lesson_progress', l.id, { completed_at: null });
          else if (cur) await store.patch('lesson_progress', l.id, { completed_at: new Date().toISOString(), deleted_at: null });
          else await store.put('lesson_progress', { id: l.id, lesson_id: l.id, completed_at: new Date().toISOString() });
          toast(cur?.completed_at ? 'Aula desmarcada' : 'Aula concluída. Muito bem!'); aula(id);
        },
        async material(b) {
          b.disabled = true;
          const win = window.open('about:blank', '_blank'); if (win) win.opener = null;
          try {
            const { data: path, error: e1 } = await sb.rpc('request_material', { p_material: b.dataset.id }); if (e1) throw e1;
            const { data: s, error: e2 } = await sb.storage.from('materials').createSignedUrl(path, 60); if (e2) throw e2;
            if (win) win.location = s.signedUrl; else location.href = s.signedUrl;
          } catch (e) { win?.close(); toast(friendlyError(e)); }
          b.disabled = false;
        }
      });
    };

    if (params[0]) await aula(params[0]); else await lista();
    return () => desligar?.();
  }
};
