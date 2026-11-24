// Utilidades gerais. Toda saída de texto do usuário passa por esc()/html``,
// o que impede injeção de código (XSS) na interface.

export const $ = (s, root = document) => root.querySelector(s);
export const $$ = (s, root = document) => [...root.querySelectorAll(s)];

const ESC = { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;', "'": '&#39;', '`': '&#96;' };
export const esc = s => String(s ?? '').replace(/[&<>"'`]/g, c => ESC[c]);

class Safe { constructor(s) { this.s = s; } toString() { return this.s; } }
/** Marca um trecho de HTML como confiável (use só com HTML gerado pelo próprio app). */
export const raw = s => new Safe(String(s ?? ''));
const val = v => v == null || v === false ? '' : v instanceof Safe ? v.s : Array.isArray(v) ? v.map(val).join('') : esc(v);
/** Template que escapa automaticamente cada valor interpolado. */
export const html = (strs, ...vals) => new Safe(strs.reduce((a, s, i) => a + s + (i < vals.length ? val(vals[i]) : ''), ''));
export const setHTML = (el, safe) => { el.innerHTML = safe instanceof Safe ? safe.s : esc(safe); };

export const uuid = () => (crypto.randomUUID ? crypto.randomUUID() : 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, c => {
  const r = crypto.getRandomValues(new Uint8Array(1))[0] & 15; return (c === 'x' ? r : (r & 3) | 8).toString(16);
}));
export const nowISO = () => new Date().toISOString();

// Datas no fuso do aparelho
export const dayKey = (d = new Date()) => { const x = new Date(d); return `${x.getFullYear()}-${String(x.getMonth() + 1).padStart(2, '0')}-${String(x.getDate()).padStart(2, '0')}`; };
export const weekdayIdx = (d = new Date()) => (new Date(d).getDay() + 6) % 7; // 0 = segunda
export const weekStart = (d = new Date()) => { const x = new Date(d); x.setHours(0, 0, 0, 0); x.setDate(x.getDate() - weekdayIdx(x)); return x; };
export const DAY = 864e5;
export const fmtDate = ts => new Date(ts).toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric' });
export const fmtDateTime = ts => new Date(ts).toLocaleString('pt-BR', { day: '2-digit', month: '2-digit', hour: '2-digit', minute: '2-digit' });
export const fmtMin = m => m < 60 ? `${Math.round(m)} min` : `${Math.floor(m / 60)} h ${String(Math.round(m % 60)).padStart(2, '0')}`;
export const pct = (a, b) => b ? Math.round(a / b * 100) : 0;
export const norm = t => String(t ?? '').normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();
export const clamp = (v, a, b) => Math.min(b, Math.max(a, v));
export const debounce = (fn, ms) => { let t; return (...a) => { clearTimeout(t); t = setTimeout(() => fn(...a), ms); }; };
export const plural = (n, um, varios) => `${n} ${n === 1 ? um : varios}`;

export function toast(msg, ms = 2200) {
  const t = $('#toast'); if (!t) return;
  t.textContent = msg; t.classList.add('show');
  clearTimeout(toast._t); toast._t = setTimeout(() => t.classList.remove('show'), ms);
}

// Diálogo de confirmação acessível (sem window.confirm)
export function confirmDialog(message, { ok = 'Confirmar', danger = false, typed = '' } = {}) {
  return new Promise(resolve => {
    const d = document.createElement('dialog');
    d.className = 'modal';
    setHTML(d, html`<form method="dialog"><div class="m-body"><p>${message}</p>${typed ? html`<label class="f">Para confirmar, digite <b>${typed}</b><input class="input" name="typed" autocomplete="off"></label>` : ''}</div>
      <div class="m-foot"><button class="btn ghost" value="no" type="submit">Cancelar</button><button class="btn ${danger ? 'danger' : ''}" value="yes" type="submit" data-ok>${ok}</button></div></form>`);
    document.body.appendChild(d);
    const inp = d.querySelector('[name=typed]'), okBtn = d.querySelector('[data-ok]');
    if (inp) { okBtn.disabled = true; inp.oninput = () => { okBtn.disabled = inp.value.trim().toUpperCase() !== typed; }; }
    d.addEventListener('close', () => { resolve(d.returnValue === 'yes'); d.remove(); });
    d.showModal();
  });
}

// Janela com formulário. fields: html do corpo. Retorna FormData ou null.
export function formDialog(title, body, { ok = 'Salvar', validate } = {}) {
  return new Promise(resolve => {
    const d = document.createElement('dialog');
    d.className = 'modal';
    setHTML(d, html`<form><div class="m-body"><h2>${title}</h2>${body}<p class="err" data-err hidden></p></div>
      <div class="m-foot"><button class="btn ghost" type="button" data-cancel>Cancelar</button><button class="btn" type="submit">${ok}</button></div></form>`);
    document.body.appendChild(d);
    const f = d.querySelector('form');
    let result = null;
    f.onsubmit = async e => {
      e.preventDefault();
      const fd = new FormData(f);
      if (validate) { const msg = await validate(fd); if (msg) { const p = d.querySelector('[data-err]'); p.textContent = msg; p.hidden = false; return; } }
      result = fd; d.close();
    };
    d.querySelector('[data-cancel]').onclick = () => d.close();
    d.addEventListener('close', () => { resolve(result); d.remove(); });
    d.showModal();
    d.querySelector('input, textarea, select')?.focus();
  });
}

// Liga ações por delegação: <button data-action="salvar">
export function actions(root, handlers, events = ['click']) {
  for (const ev of events) {
    root.addEventListener(ev, e => {
      const el = e.target.closest(`[data-${ev === 'click' ? 'action' : 'on' + ev}]`);
      if (!el || !root.contains(el)) return;
      const name = el.dataset[ev === 'click' ? 'action' : 'on' + ev];
      if (handlers[name]) { if (ev === 'click' && el.tagName === 'A' && el.getAttribute('href') === '#') e.preventDefault(); handlers[name](el, e); }
    });
  }
}

// Baixa um arquivo gerado no aparelho
export function download(name, text, type = 'application/json') {
  const a = document.createElement('a');
  a.href = URL.createObjectURL(new Blob([text], { type }));
  a.download = name; document.body.appendChild(a); a.click(); a.remove();
  setTimeout(() => URL.revokeObjectURL(a.href), 3000);
}

// Mensagens de erro amigáveis (sem expor detalhes internos)
export function friendlyError(e) {
  const m = String(e?.message || e || '');
  if (/Failed to fetch|NetworkError|network/i.test(m)) return 'Sem conexão com o servidor. Tente de novo quando a internet voltar.';
  if (/Invalid login credentials/i.test(m)) return 'E-mail ou senha incorretos.';
  if (/Email not confirmed/i.test(m)) return 'Confirme seu e-mail antes de entrar. Procure a mensagem na sua caixa de entrada (e no spam).';
  if (/User already registered|already been registered/i.test(m)) return 'Já existe uma conta com este e-mail. Tente entrar ou recuperar a senha.';
  if (/Password should be|weak|at least/i.test(m)) return 'Senha fraca: use pelo menos 8 caracteres, com letras e números.';
  if (/rate limit|too many|429|Limite/i.test(m)) return 'Muitas tentativas seguidas. Aguarde alguns minutos e tente de novo.';
  if (/New password should be different/i.test(m)) return 'A nova senha precisa ser diferente da atual.';
  if (/Acesso negado|permission denied|42501|row-level security/i.test(m)) return 'Você não tem permissão para fazer isso.';
  if (/JWT|session/i.test(m)) return 'Sua sessão expirou. Entre novamente.';
  if (m && m.length < 160 && /[áéíóúãõç]/i.test(m)) return m; // mensagens do nosso banco já estão em português
  return 'Não foi possível concluir. Tente de novo.';
}
