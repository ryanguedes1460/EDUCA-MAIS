// Contas: cadastro, login, logout, recuperação e troca de senha, sessões.
// As senhas são enviadas por HTTPS ao Supabase Auth, que guarda apenas o hash (bcrypt).
// O site nunca grava senhas.
import { sb, configured, appUrl } from './backend.js';
import { emit } from './bus.js';
import { uuid } from './util.js';

export const state = { user: null, profile: null, recovery: false, urlError: '' };

export const isLogged = () => !!state.user;
export const isBlocked = () => state.profile?.status === 'blocked';
export const can = perm => {
  const p = state.profile?.permissions || [];
  return state.profile?.status === 'active' && (p.includes('*') || p.includes(perm));
};

// ---- Proteção extra contra tentativas repetidas no aparelho (o servidor também limita) ----
const FAIL_KEY = 'em:loginFails';
function fails() { try { return JSON.parse(localStorage.getItem(FAIL_KEY)) || { n: 0, until: 0 }; } catch { return { n: 0, until: 0 }; } }
function setFails(v) { try { localStorage.setItem(FAIL_KEY, JSON.stringify(v)); } catch {} }
export function lockRemaining() { return Math.max(0, Math.ceil((fails().until - Date.now()) / 1000)); }
function registerFail() {
  const f = fails(); f.n++;
  if (f.n >= 5) f.until = Date.now() + Math.min(15 * 60, 30 * 2 ** (f.n - 5)) * 1000; // 30 s, 60 s, 120 s... até 15 min
  setFails(f);
}

function readUrlError() {
  const h = location.hash.slice(1), q = location.search.slice(1);
  const p = new URLSearchParams(h.includes('=') ? h : q);
  const d = p.get('error_description');
  if (d) {
    state.urlError = /expired|invalid/i.test(d) ? 'O link expirou ou já foi usado. Peça um novo.' : 'Não foi possível validar o link do e-mail.';
    history.replaceState(null, '', appUrl());
  }
}

export async function init() {
  if (!configured) return;
  readUrlError();
  const isRecoveryLink = /type=recovery/.test(location.hash);
  sb.auth.onAuthStateChange((event, session) => {
    if (event === 'PASSWORD_RECOVERY') { state.recovery = true; emit('auth:recovery'); }
    if (event === 'SIGNED_OUT') { state.user = null; state.profile = null; emit('auth:change', { event }); }
    if (event === 'TOKEN_REFRESHED' || event === 'USER_UPDATED') state.user = session?.user || state.user;
    if (event === 'SIGNED_IN' && session?.user && state.user?.id !== session.user.id) {
      // Executa fora do callback (recomendação do Supabase para evitar travas)
      setTimeout(async () => { state.user = session.user; await loadProfile(); emit('auth:change', { event }); }, 0);
    }
  });
  const { data } = await sb.auth.getSession();
  if (isRecoveryLink && data.session) state.recovery = true;
  if (data.session?.user) { state.user = data.session.user; await loadProfile().catch(() => {}); }
}

export async function loadProfile() {
  if (!state.user) return null;
  const { data, error } = await sb.rpc('my_profile');
  if (error) throw error;
  state.profile = data;
  emit('auth:profile', data);
  return data;
}

export async function signUp({ email, password, name, studyProfile, accountType = 'aluno', captchaToken }) {
  const { data, error } = await sb.auth.signUp({
    email, password,
    // account_type só registra o pedido: quem decide se a conta é de professor é a administração
    options: { emailRedirectTo: appUrl(), data: { display_name: name, study_profile: studyProfile, account_type: accountType === 'professor' ? 'professor' : 'aluno' }, captchaToken }
  });
  if (error) throw error;
  return { needsConfirmation: !data.session };
}

export async function signIn({ email, password, captchaToken }) {
  const wait = lockRemaining();
  if (wait) throw new Error(`Muitas tentativas. Aguarde ${wait} s para tentar de novo.`);
  const { data, error } = await sb.auth.signInWithPassword({ email, password, options: { captchaToken } });
  if (error) { if (/Invalid login/i.test(error.message)) registerFail(); throw error; }
  setFails({ n: 0, until: 0 });
  state.user = data.user;
  await loadProfile();
  await startLoginSession();
  return data.user;
}

/** Funções chamadas antes de sair da conta (ex.: enviar o registro de atividade). */
export const antesDeSair = [];
export async function signOut(scope = 'local') {
  for (const fn of antesDeSair) await Promise.resolve(fn()).catch(() => {});
  await endLoginSession().catch(() => {});
  const { error } = await sb.auth.signOut({ scope });
  state.user = null; state.profile = null;
  if (error && !/session/i.test(error.message)) throw error;
}

