// Tela de entrada: login, cadastro, recuperação de senha e nova senha.
import { html, setHTML, $, toast, friendlyError } from '../core/util.js';
import { configured, config } from '../core/backend.js';
import * as auth from '../core/auth.js';
import * as store from '../core/store.js';

const PERFIS = { enem: 'ENEM e vestibular', medio: 'Ensino médio', fundamental: 'Ensino fundamental', concurso: 'Concursos' };
const validEmail = e => /^[^\s@]+@[^\s@]+\.[^\s@]{2,}$/.test(e);
const strong = p => p.length >= 8 && /[A-Za-z]/.test(p) && /\d/.test(p);

// Anti-robô opcional (Cloudflare Turnstile)
let turnstileReady = null;
function loadTurnstile() {
  if (!config.turnstile) return Promise.resolve(false);
  if (turnstileReady) return turnstileReady;
  turnstileReady = new Promise(res => {
    const s = document.createElement('script');
    s.src = 'https://challenges.cloudflare.com/turnstile/v0/api.js?render=explicit';
    s.onload = () => res(true); s.onerror = () => res(false);
    document.head.appendChild(s);
  });
  return turnstileReady;
}
async function captchaWidget(el) {
  if (!(await loadTurnstile()) || !window.turnstile) return () => undefined;
  let token;
  const id = window.turnstile.render(el, { sitekey: config.turnstile, language: 'pt-br', callback: t => { token = t; } });
  return () => { const t = token; window.turnstile.reset(id); token = undefined; return t; };
}

