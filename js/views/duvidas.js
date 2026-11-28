// Fale conosco: o usuário escreve para o PROFESSOR (dúvidas de conteúdo) ou para o
// DESENVOLVEDOR (erros na plataforma e sugestões). A administração responde pelo painel.
// Pode vir ligada a uma aula (#duvidas/nova/aula/<id>), a uma questão (#duvidas/nova/questao/<id>)
// ou ser um relato de erro (#duvidas/erro/<tela onde estava>).
import { html, setHTML, actions, toast, friendlyError, fmtDateTime, norm, plainText } from '../core/util.js';
import * as controles from '../core/controles.js';
import * as auth from '../core/auth.js';
import { registrar } from '../core/atividade.js';
import { sb } from '../core/backend.js';
import { catalog } from '../core/conteudo.js';
import * as store from '../core/store.js';

const STATUS = { aberta: ['Aguardando resposta', 'warn'], respondida: ['Respondida', 'good'], fechada: ['Encerrada', ''] };
const PARA = { professor: 'Professor', desenvolvedor: 'Desenvolvedor' };
const TIPO = { duvida: 'Dúvida', erro: 'Relatar erro', sugestao: 'Sugestão' };

export default {
  title: 'Fale conosco',
  async render(el, params) {
    const cat = await catalog();
    const ctxTipo = params[0] === 'nova' ? params[1] : null, ctxId = params[2] || null;
    const soDev = controles.isBlocked('duvidas');   // dúvidas desligadas: ainda pode relatar erro ao desenvolvedor
    let para = params[0] === 'erro' || soDev ? 'desenvolvedor' : 'professor', tipo = params[0] === 'erro' ? 'erro' : 'duvida';
    const paginaErro = params[0] === 'erro' ? decodeURIComponent(params.slice(1).join('/')).slice(0, 200) : '';
    let ligado = null;
    if (ctxTipo === 'aula') ligado = (await store.meta.get('aulas:lista', [])).find(l => l.id === ctxId);
    if (ctxTipo === 'questao') ligado = cat.question(ctxId);

    const draw = async () => {
      if (!sb) { setHTML(el, html`<div class="card"><h1>Fale conosco</h1><p class="muted">As mensagens para o professor e o desenvolvedor funcionam quando a plataforma está ligada ao servidor, com uma conta. Nesta prévia local elas ficam desligadas.</p></div>`); return; }
      if (!navigator.onLine) { setHTML(el, html`<div class="card"><h1>Fale conosco</h1><p class="muted">Para enviar e ver as respostas, conecte-se à internet.</p></div>`); return; }
      let { data, error } = await sb.from('doubts').select('id, subject_id, lesson_id, question_id, body, status, answer, answered_at, seen_at, created_at, recipient, kind, page').order('created_at', { ascending: false }).limit(100);
      if (error && /recipient|kind|page|column/i.test(error.message || '')) ({ data, error } = await sb.from('doubts').select('id, subject_id, lesson_id, question_id, body, status, answer, answered_at, seen_at, created_at').order('created_at', { ascending: false }).limit(100));
      if (error) { setHTML(el, html`<div class="card"><h1>Fale conosco</h1><p class="err">${friendlyError(error)}</p></div>`); return; }
      const novasRespostas = data.filter(d => d.status === 'respondida' && !d.seen_at);
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Professor ou desenvolvedor</span><h1>Fale conosco</h1><p>Dúvida de conteúdo? Escreva para o <b>professor</b>. Algo não funcionou ou tem uma ideia para a plataforma? Escreva para o <b>desenvolvedor</b>. A resposta aparece nesta tela.</p></div></div>
        <form class="card stack" id="nova">
          <h2>Nova mensagem</h2>
          <div class="form-grid">
            <label class="f">Para quem<select class="input" name="para">${Object.entries(PARA).filter(([k]) => !(soDev && k === 'professor')).map(([k, n]) => html`<option value="${k}" ${para === k ? 'selected' : ''}>${n}</option>`)}</select></label>
            <label class="f">Assunto<select class="input" name="tipo">${Object.entries(TIPO).map(([k, n]) => html`<option value="${k}" ${tipo === k ? 'selected' : ''}>${n}</option>`)}</select></label>
          </div>
          ${paginaErro ? html`<p class="banner small">Relato de erro na tela <b>${paginaErro}</b>. Conte o que você fez e o que aconteceu.</p>` : ''}
          ${ligado ? html`<p class="banner small">Sobre ${ctxTipo === 'aula' ? html`a aula <b>${ligado.title}</b>` : html`a questão <b>${ligado.code || ''}</b>: ${plainText(ligado.statement).slice(0, 140)}…`}</p>` : ''}
          <div class="form-grid">
            <label class="f">Matéria<select class="input" name="subject"><option value="">Escolha (opcional)</option>${cat.subjects.map(s => html`<option value="${s.id}" ${ligado?.subject_id === s.id ? 'selected' : ''}>${s.name}</option>`)}</select></label>
          </div>
          <label class="f">Mensagem<textarea class="input" name="body" rows="5" minlength="5" maxlength="4000" required placeholder="${para === 'desenvolvedor' ? 'Ex.: Na tela de Questões, ao tocar em Confirmar, nada acontece. Uso celular Android.' : 'Ex.: Na questão de juros compostos, não entendi por que multiplica 1,1 duas vezes…'}"></textarea></label>
          <div id="assist" class="stack" aria-live="polite"></div>
          <div class="row"><button class="btn ghost" type="button" data-action="buscar">Procurar explicação agora</button><button class="btn" type="submit">Enviar</button></div>
        </form>
        <section class="stack"><h2>Minhas mensagens</h2>
          ${data.length ? data.map(d => html`<article class="card stack ${novasRespostas.includes(d) ? 'q-new' : ''}">
            <div class="row between"><span class="q-meta">${d.recipient ? html`<span class="chip">${d.recipient === 'desenvolvedor' ? 'para o desenvolvedor' : 'para o professor'}</span>` : ''}${d.kind && d.kind !== 'duvida' ? html`<span class="chip">${TIPO[d.kind]}</span>` : ''}${d.subject_id ? html`<span class="chip">${cat.subject(d.subject_id)?.name || ''}</span>` : ''}<span class="chip ${STATUS[d.status][1]}">${STATUS[d.status][0]}</span>${novasRespostas.includes(d) ? html`<span class="chip on">resposta nova</span>` : ''}</span><span class="muted small">${fmtDateTime(d.created_at)}</span></div>
            <p class="pre">${d.body}</p>
            ${d.answer ? html`<div class="banner good stack"><b>Resposta ${d.recipient === 'desenvolvedor' ? 'do desenvolvedor' : 'do professor'}</b><p class="pre">${d.answer}</p><span class="muted small">${d.answered_at ? fmtDateTime(d.answered_at) : ''}</span></div>` : ''}
            <div class="row">${d.lesson_id ? html`<a class="btn ghost sm" href="#aulas/${d.lesson_id}">Ver a aula</a>` : ''}${d.status !== 'fechada' ? html`<button class="btn ghost sm" type="button" data-action="fechar" data-id="${d.id}">${d.status === 'respondida' ? 'Entendi, encerrar' : 'Cancelar dúvida'}</button>` : ''}</div>
          </article>`) : html`<div class="empty">Você ainda não enviou mensagens.</div>`}
        </section>
      </div>`);
      if (novasRespostas.length) sb.from('doubts').update({ seen_at: new Date().toISOString() }).in('id', novasRespostas.map(d => d.id)).then(() => {});
      const f = el.querySelector('#nova');
      f.body.addEventListener('input', () => { if (f.para.value !== 'professor') return; clearTimeout(f._t); f._t = setTimeout(() => assistente(f.body.value), 600); });
      f.para.onchange = () => { para = f.para.value; if (para === 'desenvolvedor' && tipo === 'duvida') { tipo = 'erro'; f.tipo.value = 'erro'; } };
      f.tipo.onchange = () => { tipo = f.tipo.value; };
      f.onsubmit = async e => {
        e.preventDefault();
        const body = f.body.value.trim(); if (body.length < 5) return toast('Escreva um pouco mais.');
        const row = { body, subject_id: f.subject.value ? +f.subject.value : null, lesson_id: ctxTipo === 'aula' ? ctxId : null, question_id: ctxTipo === 'questao' ? ctxId : null,
          recipient: f.para.value, kind: f.tipo.value, page: paginaErro || null, device: f.tipo.value === 'erro' ? `${auth.platform()} · ${navigator.userAgent}`.slice(0, 200) : null };
        let { error: e2 } = await sb.from('doubts').insert(row);
        // servidor ainda sem as colunas novas: envia como dúvida comum, com o destino no texto
        if (e2 && /recipient|kind|page|device|column/i.test(e2.message || '')) ({ error: e2 } = await sb.from('doubts').insert({ body: `[${PARA[row.recipient]} · ${TIPO[row.kind]}${row.page ? ' · tela ' + row.page : ''}] ${body}`.slice(0, 4000), subject_id: row.subject_id, lesson_id: row.lesson_id, question_id: row.question_id }));
        if (e2) return toast(friendlyError(e2));
        registrar('mensagem.enviar', row.recipient, { tipo: row.kind });
        toast('Mensagem enviada! Você verá a resposta aqui.');
        if (ctxTipo || paginaErro) history.replaceState(null, '', '#duvidas');
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
        ${top.map(q => html`<details class="card"><summary><b>${q.theme || cat.topic(q.topic_id)?.name || 'Explicação'}</b> <span class="muted small">· ${cat.subject(q.subject_id)?.name || ''}</span></summary><p class="small" style="margin-top:6px">${plainText(q.statement).slice(0, 600)}</p><p class="small" style="margin-top:6px"><b>Resposta:</b> ${plainText(q.options.find(o => o.is_correct)?.body || '')}</p><p class="small pre" style="margin-top:6px">${q.explanation}</p></details>`)}</div>` : '');
    };
    actions(el, {
      buscar() { const t = el.querySelector('#nova textarea')?.value || ''; assistente(t); if (!el.querySelector('#assist')?.children.length) toast('Não achei uma explicação parecida. Envie para a professora.'); },
      async fechar(b) { const { error } = await sb.from('doubts').update({ status: 'fechada' }).eq('id', b.dataset.id); if (error) toast(friendlyError(error)); draw(); }
    });
    await draw();
  }
};
