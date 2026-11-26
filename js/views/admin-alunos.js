// Painel da administração: controle de cada aluno, grupos, aulas e dúvidas.
// Tudo aqui é conferido pelo banco (funções admin_* e políticas de segurança).
import { html, setHTML, $, toast, formDialog, confirmDialog, friendlyError, fmtDateTime, fmtMin, norm, uuid } from '../core/util.js';
import { sb } from '../core/backend.js';
import { FEATURES } from '../core/controles.js';

async function q(promise) { const { data, error } = await promise; if (error) throw error; return data; }
const PROVIDERS = { '': 'Sem vídeo (só texto)', youtube: 'YouTube (vídeo não listado)', vimeo: 'Vimeo', arquivo: 'Arquivo próprio (MP4)', link: 'Link externo' };
const ESTADO = r => r === true ? ['Liberado só para ele', 'good'] : r === false ? ['Bloqueado só para ele', 'bad'] : null;

/** Extrai o código do vídeo de um link do YouTube ou Vimeo colado pela professora. */
export function videoRef(provider, txt) {
  const t = String(txt || '').trim();
  if (provider === 'youtube') { const m = t.match(/(?:youtu\.be\/|v=|embed\/|shorts\/|live\/)([A-Za-z0-9_-]{6,20})/) || t.match(/^([A-Za-z0-9_-]{6,20})$/); return m ? m[1] : null; }
  if (provider === 'vimeo') { const m = t.match(/(\d{5,12})/); return m ? m[1] : null; }
  if (provider === 'link') return /^https:\/\/\S{4,490}$/.test(t) ? t : null;
  return t || null;
}

