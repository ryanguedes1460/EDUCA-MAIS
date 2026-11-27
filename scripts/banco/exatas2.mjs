// Famílias novas (versão 1.3) de Matemática, Física e Química, incluindo questões mais
// difíceis no estilo de ITA, IME, FUVEST e UNICAMP. Todas são autorais: cada família é
// uma ideia de questão que gera versões com números e contextos diferentes.
import { num, brl, pct, NOMES, CIDADES, opcoes, vizinhos } from './util.mjs';

const M = 'Matemática', F = 'Física', Q = 'Química';
const fam = (subject, topic, level, difficulty, n, make) => ({ subject, topic, level, difficulty, n, make });
const gcd = (a, b) => { a = Math.abs(a); b = Math.abs(b); while (b) [a, b] = [b, a % b]; return a || 1; };
const frac = (a, b) => { if (b < 0) { a = -a; b = -b; } const g = gcd(a, b); a /= g; b /= g; return b === 1 ? num(a) : `${a < 0 ? '−' : ''}${Math.abs(a)}/${b}`; };
const sinal = (v, primeiro = false) => v < 0 ? (primeiro ? '−' : ' − ') + Math.abs(v) : (primeiro ? '' : ' + ') + v;
const termo = (c, x, primeiro = false) => c === 0 ? '' : (c < 0 ? (primeiro ? '−' : ' − ') : (primeiro ? '' : ' + ')) + (Math.abs(c) === 1 && x ? '' : Math.abs(c)) + x;
const nz = (r, a, b) => { let v; do v = r.int(a, b); while (v === 0); return v; };
const fat = n => n <= 1 ? 1 : n * fat(n - 1);
const C = (n, k) => Math.round(fat(n) / (fat(k) * fat(n - k)));
const sup = n => String(n).split('').map(c => '⁰¹²³⁴⁵⁶⁷⁸⁹'['0123456789'.indexOf(c)] ?? (c === '-' ? '⁻' : c)).join('');
const r2 = x => Math.round(x * 100) / 100;
const pp = x => x < 0 ? `(${num(x)})` : num(x);

