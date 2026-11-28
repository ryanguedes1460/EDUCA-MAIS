// Minhas turmas (aluno): entrar numa turma pelo código, escolher se o professor
// vê os resultados, sair da turma e fazer as listas e simulados recebidos.
// As listas abertas uma vez com internet ficam guardadas no aparelho e podem
// ser feitas sem internet (as respostas sobem na próxima sincronização).
import { html, setHTML, actions, toast, friendlyError, fmtDateTime, confirmDialog, plural } from '../core/util.js';
import * as store from '../core/store.js';
import { sb } from '../core/backend.js';
import * as auth from '../core/auth.js';
import { emit } from '../core/bus.js';

const CACHE = 'turmas:cache';

/** Baixa as questões das listas recebidas e guarda no aparelho (uso offline). */
export async function cacheLists(assignments) {
  const listIds = [...new Set(assignments.map(a => a.list_id))];
  if (!listIds.length) return;
  const { data: items, error } = await sb.from('list_items').select('list_id, question_id, position').in('list_id', listIds).order('position');
  if (error) throw error;
  const qids = [...new Set(items.map(i => i.question_id))];
  for (let i = 0; i < qids.length; i += 100) {
    const { data, error: e2 } = await sb.from('questions')
      .select('id, code, subject_id, topic_id, level, difficulty, board_id, year, qtype, theme, statement, image_path, image_alt, explanation, hint, source, status, visibility, updated_at, question_options(id, question_id, position, body, is_correct)')
      .in('id', qids.slice(i, i + 100)).eq('status', 'published');
    if (e2) throw e2;
    if (data.length) await store.putRaw('questions', data.map(q => ({ ...q, options: (q.question_options || []).sort((a, b) => a.position - b.position), question_options: undefined })));
  }
  for (const id of listIds) await store.meta.set('list:' + id, items.filter(i => i.list_id === id).map(i => i.question_id));
  emit('content:change');
}

/** Turmas e listas: busca no servidor quando há internet, senão usa a última cópia. */
export async function loadMine() {
  if (navigator.onLine && sb && auth.isLogged()) {
    const [c, a] = await Promise.all([sb.rpc('my_classes'), sb.rpc('my_assignments')]);
    if (c.error) throw c.error; if (a.error) throw a.error;
    const data = { classes: c.data, assignments: a.data, at: new Date().toISOString() };
    await store.meta.set(CACHE, data);
    await cacheLists(a.data).catch(e => console.warn('listas offline', e));
    return { ...data, online: true };
  }
  return { ...(await store.meta.get(CACHE, { classes: [], assignments: [], at: null })), online: false };
}

