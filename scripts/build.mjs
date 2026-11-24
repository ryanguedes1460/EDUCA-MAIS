// Atualiza a lista de arquivos e a versão do cache em sw.js.
// Rode sempre que mudar arquivos do app: node scripts/build.mjs
// (o teste automatizado falha se você esquecer).
import { readFileSync, writeFileSync, readdirSync, statSync } from 'node:fs';
import { createHash } from 'node:crypto';
import { join, relative } from 'node:path';
import { fileURLToPath } from 'node:url';

const ROOT = fileURLToPath(new URL('..', import.meta.url));
const DIRS = ['css', 'js', 'vendor', 'icons'];
const FILES = ['index.html', 'manifest.webmanifest'];

export function listAssets() {
  const out = [...FILES];
  const walk = d => { for (const f of readdirSync(join(ROOT, d)).sort()) { const p = join(d, f); if (statSync(join(ROOT, p)).isDirectory()) walk(p); else out.push(p.split('\\').join('/')); } };
  DIRS.forEach(walk);
  return out;
}

export function computeVersion(assets) {
  const h = createHash('sha256');
  for (const a of assets) h.update(a).update(readFileSync(join(ROOT, a)));
  return h.digest('hex').slice(0, 12);
}

export function render() {
  const assets = listAssets();
  const version = computeVersion(assets);
  const src = readFileSync(join(ROOT, 'sw.js'), 'utf8');
  return src
    .replace(/const VERSION = '[^']*';/, `const VERSION = '${version}';`)
    .replace(/const ASSETS = \[[\s\S]*?\];/, `const ASSETS = [\n  './',\n${assets.map(a => `  './${a}'`).join(',\n')}\n];`);
}

if (process.argv[1] && fileURLToPath(import.meta.url) === process.argv[1]) {
  const out = render();
  writeFileSync(join(ROOT, 'sw.js'), out);
  console.log('sw.js atualizado:', out.match(/VERSION = '([^']*)'/)[1]);
}
