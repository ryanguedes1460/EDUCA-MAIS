// Tirar dúvidas: o aluno escreve a dúvida e a professora (administração) responde pelo painel.
// Pode vir ligada a uma aula (#duvidas/nova/aula/<id>) ou a uma questão (#duvidas/nova/questao/<id>).
import { html, setHTML, actions, toast, friendlyError, fmtDateTime, norm } from '../core/util.js';
import { sb } from '../core/backend.js';
import { catalog } from '../core/conteudo.js';
import * as store from '../core/store.js';

const STATUS = { aberta: ['Aguardando resposta', 'warn'], respondida: ['Respondida', 'good'], fechada: ['Encerrada', ''] };

export default {
  title: 'Tirar dúvidas',
  async render(el, params) {
    const cat = await catalog();
    const ctxTipo = params[0] === 'nova' ? params[1] : null, ctxId = params[2] || null;
    let ligado = null;
    if (ctxTipo === 'aula') ligado = (await store.meta.get('aulas:lista', [])).find(l => l.id === ctxId);
    if (ctxTipo === 'questao') ligado = cat.question(ctxId);

    const draw = async () => {
      if (!navigator.onLine) { setHTML(el, html`<div class="card"><h1>Tirar dúvidas</h1><p class="muted">Para enviar e ver as respostas, conecte-se à internet.</p></div>`); return; }
      const { data, error } = await sb.from('doubts').select('id, subject_id, lesson_id, question_id, body, status, answer, answered_at, seen_at, created_at').order('created_at', { ascending: false }).limit(100);
      if (error) { setHTML(el, html`<div class="card"><h1>Tirar dúvidas</h1><p class="err">${friendlyError(error)}</p></div>`); return; }
      const novasRespostas = data.filter(d => d.status === 'respondida' && !d.seen_at);
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Fale com a professora</span><h1>Tirar dúvidas</h1><p>Escreva sua dúvida com calma, explicando onde travou. A professora responde por aqui e você recebe a resposta nesta tela.</p></div></div>
        <form class="card stack" id="nova">
          <h2>Nova dúvida</h2>
          ${ligado ? html`<p class="banner small">Sobre ${ctxTipo === 'aula' ? html`a aula <b>${ligado.title}</b>` : html`a questão <b>${ligado.code || ''}</b>: ${String(ligado.statement).slice(0, 140)}…`}</p>` : ''}
          <div class="form-grid">
            <label class="f">Matéria<select class="input" name="subject"><option value="">Escolha (opcional)</option>${cat.subjects.map(s => html`<option value="${s.id}" ${ligado?.subject_id === s.id ? 'selected' : ''}>${s.name}</option>`)}</select></label>
          </div>
          <label class="f">Sua dúvida<textarea class="input" name="body" rows="5" minlength="5" maxlength="4000" required placeholder="Ex.: Na questão de juros compostos, não entendi por que multiplica 1,1 duas vezes…"></textarea></label>
          <div id="assist" class="stack" aria-live="polite"></div>
          <div class="row"><button class="btn ghost" type="button" data-action="buscar">Procurar explicação agora</button><button class="btn" type="submit">Enviar para a professora</button></div>
        </form>
        <section class="stack"><h2>Minhas dúvidas</h2>
          ${data.length ? data.map(d => html`<article class="card stack ${novasRespostas.includes(d) ? 'q-new' : ''}">
            <div class="row between"><span class="q-meta">${d.subject_id ? html`<span class="chip">${cat.subject(d.subject_id)?.name || ''}</span>` : ''}<span class="chip ${STATUS[d.status][1]}">${STATUS[d.status][0]}</span>${novasRespostas.includes(d) ? html`<span class="chip on">resposta nova</span>` : ''}</span><span class="muted small">${fmtDateTime(d.created_at)}</span></div>
            <p class="pre">${d.body}</p>
            ${d.answer ? html`<div class="banner good stack"><b>Resposta da professora</b><p class="pre">${d.answer}</p><span class="muted small">${d.answered_at ? fmtDateTime(d.answered_at) : ''}</span></div>` : ''}
            <div class="row">${d.lesson_id ? html`<a class="btn ghost sm" href="#aulas/${d.lesson_id}">Ver a aula</a>` : ''}${d.status !== 'fechada' ? html`<button class="btn ghost sm" type="button" data-action="fechar" data-id="${d.id}">${d.status === 'respondida' ? 'Entendi, encerrar' : 'Cancelar dúvida'}</button>` : ''}</div>
          </article>`) : html`<div class="empty">Você ainda não enviou dúvidas.</div>`}
        </section>
      </div>`);
      if (novasRespostas.length) sb.from('doubts').update({ seen_at: new Date().toISOString() }).in('id', novasRespostas.map(d => d.id)).then(() => {});
      const f = el.querySelector('#nova');
      f.body.addEventListener('input', () => { clearTimeout(f._t); f._t = setTimeout(() => assistente(f.body.value), 600); });
      f.onsubmit = async e => {
        e.preventDefault();
        const body = f.body.value.trim(); if (body.length < 5) return toast('Escreva um pouco mais sobre a dúvida.');
        const row = { body, subject_id: f.subject.value ? +f.subject.value : null, lesson_id: ctxTipo === 'aula' ? ctxId : null, question_id: ctxTipo === 'questao' ? ctxId : null };
        const { error: e2 } = await sb.from('doubts').insert(row);
        if (e2) return toast(friendlyError(e2));
        toast('Dúvida enviada! Você verá a resposta aqui.');
        if (ctxTipo) history.replaceState(null, '', '#duvidas');
        ligado = null; params = []; draw();
      };
    };
    // Assistente gratuito: procura no banco de questões explicações parecidas com a dúvida
    const PARE = new Set(['como', 'para', 'porque', 'por', 'que', 'qual', 'quais', 'nao', 'entendi', 'sobre', 'uma', 'um', 'uns', 'umas', 'com', 'sem', 'isso', 'esse', 'essa', 'esta', 'este', 'questao', 'duvida', 'professora', 'fazer', 'faz', 'tem', 'ter', 'mais', 'menos', 'muito', 'quando', 'onde', 'pois', 'mas', 'aula', 'dos', 'das', 'nos', 'nas', 'ele', 'ela', 'voce', 'minha', 'meu']);
    const assistente = texto => {
      const box = el.querySelector('#assist'); if (!box) return;
      const ws = norm(texto).replace(/[^a-z0-9 ]/g, ' ').split(/\s+/).filter(w => w.length > 3 && !PARE.has(w));
      if (ws.length < 1) { setHTML(box, ''); return; }
      const score = q => { const t = norm([q.theme, cat.topic(q.topic_id)?.name, q.statement, q.explanation].join(' ')); return ws.reduce((a, w) => a + (t.includes(w) ? 1 : 0), 0); };
      const top = cat.bank.map(q => [q, score(q)]).filter(([, s]) => s >= Math.min(2, ws.length)).sort((a, b) => b[1] - a[1]).slice(0, 3).map(([q]) => q);
      setHTML(box, top.length ? html`<div class="banner stack"><b>Assistente Educa Mais: talvez isto ajude</b><span class="muted small">Encontrei explicações parecidas no banco de questões. Se ainda tiver dúvida, envie para a professora.</span>
        ${top.map(q => html`<details class="card"><summary><b>${q.theme || cat.topic(q.topic_id)?.name || 'Explicação'}</b> <span class="muted small">· ${cat.subject(q.subject_id)?.name || ''}</span></summary><p class="small" style="margin-top:6px">${q.statement}</p><p class="small" style="margin-top:6px"><b>Resposta:</b> ${q.options.find(o => o.is_correct)?.body || ''}</p><p class="small pre" style="margin-top:6px">${q.explanation}</p></details>`)}</div>` : '');
    };
    actions(el, {
      buscar() { const t = el.querySelector('#nova textarea')?.value || ''; assistente(t); if (!el.querySelector('#assist')?.children.length) toast('Não achei uma explicação parecida. Envie para a professora.'); },
      async fechar(b) { const { error } = await sb.from('doubts').update({ status: 'fechada' }).eq('id', b.dataset.id); if (error) toast(friendlyError(error)); draw(); }
    });
    await draw();
  }
};
