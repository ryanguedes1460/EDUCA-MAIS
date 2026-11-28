// Versão 2.3: famílias AUTORAIS para os conteúdos do ensino médio que ainda faltavam no banco
// (gravitação, MHS, empuxo, óptica, ondas sonoras, eletrostática, magnetismo, termodinâmica,
// termoquímica, cinética, equilíbrio, eletroquímica, nomenclatura, genética, trigonometria,
// geometria espacial...) e questões com FIGURA (gráficos, triângulos, circuitos) desenhada aqui.
// Cada família gera versões com números diferentes; a resolução é calculada pelo próprio gerador.
import { num, brl, NOMES, CIDADES, opcoes, vizinhos } from '../banco/util.mjs';
import * as fig from './figuras.mjs';

const M = 'Matemática', F = 'Física', Q = 'Química', B = 'Biologia';
const fam = (subject, topic, level, difficulty, n, make) => ({ subject, topic, level, difficulty, n, make });
const r1 = x => Math.round(x * 10) / 10, r2 = x => Math.round(x * 100) / 100;
const fr = (a, b) => { const g = (x, y) => y ? g(y, x % y) : x; const d = g(a, b); return b / d === 1 ? String(a / d) : `${a / d}/${b / d}`; };
const cap = s => s[0].toUpperCase() + s.slice(1);
const unid = (v, u) => `${num(v)} ${u}`;
const SEN = { 30: [0.5, '1/2'], 45: [0.71, '√2/2'], 60: [0.87, '√3/2'] }, COS = { 30: [0.87, '√3/2'], 45: [0.71, '√2/2'], 60: [0.5, '1/2'] };

