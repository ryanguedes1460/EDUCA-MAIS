// Conexão com o Supabase (banco, login e arquivos).
// A URL e a chave "anon/publishable" ficam em config.js. Essa chave é PÚBLICA por natureza:
// ela só permite o que as regras de segurança do banco (RLS) autorizam.
// Nunca coloque a chave "service_role"/"secret" no site.
const cfg = window.EDUCA_CONFIG || {};

export const config = {
  url: String(cfg.supabaseUrl || '').trim().replace(/\/+$/, ''),
  key: String(cfg.supabaseAnonKey || '').trim(),
  turnstile: String(cfg.turnstileSiteKey || '').trim()
};

const looksSecret = k => /service_role/.test(atobSafe(k.split('.')[1] || '')) || /^sb_secret_/.test(k);
function atobSafe(s) { try { return atob(s.replace(/-/g, '+').replace(/_/g, '/')); } catch { return ''; } }

export const configError = config.key && looksSecret(config.key)
  ? 'A chave colocada em config.js é a chave SECRETA. Troque pela chave pública (anon/publishable) imediatamente e gere uma nova chave secreta no Supabase.'
  : '';

export const configured = !!(config.url && config.key && /^https?:\/\//.test(config.url) && !configError && window.supabase?.createClient);

export const sb = configured
  ? window.supabase.createClient(config.url, config.key, {
      auth: { persistSession: true, autoRefreshToken: true, detectSessionInUrl: true, flowType: 'implicit', storageKey: 'educa-mais-auth' },
      global: { headers: { 'x-client-info': 'educa-mais-web' } }
    })
  : null;

export const appUrl = () => location.origin + location.pathname;