export default {
  title: 'Entrar',
  async render(el, params, ctx) {
    if (!configured) {
      setHTML(el, html`<div class="auth"><div class="card stack"><h1>Modo local</h1>
        <p>O servidor da Educa Mais ainda não foi configurado, então não há login. Você pode estudar normalmente: os dados ficam guardados neste aparelho.</p>
        <p class="muted small">Administração: siga o guia <b>docs/CONFIGURACAO.md</b> para ligar o banco de dados e as contas.</p>
        <a class="btn" href="#inicio">Começar a estudar</a></div></div>`);
      return;
    }
    let tab = params[0] || (auth.state.recovery ? 'nova-senha' : 'entrar');
    if (auth.isLogged() && tab !== 'nova-senha') { ctx.go('inicio'); return; }
    const settings = await store.meta.get('app_settings', {});
    const signupOpen = settings?.cadastro_aberto !== false;

    const draw = () => {
      setHTML(el, html`<div class="auth">
        <div class="hero"><span class="eyebrow" style="color:var(--mark)">Educa Mais</span>
          <h1>Estude com <span class="hl">tudo num só lugar</span>.</h1>
          <p>Questões, flashcards, metas e desempenho salvos na sua conta, em qualquer aparelho.</p></div>
        ${auth.state.urlError ? html`<div class="banner bad" role="alert">${auth.state.urlError}</div>` : ''}
        <div class="card stack">
          ${tab !== 'nova-senha' ? html`<div class="tabs" role="tablist">
            <button type="button" role="tab" aria-selected="${tab === 'entrar'}" data-tab="entrar">Entrar</button>
            ${signupOpen ? html`<button type="button" role="tab" aria-selected="${tab === 'cadastro'}" data-tab="cadastro">Criar conta</button>` : ''}
            <button type="button" role="tab" aria-selected="${tab === 'recuperar'}" data-tab="recuperar">Esqueci a senha</button></div>` : ''}
          <div id="authBody"></div>
        </div>
        ${tab !== 'nova-senha' ? html`<p class="muted small" style="text-align:center">Prefere testar antes? <button class="linkbtn" type="button" id="guest">Usar sem conta</button> (os dados ficam só neste aparelho).</p>` : ''}
      </div>`);
      el.querySelectorAll('[data-tab]').forEach(b => b.onclick = () => { tab = b.dataset.tab; auth.state.urlError = ''; draw(); });
      const g = $('#guest', el); if (g) g.onclick = () => { ctx.chooseGuest(true); ctx.go('inicio'); };
      forms[tab]($('#authBody', el));
    };

    const msg = (box, text, ok = false) => { const p = box.querySelector('[data-msg]'); p.className = ok ? 'ok' : 'err'; p.textContent = text; p.hidden = !text; };
    const busy = (form, on) => form.querySelectorAll('button, input, select').forEach(x => x.disabled = on);

    const forms = {
      async entrar(box) {
        setHTML(box, html`<form class="stack" novalidate>
          <label class="f">E-mail<input class="input" name="email" type="email" autocomplete="username" required maxlength="254"></label>
          <label class="f">Senha<input class="input" name="password" type="password" autocomplete="current-password" required maxlength="72"></label>
          <div data-captcha></div><p data-msg hidden role="alert"></p>
          <button class="btn" type="submit">Entrar</button></form>`);
        const form = box.querySelector('form'); const token = await captchaWidget(box.querySelector('[data-captcha]'));
        form.onsubmit = async e => {
          e.preventDefault();
          const email = form.email.value.trim(), password = form.password.value;
          if (!validEmail(email) || !password) return msg(box, 'Informe e-mail e senha.');
          busy(form, true); msg(box, '');
          try { await auth.signIn({ email, password, captchaToken: token() }); toast('Bem-vindo de volta!'); await ctx.enterAccount(); }
          catch (err) { msg(box, friendlyError(err)); busy(form, false); }
        };
      },
      async cadastro(box) {
        setHTML(box, html`<form class="stack" novalidate>
          <label class="f">Seu nome<input class="input" name="name" required maxlength="60" autocomplete="name"></label>
          <label class="f">E-mail<input class="input" name="email" type="email" autocomplete="email" required maxlength="254"></label>
          <label class="f">Senha (mínimo 8 caracteres, com letras e números)<input class="input" name="password" type="password" autocomplete="new-password" required minlength="8" maxlength="72"></label>
          <label class="f">Repita a senha<input class="input" name="password2" type="password" autocomplete="new-password" required maxlength="72"></label>
          <label class="f">Eu estudo para<select class="input" name="perfil">${Object.entries(PERFIS).map(([k, v]) => html`<option value="${k}">${v}</option>`)}</select></label>
          <label class="check"><input type="checkbox" name="terms" required> Li e aceito que meus dados de estudo sejam guardados na minha conta para o funcionamento da plataforma. Se tenho menos de 18 anos, tenho autorização do meu responsável.</label>
          <div data-captcha></div><p data-msg hidden role="alert"></p>
          <button class="btn" type="submit">Criar conta</button></form>`);
        const form = box.querySelector('form'); const token = await captchaWidget(box.querySelector('[data-captcha]'));
        form.onsubmit = async e => {
          e.preventDefault();
          const name = form.name.value.trim(), email = form.email.value.trim(), password = form.password.value;
          if (!name) return msg(box, 'Informe seu nome.');
          if (!validEmail(email)) return msg(box, 'E-mail inválido.');
          if (!strong(password)) return msg(box, 'A senha precisa de pelo menos 8 caracteres, com letras e números.');
          if (password !== form.password2.value) return msg(box, 'As senhas não são iguais.');
          if (!form.terms.checked) return msg(box, 'É preciso aceitar os termos para criar a conta.');
          busy(form, true); msg(box, '');
          try {
            const r = await auth.signUp({ email, password, name, studyProfile: form.perfil.value, captchaToken: token() });
            if (r.needsConfirmation) {
              setHTML(box, html`<div class="stack" role="status"><h2>Confira seu e-mail</h2><p>Se <b>${email}</b> ainda não tiver conta, enviamos um link de confirmação. Abra o e-mail (veja também o spam), clique no link e depois entre aqui com sua senha.</p><button class="btn ghost" type="button" data-tab2="entrar">Ir para Entrar</button></div>`);
              box.querySelector('[data-tab2]').onclick = () => { tab = 'entrar'; draw(); };
            } else { await auth.loadProfile(); await auth.startLoginSession(); await ctx.enterAccount(); }
          } catch (err) { msg(box, friendlyError(err)); busy(form, false); }
        };
      },
      async recuperar(box) {
        setHTML(box, html`<form class="stack" novalidate>
          <p class="muted">Informe o e-mail da sua conta. Enviaremos um link para você criar uma nova senha.</p>
          <label class="f">E-mail<input class="input" name="email" type="email" autocomplete="email" required maxlength="254"></label>
          <div data-captcha></div><p data-msg hidden role="alert"></p>
          <button class="btn" type="submit">Enviar link</button></form>`);
        const form = box.querySelector('form'); const token = await captchaWidget(box.querySelector('[data-captcha]'));
        form.onsubmit = async e => {
          e.preventDefault();
          const email = form.email.value.trim();
          if (!validEmail(email)) return msg(box, 'E-mail inválido.');
          busy(form, true);
          try { await auth.requestPasswordReset(email, token()); msg(box, 'Se existir uma conta com este e-mail, o link foi enviado. Ele vale por 1 hora.', true); }
          catch (err) { msg(box, friendlyError(err)); }
          busy(form, false);
        };
      },
      'nova-senha'(box) {
        if (!auth.isLogged()) {
          setHTML(box, html`<div class="stack"><h2>Link inválido</h2><p>Este link de recuperação expirou ou já foi usado. Peça um novo.</p><button class="btn" type="button" data-t="recuperar">Pedir novo link</button></div>`);
          box.querySelector('[data-t]').onclick = () => { tab = 'recuperar'; draw(); };
          return;
        }
        setHTML(box, html`<form class="stack" novalidate><h2>Crie uma nova senha</h2>
          <label class="f">Nova senha<input class="input" name="password" type="password" autocomplete="new-password" required minlength="8" maxlength="72"></label>
          <label class="f">Repita a nova senha<input class="input" name="password2" type="password" autocomplete="new-password" required maxlength="72"></label>
          <p data-msg hidden role="alert"></p><button class="btn" type="submit">Salvar nova senha</button></form>`);
        const form = box.querySelector('form');
        form.onsubmit = async e => {
          e.preventDefault();
          const p = form.password.value;
          if (!strong(p)) return msg(box, 'A senha precisa de pelo menos 8 caracteres, com letras e números.');
          if (p !== form.password2.value) return msg(box, 'As senhas não são iguais.');
          busy(form, true);
          try { await auth.changePassword(p); toast('Senha alterada!'); await ctx.enterAccount(); location.hash = '#inicio'; }
          catch (err) { msg(box, friendlyError(err)); busy(form, false); }
        };
      }
    };
    draw();
  }
};
