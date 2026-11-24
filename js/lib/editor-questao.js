// Editor de questão compartilhado pelo painel do professor e pela administração.
// Quem pode salvar o quê é decidido no banco (função save_question e regras RLS).
import { html, setHTML, toast, formDialog, confirmDialog, friendlyError, fmtDateTime, uuid } from '../core/util.js';
import { sb } from '../core/backend.js';
import * as auth from '../core/auth.js';
import { LEVELS, DIFFICULTY, QTYPES } from '../core/conteudo.js';

export const STATUS_Q = { draft: 'Rascunho', published: 'Publicada', archived: 'Arquivada' };
export const VISIBILITY = { private: 'Privada (só meu banco)', pending_public: 'Aguardando entrada no banco geral', public: 'Banco geral da plataforma' };

async function q(promise) { const { data, error } = await promise; if (error) throw error; return data; }

/** Carrega o catálogo usado nos formulários. */
export async function loadCatalog() {
  const [areas, subjects, topics, boards] = await Promise.all([q(sb.from('areas').select('*').order('position')), q(sb.from('subjects').select('*').order('position')), q(sb.from('topics').select('*').order('name')), q(sb.from('exam_boards').select('*').order('name'))]);
  return { areas, subjects, topics, boards, sub: id => subjects.find(s => s.id === id) };
}

/** Mostra as versões guardadas de uma questão (quem alterou, quando e o que ficou). */
export async function showRevisions(id) {
  const revs = await q(sb.from('question_revisions').select('version, snapshot, changed_by, changed_at').eq('question_id', id).order('version', { ascending: false }).limit(50));
  const ids = [...new Set(revs.map(r => r.changed_by).filter(Boolean))];
  const names = new Map(ids.length ? (await q(sb.from('profiles').select('id, display_name').in('id', ids))).map(p => [p.id, p.display_name]) : []);
  await formDialog('Versões da questão', html`<div class="stack" style="max-height:60vh;overflow:auto">${revs.map(r => html`<details class="card"><summary><b>Versão ${r.version}</b> · ${names.get(r.changed_by) || 'sistema'} · ${fmtDateTime(r.changed_at)}</summary>
      <p class="pre small">${r.snapshot.statement}</p><ol type="A" class="small">${(r.snapshot.options || []).map(o => html`<li>${o.is_correct ? html`<b>${o.body} (correta)</b>` : o.body}</li>`)}</ol>
      <p class="muted small">Situação: ${STATUS_Q[r.snapshot.status] || r.snapshot.status} · ${VISIBILITY[r.snapshot.visibility] || ''}</p></details>`)}</div>`, { ok: 'Fechar' });
}

/**
 * Abre o editor. Devolve true se salvou ou excluiu.
 * staff = equipe da plataforma (pode escolher a visibilidade e editar qualquer questão).
 */