export const FAMILIAS = [
  // ======================= FÍSICA: GRAVITAÇÃO =======================
  fam(F, ['Gravitação', 'Lei da Gravitação Universal'], 'enem', 3, 80, r => {
    const MULT = { 1: null, 2: 'dobra', 3: 'triplica', 4: 'quadruplica', 0.5: 'cai pela metade' };
    const k1 = r.pick([1, 1, 2, 3, 4, 0.5]), k2 = r.pick([1, 1, 2, 3, 0.5]), kd = r.pick([1, 2, 3, 4, 0.5]);
    const fator = k1 * k2 / (kd * kd);
    if (Math.abs(fator - 1) < 1e-9 || (k1 === 1 && k2 === 1 && kd === 1)) return null;
    const fmt = f => Math.abs(f - 1) < 1e-9 ? 'igual à inicial' : f > 1 ? `${num(r2(f))} vezes maior` : `${num(r2(1 / f))} vezes menor`;
    const o = opcoes(r, fmt(fator), [fmt(k1 * k2 / kd), fmt(k1 * k2 * kd * kd), fmt(k1 * k2 * kd), fmt(1 / fator), fmt(fator * 2), fmt((k1 + k2) / (kd * kd)), fmt(k1 * k2 / kd ** 3), 'igual à inicial']);
    const partes = [];
    if (k1 !== 1) partes.push(`a massa do primeiro corpo ${MULT[k1]}`);
    if (k2 !== 1) partes.push(`a massa do segundo corpo ${MULT[k2]}`);
    if (kd !== 1) partes.push(`a distância entre os seus centros ${MULT[kd]}`);
    const ctx = r.pick(['Dois corpos se atraem gravitacionalmente.', 'Dois asteroides estão isolados no espaço e se atraem apenas pela gravidade.', 'Uma sonda e uma lua se atraem gravitacionalmente.']);
    return o && { ...o, statement: `${ctx} Se ${partes.join(' e ').replace(/ e (?=[^e]*$)/, ' e ')}, a nova força de atração fica, em relação à inicial:`,
      explanation: `Pela Lei da Gravitação Universal, F = G·M·m/d². A força é proporcional ao produto das massas e inversamente proporcional ao quadrado da distância: F' = F · (${num(k1)} · ${num(k2)})/(${num(kd)})² = F · ${num(r2(fator))}. Logo a força fica ${fmt(fator)}.`,
      hint: 'Massas entram multiplicando; a distância entra ao quadrado, dividindo.' };
  }),
  fam(F, ['Gravitação', 'Gravidade em altitude'], 'medio', 4, 60, r => {
    const astro = r.pick([['da Terra', 10], ['da Terra', 9.8], ['de Marte', 3.7], ['da Lua', 1.6], ['de um planeta hipotético', 12], ['de um planeta hipotético', 8]]);
    const k = r.pick([0.5, 1, 2, 3, 4, 9]), g0 = astro[1], gp = g0 / ((1 + k) ** 2);
    const alt = k === 0.5 ? 'metade do raio' : k === 1 ? 'um raio' : `${k} raios`;
    if (r.chance(0.35)) {
      const n = r.pick([2, 3, 4, 5, 10]);
      const o = opcoes(r, n === 2 ? 'um raio' : `${n - 1} raios`, [`${n} raios`, `${n * n} raios`, `${n * n - 1} raios`, `${n + 1} raios`, 'metade do raio', `${n - 1 === 1 ? 2 : (n - 1) * 2} raios`]);
      return o && { ...o, statement: `A que altitude, medida a partir da superfície ${astro[0]}, a aceleração da gravidade vale 1/${n * n} do valor que tem na superfície? Dê a resposta em raios do astro.`,
        explanation: `g = GM/d². Para g ficar ${n * n} vezes menor, d² precisa ficar ${n * n} vezes maior, ou seja, d = ${n}R. A altitude é d − R = ${n - 1}R.`,
        hint: 'Primeiro ache a distância ao centro; depois desconte o raio.' };
    }
    const u = v => unid(r2(v), 'm/s²');
    const o = opcoes(r, u(gp), [u(g0 / (1 + k)), u(g0 / (k * k)), u(g0 / (k + 2) ** 2), u(g0), u(g0 * (1 + k) ** -3), u(g0 / (2 * (1 + k)))]);
    return o && { ...o, statement: `Na superfície ${astro[0]} a aceleração da gravidade vale ${num(g0)} m/s². Qual é o valor aproximado da gravidade a uma altitude igual a ${alt} desse astro, medida a partir da superfície?`,
      explanation: `g = GM/d². Na altitude pedida, a distância ao centro é R + ${num(k)}R = ${num(1 + k)}R. Então g' = ${num(g0)}/(${num(1 + k)})² ≈ ${num(r2(gp))} m/s².`,
      hint: 'A distância na fórmula é medida até o CENTRO do astro: raio + altitude.' };
  }),
  fam(F, ['Gravitação', 'Leis de Kepler'], 'enem', 3, 60, r => {
    const k = r.pick([4, 9, 16, 25, 1 / 4, 1 / 9, 1 / 16]);
    const ref = r.pick([['a Terra', 1, 'ano', 'anos'], ['um satélite A', r.pick([2, 3, 5, 8, 10]), 'dia', 'dias'], ['um planeta A', r.pick([2, 3, 6]), 'ano', 'anos']]);
    const T0 = ref[1], Tp = T0 * Math.sqrt(k ** 3);
    const fmt = v => `${num(r2(v))} ${r2(v) === 1 ? ref[2] : ref[3]}`;
    const o = opcoes(r, fmt(Tp), [fmt(T0 * k), fmt(T0 * k * k), fmt(T0 * Math.sqrt(k)), fmt(T0 * k ** 3), fmt(Tp * 2), fmt(T0 / Math.sqrt(k ** 3))]);
    const raio = k < 1 ? `1/${num(1 / k)} do raio` : `${k} vezes o raio`;
    const [c1, c2] = ref[0] === 'a Terra' ? ['em torno do Sol', 'em torno do Sol'] : ref[0].startsWith('um satélite') ? ['em torno de um planeta', 'em torno do mesmo planeta'] : ['em torno de uma estrela', 'em torno da mesma estrela'];
    const de = ref[0] === 'a Terra' ? 'da Terra' : ref[0].startsWith('um satélite') ? 'do satélite A' : 'do planeta A';
    return o && { ...o, statement: `${cap(ref[0])} completa uma volta ${c1} em ${fmt(T0)}. Um corpo B gira ${c2}, em órbita aproximadamente circular, com raio igual a ${raio} da órbita ${de}. Pela terceira lei de Kepler, o período de B é de aproximadamente:`,
      explanation: `Pela 3ª lei de Kepler, T²/R³ é o mesmo para corpos que orbitam o mesmo astro. T_B² = T_A² · (${num(r2(k))})³ ⇒ T_B = ${num(T0)} · √${num(r2(k ** 3))} ≈ ${fmt(Tp)}.`,
      hint: 'T² é proporcional a R³: eleve a razão dos raios ao cubo e tire a raiz quadrada.' };
  }),
  fam(F, ['Gravitação', 'Velocidade orbital'], 'medio', 4, 40, r => {
    const k = r.pick([2, 4, 9, 16, 25, 1 / 4, 1 / 9, 1 / 16]), v = 1 / Math.sqrt(k);
    const fmt = x => Math.abs(x - 1) < 1e-9 ? 'não se altera' : x >= 1 ? `fica ${num(r2(x))} vezes maior` : `fica ${num(r2(1 / x))} vezes menor`;
    const pede = r.pick(['velocidade', 'periodo']);
    if (pede === 'periodo') {
      const T = Math.sqrt(k ** 3);
      const o = opcoes(r, fmt(T), [fmt(k), fmt(1 / T), fmt(Math.sqrt(k)), fmt(k * k), 'não se altera']);
      return o && { ...o, statement: `O raio da órbita circular de um satélite é multiplicado por ${k < 1 ? '1/' + num(1 / k) : num(k)}. O período de revolução desse satélite:`,
        explanation: `v = √(GM/R) e T = 2πR/v, o que leva a T² = 4π²R³/(GM). Com R multiplicado por ${num(r2(k))}, T fica multiplicado por √(${num(r2(k))})³ ≈ ${num(r2(T))}.`,
        hint: 'Período ao quadrado é proporcional ao raio ao cubo.' };
    }
    const o = opcoes(r, fmt(v), [fmt(1 / k), fmt(k), fmt(Math.sqrt(k)), fmt(v * v), fmt(k * k), 'não se altera']);
    return o && { ...o, statement: `Um satélite em órbita circular tem o raio da órbita multiplicado por ${k < 1 ? '1/' + num(1 / k) : num(k)}. Sua velocidade orbital:`,
      explanation: `A força gravitacional faz o papel de resultante centrípeta: GMm/R² = mv²/R ⇒ v = √(GM/R). Com R multiplicado por ${num(r2(k))}, v fica multiplicada por 1/√${num(r2(k))} ≈ ${num(r2(v))}. Não depende da massa do satélite.`,
      hint: 'Iguale a força gravitacional à força centrípeta.' };
  }),
  fam(F, ['Gravitação', 'Peso em outros astros'], 'enem', 2, 60, r => {
    const m = r.pick([45, 50, 60, 70, 80, 90]), km = r.pick([2, 3, 4, 8, 1 / 2, 1 / 4, 1 / 10]), kr = r.pick([2, 1 / 2, 1, 3]); const gp = 10 * km / (kr * kr);
    if (gp === 10) return null;
    const o = opcoes(r, unid(r2(m * gp), 'N'), [unid(r2(m * 10 * km / kr), 'N'), unid(m * 10, 'N'), unid(r2(m * 10 * km), 'N'), unid(r2(m * gp / 10), 'N'), unid(r2(m * 10 / (km * kr * kr)), 'N'), unid(r2(m * 10 * km * kr * kr), 'N')]);
    const massa = km >= 1 ? `${num(km)} vezes a massa` : `1/${num(1 / km)} da massa`;
    const raio = kr === 1 ? 'o mesmo raio' : kr > 1 ? `${num(kr)} vezes o raio` : 'metade do raio';
    return o && { ...o, statement: `Um astronauta de ${m} kg chega a um planeta com ${massa} da Terra e ${raio} terrestre. Considerando g = 10 m/s² na Terra, o peso do astronauta nesse planeta é:`,
      explanation: `g = GM/R². No planeta, g' = 10 · ${num(r2(km))}/(${num(kr)})² = ${num(r2(gp))} m/s². Peso: P = m·g' = ${m} · ${num(r2(gp))} = ${num(r2(m * gp))} N. A massa (${m} kg) não muda.`,
      hint: 'A massa é a mesma em qualquer lugar; o que muda é a gravidade.' };
  }),
  // ======================= FÍSICA: MHS E ONDAS SONORAS =======================
  fam(F, ['Oscilações', 'Movimento harmônico simples (MHS)'], 'medio', 3, 60, r => {
    const tipo = r.chance(0.5) ? 'mola' : 'pendulo', k = r.pick([4, 9, 16, 1 / 4]);
    const fmt = x => x >= 1 ? `multiplicado por ${num(r2(x))}` : `dividido por ${num(r2(1 / x))}`;
    const ok = fmt(Math.sqrt(k));
    const o = opcoes(r, ok, [fmt(k), fmt(1 / Math.sqrt(k)), fmt(k * k), fmt(1 / k), 'o mesmo']);
    const st = tipo === 'mola' ? `Em um oscilador massa-mola ideal, a massa presa à mola é ${k >= 1 ? 'multiplicada' : 'dividida'} por ${num(k >= 1 ? k : 1 / k)}, sem trocar a mola. O período de oscilação fica:` : `Um pêndulo simples oscila com pequena amplitude. Se o comprimento do fio for ${k >= 1 ? 'multiplicado' : 'dividido'} por ${num(k >= 1 ? k : 1 / k)}, o período fica:`;
    return o && { ...o, statement: st, explanation: tipo === 'mola' ? `T = 2π√(m/k). O período é proporcional à raiz da massa: √${num(r2(k))} = ${num(r2(Math.sqrt(k)))}. Logo T fica ${ok}.` : `T = 2π√(L/g). O período é proporcional à raiz do comprimento: √${num(r2(k))} = ${num(r2(Math.sqrt(k)))}. Logo T fica ${ok}. A massa do pêndulo não influi.`,
      hint: 'O período depende da RAIZ QUADRADA da grandeza que mudou.' };
  }),
  fam(F, ['Ondulatória', 'Cordas e tubos sonoros'], 'medio', 4, 40, r => {
    const L = r.pick([0.5, 0.6, 0.8, 1, 1.2]), v = r.pick([240, 300, 360, 480]), n = r.int(1, 4), f = n * v / (2 * L);
    const o = opcoes(r, unid(r1(f), 'Hz'), vizinhos(r, r1(f), x => unid(x, 'Hz'), [r1(v / (2 * L)), r1(n * v / L), r1(n * v / (4 * L)), r1(v * 2 * L)]));
    return o && { ...o, statement: `Uma corda de violão de ${num(L)} m, presa nas duas extremidades, tem ondas que se propagam a ${v} m/s. Qual é a frequência do ${n === 1 ? '1º harmônico (som fundamental)' : n + 'º harmônico'}?`,
      explanation: `Na corda presa nas pontas, fₙ = n·v/(2L). f${n} = ${n}·${v}/(2·${num(L)}) = ${num(r1(f))} Hz.`,
      hint: 'Corda presa nas duas pontas: o fundamental tem comprimento de onda igual a 2L.' };
  }),
  // ======================= FÍSICA: HIDROSTÁTICA =======================
  fam(F, ['Hidrostática', 'Empuxo (Arquimedes)'], 'enem', 3, 60, r => {
    const V = r.pick([0.002, 0.005, 0.01, 0.02, 0.05]), rho = r.pick([1000, 800, 1200]), E = rho * 10 * V;
    const liq = rho === 1000 ? 'água (1.000 kg/m³)' : rho === 800 ? 'óleo (800 kg/m³)' : 'água salgada (1.200 kg/m³)';
    const o = opcoes(r, unid(r1(E), 'N'), vizinhos(r, r1(E), x => unid(x, 'N'), [r1(rho * V), r1(E * 10), r1(10 * V * 1000)]));
    return o && { ...o, statement: `Um objeto de volume ${num(V * 1000)} litros fica totalmente mergulhado em ${liq}. Considerando g = 10 m/s², qual é o empuxo sobre ele?`,
      explanation: `E = ρ·g·V. V = ${num(V * 1000)} L = ${num(V)} m³. E = ${rho}·10·${num(V)} = ${num(r1(E))} N.`,
      hint: '1 litro = 0,001 m³. O empuxo é o peso do líquido deslocado.' };
  }),
  fam(F, ['Hidrostática', 'Flutuação'], 'enem', 3, 40, r => {
    const pc = r.pick([200, 300, 400, 500, 600, 700, 800, 900]), pl = r.pick([1000, 1000, 1200]); const fra = pc / pl * 100;
    const o = opcoes(r, `${num(r1(fra))}%`, [`${num(r1(100 - fra))}%`, `${num(r1(pl / pc * 10))}%`, '100%', `${num(r1(fra / 2))}%`, `${num(r1(Math.min(99, fra + 15)))}%`]);
    return o && { ...o, statement: `Um bloco maciço de densidade ${pc} kg/m³ flutua em equilíbrio num líquido de densidade ${pl} kg/m³. Que porcentagem do volume do bloco fica submersa?`,
      explanation: `No equilíbrio, peso = empuxo: ρc·V·g = ρL·Vsub·g ⇒ Vsub/V = ρc/ρL = ${pc}/${pl} = ${num(r1(fra))}%.`,
      hint: 'Fração submersa = densidade do corpo ÷ densidade do líquido.' };
  }),
  // ======================= FÍSICA: DINÂMICA =======================
  fam(F, ['Dinâmica', 'Plano inclinado'], 'medio', 3, 40, r => {
    const ang = r.pick([30, 60]), m = r.pick([2, 4, 5, 10]); const a = 10 * SEN[ang][0];
    const pedeA = r.chance(0.5);
    const val = pedeA ? r1(a) : r1(m * a), u = pedeA ? 'm/s²' : 'N';
    const o = opcoes(r, unid(val, u), vizinhos(r, val, x => unid(x, u), pedeA ? [r1(10 * COS[ang][0]), 10] : [r1(m * 10 * COS[ang][0]), m * 10]));
    return o && { ...o, statement: `Um bloco de ${m} kg desliza sem atrito por um plano inclinado de ${ang}° com a horizontal. Considere g = 10 m/s² e sen ${ang}° ≈ ${num(SEN[ang][0])}. ${pedeA ? 'Qual é a aceleração do bloco?' : 'Qual é a componente do peso paralela ao plano?'}`,
      explanation: `A componente do peso paralela ao plano é P·sen θ = ${m}·10·${num(SEN[ang][0])} = ${num(r1(m * a))} N. Sem atrito, a = g·sen θ = ${num(r1(a))} m/s².`,
      hint: 'No plano inclinado: Px = P·sen θ (paralela) e Py = P·cos θ (perpendicular).' };
  }),
  fam(F, ['Dinâmica', 'Força de atrito'], 'enem', 3, 50, r => {
    const m = r.pick([2, 4, 5, 8, 10, 20]), mu = r.pick([0.1, 0.2, 0.25, 0.3, 0.4, 0.5]), Fa = r.pick([20, 30, 40, 50, 60, 80, 100]);
    const fat = mu * m * 10; if (Fa <= fat) return null; const a = (Fa - fat) / m;
    const o = opcoes(r, unid(r2(a), 'm/s²'), vizinhos(r, r2(a), x => unid(x, 'm/s²'), [r2(Fa / m), r2((Fa + fat) / m), r2(fat / m)]));
    return o && { ...o, statement: `Uma caixa de ${m} kg é puxada por uma força horizontal de ${Fa} N sobre um piso com coeficiente de atrito cinético ${num(mu)}. Com g = 10 m/s², qual é a aceleração da caixa?`,
      explanation: `Atrito: fat = μ·N = ${num(mu)}·${m * 10} = ${num(fat)} N. Resultante: ${Fa} − ${num(fat)} = ${num(Fa - fat)} N. a = FR/m = ${num(Fa - fat)}/${m} = ${num(r2(a))} m/s².`,
      hint: 'Primeiro ache a força de atrito (μ·N); depois a resultante.' };
  }),
  fam(F, ['Dinâmica', 'Impulso e colisões'], 'medio', 3, 60, r => {
    const m1 = r.pick([1, 2, 3, 4]), v1 = r.pick([4, 6, 8, 10, 12]), m2 = r.pick([1, 2, 3, 4, 6]);
    const v = m1 * v1 / (m1 + m2);
    const o = opcoes(r, unid(r2(v), 'm/s'), vizinhos(r, r2(v), x => unid(x, 'm/s'), [v1, r2(v1 / 2), r2(m1 * v1 / m2)]));
    return o && { ...o, statement: `Um carrinho de ${m1} kg a ${v1} m/s colide com outro de ${m2} kg, parado, e os dois seguem grudados. Desprezando atritos, qual é a velocidade do conjunto logo após a colisão?`,
      explanation: `Conservação da quantidade de movimento: ${m1}·${v1} = (${m1} + ${m2})·v ⇒ v = ${m1 * v1}/${m1 + m2} = ${num(r2(v))} m/s. É uma colisão perfeitamente inelástica.`,
      hint: 'Na colisão a quantidade de movimento total (m·v) se conserva.' };
  }),
  fam(F, ['Estática', 'Alavancas e momento'], 'enem', 2, 40, r => {
    const P1 = r.pick([200, 300, 400, 500, 600]), d1 = r.pick([0.5, 1, 1.5, 2]), d2 = r.pick([2, 2.5, 3, 4]); const P2 = P1 * d1 / d2;
    const o = opcoes(r, unid(r1(P2), 'N'), vizinhos(r, r1(P2), x => unid(x, 'N'), [P1, r1(P1 * d2 / d1)]));
    return o && { ...o, statement: `Uma pessoa usa uma barra rígida como alavanca para levantar uma pedra de ${P1} N, que fica a ${num(d1)} m do ponto de apoio. A pessoa empurra a ${num(d2)} m do apoio, do outro lado. Qual é a força mínima para equilibrar a pedra?`,
      explanation: `No equilíbrio, os momentos se igualam: F·${num(d2)} = ${P1}·${num(d1)} ⇒ F = ${num(r1(P2))} N.`,
      hint: 'Força × distância ao apoio é igual dos dois lados.' };
  }),
  // ======================= FÍSICA: LANÇAMENTO OBLÍQUO =======================
  fam(F, ['Cinemática', 'Lançamento oblíquo'], 'medio', 4, 40, r => {
    const v = r.pick([10, 20, 30, 40]), ang = r.pick([30, 45, 60]); const vy = v * SEN[ang][0], vx = v * COS[ang][0];
    const pede = r.pick(['h', 't']);
    const h = vy * vy / 20, t = 2 * vy / 10;
    const [val, u] = pede === 'h' ? [r1(h), 'm'] : [r1(t), 's'];
    const o = opcoes(r, unid(val, u), vizinhos(r, val, x => unid(x, u), pede === 'h' ? [r1(v * v / 20), r1(vx * vx / 20)] : [r1(vy / 10), r1(2 * v / 10)]));
    return o && { ...o, statement: `Uma bola é chutada do chão com velocidade de ${v} m/s, formando ${ang}° com a horizontal. Despreze a resistência do ar e use g = 10 m/s², sen ${ang}° ≈ ${num(SEN[ang][0])} e cos ${ang}° ≈ ${num(COS[ang][0])}. ${pede === 'h' ? 'Qual é a altura máxima atingida?' : 'Quanto tempo a bola fica no ar até voltar ao chão?'}`,
      explanation: `Componente vertical: vy = ${v}·${num(SEN[ang][0])} = ${num(r2(vy))} m/s. Altura máxima: H = vy²/(2g) = ${num(r1(h))} m. Tempo de subida: vy/g = ${num(r2(vy / 10))} s; tempo total = ${num(r1(t))} s.`,
      hint: 'Separe o movimento: na vertical é um lançamento para cima; na horizontal, velocidade constante.' };
  }),
  // ======================= FÍSICA: TERMODINÂMICA =======================
  fam(F, ['Termodinâmica', 'Primeira lei da termodinâmica'], 'medio', 3, 50, r => {
    const Qv = r.pick([200, 300, 500, 800, 1000, 1200]), W = r.pick([100, 150, 200, 250, 400]); if (W >= Qv) return null;
    const o = opcoes(r, unid(Qv - W, 'J'), [unid(Qv + W, 'J'), unid(W, 'J'), unid(Qv, 'J'), unid(W - Qv, 'J'), unid(Qv / 2, 'J')]);
    return o && { ...o, statement: `Um gás recebe ${Qv} J de calor e, ao se expandir, realiza ${W} J de trabalho sobre o ambiente. Qual é a variação da sua energia interna?`,
      explanation: `1ª lei: Q = τ + ΔU ⇒ ΔU = ${Qv} − ${W} = ${Qv - W} J. A energia interna aumenta, então a temperatura do gás sobe.`,
      hint: 'Calor recebido é positivo; trabalho realizado PELO gás é positivo.' };
  }),
  fam(F, ['Termodinâmica', 'Máquinas térmicas e ciclo de Carnot'], 'medio', 4, 40, r => {
    const Tq = r.pick([400, 500, 600, 800, 1000]), Tf = r.pick([200, 250, 300]); if (Tf >= Tq) return null; const n = (1 - Tf / Tq) * 100;
    const o = opcoes(r, `${num(r1(n))}%`, [`${num(r1(Tf / Tq * 100))}%`, '100%', `${num(r1(n / 2))}%`, `${num(r1(Math.min(99, n + 10)))}%`, `${num(r1((Tq - Tf) / Tf * 100))}%`]);
    return o && { ...o, statement: `Uma máquina térmica ideal de Carnot opera entre uma fonte quente a ${Tq} K e uma fonte fria a ${Tf} K. Qual é o seu rendimento máximo?`,
      explanation: `η = 1 − Tf/Tq = 1 − ${Tf}/${Tq} = ${num(r2(1 - Tf / Tq))} = ${num(r1(n))}%. Nenhuma máquina real entre essas temperaturas passa desse valor (2ª lei da termodinâmica).`,
      hint: 'Use as temperaturas em kelvin: η = 1 − Tfria/Tquente.' };
  }),
  // ======================= FÍSICA: ÓPTICA =======================
  fam(F, ['Óptica', 'Refração da luz'], 'medio', 3, 40, r => {
    const n = r.pick([1.2, 1.25, 1.5, 1.6, 2, 2.4, 2.5, 3]), c = 300000; const v = c / n;
    if (r.chance(0.5)) {
      const meio = r.pick(['um vidro especial', 'um cristal', 'um acrílico', 'um líquido transparente', 'um mineral lapidado']);
      const o = opcoes(r, num(n), [num(r2(1 / n)), num(r2(n * 2)), num(r2(n + 0.5)), num(r2(n - 0.2)), num(r2(n * n))].filter(x => x !== num(n)));
      return o && { ...o, statement: `A luz se propaga em ${meio} a ${num(Math.round(v))} km/s. Sendo 300.000 km/s a velocidade da luz no vácuo, o índice de refração absoluto desse material é:`,
        explanation: `n = c/v = 300.000/${num(Math.round(v))} = ${num(n)}. O índice é sempre maior que 1 em meios materiais.`, hint: 'Índice de refração: velocidade no vácuo dividida pela velocidade no meio.' };
    }
    const o = opcoes(r, `${num(Math.round(v))} km/s`, [`${num(Math.round(c * n))} km/s`, `${num(c)} km/s`, `${num(Math.round(c / (n * n)))} km/s`, `${num(Math.round(v / 2))} km/s`, `${num(Math.round(c - n * 1000))} km/s`]);
    return o && { ...o, statement: `O índice de refração absoluto de um material transparente é ${num(n)}. Sendo a velocidade da luz no vácuo 300.000 km/s, qual é a velocidade da luz nesse material?`,
      explanation: `n = c/v ⇒ v = c/n = 300.000/${num(n)} = ${num(Math.round(v))} km/s.`, hint: 'Quanto maior o índice de refração, mais devagar a luz anda no meio.' };
  }),
  fam(F, ['Óptica', 'Espelhos planos'], 'enem', 2, 30, r => {
    const a = r.pick([20, 24, 30, 36, 40, 45, 60, 72, 90, 120]); const N = 360 / a - 1;
    if (r.chance(0.45)) {
      const o = opcoes(r, `${a}°`, [`${360 / N}°`, `${360 / (N + 2)}°`, `${a * 2}°`, `${Math.round(a / 2)}°`, `${180 / (N + 1)}°`].filter(x => x !== `${a}°`));
      return o && { ...o, statement: `Num salão, dois espelhos planos verticais são associados de modo que um objeto entre eles forma ${N} imagens. Qual é o ângulo entre os espelhos?`,
        explanation: `N = 360°/α − 1 ⇒ ${N} + 1 = 360/α ⇒ α = 360/${N + 1} = ${a}°.`, hint: 'Some 1 ao número de imagens e divida 360° pelo resultado.' };
    }
    const o = opcoes(r, String(N), [String(360 / a), String(N - 1), String(N + 2), String(a / 10), String(2 * N)]);
    return o && { ...o, statement: `Dois espelhos planos formam entre si um ângulo de ${a}°. Um objeto colocado entre eles terá quantas imagens?`,
      explanation: `N = 360°/α − 1 = 360/${a} − 1 = ${N} imagens.`, hint: 'Use N = 360/α − 1.' };
  }),
  fam(F, ['Óptica', 'Óptica da visão (vergência)'], 'medio', 3, 30, r => {
    const f = r.pick([0.2, 0.25, 0.4, 0.5, 1, 2, -0.2, -0.4, -0.5, -0.25, -1, -2]), V = 1 / f;
    const tipo = f > 0 ? 'convergente' : 'divergente';
    const o = opcoes(r, `${V > 0 ? '+' : ''}${num(r2(V))} di, lente ${tipo}`, [`${V > 0 ? '−' : '+'}${num(Math.abs(r2(V)))} di, lente ${f > 0 ? 'divergente' : 'convergente'}`, `${num(Math.abs(f))} di, lente ${tipo}`, `${V > 0 ? '+' : ''}${num(r2(V * 2))} di, lente ${tipo}`, `${V > 0 ? '+' : ''}${num(r2(V / 2))} di, lente ${tipo}`, `${num(Math.abs(r2(V)))} di, lente cilíndrica`]);
    return o && { ...o, statement: `Uma lente de óculos tem distância focal de ${num(f * 100)} cm (o sinal negativo indica foco virtual). Qual é a sua vergência ("grau") e o tipo de lente?`,
      explanation: `V = 1/f, com f em metros: V = 1/(${num(f)}) = ${num(r2(V))} di. Vergência ${V > 0 ? 'positiva: lente convergente, usada para hipermetropia e presbiopia' : 'negativa: lente divergente, usada para miopia'}.`,
      hint: 'Converta a distância focal para metros antes de calcular 1/f.' };
  }),
  // ======================= FÍSICA: ELETRICIDADE E MAGNETISMO =======================
  fam(F, ['Eletrostática', 'Campo e potencial elétrico'], 'medio', 4, 40, r => {
    const Q = r.pick([2, 3, 4, 5, 6, 8]), d = r.pick([0.1, 0.2, 0.3, 0.5]), k = 9e9; const pedeE = r.chance(0.5);
    const E = k * Q * 1e-6 / (d * d), V = k * Q * 1e-6 / d;
    const val = pedeE ? E : V, u = pedeE ? 'N/C' : 'V';
    const f = x => `${num(r2(x / 10 ** Math.floor(Math.log10(x))))} · 10${'⁰¹²³⁴⁵⁶⁷⁸⁹'[Math.floor(Math.log10(x))]} ${u}`;
    const o = opcoes(r, f(val), [f(pedeE ? V : E), f(val * 10), f(val / 10), f(pedeE ? E * d * d * 4 / d : V * 2), f(val * 3)]);
    return o && { ...o, statement: `Uma carga puntiforme de ${Q} μC está no vácuo (k = 9·10⁹ N·m²/C²). Qual é ${pedeE ? 'a intensidade do campo elétrico' : 'o potencial elétrico'} a ${num(d * 100)} cm dela?`,
      explanation: pedeE ? `E = kQ/d² = 9·10⁹ · ${Q}·10⁻⁶ / (${num(d)})² = ${f(E)}.` : `V = kQ/d = 9·10⁹ · ${Q}·10⁻⁶ / ${num(d)} = ${f(V)}.`,
      hint: pedeE ? 'Campo: distância ao quadrado.' : 'Potencial: distância sem quadrado.' };
  }),
  fam(F, ['Eletrostática', 'Capacitores'], 'medio', 3, 40, r => {
    const C1 = r.pick([2, 3, 4, 6]), C2 = r.pick([3, 4, 6, 12]), serie = r.chance(0.5); const Ceq = serie ? C1 * C2 / (C1 + C2) : C1 + C2;
    const o = opcoes(r, `${num(r2(Ceq))} μF`, [`${num(r2(serie ? C1 + C2 : C1 * C2 / (C1 + C2)))} μF`, `${num(C1 * C2)} μF`, `${num(r2(Math.abs(C1 - C2)) || 1)} μF`, `${num(r2((C1 + C2) / 2))} μF`, `${num(r2(Ceq * 2))} μF`]);
    return o && { ...o, statement: `Dois capacitores, de ${C1} μF e ${C2} μF, são ligados em ${serie ? 'série' : 'paralelo'}. Qual é a capacitância equivalente?`,
      explanation: serie ? `Em série: 1/Ceq = 1/${C1} + 1/${C2} ⇒ Ceq = ${C1}·${C2}/(${C1}+${C2}) = ${num(r2(Ceq))} μF.` : `Em paralelo as capacitâncias se somam: ${C1} + ${C2} = ${Ceq} μF.`,
      hint: 'Capacitores fazem o contrário dos resistores: em paralelo, somam.' };
  }),
  fam(F, ['Eletromagnetismo', 'Força magnética'], 'medio', 4, 40, r => {
    const B0 = r.pick([0.2, 0.5, 1, 2]), i = r.pick([2, 4, 5, 10]), L = r.pick([0.1, 0.2, 0.5, 1]); const Fm = B0 * i * L;
    const o = opcoes(r, unid(r2(Fm), 'N'), vizinhos(r, r2(Fm), x => unid(x, 'N'), [r2(B0 * i), r2(i * L), r2(B0 * L)]));
    return o && { ...o, statement: `Um fio reto de ${num(L * 100)} cm, percorrido por corrente de ${i} A, está perpendicular a um campo magnético uniforme de ${num(B0)} T. Qual é a intensidade da força magnética sobre o fio?`,
      explanation: `F = B·i·L·sen θ = ${num(B0)}·${i}·${num(L)}·1 = ${num(r2(Fm))} N. A direção é dada pela regra da mão esquerda (ou do tapa).`,
      hint: 'Fio perpendicular ao campo: sen 90° = 1.' };
  }),
  fam(F, ['Eletromagnetismo', 'Indução eletromagnética'], 'medio', 4, 30, r => {
    const dPhi = r.pick([0.2, 0.4, 0.6, 1.2, 2]), dt = r.pick([0.1, 0.2, 0.4, 0.5]), N = r.pick([1, 10, 50, 100]); const e = N * dPhi / dt;
    const o = opcoes(r, unid(r2(e), 'V'), vizinhos(r, r2(e), x => unid(x, 'V'), [r2(dPhi / dt), r2(N * dPhi * dt)]));
    return o && { ...o, statement: `O fluxo magnético através de ${N === 1 ? 'uma espira' : `cada uma das ${N} espiras de uma bobina`} varia ${num(dPhi)} Wb em ${num(dt)} s. Qual é o módulo da força eletromotriz induzida média?`,
      explanation: `Lei de Faraday: ε = N·ΔΦ/Δt = ${N}·${num(dPhi)}/${num(dt)} = ${num(r2(e))} V. O sinal (Lei de Lenz) indica que a corrente induzida se opõe à variação do fluxo.`,
      hint: 'Faraday: fem = número de espiras × variação do fluxo ÷ tempo.' };
  }),
  // ======================= FÍSICA COM FIGURA =======================
  fam(F, ['Cinemática', 'Gráficos do movimento'], 'enem', 3, 60, r => {
    const s0 = r.pick([0, 10, 20, 40]), v = r.pick([2, 4, 5, 8, 10]) * (r.chance(0.25) ? -1 : 1), t = r.pick([4, 5, 8, 10]);
    const s1 = s0 + v * t; if (s1 < 0) return null;
    const ymax = Math.max(s0, s1) * 1.25 || 10, passo = Math.ceil(ymax / 5 / 10) * 10 || 10;
    const figura = fig.linha({ pontos: [[0, s0], [t, s1]], xl: 't (s)', yl: 's (m)', xs: [t / 2, t].filter(Number.isInteger), ys: [s0, s1].filter((x, i, a) => a.indexOf(x) === i && x > 0), xmax: t * 1.2, ymax: Math.max(ymax, passo) });
    const o = opcoes(r, `${num(v)} m/s`, [`${num(-v)} m/s`, `${num(r2(s1 / t))} m/s`, `${num(v * 2)} m/s`, `${num(r2(v / 2))} m/s`, `${num(s1 - s0)} m/s`]);
    return o && { ...o, figura, statement: `O gráfico mostra a posição de um ciclista em função do tempo, em uma ciclovia retilínea. Qual é a velocidade do ciclista?`,
      explanation: `No gráfico s × t de um movimento uniforme, a velocidade é a inclinação: v = Δs/Δt = (${num(s1)} − ${num(s0)})/(${t} − 0) = ${num(v)} m/s.${v < 0 ? ' O sinal negativo indica movimento retrógrado (a posição diminui).' : ''}`,
      hint: 'Velocidade = variação da posição ÷ variação do tempo (inclinação da reta).' };
  }),
  fam(F, ['Cinemática', 'Gráficos do movimento'], 'enem', 3, 60, r => {
    const v0 = r.pick([0, 2, 4, 5, 10]), a = r.pick([1, 2, 3, 4, 5]), t = r.pick([2, 3, 4, 5, 6]); const v1 = v0 + a * t;
    const pedeA = r.chance(0.5), d = (v0 + v1) / 2 * t;
    const figura = fig.linha({ pontos: [[0, v0], [t, v1]], xl: 't (s)', yl: 'v (m/s)', xs: [t], ys: [v0, v1].filter(x => x > 0), xmax: t * 1.25, ymax: v1 * 1.25 });
    const val = pedeA ? `${num(a)} m/s²` : `${num(d)} m`;
    const ds = pedeA ? [`${num(r2(v1 / t))} m/s²`, `${num(v1)} m/s²`, `${num(a * 2)} m/s²`, `${num(r2(a / 2))} m/s²`, `${num(t)} m/s²`] : [`${num(v1 * t)} m`, `${num(v1 * t / 2)} m`, `${num(v0 * t)} m`, `${num(d * 2)} m`, `${num(a * t)} m`];
    const o = opcoes(r, val, ds);
    return o && { ...o, figura, statement: `O gráfico mostra a velocidade de um carro em função do tempo, nos primeiros ${t} segundos após o sinal abrir. ${pedeA ? 'Qual é a aceleração do carro nesse intervalo?' : 'Qual é a distância percorrida nesse intervalo?'}`,
      explanation: pedeA ? `a = Δv/Δt = (${num(v1)} − ${num(v0)})/${t} = ${num(a)} m/s² (inclinação da reta no gráfico v × t).` : `No gráfico v × t, a distância é a área sob a reta: um trapézio com bases ${num(v0)} e ${num(v1)} e altura ${t}. d = (${num(v0)} + ${num(v1)})·${t}/2 = ${num(d)} m.`,
      hint: pedeA ? 'Inclinação do gráfico v × t = aceleração.' : 'Área sob o gráfico v × t = deslocamento.' };
  }),
  fam(F, ['Eletricidade', 'Circuitos elétricos'], 'enem', 3, 60, r => {
    const Rs = r.shuffle([2, 3, 4, 5, 6, 8, 10, 12]).slice(0, r.int(2, 3)), Req = Rs.reduce((a, b) => a + b, 0), i = r.pick([0.5, 1, 1.5, 2, 3]); const U = Req * i;
    if (U > 120) return null;
    const pede = r.pick(['i', 'U1']);
    const figura = fig.circuitoSerie({ U, Rs });
    const val = pede === 'i' ? `${num(i)} A` : `${num(r2(Rs[0] * i))} V`;
    const ds = pede === 'i' ? [`${num(r2(U / Rs[0]))} A`, `${num(r2(U * Req))} A`, `${num(r2(i * 2))} A`, `${num(r2(i / 2))} A`, `${num(Req)} A`] : [`${num(U)} V`, `${num(r2(U / Rs.length))} V`, `${num(r2(Rs[1] * i))} V`, `${num(r2(Rs[0] * i * 2))} V`, `${num(Rs[0])} V`];
    const o = opcoes(r, val, ds);
    return o && { ...o, figura, statement: `No circuito da figura, o gerador é ideal e os resistores estão ligados em série. ${pede === 'i' ? 'Qual é a corrente elétrica no circuito?' : `Qual é a tensão elétrica no resistor de ${Rs[0]} Ω?`}`,
      explanation: `Em série, Req = ${Rs.join(' + ')} = ${Req} Ω. Corrente: i = U/Req = ${num(U)}/${Req} = ${num(i)} A (a mesma em todos).${pede === 'U1' ? ` No resistor de ${Rs[0]} Ω: U = R·i = ${Rs[0]}·${num(i)} = ${num(r2(Rs[0] * i))} V.` : ''}`,
      hint: 'Em série, a corrente é a mesma e as resistências se somam.' };
  }),

  // ======================= QUÍMICA =======================
  fam(Q, ['Termoquímica', 'Lei de Hess e entalpia de formação'], 'medio', 4, 60, r => {
    const comb = r.pick([
      { nome: 'metano', eq: 'CH₄(g) + 2 O₂(g) → CO₂(g) + 2 H₂O(l)', reag: [['CH₄', 1, -75]], prod: [['CO₂', 1, -394], ['H₂O', 2, -286]] },
      { nome: 'etanol', eq: 'C₂H₅OH(l) + 3 O₂(g) → 2 CO₂(g) + 3 H₂O(l)', reag: [['C₂H₅OH', 1, -278]], prod: [['CO₂', 2, -394], ['H₂O', 3, -286]] },
      { nome: 'eteno', eq: 'C₂H₄(g) + 3 O₂(g) → 2 CO₂(g) + 2 H₂O(l)', reag: [['C₂H₄', 1, 52]], prod: [['CO₂', 2, -394], ['H₂O', 2, -286]] },
      { nome: 'amônia (síntese)', eq: 'N₂(g) + 3 H₂(g) → 2 NH₃(g)', reag: [], prod: [['NH₃', 2, -46]] },
      { nome: 'monóxido de carbono', eq: 'CO(g) + ½ O₂(g) → CO₂(g)', reag: [['CO', 1, -111]], prod: [['CO₂', 1, -394]] }
    ]);
    const soma = l => l.reduce((a, [, n, h]) => a + n * h, 0);
    const dH = soma(comb.prod) - soma(comb.reag);
    if (r.chance(0.4) && comb.reag.length) {
      const nm = r.pick([2, 3, 4, 5, 10, 0.5]);
      const Q = Math.abs(dH) * nm;
      const o = opcoes(r, `${num(Q)} kJ`, [`${num(Math.abs(dH))} kJ`, `${num(Math.abs(dH) * (nm + 1))} kJ`, `${num(Math.round(Math.abs(dH) / nm))} kJ`, `${num(Q * 2)} kJ`, `${num(Math.abs(dH) * nm / 2)} kJ`]);
      return o && { ...o, statement: `A reação ${comb.eq} tem ΔH = ${num(dH)} kJ por mol de ${comb.reag[0][0]}. Qual é a quantidade de calor ${dH < 0 ? 'liberada' : 'absorvida'} quando ${num(nm)} mol de ${comb.reag[0][0]} reagem completamente?`,
        explanation: `O ΔH é proporcional à quantidade que reage: ${num(nm)} · ${num(Math.abs(dH))} = ${num(Q)} kJ ${dH < 0 ? 'liberados (reação exotérmica)' : 'absorvidos (reação endotérmica)'}.`,
        hint: 'Regra de três: o ΔH dado vale para 1 mol do reagente.' };
    }
    const tab = [...comb.reag, ...comb.prod].filter((x, i, a) => a.findIndex(y => y[0] === x[0]) === i).map(([f, , h]) => `${f}: ${num(h)} kJ/mol`).join('; ');
    const o = opcoes(r, `${num(dH)} kJ`, [`${num(-dH)} kJ`, `${num(soma(comb.prod) + soma(comb.reag))} kJ`, `${num(comb.prod.reduce((a, [, , h]) => a + h, 0) - comb.reag.reduce((a, [, , h]) => a + h, 0))} kJ`, `${num(dH * 2)} kJ`, `${num(Math.round(dH / 2))} kJ`]);
    return o && { ...o, statement: `Considere a reação ${comb.eq} e as entalpias de formação: ${tab} (substâncias simples, como O₂, N₂ e H₂, valem zero). Qual é a variação de entalpia da reação?`,
      explanation: `ΔH = ΣHf(produtos) − ΣHf(reagentes) = (${comb.prod.map(([f, n, h]) => `${n}·(${num(h)})`).join(' + ')}) − (${comb.reag.map(([f, n, h]) => `${n}·(${num(h)})`).join(' + ') || '0'}) = ${num(dH)} kJ. ${dH < 0 ? 'ΔH negativo: reação exotérmica (libera calor).' : 'ΔH positivo: reação endotérmica.'}`,
      hint: 'Produtos menos reagentes, multiplicando cada entalpia pelo coeficiente.' };
  }),
  fam(Q, ['Cinética química', 'Velocidade e lei de velocidade'], 'medio', 4, 50, r => {
    if (r.chance(0.6)) {
      const a = r.pick([1, 2]), b = r.pick([0, 1, 2]), ka = r.pick([1, 2, 3]), kb = r.pick([1, 2, 3, 4]);
      if (ka === 1 && kb === 1) return null;
      const fator = ka ** a * kb ** b, ex = '⁰¹²³';
      const lei = `v = k·[A]${a > 1 ? ex[a] : ''}${b ? '·[B]' + (b > 1 ? ex[b] : '') : ''}`;
      const muda = [ka > 1 ? `a concentração de A for multiplicada por ${ka}` : '', kb > 1 ? `a de B for multiplicada por ${kb}` : ''].filter(Boolean).join(' e ');
      const o = opcoes(r, `${fator} vezes`, [`${ka * kb} vezes`, `${ka ** a + kb ** b} vezes`, `${ka * a * kb * (b || 1)} vezes`, `${fator * 2} vezes`, `${ka ** 2 * kb ** 2} vezes`, `${ka ** a} vezes`].filter(x => x !== `${fator} vezes`));
      return o && { ...o, statement: `A lei de velocidade de uma reação A + B → produtos, obtida experimentalmente, é ${lei}. Se ${muda.replace(/^a de B/, 'a concentração de B')}, mantida a temperatura, a velocidade fica multiplicada por:`,
        explanation: `Cada concentração entra elevada à sua ordem: ${ka}${a > 1 ? ex[a] : ''} · ${kb}${b !== 1 ? ex[b] : ''} = ${fator}.${b === 0 ? ' Como a ordem em B é zero, mudar [B] não altera a velocidade.' : ''}`,
        hint: 'Multiplique os fatores, cada um elevado à ordem da espécie.' };
    }
    const ordem = r.pick([1, 2, 3]), k = r.pick([2, 3, 4]); const fator = k ** ordem;
    const o = opcoes(r, `${fator} vezes`, [`${k} vezes`, `${k * ordem} vezes`, `${k ** (ordem + 1)} vezes`, `${ordem} vezes`, `${fator / k === 1 ? k * 2 : fator / k} vezes`]);
    return o && { ...o, statement: `A lei de velocidade de uma reação é v = k·[A]${ordem > 1 ? '⁰¹²³'[ordem] : ''}. Se a concentração de A for multiplicada por ${k}, mantida a temperatura, a velocidade da reação fica multiplicada por:`,
      explanation: `A reação é de ordem ${ordem} em A. Multiplicando [A] por ${k}, a velocidade fica multiplicada por ${k}${ordem > 1 ? '⁰¹²³'[ordem] : ''} = ${fator}.`,
      hint: 'O expoente da concentração (ordem) diz quanto a velocidade cresce.' };
  }),
  fam(Q, ['Equilíbrio químico', 'Constante de equilíbrio (Kc)'], 'medio', 4, 50, r => {
    const A = r.pick([0.1, 0.2, 0.5, 1, 2]), Bc = r.pick([0.1, 0.2, 0.4, 0.5, 1]), C = r.pick([0.2, 0.4, 0.5, 1, 2]);
    const Kc = C * C / (A * Bc);
    const o = opcoes(r, num(r2(Kc)), [num(r2(C / (A * Bc))), num(r2(A * Bc / (C * C))), num(r2(2 * C / (A + Bc))), num(r2(C * C * A * Bc)), num(r2(Kc * 2))]);
    return o && { ...o, statement: `Para o equilíbrio A(g) + B(g) ⇌ 2 C(g), as concentrações no equilíbrio são [A] = ${num(A)} mol/L, [B] = ${num(Bc)} mol/L e [C] = ${num(C)} mol/L. Qual é o valor de Kc?`,
      explanation: `Kc = [C]²/([A]·[B]) = (${num(C)})²/(${num(A)}·${num(Bc)}) = ${num(r2(C * C))}/${num(r2(A * Bc))} ≈ ${num(r2(Kc))}.`,
      hint: 'Produtos sobre reagentes, cada concentração elevada ao seu coeficiente.' };
  }),
  fam(Q, ['Eletroquímica', 'Pilhas e diferença de potencial'], 'medio', 3, 50, r => {
    const P = r.shuffle([['Zn²⁺/Zn', -0.76], ['Cu²⁺/Cu', 0.34], ['Ag⁺/Ag', 0.8], ['Fe²⁺/Fe', -0.44], ['Ni²⁺/Ni', -0.25], ['Mg²⁺/Mg', -2.37], ['Pb²⁺/Pb', -0.13]]).slice(0, 2);
    const [c, a] = P[0][1] > P[1][1] ? P : [P[1], P[0]]; const ddp = r2(c[1] - a[1]);
    const o = opcoes(r, `${num(ddp)} V`, [`${num(r2(c[1] + a[1]))} V`, `${num(-ddp)} V`, `${num(r2(Math.abs(c[1]) + Math.abs(a[1]) + 0.1))} V`, `${num(r2(ddp / 2))} V`, `${num(r2(ddp + 0.5))} V`]);
    return o && { ...o, statement: `Uma pilha é montada com os pares ${P[0][0]} (E° = ${num(P[0][1])} V) e ${P[1][0]} (E° = ${num(P[1][1])} V), potenciais-padrão de redução. Qual é a ddp da pilha?`,
      explanation: `Quem tem MAIOR potencial de redução sofre redução (cátodo): ${c[0]}. O outro oxida (ânodo): ${a[0]}. ΔE = E°cátodo − E°ânodo = ${num(c[1])} − (${num(a[1])}) = ${num(ddp)} V.`,
      hint: 'ddp = maior potencial de redução − menor potencial de redução.' };
  }),
  fam(Q, ['Eletroquímica', 'Eletrólise e leis de Faraday'], 'medio', 5, 30, r => {
    const met = r.pick([['prata', 'Ag⁺', 108, 1], ['cobre', 'Cu²⁺', 63.5, 2], ['níquel', 'Ni²⁺', 58.7, 2]]), i = r.pick([2, 5, 10]), t = r.pick([965, 1930, 9650]);
    const Qc = i * t, m = Qc / 96500 / met[3] * met[2];
    const o = opcoes(r, `${num(r2(m))} g`, vizinhos(r, r2(m), x => `${num(x)} g`, [r2(Qc / 96500 * met[2]), r2(m * met[3] * met[3])]));
    return o && { ...o, statement: `Uma peça recebe banho de ${met[0]} numa eletrólise de solução com íons ${met[1]}, usando corrente de ${i} A durante ${num(t)} s. Com 1 F = 96.500 C/mol e massa molar ${num(met[2])} g/mol, qual massa de ${met[0]} se deposita?`,
      explanation: `Carga: Q = i·t = ${i}·${num(t)} = ${num(Qc)} C = ${num(r2(Qc / 96500))} mol de elétrons. Cada ${met[1]} precisa de ${met[3]} elétron(s): ${num(r2(Qc / 96500 / met[3]))} mol de ${met[0]} = ${num(r2(m))} g.`,
      hint: 'Mols de elétrons = Q/96.500. Divida pela carga do íon.' };
  }),
  fam(Q, ['Radioatividade', 'Emissões alfa e beta'], 'medio', 4, 50, r => {
    const [el, Z, A] = r.pick([['U', 92, 238], ['Th', 90, 232], ['Ra', 88, 226], ['Rn', 86, 222], ['Po', 84, 218]]), x = r.int(1, 4), y = r.int(0, 4);
    const Zf = Z - 2 * x + y, Af = A - 4 * x;
    const o = opcoes(r, `Z = ${Zf} e A = ${Af}`, [`Z = ${Z - 2 * x - y} e A = ${Af}`, `Z = ${Z - x + y} e A = ${A - 2 * x}`, `Z = ${Zf} e A = ${Af - 4}`, `Z = ${Z - 4 * x + y} e A = ${A - 2 * x}`, `Z = ${Zf + 1} e A = ${Af}`]);
    return o && { ...o, statement: `O nuclídeo ${el} (Z = ${Z}, A = ${A}) emite ${x} partícula${x > 1 ? 's' : ''} alfa e ${y} partícula${y === 1 ? '' : 's'} beta. Quais são o número atômico e o número de massa do nuclídeo final?`,
      explanation: `Cada alfa (⁴₂α) tira 2 do Z e 4 do A; cada beta (⁰₋₁β) soma 1 ao Z e não muda o A. Z = ${Z} − 2·${x} + ${y} = ${Zf}; A = ${A} − 4·${x} = ${Af}.`,
      hint: 'Alfa: −2 no Z e −4 no A. Beta: +1 no Z.' };
  }),
  fam(Q, ['Química orgânica', 'Nomenclatura de hidrocarbonetos'], 'medio', 2, 60, r => {
    const P = ['met', 'et', 'prop', 'but', 'pent', 'hex', 'hept', 'oct', 'non', 'dec'];
    const n = r.int(1, 10), tipo = n === 1 ? 'an' : r.pick(['an', 'en', 'in']);
    const H = tipo === 'an' ? 2 * n + 2 : tipo === 'en' ? 2 * n : 2 * n - 2;
    const sub = k => String(k).split('').map(c => '₀₁₂₃₄₅₆₇₈₉'[c]).join('');
    const form = (c, h) => `C${c > 1 ? sub(c) : ''}H${sub(h)}`;
    const nome = P[n - 1] + tipo + 'o';
    const pedeNome = r.chance(0.5);
    const ok = pedeNome ? nome : form(n, H);
    const outros = pedeNome ? [P[n - 1] + (tipo === 'an' ? 'en' : 'an') + 'o', P[n - 1] + (tipo === 'in' ? 'en' : 'in') + 'o', P[Math.min(9, n)] + tipo + 'o', P[Math.max(0, n - 2)] + tipo + 'o', P[(n + 2) % 10] + tipo + 'o'] : [form(n, H + 2), form(n, Math.max(2, H - 2)), form(n + 1, H), form(n, 2 * n + 4), form(Math.max(1, n - 1), H)];
    const o = opcoes(r, ok, outros);
    const cls = tipo === 'an' ? 'alcano (só ligações simples, CnH2n+2)' : tipo === 'en' ? 'alceno (uma ligação dupla, CnH2n)' : 'alcino (uma ligação tripla, CnH2n−2)';
    return o && { ...o, statement: pedeNome ? `Qual é o nome oficial (IUPAC) do hidrocarboneto de cadeia aberta e normal ${form(n, H)}${tipo !== 'an' ? ', com a insaturação no carbono 1' : ''}?` : `Qual é a fórmula molecular do ${nome}?`,
      explanation: `Prefixo "${P[n - 1]}" = ${n} carbono${n > 1 ? 's' : ''}; infixo "${tipo}" indica ${cls}; sufixo "o" = hidrocarboneto. ${nome[0].toUpperCase() + nome.slice(1)}: ${form(n, H)}.`,
      hint: 'Prefixo conta os carbonos; infixo an/en/in indica simples, dupla ou tripla.' };
  }),

  // ======================= BIOLOGIA (cálculo) =======================
  fam(B, ['Genética', 'Segunda lei de Mendel'], 'medio', 4, 50, r => {
    const pais = r.pick([['AaBb', 'AaBb'], ['AaBb', 'aabb'], ['AaBb', 'Aabb'], ['AABb', 'aaBb'], ['AaBb', 'aaBb'], ['Aabb', 'aaBb'], ['AaBB', 'Aabb'], ['AABB', 'aabb'], ['AaBb', 'AABb']]);
    const g = s => { const [a1, a2, b1, b2] = s; return [a1 + b1, a1 + b2, a2 + b1, a2 + b2]; };
    const filhos = []; for (const x of g(pais[0])) for (const y of g(pais[1])) filhos.push([x, y]);
    const alvo = r.pick(['A_B_', 'aabb', 'A_bb', 'aaB_']);
    const ok = filhos.filter(([x, y]) => { const A = (x[0] + y[0]).includes('A'), Bb = (x[1] + y[1]).includes('B'); return alvo === 'A_B_' ? A && Bb : alvo === 'aabb' ? !A && !Bb : alvo === 'A_bb' ? A && !Bb : !A && Bb; }).length;
    const desc = { A_B_: 'com os dois caracteres dominantes', aabb: 'com os dois caracteres recessivos', A_bb: 'dominante para o gene A e recessivo para o gene B', aaB_: 'recessivo para o gene A e dominante para o gene B' }[alvo];
    if (!ok) return null;
    const o = opcoes(r, fr(ok, 16), [fr(Math.max(1, 16 - ok), 16), fr(Math.min(16, ok + 2), 16), '1/4', '9/16', '3/16', '1/16', '1/2'].filter(x => x !== fr(ok, 16)));
    return o && { ...o, statement: `Em uma espécie, os genes A/a e B/b segregam de forma independente, com dominância completa. Do cruzamento ${pais[0]} × ${pais[1]}, qual é a probabilidade de nascer um descendente ${desc}?`,
      explanation: `Faça cada gene separado e multiplique (2ª lei de Mendel). Contando as 16 combinações de gametas, ${ok} delas dão o fenótipo pedido: ${fr(ok, 16)}.`,
      hint: 'Resolva gene por gene e multiplique as probabilidades.' };
  }),
  fam(B, ['Genética', 'Herança ligada ao sexo'], 'medio', 4, 40, r => {
    const doenca = r.pick([['daltonismo', 'daltônico', 'daltônica', 'visão normal'], ['hemofilia', 'hemofílico', 'hemofílica', 'coagulação normal']]);
    const mae = r.pick(['portadora', 'portadora', 'normal', 'afetada']), pai = r.pick(['normal', 'afetado']);
    const caso = r.pick(['filho', 'filha', 'qualquer']);
    const pm = { portadora: 0.5, normal: 0, afetada: 1 }[mae];           // chance de a mãe passar o X afetado
    const pp = pai === 'afetado' ? 1 : 0;                               // o pai passa o seu X para as filhas
    const pFilho = pm, pFilha = pm * pp, pQualquer = (pFilho + pFilha) / 2;
    const v = { filho: pFilho, filha: pFilha, qualquer: pQualquer }[caso];
    const F = x => ({ 0: '0', 0.25: '1/4', 0.5: '1/2', 0.75: '3/4', 1: '1' })[x];
    if (doenca[0] === 'hemofilia' && mae === 'afetada') return null;
    const descMae = { portadora: `uma mulher de ${doenca[3]}, filha de pai ${doenca[1]},`, normal: `uma mulher de ${doenca[3]}, sem nenhum caso na família,`, afetada: `uma mulher ${doenca[2]}` }[mae];
    const descPai = pai === 'afetado' ? `um homem ${doenca[1]}` : `um homem de ${doenca[3]}`;
    const pergunta = { filho: `se nascer um menino, qual a probabilidade de ele ser ${doenca[1]}`, filha: `se nascer uma menina, qual a probabilidade de ela ser ${doenca[2]}`, qualquer: `qual a probabilidade de o casal ter uma criança ${doenca[1].replace(/o$/, 'a')} (sem saber o sexo antes)` }[caso];
    const resp = F(v);
    const o = opcoes(r, resp, ['0', '1/4', '1/2', '3/4', '1', '1/8'].filter(x => x !== resp));
    const gMae = { portadora: 'XᴬXᵃ (portadora: recebeu o Xᵃ do pai)', normal: 'XᴬXᴬ', afetada: 'XᵃXᵃ' }[mae];
    return o && { ...o, statement: `${doenca[0] === 'daltonismo' ? 'O daltonismo' : 'A hemofilia'} é uma herança recessiva ligada ao cromossomo X. ${cap(descMae)} casa-se com ${descPai}. ${cap(pergunta)}?`,
      explanation: `Mãe: ${gMae}. Pai: ${pai === 'afetado' ? 'XᵃY' : 'XᴬY'}. Os meninos recebem o X da mãe: chance ${F(pFilho)} de serem afetados. As meninas recebem um X de cada um: precisam de Xᵃ dos dois, chance ${F(pFilha)}. ${caso === 'qualquer' ? `Sem saber o sexo: (${F(pFilho)} + ${F(pFilha)})/2 = ${resp}.` : ''}`.trim(),
      hint: 'O menino recebe o X da mãe; a menina recebe um X do pai e um da mãe.' };
  }),

  // ======================= MATEMÁTICA =======================
  fam(M, ['Trigonometria', 'Lei dos senos e dos cossenos'], 'medio', 4, 50, r => {
    const a = r.pick([2, 3, 4, 5, 6, 8]), b = r.pick([5, 6, 7, 8, 10]), ang = r.pick([60, 120]);
    const c2 = a * a + b * b - 2 * a * b * (ang === 60 ? 0.5 : -0.5), c = Math.sqrt(c2);
    const fmt = v => Number.isInteger(v) ? num(v) : `√${num(c2)}`;
    const o = opcoes(r, fmt(c), [`√${num(a * a + b * b)}`, num(a + b), `√${num(c2 + a * b)}`, num(Math.abs(b - a) || 1), `√${num(c2 + 2)}`]);
    return o && { ...o, statement: `Em um triângulo, dois lados medem ${a} cm e ${b} cm e o ângulo entre eles é de ${ang}°. Quanto mede o terceiro lado?`,
      explanation: `Lei dos cossenos: c² = a² + b² − 2ab·cos ${ang}° = ${a * a} + ${b * b} − 2·${a}·${b}·(${ang === 60 ? '½' : '−½'}) = ${num(c2)}. Então c = ${fmt(c)} cm.`,
      hint: 'Use c² = a² + b² − 2ab·cos θ (cos 60° = ½ e cos 120° = −½).' };
  }),
  fam(M, ['Geometria espacial', 'Cilindro, cone e esfera'], 'enem', 3, 80, r => {
    const tipo = r.pick(['cil', 'cone', 'esf']), R = r.pick([2, 3, 4, 5, 6, 10]), h = r.pick([3, 5, 6, 9, 10, 12]);
    const V = tipo === 'cil' ? 3 * R * R * h : tipo === 'cone' ? R * R * h : 4 * R ** 3;
    const nome = { cil: `um reservatório cilíndrico de raio ${R} m e altura ${h} m`, cone: `um funil em forma de cone de raio ${R} cm e altura ${h} cm`, esf: `uma bola maciça (esfera) de raio ${R} cm` }[tipo];
    const u = tipo === 'cil' ? 'm³' : 'cm³';
    const o = opcoes(r, `${num(V)} ${u}`, vizinhos(r, V, x => `${num(x)} ${u}`, tipo === 'cil' ? [V / 3, 3 * 2 * R * h] : tipo === 'cone' ? [3 * R * R * h, R * R * h * 3 / 2] : [3 * R ** 3, 4 * R * R]));
    return o && { ...o, statement: `Considere π = 3. Qual é o volume de ${nome}?`,
      explanation: tipo === 'cil' ? `V = π·R²·h = 3·${R}²·${h} = ${num(V)} m³.` : tipo === 'cone' ? `V = (π·R²·h)/3 = 3·${R}²·${h}/3 = ${num(V)} cm³.` : `V = (4/3)·π·R³ = (4/3)·3·${R}³ = 4·${R ** 3} = ${num(V)} cm³.`,
      hint: tipo === 'cone' ? 'O cone tem um terço do volume do cilindro de mesma base e altura.' : tipo === 'esf' ? 'Volume da esfera: (4/3)πR³.' : 'Volume = área da base × altura.' };
  }),
  fam(M, ['Análise combinatória', 'Permutações e anagramas'], 'medio', 3, 50, r => {
    const pal = r.pick(['AMOR', 'LIVRO', 'ESCOLA', 'BRASIL', 'CANETA', 'ARARA', 'BANANA', 'PROVA', 'ENEM', 'MARANHAO', 'CASA', 'PATO', 'SAPO', 'TERRA', 'CARRO', 'BOLA', 'LUA', 'SOL', 'MESA', 'PAPEL', 'ITALIA', 'CAJU', 'CEU', 'URUBU', 'PIPOCA', 'AMIGO']);
    const cont = {}; for (const ch of pal) cont[ch] = (cont[ch] || 0) + 1;
    const f = n => n <= 1 ? 1 : n * f(n - 1);
    const rep = Object.values(cont).filter(v => v > 1);
    const tot = f(pal.length) / rep.reduce((a, v) => a * f(v), 1);
    const o = opcoes(r, num(tot), vizinhos(r, tot, num, [f(pal.length), f(pal.length - 1), pal.length ** 2]));
    return o && { ...o, statement: `Quantos anagramas tem a palavra ${pal}?`,
      explanation: rep.length ? `São ${pal.length} letras com repetições (${Object.entries(cont).filter(([, v]) => v > 1).map(([k, v]) => `${k} ${v} vezes`).join(', ')}). P = ${pal.length}!/(${rep.map(v => v + '!').join('·')}) = ${num(tot)}.` : `São ${pal.length} letras diferentes: P = ${pal.length}! = ${num(tot)}.`,
      hint: 'Permutação: n!; com letras repetidas, divida pelos fatoriais das repetições.' };
  }),
  fam(M, ['Análise combinatória', 'Binômio de Newton'], 'medio', 4, 30, r => {
    const n = r.int(4, 7), k = r.int(1, n - 1); const f = x => x <= 1 ? 1 : x * f(x - 1); const C = f(n) / (f(k) * f(n - k)), coef = C * 2 ** (n - k);
    const o = opcoes(r, num(coef), vizinhos(r, coef, num, [C, 2 ** (n - k), C * 2 ** k]));
    return o && { ...o, statement: `No desenvolvimento de (x + 2)${'⁰¹²³⁴⁵⁶⁷'[n]}, qual é o coeficiente do termo em x${k > 1 ? '⁰¹²³⁴⁵⁶⁷'[k] : ''}?`,
      explanation: `Termo geral: C(${n},p)·x^(${n}−p)·2^p. Para x${k > 1 ? '⁰¹²³⁴⁵⁶⁷'[k] : ''}, p = ${n - k}: C(${n},${n - k})·2${'⁰¹²³⁴⁵⁶⁷'[n - k]} = ${num(C)}·${2 ** (n - k)} = ${num(coef)}.`,
      hint: 'Use o termo geral do binômio: C(n,p)·a^(n−p)·b^p.' };
  }),
  fam(M, ['Álgebra', 'Sistemas lineares'], 'enem', 2, 80, r => {
    const x = r.int(2, 30), y = r.int(2, 30); if (x === y) return null;
    const px = r.pick([2, 3, 4, 5, 6, 8, 10, 12, 15]), py = r.pick([3, 5, 7, 9, 10, 20, 25]); if (px === py) return null;
    const it = r.pick([['ingressos de adulto', 'ingressos de criança'], ['sanduíches', 'sucos'], ['cadernos', 'canetas'], ['camisetas', 'bonés']]);
    const n = x + y, tot = px * x + py * y;
    const o = opcoes(r, String(x), [String(y), String(n - 1 - x > 0 ? n - 1 - x : x + 3), String(x + 1), String(Math.max(1, x - 2)), String(Math.round(tot / (px + py)))]);
    return o && { ...o, statement: `Numa venda em ${r.pick(CIDADES)}, foram vendidos ${n} itens entre ${it[0]} (R$ ${px},00 cada) e ${it[1]} (R$ ${py},00 cada), arrecadando R$ ${num(tot)},00. Quantos ${it[0]} foram vendidos?`,
      explanation: `x + y = ${n} e ${px}x + ${py}y = ${tot}. Substituindo y = ${n} − x: ${px}x + ${py}(${n} − x) = ${tot} ⇒ ${px - py}x = ${tot - py * n} ⇒ x = ${x}.`,
      hint: 'Monte duas equações (quantidade e valor) e resolva por substituição.' };
  }),
  fam(M, ['Geometria plana', 'Polígonos: ângulos e diagonais'], 'medio', 2, 40, r => {
    const n = r.int(5, 20), pede = r.pick(['soma', 'diag', 'int']);
    const nomes = { 5: 'pentágono', 6: 'hexágono', 7: 'heptágono', 8: 'octógono', 9: 'eneágono', 10: 'decágono', 12: 'dodecágono', 15: 'pentadecágono', 20: 'icoságono' };
    const nome = nomes[n] || `polígono convexo de ${n} lados`;
    if (pede === 'int' && 360 % n) return null;
    const val = pede === 'soma' ? (n - 2) * 180 : pede === 'diag' ? n * (n - 3) / 2 : 180 - 360 / n;
    const u = pede === 'diag' ? '' : '°';
    const o = opcoes(r, num(val) + u, vizinhos(r, val, x => num(x) + u, pede === 'soma' ? [n * 180, (n - 1) * 180] : pede === 'diag' ? [n * (n - 3), n * (n - 1) / 2] : [360 / n, 180 - 180 / n]));
    return o && { ...o, statement: pede === 'soma' ? `Qual é a soma dos ângulos internos de um ${nome}?` : pede === 'diag' ? `Quantas diagonais tem um ${nome}?` : `Qual é a medida de cada ângulo interno de um ${nome.replace('polígono convexo', 'polígono regular')} regular?`,
      explanation: pede === 'soma' ? `Si = (n − 2)·180° = (${n} − 2)·180° = ${num(val)}°.` : pede === 'diag' ? `d = n(n − 3)/2 = ${n}·${n - 3}/2 = ${num(val)}.` : `Cada ângulo externo mede 360°/${n} = ${360 / n}°; o interno é 180° − ${360 / n}° = ${num(val)}°.`,
      hint: 'Soma dos internos: (n − 2)·180°. Diagonais: n(n − 3)/2.' };
  }),
  fam(M, ['Conjuntos', 'União e interseção'], 'enem', 2, 50, r => {
    const a = r.int(20, 80), b = r.int(15, 70), ab = r.int(5, Math.min(a, b) - 2), nen = r.int(0, 30);
    const tot = a + b - ab + nen;
    const it = r.pick([['futebol', 'vôlei'], ['inglês', 'espanhol'], ['ouvir a rádio A', 'ouvir a rádio B'], ['usar o aplicativo X', 'usar o aplicativo Y'], ['ler jornal', 'ver telejornal'], ['matemática', 'física']]);
    const pede = r.pick(['tot', 'so']);
    const val = pede === 'tot' ? tot : a - ab;
    const o = opcoes(r, String(val), vizinhos(r, val, String, pede === 'tot' ? [a + b + nen, a + b - ab] : [a, ab]));
    return o && { ...o, statement: `Numa pesquisa, ${a} pessoas disseram gostar de ${it[0]}, ${b} de ${it[1]}, ${ab} das duas coisas e ${nen} de nenhuma. ${pede === 'tot' ? 'Quantas pessoas foram entrevistadas?' : `Quantas gostam apenas de ${it[0]}?`}`,
      explanation: `Só ${it[0]}: ${a} − ${ab} = ${a - ab}. Só ${it[1]}: ${b} − ${ab} = ${b - ab}. Total: ${a - ab} + ${b - ab} + ${ab} + ${nen} = ${tot}.`,
      hint: 'Desenhe o diagrama de Venn começando pela interseção.' };
  }),
  // ======================= MATEMÁTICA COM FIGURA =======================
  fam(M, ['Estatística', 'Leitura de gráficos'], 'enem', 2, 80, r => {
    const meses = r.pick([['Jan', 'Fev', 'Mar', 'Abr', 'Mai'], ['Seg', 'Ter', 'Qua', 'Qui', 'Sex'], ['2021', '2022', '2023', '2024', '2025']]);
    const tema = r.pick([['Vendas de uma loja', 'unidades'], ['Visitantes de um museu', 'pessoas'], ['Livros emprestados pela biblioteca', 'livros'], ['Consumo de água de uma escola', 'm³']]);
    const vals = meses.map(() => r.int(2, 12) * 10);
    const ymax = Math.max(...vals) + 20, ys = [0, 20, 40, 60, 80, 100, 120, 140].filter(v => v <= ymax);
    const pede = r.pick(['media', 'dif', 'max']);
    const figura = fig.barras({ dados: meses.map((m, i) => [m, vals[i]]), yl: tema[1], titulo: tema[0], ymax, ys });
    const media = vals.reduce((a, b) => a + b, 0) / vals.length;
    const iMax = vals.indexOf(Math.max(...vals)), iMin = vals.indexOf(Math.min(...vals));
    let ok, ds, exp, st;
    if (pede === 'media') { ok = num(media); ds = vizinhos(r, media, num, [Math.max(...vals), vals[2]]); st = `Com base no gráfico, qual é a média de ${tema[1]} por período?`; exp = `Soma: ${vals.join(' + ')} = ${vals.reduce((a, b) => a + b, 0)}. Média: ${vals.reduce((a, b) => a + b, 0)}/${vals.length} = ${num(media)}.`; }
    else if (pede === 'dif') { const d = vals[iMax] - vals[iMin]; if (!d) return null; ok = num(d); ds = vizinhos(r, d, num, [vals[iMax], vals[iMin]]); st = `Qual é a diferença entre o maior e o menor valor mostrados no gráfico?`; exp = `Maior: ${vals[iMax]} (${meses[iMax]}). Menor: ${vals[iMin]} (${meses[iMin]}). Diferença: ${vals[iMax] - vals[iMin]}.`; }
    else { if (vals.filter(v => v === vals[iMax]).length > 1) return null; ok = meses[iMax]; ds = meses.filter(m => m !== ok); st = `Em qual período o valor foi o maior?`; exp = `A barra mais alta é a de ${meses[iMax]}, com ${vals[iMax]} ${tema[1]}.`; }
    const o = opcoes(r, ok, ds);
    return o && { ...o, figura, statement: `O gráfico mostra ${tema[0].toLowerCase()} em cinco períodos. ${st}`, explanation: exp, hint: 'Leia o valor escrito em cima de cada barra.' };
  }),
  fam(M, ['Estatística', 'Leitura de gráficos'], 'enem', 2, 40, r => {
    const cats = r.pick([['Ônibus', 'Bicicleta', 'A pé', 'Carro'], ['Arroz', 'Feijão', 'Carne', 'Verduras'], ['Hidrelétrica', 'Eólica', 'Solar', 'Térmica']]);
    let ps = [r.int(2, 8) * 5, r.int(2, 6) * 5, r.int(1, 5) * 5]; const resto = 100 - ps.reduce((a, b) => a + b, 0); if (resto <= 0) return null; ps.push(resto);
    const total = r.pick([200, 400, 500, 800, 1000, 1200]);
    const i = r.int(0, 3); const v = total * ps[i] / 100;
    const figura = fig.setores({ dados: cats.map((c, k) => [c, ps[k]]), titulo: 'Distribuição (%)' });
    const o = opcoes(r, num(v), vizinhos(r, v, num, [ps[i], total * ps[(i + 1) % 4] / 100]));
    return o && { ...o, figura, statement: `Numa pesquisa com ${num(total)} pessoas em ${r.pick(CIDADES)}, as respostas foram distribuídas como no gráfico. Quantas pessoas escolheram "${cats[i]}"?`,
      explanation: `${ps[i]}% de ${num(total)} = ${ps[i]}/100 · ${num(total)} = ${num(v)} pessoas.`, hint: 'Multiplique a porcentagem do setor pelo total de pessoas.' };
  }),
  fam(M, ['Funções', 'Gráfico da função afim'], 'enem', 3, 60, r => {
    const a = r.pick([1, 2, 3, -1, -2, 0.5]), b = r.pick([0, 1, 2, 3, 4, 5, -2]); const x1 = r.pick([2, 4]);
    const y0 = b, y1 = a * x1 + b; if (y1 < -5 || y1 > 20 || y0 < -5) return null;
    const figura = fig.linha({ pontos: [[0, y0], [x1, y1]], xl: 'x', yl: 'y', xs: [x1], ys: [y0, y1].filter(v => v > 0 && v !== 0), xmax: x1 * 1.4, ymax: Math.max(y0, y1, 1) * 1.3, ymin: Math.min(0, y0, y1) * 1.3 });
    const lei = (aa, bb) => `f(x) = ${aa === 1 ? '' : aa === -1 ? '−' : num(aa)}x${bb > 0 ? ' + ' + num(bb) : bb < 0 ? ' − ' + num(-bb) : ''}`;
    const o = opcoes(r, lei(a, b), [lei(-a, b), lei(a, -b || 1), lei(b || 1, a), lei(a * 2, b), lei(r2(y1 / x1) || 3, 0)]);
    return o && { ...o, figura, statement: `O gráfico mostra uma função afim f, que passa pelos pontos (0, ${num(y0)}) e (${x1}, ${num(y1)}). Qual é a lei de formação de f?`,
      explanation: `f(x) = ax + b. O ponto (0, ${num(y0)}) dá b = ${num(b)}. Inclinação: a = (${num(y1)} − ${num(y0)})/(${x1} − 0) = ${num(a)}. Logo ${lei(a, b)}.`,
      hint: 'b é onde a reta corta o eixo y; a é a inclinação (Δy/Δx).' };
  }),
  fam(M, ['Geometria plana', 'Teorema de Pitágoras'], 'enem', 2, 60, r => {
    const [p, q, h] = r.pick([[3, 4, 5], [6, 8, 10], [5, 12, 13], [9, 12, 15], [8, 15, 17], [12, 16, 20], [7, 24, 25], [15, 20, 25], [20, 21, 29], [10, 24, 26], [1.5, 2, 2.5]]);
    const ctx = r.pick(['Uma rampa de acesso foi construída', 'Uma escada foi apoiada em um muro', 'Um cabo de aço foi esticado do alto de um poste até o chão', 'Um terreno triangular foi cercado', 'Uma tirolesa foi instalada']);
    const pede = r.pick(['hip', 'cat']);
    const figura = fig.trianguloRetangulo({ a: q, b: p, rotA: pede === 'hip' ? `${q} m` : `${q} m`, rotB: pede === 'hip' ? `${p} m` : 'x', rotC: pede === 'hip' ? 'x' : `${h} m` });
    const val = pede === 'hip' ? h : p;
    const o = opcoes(r, `${val} m`, vizinhos(r, val, x => `${num(x)} m`, pede === 'hip' ? [p + q, q + 1] : [h - q, h + q]));
    return o && { ...o, figura, statement: `${ctx} como mostra a figura (triângulo retângulo). Qual é a medida x?`,
      explanation: pede === 'hip' ? `Pitágoras: x² = ${p}² + ${q}² = ${p * p} + ${q * q} = ${h * h} ⇒ x = ${h} m.` : `Pitágoras: ${h}² = x² + ${q}² ⇒ x² = ${h * h} − ${q * q} = ${p * p} ⇒ x = ${p} m.`,
      hint: 'Hipotenusa² = cateto² + cateto². A hipotenusa fica oposta ao ângulo reto.' };
  }),
  fam(M, ['Geometria analítica', 'Pontos no plano cartesiano'], 'medio', 2, 50, r => {
    const [dx, dy, d] = r.pick([[3, 4, 5], [6, 8, 10], [5, 12, 13], [4, 3, 5], [8, 6, 10]]);
    const x1 = r.int(-6, 2), y1 = r.int(-6, 2); const sx = r.pick([1, -1]) , sy = r.pick([1, -1]);
    const x2 = x1 + dx * (x1 + dx * sx > 9 || x1 + dx * sx < -9 ? -sx : sx), y2 = y1 + dy * (y1 + dy * sy > 9 || y1 + dy * sy < -9 ? -sy : sy);
    if (Math.abs(x2) > 10 || Math.abs(y2) > 10) return null;
    const figura = fig.pontos({ pts: [['A', x1, y1], ['B', x2, y2]] });
    const o = opcoes(r, String(d), vizinhos(r, d, String, [dx + dy, d * d]));
    return o && { ...o, figura, statement: `No plano cartesiano da figura, as marcas dos eixos vão de 2 em 2 unidades. Qual é a distância entre os pontos A e B?`,
      explanation: `A = (${x1}, ${y1}) e B = (${x2}, ${y2}). d = √[(${x2} − ${x1 < 0 ? '(' + x1 + ')' : x1})² + (${y2} − ${y1 < 0 ? '(' + y1 + ')' : y1})²] = √(${dx * dx} + ${dy * dy}) = ${d}.`,
      hint: 'Leia as coordenadas e use d = √(Δx² + Δy²).' };
  })
];
