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

/** Junta todas as migrações num arquivo único para colar no SQL Editor do Supabase. */
export function renderInstaller() {
  const dir = join(ROOT, 'supabase', 'migrations');
  const files = readdirSync(dir).filter(f => f.endsWith('.sql')).sort();
  const head = `-- =====================================================================
-- EDUCA MAIS · INSTALADOR DO BANCO DE DADOS (gerado por scripts/build.mjs)
-- Como usar: Supabase > SQL Editor > New query > cole TODO este arquivo > Run.
-- Rode UMA vez, num projeto novo. Para atualizações futuras, rode só as
-- migrações novas (veja docs/MANUTENCAO.md).
-- Arquivos incluídos: ${files.join(', ')}
-- =====================================================================
`;
  return head + files.map(f => `\n-- >>>>>>>>>> ${f}\n` + readFileSync(join(dir, f), 'utf8')).join('\n');
}

/** SQL para rodar DEPOIS de restaurar um backup: o dump do esquema "public"
 *  não leva o gatilho em auth.users nem as políticas do Storage. */
export function renderPostRestore() {
  const dir = join(ROOT, 'supabase', 'migrations');
  const storage = readFileSync(join(dir, '20261124000400_armazenamento.sql'), 'utf8')
    .replace(/create policy ("[^"]+") on storage\.objects/g, 'drop policy if exists $1 on storage.objects;\ncreate policy $1 on storage.objects');
  return `-- =====================================================================
-- EDUCA MAIS · PÓS-RESTAURAÇÃO (gerado por scripts/build.mjs)
-- Rode no SQL Editor DEPOIS de restaurar um backup (docs/BANCO-DE-DADOS.md).
-- Recria o que fica fora do esquema "public": o gatilho que cria o perfil
-- no cadastro e as regras de acesso aos arquivos. Pode rodar mais de uma vez.
-- =====================================================================

drop trigger if exists on_auth_user_created on auth.users;
create trigger on_auth_user_created
  after insert on auth.users for each row execute function public.handle_new_user();
` + storage;
}

if (process.argv[1] && fileURLToPath(import.meta.url) === process.argv[1]) {
  const out = render();
  writeFileSync(join(ROOT, 'sw.js'), out);
  writeFileSync(join(ROOT, 'supabase', 'instalar.sql'), renderInstaller());
  writeFileSync(join(ROOT, 'supabase', 'pos-restauracao.sql'), renderPostRestore());
  console.log('sw.js atualizado:', out.match(/VERSION = '([^']*)'/)[1], '· supabase/instalar.sql gerado');
}