export default {
  title: 'Minhas turmas',
  async render(el) {
    async function draw() {
      let d;
      try { d = await loadMine(); } catch (e) { setHTML(el, html`<div class="card"><h1>Minhas turmas</h1><p class="err">${friendlyError(e)}</p></div>`); return; }
      const attempts = (await store.all('exam_attempts')).filter(x => x.assignment_id);
      const stateOf = a => {
        const mine = attempts.filter(x => x.assignment_id === a.assignment_id).sort((x, y) => (y.started_at || '').localeCompare(x.started_at || ''));
        const open = mine.find(x => !x.finished_at), done = mine.find(x => x.finished_at);
        return { open, done };
      };
      const late = a => a.due_at && new Date(a.due_at) < new Date();
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Escola</span><h1>Minhas turmas</h1>
          <p>Entre na turma com o código que o professor passou. As listas e simulados enviados por ele aparecem aqui.</p></div></div>
        ${d.online ? '' : html`<p class="card small muted">Sem internet: mostrando a última cópia${d.at ? ` (${fmtDateTime(d.at)})` : ''}. Listas já abertas podem ser feitas normalmente.</p>`}
        <form class="card row" id="joinForm" style="align-items:flex-end">
          <label class="f" style="flex:1;min-width:180px">Código da turma<input class="input" name="code" maxlength="12" required autocomplete="off" placeholder="Ex.: 3FA9C21B" style="text-transform:uppercase"></label>
          <button class="btn" type="submit" ${d.online ? '' : 'disabled'}>Entrar na turma</button>
        </form>
        <section class="stack" aria-labelledby="hLists"><h2 id="hLists">Listas e simulados</h2>
          ${d.assignments.length ? html`<div class="stack">${d.assignments.map(a => { const s = stateOf(a); return html`
            <div class="card row between" style="align-items:flex-start">
              <div style="flex:1;min-width:200px"><div class="q-meta"><span class="chip on">${a.mode === 'simulado' ? 'Simulado' : 'Lista'}</span><span class="chip">${a.class_name}</span><span class="chip">${plural(+a.n_questions, 'questão', 'questões')}</span>${a.time_limit_min ? html`<span class="chip">${a.time_limit_min} min</span>` : ''}
                ${s.done ? html`<span class="chip good">Feita: ${s.done.correct}/${s.done.total}</span>` : s.open ? html`<span class="chip">Em andamento</span>` : late(a) ? html`<span class="chip bad">Prazo encerrado</span>` : ''}</div>
                <h3 style="margin-top:6px">${a.title}</h3>${a.description ? html`<p class="muted small pre">${a.description}</p>` : ''}
                <p class="muted small">${a.due_at ? `Entregar até ${fmtDateTime(a.due_at)}` : 'Sem prazo'}</p></div>
              <div class="row">${+a.n_questions ? html`<button class="btn sm" type="button" data-action="start" data-id="${a.assignment_id}">${s.open ? 'Continuar' : s.done ? 'Fazer de novo' : 'Começar'}</button>` : html`<span class="muted small">Lista vazia</span>`}</div>
            </div>`; })}</div>` : html`<div class="empty">Nenhuma lista recebida ainda.</div>`}
        </section>
        <section class="stack" aria-labelledby="hClasses"><h2 id="hClasses">Turmas</h2>
          ${d.classes.length ? html`<div class="grid g2">${d.classes.map(c => html`<div class="card stack">
            <h3>${c.name}</h3><p class="muted small">Professor(a): ${c.teacher_name || '—'}${c.description ? ` · ${c.description}` : ''}</p>
            <label class="check"><input type="checkbox" data-onchange="share" data-id="${c.class_id}" ${c.share_progress ? 'checked' : ''} ${d.online ? '' : 'disabled'}> Deixar o professor ver meus resultados nas listas desta turma</label>
            <p class="muted small">${c.share_progress ? 'O professor vê sua nota e quando você fez cada lista.' : 'O professor não vê seus resultados. Você pode mudar quando quiser.'}</p>
            <div><button class="btn ghost sm" type="button" data-action="leave" data-id="${c.class_id}" ${d.online ? '' : 'disabled'}>Sair da turma</button></div></div>`)}</div>`
          : html`<div class="empty">Você ainda não está em nenhuma turma.</div>`}
        </section></div>`);
      const f = el.querySelector('#joinForm');
      f.onsubmit = async e => {
        e.preventDefault();
        const { error } = await sb.rpc('join_class', { p_code: f.code.value.trim() });
        if (error) toast(friendlyError(error)); else { toast('Você entrou na turma'); draw(); }
      };
    }

    actions(el, {
      start(b) { location.hash = `#questoes/lista/${b.dataset.id}`; },
      async share(b) {
        const on = b.checked;
        const { error } = await sb.from('class_members').update({ share_progress: on }).eq('class_id', b.dataset.id).eq('user_id', auth.state.user.id);
        if (error) { b.checked = !on; toast(friendlyError(error)); } else { toast(on ? 'O professor passa a ver seus resultados' : 'Seus resultados ficam só com você'); draw(); }
      },
      async leave(b) {
        if (!(await confirmDialog('Sair desta turma? As listas dela deixam de aparecer. Suas respostas continuam no seu histórico.', { ok: 'Sair da turma', danger: true }))) return;
        const { error } = await sb.from('class_members').update({ status: 'left' }).eq('class_id', b.dataset.id).eq('user_id', auth.state.user.id);
        if (error) toast(friendlyError(error)); else { toast('Você saiu da turma'); draw(); }
      }
    }, ['click', 'change']);
    await draw();
  }
};