export async function editQuestion({ id = null, cat, staff = false }) {
  const qq = id ? await q(sb.from('questions').select('*, question_options(*)').eq('id', id).single())
    : { level: 'enem', difficulty: 2, qtype: 'multiple_choice', status: 'draft', visibility: staff ? 'public' : 'private', question_options: [] };
  const opts = (qq.question_options || []).sort((a, b) => a.position - b.position);
  while (opts.length < (qq.qtype === 'true_false' ? 2 : 4)) opts.push({ id: '', body: '', is_correct: false });
  const topicsFor = sid => cat.topics.filter(t => t.subject_id === +sid);
  let owner = '';
  if (id && staff && qq.owner_id) owner = (await q(sb.from('profiles').select('display_name').eq('id', qq.owner_id).maybeSingle()))?.display_name || '';
  let changed = false;

  // Troca de disciplina atualiza os conteúdos; botões de excluir e de versões
  const onDlg = e => {
    const s = e.target.closest('dialog [data-sub]');
    if (s && e.type === 'change') { const t = s.closest('form').querySelector('[data-top]'); setHTML(t, html`<option value="">Nenhum</option>${topicsFor(s.value).map(x => html`<option value="${x.id}">${x.parent_id ? '— ' : ''}${x.name}</option>`)}`); }
    if (e.type !== 'click') return;
    if (e.target.closest('dialog [data-revs]')) showRevisions(id).catch(err => toast(friendlyError(err)));
    const d = e.target.closest('dialog [data-delq]');
    if (d) (async () => {
      if (!(await confirmDialog('Excluir esta questão definitivamente?', { ok: 'Excluir', danger: true }))) return;
      const { error } = await sb.from('questions').delete().eq('id', id);
      if (error) toast(/foreign key|restrict|violates/i.test(error.message) ? 'Esta questão já foi respondida ou está numa lista. Arquive em vez de excluir.' : friendlyError(error));
      else { toast('Questão excluída'); changed = true; d.closest('dialog').close(); }
    })();
  };
  document.addEventListener('change', onDlg); document.addEventListener('click', onDlg);
  try {
    const fd = await formDialog(id ? `Editar questão ${qq.code || ''}` : 'Nova questão', html`
      ${owner ? html`<p class="small muted">Banco de: <b>${owner}</b>. Sua alteração fica registrada com o seu nome.</p>` : ''}
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
      ${qq.image_path ? html`<label class="check"><input type="checkbox" name="rmimg"> Remover a imagem atual</label>` : ''}
      <fieldset class="stack" style="border:1px solid var(--line);border-radius:10px;padding:12px"><legend class="f">Alternativas (marque a correta)</legend>
        ${[...Array(6)].map((_, i) => { const o = opts[i] || { id: '', body: '', is_correct: false }; return html`<div class="row" style="flex-wrap:nowrap"><input type="radio" name="correct" value="${i}" ${o.is_correct ? 'checked' : ''} aria-label="Alternativa ${'ABCDEF'[i]} é a correta"><input type="hidden" name="oid${i}" value="${o.id || ''}"><input class="input" name="opt${i}" maxlength="2000" value="${o.body || ''}" placeholder="Alternativa ${'ABCDEF'[i]}${i >= 2 ? ' (opcional)' : ''}"></div>`; })}
      </fieldset>
      <label class="f">Resolução (explicação)<textarea class="input" name="explanation" rows="3" required maxlength="8000">${qq.explanation || ''}</textarea></label>
      <label class="f">Dica do tutor (sem entregar a resposta)<textarea class="input" name="hint" rows="2" maxlength="1000">${qq.hint || ''}</textarea></label>
      <label class="f">Referência ou fonte<input class="input" name="source" maxlength="300" value="${qq.source || ''}"></label>
      <div class="form-grid">
        <label class="f">Situação<select class="input" name="status">${Object.entries(STATUS_Q).map(([k, v]) => html`<option value="${k}" ${qq.status === k ? 'selected' : ''}>${v}</option>`)}</select></label>
        ${staff ? html`<label class="f">Onde fica<select class="input" name="visibility">${Object.entries(VISIBILITY).filter(([k]) => k !== 'pending_public' || qq.visibility === 'pending_public').map(([k, v]) => html`<option value="${k}" ${qq.visibility === k ? 'selected' : ''}>${v}</option>`)}</select></label>`
          : html`<p class="small muted" style="align-self:end">Fica no seu banco (privada). Para ir ao banco geral, use "Enviar ao banco geral".</p>`}
      </div>
      ${id ? html`<p class="small row"><button class="linkbtn" type="button" data-revs>Ver versões anteriores</button><button class="linkbtn" type="button" data-delq style="color:var(--bad)">Excluir questão</button><span class="muted">(só sem respostas; senão, arquive)</span></p>` : ''}`,
      { validate: async fm => {
        const options = [...Array(6)].map((_, i) => ({ id: fm.get('oid' + i) || '', body: String(fm.get('opt' + i) || '').trim(), is_correct: String(fm.get('correct')) === String(i) })).filter(o => o.body);
        if (String(fm.get('statement')).trim().length < 5) return 'Escreva o enunciado.';
        if (String(fm.get('explanation')).trim().length < 2) return 'Escreva a resolução.';
        if (options.length < 2) return 'Informe pelo menos 2 alternativas.';
        if (fm.get('status') === 'published' && options.filter(o => o.is_correct).length !== 1) return 'Marque exatamente uma alternativa correta (e ela não pode estar vazia).';
        let image_path = fm.get('rmimg') ? null : qq.image_path || null;
        const file = fm.get('image');
        if (file && file.size) {
          if (file.size > 2 * 1048576) return 'A imagem passa de 2 MB.';
          const ext = { 'image/png': 'png', 'image/jpeg': 'jpg', 'image/webp': 'webp', 'image/gif': 'gif' }[file.type];
          if (!ext) return 'Formato de imagem não aceito.';
          const path = staff ? `q/${uuid()}.${ext}` : `t/${auth.state.user.id}/${uuid()}.${ext}`;
          const { error } = await sb.storage.from('question-images').upload(path, file, { contentType: file.type });
          if (error) return friendlyError(error);
          image_path = path;
        }
        const payload = { id: id || '', code: String(fm.get('code')).trim().toUpperCase(), subject_id: fm.get('subject_id'), topic_id: fm.get('topic_id'), level: fm.get('level'), difficulty: fm.get('difficulty'), board_id: fm.get('board_id'), year: fm.get('year'), qtype: fm.get('qtype'),
          theme: String(fm.get('theme')).trim(), statement: String(fm.get('statement')).trim(), image_path, image_alt: String(fm.get('image_alt')).trim(), explanation: String(fm.get('explanation')).trim(), hint: String(fm.get('hint')).trim(), source: String(fm.get('source')).trim(), status: fm.get('status'),
          visibility: staff ? fm.get('visibility') : 'private' };
        const { error } = await sb.rpc('save_question', { p_question: payload, p_options: options });
        return error ? friendlyError(error) : null;
      } });
    if (fd) { toast('Questão salva'); changed = true; }
  } finally {
    document.removeEventListener('change', onDlg); document.removeEventListener('click', onDlg);
  }
  return changed;
}
