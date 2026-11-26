// Ferramentas comuns aos geradores do banco de questões.
// Tudo é determinístico (semente fixa): rodar de novo gera exatamente as mesmas questões,
// com os mesmos identificadores, então respostas antigas continuam válidas.

export function rng(seed) {
  let s = seed >>> 0 || 1;
  const next = () => { s ^= s << 13; s >>>= 0; s ^= s >> 17; s ^= s << 5; s >>>= 0; return s / 4294967296; };
  const r = {
    next,
    int: (a, b) => a + Math.floor(next() * (b - a + 1)),
    pick: arr => arr[Math.floor(next() * arr.length)],
    shuffle: arr => { const a = [...arr]; for (let i = a.length - 1; i > 0; i--) { const j = Math.floor(next() * (i + 1)); [a[i], a[j]] = [a[j], a[i]]; } return a; },
    sample: (arr, n) => r.shuffle(arr).slice(0, n),
    chance: p => next() < p
  };
  return r;
}

// Números no padrão brasileiro
export function num(n, dec = null) {
  n = Math.round(n * 100) / 100;
  if (dec == null) dec = Number.isInteger(n) ? 0 : (Math.abs(n * 10 - Math.round(n * 10)) < 1e-9 ? 1 : 2);
  const fixed = Math.abs(n).toFixed(dec);
  let [i, d] = fixed.split('.');
  i = i.replace(/\B(?=(\d{3})+(?!\d))/g, '.');
  return (n < 0 ? '−' : '') + i + (d ? ',' + d : '');
}
export const brl = n => 'R$ ' + num(n, 2);
export const pct = n => num(n) + '%';

export const NOMES = ['Ana', 'Bruno', 'Carla', 'Diego', 'Eduarda', 'Felipe', 'Gabriela', 'Henrique', 'Isabela', 'João', 'Karina', 'Lucas', 'Mariana', 'Nicolas', 'Olívia', 'Paulo', 'Rafaela', 'Samuel', 'Tainá', 'Vitor', 'Yasmin', 'Júlia', 'Pedro', 'Letícia', 'Mateus', 'Beatriz', 'Caio', 'Larissa', 'Thiago', 'Amanda'];
export const CIDADES = ['Recife', 'Salvador', 'Fortaleza', 'Belém', 'Manaus', 'Curitiba', 'Goiânia', 'Natal', 'Teresina', 'Campinas', 'Londrina', 'Uberlândia', 'Maceió', 'São Luís', 'Cuiabá', 'Vitória', 'Florianópolis', 'João Pessoa', 'Aracaju', 'Porto Velho'];

/**
 * Monta as alternativas: a correta + distratores (sem repetir), embaralhadas.
 * Devolve { options, correct }.
 */
export function opcoes(r, correta, distratores, total = 5) {
  const seen = new Set([String(correta)]);
  const ds = [];
  for (const d of distratores) { const k = String(d); if (!seen.has(k)) { seen.add(k); ds.push(k); } if (ds.length === total - 1) break; }
  if (ds.length < total - 1) return null; // não deu para montar: o gerador pula esta variação
  const all = r.shuffle([String(correta), ...ds]);
  return { options: all, correct: all.indexOf(String(correta)) };
}

/** Distratores numéricos plausíveis a partir do valor certo. */
export function vizinhos(r, v, fmt = x => num(x), extras = []) {
  const out = extras.map(fmt);
  const fatores = [0.5, 2, 0.9, 1.1, 0.8, 1.2, 1.5, 0.75, 1.25, 10, 0.1];
  for (const f of r.shuffle(fatores)) {
    const x = Number.isInteger(v) ? Math.round(v * f) : Math.round(v * f * 100) / 100;
    if (x !== v && x > 0) out.push(fmt(x));
  }
  for (let k = 1; out.length < 12; k++) { out.push(fmt(v + k)); if (v - k > 0) out.push(fmt(v - k)); }
  return out;
}

export const LETRAS = ['A', 'B', 'C', 'D', 'E'];