export default [
  // ================= MATEMÁTICA =================
  fam(M, ['Álgebra', 'Equações do 2º grau'], 'medio', 3, 120, r => {
    const a = nz(r, -9, 9), b = nz(r, -9, 9); if (a === b) return null;
    const S = a + b, P = a * b;
    const eq = `x²${termo(-S, 'x')}${P ? sinal(P) : ''} = 0`;
    const par = (x, y) => { const [m, n] = [x, y].sort((p, q) => p - q); return `S = {${num(m)}, ${num(n)}}`; };
    const o = opcoes(r, par(a, b), [par(-a, -b), par(a, -b), par(-a, b), par(1, P || 2), par(a + 1, b - 1), par(S, P || 3)]);
    return o && { ...o, statement: `Qual é o conjunto solução da equação ${eq}, no conjunto dos números reais?`,
      explanation: `Soma das raízes = ${num(S)} e produto = ${num(P)}. Os números com essa soma e esse produto são ${num(a)} e ${num(b)}. Conferindo: (${num(a)})²${sinal(-S)}·(${num(a)})${sinal(P)} = 0.`,
      hint: 'Use soma e produto: em x² − Sx + P = 0, as raízes somam S e multiplicam P.' };
  }),
  fam(M, ['Funções', 'Função quadrática'], 'enem', 3, 120, r => {
    const h = r.int(2, 30), k = r.int(5, 80) * 10, a = r.pick([1, 2, 5]);
    const b = 2 * a * h, c = k - a * h * h;
    const prod = r.pick(['camisetas', 'bolos', 'passagens', 'ingressos', 'cestas básicas', 'marmitas']);
    const pedeX = r.chance(0.5);
    const certo = pedeX ? `${h} ${prod}` : brl(k);
    const ds = pedeX ? [`${b} ${prod}`, `${2 * h} ${prod}`, `${h + 2} ${prod}`, `${Math.max(1, h - 2)} ${prod}`, `${Math.round(h / 2) || 1} ${prod}`] : [brl(k + a * 4), brl(Math.abs(c)), brl(b * h), brl(k / 2), brl(k * 2)];
    const o = opcoes(r, certo, ds);
    return o && { ...o, statement: `O lucro diário, em reais, de uma pequena empresa que vende x ${prod} é L(x) = ${termo(-a, 'x²', true)}${termo(b, 'x')}${c ? sinal(c) : ''}. ${pedeX ? 'Quantas unidades devem ser vendidas para o lucro ser máximo?' : 'Qual é o lucro máximo possível?'}`,
      explanation: `O máximo está no vértice: x = −b/(2a) = −${b}/(2·(−${a})) = ${h}. L(${h}) = −${a}·${h}² + ${b}·${h}${sinal(c)} = ${num(k)}. Então o lucro máximo é ${brl(k)}, com ${h} ${prod}.`,
      hint: 'Numa parábola com a < 0, o ponto mais alto é o vértice: x = −b/(2a).' };
  }),
  fam(M, ['Logaritmos', 'Propriedades dos logaritmos'], 'medio', 4, 120, r => {
    const i = r.int(0, 4), j = r.int(0, 3), m = r.int(-2, 3); if (!i && !j) return null;
    const N = 2 ** i * 3 ** j * 10 ** m;
    const v = i * 0.301 + j * 0.477 + m;
    const f = x => num(Math.round(x * 1000) / 1000, 3);
    const Ns = m >= 0 ? num(N) : num(N, -m);
    const o = opcoes(r, f(v), [f(i * 0.477 + j * 0.301 + m), f(v + 1), f(v - 1), f(i * 0.301 * j * 0.477 + m), f(0.301 + 0.477 + m), f(v * 2)]);
    return o && { ...o, statement: `Considerando log 2 = 0,301 e log 3 = 0,477, o valor de log ${Ns} é aproximadamente:`,
      explanation: `${Ns} = ${[i && `2${i > 1 ? sup(i) : ''}`, j && `3${j > 1 ? sup(j) : ''}`, m && `10${sup(m)}`].filter(Boolean).join(' · ')}. Pelas propriedades, log ${Ns} = ${[i && `${i}·0,301`, j && `${j}·0,477`, m && `${num(m)}`].filter(Boolean).join(' + ')} = ${f(v)}.`,
      hint: 'Fatore o número em potências de 2, 3 e 10: o log do produto é a soma dos logs.' };
  }),
  fam(M, ['Funções', 'Função exponencial'], 'enem', 3, 100, r => {
    const N0 = r.pick([100, 200, 250, 500, 1000, 1500, 3000]), t = r.pick([2, 3, 4, 5, 6, 20, 30]), k = r.int(2, 6);
    const und = t >= 20 ? 'minutos' : 'horas', T = t * k, N = N0 * 2 ** k;
    const o = opcoes(r, num(N), [num(N0 * 2 * k), num(N0 * k), num(N / 2), num(N * 2), num(N0 + 2 ** k)]);
    return o && { ...o, statement: `Em um laboratório, uma cultura começou com ${num(N0)} bactérias, e a população dobra a cada ${t} ${und}. Quantas bactérias haverá após ${T} ${und}?`,
      explanation: `Em ${T} ${und} cabem ${T}/${t} = ${k} duplicações. N = ${num(N0)} · 2${sup(k)} = ${num(N0)} · ${2 ** k} = ${num(N)}.`,
      hint: 'Conte quantas vezes a população dobra no período e multiplique por 2 esse número de vezes.' };
  }),
  fam(M, ['Sequências', 'Progressão geométrica'], 'medio', 3, 100, r => {
    const a1 = r.int(1, 9), q = r.pick([2, 3, 2, 3, 4, 5]), n = r.int(4, q > 3 ? 5 : 7);
    const pedeSoma = r.chance(0.5);
    const an = a1 * q ** (n - 1), Sn = a1 * (q ** n - 1) / (q - 1);
    const certo = pedeSoma ? Sn : an;
    const o = opcoes(r, num(certo), [num(a1 * q ** n), num(a1 * q * (n - 1)), num(pedeSoma ? an : Sn), num(certo + a1), num(a1 + (n - 1) * q), num(certo * q)]);
    return o && { ...o, statement: `Uma progressão geométrica tem primeiro termo ${a1} e razão ${q}. ${pedeSoma ? `Qual é a soma dos ${n} primeiros termos?` : `Qual é o ${n}º termo?`}`,
      explanation: pedeSoma ? `Sₙ = a₁(qⁿ − 1)/(q − 1) = ${a1}·(${q}${sup(n)} − 1)/(${q} − 1) = ${num(Sn)}.` : `aₙ = a₁·qⁿ⁻¹ = ${a1}·${q}${sup(n - 1)} = ${num(an)}.`,
      hint: pedeSoma ? 'Use Sₙ = a₁(qⁿ − 1)/(q − 1).' : 'Na PG, cada termo é o anterior vezes a razão: aₙ = a₁·qⁿ⁻¹.' };
  }),
  fam(M, ['Sequências', 'Progressão aritmética'], 'enem', 3, 100, r => {
    const a1 = r.int(5, 60), d = r.int(2, 15), n = r.int(8, 30);
    const an = a1 + (n - 1) * d, S = (a1 + an) * n / 2;
    const quem = r.pick(['Um atleta', 'Uma estudante', 'Um ciclista', 'Uma nadadora']);
    const und = r.pick([['minutos de treino', 'minutos'], ['páginas lidas', 'páginas'], ['quilômetros pedalados', 'km']]);
    const o = opcoes(r, `${num(S)} ${und[1]}`, [num(an * n), num(an), num(a1 * n), num(S + d * n), num((a1 + an) * (n - 1) / 2)].map(x => `${x} ${und[1]}`));
    return o && { ...o, statement: `${quem} fez ${a1} ${und[0]} no 1º dia e, a cada dia, aumentou ${d} ${und[1]} em relação ao dia anterior. Qual foi o total acumulado nos ${n} primeiros dias?`,
      explanation: `É uma PA: a₁ = ${a1}, r = ${d}. a${n} = ${a1} + ${n - 1}·${d} = ${an}. Soma: (a₁ + aₙ)·n/2 = (${a1} + ${an})·${n}/2 = ${num(S)}.`,
      hint: 'Ache o último termo e use Sₙ = (a₁ + aₙ)·n/2.' };
  }),
  fam(M, ['Análise combinatória', 'Combinações'], 'enem', 3, 100, r => {
    const n = r.int(5, 14), k = r.int(2, Math.min(5, n - 2));
    const grupo = r.pick([['funcionários', 'uma comissão'], ['alunos', 'uma equipe'], ['jogadores', 'um time de treino'], ['sabores', 'uma pizza'], ['livros', 'um kit de leitura']]);
    const certo = C(n, k), A = certo * fat(k);
    const o = opcoes(r, num(certo), [num(A), num(n * k), num(C(n, k - 1)), num(C(n, k + 1)), num(certo * 2), num(n ** k)]);
    return o && { ...o, statement: `De um grupo de ${n} ${grupo[0]}, serão escolhidos ${k} para formar ${grupo[1]}, sem distinção de função entre eles. De quantas maneiras diferentes isso pode ser feito?`,
      explanation: `A ordem não importa, então é combinação: C(${n}, ${k}) = ${n}!/(${k}!·${n - k}!) = ${num(certo)}. Se a ordem importasse (cargos diferentes), seriam ${num(A)} arranjos.`,
      hint: 'Trocar a ordem dos escolhidos gera o mesmo grupo? Então use combinação.' };
  }),
  fam(M, ['Probabilidade', 'Probabilidade condicional e eventos sucessivos'], 'enem', 4, 100, r => {
    const a = r.int(2, 9), b = r.int(2, 9), t = a + b;
    const cor = r.pick([['vermelhas', 'azuis', 'bolas'], ['premiadas', 'sem prêmio', 'fichas'], ['de chocolate', 'de morango', 'balas']]);
    const certo = frac(a * (a - 1), t * (t - 1));
    const o = opcoes(r, certo, [frac(a * a, t * t), frac(a, t), frac(a - 1, t - 1), frac(2 * a, t), frac(a * b, t * (t - 1)), frac(a * (a - 1), t * t)]);
    return o && { ...o, statement: `Uma caixa tem ${a} ${cor[2]} ${cor[0]} e ${b} ${cor[2]} ${cor[1]}, todas iguais ao toque. Retiram-se duas, uma após a outra, sem reposição. Qual é a probabilidade de as duas serem ${cor[0]}?`,
      explanation: `1ª retirada: ${a}/${t}. Sem reposição, sobram ${a - 1} ${cor[0]} em ${t - 1}: ${a - 1}/${t - 1}. P = ${a}/${t} · ${a - 1}/${t - 1} = ${certo}.`,
      hint: 'Multiplique as probabilidades de cada etapa, lembrando que a caixa muda depois da 1ª retirada.' };
  }),
  fam(M, ['Matrizes e determinantes', 'Determinantes'], 'medio', 4, 120, r => {
    const m = Array.from({ length: 3 }, () => Array.from({ length: 3 }, () => r.int(-3, 5)));
    const [[a, b, c], [d, e, f], [g, h, i]] = m;
    const det = a * e * i + b * f * g + c * d * h - c * e * g - a * f * h - b * d * i;
    const diag = a * e * i, s = a * e * i + b * f * g + c * d * h;
    const o = opcoes(r, num(det), [num(-det), num(diag), num(s), num(det + 2), num(det - 2), num(a * e - b * d)]);
    const lin = l => '[ ' + l.map(x => (x < 0 ? '−' + Math.abs(x) : String(x)).padStart(2, ' ')).join('  ') + ' ]';
    return o && { ...o, statement: `Calcule o determinante da matriz:\n\n${m.map(lin).join('\n')}`,
      explanation: `Pela regra de Sarrus: ${pp(a)}·${pp(e)}·${pp(i)} + ${pp(b)}·${pp(f)}·${pp(g)} + ${pp(c)}·${pp(d)}·${pp(h)} − ${pp(c)}·${pp(e)}·${pp(g)} − ${pp(a)}·${pp(f)}·${pp(h)} − ${pp(b)}·${pp(d)}·${pp(i)} = ${num(s)} − ${num(c * e * g + a * f * h + b * d * i)} = ${num(det)}.`,
      hint: 'Repita as duas primeiras colunas ao lado e use a regra de Sarrus.' };
  }),
  fam(M, ['Números complexos', 'Operações com complexos'], 'medio', 4, 120, r => {
    const a = nz(r, -6, 6), b = nz(r, -6, 6), c = nz(r, -6, 6), d = nz(r, -6, 6);
    const re = a * c - b * d, im = a * d + b * c;
    const z = (x, y) => `${num(x)} ${y < 0 ? '−' : '+'} ${Math.abs(y) === 1 ? '' : Math.abs(y)}i`;
    const o = opcoes(r, z(re, im), [z(a * c + b * d, im), z(re, a * d - b * c), z(a * c, b * d), z(-re, im), z(re, -im), z(a + c, b + d)]);
    return o && { ...o, statement: `Sendo i a unidade imaginária (i² = −1), o produto (${z(a, b)})·(${z(c, d)}) é igual a:`,
      explanation: `Aplicando a distributiva: ${pp(a)}·${pp(c)} + ${pp(a)}·${pp(d)}i + ${pp(b)}·${pp(c)}i + ${pp(b)}·${pp(d)}i². Como i² = −1, a parte real é ${num(a * c)}${sinal(-b * d)} = ${num(re)} e a parte imaginária é ${num(a * d + b * c)}i. Resultado: ${z(re, im)}.`,
      hint: 'Multiplique como polinômios e troque i² por −1.' };
  }),
  fam(M, ['Números complexos', 'Módulo'], 'medio', 3, 60, r => {
    const [p, q, h] = r.pick([[3, 4, 5], [5, 12, 13], [8, 15, 17], [6, 8, 10], [7, 24, 25], [9, 12, 15], [12, 16, 20], [20, 21, 29]]);
    const sa = r.pick([1, -1]), sb = r.pick([1, -1]), troca = r.chance(0.5);
    const [a, b] = troca ? [q * sa, p * sb] : [p * sa, q * sb];
    const o = opcoes(r, num(h), [num(Math.abs(a) + Math.abs(b)), num(h * h), num(Math.abs(a - b)), num(h + 1), num(Math.round(Math.sqrt(Math.abs(a) + Math.abs(b)) * 10) / 10)]);
    return o && { ...o, statement: `Qual é o módulo do número complexo z = ${num(a)} ${b < 0 ? '−' : '+'} ${Math.abs(b)}i?`,
      explanation: `|z| = √(a² + b²) = √(${a * a} + ${b * b}) = √${h * h} = ${h}.`, hint: '|a + bi| = √(a² + b²): é a distância do ponto (a, b) até a origem.' };
  }),
  fam(M, ['Geometria analítica', 'Distância entre pontos'], 'medio', 3, 100, r => {
    const [p, q, h] = r.pick([[3, 4, 5], [6, 8, 10], [5, 12, 13], [8, 6, 10], [4, 3, 5], [12, 5, 13], [9, 12, 15]]);
    const x1 = r.int(-6, 6), y1 = r.int(-6, 6), x2 = x1 + p * r.pick([1, -1]), y2 = y1 + q * r.pick([1, -1]);
    const P = (x, y) => `(${num(x)}, ${num(y)})`;
    const o = opcoes(r, num(h), [num(p + q), num(h * h), num(Math.abs(x2 + x1) + Math.abs(y2 + y1)), num(h + 2), num(Math.abs(p - q) || 7)]);
    return o && { ...o, statement: `No plano cartesiano, qual é a distância entre os pontos A${P(x1, y1)} e B${P(x2, y2)}?`,
      explanation: `d = √[(x₂ − x₁)² + (y₂ − y₁)²] = √(${p}² + ${q}²) = √${h * h} = ${h}.`, hint: 'A distância é a hipotenusa de um triângulo retângulo com catetos Δx e Δy.' };
  }),
  fam(M, ['Geometria analítica', 'Equação da reta'], 'medio', 3, 100, r => {
    const m = nz(r, -5, 5), n = r.int(-9, 9), x1 = r.int(-4, 3), x2 = x1 + r.int(1, 4);
    const y1 = m * x1 + n, y2 = m * x2 + n;
    const eq = (a, b) => `y = ${termo(a, 'x', true)}${b ? sinal(b) : ''}`;
    const o = opcoes(r, eq(m, n), [eq(-m, n), eq(m, -n), eq(n || 1, m), eq(m + 1, n - x1), eq(m, n + 1), eq(2 * m, n)]);
    return o && { ...o, statement: `Qual é a equação da reta que passa pelos pontos (${num(x1)}, ${num(y1)}) e (${num(x2)}, ${num(y2)})?`,
      explanation: `Coeficiente angular: m = (${num(y2)} − ${num(y1)})/(${num(x2)} − ${num(x1)}) = ${num(m)}. Substituindo (${num(x1)}, ${num(y1)}) em y = ${num(m)}x + n: n = ${num(n)}. Logo, ${eq(m, n)}.`,
      hint: 'Calcule m = Δy/Δx e depois use um dos pontos para achar o termo independente.' };
  }),
  fam(M, ['Geometria', 'Círculo e circunferência'], 'enem', 2, 100, r => {
    const raio = r.int(2, 40), pi = r.pick([3, 3.14]), pedeArea = r.chance(0.5);
    const obj = r.pick(['uma praça circular', 'uma mesa redonda', 'um canteiro circular', 'uma pista circular', 'uma pizza']);
    const certo = pedeArea ? pi * raio * raio : 2 * pi * raio;
    const u = pedeArea ? 'm²' : 'm';
    const o = opcoes(r, `${num(certo)} ${u}`, [pi * raio, pedeArea ? 2 * pi * raio : pi * raio * raio, pi * 4 * raio * raio, 2 * raio * raio, certo * 2].map(x => `${num(x)} ${u}`));
    return o && { ...o, statement: `${obj[0].toUpperCase() + obj.slice(1)} tem raio de ${raio} m. Usando π = ${num(pi)}, ${pedeArea ? 'qual é a sua área?' : 'qual é o comprimento da sua borda (circunferência)?'}`,
      explanation: pedeArea ? `A = π·r² = ${num(pi)}·${raio}² = ${num(certo)} m².` : `C = 2·π·r = 2·${num(pi)}·${raio} = ${num(certo)} m.`,
      hint: pedeArea ? 'Área do círculo: π·r².' : 'Comprimento da circunferência: 2·π·r.' };
  }),
  fam(M, ['Trigonometria', 'Trigonometria no triângulo retângulo'], 'enem', 3, 100, r => {
    const ang = r.pick([30, 45, 60]), hip = r.int(2, 30) * 2;
    const s = { 30: 0.5, 45: 0.7, 60: 0.85 }[ang], c = { 30: 0.85, 45: 0.7, 60: 0.5 }[ang];
    const ctx = r.pick([['Uma rampa', 'a altura que ela vence'], ['Uma escada apoiada num muro', 'a altura que o topo da escada alcança'], ['Um cabo esticado do alto de uma torre ao chão', 'a altura da torre']]);
    const alt = r2(hip * s);
    const o = opcoes(r, `${num(alt)} m`, [hip * c, hip / s, hip * 0.5 === alt ? hip * 0.6 : hip * 0.5, hip, hip * s * 2].map(x => `${num(r2(x))} m`));
    return o && { ...o, statement: `${ctx[0]} tem ${hip} m de comprimento e forma um ângulo de ${ang}° com o chão. Usando sen ${ang}° ≈ ${num(s)} e cos ${ang}° ≈ ${num(c)}, ${ctx[1]} é de aproximadamente:`,
      explanation: `A altura é o cateto oposto ao ângulo: altura = comprimento × sen ${ang}° = ${hip} × ${num(s)} = ${num(alt)} m.`,
      hint: 'Cateto oposto = hipotenusa × seno; cateto adjacente = hipotenusa × cosseno.' };
  }),
  fam(M, ['Álgebra', 'Inequações do 1º grau'], 'enem', 3, 100, r => {
    const fA = r.int(1, 6) * 10, pA = r.int(8, 20) / 2, pB = r.int(2, Math.floor(pA * 2) - 2) / 2, fB = fA + r.int(4, 40) * 5;
    const lim = (fB - fA) / (pA - pB), x = Math.floor(lim) + 1;
    if (x < 3) return null;
    const serv = r.pick([['academia', 'aulas avulsas'], ['locadora de carros', 'quilômetros'], ['plano de celular', 'gigabytes extras'], ['estacionamento', 'horas']]);
    const o = opcoes(r, `${x}`, [x - 1, x + 1, Math.round(fB / pB), Math.round(lim / 2) || x + 3, x + 5].map(String));
    return o && { ...o, statement: `Uma ${serv[0]} oferece dois planos: A, com taxa fixa de ${brl(fA)} e ${brl(pA)} por unidade, e B, com taxa fixa de ${brl(fB)} e ${brl(pB)} por unidade (as unidades são ${serv[1]}). A partir de quantas unidades o plano B passa a ser mais barato?`,
      explanation: `B < A ⇔ ${num(fB)} + ${num(pB)}x < ${num(fA)} + ${num(pA)}x ⇔ ${num(r2(pA - pB))}x > ${num(fB - fA)} ⇔ x > ${num(r2(lim))}. O menor número inteiro é ${x}.`,
      hint: 'Monte a desigualdade custo B < custo A e isole x.' };
  }),
  fam(M, ['Aritmética', 'MMC e MDC'], 'fundamental', 2, 100, r => {
    const a = r.pick([8, 10, 12, 15, 18, 20, 24, 30, 36, 40, 45]), b = r.pick([6, 9, 12, 14, 16, 20, 25, 27, 35, 42]); if (a === b) return null;
    const mmc = a * b / gcd(a, b), h0 = r.int(6, 9), tot = h0 * 60 + mmc;
    const hora = m => `${String(Math.floor(m / 60) % 24).padStart(2, '0')}h${String(m % 60).padStart(2, '0')}`;
    const o = opcoes(r, hora(tot), [hora(h0 * 60 + a * b), hora(h0 * 60 + a + b), hora(h0 * 60 + gcd(a, b)), hora(h0 * 60 + mmc * 2), hora(h0 * 60 + Math.max(a, b))]);
    return o && { ...o, statement: `Em ${r.pick(CIDADES)}, dois ônibus partem do mesmo terminal: um a cada ${a} minutos e outro a cada ${b} minutos. Se saíram juntos às ${hora(h0 * 60)}, a próxima vez em que sairão juntos será às:`,
      explanation: `Eles coincidem a cada MMC(${a}, ${b}) = ${mmc} minutos. ${hora(h0 * 60)} + ${mmc} min = ${hora(tot)}.`, hint: 'Eventos que se repetem e voltam a coincidir: use o MMC.' };
  }),
  fam(M, ['Aritmética', 'MMC e MDC'], 'fundamental', 2, 100, r => {
    const g = r.pick([5, 6, 8, 10, 12, 15, 20, 25]), p = r.int(2, 9), q = r.int(2, 9); if (gcd(p, q) !== 1) return null;
    const a = g * p, b = g * q, pedeQtd = r.chance(0.5);
    const mat = r.pick(['fitas', 'tábuas', 'barras de ferro', 'tiras de couro', 'cordas']);
    const certo = pedeQtd ? `${p + q} pedaços` : `${g} cm`;
    const ds = pedeQtd ? [p * q, a + b, p + q + 2, g, Math.round((a + b) / 2)].map(x => `${x} pedaços`) : [a * b / g, Math.max(1, Math.round(g / 2)), g * 2, g + 5, Math.abs(a - b) || 3].map(x => `${num(x)} cm`);
    const o = opcoes(r, certo, ds);
    return o && { ...o, statement: `Um artesão tem duas ${mat}, de ${a} cm e ${b} cm. Ele quer cortá-las em pedaços todos do mesmo tamanho, o maior possível, sem sobras. ${pedeQtd ? 'Quantos pedaços terá ao final?' : 'Qual será o tamanho de cada pedaço?'}`,
      explanation: `O maior tamanho que divide as duas é o MDC(${a}, ${b}) = ${g} cm. Pedaços: ${a}/${g} + ${b}/${g} = ${p} + ${q} = ${p + q}.`, hint: 'O maior pedaço que cabe exatamente nos dois comprimentos é o MDC.' };
  }),
  fam(M, ['Aritmética', 'Divisão proporcional'], 'enem', 2, 100, r => {
    const a = r.int(1, 6), b = r.int(1, 6), c = r.int(1, 6), k = r.int(2, 40) * 100, tot = (a + b + c) * k;
    const [n1, n2, n3] = r.sample(NOMES, 3), quem = r.int(0, 2), partes = [a, b, c], nomes = [n1, n2, n3];
    const certo = partes[quem] * k;
    const o = opcoes(r, brl(certo), [brl(tot / 3), brl(partes[(quem + 1) % 3] * k), brl(partes[quem] * k * 2), brl(r2(tot * partes[quem] / 10)), brl(certo + k)]);
    return o && { ...o, statement: `${n1}, ${n2} e ${n3} investiram num negócio, respectivamente, nas proporções ${a}, ${b} e ${c}. O lucro de ${brl(tot)} será dividido em partes diretamente proporcionais ao que cada um investiu. Quanto receberá ${nomes[quem]}?`,
      explanation: `Total de partes: ${a} + ${b} + ${c} = ${a + b + c}. Cada parte vale ${brl(tot)}/${a + b + c} = ${brl(k)}. ${nomes[quem]} recebe ${partes[quem]} × ${brl(k)} = ${brl(certo)}.`,
      hint: 'Some as proporções, descubra quanto vale uma parte e multiplique.' };
  }),
  fam(M, ['Estatística', 'Média ponderada'], 'enem', 2, 100, r => {
    const pesos = r.pick([[1, 2, 3], [2, 3, 5], [1, 1, 2], [3, 3, 4], [1, 2, 2]]), notas = pesos.map(() => r.int(3, 10) + r.pick([0, 0.5]));
    const sp = pesos.reduce((x, y) => x + y), mp = notas.reduce((s, n, i) => s + n * pesos[i], 0) / sp;
    if (Math.abs(mp * 100 - Math.round(mp * 100)) > 1e-6) return null;
    const ms = notas.reduce((x, y) => x + y) / 3;
    const o = opcoes(r, num(r2(mp)), [num(r2(ms)), num(r2(mp + 0.5)), num(r2(mp - 0.5)), num(r2(notas.reduce((s, n, i) => s + n * pesos[i], 0) / 3)), num(Math.max(...notas))]);
    return o && { ...o, statement: `Em uma escola, a média final é ponderada: prova 1 tem peso ${pesos[0]}, prova 2 tem peso ${pesos[1]} e o trabalho tem peso ${pesos[2]}. ${r.pick(NOMES)} tirou ${num(notas[0])}, ${num(notas[1])} e ${num(notas[2])}, nessa ordem. Qual foi a média final?`,
      explanation: `Média ponderada = (${notas.map((n, i) => `${num(n)}·${pesos[i]}`).join(' + ')})/(${pesos.join(' + ')}) = ${num(notas.reduce((s, n, i) => s + n * pesos[i], 0))}/${sp} = ${num(r2(mp))}.`,
      hint: 'Multiplique cada nota pelo seu peso, some e divida pela soma dos pesos.' };
  }),
  fam(M, ['Polinômios', 'Teorema do resto'], 'medio', 4, 120, r => {
    const c = [nz(r, -3, 4), r.int(-5, 5), r.int(-6, 6), r.int(-9, 9)], a = nz(r, -3, 3);
    const P = x => c[0] * x ** 3 + c[1] * x ** 2 + c[2] * x + c[3];
    const pol = `${termo(c[0], 'x³', true)}${termo(c[1], 'x²')}${termo(c[2], 'x')}${c[3] ? sinal(c[3]) : ''}`;
    const v = P(a);
    const o = opcoes(r, num(v), [num(P(-a)), num(c[3]), num(v + a), num(c.reduce((x, y) => x + y)), num(-v || 4), num(v * 2 || 6)]);
    return o && { ...o, statement: `Qual é o resto da divisão do polinômio P(x) = ${pol} por (x ${a < 0 ? '+ ' + Math.abs(a) : '− ' + a})?`,
      explanation: `Pelo teorema do resto, o resto é P(${num(a)}) = ${num(c[0])}·(${num(a)})³${sinal(c[1])}·(${num(a)})²${sinal(c[2])}·(${num(a)})${sinal(c[3])} = ${num(v)}.`,
      hint: 'O resto da divisão de P(x) por (x − a) é P(a).' };
  }),
  fam(M, ['Polinômios', 'Relações de Girard'], 'medio', 5, 100, r => {
    const a = nz(r, -4, 5), b = r.int(-9, 9), c = r.int(-9, 9), d = nz(r, -12, 12), pede = r.pick(['soma', 'produto', 'soma dos produtos dois a dois']);
    const v = pede === 'soma' ? frac(-b, a) : pede === 'produto' ? frac(-d, a) : frac(c, a);
    const pol = `${termo(a, 'x³', true)}${termo(b, 'x²')}${termo(c, 'x')}${sinal(d)}`;
    const o = opcoes(r, v, [frac(b, a), frac(d, a), frac(-c, a), frac(-b, a), frac(-d, a), frac(c, a), frac(-b - d, a), frac(b + 1, a)]);
    return o && { ...o, statement: `Sejam r₁, r₂ e r₃ as raízes (reais ou complexas) da equação ${pol} = 0. Qual é a ${pede} das raízes?`,
      explanation: `Pelas relações de Girard para ax³ + bx² + cx + d = 0: soma = −b/a, soma dos produtos dois a dois = c/a, produto = −d/a. Aqui a = ${a}, b = ${b}, c = ${c}, d = ${d}, então a ${pede} é ${v}.`,
      hint: 'Girard: r₁ + r₂ + r₃ = −b/a; r₁r₂ + r₁r₃ + r₂r₃ = c/a; r₁r₂r₃ = −d/a.' };
  }),
  fam(M, ['Geometria analítica', 'Área de triângulo'], 'medio', 4, 100, r => {
    const p = Array.from({ length: 3 }, () => [r.int(-5, 7), r.int(-5, 7)]);
    const D = p[0][0] * (p[1][1] - p[2][1]) + p[1][0] * (p[2][1] - p[0][1]) + p[2][0] * (p[0][1] - p[1][1]);
    if (!D) return null;
    const A = Math.abs(D) / 2;
    const P = ([x, y]) => `(${num(x)}, ${num(y)})`;
    const o = opcoes(r, num(A), [num(Math.abs(D)), num(A + 1), num(A * 4), num(Math.abs(A - 2) || 9), num(A / 2)]);
    return o && { ...o, statement: `Qual é a área do triângulo de vértices A${P(p[0])}, B${P(p[1])} e C${P(p[2])}?`,
      explanation: `A área é |D|/2, onde D é o determinante com as coordenadas: D = ${num(D)}. Área = ${Math.abs(D)}/2 = ${num(A)}.`,
      hint: 'Monte o determinante com x, y e 1 de cada vértice; a área é metade do módulo.' };
  }),
  fam(M, ['Matemática financeira', 'Lucro e prejuízo'], 'enem', 2, 100, r => {
    const custo = r.int(4, 80) * 5, p = r.pick([10, 20, 25, 30, 40, 50, 60]), venda = r2(custo * (1 + p / 100));
    const item = r.pick(['um bolo de pote', 'uma camiseta estampada', 'um vaso de planta', 'uma capinha de celular', 'um kit de maquiagem']);
    const o = opcoes(r, brl(venda), [brl(custo + p), brl(r2(custo * p / 100)), brl(r2(custo / (1 - p / 100))), brl(r2(custo * (1 + p / 1000))), brl(r2(venda + 10))]);
    return o && { ...o, statement: `${r.pick(NOMES)} gasta ${brl(custo)} para produzir ${item} e quer ter lucro de ${p}% sobre o custo. Por quanto deve vender cada unidade?`,
      explanation: `Lucro: ${p}% de ${brl(custo)} = ${brl(r2(custo * p / 100))}. Preço de venda: ${brl(custo)} × ${num(1 + p / 100)} = ${brl(venda)}.`, hint: 'Preço = custo × (1 + taxa de lucro).' };
  }),
  fam(M, ['Geometria', 'Polígonos'], 'fundamental', 2, 40, r => {
    const n = r.int(5, 20), pedeCada = r.chance(0.5);
    const S = (n - 2) * 180, cada = r2(S / n);
    const nome = { 5: 'pentágono', 6: 'hexágono', 7: 'heptágono', 8: 'octógono', 9: 'eneágono', 10: 'decágono', 12: 'dodecágono', 15: 'pentadecágono', 20: 'icoságono' }[n] || `polígono de ${n} lados`;
    const certo = pedeCada ? cada : S;
    const o = opcoes(r, `${num(certo)}°`, [n * 180, (n - 1) * 180, 360 / n, (n - 3) * 180, r2(S / (n - 1)), 360].map(x => `${num(r2(x))}°`));
    return o && { ...o, statement: pedeCada ? `Quanto mede cada ângulo interno de um ${nome} regular?` : `Qual é a soma dos ângulos internos de um ${nome}?`,
      explanation: `Sᵢ = (n − 2)·180° = (${n} − 2)·180° = ${num(S)}°.${pedeCada ? ` Sendo regular, cada ângulo mede ${num(S)}°/${n} = ${num(cada)}°.` : ''}`, hint: 'Use Sᵢ = (n − 2)·180°.' };
  }),
  fam(M, ['Estatística', 'Variância e desvio padrão'], 'medio', 4, 100, r => {
    const m = r.int(4, 20), ds = r.pick([[-2, 2, -1, 1], [-3, 3, 0, 0], [-4, 4, -2, 2], [-1, 1, -1, 1], [-3, 1, 2, 0], [-2, -2, 2, 2], [-6, 6, 0, 0, -3, 3]]);
    const xs = r.shuffle(ds.map(d => m + d)), v = ds.reduce((s, d) => s + d * d, 0) / ds.length;
    const o = opcoes(r, num(r2(v)), [num(r2(Math.sqrt(v))), num(r2(ds.reduce((s, d) => s + d * d, 0))), num(r2(ds.reduce((s, d) => s + Math.abs(d), 0) / ds.length)), num(r2(v * 2)), num(m)]);
    return o && { ...o, statement: `As notas de um grupo foram: ${xs.join(', ')}. Qual é a variância (populacional) dessas notas?`,
      explanation: `Média = ${m}. Desvios: ${ds.join(', ')}. Quadrados: ${ds.map(d => d * d).join(', ')}. Variância = ${ds.reduce((s, d) => s + d * d, 0)}/${ds.length} = ${num(r2(v))}. (O desvio padrão seria √${num(r2(v))}.)`,
      hint: 'Variância = média dos quadrados dos desvios em relação à média.' };
  }),
  fam(M, ['Funções', 'Composição e inversa'], 'medio', 3, 120, r => {
    const a = nz(r, -5, 5), b = r.int(-9, 9), c = nz(r, -5, 5), d = r.int(-9, 9), k = r.int(-4, 5);
    const comp = r.chance(0.5);
    const f = x => a * x + b, g = x => c * x + d;
    const fx = `f(x) = ${termo(a, 'x', true)}${b ? sinal(b) : ''}`, gx = `g(x) = ${termo(c, 'x', true)}${d ? sinal(d) : ''}`;
    if (comp) {
      const v = f(g(k));
      const o = opcoes(r, num(v), [num(g(f(k))), num(f(k) + g(k)), num(f(k) * g(k)), num(f(g(k + 1))), num(v + 1)]);
      return o && { ...o, statement: `Dadas as funções ${fx} e ${gx}, o valor de f(g(${num(k)})) é:`, explanation: `Primeiro g(${num(k)}) = ${num(g(k))}. Depois f(${num(g(k))}) = ${num(v)}.`, hint: 'Na composta f(g(x)), calcule primeiro a função de dentro.' };
    }
    const y = f(k);
    const o = opcoes(r, num(k), [num(y), num(-k), num(k + 1), num(k - 1), num(a * y + b)]);
    return o && { ...o, statement: `Sendo ${fx}, qual é o valor de f⁻¹(${num(y)})?`, explanation: `f⁻¹(${num(y)}) é o x tal que f(x) = ${num(y)}: ${num(a)}x ${sinal(b)} = ${num(y)} ⇒ x = ${num(k)}.`, hint: 'f⁻¹(y) é o número que, colocado em f, dá y.' };
  }),
  fam(M, ['Aritmética', 'Notação científica'], 'medio', 2, 100, r => {
    const a = r.int(11, 95) / 10, b = r.pick([2, 3, 4, 5, 1.5, 2.5]), p = r.int(-8, 12), q = r.int(-6, 10);
    let m = a * b, e = p + q; if (m >= 10) { m /= 10; e++; }
    const f = (x, y) => `${num(r2(x))} × 10${sup(y)}`;
    const o = opcoes(r, f(m, e), [f(m, p * q), f(m, e - 1), f(m * 10, e - 2 === e ? e + 3 : e + 1), f(a + b, e), f(m, e + 2)]);
    return o && { ...o, statement: `O resultado de (${f(a, p)}) · (${f(b, q)}), em notação científica, é:`,
      explanation: `Multiplica-se as mantissas e somam-se os expoentes: ${num(a)} · ${num(b)} = ${num(r2(a * b))} e 10${sup(p)} · 10${sup(q)} = 10${sup(p + q)}. Ajustando para mantissa entre 1 e 10: ${f(m, e)}.`,
      hint: 'Multiplique os números da frente e some os expoentes de 10.' };
  }),
  fam(M, ['Funções', 'Equações exponenciais'], 'medio', 3, 100, r => {
    const base = r.pick([2, 3, 5]), p = nz(r, -3, 4), x = r.int(-4, 6), q = r.int(-5, 5), m = p * x + q;
    if (Math.abs(m) > 7) return null;
    const pot = base ** Math.abs(m), rhs = m >= 0 ? num(pot) : `1/${pot}`;
    const exp = `${termo(p, 'x', true)}${q ? sinal(q) : ''}`;
    const o = opcoes(r, num(x), [num(x + 1), num(x - 1), num(-x || 2), num(m), num(r2((m + q) / p))]);
    return o && { ...o, statement: `Qual é o valor de x que satisfaz ${base}^(${exp}) = ${rhs}?`,
      explanation: `${rhs} = ${base}${sup(m)}. Igualando os expoentes: ${exp} = ${num(m)} ⇒ x = ${num(x)}.`, hint: 'Escreva os dois lados na mesma base e iguale os expoentes.' };
  }),

  // ================= FÍSICA =================
  fam(F, ['Cinemática', 'Movimento uniformemente variado'], 'medio', 2, 100, r => {
    const v0 = r.int(0, 20), a = r.int(1, 6), t = r.int(2, 12), v = v0 + a * t;
    const o = opcoes(r, `${v} m/s`, [v0 + a, a * t, v0 * t + a, v + a, Math.round(v * 3.6)].map(x => `${x} m/s`));
    return o && { ...o, statement: `Um ${r.pick(['carro', 'trem', 'skate elétrico', 'ônibus', 'patinete'])} parte com velocidade de ${v0} m/s e acelera uniformemente a ${a} m/s². Qual é sua velocidade após ${t} s?`,
      explanation: `v = v₀ + a·t = ${v0} + ${a}·${t} = ${v} m/s.`, hint: 'No MUV, a velocidade muda a cada segundo o valor da aceleração.' };
  }),
  fam(F, ['Cinemática', 'Equação de Torricelli'], 'enem', 3, 100, r => {
    const v0 = r.pick([10, 15, 20, 25, 30]), a = r.pick([2, 4, 5, 8, 10]), d = v0 * v0 / (2 * a);
    const o = opcoes(r, `${num(d)} m`, [v0 * v0 / a, v0 / a, v0 * a, d / 2, d * 2 + 1].map(x => `${num(r2(x))} m`));
    return o && { ...o, statement: `Um motorista dirige a ${num(v0 * 3.6)} km/h (${v0} m/s) quando freia, com desaceleração constante de ${a} m/s², até parar. Qual é a distância percorrida durante a frenagem?`,
      explanation: `Torricelli: v² = v₀² − 2·a·d ⇒ 0 = ${v0}² − 2·${a}·d ⇒ d = ${v0 * v0}/${2 * a} = ${num(d)} m.`, hint: 'Sem o tempo, use v² = v₀² + 2aΔs.' };
  }),
  fam(F, ['Cinemática', 'Queda livre'], 'medio', 2, 60, r => {
    const t = r.int(1, 8), h = 5 * t * t, pede = r.pick(['tempo', 'velocidade']);
    const certo = pede === 'tempo' ? `${t} s` : `${10 * t} m/s`;
    const ds = pede === 'tempo' ? [h / 10, Math.round(h / 5), t * 2, t + 1, Math.round(Math.sqrt(h))].map(x => `${num(r2(x))} s`) : [5 * t, h / t * 2 + 10, 10 * t * t, 20 * t, h].map(x => `${num(r2(x))} m/s`);
    const o = opcoes(r, certo, ds);
    return o && { ...o, statement: `Um objeto é abandonado do repouso de uma altura de ${h} m. Desprezando a resistência do ar e usando g = 10 m/s², ${pede === 'tempo' ? 'quanto tempo ele leva para chegar ao chão?' : 'com que velocidade ele chega ao chão?'}`,
      explanation: `h = g·t²/2 ⇒ ${h} = 5t² ⇒ t = ${t} s. Velocidade final: v = g·t = ${10 * t} m/s.`, hint: 'Queda livre: h = 5t² e v = 10t (com g = 10 m/s²).' };
  }),
  fam(F, ['Cinemática', 'Lançamento horizontal'], 'medio', 4, 100, r => {
    const t = r.int(1, 5), v = r.int(2, 25), h = 5 * t * t, x = v * t;
    const o = opcoes(r, `${x} m`, [v * h, Math.round(v * Math.sqrt(h)), 2 * x, x + h, v * t * t].map(y => `${y} m`));
    return o && { ...o, statement: `Uma bolinha rola sobre uma mesa a ${v} m/s e cai de uma altura de ${h} m. Desprezando o ar e usando g = 10 m/s², a que distância horizontal da borda ela toca o chão?`,
      explanation: `Tempo de queda: ${h} = 5t² ⇒ t = ${t} s. Na horizontal o movimento é uniforme: x = v·t = ${v}·${t} = ${x} m.`, hint: 'Separe: na vertical é queda livre (dá o tempo); na horizontal, velocidade constante.' };
  }),
  fam(F, ['Energia', 'Trabalho e potência'], 'enem', 3, 100, r => {
    const m = r.int(2, 20) * 10, h = r.int(2, 15), t = r.pick([5, 10, 20, 25, 40, 50]), W = m * 10 * h, P = W / t;
    if (!Number.isInteger(P)) return null;
    const o = opcoes(r, `${num(P)} W`, [W, m * h / t, P * 10, W * t, P / 2].map(x => `${num(r2(x))} W`));
    return o && { ...o, statement: `Um guindaste ergue, com velocidade constante, uma carga de ${m} kg a uma altura de ${h} m em ${t} s. Usando g = 10 m/s², qual a potência média desenvolvida?`,
      explanation: `Trabalho = m·g·h = ${m}·10·${h} = ${num(W)} J. Potência = trabalho/tempo = ${num(W)}/${t} = ${num(P)} W.`, hint: 'Potência é energia por tempo: P = m·g·h/t.' };
  }),
  fam(F, ['Dinâmica', 'Quantidade de movimento'], 'medio', 4, 100, r => {
    const m1 = r.int(1, 10) * 100, m2 = r.int(1, 10) * 100, v1 = r.int(2, 20), vf = m1 * v1 / (m1 + m2);
    if (Math.abs(vf * 100 - Math.round(vf * 100)) > 1e-9) return null;
    const o = opcoes(r, `${num(vf)} m/s`, [v1 / 2, v1, m2 * v1 / (m1 + m2), r2(Math.sqrt(m1 / (m1 + m2)) * v1), v1 * m1 / m2].map(x => `${num(r2(x))} m/s`));
    return o && { ...o, statement: `Um carrinho de ${m1} kg, a ${v1} m/s, colide com outro de ${m2} kg, parado. Após a colisão, eles seguem juntos. Desprezando atritos, qual a velocidade do conjunto logo após a batida?`,
      explanation: `Conservação da quantidade de movimento: ${m1}·${v1} = (${m1} + ${m2})·v ⇒ v = ${m1 * v1}/${m1 + m2} = ${num(vf)} m/s.`, hint: 'Numa colisão, a quantidade de movimento total (m·v) se conserva.' };
  }),
  fam(F, ['Dinâmica', 'Lei de Hooke'], 'medio', 2, 100, r => {
    const k = r.int(1, 40) * 50, x = r.int(1, 20), pedeF = r.chance(0.5), Fz = k * x / 100;
    const certo = pedeF ? `${num(Fz)} N` : `${x} cm`;
    const ds = pedeF ? [k * x, k / x, Fz * 10, Fz / 2, k].map(v => `${num(r2(v))} N`) : [x * 10, Math.round(Fz), x + 2, x * 2, Math.round(k / Fz) / 10].map(v => `${num(v)} cm`);
    const o = opcoes(r, certo, ds);
    return o && { ...o, statement: pedeF ? `Uma mola de constante elástica ${num(k)} N/m é esticada em ${x} cm. Qual é a força elástica?` : `Uma mola de constante ${num(k)} N/m sustenta um peso de ${num(Fz)} N em equilíbrio. Quanto ela se deforma?`,
      explanation: `Lei de Hooke: F = k·x, com x em metros. ${x} cm = ${num(x / 100)} m; F = ${num(k)}·${num(x / 100)} = ${num(Fz)} N.`, hint: 'F = k·x, sempre com x em metros.' };
  }),
  fam(F, ['Eletricidade', 'Associação de resistores'], 'medio', 3, 120, r => {
    const pares = [[2, 2], [3, 6], [4, 4], [4, 12], [6, 12], [10, 10], [10, 40], [12, 24], [20, 30], [6, 3], [15, 10], [20, 20], [8, 24], [30, 60], [12, 4]];
    const [a, b] = r.pick(pares), Rs = r.pick([0, 2, 4, 5, 8, 10]), Rp = a * b / (a + b), Req = Rs + Rp;
    const txt = Rs ? `um resistor de ${Rs} Ω em série com uma associação em paralelo de ${a} Ω e ${b} Ω` : `dois resistores de ${a} Ω e ${b} Ω associados em paralelo`;
    const o = opcoes(r, `${num(Req)} Ω`, [Rs + a + b, Rs + (a + b) / 2, Rs + Math.min(a, b), Rs ? Rp : a + b + 1, Rs + a * b / 10].map(x => `${num(r2(x))} Ω`));
    return o && { ...o, statement: `Qual é a resistência equivalente de um circuito formado por ${txt}?`,
      explanation: `Paralelo: R = (${a}·${b})/(${a} + ${b}) = ${num(Rp)} Ω.${Rs ? ` Somando o resistor em série: ${Rs} + ${num(Rp)} = ${num(Req)} Ω.` : ''}`, hint: 'Em paralelo, para dois resistores: produto sobre soma. Em série, some.' };
  }),
  fam(F, ['Eletricidade', 'Potência elétrica'], 'enem', 2, 100, r => {
    const U = r.pick([110, 127, 220]);
    const [ap, P] = r.pick([['chuveiro', r.pick([4400, 5500, 6600, 7700])], ['forno elétrico', r.pick([1100, 2200, 3300])], ['secador de cabelo', r.pick([1100, 1320, 2200])], ['aquecedor', r.pick([1100, 2200])], ['ferro de passar', r.pick([880, 1100, 1320])], ['micro-ondas', r.pick([1100, 1320])]]), i = P / U;
    if (Math.abs(i * 10 - Math.round(i * 10)) > 1e-9) return null;
    const o = opcoes(r, `${num(i)} A`, [P * U, U / P * 100, i * 2, i / 2, P / 100].map(x => `${num(r2(x))} A`));
    return o && { ...o, statement: `Um ${ap} de ${num(P)} W é ligado numa tomada de ${U} V. Qual é a corrente elétrica que passa por ele?`,
      explanation: `P = U·i ⇒ i = P/U = ${num(P)}/${U} = ${num(i)} A. É por isso que aparelhos potentes pedem fios mais grossos e disjuntor adequado.`, hint: 'Use P = U·i.' };
  }),
  fam(F, ['Termologia', 'Gases ideais'], 'medio', 4, 120, r => {
    const T1c = r.pick([27, 127, 77, -73, 177, 227, 0]), T1 = T1c + 273;
    const p1 = r.int(1, 6), V1 = r.int(2, 20), p2 = r.int(1, 6), V2 = r.int(2, 20);
    const T2 = p2 * V2 * T1 / (p1 * V1); if (!Number.isInteger(T2) || T2 < 100) return null;
    const o = opcoes(r, `${T2 - 273} °C`, [T2, Math.round(p2 * V2 * T1c / (p1 * V1)), T2 - 200, T1c, Math.round((T2 - 273) / 2)].map(x => `${x} °C`));
    return o && { ...o, statement: `Um gás ideal está a ${p1} atm, ocupa ${V1} L e tem temperatura de ${T1c} °C. Ele passa a ${p2} atm e ${V2} L. Qual é a nova temperatura, em °C?`,
      explanation: `p₁V₁/T₁ = p₂V₂/T₂, com T em kelvin. T₁ = ${T1c} + 273 = ${T1} K. T₂ = ${p2}·${V2}·${T1}/(${p1}·${V1}) = ${T2} K = ${T2 - 273} °C.`, hint: 'Na lei geral dos gases, use sempre temperatura em kelvin (°C + 273).' };
  }),
  fam(F, ['Termologia', 'Dilatação térmica'], 'medio', 3, 100, r => {
    const L0 = r.int(1, 20) * 10, a = r.pick([[1.2, 'aço'], [2.4, 'alumínio'], [1.7, 'cobre'], [1.9, 'latão']]), dT = r.int(2, 10) * 10;
    const dL = L0 * a[0] * 1e-5 * dT * 1000;
    const o = opcoes(r, `${num(r2(dL))} mm`, [dL * 10, dL / 10, L0 * a[0] * dT / 100, dL * 2, dL + L0].map(x => `${num(r2(x))} mm`));
    return o && { ...o, statement: `Um trilho de ${a[1]} tem ${L0} m a 20 °C. Sendo o coeficiente de dilatação linear ${num(a[0])} × 10⁻⁵ °C⁻¹, quanto ele aumenta se a temperatura subir ${dT} °C?`,
      explanation: `ΔL = L₀·α·ΔT = ${L0} m · ${num(a[0])}×10⁻⁵ °C⁻¹ · ${dT} °C = ${num(r2(dL))} mm (1 m = 1.000 mm). Por isso os trilhos têm pequenas folgas.`, hint: 'ΔL = L₀·α·ΔT; depois converta metros para milímetros.' };
  }),
  fam(F, ['Óptica', 'Lentes e espelhos esféricos'], 'medio', 4, 100, r => {
    const trios = []; for (let p = 6; p <= 120; p++) for (let f = 2; f < p - 2; f++) { const q = f * p / (p - f); if (Number.isInteger(q) && q <= 200) trios.push([f, p, q]); }
    const [f, p, q] = r.pick(trios), A = r2(-q / p);
    const o = opcoes(r, `${q} cm`, [p - f, p + f, f * p, Math.round(p * f / (p + f)), q * 2].map(x => `${num(r2(x))} cm`));
    return o && { ...o, statement: `Um objeto é colocado a ${p} cm de uma lente convergente de distância focal ${f} cm. A que distância da lente se forma a imagem nítida?`,
      explanation: `Equação de Gauss: 1/f = 1/p + 1/p' ⇒ 1/p' = 1/${f} − 1/${p} ⇒ p' = ${q} cm. Aumento: A = −p'/p = ${num(A)} (imagem real e invertida).`, hint: 'Use 1/f = 1/p + 1/p\'.' };
  }),
  fam(F, ['Hidrostática', 'Pressão hidrostática'], 'enem', 3, 60, r => {
    const h = r.int(1, 12) * 5, p = 1 + h / 10;
    const quem = r.pick(['Um mergulhador', 'Um submarino de pesquisa', 'Uma câmera subaquática', 'Uma mergulhadora']);
    const o = opcoes(r, `${num(p)} atm`, [h / 10, h, 1 + h, p * 2, 1 + h / 5].map(x => `${num(r2(x))} atm`));
    return o && { ...o, statement: `${quem} está a ${h} m de profundidade no mar. Considerando que cada 10 m de água acrescentam cerca de 1 atm e que a pressão na superfície é 1 atm, qual é a pressão total nesse ponto?`,
      explanation: `Pressão da água: ${h}/10 = ${num(h / 10)} atm. Total = pressão atmosférica + hidrostática = 1 + ${num(h / 10)} = ${num(p)} atm.`, hint: 'Não esqueça de somar a pressão do ar na superfície (1 atm).' };
  }),
  fam(F, ['Dinâmica', 'Movimento circular'], 'medio', 3, 100, r => {
    const v = r.int(2, 30), R = r.pick([1, 2, 4, 5, 8, 10, 20, 25, 50, 100]), a = v * v / R;
    if (Math.abs(a * 100 - Math.round(a * 100)) > 1e-9) return null;
    const m = r.int(6, 16) * 100, pedeF = r.chance(0.4);
    const certo = pedeF ? `${num(r2(m * a))} N` : `${num(r2(a))} m/s²`;
    const ds = pedeF ? [m * v / R, m * v * v, m * a / 10, m * a * 2, m * R / v].map(x => `${num(r2(x))} N`) : [v / R, v * R, v * v * R, 2 * v / R, a * 2].map(x => `${num(r2(x))} m/s²`);
    const o = opcoes(r, certo, ds);
    return o && { ...o, statement: `Um ${pedeF ? `carro de ${m} kg` : 'carro'} faz uma curva circular de raio ${R} m com velocidade constante de ${v} m/s. ${pedeF ? 'Qual a intensidade da força centrípeta sobre ele?' : 'Qual é a sua aceleração centrípeta?'}`,
      explanation: `a꜀ = v²/R = ${v}²/${R} = ${num(r2(a))} m/s².${pedeF ? ` F꜀ = m·a꜀ = ${m}·${num(r2(a))} = ${num(r2(m * a))} N.` : ''}`, hint: 'Aceleração centrípeta: v²/R. Força: massa vezes essa aceleração.' };
  }),
  fam(F, ['Cinemática', 'Movimento circular uniforme'], 'medio', 2, 60, r => {
    const rpm = r.pick([30, 60, 90, 120, 180, 240, 300, 600, 1200, 1800, 3000, 3600]), f = rpm / 60, T = 1 / f;
    const pedeT = r.chance(0.5);
    const certo = pedeT ? `${num(r2(T))} s` : `${num(f)} Hz`;
    const ds = pedeT ? [f, rpm, 60 / f / 10, T * 2, 1 / rpm].map(x => `${num(r2(x))} s`).filter(x => x !== '0 s') : [rpm, rpm / 6, 1 / f, f * 2, rpm / 100].map(x => `${num(r2(x))} Hz`);
    const o = opcoes(r, certo, ds.concat(pedeT ? ['60 s', '1 s', '0,5 s'] : ['1 Hz', '100 Hz']));
    return o && { ...o, statement: `${r.pick(['O tambor de uma máquina de lavar', 'Um ventilador', 'Uma roda-gigante de brinquedo', 'O motor de uma furadeira', 'Um disco de vinil'])} gira a ${rpm} rotações por minuto. ${pedeT ? 'Qual é o período do movimento?' : 'Qual é a frequência, em hertz?'}`,
      explanation: `f = ${rpm} rpm ÷ 60 = ${num(f)} Hz. T = 1/f = ${num(r2(T))} s.`, hint: 'Para passar de rpm para Hz, divida por 60. O período é o inverso da frequência.' };
  }),
  fam(F, ['Energia', 'Rendimento'], 'enem', 2, 80, r => {
    const tot = r.int(2, 50) * 100, util = r.int(1, 19) * tot / 20;
    const maq = r.pick(['Um motor elétrico', 'Uma lâmpada', 'Um painel solar', 'Um motor a combustão', 'Uma usina']);
    const eta = util / tot * 100;
    const o = opcoes(r, pct(eta), [100 - eta, eta / 10, tot / util, eta + 10, util / 100].map(x => pct(r2(x))));
    return o && { ...o, statement: `${maq} recebe ${num(tot)} J de energia e transforma ${num(util)} J em energia útil. Qual é o seu rendimento?`,
      explanation: `Rendimento = útil/total = ${num(util)}/${num(tot)} = ${num(r2(util / tot))} = ${pct(eta)}. O restante (${pct(100 - eta)}) é dissipado, principalmente como calor.`, hint: 'η = energia útil ÷ energia total.' };
  }),
  fam(F, ['Termologia', 'Mudanças de estado'], 'medio', 4, 100, r => {
    const m = r.int(1, 20) * 10, Tf = r.int(1, 8) * 10, Q1 = m * 80, Q2 = m * 1 * Tf, Qt = Q1 + Q2;
    const o = opcoes(r, `${num(Qt)} cal`, [Q1, Q2, m * Tf * 80, Qt + m * 80, m * (80 - Tf)].map(x => `${num(x)} cal`));
    return o && { ...o, statement: `Quanto calor é preciso para transformar ${m} g de gelo a 0 °C em água a ${Tf} °C? Use calor latente de fusão do gelo = 80 cal/g e calor específico da água = 1 cal/g·°C.`,
      explanation: `Derreter: Q = m·L = ${m}·80 = ${num(Q1)} cal. Aquecer a água: Q = m·c·ΔT = ${m}·1·${Tf} = ${num(Q2)} cal. Total: ${num(Qt)} cal.`, hint: 'São duas etapas: mudança de estado (m·L) e aquecimento (m·c·ΔT).' };
  }),
  fam(F, ['Eletrostática', 'Lei de Coulomb'], 'medio', 3, 100, r => {
    const a = r.pick([1, 2, 3, 4]), b = r.pick([1, 2, 3]), d = r.pick([2, 3, 1 / 2]);
    const fator = a * b / (d * d);
    const f = x => x >= 1 ? `${num(r2(x))} vezes maior` : Number.isInteger(1 / x) ? `${frac(1, 1 / x)} da original` : `${num(r2(x))} vezes a original`;
    const dtxt = d === 0.5 ? 'reduzida à metade' : `multiplicada por ${d}`;
    if (fator === 1) return null;
    const o = opcoes(r, f(fator), [f(a * b / d), f(a * b * d * d), f(a + b), f(a * b), f(d * d / (a * b))]);
    return o && { ...o, statement: `Duas cargas puntiformes se atraem com força F. Uma das cargas é multiplicada por ${a}, a outra por ${b}, e a distância entre elas é ${dtxt}. A nova força passa a ser:`,
      explanation: `F = k·q₁·q₂/d². Fator = (${a}·${b})/(${d === 0.5 ? '1/2' : d})² = ${num(r2(fator))}. A força fica ${f(fator)}.`, hint: 'A força é proporcional ao produto das cargas e inversamente proporcional ao quadrado da distância.' };
  }),
  fam(F, ['Cinemática', 'Velocidade média'], 'medio', 4, 60, r => {
    const pares = [[30, 60], [40, 60], [60, 90], [20, 30], [60, 120], [40, 120], [80, 120], [45, 90], [12, 24], [10, 15]];
    const [v1, v2] = r.shuffle(r.pick(pares)), vm = 2 * v1 * v2 / (v1 + v2);
    const o = opcoes(r, `${num(vm)} km/h`, [(v1 + v2) / 2, v1 + v2, Math.abs(v2 - v1), Math.max(v1, v2), vm + 5].map(x => `${num(r2(x))} km/h`));
    return o && { ...o, statement: `Um viajante percorre metade de um trajeto a ${v1} km/h e a outra metade a ${v2} km/h. Qual é a sua velocidade média no trajeto todo?`,
      explanation: `Com distâncias iguais d, o tempo total é d/${v1} + d/${v2}. v = 2d/(d/${v1} + d/${v2}) = 2·${v1}·${v2}/(${v1} + ${v2}) = ${num(vm)} km/h. Não é a média simples (${num((v1 + v2) / 2)}).`, hint: 'Velocidade média = distância total ÷ tempo total. Com metades de distância, use a média harmônica.' };
  }),
  fam(F, ['Hidrostática', 'Pressão'], 'fundamental', 2, 60, r => {
    const Fz = r.int(1, 30) * 100, A = r.pick([0.01, 0.02, 0.05, 0.1, 0.2, 0.25, 0.5, 2]), p = Fz / A;
    const o = opcoes(r, `${num(p)} Pa`, [Fz * A, Fz, p / 10, p * 2, Fz / (A * 100)].map(x => `${num(r2(x))} Pa`));
    return o && { ...o, statement: `Uma caixa que pesa ${num(Fz)} N está apoiada sobre uma base de ${num(A)} m². Qual é a pressão que ela exerce no chão?`,
      explanation: `p = F/A = ${num(Fz)}/${num(A)} = ${num(p)} Pa. Quanto menor a área de apoio, maior a pressão.`, hint: 'Pressão = força ÷ área.' };
  }),

  // ================= QUÍMICA =================
  ...(() => {
    const SUBST = [['água (H₂O)', 18], ['gás carbônico (CO₂)', 44], ['cloreto de sódio (NaCl)', 58.5], ['glicose (C₆H₁₂O₆)', 180], ['metano (CH₄)', 16], ['amônia (NH₃)', 17], ['gás oxigênio (O₂)', 32], ['hidróxido de sódio (NaOH)', 40], ['carbonato de cálcio (CaCO₃)', 100], ['ácido sulfúrico (H₂SO₄)', 98], ['etanol (C₂H₆O)', 46], ['ácido clorídrico (HCl)', 36.5], ['gás nitrogênio (N₂)', 28], ['sacarose (C₁₂H₂₂O₁₁)', 342]];
    return [
      fam(Q, ['Química geral', 'Quantidade de matéria (mol)'], 'medio', 2, 100, r => {
        const [s, Mm] = r.pick(SUBST), n = r.pick([0.1, 0.2, 0.25, 0.5, 1, 1.5, 2, 2.5, 3, 4, 5, 10]), m = r2(Mm * n);
        const o = opcoes(r, `${num(n)} mol`, [m * Mm, Mm / m, n * 2, n / 2, n * 6].map(x => `${num(r2(x))} mol`));
        return o && { ...o, statement: `Quantos mols existem em ${num(m)} g de ${s}? (Massa molar: ${num(Mm)} g/mol.)`, explanation: `n = m/M = ${num(m)}/${num(Mm)} = ${num(n)} mol.`, hint: 'Número de mols = massa ÷ massa molar.' };
      }),
      fam(Q, ['Química geral', 'Constante de Avogadro'], 'medio', 2, 60, r => {
        const [s, Mm] = r.pick(SUBST), n = r.pick([0.5, 1, 2, 3, 4, 5, 0.1, 0.2, 10]), m = r2(Mm * n);
        const part = n * 6, e = part >= 10 ? 24 : 23, man = part >= 10 ? part / 10 : part;
        const f = (x, y) => `${num(r2(x))} × 10${sup(y)} moléculas`;
        const o = opcoes(r, f(man, e), [f(man, e - 1), f(man, e + 1), f(6, 23), f(m * 6 >= 10 ? m * 0.6 : m * 6, 23), f(man * 2, e)]);
        return o && { ...o, statement: `Quantas moléculas existem em ${num(m)} g de ${s}? (M = ${num(Mm)} g/mol; constante de Avogadro = 6 × 10²³ mol⁻¹.)`, explanation: `n = ${num(m)}/${num(Mm)} = ${num(n)} mol. Moléculas = ${num(n)} × 6 × 10²³ = ${f(man, e).replace(' moléculas', '')}.`, hint: 'Primeiro ache os mols; depois multiplique por 6 × 10²³.' };
      }),
      fam(Q, ['Soluções', 'Concentração em mol/L'], 'enem', 3, 100, r => {
        const [s, Mm] = r.pick(SUBST.filter(x => !/gás/.test(x[0]))), n = r.pick([0.05, 0.1, 0.2, 0.25, 0.5, 1, 2]), V = r.pick([0.1, 0.25, 0.5, 1, 2, 0.2]), m = r2(n * Mm), Cm = r2(n / V);
        if (!Cm || Cm > 5) return null;
        const o = opcoes(r, `${num(Cm)} mol/L`, [m / V, n * V, Cm * 2, Cm / 10, m / Mm].map(x => `${num(r2(x))} mol/L`));
        return o && { ...o, statement: `Dissolvem-se ${num(m)} g de ${s} em água até completar ${num(V * 1000)} mL de solução. Qual é a concentração em mol/L? (M = ${num(Mm)} g/mol.)`, explanation: `n = ${num(m)}/${num(Mm)} = ${num(n)} mol. Volume = ${num(V)} L. Concentração = ${num(n)}/${num(V)} = ${num(Cm)} mol/L.`, hint: 'Ache os mols do soluto e divida pelo volume em litros.' };
      }),
      fam(Q, ['Gases', 'Volume molar'], 'medio', 3, 60, r => {
        const gs = SUBST.filter(x => /gás|metano|amônia/.test(x[0])), [s, Mm] = r.pick(gs), n = r.pick([0.25, 0.5, 1, 1.5, 2, 3, 5, 10]), m = r2(n * Mm), V = r2(n * 22.4);
        const o = opcoes(r, `${num(V)} L`, [m * 22.4, 22.4, V / 2, n * 25, Mm / 22.4].map(x => `${num(r2(x))} L`));
        return o && { ...o, statement: `Qual volume ocupam ${num(m)} g de ${s} nas CNTP? (M = ${num(Mm)} g/mol; volume molar = 22,4 L/mol.)`, explanation: `n = ${num(m)}/${num(Mm)} = ${num(n)} mol. V = ${num(n)} × 22,4 = ${num(V)} L.`, hint: 'Nas CNTP, 1 mol de qualquer gás ocupa 22,4 L.' };
      }),
      fam(Q, ['Físico-química', 'pH e pOH'], 'enem', 4, 40, r => {
        const k = r.int(1, 13), base = r.chance(0.5), pH = base ? 14 - k : k;
        const ion = base ? `[OH⁻] = 10⁻${sup(k).replace('⁻', '')} mol/L` : `[H⁺] = 10⁻${sup(k)} mol/L`;
        const o = opcoes(r, num(pH), [num(base ? k : 14 - k), num(k + 1), num(-k), num(7), num(Math.abs(pH - 1))]);
        const car = pH < 7 ? 'ácida' : pH > 7 ? 'básica' : 'neutra';
        return o && { ...o, statement: `Uma solução aquosa, a 25 °C, tem ${ion}. Qual é o seu pH?`, explanation: base ? `pOH = ${k}; como pH + pOH = 14, pH = ${pH} (solução ${car}).` : `pH = −log[H⁺] = ${k} (solução ${car}).`, hint: 'pH = −log[H⁺] e pH + pOH = 14 a 25 °C.' };
      }),
      fam(Q, ['Estequiometria', 'Cálculo estequiométrico'], 'enem', 4, 120, r => {
        const R = r.pick([
          { eq: 'CH₄ + 2 O₂ → CO₂ + 2 H₂O', a: ['metano', 16, 1], b: ['gás carbônico', 44, 1] },
          { eq: 'C₂H₆O + 3 O₂ → 2 CO₂ + 3 H₂O', a: ['etanol', 46, 1], b: ['gás carbônico', 44, 2] },
          { eq: 'CaCO₃ → CaO + CO₂', a: ['carbonato de cálcio', 100, 1], b: ['óxido de cálcio', 56, 1] },
          { eq: '2 H₂ + O₂ → 2 H₂O', a: ['gás hidrogênio', 2, 2], b: ['água', 18, 2] },
          { eq: 'N₂ + 3 H₂ → 2 NH₃', a: ['gás nitrogênio', 28, 1], b: ['amônia', 17, 2] },
          { eq: 'C₆H₁₂O₆ → 2 C₂H₆O + 2 CO₂', a: ['glicose', 180, 1], b: ['etanol', 46, 2] },
          { eq: 'Fe₂O₃ + 3 CO → 2 Fe + 3 CO₂', a: ['óxido de ferro III', 160, 1], b: ['ferro', 56, 2] },
          { eq: 'NaOH + HCl → NaCl + H₂O', a: ['hidróxido de sódio', 40, 1], b: ['cloreto de sódio', 58.5, 1] }
        ]);
        const mols = r.pick([0.5, 1, 2, 2.5, 3, 4, 5, 10, 20, 50, 100]), ma = r2(mols * R.a[1] * R.a[2] / R.a[2]);
        const mb = r2(mols / R.a[2] * R.b[2] * R.b[1]);
        const u = ma >= 1000 ? 'kg' : 'g', f = x => u === 'kg' ? `${num(r2(x / 1000))} kg` : `${num(r2(x))} g`;
        const o = opcoes(r, f(mb), [mols * R.b[1], ma * R.b[1] / R.a[1] * (R.b[2] === 1 ? 2 : 0.5), ma, mb * 2 === mb ? mb + 1 : mb / 2, ma + mb].map(f));
        return o && { ...o, statement: `Considere a reação balanceada: ${R.eq}. Partindo de ${f(ma)} de ${R.a[0]} (M = ${num(R.a[1])} g/mol), qual massa de ${R.b[0]} (M = ${num(R.b[1])} g/mol) se forma, com rendimento total?`,
          explanation: `${f(ma)} de ${R.a[0]} = ${num(r2(ma / R.a[1]))} mol. Pela proporção ${R.a[2]} : ${R.b[2]}, formam-se ${num(r2(ma / R.a[1] * R.b[2] / R.a[2]))} mol de ${R.b[0]}, ou seja, ${num(r2(ma / R.a[1] * R.b[2] / R.a[2]))} × ${num(R.b[1])} = ${f(mb)}.`,
          hint: 'Massa → mols → proporção da equação → mols do produto → massa.' };
      }),
      fam(Q, ['Soluções', 'Mistura de soluções'], 'medio', 4, 100, r => {
        const C1 = r.int(1, 10) / 10 * r.pick([1, 2, 5]), V1 = r.int(1, 10) * 100, C2 = r.int(1, 10) / 10 * r.pick([1, 2, 5]), V2 = r.int(1, 10) * 100;
        if (C1 === C2) return null;
        const Cf = (C1 * V1 + C2 * V2) / (V1 + V2); if (Math.abs(Cf * 100 - Math.round(Cf * 100)) > 1e-9) return null;
        const o = opcoes(r, `${num(Cf)} mol/L`, [(C1 + C2) / 2, C1 + C2, (C1 * V1 + C2 * V2) / 1000, Math.max(C1, C2), Cf * 2].map(x => `${num(r2(x))} mol/L`));
        return o && { ...o, statement: `Misturam-se ${V1} mL de uma solução de NaCl a ${num(C1)} mol/L com ${V2} mL de outra solução de NaCl a ${num(C2)} mol/L. Qual é a concentração da mistura?`,
          explanation: `C·V total = ${num(C1)}·${V1} + ${num(C2)}·${V2} = ${num(r2(C1 * V1 + C2 * V2))}. Volume final = ${V1 + V2} mL. C = ${num(r2(C1 * V1 + C2 * V2))}/${V1 + V2} = ${num(Cf)} mol/L.`, hint: 'Na mistura do mesmo soluto, C₁V₁ + C₂V₂ = C_f·(V₁ + V₂).' };
      }),
      fam(Q, ['Química geral', 'Rendimento de reação'], 'enem', 4, 60, r => {
        const teo = r.int(2, 60) * 10, p = r.pick([50, 60, 70, 75, 80, 85, 90, 95]), real = r2(teo * p / 100);
        const prod = r.pick(['ferro', 'etanol', 'amônia', 'cal virgem', 'sabão', 'biodiesel']);
        const o = opcoes(r, `${num(real)} kg`, [teo, teo - p, teo * (100 - p) / 100, teo * p / 1000, real + 10].map(x => `${num(r2(x))} kg`));
        return o && { ...o, statement: `Uma indústria calculou que, com a matéria-prima disponível, poderia obter no máximo ${teo} kg de ${prod}. Se o rendimento real do processo é de ${p}%, quanto ${prod} é efetivamente produzido?`, explanation: `Massa real = ${teo} × ${num(p / 100)} = ${num(real)} kg.`, hint: 'Massa obtida = massa teórica × rendimento.' };
      }),
      fam(Q, ['Química analítica', 'Titulação'], 'medio', 4, 80, r => {
        const ac = r.pick([['HCl', 1], ['H₂SO₄', 2]]), Cb = r.pick([0.1, 0.2, 0.5, 1]), Vb = r.int(5, 50), Va = r.pick([10, 20, 25, 50]);
        const raw = Cb * Vb / (ac[1] * Va); if (Math.abs(raw * 100 - Math.round(raw * 100)) > 1e-9) return null; const Ca = r2(raw); if (!Ca) return null;
        const o = opcoes(r, `${num(Ca)} mol/L`, [Cb * Vb / Va, Cb * Va / Vb, Ca * 2, Cb, Ca / 2].map(x => `${num(r2(x))} mol/L`));
        return o && { ...o, statement: `Na titulação de ${Va} mL de uma solução de ${ac[0]}, gastaram-se ${Vb} mL de NaOH a ${num(Cb)} mol/L até a neutralização completa. Qual é a concentração do ácido?`,
          explanation: `Mols de NaOH = ${num(Cb)} × ${Vb}/1000. ${ac[1] === 2 ? 'Cada H₂SO₄ neutraliza 2 NaOH, então mols de ácido = metade. ' : 'A proporção HCl : NaOH é 1 : 1. '}C = ${num(Cb)}·${Vb}/(${ac[1]}·${Va}) = ${num(Ca)} mol/L.`, hint: 'No ponto de equivalência, mols de H⁺ = mols de OH⁻.' };
      }),
      fam(Q, ['Química ambiental', 'Partes por milhão (ppm)'], 'enem', 3, 60, r => {
        const mg = r.int(1, 50) * r.pick([1, 2, 5]) / 10, L = r.pick([1, 2, 5, 10, 0.5]), ppm = r2(mg / L);
        const sub = r.pick(['flúor', 'cloro', 'chumbo', 'nitrato', 'mercúrio']);
        const o = opcoes(r, `${num(ppm)} ppm`, [mg * L, ppm * 1000, ppm / 1000, mg, ppm * 10].map(x => `${num(r2(x))} ppm`));
        return o && { ...o, statement: `Uma amostra de ${num(L)} L de água contém ${num(mg)} mg de ${sub}. Qual é a concentração desse elemento em ppm (considerando 1 L de água ≈ 1 kg)?`, explanation: `ppm = mg de soluto por kg (≈ por litro de água): ${num(mg)} mg/${num(L)} L = ${num(ppm)} ppm.`, hint: 'Em água, 1 ppm ≈ 1 mg por litro.' };
      })
    ];
  })(),
  ...(() => {
    const EL = [['H', 'hidrogênio', 1, 1], ['He', 'hélio', 2, 4], ['Li', 'lítio', 3, 7], ['Be', 'berílio', 4, 9], ['B', 'boro', 5, 11], ['C', 'carbono', 6, 12], ['N', 'nitrogênio', 7, 14], ['O', 'oxigênio', 8, 16], ['F', 'flúor', 9, 19], ['Ne', 'neônio', 10, 20], ['Na', 'sódio', 11, 23], ['Mg', 'magnésio', 12, 24], ['Al', 'alumínio', 13, 27], ['Si', 'silício', 14, 28], ['P', 'fósforo', 15, 31], ['S', 'enxofre', 16, 32], ['Cl', 'cloro', 17, 35], ['Ar', 'argônio', 18, 40], ['K', 'potássio', 19, 39], ['Ca', 'cálcio', 20, 40], ['Fe', 'ferro', 26, 56], ['Cu', 'cobre', 29, 64], ['Zn', 'zinco', 30, 65], ['Br', 'bromo', 35, 80], ['Ag', 'prata', 47, 108], ['I', 'iodo', 53, 127], ['Au', 'ouro', 79, 197], ['Hg', 'mercúrio', 80, 201], ['Pb', 'chumbo', 82, 207], ['U', 'urânio', 92, 238], ['Sn', 'estanho', 50, 119], ['Ni', 'níquel', 28, 59], ['Mn', 'manganês', 25, 55], ['Cr', 'cromo', 24, 52], ['Co', 'cobalto', 27, 59], ['Pt', 'platina', 78, 195]];
    const camadas = z => { const cap = [2, 8, 8, 2]; const out = []; let s = z; for (const c of cap) { if (s <= 0) break; out.push(Math.min(c, s)); s -= c; } return out; };
    return [
      fam(Q, ['Estrutura atômica', 'Prótons, nêutrons e elétrons'], 'medio', 2, 200, r => {
        const [sym, nome, Z, A] = r.pick(EL), carga = r.pick([0, 0, 1, 2, -1, -2, 3]);
        if (Z - carga <= 0) return null;
        const pede = r.pick(['nêutrons', 'elétrons', 'prótons']);
        const v = { 'nêutrons': A - Z, 'elétrons': Z - carga, 'prótons': Z }[pede];
        const ion = carga ? `${sym}${carga > 0 ? sup(Math.abs(carga) > 1 ? Math.abs(carga) : '') + '⁺' : sup(Math.abs(carga) > 1 ? Math.abs(carga) : '') + '⁻'}` : sym;
        const o = opcoes(r, num(v), [num(A), num(A - Z), num(Z), num(Z + carga), num(Z - carga), num(A + Z), num(v + 1)].filter(x => x !== num(v)));
        return o && { ...o, statement: `O ${carga ? 'íon' : 'átomo'} ${ion} (${nome}) tem número atômico Z = ${Z} e número de massa A = ${A}. Quantos ${pede} ele possui?`,
          explanation: `Prótons = Z = ${Z}. Nêutrons = A − Z = ${A - Z}. Elétrons = Z ${carga ? `− (${carga > 0 ? '+' : ''}${carga})` : ''} = ${Z - carga}${carga ? (carga > 0 ? ' (cátion perde elétrons)' : ' (ânion ganha elétrons)') : ''}.`,
          hint: 'Z = prótons; A = prótons + nêutrons; a carga mostra quantos elétrons foram perdidos ou ganhos.' };
      }),
      fam(Q, ['Tabela periódica', 'Símbolos dos elementos'], 'fundamental', 1, 72, (() => { let k = 0; return r => {
        const i = k % EL.length, v = Math.floor(k++ / EL.length) % 2, [sym, nome] = EL[i];
        const outros = r.shuffle(EL.filter((_, j) => j !== i));
        const o = v ? opcoes(r, nome[0].toUpperCase() + nome.slice(1), outros.map(e => e[1][0].toUpperCase() + e[1].slice(1))) : opcoes(r, sym, outros.map(e => e[0]));
        return o && { ...o, statement: v ? `Qual elemento químico tem o símbolo ${sym}?` : `Qual é o símbolo do elemento ${nome}?`, explanation: `${nome[0].toUpperCase() + nome.slice(1)}: ${sym}.${/^(Na|K|Fe|Cu|Ag|Au|Hg|Pb|Sn)$/.test(sym) ? ' O símbolo vem do nome em latim.' : ''}`, hint: 'Muitos símbolos vêm do nome em latim (Na = natrium, Fe = ferrum, Au = aurum).' };
      }; })()),
      fam(Q, ['Tabela periódica', 'Distribuição eletrônica e família'], 'medio', 3, 36, (() => { let k = 0; return r => {
        const els = EL.filter(e => e[2] <= 20 && e[2] > 2), [sym, nome, Z] = els[k % els.length], v = Math.floor(k++ / els.length) % 2;
        const cs = camadas(Z), val = cs[cs.length - 1];
        const fam = { 1: 'metais alcalinos (família 1)', 2: 'metais alcalinoterrosos (família 2)', 3: 'família do boro (13)', 4: 'família do carbono (14)', 5: 'família do nitrogênio (15)', 6: 'calcogênios (16)', 7: 'halogênios (17)', 8: 'gases nobres (18)' }[Z === 1 ? 1 : Z === 2 ? 8 : val];
        const fams = ['metais alcalinos (família 1)', 'metais alcalinoterrosos (família 2)', 'família do boro (13)', 'família do carbono (14)', 'família do nitrogênio (15)', 'calcogênios (16)', 'halogênios (17)', 'gases nobres (18)'];
        const o = v ? opcoes(r, String(val), ['1', '2', '3', '4', '5', '6', '7', '8'].filter(x => x !== String(val))) : opcoes(r, fam, r.shuffle(fams.filter(f => f !== fam)));
        return o && { ...o, statement: v ? `O ${nome} (Z = ${Z}) tem quantos elétrons na camada de valência?` : `Pela distribuição eletrônica, o ${nome} (${sym}, Z = ${Z}) pertence a qual grupo da tabela periódica?`,
          explanation: `Distribuição por camadas: ${cs.map((c, i) => `${'KLMN'[i]} = ${c}`).join(', ')}. ${Z === 1 ? 'O hidrogênio fica na coluna 1, mas não é metal alcalino.' : Z === 2 ? 'O hélio tem a camada K completa: é gás nobre.' : `Com ${val} elétron(s) de valência: ${fam}.`}`,
          hint: 'Distribua os elétrons nas camadas K, L, M, N; os da última camada definem a família (nos elementos representativos).' };
      }; })())
    ];
  })()
];
