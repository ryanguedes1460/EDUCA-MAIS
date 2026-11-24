// Administração (somente para quem tem permissão; o banco confere cada ação).
// Abas: visão geral, usuários, questões, catálogo, materiais, comentários,
// configurações globais, permissões e auditoria.
import { html, setHTML, $, actions, toast, formDialog, confirmDialog, friendlyError, fmtDateTime, uuid, norm } from '../core/util.js';
import { sb } from '../core/backend.js';
import * as auth from '../core/auth.js';
import { LEVELS, DIFFICULTY, QTYPES } from '../core/conteudo.js';
import { columns, percentBars } from '../lib/graficos.js';

const TABS = [['visao', 'Visão geral', 'stats.view'], ['usuarios', 'Usuários', 'users.view'], ['questoes', 'Questões', 'content.manage'], ['catalogo', 'Matérias e categorias', 'content.manage'],
  ['materiais', 'Materiais', 'content.manage'], ['comentarios', 'Comentários', 'content.manage'], ['config', 'Configurações', 'settings.manage'], ['permissoes', 'Permissões', 'roles.manage'], ['auditoria', 'Auditoria', 'audit.view']];
const PERMS = { 'admin.access': 'Acessar a administração', 'users.view': 'Ver usuários', 'users.manage': 'Bloquear e desbloquear contas', 'roles.manage': 'Gerenciar categorias e permissões', 'content.manage': 'Gerenciar questões, matérias e materiais', 'stats.view': 'Ver estatísticas gerais', 'audit.view': 'Consultar auditoria e segurança', 'settings.manage': 'Alterar configurações globais' };
const STATUS_Q = { draft: 'Rascunho', published: 'Publicada', archived: 'Arquivada' };

async function q(promise) { const { data, error } = await promise; if (error) throw error; return data; }

