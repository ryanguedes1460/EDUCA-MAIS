// Servidor estático simples para testar o app no computador.
//   node scripts/servidor.mjs            → modo local (sem servidor), porta 8080
//   SUPABASE_URL=... SUPABASE_ANON_KEY=... node scripts/servidor.mjs
//       → usa esse Supabase (ex.: o local do "npx supabase start"), sem alterar config.js.
import { createServer } from 'node:http';
import { readFile, stat } from 'node:fs/promises';
import { extname, join, normalize } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = fileURLToPath(new URL('..', import.meta.url));
const PORT = +process.env.PORT || 8080;
const URL_ = process.env.SUPABASE_URL || '';
const KEY = process.env.SUPABASE_ANON_KEY || '';
const TYPES = { '.html': 'text/html; charset=utf-8', '.js': 'text/javascript; charset=utf-8', '.mjs': 'text/javascript; charset=utf-8', '.css': 'text/css; charset=utf-8', '.json': 'application/json', '.webmanifest': 'application/manifest+json', '.png': 'image/png', '.svg': 'image/svg+xml', '.ico': 'image/x-icon', '.md': 'text/plain; charset=utf-8' };
const BLOCK = /^\/(node_modules|tests|supabase|scripts|\.git)(\/|$)/;

export function startServer(port = PORT, { url = URL_, key = KEY } = {}) {
  const server = createServer(async (req, res) => {
    try {
      let p = decodeURIComponent(new URL(req.url, 'http://x').pathname);
      if (BLOCK.test(p)) { res.writeHead(404); return res.end(); }
      if (p.endsWith('/')) p += 'index.html';
      if (p === '/config.js' && url) {
        res.writeHead(200, { 'content-type': TYPES['.js'], 'cache-control': 'no-store' });
        return res.end(`window.EDUCA_CONFIG = ${JSON.stringify({ supabaseUrl: url, supabaseAnonKey: key, turnstileSiteKey: '' })};`);
      }
      const file = normalize(join(ROOT, p));
      if (!file.startsWith(ROOT)) { res.writeHead(403); return res.end(); }
      await stat(file);
      let body = await readFile(file);
      if (p === '/index.html' && url) {
        // Permite conexão com o Supabase local na política de segurança (somente neste servidor de teste)
        const origin = new URL(url).origin;
        body = Buffer.from(body.toString().replace("connect-src 'self'", `connect-src 'self' ${origin} ${origin.replace('http', 'ws')}`).replace("img-src 'self' data: blob:", `img-src 'self' data: blob: ${origin}`));
      }
      res.writeHead(200, { 'content-type': TYPES[extname(file)] || 'application/octet-stream', 'cache-control': 'no-cache', 'x-content-type-options': 'nosniff' });
      res.end(body);
    } catch { res.writeHead(404); res.end('não encontrado'); }
  });
  return new Promise(r => server.listen(port, '127.0.0.1', () => r(server)));
}

if (process.argv[1] && fileURLToPath(import.meta.url) === process.argv[1]) {
  startServer().then(() => console.log(`Educa Mais em http://127.0.0.1:${PORT}${URL_ ? ' (Supabase: ' + URL_ + ')' : ' (modo local)'}`));
}
