// Configuração pública do Educa Mais.
// Preencha com os dados do SEU projeto Supabase (Project Settings > API):
//   supabaseUrl     = "Project URL"      (ex.: https://abcdefgh.supabase.co)
//   supabaseAnonKey = chave "anon public" ou "publishable" (pode ficar no site: ela é pública)
// NUNCA coloque aqui a chave "service_role" ou "secret".
// Deixando vazio, o app funciona em "modo local" (dados só no aparelho, sem login).
window.EDUCA_CONFIG = {
  supabaseUrl: '',
  supabaseAnonKey: '',
  // Opcional: chave pública do Cloudflare Turnstile (anti-robô no login). Veja docs/CONFIGURACAO.md
  turnstileSiteKey: ''
};