export default {
  title: 'Administração',
  async render(el, params, ctx) {
    const tabs = TABS.filter(([, , p]) => auth.can(p));
    let tab = tabs.some(t => t[0] === params[0]) ? params[0] : tabs[0]?.[0];
    let cat = null;
    const loadCat = async () => {
      const [areas, subjects, topics, boards, roles] = await Promise.all([q(sb.from('areas').select('*').order('position')), q(sb.from('subjects').select('*').order('position')), q(sb.from('topics').select('*').order('name')), q(sb.from('exam_boards').select('*').order('name')), q(sb.from('roles').select('*').order('id'))]);
      cat = { areas, subjects, topics, boards, roles, sub: id => subjects.find(s => s.id === id) };
    };

    const shell = async () => {
      if (!navigator.onLine) { setHTML(el, html`<div class="card"><h1>Administração</h1><p class="muted">A administração precisa de internet: cada ação é verificada no servidor.</p></div>`); return; }
      setHTML(el, html`<div class="stack" style="gap:var(--gap)"><div class="head"><div><span class="eyebrow">Somente administração</span><h1>Administração</h1><p>Olá, ${auth.state.profile?.display_name}. Todas as ações são verificadas no servidor e registradas na auditoria.</p></div></div>
        <div class="tabs" role="tablist">${tabs.map(([k, n]) => html`<a href="#admin/${k}" role="tab" aria-selected="${tab === k}">${n}</a>`)}</div><div id="adm"></div></div>`);
      const box = $('#adm', el);
      try { if (!cat) await loadCat(); await views[tab](box); }
      catch (e) { console.error(e); setHTML(box, html`<p class="err">${friendlyError(e)}</p>`); }
    };

    const views = {
      async visao(box) {
        const o = await q(sb.rpc('admin_overview'));
        setHTML(box, html`<div class="stack">
          <div class="grid g4">${[[o.usuarios, 'usuários'], [o.novos_7d, 'novos (7 dias)'], [o.ativos_7d, 'ativos (7 dias)'], [o.usuarios_bloqueados, 'bloqueados'], [o.respostas, 'respostas no total'], [o.taxa_acerto != null ? o.taxa_acerto + '%' : '–', 'acerto geral'], [o.questoes_publicadas, 'questões publicadas'], [o.questoes_rascunho, 'rascunhos'], [o.flashcards, 'flashcards criados'], [o.minutos_estudo_7d, 'minutos de estudo (7 dias)'], [o.eventos_seguranca_7d, 'alertas de segurança (7 dias)']].map(([v, k]) => html`<div class="card stat"><div class="v num">${v ?? 0}</div><div class="k">${k}</div></div>`)}</div>
          <div class="grid g2"><div class="card"><h3>Respostas por dia (14 dias)</h3>${columns((o.por_dia || []).map(d => ({ label: d.dia.slice(8), value: d.respostas })), { title: 'Respostas por dia' })}</div>
          <div class="card"><h3>Acerto por disciplina (todos os alunos)</h3>${percentBars((o.por_disciplina || []).map(d => ({ label: d.disciplina, ok: Math.round(d.acerto * d.respostas / 100), n: d.respostas })))}</div></div></div>`);
      },

      async usuarios(box) {
        let search = box.dataset.s || '', offset = 0;
        const draw = async () => {
          const rows = await q(sb.rpc('admin_list_users', { p_search: search, p_limit: 50, p_offset: offset }));
          const total = rows[0]?.total || 0;
          setHTML(box, html`<div class="stack"><form class="row" id="us"><input class="input" name="s" type="search" placeholder="Buscar por nome ou e-mail" value="${search}" style="max-width:360px"><button class="btn" type="submit">Buscar</button><span class="muted small">${total} usuário(s)</span></form>
            <div class="table-wrap card" style="padding:0"><table class="t"><thead><tr><th>Nome</th><th>E-mail</th><th>Categoria</th><th>Situação</th><th>Respostas</th><th>Último acesso</th><th>Ações</th></tr></thead><tbody>
            ${rows.map(u => html`<tr><td><b>${u.display_name}</b><br><span class="muted small">desde ${fmtDateTime(u.created_at)}</span></td><td>${u.email}</td>
              <td>${auth.can('roles.manage') && u.id !== auth.state.user.id ? html`<select class="input" data-onchange="role" data-id="${u.id}" aria-label="Categoria de ${u.display_name}">${cat.roles.map(r => html`<option value="${r.id}" ${r.id === u.role ? 'selected' : ''}>${r.name}</option>`)}</select>` : cat.roles.find(r => r.id === u.role)?.name}</td>
              <td><span class="chip ${u.status === 'blocked' ? 'bad' : 'good'}">${u.status === 'blocked' ? 'Bloqueado' : 'Ativo'}</span>${u.blocked_reason ? html`<br><span class="muted small">${u.blocked_reason}</span>` : ''}</td>
              <td class="num">${u.answers}</td><td>${u.last_sign_in_at ? fmtDateTime(u.last_sign_in_at) : '–'}</td>
              <td>${auth.can('users.manage') && u.id !== auth.state.user.id ? (u.status === 'blocked' ? html`<button class="btn ghost sm" type="button" data-action="unblock" data-id="${u.id}">Desbloquear</button>` : html`<button class="btn ghost sm" type="button" data-action="block" data-id="${u.id}" data-n="${u.display_name}">Bloquear</button>`) : ''}</td></tr>`)}
            </tbody></table></div>
            <div class="row" style="justify-content:center"><button class="btn ghost sm" type="button" data-action="uprev" ${offset ? '' : 'disabled'}>Anterior</button><button class="btn ghost sm" type="button" data-action="unext" ${offset + 50 < total ? '' : 'disabled'}>Próxima</button></div></div>`);
          $('#us', box).onsubmit = e => { e.preventDefault(); search = e.target.s.value.trim(); box.dataset.s = search; offset = 0; draw(); };
          box.onchange = async e => {
            if (e.target.dataset.onchange !== 'role') return;
            const role = e.target.value;
            if (!(await confirmDialog(`Mudar a categoria deste usuário para "${cat.roles.find(r => r.id === role)?.name}"?`, { ok: 'Mudar' }))) return draw();
            try { await q(sb.rpc('admin_set_user_role', { p_user: e.target.dataset.id, p_role: role })); toast('Categoria alterada'); } catch (err) { toast(friendlyError(err)); }
            draw();
          };
        };
        box._h = {
          async block(b) {
            const fd = await formDialog(`Bloquear ${b.dataset.n}`, html`<p>A pessoa perde o acesso aos dados imediatamente e todas as sessões são encerradas.</p><label class="f">Motivo (a pessoa verá)<input class="input" name="r" maxlength="300" required></label>`, { ok: 'Bloquear', validate: f => String(f.get('r')).trim() ? null : 'Informe o motivo.' });
            if (!fd) return;
            try { await q(sb.rpc('admin_set_user_status', { p_user: b.dataset.id, p_status: 'blocked', p_reason: String(fd.get('r')).trim() })); toast('Conta bloqueada'); } catch (e) { toast(friendlyError(e)); }
            draw();
          },
          async unblock(b) { try { await q(sb.rpc('admin_set_user_status', { p_user: b.dataset.id, p_status: 'active' })); toast('Conta desbloqueada'); } catch (e) { toast(friendlyError(e)); } draw(); },
          uprev() { offset = Math.max(0, offset - 50); draw(); }, unext() { offset += 50; draw(); }
        };
        await draw();
      },

      async questoes(box) {
        let f = { s: '', subject: '', status: '' };
        const stats = new Map((await q(sb.rpc('admin_question_stats'))).map(r => [r.question_id, r]));
        const draw = async () => {
          let query = sb.from('questions').select('id, code, statement, subject_id, level, difficulty, status, updated_at').order('updated_at', { ascending: false }).limit(300);
          if (f.subject) query = query.eq('subject_id', +f.subject);
          if (f.status) query = query.eq('status', f.status);
          let rows = await q(query);
          if (f.s) rows = rows.filter(r => norm(r.statement + ' ' + r.code).includes(norm(f.s)));
          setHTML(box, html`<div class="stack"><div class="row between"><form class="row" id="qf">
              <input class="input" name="s" type="search" placeholder="Buscar" value="${f.s}" style="max-width:220px">
              <select class="input" name="subject" style="max-width:200px"><option value="">Todas as disciplinas</option>${cat.subjects.map(s => html`<option value="${s.id}" ${String(f.subject) === String(s.id) ? 'selected' : ''}>${s.name}</option>`)}</select>
              <select class="input" name="status" style="max-width:160px"><option value="">Todas</option>${Object.entries(STATUS_Q).map(([k, v]) => html`<option value="${k}" ${f.status === k ? 'selected' : ''}>${v}</option>`)}</select>
              <button class="btn ghost" type="submit">Filtrar</button></form>
              <button class="btn" type="button" data-action="newQ">Nova questão</button></div>
            <div class="table-wrap card" style="padding:0"><table class="t"><thead><tr><th>Código</th><th>Enunciado</th><th>Disciplina</th><th>Nível</th><th>Situação</th><th>Respostas</th><th></th></tr></thead><tbody>
            ${rows.map(r => { const st = stats.get(r.id); return html`<tr><td class="mono small">${r.code || ''}</td><td>${r.statement.slice(0, 110)}${r.statement.length > 110 ? '…' : ''}</td><td>${cat.sub(r.subject_id)?.name || ''}</td><td>${LEVELS[r.level]}</td>
              <td><span class="chip ${r.status === 'published' ? 'good' : r.status === 'archived' ? '' : 'warn'}">${STATUS_Q[r.status]}</span></td><td class="num">${st ? `${st.answers} · ${st.accuracy}%` : '0'}</td>
              <td><button class="btn ghost sm" type="button" data-action="editQ" data-id="${r.id}">Editar</button></td></tr>`; })}
            </tbody></table></div>${rows.length >= 300 ? html`<p class="muted small">Mostrando as 300 mais recentes. Use os filtros.</p>` : ''}</div>`);
          $('#qf', box).onsubmit = e => { e.preventDefault(); const fm = e.target; f = { s: fm.s.value, subject: fm.subject.value, status: fm.status.value }; draw(); };
        };
        const editor = async id => {
          const qq = id ? await q(sb.from('questions').select('*, question_options(*)').eq('id', id).single()) : { level: 'enem', difficulty: 2, qtype: 'multiple_choice', status: 'draft', question_options: [] };
          const opts = (qq.question_options || []).sort((a, b) => a.position - b.position);
          while (opts.length < (qq.qtype === 'true_false' ? 2 : 4)) opts.push({ id: '', body: '', is_correct: false });
          const topicsFor = sid => cat.topics.filter(t => t.subject_id === +sid);
          const fd = await formDialog(id ? `Editar questão ${qq.code || ''}` : 'Nova questão', html`
            <div class="form-grid">
              <label class="f">Disciplina<select class="input" name="subject_id" required data-sub>${cat.subjects.map(s => html`<option value="${s.id}" ${qq.subject_id === s.id ? 'selected' : ''}>${s.name}</option>`)}</select></label>
              <label class="f">Conteúdo<select class="input" name="topic_id" data-top><option value="">Nenhum</option>${topicsFor(qq.subject_id || cat.subjects[0]?.id).map(t => html`<option value="${t.id}" ${qq.topic_id === t.id ? 'selected' : ''}>${t.parent_id ? '— ' : ''}${t.name}</option>`)}</select></label>
              <label class="f">Nível<select class="input" name="level">${Object.entries(LEVELS).map(([k, v]) => html`<option value="${k}" ${qq.level === k ? 'selected' : ''}>${v}</option>`)}</select></label>
              <label class="f">Dificuldade<select class="input" name="difficulty">${Object.entries(DIFFICULTY).map(([k, v]) => html`<option value="${k}" ${String(qq.difficulty) === k ? 'selected' : ''}>${v}</option>`)}</select></label>
              <label class="f">Banca/instituição<select class="input" name="board_id"><option value="">Nenhuma</option>${cat.boards.map(b => html`<option value="${b.id}" ${qq.board_id === b.id ? 'selected' : ''}>${b.name}</option>`)}</select></label>
              <label class="f">Ano<input class="input" name="year" type="number" min="1950" max="2100" value="${qq.year || ''}"></label>
              <label class="f">Tipo<select class="input" name="qtype">${Object.entries(QTYPES).map(([k, v]) => html`<option value="${k}" ${qq.qtype === k ? 'selected' : ''}>${v}</option>`)}</select></label>
              <label class="f">Código (opcional)<input class="input" name="code" maxlength="30" value="${qq.code || ''}" placeholder="Gerado automaticamente"></label>
            </div>
            <label class="f">Tema<input class="input" name="theme" maxlength="120" value="${qq.theme || ''}"></label>
            <label class="f">Enunciado<textarea class="input" name="statement" rows="4" required maxlength="8000">${qq.statement || ''}</textarea></label>
            <div class="form-grid"><label class="f">Imagem (PNG, JPG, WEBP, até 2 MB)<input class="input" type="file" name="image" accept="image/png,image/jpeg,image/webp,image/gif"></label>
              <label class="f">Descrição da imagem (acessibilidade)<input class="input" name="image_alt" maxlength="300" value="${qq.image_alt || ''}"></label></div>
            ${qq.image_path ? html`<label class="check"><input type="checkbox" name="rmimg"> Remover a imagem atual (${qq.image_path})</label>` : ''}
            <fieldset class="stack" style="border:1px solid var(--line);border-radius:10px;padding:12px"><legend class="f">Alternativas (marque a correta)</legend>
              ${opts.map((o, i) => html`<div class="row" style="flex-wrap:nowrap"><input type="radio" name="correct" value="${i}" ${o.is_correct ? 'checked' : ''} aria-label="Alternativa ${i + 1} é a correta"><input type="hidden" name="oid${i}" value="${o.id || ''}"><input class="input" name="opt${i}" maxlength="2000" value="${o.body || ''}" placeholder="Alternativa ${'ABCDEF'[i]} (deixe vazia para remover)"></div>`)}
              ${opts.length < 6 ? html`${[...Array(6 - opts.length)].map((_, j) => { const i = opts.length + j; return html`<div class="row" style="flex-wrap:nowrap"><input type="radio" name="correct" value="${i}" aria-label="Alternativa ${i + 1} é a correta"><input type="hidden" name="oid${i}" value=""><input class="input" name="opt${i}" maxlength="2000" placeholder="Alternativa ${'ABCDEF'[i]} (opcional)"></div>`; })}` : ''}
            </fieldset>
            <label class="f">Explicação da resolução<textarea class="input" name="explanation" rows="3" required maxlength="8000">${qq.explanation || ''}</textarea></label>
            <label class="f">Dica do tutor (sem entregar a resposta)<textarea class="input" name="hint" rows="2" maxlength="1000">${qq.hint || ''}</textarea></label>
            <label class="f">Referência ou fonte<input class="input" name="source" maxlength="300" value="${qq.source || ''}"></label>
            <label class="f">Situação<select class="input" name="status">${Object.entries(STATUS_Q).map(([k, v]) => html`<option value="${k}" ${qq.status === k ? 'selected' : ''}>${v}</option>`)}</select></label>
            ${id ? html`<p class="small"><button class="linkbtn" type="button" data-delq="${id}" style="color:var(--bad)">Excluir questão</button> <span class="muted">(só é possível se ninguém respondeu; senão, arquive)</span></p>` : ''}`,
            { validate: async fm => {
              const options = [...Array(6)].map((_, i) => ({ id: fm.get('oid' + i) || '', body: String(fm.get('opt' + i) || '').trim(), is_correct: String(fm.get('correct')) === String(i) })).filter(o => o.body);
              if (String(fm.get('statement')).trim().length < 5) return 'Escreva o enunciado.';
              if (String(fm.get('explanation')).trim().length < 2) return 'Escreva a explicação da resolução.';
              if (options.length < 2) return 'Informe pelo menos 2 alternativas.';
              if (fm.get('status') === 'published' && options.filter(o => o.is_correct).length !== 1) return 'Marque exatamente uma alternativa correta (e ela não pode estar vazia).';
              let image_path = fm.get('rmimg') ? null : qq.image_path || null;
              const file = fm.get('image');
              if (file && file.size) {
                if (file.size > 2 * 1048576) return 'A imagem passa de 2 MB.';
                const ext = { 'image/png': 'png', 'image/jpeg': 'jpg', 'image/webp': 'webp', 'image/gif': 'gif' }[file.type];
                if (!ext) return 'Formato de imagem não aceito.';
                const path = `q/${uuid()}.${ext}`;
                const { error } = await sb.storage.from('question-images').upload(path, file, { contentType: file.type });
                if (error) return friendlyError(error);
                image_path = path;
              }
              const payload = { id: id || '', code: String(fm.get('code')).trim().toUpperCase(), subject_id: fm.get('subject_id'), topic_id: fm.get('topic_id'), level: fm.get('level'), difficulty: fm.get('difficulty'), board_id: fm.get('board_id'), year: fm.get('year'), qtype: fm.get('qtype'),
                theme: String(fm.get('theme')).trim(), statement: String(fm.get('statement')).trim(), image_path, image_alt: String(fm.get('image_alt')).trim(), explanation: String(fm.get('explanation')).trim(), hint: String(fm.get('hint')).trim(), source: String(fm.get('source')).trim(), status: fm.get('status') };
              const { error } = await sb.rpc('admin_save_question', { p_question: payload, p_options: options });
              return error ? friendlyError(error) : null;
            } });
          if (fd) { toast('Questão salva'); draw(); }
        };
        // Atualiza conteúdos ao trocar disciplina e trata exclusão dentro do diálogo
        const onDlg = e => {
          const s = e.target.closest('dialog [data-sub]');
          if (s && e.type === 'change') { const t = s.closest('form').querySelector('[data-top]'); setHTML(t, html`<option value="">Nenhum</option>${cat.topics.filter(x => x.subject_id === +s.value).map(x => html`<option value="${x.id}">${x.parent_id ? '— ' : ''}${x.name}</option>`)}`); }
          const d = e.target.closest('dialog [data-delq]');
          if (d && e.type === 'click') (async () => {
            if (!(await confirmDialog('Excluir esta questão definitivamente?', { ok: 'Excluir', danger: true }))) return;
            const { error } = await sb.from('questions').delete().eq('id', d.dataset.delq);
            if (error) toast(/foreign key|restrict|violates/i.test(error.message) ? 'Esta questão já foi respondida. Arquive em vez de excluir.' : friendlyError(error));
            else { toast('Questão excluída'); d.closest('dialog').close(); draw(); }
          })();
        };
        document.addEventListener('change', onDlg); document.addEventListener('click', onDlg);
        box._cleanup = () => { document.removeEventListener('change', onDlg); document.removeEventListener('click', onDlg); };
        box._h = { newQ: () => editor(null), editQ: b => editor(b.dataset.id) };
        await draw();
      },

      async catalogo(box) {
        const kinds = { areas: ['Áreas (matérias)', ['name', 'position']], subjects: ['Disciplinas', ['name', 'area_id', 'color', 'position']], topics: ['Conteúdos e subconteúdos', ['name', 'subject_id', 'parent_id']], exam_boards: ['Instituições e bancas', ['name', 'kind']] };
        const field = (k, f, row) => ({
          name: html`<label class="f">Nome<input class="input" name="name" required maxlength="120" value="${row?.name || ''}"></label>`,
          position: html`<label class="f">Ordem<input class="input" name="position" type="number" min="0" max="999" value="${row?.position ?? 0}"></label>`,
          area_id: html`<label class="f">Área<select class="input" name="area_id">${cat.areas.map(a => html`<option value="${a.id}" ${row?.area_id === a.id ? 'selected' : ''}>${a.name}</option>`)}</select></label>`,
          color: html`<label class="f">Cor<input class="input" type="color" name="color" value="${row?.color || '#2340b8'}"></label>`,
          subject_id: html`<label class="f">Disciplina<select class="input" name="subject_id">${cat.subjects.map(s => html`<option value="${s.id}" ${row?.subject_id === s.id ? 'selected' : ''}>${s.name}</option>`)}</select></label>`,
          parent_id: html`<label class="f">Dentro de (para subconteúdo)<select class="input" name="parent_id"><option value="">Nenhum (conteúdo principal)</option>${cat.topics.filter(t => !t.parent_id && t.id !== row?.id).map(t => html`<option value="${t.id}" ${row?.parent_id === t.id ? 'selected' : ''}>${cat.sub(t.subject_id)?.name}: ${t.name}</option>`)}</select></label>`,
          kind: html`<label class="f">Tipo<select class="input" name="kind">${[['banca', 'Banca'], ['instituicao', 'Instituição'], ['escola', 'Escola'], ['autoral', 'Autoral']].map(([v, n]) => html`<option value="${v}" ${row?.kind === v ? 'selected' : ''}>${n}</option>`)}</select></label>`
        }[f]);
        const draw = () => setHTML(box, html`<div class="grid g2">${Object.entries(kinds).map(([k, [title]]) => html`<div class="card stack"><div class="row between"><h3>${title}</h3><button class="btn sm" type="button" data-action="catNew" data-k="${k}">Adicionar</button></div>
          <div class="list" style="max-height:340px;overflow:auto">${cat[k === 'exam_boards' ? 'boards' : k].map(r => html`<div class="row between small"><span>${k === 'topics' && r.parent_id ? '— ' : ''}${r.name}${k === 'subjects' ? html` <span class="muted">(${cat.areas.find(a => a.id === r.area_id)?.name})</span>` : k === 'topics' ? html` <span class="muted">(${cat.sub(r.subject_id)?.name})</span>` : ''}</span>
            <span class="row" style="gap:4px"><button class="btn ghost sm" type="button" data-action="catEdit" data-k="${k}" data-id="${r.id}">Editar</button><button class="btn ghost sm" type="button" data-action="catDel" data-k="${k}" data-id="${r.id}" aria-label="Excluir ${r.name}">×</button></span></div>`)}</div></div>`)}</div>`);
        const form = async (k, row) => {
          const fd = await formDialog(row ? 'Editar' : `Adicionar em ${kinds[k][0]}`, html`<div class="stack">${kinds[k][1].map(f => field(k, f, row))}</div>`, { validate: f => String(f.get('name')).trim().length >= 2 ? null : 'Nome muito curto.' });
          if (!fd) return;
          const data = {}; for (const f of kinds[k][1]) { const v = fd.get(f); data[f] = ['area_id', 'subject_id', 'parent_id', 'position'].includes(f) ? (v === '' ? null : +v) : String(v).trim(); }
          const { error } = row ? await sb.from(k).update(data).eq('id', row.id) : await sb.from(k).insert(data);
          if (error) return toast(friendlyError(error));
          toast('Salvo'); await loadCat(); draw();
        };
        box._h = {
          catNew: b => form(b.dataset.k, null),
          catEdit: b => form(b.dataset.k, cat[b.dataset.k === 'exam_boards' ? 'boards' : b.dataset.k].find(r => String(r.id) === b.dataset.id)),
          async catDel(b) {
            if (!(await confirmDialog('Excluir este item? Itens em uso por questões não podem ser excluídos.', { ok: 'Excluir', danger: true }))) return;
            const { error } = await sb.from(b.dataset.k).delete().eq('id', +b.dataset.id);
            if (error) return toast(/foreign key|violates/i.test(error.message) ? 'Este item está em uso e não pode ser excluído.' : friendlyError(error));
            toast('Excluído'); await loadCat(); draw();
          }
        };
        draw();
      },

      async materiais(box) {
        const draw = async () => {
          const rows = await q(sb.from('materials').select('*').order('created_at', { ascending: false }));
          const logs = await q(sb.from('material_access_log').select('material_id').gte('accessed_at', new Date(Date.now() - 30 * 864e5).toISOString()).limit(5000));
          const cnt = {}; logs.forEach(l => cnt[l.material_id] = (cnt[l.material_id] || 0) + 1);
          setHTML(box, html`<div class="stack"><form class="card stack" id="mf"><h3>Enviar material</h3>
            <div class="form-grid"><label class="f">Arquivo (PDF, imagem, MP3 ou MP4, até 50 MB)<input class="input" type="file" name="file" required accept="application/pdf,image/png,image/jpeg,audio/mpeg,video/mp4"></label>
            <label class="f">Título<input class="input" name="title" required maxlength="160"></label>
            <label class="f">Disciplina<select class="input" name="subject_id"><option value="">Nenhuma</option>${cat.subjects.map(s => html`<option value="${s.id}">${s.name}</option>`)}</select></label>
            <label class="f">Quem pode abrir<select class="input" name="access"><option value="authenticated">Todos com conta</option><option value="staff">Só a equipe</option></select></label></div>
            <label class="f">Descrição<input class="input" name="description" maxlength="1000"></label><p class="err" data-e hidden></p>
            <div><button class="btn" type="submit">Enviar</button></div></form>
            <div class="table-wrap card" style="padding:0"><table class="t"><thead><tr><th>Título</th><th>Acesso</th><th>Situação</th><th>Aberturas (30 dias)</th><th></th></tr></thead><tbody>
            ${rows.map(m => html`<tr><td><b>${m.title}</b><br><span class="muted small">${m.storage_path}</span></td><td>${m.access === 'staff' ? 'Equipe' : 'Todos com conta'}</td><td>${STATUS_Q[m.status]}</td><td class="num">${cnt[m.id] || 0}</td>
              <td class="row" style="gap:4px"><button class="btn ghost sm" type="button" data-action="matToggle" data-id="${m.id}" data-s="${m.status}">${m.status === 'published' ? 'Arquivar' : 'Publicar'}</button><button class="btn ghost sm" type="button" data-action="matDel" data-id="${m.id}" data-p="${m.storage_path}">Excluir</button></td></tr>`)}
            </tbody></table></div></div>`);
          $('#mf', box).onsubmit = async e => {
            e.preventDefault(); const fm = e.target, file = fm.file.files[0], err = fm.querySelector('[data-e]');
            if (!file) return; if (file.size > 50 * 1048576) { err.textContent = 'Arquivo maior que 50 MB.'; err.hidden = false; return; }
            const safe = file.name.normalize('NFD').replace(/[^A-Za-z0-9._-]/g, '_').slice(-80);
            const path = `m/${uuid()}-${safe}`;
            fm.querySelector('button').disabled = true;
            const up = await sb.storage.from('materials').upload(path, file, { contentType: file.type });
            if (up.error) { err.textContent = friendlyError(up.error); err.hidden = false; fm.querySelector('button').disabled = false; return; }
            const { error } = await sb.from('materials').insert({ title: fm.title.value.trim(), description: fm.description.value.trim() || null, subject_id: fm.subject_id.value ? +fm.subject_id.value : null, access: fm.access.value, storage_path: path, mime_type: file.type, size_bytes: file.size });
            if (error) { await sb.storage.from('materials').remove([path]); err.textContent = friendlyError(error); err.hidden = false; fm.querySelector('button').disabled = false; return; }
            toast('Material enviado'); draw();
          };
        };
        box._h = {
          async matToggle(b) { const { error } = await sb.from('materials').update({ status: b.dataset.s === 'published' ? 'archived' : 'published' }).eq('id', b.dataset.id); if (error) toast(friendlyError(error)); draw(); },
          async matDel(b) {
            if (!(await confirmDialog('Excluir o material e o arquivo?', { ok: 'Excluir', danger: true }))) return;
            const { error } = await sb.from('materials').delete().eq('id', b.dataset.id);
            if (error) return toast(friendlyError(error));
            await sb.storage.from('materials').remove([b.dataset.p]); toast('Material excluído'); draw();
          }
        };
        await draw();
      },

      async comentarios(box) {
        const draw = async () => {
          const rows = await q(sb.from('question_comments').select('id, body, status, created_at, user_id, question_id, questions(code)').order('created_at', { ascending: false }).limit(100));
          setHTML(box, html`${rows.length ? html`<div class="table-wrap card" style="padding:0"><table class="t"><thead><tr><th>Comentário</th><th>Questão</th><th>Data</th><th>Situação</th><th></th></tr></thead><tbody>
            ${rows.map(c => html`<tr><td class="pre">${c.body}</td><td class="mono small">${c.questions?.code || ''}</td><td>${fmtDateTime(c.created_at)}</td><td>${c.status === 'hidden' ? 'Oculto' : 'Visível'}</td>
              <td class="row" style="gap:4px"><button class="btn ghost sm" type="button" data-action="cToggle" data-id="${c.id}" data-s="${c.status}">${c.status === 'hidden' ? 'Mostrar' : 'Ocultar'}</button><button class="btn ghost sm" type="button" data-action="cDel" data-id="${c.id}">Excluir</button></td></tr>`)}</tbody></table></div>` : html`<div class="empty">Nenhum comentário ainda.</div>`}`);
        };
        box._h = {
          async cToggle(b) { const { error } = await sb.from('question_comments').update({ status: b.dataset.s === 'hidden' ? 'visible' : 'hidden' }).eq('id', b.dataset.id); if (error) toast(friendlyError(error)); draw(); },
          async cDel(b) { if (await confirmDialog('Excluir o comentário?', { ok: 'Excluir', danger: true })) { const { error } = await sb.from('question_comments').delete().eq('id', b.dataset.id); if (error) toast(friendlyError(error)); draw(); } }
        };
        await draw();
      },

      async config(box) {
        const draw = async () => {
          const rows = await q(sb.from('app_settings').select('*').order('key'));
          setHTML(box, html`<div class="stack">${rows.map(r => html`<form class="card stack" data-key="${r.key}"><div class="row between"><b class="mono">${r.key}</b><span class="muted small">${r.updated_at ? 'alterado ' + fmtDateTime(r.updated_at) : ''}</span></div><p class="muted small">${r.description || ''}</p>
            ${typeof r.value === 'boolean' ? html`<label class="check"><input type="checkbox" name="v" ${r.value ? 'checked' : ''}> Ativado</label>` : typeof r.value === 'number' ? html`<input class="input" type="number" name="v" value="${r.value}" style="max-width:160px">` : html`<input class="input" name="v" value="${typeof r.value === 'string' ? r.value : JSON.stringify(r.value)}" maxlength="500">`}
            <div><button class="btn sm" type="submit">Salvar</button></div></form>`)}</div>`);
          box.querySelectorAll('form[data-key]').forEach(fm => fm.onsubmit = async e => {
            e.preventDefault();
            const cur = rows.find(r => r.key === fm.dataset.key).value, inp = fm.v;
            const value = typeof cur === 'boolean' ? inp.checked : typeof cur === 'number' ? Number(inp.value) : inp.value;
            const { error } = await sb.from('app_settings').update({ value }).eq('key', fm.dataset.key);
            if (error) toast(friendlyError(error)); else { toast('Configuração salva'); draw(); }
          });
        };
        await draw();
      },

      async permissoes(box) {
        const draw = () => setHTML(box, html`<div class="stack"><div class="row end"><button class="btn" type="button" data-action="newRole">Nova categoria</button></div>
          <div class="grid g2">${cat.roles.map(r => html`<form class="card stack" data-role="${r.id}"><div class="row between"><h3>${r.name}</h3><span class="mono small muted">${r.id}${r.is_system ? ' · sistema' : ''}</span></div><p class="muted small">${r.description || ''}</p>
            ${r.id === 'admin' ? html`<p class="small">Acesso total (não pode ser reduzido).</p>` : html`${Object.entries(PERMS).map(([p, n]) => html`<label class="check"><input type="checkbox" name="p" value="${p}" ${r.permissions.includes(p) || r.permissions.includes('*') ? 'checked' : ''}> ${n}</label>`)}
            <div class="row"><button class="btn sm" type="submit">Salvar permissões</button>${!r.is_system ? html`<button class="btn ghost sm" type="button" data-action="delRole" data-id="${r.id}">Excluir categoria</button>` : ''}</div>`}</form>`)}</div></div>`);
        box.addEventListener('submit', async e => {
          const fm = e.target.closest('form[data-role]'); if (!fm) return; e.preventDefault();
          const perms = [...fm.querySelectorAll('[name=p]:checked')].map(i => i.value);
          const { error } = await sb.from('roles').update({ permissions: perms }).eq('id', fm.dataset.role);
          if (error) return toast(friendlyError(error));
          toast('Permissões salvas'); await loadCat(); draw();
        });
        box._h = {
          async newRole() {
            const fd = await formDialog('Nova categoria de usuário', html`<label class="f">Identificador (minúsculas, sem espaço)<input class="input" name="id" pattern="[a-z][a-z0-9_]{1,30}" required placeholder="ex.: monitor"></label><label class="f">Nome<input class="input" name="name" required maxlength="60"></label><label class="f">Descrição<input class="input" name="description" maxlength="300"></label>`,
              { ok: 'Criar', validate: f => /^[a-z][a-z0-9_]{1,30}$/.test(String(f.get('id'))) ? null : 'Identificador inválido.' });
            if (!fd) return;
            const { error } = await sb.from('roles').insert({ id: fd.get('id'), name: String(fd.get('name')).trim(), description: String(fd.get('description')).trim() || null, permissions: [] });
            if (error) return toast(friendlyError(error));
            await loadCat(); draw();
          },
          async delRole(b) {
            if (!(await confirmDialog('Excluir esta categoria? Ela não pode estar em uso.', { ok: 'Excluir', danger: true }))) return;
            const { error } = await sb.from('roles').delete().eq('id', b.dataset.id);
            if (error) return toast(/foreign key|violates/i.test(error.message) ? 'Há usuários nesta categoria. Mude-os antes.' : friendlyError(error));
            await loadCat(); draw();
          }
        };
        draw();
      },

      async auditoria(box) {
        const [logs, events] = await Promise.all([q(sb.from('audit_log').select('*').order('id', { ascending: false }).limit(200)), q(sb.from('security_events').select('*').order('id', { ascending: false }).limit(100))]);
        const ids = [...new Set([...logs.map(l => l.actor_id), ...events.map(e => e.user_id)].filter(Boolean))];
        const names = new Map(ids.length ? (await q(sb.from('profiles').select('id, display_name').in('id', ids))).map(p => [p.id, p.display_name]) : []);
        const ACT = { insert: 'criou', update: 'alterou', delete: 'excluiu', 'user.block': 'bloqueou usuário', 'user.unblock': 'desbloqueou usuário', 'user.role': 'mudou categoria', 'admin.bootstrap': 'criação do administrador', 'account.self_delete': 'excluiu a própria conta' };
        setHTML(box, html`<div class="stack"><div class="card stack"><h3>Alertas de segurança</h3>${events.length ? html`<div class="list">${events.map(e => html`<div class="small"><b>${e.kind}</b> · ${names.get(e.user_id) || e.user_id || '–'} · ${fmtDateTime(e.created_at)} <span class="muted mono">${JSON.stringify(e.details)}</span></div>`)}</div>` : html`<p class="muted small">Nenhum alerta.</p>`}</div>
          <div class="table-wrap card" style="padding:0"><table class="t"><thead><tr><th>Quando</th><th>Quem</th><th>Ação</th><th>Onde</th><th>Detalhes</th></tr></thead><tbody>
          ${logs.map(l => html`<tr><td class="small">${fmtDateTime(l.created_at)}</td><td>${names.get(l.actor_id) || (l.actor_id ? l.actor_id.slice(0, 8) : 'sistema')}</td><td>${ACT[l.action] || l.action}</td><td class="small">${l.target_table || ''} <span class="mono muted">${(l.target_id || '').slice(0, 12)}</span></td><td class="mono small muted">${JSON.stringify(l.details).slice(0, 120)}</td></tr>`)}
          </tbody></table></div><p class="muted small">O registro de auditoria não pode ser alterado nem apagado pelo site.</p></div>`);
      }
    };

    el.addEventListener('click', e => {
      const b = e.target.closest('[data-action]'); const box = $('#adm', el);
      if (b && box?._h?.[b.dataset.action]) box._h[b.dataset.action](b, e);
    });
    await shell();
    return () => { $('#adm', el)?._cleanup?.(); };
  }
};
