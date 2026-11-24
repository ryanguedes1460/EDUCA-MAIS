// Área do professor: banco de questões próprio, listas/simulados, turmas e pedidos.
// Tudo é conferido no banco: um professor só enxerga e altera o que é dele.
import { html, setHTML, $, toast, formDialog, confirmDialog, friendlyError, fmtDateTime, norm } from '../core/util.js';
import { sb } from '../core/backend.js';
import * as auth from '../core/auth.js';
import { LEVELS, DIFFICULTY } from '../core/conteudo.js';
import { editQuestion, loadCatalog, showRevisions, STATUS_Q, VISIBILITY } from '../lib/editor-questao.js';

const TABS = [['questoes', 'Meu banco de questões'], ['listas', 'Listas e simulados'], ['turmas', 'Turmas'], ['pedidos', 'Pedidos de correção']];
const LIST_STATUS = { draft: 'Rascunho', published: 'Publicada', archived: 'Arquivada' };
async function q(promise) { const { data, error } = await promise; if (error) throw error; return data; }
const me = () => auth.state.user.id;
const toLocalInput = iso => { if (!iso) return ''; const d = new Date(iso); d.setMinutes(d.getMinutes() - d.getTimezoneOffset()); return d.toISOString().slice(0, 16); };

export default {
  title: 'Área do professor',
  async render(el, params) {
    let tab = TABS.some(t => t[0] === params[0]) ? params[0] : 'questoes';
    let cat = null;

    const shell = async () => {
      if (!navigator.onLine) { setHTML(el, html`<div class="card"><h1>Área do professor</h1><p class="muted">A área do professor precisa de internet: cada alteração é conferida e guardada no servidor na hora.</p></div>`); return; }
      setHTML(el, html`<div class="stack" style="gap:var(--gap)"><div class="head"><div><span class="eyebrow">Professor</span><h1>Área do professor</h1>
        <p>Suas questões ficam no seu banco, privadas. Os alunos só as veem dentro das listas que você enviar para as suas turmas.</p></div></div>
        <div class="tabs" role="tablist">${TABS.map(([k, n]) => html`<a href="#professor/${k}" role="tab" aria-selected="${tab === k}">${n}</a>`)}</div><div id="prof"></div></div>`);
      const box = $('#prof', el);
      try { if (!cat) cat = await loadCatalog(); await views[tab](box); }
      catch (e) { console.error(e); setHTML(box, html`<p class="err">${friendlyError(e)}</p>`); }
    };

    const views = {
      // ------------------------------------------------------------ banco
      async questoes(box) {
        let f = { s: '', subject: '', topic: '', difficulty: '', status: '' };
        const draw = async () => {
          let query = sb.from('questions').select('id, code, statement, subject_id, topic_id, level, difficulty, status, visibility, updated_at')
            .eq('owner_id', me()).order('updated_at', { ascending: false }).limit(500);
          if (f.subject) query = query.eq('subject_id', +f.subject);
          if (f.topic) query = query.eq('topic_id', +f.topic);
          if (f.difficulty) query = query.eq('difficulty', +f.difficulty);
          if (f.status) query = query.eq('status', f.status);
          if (f.s) query = query.textSearch('search', f.s.split(/\s+/).filter(Boolean).map(w => norm(w)).join(' & '), { config: 'portuguese' });
          const rows = await q(query);
          const topics = f.subject ? cat.topics.filter(t => t.subject_id === +f.subject) : [];
          setHTML(box, html`<div class="stack"><div class="row between"><form class="row" id="pf">
              <input class="input" name="s" type="search" placeholder="Palavra-chave" value="${f.s}" style="max-width:200px" aria-label="Palavra-chave">
              <select class="input" name="subject" style="max-width:180px" aria-label="Disciplina"><option value="">Todas as disciplinas</option>${cat.subjects.map(s => html`<option value="${s.id}" ${String(f.subject) === String(s.id) ? 'selected' : ''}>${s.name}</option>`)}</select>
              ${topics.length ? html`<select class="input" name="topic" style="max-width:180px" aria-label="Conteúdo"><option value="">Todos os conteúdos</option>${topics.map(t => html`<option value="${t.id}" ${String(f.topic) === String(t.id) ? 'selected' : ''}>${t.name}</option>`)}</select>` : ''}
              <select class="input" name="difficulty" style="max-width:150px" aria-label="Dificuldade"><option value="">Qualquer dificuldade</option>${Object.entries(DIFFICULTY).map(([k, v]) => html`<option value="${k}" ${String(f.difficulty) === k ? 'selected' : ''}>${v}</option>`)}</select>
              <select class="input" name="status" style="max-width:140px" aria-label="Situação"><option value="">Todas</option>${Object.entries(STATUS_Q).map(([k, v]) => html`<option value="${k}" ${f.status === k ? 'selected' : ''}>${v}</option>`)}</select>
              <button class="btn ghost" type="submit">Buscar</button></form>
              <button class="btn" type="button" data-action="newQ">Nova questão</button></div>
            ${rows.length ? html`<div class="table-wrap card" style="padding:0"><table class="t" id="myQ"><thead><tr><th>Código</th><th>Enunciado</th><th>Disciplina</th><th>Nível</th><th>Situação</th><th>Onde está</th><th></th></tr></thead><tbody>
              ${rows.map(r => html`<tr><td class="mono small">${r.code || ''}</td><td>${r.statement.slice(0, 110)}${r.statement.length > 110 ? '…' : ''}</td><td>${cat.sub(r.subject_id)?.name || ''}</td><td>${LEVELS[r.level]}<br><span class="muted small">${DIFFICULTY[r.difficulty]}</span></td>
                <td><span class="chip ${r.status === 'published' ? 'good' : r.status === 'archived' ? '' : 'warn'}">${STATUS_Q[r.status]}</span></td><td class="small">${VISIBILITY[r.visibility]}</td>
                <td class="row" style="gap:4px">${r.visibility === 'public' ? html`<button class="btn ghost sm" type="button" data-action="askFix" data-id="${r.id}">Pedir correção</button>` : html`<button class="btn ghost sm" type="button" data-action="editQ" data-id="${r.id}">Editar</button>`}
                  ${r.visibility === 'private' && r.status === 'published' ? html`<button class="btn ghost sm" type="button" data-action="toPublic" data-id="${r.id}">Enviar ao banco geral</button>` : ''}
                  <button class="btn ghost sm" type="button" data-action="revs" data-id="${r.id}">Versões</button></td></tr>`)}
              </tbody></table></div><p class="muted small">${rows.length} questão(ões) no seu banco${rows.length >= 500 ? ' (mostrando as 500 mais recentes)' : ''}.</p>`
            : html`<div class="empty">${f.s || f.subject || f.status || f.difficulty ? 'Nenhuma questão com esses filtros.' : 'Seu banco ainda está vazio. Crie a primeira questão.'}</div>`}</div>`);
          $('#pf', box).onsubmit = e => { e.preventDefault(); const fm = e.target; f = { s: fm.s.value.trim(), subject: fm.subject.value, topic: fm.topic?.value || '', difficulty: fm.difficulty.value, status: fm.status.value }; draw(); };
          $('#pf', box).subject.onchange = e => { f = { ...f, subject: e.target.value, topic: '' }; draw(); };
        };
        box._h = {
          newQ: async () => { if (await editQuestion({ cat })) draw(); },
          editQ: async b => { if (await editQuestion({ id: b.dataset.id, cat })) draw(); },
          revs: b => showRevisions(b.dataset.id).catch(e => toast(friendlyError(e))),
          async toPublic(b) {
            if (!(await confirmDialog('Enviar esta questão para o banco geral? O administrador revisa antes. Depois de aprovada, todos os alunos poderão usá-la e só a equipe poderá alterá-la (você continua podendo pedir correções).', { ok: 'Enviar' }))) return;
            try { await q(sb.rpc('request_public', { p_question: b.dataset.id })); toast('Enviada para revisão do administrador'); } catch (e) { toast(friendlyError(e)); }
            draw();
          },
          askFix: b => askCorrection(b.dataset.id)
        };
        await draw();
      },

      // ------------------------------------------------------------ listas
      async listas(box) {
        const drawAll = async () => {
          const [lists, classes] = await Promise.all([
            q(sb.from('lists').select('id, title, mode, status, time_limit_min, updated_at, list_items(count), list_assignments(id, class_id, due_at)').eq('owner_id', me()).order('updated_at', { ascending: false })),
            q(sb.from('classes').select('id, name').eq('owner_id', me()).is('archived_at', null))]);
          const cname = new Map(classes.map(c => [c.id, c.name]));
          setHTML(box, html`<div class="stack"><div class="row end"><button class="btn" type="button" data-action="newList">Nova lista ou simulado</button></div>
            ${lists.length ? html`<div class="grid g2">${lists.map(l => html`<div class="card stack"><div class="row between"><h3>${l.title}</h3><span class="chip ${l.status === 'published' ? 'good' : 'warn'}">${LIST_STATUS[l.status]}</span></div>
              <p class="small muted">${l.mode === 'simulado' ? `Simulado${l.time_limit_min ? ` · ${l.time_limit_min} min` : ''}` : 'Lista de exercícios'} · ${l.list_items?.[0]?.count || 0} questão(ões)</p>
              <p class="small">${l.list_assignments.length ? html`Enviada para: ${l.list_assignments.map(a => html`<span class="chip">${cname.get(a.class_id) || 'turma'}${a.due_at ? ` · até ${fmtDateTime(a.due_at)}` : ''}</span> `)}` : html`<span class="muted">Ainda não enviada para nenhuma turma.</span>`}</p>
              <div class="row"><button class="btn sm" type="button" data-action="openList" data-id="${l.id}">Abrir</button></div></div>`)}</div>`
            : html`<div class="empty">Nenhuma lista ainda. Crie uma e escolha questões do seu banco ou do banco geral.</div>`}</div>`);
        };

        const listForm = async l => {
          const fd = await formDialog(l ? 'Editar lista' : 'Nova lista ou simulado', html`
            <label class="f">Título<input class="input" name="title" required maxlength="120" value="${l?.title || ''}"></label>
            <label class="f">Instruções para os alunos (opcional)<textarea class="input" name="description" rows="2" maxlength="1000">${l?.description || ''}</textarea></label>
            <div class="form-grid"><label class="f">Tipo<select class="input" name="mode"><option value="lista" ${l?.mode !== 'simulado' ? 'selected' : ''}>Lista de exercícios</option><option value="simulado" ${l?.mode === 'simulado' ? 'selected' : ''}>Simulado</option></select></label>
            <label class="f">Tempo do simulado (minutos, opcional)<input class="input" name="time" type="number" min="1" max="600" value="${l?.time_limit_min || ''}"></label></div>`,
            { validate: f => String(f.get('title')).trim().length >= 2 ? null : 'Dê um título à lista.' });
          if (!fd) return null;
          const data = { title: String(fd.get('title')).trim(), description: String(fd.get('description')).trim() || null, mode: fd.get('mode'), time_limit_min: fd.get('time') ? +fd.get('time') : null };
          return l ? q(sb.from('lists').update(data).eq('id', l.id).select().single()) : q(sb.from('lists').insert(data).select().single());
        };

        const drawList = async id => {
          const [l, items, assigns, classes] = await Promise.all([
            q(sb.from('lists').select('*').eq('id', id).single()),
            q(sb.from('list_items').select('question_id, position, questions(id, code, statement, subject_id, status)').eq('list_id', id).order('position')),
            q(sb.from('list_assignments').select('*').eq('list_id', id)),
            q(sb.from('classes').select('id, name').eq('owner_id', me()).is('archived_at', null).order('name'))]);
          box.dataset.list = id;
          setHTML(box, html`<div class="stack"><div class="row between"><button class="linkbtn" type="button" data-action="back">← Todas as listas</button>
              <div class="row"><button class="btn ghost sm" type="button" data-action="editList">Editar dados</button>
              ${l.status === 'published' ? html`<button class="btn ghost sm" type="button" data-action="listStatus" data-s="draft">Voltar para rascunho</button>` : html`<button class="btn sm" type="button" data-action="listStatus" data-s="published" ${items.length ? '' : 'disabled'}>Publicar</button>`}
              <button class="btn ghost sm" type="button" data-action="delList">Excluir</button></div></div>
            <div class="card stack"><h2>${l.title}</h2><p class="muted small">${l.mode === 'simulado' ? `Simulado${l.time_limit_min ? ` de ${l.time_limit_min} min` : ''}` : 'Lista de exercícios'} · ${LIST_STATUS[l.status]}</p>${l.description ? html`<p class="pre">${l.description}</p>` : ''}
              ${l.status !== 'published' ? html`<p class="small muted">Os alunos só recebem a lista depois que ela é publicada.</p>` : ''}</div>
            <div class="card stack"><div class="row between"><h3>Questões (${items.length})</h3><button class="btn sm" type="button" data-action="addQ">Adicionar questões</button></div>
              ${items.length ? html`<ol class="stack" style="padding-left:20px">${items.map((it, i) => html`<li><div class="row between" style="flex-wrap:nowrap"><span>${it.questions?.statement.slice(0, 140) || '(questão indisponível)'} <span class="muted small mono">${it.questions?.code || ''}</span>${it.questions && it.questions.status !== 'published' ? html` <span class="chip warn">não publicada</span>` : ''}</span>
                <span class="row" style="gap:2px;flex-wrap:nowrap"><button class="btn ghost sm" type="button" data-action="up" data-i="${i}" ${i ? '' : 'disabled'} aria-label="Subir">↑</button><button class="btn ghost sm" type="button" data-action="down" data-i="${i}" ${i < items.length - 1 ? '' : 'disabled'} aria-label="Descer">↓</button><button class="btn ghost sm" type="button" data-action="rmQ" data-id="${it.question_id}" aria-label="Tirar da lista">×</button></span></div></li>`)}</ol>`
              : html`<div class="empty">Nenhuma questão. Adicione do seu banco ou do banco geral.</div>`}
              ${items.some(it => it.questions && it.questions.status !== 'published') ? html`<p class="small err">Questões em rascunho não aparecem para os alunos. Publique-as no seu banco.</p>` : ''}</div>
            <div class="card stack"><div class="row between"><h3>Turmas que recebem</h3>${classes.length ? html`<button class="btn sm" type="button" data-action="assign">Enviar para uma turma</button>` : ''}</div>
              ${assigns.length ? html`<div class="list">${assigns.map(a => html`<div class="row between"><span><b>${classes.find(c => c.id === a.class_id)?.name || 'turma'}</b> <span class="muted small">desde ${fmtDateTime(a.opens_at)}${a.due_at ? ` · prazo ${fmtDateTime(a.due_at)}` : ' · sem prazo'}</span></span><button class="btn ghost sm" type="button" data-action="unassign" data-id="${a.id}">Cancelar envio</button></div>`)}</div>`
              : html`<p class="muted small">${classes.length ? 'Ainda não enviada.' : 'Crie uma turma na aba Turmas para poder enviar.'}</p>`}</div></div>`);

          box._h = {
            ...box._h,
            back: () => { delete box.dataset.list; drawAll(); },
            editList: async () => { try { if (await listForm(l)) drawList(id); } catch (e) { toast(friendlyError(e)); } },
            async listStatus(b) { try { await q(sb.from('lists').update({ status: b.dataset.s }).eq('id', id)); toast(b.dataset.s === 'published' ? 'Lista publicada' : 'Lista voltou para rascunho'); } catch (e) { toast(friendlyError(e)); } drawList(id); },
            async delList() {
              if (!(await confirmDialog('Excluir esta lista? As respostas que os alunos já deram continuam no histórico deles.', { ok: 'Excluir', danger: true }))) return;
              try { await q(sb.from('lists').delete().eq('id', id)); toast('Lista excluída'); } catch (e) { toast(friendlyError(e)); }
              delete box.dataset.list; drawAll();
            },
            async rmQ(b) { try { await q(sb.from('list_items').delete().eq('list_id', id).eq('question_id', b.dataset.id)); } catch (e) { toast(friendlyError(e)); } drawList(id); },
            up: b => move(+b.dataset.i, -1), down: b => move(+b.dataset.i, 1),
            addQ: () => pickQuestions(id, items.map(it => it.question_id)).then(n => { if (n) drawList(id); }),
            async assign() {
              const used = new Set(assigns.map(a => a.class_id));
              const free = classes.filter(c => !used.has(c.id));
              if (!free.length) return toast('A lista já foi enviada para todas as suas turmas.');
              const fd = await formDialog('Enviar para uma turma', html`<label class="f">Turma<select class="input" name="c">${free.map(c => html`<option value="${c.id}">${c.name}</option>`)}</select></label>
                <label class="f">Prazo (opcional)<input class="input" type="datetime-local" name="due"></label>`, { ok: 'Enviar',
                validate: f => f.get('due') && new Date(f.get('due')) <= new Date() ? 'O prazo precisa ser no futuro.' : null });
              if (!fd) return;
              try { await q(sb.from('list_assignments').insert({ list_id: id, class_id: fd.get('c'), due_at: fd.get('due') ? new Date(fd.get('due')).toISOString() : null })); toast(l.status === 'published' ? 'Lista enviada para a turma' : 'Envio registrado. Publique a lista para os alunos receberem.'); } catch (e) { toast(friendlyError(e)); }
              drawList(id);
            },
            async unassign(b) { if (!(await confirmDialog('Cancelar o envio para esta turma? Os alunos deixam de ver a lista.', { ok: 'Cancelar envio', danger: true }))) return; try { await q(sb.from('list_assignments').delete().eq('id', b.dataset.id)); } catch (e) { toast(friendlyError(e)); } drawList(id); }
          };
          async function move(i, d) {
            const order = items.map(it => it.question_id); const j = i + d;
            [order[i], order[j]] = [order[j], order[i]];
            try { for (let k = 0; k < order.length; k++) await q(sb.from('list_items').update({ position: k }).eq('list_id', id).eq('question_id', order[k])); } catch (e) { toast(friendlyError(e)); }
            drawList(id);
          }
        };

        // Escolher questões: do meu banco ou do banco geral, com busca e filtros
        const pickQuestions = async (listId, already) => {
          const have = new Set(already);
          let source = 'mine', fs = '', fsub = '', fdiff = '', rows = [];
          const dlg = document.createElement('dialog'); dlg.className = 'modal'; document.body.appendChild(dlg);
          let added = 0;
          const load = async () => {
            let query = sb.from('questions').select('id, code, statement, subject_id, difficulty, status').eq('status', 'published').order('updated_at', { ascending: false }).limit(100);
            query = source === 'mine' ? query.eq('owner_id', me()) : query.eq('visibility', 'public');
            if (fsub) query = query.eq('subject_id', +fsub);
            if (fdiff) query = query.eq('difficulty', +fdiff);
            if (fs) query = query.textSearch('search', fs.split(/\s+/).filter(Boolean).map(w => norm(w)).join(' & '), { config: 'portuguese' });
            rows = await q(query);
            setHTML(dlg, html`<div class="m-body"><h2>Adicionar questões</h2><form class="row" data-f>
                <select class="input" name="src" style="max-width:170px" aria-label="De onde"><option value="mine" ${source === 'mine' ? 'selected' : ''}>Meu banco</option><option value="public" ${source === 'public' ? 'selected' : ''}>Banco geral</option></select>
                <input class="input" name="s" type="search" placeholder="Palavra-chave" value="${fs}" style="max-width:180px" aria-label="Palavra-chave">
                <select class="input" name="sub" style="max-width:170px" aria-label="Disciplina"><option value="">Todas as disciplinas</option>${cat.subjects.map(s => html`<option value="${s.id}" ${String(fsub) === String(s.id) ? 'selected' : ''}>${s.name}</option>`)}</select>
                <select class="input" name="d" style="max-width:150px" aria-label="Dificuldade"><option value="">Qualquer dificuldade</option>${Object.entries(DIFFICULTY).map(([k, v]) => html`<option value="${k}" ${String(fdiff) === k ? 'selected' : ''}>${v}</option>`)}</select>
                <button class="btn ghost" type="submit">Buscar</button></form>
              <div class="stack" style="max-height:52vh;overflow:auto;margin-top:10px">${rows.length ? rows.map(r => html`<label class="check" style="align-items:flex-start"><input type="checkbox" value="${r.id}" ${have.has(r.id) ? 'checked disabled' : ''}> <span>${r.statement.slice(0, 160)} <span class="muted small">${cat.sub(r.subject_id)?.name || ''} · ${DIFFICULTY[r.difficulty]} <span class="mono">${r.code || ''}</span></span></span></label>`) : html`<div class="empty">Nenhuma questão publicada encontrada${source === 'mine' ? ' no seu banco' : ''}.</div>`}</div></div>
              <div class="m-foot"><button class="btn ghost" type="button" data-cancel>Fechar</button><button class="btn" type="button" data-add>Adicionar selecionadas</button></div>`);
            dlg.querySelector('[data-f]').onsubmit = e => { e.preventDefault(); const fm = e.target; source = fm.src.value; fs = fm.s.value.trim(); fsub = fm.sub.value; fdiff = fm.d.value; load().catch(err => toast(friendlyError(err))); };
            dlg.querySelector('[data-cancel]').onclick = () => dlg.close();
            dlg.querySelector('[data-add]').onclick = async () => {
              const ids = [...dlg.querySelectorAll('input[type=checkbox]:checked:not(:disabled)')].map(i => i.value);
              if (!ids.length) return toast('Marque pelo menos uma questão.');
              const start = have.size;
              const { error } = await sb.from('list_items').insert(ids.map((qid, k) => ({ list_id: listId, question_id: qid, position: start + k })));
              if (error) return toast(friendlyError(error));
              ids.forEach(i => have.add(i)); added += ids.length; toast(`${ids.length} questão(ões) adicionada(s)`); load();
            };
          };
          await load();
          dlg.showModal();
          await new Promise(r => dlg.addEventListener('close', r, { once: true }));
          dlg.remove();
          return added;
        };

        box._h = { newList: async () => { try { const l = await listForm(null); if (l) drawList(l.id); } catch (e) { toast(friendlyError(e)); } }, openList: b => drawList(b.dataset.id) };
        await drawAll();
      },

      // ------------------------------------------------------------ turmas
      async turmas(box) {
        const drawAll = async () => {
          const classes = await q(sb.from('classes').select('id, name, description, join_code, is_open, archived_at, class_members(count)').eq('owner_id', me()).order('created_at', { ascending: false }));
          setHTML(box, html`<div class="stack"><div class="row end"><button class="btn" type="button" data-action="newClass">Nova turma</button></div>
            ${classes.length ? html`<div class="grid g2">${classes.map(c => html`<div class="card stack"><div class="row between"><h3>${c.name}</h3>${c.archived_at ? html`<span class="chip">Arquivada</span>` : c.is_open ? html`<span class="chip good">Aceitando alunos</span>` : html`<span class="chip warn">Fechada</span>`}</div>
              <p class="small">Código de entrada: <b class="mono" style="font-size:1.1rem;letter-spacing:.08em">${c.join_code}</b></p>
              <p class="small muted">${c.class_members?.[0]?.count || 0} participante(s)</p><div class="row"><button class="btn sm" type="button" data-action="openClass" data-id="${c.id}">Abrir</button></div></div>`)}</div>`
            : html`<div class="empty">Nenhuma turma ainda. Crie uma e passe o código para os alunos entrarem pela tela "Minhas turmas".</div>`}</div>`);
        };
        const drawClass = async id => {
          const [c, roster, results] = await Promise.all([q(sb.from('classes').select('*').eq('id', id).single()), q(sb.rpc('class_roster', { p_class: id })), q(sb.rpc('class_results', { p_class: id }))]);
          const byList = new Map();
          results.forEach(r => { if (!byList.has(r.assignment_id)) byList.set(r.assignment_id, { title: r.list_title, rows: [] }); byList.get(r.assignment_id).rows.push(r); });
          const active = roster.filter(r => r.status === 'active');
          setHTML(box, html`<div class="stack"><div class="row between"><button class="linkbtn" type="button" data-action="back">← Todas as turmas</button>
              <div class="row"><button class="btn ghost sm" type="button" data-action="toggleOpen">${c.is_open ? 'Fechar para novos alunos' : 'Abrir para novos alunos'}</button><button class="btn ghost sm" type="button" data-action="renameClass">Editar</button><button class="btn ghost sm" type="button" data-action="archiveClass">${c.archived_at ? 'Desarquivar' : 'Arquivar'}</button></div></div>
            <div class="card stack"><h2>${c.name}</h2>${c.description ? html`<p>${c.description}</p>` : ''}<p>Código para os alunos: <b class="mono" style="font-size:1.3rem;letter-spacing:.1em">${c.join_code}</b></p>
              <p class="small muted">O aluno entra em "Minhas turmas" com esse código. Você vê os resultados das listas só de quem aceitou compartilhar; anotações, flashcards e o resto do estudo continuam privados.</p></div>
            <div class="card stack"><h3>Participantes (${active.length})</h3>${roster.length ? html`<div class="table-wrap"><table class="t"><thead><tr><th>Nome</th><th>Desde</th><th>Compartilha resultados</th><th>Situação</th><th></th></tr></thead><tbody>
              ${roster.map(r => html`<tr><td><b>${r.display_name}</b></td><td class="small">${fmtDateTime(r.joined_at)}</td><td>${r.share_progress ? 'Sim' : 'Não'}</td><td>${{ active: 'Na turma', left: 'Saiu', removed: 'Removido' }[r.status]}</td>
                <td>${r.status === 'active' ? html`<button class="btn ghost sm" type="button" data-action="removeMember" data-id="${r.user_id}" data-n="${r.display_name}">Remover</button>` : r.status === 'removed' ? html`<button class="btn ghost sm" type="button" data-action="readmit" data-id="${r.user_id}">Readmitir</button>` : ''}</td></tr>`)}</tbody></table></div>`
              : html`<p class="muted small">Ninguém entrou ainda.</p>`}</div>
            <div class="card stack"><h3>Resultados das listas</h3>${byList.size ? [...byList.values()].map(g => { const done = g.rows.filter(r => r.finished_at); const avg = done.length ? Math.round(100 * done.reduce((s, r) => s + r.correct, 0) / Math.max(1, done.reduce((s, r) => s + r.total, 0))) : null;
              return html`<details class="card"><summary><b>${g.title}</b> · ${done.length} de ${g.rows.length} concluíram${avg != null ? ` · acerto médio ${avg}%` : ''}</summary><div class="table-wrap"><table class="t"><thead><tr><th>Aluno</th><th>Acertos</th><th>Concluída em</th></tr></thead><tbody>
                ${g.rows.map(r => html`<tr><td>${r.display_name}</td><td class="num">${r.total ? `${r.correct} de ${r.total}` : '–'}</td><td class="small">${r.finished_at ? fmtDateTime(r.finished_at) : r.started_at ? 'em andamento' : 'não começou'}</td></tr>`)}</tbody></table></div></details>`; })
              : html`<p class="muted small">Envie uma lista para esta turma na aba "Listas e simulados".</p>`}</div></div>`);
          box._h = {
            ...box._h,
            back: () => drawAll(),
            async toggleOpen() { try { await q(sb.from('classes').update({ is_open: !c.is_open }).eq('id', id)); } catch (e) { toast(friendlyError(e)); } drawClass(id); },
            async archiveClass() { try { await q(sb.from('classes').update({ archived_at: c.archived_at ? null : new Date().toISOString() }).eq('id', id)); } catch (e) { toast(friendlyError(e)); } drawClass(id); },
            async renameClass() { const v = await classForm(c); if (v) { try { await q(sb.from('classes').update(v).eq('id', id)); } catch (e) { toast(friendlyError(e)); } drawClass(id); } },
            async removeMember(b) { if (!(await confirmDialog(`Remover ${b.dataset.n} da turma? A pessoa deixa de ver as listas desta turma e não consegue voltar sozinha.`, { ok: 'Remover', danger: true }))) return; try { await q(sb.from('class_members').update({ status: 'removed' }).eq('class_id', id).eq('user_id', b.dataset.id)); } catch (e) { toast(friendlyError(e)); } drawClass(id); },
            async readmit(b) { try { await q(sb.from('class_members').update({ status: 'active' }).eq('class_id', id).eq('user_id', b.dataset.id)); } catch (e) { toast(friendlyError(e)); } drawClass(id); }
          };
        };
        const classForm = async c => {
          const fd = await formDialog(c ? 'Editar turma' : 'Nova turma', html`<label class="f">Nome<input class="input" name="name" required maxlength="80" value="${c?.name || ''}" placeholder="Ex.: 3º ano A, Turma ENEM manhã"></label><label class="f">Descrição (opcional)<input class="input" name="description" maxlength="500" value="${c?.description || ''}"></label>`,
            { validate: f => String(f.get('name')).trim().length >= 2 ? null : 'Dê um nome à turma.' });
          return fd ? { name: String(fd.get('name')).trim(), description: String(fd.get('description')).trim() || null } : null;
        };
        box._h = {
          async newClass() { const v = await classForm(null); if (!v) return; try { const c = await q(sb.from('classes').insert(v).select().single()); toast('Turma criada'); drawClass(c.id); } catch (e) { toast(friendlyError(e)); } },
          openClass: b => drawClass(b.dataset.id)
        };
        await drawAll();
      },

      // ------------------------------------------------------------ pedidos
      async pedidos(box) {
        const rows = await q(sb.from('correction_requests').select('id, message, status, response, created_at, resolved_at, questions(code, statement)').eq('requested_by', me()).order('created_at', { ascending: false }));
        setHTML(box, html`<div class="stack"><p class="muted small">Questões do banco geral só são alteradas pela equipe. Use "Pedir correção" na questão; a resposta aparece aqui.</p>
          ${rows.length ? rows.map(r => html`<div class="card stack"><div class="row between"><b class="mono">${r.questions?.code || ''}</b><span class="chip ${r.status === 'open' ? 'warn' : 'good'}">${{ open: 'Aguardando', resolved: 'Resolvido', rejected: 'Recusado' }[r.status]}</span></div>
            <p class="small muted">${(r.questions?.statement || '').slice(0, 160)}</p><p class="pre">${r.message}</p>${r.response ? html`<p class="small"><b>Resposta da equipe:</b> ${r.response}</p>` : ''}<p class="small muted">${fmtDateTime(r.created_at)}</p></div>`) : html`<div class="empty">Nenhum pedido de correção.</div>`}</div>`);
      }
    };

    async function askCorrection(questionId) {
      const fd = await formDialog('Pedir correção ao administrador', html`<label class="f">O que precisa ser corrigido?<textarea class="input" name="m" rows="4" required maxlength="2000" placeholder="Ex.: a alternativa C também está correta porque..."></textarea></label>`,
        { ok: 'Enviar pedido', validate: f => String(f.get('m')).trim().length >= 5 ? null : 'Descreva o problema.' });
      if (!fd) return;
      const { error } = await sb.from('correction_requests').insert({ question_id: questionId, message: String(fd.get('m')).trim() });
      toast(error ? friendlyError(error) : 'Pedido enviado. Acompanhe na aba Pedidos de correção.');
    }

    el.addEventListener('click', e => {
      const b = e.target.closest('[data-action]'); const box = $('#prof', el);
      if (b && box?._h?.[b.dataset.action] && !b.closest('dialog')) box._h[b.dataset.action](b, e);
    });
    await shell();
  }
};

