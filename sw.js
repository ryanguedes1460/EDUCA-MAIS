// Educa Mais · Service Worker: guarda o app no aparelho para funcionar offline.
// VERSION e ASSETS são gerados por scripts/build.mjs (não edite à mão).
// Regras:
//  * Arquivos do app: guardados na instalação; servidos do cache e atualizados em segundo plano.
//  * Página: tenta a rede primeiro (versão nova), senão usa a guardada.
//  * Supabase (dados, login, arquivos privados): NUNCA passa pelo cache. Dados pessoais
//    ficam no IndexedDB de cada conta, e credenciais só no armazenamento do Supabase.
//  * Atualização controlada: a versão nova espera o usuário tocar em "Atualizar agora".
const VERSION = '4abca63b9e8d';
const CACHE = 'educa-mais-' + VERSION;
const ASSETS = [
  './',
  './index.html',
  './manifest.webmanifest',
  './css/educa.css',
  './js/app/busca.js',
  './js/app/jogo.js',
  './js/app/mundos.js',
  './js/app/telas/anotacoes.js',
  './js/app/telas/cronograma.js',
  './js/app/telas/erros.js',
  './js/app/telas/estudar.js',
  './js/app/telas/flashcards.js',
  './js/app/telas/foco.js',
  './js/app/telas/inicio.js',
  './js/app/telas/perfil.js',
  './js/app/telas/praticar.js',
  './js/app/telas/progresso.js',
  './js/app/telas/questoes.js',
  './js/app/telas/redacao.js',
  './js/app/ui.js',
  './js/core/aparencia.js',
  './js/core/auth.js',
  './js/core/backend.js',
  './js/core/banco.js',
  './js/core/bus.js',
  './js/core/conteudo.js',
  './js/core/controles.js',
  './js/core/icones.js',
  './js/core/protecao.js',
  './js/core/store.js',
  './js/core/sync.js',
  './js/core/tabelas.js',
  './js/core/util.js',
  './js/data/conteudo-inicial.js',
  './js/lib/cronograma.js',
  './js/lib/editor-questao.js',
  './js/lib/graficos.js',
  './js/lib/migrar-v02.js',
  './js/lib/srs.js',
  './js/lib/stats.js',
  './js/lib/tri.js',
  './js/main.js',
  './js/views/admin-alunos.js',
  './js/views/admin.js',
  './js/views/aulas.js',
  './js/views/conta.js',
  './js/views/duvidas.js',
  './js/views/entrar.js',
  './js/views/materiais.js',
  './js/views/professor.js',
  './js/views/redacao.js',
  './js/views/turmas.js',
  './vendor/preact-htm.js',
  './vendor/supabase.js',
  './icons/icon-192.png',
  './icons/icon-512.png'
];

self.addEventListener('install', e => {
  e.waitUntil(caches.open(CACHE).then(c => c.addAll(ASSETS)));
});

self.addEventListener('activate', e => {
  e.waitUntil(caches.keys()
    .then(ks => Promise.all(ks.filter(k => k.startsWith('educa-mais-') && k !== CACHE).map(k => caches.delete(k))))
    .then(() => self.clients.claim()));
});

self.addEventListener('message', e => { if (e.data === 'SKIP_WAITING') self.skipWaiting(); });

self.addEventListener('fetch', e => {
  const req = e.request;
  if (req.method !== 'GET') return;
  const url = new URL(req.url);
  const sameOrigin = url.origin === location.origin;
  const fonts = /^fonts\.(googleapis|gstatic)\.com$/.test(url.hostname);
  if (!sameOrigin && !fonts) return; // Supabase e outros: direto na rede, sem cache
  if (sameOrigin && url.pathname.endsWith('/config.js')) { // configuração: rede primeiro
    e.respondWith(fetch(req).then(r => { const c = r.clone(); caches.open(CACHE).then(x => x.put(req, c)); return r; }).catch(() => caches.match(req)));
    return;
  }
  if (req.mode === 'navigate') {
    e.respondWith(fetch(req).then(r => { if (r.ok) { const c = r.clone(); caches.open(CACHE).then(x => x.put('./', c)); } return r; })
      .catch(() => caches.match('./').then(r => r || caches.match('./index.html'))));
    return;
  }
  e.respondWith(caches.open(CACHE).then(async c => {
    const hit = await c.match(req, { ignoreSearch: sameOrigin });
    const net = fetch(req).then(r => { if (r.ok || r.type === 'opaque') c.put(req, r.clone()); return r; }).catch(() => hit);
    return hit || net;
  }));
});