export function views(cat) {
  return {
    // ---------------- Alunos: liberação e acompanhamento ----------------
    async alunos(box, params = []) {
      const groups = await q(sb.from('student_groups').select('*').order('name'));
      const draw = async (busca = '') => {
        const [pend, users] = await Promise.all([q(sb.rpc('admin_pending_students')), q(sb.rpc('admin_list_users', { p_search: busca, p_limit: 100, p_offset: 0 }))]);
        const alunos = users.filter(u => u.role === 'student');
        setHTML(box, html`<div class="stack">
          <section class="card stack"><h3>Contas novas aguardando liberação ${pend.length ? html`<span class="chip warn">${pend.length}</span>` : ''}</h3>
            ${pend.length ? html`<div class="list">${pend.map(p => html`<div class="row between"><span><b>${p.display_name}</b> <span class="muted small">· ${p.study_profile}${p.school_year ? ' · ' + p.school_year : ''} · criou em ${fmtDateTime(p.created_at)}</span></span>
              <span class="row" style="gap:4px"><button class="btn sm" type="button" data-action="aprovar" data-id="${p.id}" data-n="${p.display_name}">Liberar</button><button class="btn ghost sm" type="button" data-action="abrir" data-id="${p.id}">Ver</button></span></div>`)}</div>`
              : html`<p class="muted small">Nenhuma conta esperando. Quando alguém se cadastrar, aparece aqui.</p>`}
          </section>
          <section class="card stack"><div class="row between"><h3>Todos os alunos</h3><input class="input" id="busca" placeholder="Buscar por nome" value="${busca}" style="max-width:260px"></div>
            <div class="table-wrap"><table class="t"><thead><tr><th>Aluno</th><th>Último login</th><th>Situação</th><th></th></tr></thead><tbody>
            ${alunos.map(u => html`<tr><td><b>${u.display_name}</b><br><span class="muted small">${u.email || ''}</span></td><td class="small">${u.last_sign_in_at ? fmtDateTime(u.last_sign_in_at) : 'nunca'}</td><td>${u.status === 'blocked' ? html`<span class="chip bad">bloqueado</span>` : html`<span class="chip good">ativo</span>`}</td>
              <td><button class="btn ghost sm" type="button" data-action="abrir" data-id="${u.id}">Controlar</button></td></tr>`)}
            </tbody></table></div></section></div>`);
        const b = $('#busca', box); b.oninput = () => { clearTimeout(b._t); b._t = setTimeout(() => draw(b.value), 350); };
      };

      const detalhe = async id => {
        const a = await q(sb.rpc('admin_student_access', { p_user: id }));
        const c = a.controls || { blocked_features: [] };
        const feitas = new Set((a.progress || []).filter(p => p.completed_at).map(p => p.lesson_id));
        const linha = (kind, it) => { const e = ESTADO(it.rule); return html`<tr><td><b>${it.title}</b><br><span class="muted small">${cat.sub(it.subject_id)?.name || ''}${it.module ? ' · ' + it.module : ''}${it.status !== 'published' ? ' · rascunho' : ''}</span></td>
          <td>${it.allowed ? html`<span class="chip good">pode abrir</span>` : html`<span class="chip">não pode</span>`}${e ? html`<br><span class="small muted">${e[0]}</span>` : html`<br><span class="small muted">${it.access === 'todos' ? 'aberta para todos' : 'segue o grupo / padrão'}</span>`}</td>
          ${kind === 'lesson' ? html`<td>${feitas.has(it.id) ? '✓ assistiu' : ''}</td>` : ''}
          <td class="row" style="gap:4px"><button class="btn sm ${it.rule === true ? '' : 'ghost'}" type="button" data-action="regra" data-k="${kind}" data-i="${it.id}" data-v="1">Liberar</button><button class="btn sm ${it.rule === false ? 'danger' : 'ghost'}" type="button" data-action="regra" data-k="${kind}" data-i="${it.id}" data-v="0">Bloquear</button>${it.rule != null ? html`<button class="linkbtn small" type="button" data-action="regra" data-k="${kind}" data-i="${it.id}" data-v="">padrão</button>` : ''}</td></tr>`; };
        setHTML(box, html`<div class="stack">
          <div><button class="linkbtn" type="button" data-action="voltar">← Todos os alunos</button></div>
          <div class="card stack"><div class="row between"><h3>${a.profile?.display_name}</h3>${c.pending ? html`<span class="chip warn">aguardando liberação</span>` : ''}</div>
            <div class="grid g4">${[[a.profile?.last_seen_at ? fmtDateTime(a.profile.last_seen_at) : 'nunca', 'última vez no app'], [a.last_login ? fmtDateTime(a.last_login) : '–', 'último login'], [a.recent_lessons?.[0] ? fmtDateTime(a.recent_lessons[0].accessed_at) : '–', 'última aula aberta'], [fmtMin(a.study_7d_min || 0), 'estudo nos últimos 7 dias'], [feitas.size, 'aulas concluídas'], [a.answers_total ? `${Math.round(a.answers_correct / a.answers_total * 100)}% de ${a.answers_total}` : '–', 'acerto nas questões']].map(([v, k]) => html`<div class="stat"><div class="v num" style="font-size:1.05rem">${v}</div><div class="k">${k}</div></div>`)}</div>
            <p class="muted small">Cadastro em ${a.profile?.created_at ? fmtDateTime(a.profile.created_at) : '–'} · perfil ${a.profile?.study_profile || ''}${a.profile?.school_year ? ' · ' + a.profile.school_year : ''}</p>
          </div>
          <form class="card stack" id="partes"><h3>Partes da plataforma liberadas</h3>
            <div class="grid g4">${Object.entries(FEATURES).map(([k, n]) => html`<label class="check"><input type="checkbox" name="f" value="${k}" ${!c.pending && !(c.blocked_features || []).includes(k) ? 'checked' : ''}> ${n}</label>`)}</div>
            <label class="f">Anotação interna (o aluno não vê)<input class="input" name="note" maxlength="500" value="${c.note || ''}"></label>
            <div class="row"><button class="btn" type="submit">${c.pending ? 'Liberar a conta com estas partes' : 'Salvar partes'}</button></div></form>
          <div class="card stack"><h3>Grupos</h3>
            ${groups.length ? html`<div class="row">${groups.map(g => html`<label class="check"><input type="checkbox" data-action="grupo" data-g="${g.id}" ${(a.groups || []).includes(g.id) ? 'checked' : ''}> ${g.name}</label>`)}</div>` : html`<p class="muted small">Crie grupos na aba Grupos para liberar aulas para vários alunos de uma vez.</p>`}</div>
          <div class="card stack"><div class="row between"><h3>Aulas</h3><span class="row" style="gap:4px"><button class="btn ghost sm" type="button" data-action="todas" data-k="lesson" data-v="1">Liberar todas</button><button class="btn ghost sm" type="button" data-action="todas" data-k="lesson" data-v="">Voltar todas ao padrão</button></span></div>
            ${a.lessons.length ? html`<div class="table-wrap"><table class="t"><thead><tr><th>Aula</th><th>Situação</th><th>Assistiu</th><th></th></tr></thead><tbody>${a.lessons.map(l => linha('lesson', l))}</tbody></table></div>` : html`<p class="muted small">Nenhuma aula cadastrada ainda (aba Aulas).</p>`}</div>
          <div class="card stack"><div class="row between"><h3>Materiais</h3><span class="row" style="gap:4px"><button class="btn ghost sm" type="button" data-action="todas" data-k="material" data-v="1">Liberar todos</button><button class="btn ghost sm" type="button" data-action="todas" data-k="material" data-v="">Voltar todos ao padrão</button></span></div>
            ${a.materials.length ? html`<div class="table-wrap"><table class="t"><thead><tr><th>Material</th><th>Situação</th><th></th></tr></thead><tbody>${a.materials.map(m => linha('material', m))}</tbody></table></div>` : html`<p class="muted small">Nenhum material enviado ainda.</p>`}</div>
          <div class="card stack"><h3>Últimas aulas e materiais abertos</h3>
            ${(a.recent_lessons || []).length || (a.recent_materials || []).length ? html`<div class="list">${[...(a.recent_lessons || []).map(r => ({ t: r.accessed_at, s: 'Aula: ' + r.title })), ...(a.recent_materials || []).map(r => ({ t: r.accessed_at, s: 'Material: ' + r.title }))].sort((x, y) => y.t.localeCompare(x.t)).slice(0, 30).map(r => html`<div class="row between small"><span>${r.s}</span><span class="muted">${fmtDateTime(r.t)}</span></div>`)}</div>` : html`<p class="muted small">Ainda não abriu nenhuma aula ou material.</p>`}</div>
        </div>`);
        $('#partes', box).onsubmit = async e => {
          e.preventDefault();
          const on = new Set([...e.target.querySelectorAll('[name=f]:checked')].map(i => i.value));
          const blocked = Object.keys(FEATURES).filter(k => !on.has(k));
          try { await q(sb.rpc('admin_set_features', { p_user: id, p_blocked: blocked, p_note: e.target.note.value.trim() || null })); toast(c.pending ? 'Conta liberada' : 'Partes salvas'); detalhe(id); }
          catch (er) { toast(friendlyError(er)); }
        };
        box._cur = { id, a };
      };

      box._h = {
        abrir(b) { detalhe(b.dataset.id); },
        voltar() { draw(); },
        async aprovar(b) {
          const fd = await formDialog(`Liberar a conta de ${b.dataset.n}`, html`<div class="stack">
            <p class="small">Escolha o que esta pessoa vai poder usar. Você pode mudar depois em "Controlar".</p>
            <div class="grid g2">${Object.entries(FEATURES).map(([k, n]) => html`<label class="check"><input type="checkbox" name="f" value="${k}" checked> ${n}</label>`)}</div>
            ${groups.length ? html`<label class="f">Colocar no grupo<select class="input" name="g"><option value="">Nenhum</option>${groups.map(g => html`<option value="${g.id}">${g.name}</option>`)}</select></label>` : ''}
            <label class="check"><input type="checkbox" name="tudo"> Liberar também todas as aulas e materiais publicados</label></div>`, { ok: 'Liberar conta' });
          if (!fd) return;
          const on = new Set(fd.getAll('f'));
          try {
            await q(sb.rpc('admin_approve_student', { p_user: b.dataset.id, p_blocked: Object.keys(FEATURES).filter(k => !on.has(k)), p_group: fd.get('g') || null, p_all_content: fd.get('tudo') === 'on' }));
            toast('Conta liberada'); draw();
          } catch (e) { toast(friendlyError(e)); }
        },
        async regra(b) {
          const v = b.dataset.v === '' ? null : b.dataset.v === '1';
          try { await q(sb.rpc('admin_set_access', { p_kind: b.dataset.k, p_item: b.dataset.i, p_target_kind: 'user', p_target: box._cur.id, p_allow: v })); detalhe(box._cur.id); }
          catch (e) { toast(friendlyError(e)); }
        },
        async todas(b) {
          const v = b.dataset.v === '' ? null : true;
          const itens = b.dataset.k === 'lesson' ? box._cur.a.lessons : box._cur.a.materials;
          try { for (const it of itens) await q(sb.rpc('admin_set_access', { p_kind: b.dataset.k, p_item: it.id, p_target_kind: 'user', p_target: box._cur.id, p_allow: v })); toast('Pronto'); detalhe(box._cur.id); }
          catch (e) { toast(friendlyError(e)); }
        },
        async grupo(b) {
          const r = b.checked ? sb.from('student_group_members').insert({ group_id: b.dataset.g, user_id: box._cur.id }) : sb.from('student_group_members').delete().eq('group_id', b.dataset.g).eq('user_id', box._cur.id);
          const { error } = await r; if (error) toast(friendlyError(error)); detalhe(box._cur.id);
        }
      };
      if (params[0]) await detalhe(params[0]); else await draw();
    },

    // ---------------- Grupos ----------------
    async grupos(box) {
      const draw = async () => {
        const [gs, mem, lessons, rules] = await Promise.all([q(sb.from('student_groups').select('*').order('name')), q(sb.from('student_group_members').select('group_id, user_id')), q(sb.from('lessons').select('id, title, subject_id, status').neq('status', 'archived').order('title')), q(sb.from('access_rules').select('*').eq('target_kind', 'group'))]);
        setHTML(box, html`<div class="stack">
          <form class="card form-grid" id="gf"><label class="f">Nome do grupo<input class="input" name="name" required maxlength="80" placeholder="Ex.: Turma ENEM 2027"></label><label class="f">Descrição<input class="input" name="description" maxlength="300"></label><button class="btn" type="submit">Criar grupo</button></form>
          ${gs.length ? gs.map(g => { const lib = new Set(rules.filter(r => r.target_id === g.id && r.item_kind === 'lesson' && r.allow).map(r => r.item_id)); return html`<details class="card stack"><summary class="row between"><b>${g.name}</b><span class="muted small">${mem.filter(m => m.group_id === g.id).length} alunos · ${lib.size} aulas liberadas</span></summary>
            ${g.description ? html`<p class="muted small">${g.description}</p>` : ''}
            <p class="small">Marque as aulas liberadas para todo o grupo:</p>
            <div class="grid g2">${lessons.map(l => html`<label class="check"><input type="checkbox" data-action="gl" data-g="${g.id}" data-i="${l.id}" ${lib.has(l.id) ? 'checked' : ''}> ${l.title}${l.status !== 'published' ? ' (rascunho)' : ''}</label>`)}</div>
            <div><button class="btn danger sm" type="button" data-action="gdel" data-g="${g.id}" data-n="${g.name}">Excluir grupo</button></div></details>`; }) : html`<div class="empty">Nenhum grupo ainda.</div>`}</div>`);
        $('#gf', box).onsubmit = async e => { e.preventDefault(); const { error } = await sb.from('student_groups').insert({ name: e.target.name.value.trim(), description: e.target.description.value.trim() || null }); if (error) return toast(friendlyError(error)); toast('Grupo criado'); draw(); };
      };
      box._h = {
        async gl(b) { try { await q(sb.rpc('admin_set_access', { p_kind: 'lesson', p_item: b.dataset.i, p_target_kind: 'group', p_target: b.dataset.g, p_allow: b.checked ? true : null })); toast(b.checked ? 'Aula liberada para o grupo' : 'Liberação retirada'); } catch (e) { toast(friendlyError(e)); draw(); } },
        async gdel(b) { if (!(await confirmDialog(`Excluir o grupo "${b.dataset.n}"? Os alunos continuam com as liberações individuais.`, { ok: 'Excluir', danger: true }))) return; await sb.from('access_rules').delete().eq('target_kind', 'group').eq('target_id', b.dataset.g); const { error } = await sb.from('student_groups').delete().eq('id', b.dataset.g); if (error) toast(friendlyError(error)); draw(); }
      };
      await draw();
    },

    // ---------------- Aulas ----------------
    async aulas(box) {
      const materiais = await q(sb.from('materials').select('id, title').neq('status', 'archived').order('title'));
      const form = (l = {}) => html`<div class="stack">
        <div class="form-grid">
          <label class="f">Título<input class="input" name="title" required maxlength="160" value="${l.title || ''}"></label>
          <label class="f">Matéria<select class="input" name="subject_id"><option value="">Nenhuma</option>${cat.subjects.map(s => html`<option value="${s.id}" ${l.subject_id === s.id ? 'selected' : ''}>${s.name}</option>`)}</select></label>
          <label class="f">Módulo (opcional)<input class="input" name="module" maxlength="120" value="${l.module || ''}" placeholder="Ex.: Módulo 1: Funções"></label>
          <label class="f">Ordem<input class="input" name="position" type="number" min="0" max="9999" value="${l.position ?? 0}"></label>
          <label class="f">Tipo de vídeo<select class="input" name="video_provider">${Object.entries(PROVIDERS).map(([k, n]) => html`<option value="${k}" ${(l.video_provider || '') === k ? 'selected' : ''}>${n}</option>`)}</select></label>
          <label class="f">Link ou código do vídeo<input class="input" name="video_ref" maxlength="500" value="${l.video_ref || ''}" placeholder="Cole o link do YouTube/Vimeo"></label>
          <label class="f">Ou envie o vídeo (MP4, até 500 MB)<input class="input" type="file" name="file" accept="video/mp4,video/webm"></label>
          <label class="f">Duração (min)<input class="input" name="duration_min" type="number" min="1" max="600" value="${l.duration_min || ''}"></label>
          <label class="f">Material (PDF) desta aula<select class="input" name="material_id"><option value="">Nenhum</option>${materiais.map(m => html`<option value="${m.id}" ${l.material_id === m.id ? 'selected' : ''}>${m.title}</option>`)}</select></label>
          <label class="f">Quem pode assistir<select class="input" name="access"><option value="liberados" ${l.access !== 'todos' ? 'selected' : ''}>Só quem eu liberar</option><option value="todos" ${l.access === 'todos' ? 'selected' : ''}>Todos os alunos liberados na plataforma</option></select></label>
          <label class="f">Situação<select class="input" name="status">${[['draft', 'Rascunho'], ['published', 'Publicada'], ['archived', 'Arquivada']].map(([k, n]) => html`<option value="${k}" ${(l.status || 'draft') === k ? 'selected' : ''}>${n}</option>`)}</select></label>
        </div>
        <label class="f">Descrição curta<input class="input" name="description" maxlength="2000" value="${l.description || ''}"></label>
        <label class="f">Material de apoio (texto)<textarea class="input" name="body" rows="6" maxlength="60000">${l.body || ''}</textarea></label>
        <div class="form-grid"><label class="f">Questões ANTES da aula (códigos separados por vírgula)<input class="input" name="pre_codes" value="${(l.pre_codes || []).join(', ')}" placeholder="EM-MAT-00001, EM-MAT-00002"></label>
          <label class="f">Questões DEPOIS da aula (códigos)<input class="input" name="post_codes" value="${(l.post_codes || []).join(', ')}"></label></div>
        <p class="muted small">Dica: o código aparece em cada questão no banco (ex.: EM-MAT-00015). Também dá para escrever uma palavra-chave abaixo para o app sugerir.</p>
        <label class="f">Sugerir questões por palavra-chave (opcional)<input class="input" name="sugerir" placeholder="Ex.: juros compostos"></label></div>`;
      const ler = async (fd, l = {}) => {
        const codes = v => String(v || '').toUpperCase().split(/[\s,;]+/).filter(x => /^[A-Z0-9-]{3,30}$/.test(x)).slice(0, 50);
        let pre = codes(fd.get('pre_codes')), post = codes(fd.get('post_codes'));
        const sug = String(fd.get('sugerir') || '').trim();
        if (sug) {
          const { data } = await sb.from('questions').select('code').eq('status', 'published').textSearch('search', norm(sug).split(/\s+/).join(' & '), { config: 'portuguese' }).limit(10);
          const found = (data || []).map(x => x.code).filter(Boolean);
          pre = [...new Set([...pre, ...found.slice(0, 5)])]; post = [...new Set([...post, ...found.slice(5, 10)])];
          if (found.length) toast(`${found.length} questões sugeridas foram ligadas à aula`);
        }
        const prov = fd.get('video_provider') || null;
        let ref = prov ? videoRef(prov, fd.get('video_ref')) : null;
        const file = fd.get('file');
        if (file && file.size) {
          if (file.size > 500 * 1048576) throw new Error('Vídeo maior que 500 MB.');
          const path = `v/${uuid()}-${file.name.normalize('NFD').replace(/[^A-Za-z0-9._-]/g, '_').slice(-60)}`;
          const up = await sb.storage.from('aulas').upload(path, file, { contentType: file.type });
          if (up.error) throw up.error;
          return { ...base(fd, pre, post), video_provider: 'arquivo', video_ref: path };
        }
        if (prov && !ref && !(prov === 'arquivo' && l.video_ref)) throw new Error('Link do vídeo não reconhecido. Cole o endereço completo do YouTube ou do Vimeo.');
        if (prov === 'arquivo' && !ref) ref = l.video_ref;
        return { ...base(fd, pre, post), video_provider: prov, video_ref: ref };
      };
      const base = (fd, pre, post) => ({
        title: String(fd.get('title')).trim(), subject_id: fd.get('subject_id') ? +fd.get('subject_id') : null, module: String(fd.get('module') || '').trim() || null,
        position: +fd.get('position') || 0, duration_min: fd.get('duration_min') ? +fd.get('duration_min') : null, material_id: fd.get('material_id') || null,
        access: fd.get('access'), status: fd.get('status'), description: String(fd.get('description') || '').trim() || null, body: String(fd.get('body') || '').trim() || null,
        pre_codes: pre, post_codes: post
      });
      const draw = async () => {
        const [ls, logs] = await Promise.all([q(sb.from('lessons').select('*').order('subject_id').order('module').order('position')), q(sb.from('lesson_access_log').select('lesson_id').gte('accessed_at', new Date(Date.now() - 30 * 864e5).toISOString()).limit(10000))]);
        const cnt = {}; logs.forEach(l => cnt[l.lesson_id] = (cnt[l.lesson_id] || 0) + 1);
        setHTML(box, html`<div class="stack">
          <div class="row between"><p class="muted small">Aulas novas começam como "Só quem eu liberar". Libere por aluno (aba Alunos) ou por grupo (aba Grupos).</p><button class="btn" type="button" data-action="nova">Nova aula</button></div>
          <div class="table-wrap card" style="padding:0"><table class="t"><thead><tr><th>Aula</th><th>Vídeo</th><th>Quem vê</th><th>Situação</th><th>Aberturas (30 dias)</th><th></th></tr></thead><tbody>
          ${ls.length ? ls.map(l => html`<tr><td><b>${l.title}</b><br><span class="muted small">${cat.sub(l.subject_id)?.name || ''}${l.module ? ' · ' + l.module : ''}</span></td><td class="small">${PROVIDERS[l.video_provider || '']}</td><td class="small">${l.access === 'todos' ? 'Todos liberados' : 'Só quem eu liberar'}</td><td>${{ draft: 'Rascunho', published: 'Publicada', archived: 'Arquivada' }[l.status]}</td><td class="num">${cnt[l.id] || 0}</td>
            <td class="row" style="gap:4px"><a class="btn ghost sm" href="#aulas/${l.id}">Ver</a><button class="btn ghost sm" type="button" data-action="editar" data-id="${l.id}">Editar</button><button class="btn ghost sm" type="button" data-action="excluir" data-id="${l.id}" data-n="${l.title}">Excluir</button></td></tr>`) : html`<tr><td colspan="6" class="muted">Nenhuma aula ainda. Clique em "Nova aula".</td></tr>`}
          </tbody></table></div></div>`);
        box._ls = ls;
      };
      const salvar = async (l) => {
        const fd = await formDialog(l ? 'Editar aula' : 'Nova aula', form(l || {}), { ok: 'Salvar aula', validate: f => String(f.get('title')).trim().length >= 2 ? null : 'Dê um título à aula.' });
        if (!fd) return;
        try {
          const row = await ler(fd, l || {});
          const r = l ? await sb.from('lessons').update(row).eq('id', l.id) : await sb.from('lessons').insert(row);
          if (r.error) throw r.error; toast('Aula salva'); draw();
        } catch (e) { toast(friendlyError(e), 4000); }
      };
      box._h = {
        nova() { salvar(null); },
        editar(b) { salvar(box._ls.find(x => x.id === b.dataset.id)); },
        async excluir(b) { if (!(await confirmDialog(`Excluir a aula "${b.dataset.n}"? O progresso dos alunos nela também some.`, { ok: 'Excluir', danger: true }))) return; const { error } = await sb.from('lessons').delete().eq('id', b.dataset.id); if (error) toast(friendlyError(error)); draw(); }
      };
      await draw();
    },

    // ---------------- Dúvidas dos alunos ----------------
    async duvidas(box) {
      let filtro = 'aberta';
      const draw = async () => {
        let qy = sb.from('doubts').select('*').order('created_at', { ascending: filtro === 'aberta' }).limit(200);
        if (filtro) qy = qy.eq('status', filtro);
        const ds = await q(qy);
        const ids = [...new Set(ds.map(d => d.user_id))];
        const names = new Map(ids.length ? (await q(sb.from('profiles').select('id, display_name').in('id', ids))).map(p => [p.id, p.display_name]) : []);
        const lids = [...new Set(ds.map(d => d.lesson_id).filter(Boolean))];
        const lnames = new Map(lids.length ? (await q(sb.from('lessons').select('id, title').in('id', lids))).map(l => [l.id, l.title]) : []);
        setHTML(box, html`<div class="stack">
          <div class="tabs" role="tablist">${[['aberta', 'Aguardando'], ['respondida', 'Respondidas'], ['fechada', 'Encerradas'], ['', 'Todas']].map(([k, n]) => html`<button type="button" role="tab" aria-selected="${filtro === k}" data-action="filtro" data-v="${k}">${n}</button>`)}</div>
          ${ds.length ? ds.map(d => html`<article class="card stack"><div class="row between"><b>${names.get(d.user_id) || 'Aluno'}</b><span class="muted small">${fmtDateTime(d.created_at)}</span></div>
            <div class="q-meta">${d.subject_id ? html`<span class="chip">${cat.sub(d.subject_id)?.name || ''}</span>` : ''}${d.lesson_id ? html`<span class="chip">Aula: ${lnames.get(d.lesson_id) || ''}</span>` : ''}${d.question_id ? html`<span class="chip">Sobre uma questão</span>` : ''}</div>
            <p class="pre">${d.body}</p>
            ${d.answer ? html`<div class="banner good"><b>Sua resposta:</b> <span class="pre">${d.answer}</span></div>` : ''}
            <div><button class="btn sm" type="button" data-action="responder" data-id="${d.id}">${d.answer ? 'Editar resposta' : 'Responder'}</button></div></article>`) : html`<div class="empty">Nenhuma dúvida aqui.</div>`}
        </div>`);
        box._ds = ds;
      };
      box._h = {
        filtro(b) { filtro = b.dataset.v; draw(); },
        async responder(b) {
          const d = box._ds.find(x => x.id === b.dataset.id);
          const fd = await formDialog('Responder dúvida', html`<p class="small pre" style="margin-bottom:8px">${d.body}</p><label class="f">Resposta<textarea class="input" name="answer" rows="7" maxlength="8000" required>${d.answer || ''}</textarea></label>`, { ok: 'Enviar resposta' });
          if (!fd) return;
          const { error } = await sb.from('doubts').update({ answer: String(fd.get('answer')).trim() }).eq('id', d.id);
          if (error) return toast(friendlyError(error)); toast('Resposta enviada'); draw();
        }
      };
      await draw();
    }
  };
}