export async function requestPasswordReset(email, captchaToken) {
  const { error } = await sb.auth.resetPasswordForEmail(email, { redirectTo: appUrl(), captchaToken });
  if (error) throw error;
}

/** Troca de senha. Fora do fluxo de recuperação, exige a senha atual (verificação de identidade). */
export async function changePassword(newPassword, currentPassword) {
  if (!state.recovery) {
    const { error: e1 } = await sb.auth.signInWithPassword({ email: state.user.email, password: currentPassword || '' });
    if (e1) { registerFail(); throw new Error('A senha atual está incorreta.'); }
  }
  const { error } = await sb.auth.updateUser({ password: newPassword });
  if (error) throw error;
  state.recovery = false;
  // Por segurança, desconecta os outros aparelhos depois de trocar a senha
  await sb.auth.signOut({ scope: 'others' }).catch(() => {});
}

export async function verifyPassword(password) {
  const { error } = await sb.auth.signInWithPassword({ email: state.user.email, password });
  if (error) throw new Error('Senha incorreta.');
}

// ---- Histórico de sessões (aparelhos) ----
const lsKey = () => `em:ls:${state.user?.id}`;
export const currentLoginSessionId = () => { try { return localStorage.getItem(lsKey()); } catch { return null; } };

/** Identificador aleatório deste navegador (não identifica a pessoa, só o aparelho). */
export function deviceId() {
  try {
    let id = localStorage.getItem('em:device');
    if (!/^[A-Za-z0-9-]{8,64}$/.test(id || '')) { id = 'd-' + uuid(); localStorage.setItem('em:device', id); }
    return id;
  } catch { return null; }
}
export function platform() {
  const ua = navigator.userAgent;
  return /Android/i.test(ua) ? 'Android' : /iPhone|iPad|iPod/i.test(ua) ? 'iPhone/iPad' : /Windows/i.test(ua) ? 'Windows' : /Mac OS/i.test(ua) ? 'Mac' : /CrOS/i.test(ua) ? 'Chromebook' : /Linux/i.test(ua) ? 'Linux' : 'Outro';
}

function deviceName() {
  const ua = navigator.userAgent;
  const os = /Android/i.test(ua) ? 'Android' : /iPhone|iPad|iPod/i.test(ua) ? 'iPhone/iPad' : /Windows/i.test(ua) ? 'Windows' : /Mac OS/i.test(ua) ? 'Mac' : /Linux/i.test(ua) ? 'Linux' : 'Aparelho';
  const br = /Edg\//.test(ua) ? 'Edge' : /OPR\//.test(ua) ? 'Opera' : /Chrome\//.test(ua) ? 'Chrome' : /Firefox\//.test(ua) ? 'Firefox' : /Safari\//.test(ua) ? 'Safari' : 'Navegador';
  return `${br} · ${os}`;
}

export async function startLoginSession() {
  if (!state.user) return;
  const id = uuid();
  const row = { id, device: deviceName(), user_agent: navigator.userAgent.slice(0, 300), device_id: deviceId(), platform: platform() };
  let { error } = await sb.from('login_sessions').insert(row);
  // servidor ainda sem as colunas novas (versão anterior do banco): grava sem elas
  if (error && /device_id|platform|column/i.test(error.message || '')) ({ error } = await sb.from('login_sessions').insert({ id, device: row.device, user_agent: row.user_agent }));
  if (!error) try { localStorage.setItem(lsKey(), id); } catch {}
}

export async function touchLoginSession() {
  const id = currentLoginSessionId();
  if (!id) return startLoginSession();
  await sb.from('login_sessions').update({ last_seen_at: new Date().toISOString() }).eq('id', id);
}

async function endLoginSession() {
  const id = currentLoginSessionId();
  if (id) await sb.from('login_sessions').update({ ended_at: new Date().toISOString() }).eq('id', id);
  try { localStorage.removeItem(lsKey()); } catch {}
}

export async function listLoginSessions() {
  const { data, error } = await sb.from('login_sessions').select('*').order('started_at', { ascending: false }).limit(30);
  if (error) throw error;
  return data;
}

/** Encerra todas as outras sessões (outros aparelhos) mantendo esta. */
export async function signOutOthers() {
  const { error } = await sb.auth.signOut({ scope: 'others' });
  if (error) throw error;
  const id = currentLoginSessionId();
  let q = sb.from('login_sessions').update({ ended_at: new Date().toISOString() }).is('ended_at', null);
  if (id) q = q.neq('id', id);
  await q;
}
