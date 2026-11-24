// Ambiente dos testes de integração: usa o Supabase local (npx supabase start).
// As chaves locais são públicas e fixas do ambiente de desenvolvimento do Supabase,
// nunca as do projeto real.
import { execFileSync } from 'node:child_process';
import { createClient } from '@supabase/supabase-js';
import { randomUUID } from 'node:crypto';

let cached;
export function env() {
  if (cached) return cached;
  if (process.env.SUPABASE_URL && process.env.SUPABASE_ANON_KEY && process.env.SUPABASE_SERVICE_KEY) {
    cached = { url: process.env.SUPABASE_URL, anon: process.env.SUPABASE_ANON_KEY, service: process.env.SUPABASE_SERVICE_KEY, db: process.env.SUPABASE_DB_URL, mail: process.env.MAILPIT_URL };
    return cached;
  }
  const out = execFileSync('npx', ['supabase', 'status', '-o', 'json'], { encoding: 'utf8', stdio: ['ignore', 'pipe', 'ignore'] });
  const j = JSON.parse(out.slice(out.indexOf('{')));
  cached = { url: j.API_URL, anon: j.ANON_KEY, service: j.SERVICE_ROLE_KEY, db: j.DB_URL, mail: j.MAILPIT_URL || j.INBUCKET_URL };
  return cached;
}

const opts = { auth: { persistSession: false, autoRefreshToken: false } };
export const anonClient = () => createClient(env().url, env().anon, opts);
export const serviceClient = () => createClient(env().url, env().service, opts);

// Cria um usuário confirmado e devolve um cliente logado como ele.
export async function newUser(name = 'Aluno Teste') {
  const email = `t-${randomUUID().slice(0, 8)}@teste.educamais.dev`;
  const password = 'senhaTeste123';
  const admin = serviceClient();
  const { data, error } = await admin.auth.admin.createUser({ email, password, email_confirm: true, user_metadata: { display_name: name } });
  if (error) throw error;
  const client = anonClient();
  const { error: e2 } = await client.auth.signInWithPassword({ email, password });
  if (e2) throw e2;
  return { id: data.user.id, email, password, client };
}

// Promove usando a mesma função do processo oficial (bootstrap_admin), via SQL direto.
export function sql(query) {
  return execFileSync('psql', [env().db, '-v', 'ON_ERROR_STOP=1', '-tAc', query], { encoding: 'utf8' }).trim();
}

export async function newAdmin(name = 'Ryan') {
  const u = await newUser(name);
  sql(`select public.bootstrap_admin('${u.email}', '${name}')`);
  return u;
}

export const uuid = () => randomUUID();
export const Q1 = 'e0000000-0000-4000-a000-000000000001';   // 2x + 6 = 20 → correta: posição 1 ("7")
export const Q1_OK = 'e0000000-0000-4000-b000-00000000000b'; // opção posição 1 (1*10+1 = 11 = 0xb)
export const Q1_BAD = 'e0000000-0000-4000-b000-00000000000a'; // posição 0
