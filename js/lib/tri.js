// Nota estimada no estilo da TRI (Teoria de Resposta ao Item), como no ENEM.
// É uma ESTIMATIVA educativa: o ENEM usa parâmetros calibrados com milhões de
// respostas; aqui cada questão recebe parâmetros a partir da dificuldade (1 a 5).
// Modelo de 3 parâmetros: a = discriminação, b = dificuldade, c = chance de acerto no chute (5 alternativas).
const A = 1.4, C = 0.2;
export const bDe = dif => ((Number(dif) || 3) - 3) * 0.9;
const p = (t, b) => C + (1 - C) / (1 + Math.exp(-1.7 * A * (t - b)));

/** itens: [{ difficulty, ok }] → { nota, theta, coerencia } */
export function notaTRI(itens) {
  const val = itens.filter(i => i.ok === true || i.ok === false);
  if (!val.length) return null;
  // EAP: média da habilidade ponderada pela verossimilhança e por uma distribuição normal
  let num = 0, den = 0;
  for (let t = -4; t <= 4.0001; t += 0.05) {
    let L = Math.exp(-t * t / 2);
    for (const i of val) { const pi = p(t, bDe(i.difficulty)); L *= i.ok ? pi : 1 - pi; }
    num += t * L; den += L;
  }
  const theta = num / den;
  const nota = Math.round(Math.min(950, Math.max(300, 500 + 100 * theta)));
  // Coerência: errar fáceis e acertar difíceis derruba a nota (sinal de chute)
  const faceisErradas = val.filter(i => !i.ok && (i.difficulty || 3) <= 2).length;
  const dificeisCertas = val.filter(i => i.ok && (i.difficulty || 3) >= 4).length;
  const coerencia = faceisErradas && dificeisCertas ? 'baixa' : 'boa';
  return { nota, theta, coerencia };
}
