// Famílias de questões de Matemática, Física, Química e Raciocínio lógico.
// Cada família cria várias questões parecidas (mesma ideia, números e contextos diferentes).
import { num, brl, pct, NOMES, CIDADES, opcoes, vizinhos } from './util.mjs';

const M = 'Matemática', F = 'Física', Q = 'Química', R = 'Raciocínio lógico';
const round2 = x => Math.round(x * 100) / 100;

export default [
  // ---------------- MATEMÁTICA ----------------
  {
    subject: M, topic: ['Matemática financeira', 'Porcentagem'], level: 'enem', difficulty: 2, n: 90,
    make(r) {
      const preco = r.int(4, 60) * 10, d = r.pick([5, 10, 12, 15, 20, 25, 30, 35, 40]);
      const item = r.pick(['um tênis', 'uma bicicleta', 'um celular usado', 'uma mochila', 'um fone de ouvido', 'uma cafeteira', 'um ventilador', 'uma cadeira de escritório']);
      const final = round2(preco * (1 - d / 100));
      const o = opcoes(r, brl(final), [brl(preco - d), brl(round2(preco * d / 100)), brl(round2(preco * (1 + d / 100))), brl(round2(preco * (1 - d / 1000))), brl(final + 10)]);
      return o && { ...o,
        statement: `Uma loja de ${r.pick(CIDADES)} anuncia ${item} por ${brl(preco)}. No pagamento à vista, o cliente recebe ${d}% de desconto. Quanto paga quem compra à vista?`,
        explanation: `${d}% de ${brl(preco)} = ${brl(round2(preco * d / 100))}. Preço à vista: ${brl(preco)} − ${brl(round2(preco * d / 100))} = ${brl(final)}. Atalho: multiplicar por ${num(1 - d / 100)}.`,
        hint: `Calcule ${d}% do preço e subtraia, ou multiplique o preço por (1 − ${num(d / 100)}).` };
    }
  },
  {
    subject: M, topic: ['Matemática financeira', 'Porcentagem'], level: 'enem', difficulty: 3, n: 70,
    make(r) {
      const a = r.pick([10, 20, 25, 30, 40, 50]), b = r.pick([10, 20, 25, 30, 40, 50]);
      const fator = (1 + a / 100) * (1 - b / 100), varia = round2((fator - 1) * 100);
      const prod = r.pick(['o preço da gasolina', 'a conta de luz', 'o valor de um produto', 'o preço do quilo do feijão', 'a mensalidade de um curso']);
      const fmt = v => v === 0 ? 'Não houve variação.' : v > 0 ? `Aumento de ${pct(Math.abs(v))}` : `Redução de ${pct(Math.abs(v))}`;
      const o = opcoes(r, fmt(varia), [fmt(a - b), fmt(a + b), fmt(-(a + b)), fmt(round2(varia + 5)), fmt(round2(varia - 5)), fmt(round2(-varia))]);
      return o && { ...o,
        statement: `Em um mês, ${prod} subiu ${a}%. No mês seguinte, caiu ${b}% sobre o novo valor. Em relação ao valor inicial, a variação acumulada foi de:`,
        explanation: `Os fatores se multiplicam: ${num(1 + a / 100)} × ${num(1 - b / 100)} = ${num(round2(fator * 10000) / 10000)}. ${varia === 0 ? 'O valor final é igual ao inicial.' : `Isso corresponde a ${varia > 0 ? 'aumento' : 'redução'} de ${pct(Math.abs(varia))}.`} Somar ou subtrair as porcentagens direto é o erro mais comum.`,
        hint: 'Porcentagens sucessivas não se somam: transforme cada uma num fator e multiplique.' };
    }
  },
  {
    subject: M, topic: ['Matemática financeira', 'Juros simples'], level: 'medio', difficulty: 2, n: 70,
    make(r) {
      const C = r.int(5, 50) * 100, i = r.pick([1, 1.5, 2, 2.5, 3, 4, 5]), t = r.int(2, 12);
      const J = round2(C * i / 100 * t);
      const o = opcoes(r, brl(J), [brl(round2(C * i / 100)), brl(round2(C + J)), brl(round2(C * (Math.pow(1 + i / 100, t) - 1))), brl(round2(J * 2)), brl(round2(C * i * t / 10))]);
      return o && { ...o,
        statement: `${r.pick(NOMES)} aplicou ${brl(C)} a juros simples de ${num(i)}% ao mês, durante ${t} meses. Qual foi o valor dos juros recebidos no período?`,
        explanation: `Juros simples: J = C × i × t = ${brl(C)} × ${num(i / 100)} × ${t} = ${brl(J)}. O montante seria ${brl(C + J)}, mas a pergunta pede só os juros.`,
        hint: 'J = C · i · t, com a taxa em forma decimal.' };
    }
  },
  {
    subject: M, topic: ['Matemática financeira', 'Juros compostos'], level: 'enem', difficulty: 3, n: 60,
    make(r) {
      const C = r.int(2, 40) * 500, i = r.pick([10, 20, 5, 2]), t = r.pick([2, 2, 3]);
      const Mx = round2(C * Math.pow(1 + i / 100, t));
      const o = opcoes(r, brl(Mx), [brl(round2(C * (1 + i / 100 * t))), brl(round2(Mx - C)), brl(round2(C * (1 + i / 100) * t)), brl(round2(Mx + C * i / 100)), brl(round2(C * Math.pow(1 + i / 100, t + 1)))]);
      return o && { ...o,
        statement: `Um capital de ${brl(C)} foi investido a juros compostos de ${i}% ao mês. Qual será o montante após ${t} meses?`,
        explanation: `Juros compostos: M = C × (1 + i)^t = ${brl(C)} × ${num(1 + i / 100)}^${t} = ${brl(Mx)}. Com juros simples daria ${brl(round2(C * (1 + i / 100 * t)))}, um pouco menos.`,
        hint: 'Em juros compostos, multiplique o capital por (1 + i) uma vez para cada mês.' };
    }
  },
  {
    subject: M, topic: ['Álgebra', 'Equações do 1º grau'], level: 'fundamental', difficulty: 2, n: 80,
    make(r) {
      const fixo = r.int(3, 12) * 5, porKm = r.pick([2, 2.5, 3, 3.5, 4]), km = r.int(4, 30);
      const total = round2(fixo + porKm * km);
      const o = opcoes(r, num(km), vizinhos(r, km, num, [Math.round(total / porKm), km + 2, km - 2]));
      return o && { ...o,
        statement: `Uma corrida de aplicativo em ${r.pick(CIDADES)} custa ${brl(fixo)} fixos mais ${brl(porKm)} por quilômetro rodado. Se uma corrida custou ${brl(total)}, quantos quilômetros foram percorridos?`,
        explanation: `${brl(fixo)} + ${brl(porKm)} · x = ${brl(total)} ⇒ ${brl(porKm)} · x = ${brl(round2(total - fixo))} ⇒ x = ${num(km)} km.`,
        hint: 'Tire primeiro a parte fixa e depois divida pelo preço de cada quilômetro.' };
    }
  },
  {
    subject: M, topic: ['Álgebra', 'Equações do 1º grau'], level: 'fundamental', difficulty: 1, n: 60,
    make(r) {
      const a = r.int(2, 9), x = r.int(-8, 15), b = r.int(-20, 30), c = a * x + b;
      const eq = `${a}x ${b >= 0 ? '+ ' + b : '− ' + Math.abs(b)} = ${c < 0 ? '−' + Math.abs(c) : c}`;
      const o = opcoes(r, num(x), [num(x + 1), num(x - 1), num(-x || 1), num(Math.round((c + b) / a)), num(c - b), num(x + 2)]);
      return o && { ...o, statement: `Qual é o valor de x na equação ${eq}?`,
        explanation: `${a}x = ${c} ${b >= 0 ? '− ' + b : '+ ' + Math.abs(b)} = ${c - b}. Então x = ${c - b} ÷ ${a} = ${num(x)}.`,
        hint: 'Isole o termo com x passando o número para o outro lado com sinal trocado.' };
    }
  },
  {
    subject: M, topic: ['Geometria', 'Áreas'], level: 'enem', difficulty: 2, n: 70,
    make(r) {
      const a = r.int(6, 30), b = r.int(5, 25), preco = r.pick([8, 12, 15, 20, 25, 35, 40]);
      const area = a * b, custo = area * preco;
      const uso = r.pick(['grama', 'piso cerâmico', 'porcelanato', 'piso vinílico', 'carpete']);
      const o = opcoes(r, brl(custo), [brl(2 * (a + b) * preco), brl(area), brl(custo / 2), brl(custo * 2), brl((a + b) * preco)]);
      return o && { ...o,
        statement: `Um terreno retangular mede ${a} m por ${b} m. O proprietário quer cobri-lo totalmente com ${uso}, que custa ${brl(preco)} o metro quadrado. Qual será o gasto com o material?`,
        explanation: `Área = ${a} × ${b} = ${area} m². Custo = ${area} × ${brl(preco)} = ${brl(custo)}. Usar o perímetro (${2 * (a + b)} m) é o erro comum.`,
        hint: 'Para cobrir uma superfície, o que importa é a área, não o perímetro.' };
    }
  },
  {
    subject: M, topic: ['Geometria', 'Teorema de Pitágoras'], level: 'medio', difficulty: 2, n: 60,
    make(r) {
      const [p, q, h] = r.pick([[3, 4, 5], [5, 12, 13], [8, 15, 17], [7, 24, 25], [6, 8, 10], [9, 12, 15], [20, 21, 29]]);
      const k = r.pick([1, 1, 2, 3]);
      const ctx = r.pick([
        [`Uma escada está apoiada num muro. O pé da escada fica a ${p * k} m do muro e o topo toca o muro a ${q * k} m do chão.`, 'Qual é o comprimento da escada?'],
        [`Um terreno retangular tem lados de ${p * k} m e ${q * k} m. Uma cerca será feita ligando dois cantos opostos.`, 'Qual o comprimento dessa cerca diagonal?'],
        [`Uma rampa sobe ${p * k} m de altura e avança ${q * k} m na horizontal.`, 'Qual é o comprimento da rampa?']
      ]);
      const o = opcoes(r, `${h * k} m`, [`${(p + q) * k} m`, `${(h + 1) * k} m`, `${(q + 1) * k} m`, `${(h - 1) * k} m`, `${Math.round(Math.sqrt(p * p + q) * k)} m`]);
      return o && { ...o, statement: `${ctx[0]} ${ctx[1]}`,
        explanation: `Pelo teorema de Pitágoras: x² = ${p * k}² + ${q * k}² = ${(p * k) ** 2} + ${(q * k) ** 2} = ${(h * k) ** 2}, logo x = ${h * k} m.`,
        hint: 'Forma-se um triângulo retângulo: a hipotenusa ao quadrado é a soma dos quadrados dos catetos.' };
    }
  },
  {
    subject: M, topic: ['Geometria', 'Volumes'], level: 'enem', difficulty: 3, n: 60,
    make(r) {
      const c = r.int(2, 8) / 2, l = r.int(2, 6) / 2, h = r.int(2, 4) / 2;
      const vol = round2(c * l * h), litros = Math.round(vol * 1000);
      const o = opcoes(r, `${num(litros)} litros`, [`${num(Math.round(litros / 10))} litros`, `${num(litros * 10)} litros`, `${num(round2(vol))} litros`, `${num(Math.round(2 * (c * l + c * h + l * h) * 1000))} litros`, `${num(Math.round(litros / 2))} litros`]);
      return o && { ...o,
        statement: `Uma caixa-d'água em forma de bloco retangular mede, por dentro, ${num(c)} m de comprimento, ${num(l)} m de largura e ${num(h)} m de altura. Sabendo que 1 m³ corresponde a 1.000 litros, qual é a capacidade da caixa?`,
        explanation: `V = ${num(c)} × ${num(l)} × ${num(h)} = ${num(vol)} m³ = ${num(litros)} litros.`,
        hint: 'Multiplique as três medidas e converta m³ para litros (× 1.000).' };
    }
  },
  {
    subject: M, topic: ['Estatística', 'Média, moda e mediana'], level: 'enem', difficulty: 2, n: 80,
    make(r) {
      const n = r.pick([5, 6, 7]); const vals = Array.from({ length: n }, () => r.int(2, 10));
      const tipo = r.pick(['média', 'mediana']);
      const sorted = [...vals].sort((a, b) => a - b);
      const media = round2(vals.reduce((s, v) => s + v, 0) / n);
      const mediana = n % 2 ? sorted[(n - 1) / 2] : round2((sorted[n / 2 - 1] + sorted[n / 2]) / 2);
      const certo = tipo === 'média' ? media : mediana, outro = tipo === 'média' ? mediana : media;
      const o = opcoes(r, num(certo), vizinhos(r, certo, num, [outro, vals[Math.floor(n / 2)], sorted[n - 1] - sorted[0]]));
      return o && { ...o,
        statement: `As notas de ${r.pick(NOMES)} em ${n} simulados foram: ${vals.join('; ')}. Qual é a ${tipo} dessas notas?`,
        explanation: tipo === 'média'
          ? `Média = soma ÷ quantidade = ${vals.reduce((s, v) => s + v, 0)} ÷ ${n} = ${num(media)}.`
          : `Em ordem: ${sorted.join('; ')}. ${n % 2 ? `O termo do meio é ${num(mediana)}.` : `Média dos dois termos centrais: (${sorted[n / 2 - 1]} + ${sorted[n / 2]}) ÷ 2 = ${num(mediana)}.`}`,
        hint: tipo === 'média' ? 'Some todas as notas e divida pela quantidade.' : 'Coloque os valores em ordem antes de procurar o termo central.' };
    }
  },
  {
    subject: M, topic: ['Probabilidade', 'Probabilidade simples'], level: 'enem', difficulty: 2, n: 80,
    make(r) {
      const a = r.int(2, 12), b = r.int(2, 12), c = r.int(1, 8), tot = a + b + c;
      const cores = r.shuffle(['azuis', 'vermelhas', 'verdes', 'amarelas', 'brancas', 'pretas']).slice(0, 3);
      const g = (x, y) => { while (y) [x, y] = [y, x % y]; return x; };
      const fr = (p, q) => { const d = g(p, q); return `${p / d}/${q / d}`; };
      const o = opcoes(r, fr(a, tot), [fr(b, tot), fr(c, tot), fr(a, b + c), fr(a + b, tot), `1/${tot}`, fr(b + c, tot)]);
      return o && { ...o,
        statement: `Uma urna contém ${a} bolas ${cores[0]}, ${b} bolas ${cores[1]} e ${c} bolas ${cores[2]}, todas iguais ao toque. Retirando-se uma bola ao acaso, qual a probabilidade de ela ser ${cores[0].replace(/s$/, '')}?`,
        explanation: `Casos favoráveis: ${a}. Casos possíveis: ${a} + ${b} + ${c} = ${tot}. P = ${a}/${tot} = ${fr(a, tot)}.`,
        hint: 'Probabilidade = casos favoráveis ÷ total de casos.' };
    }
  },
  {
    subject: M, topic: ['Aritmética', 'Regra de três'], level: 'fundamental', difficulty: 3, n: 70,
    make(r) {
      const p1 = r.pick([2, 3, 4, 5, 6, 8]), d1 = r.pick([6, 8, 10, 12, 15, 18, 20, 24, 30]);
      const p2 = r.pick([2, 3, 4, 5, 6, 8, 10, 12].filter(x => x !== p1 && (p1 * d1) % x === 0));
      if (!p2) return null;
      const d2 = p1 * d1 / p2;
      const obra = r.pick(['pintar uma escola', 'construir um muro', 'colher uma plantação', 'montar um palco', 'reformar uma praça']);
      const o = opcoes(r, `${d2} dias`, [`${Math.round(d1 * p2 / p1)} dias`, `${d1} dias`, `${d2 + 2} dias`, `${Math.max(1, d2 - 2)} dias`, `${d1 + p2 - p1} dias`]);
      return o && { ...o,
        statement: `${p1} trabalhadores, com o mesmo ritmo, levam ${d1} dias para ${obra}. Quantos dias ${p2} trabalhadores, no mesmo ritmo, levariam para fazer o mesmo serviço?`,
        explanation: `Mais trabalhadores, menos dias: as grandezas são inversamente proporcionais. ${p1} × ${d1} = ${p2} × x ⇒ x = ${p1 * d1} ÷ ${p2} = ${d2} dias.`,
        hint: 'Pergunte-se: se aumentar o número de pessoas, o tempo aumenta ou diminui?' };
    }
  },
  {
    subject: M, topic: ['Sequências', 'Progressão aritmética'], level: 'medio', difficulty: 2, n: 60,
    make(r) {
      const a1 = r.int(1, 30), d = r.int(2, 9), n = r.int(10, 40), an = a1 + (n - 1) * d;
      const o = opcoes(r, num(an), [num(a1 + n * d), num(a1 + (n - 2) * d), num(n * d), num(an + d * 2), num(a1 * n)]);
      return o && { ...o,
        statement: `Uma academia tem ${a1} alunos na primeira semana e, a cada semana, entram ${d} novos alunos, sem desistências. Quantos alunos ela terá na ${n}ª semana?`,
        explanation: `É uma PA com a₁ = ${a1} e razão ${d}: aₙ = a₁ + (n − 1)·r = ${a1} + ${n - 1}·${d} = ${num(an)}.`,
        hint: 'Na PA, do 1º ao n-ésimo termo somamos a razão (n − 1) vezes.' };
    }
  },
  {
    subject: M, topic: ['Análise combinatória', 'Princípio multiplicativo'], level: 'enem', difficulty: 3, n: 60,
    make(r) {
      const a = r.int(2, 6), b = r.int(2, 6), c = r.int(2, 5);
      const ctx = r.pick([
        [`Uma lanchonete monta combos com 1 sanduíche, 1 bebida e 1 sobremesa. Há ${a} sanduíches, ${b} bebidas e ${c} sobremesas.`, 'Quantos combos diferentes podem ser montados?'],
        [`Para ir de casa à escola, ${r.pick(NOMES)} pode escolher entre ${a} linhas de ônibus até o centro, ${b} até o bairro da escola e ${c} caminhos a pé no final.`, 'De quantas maneiras ela pode fazer o trajeto?'],
        [`Um uniforme é formado por camiseta, calça e tênis. Há ${a} modelos de camiseta, ${b} de calça e ${c} de tênis.`, 'Quantos uniformes diferentes existem?']
      ]);
      const t = a * b * c;
      const o = opcoes(r, num(t), [num(a + b + c), num(a * b + c), num(a * b), num(t * 2), num(a + b * c)]);
      return o && { ...o, statement: `${ctx[0]} ${ctx[1]}`,
        explanation: `Pelo princípio multiplicativo: ${a} × ${b} × ${c} = ${t}.`,
        hint: 'Quando as escolhas são feitas em etapas independentes, multiplique as possibilidades de cada etapa.' };
    }
  },
  {
    subject: M, topic: ['Aritmética', 'Frações'], level: 'fundamental', difficulty: 2, n: 50,
    make(r) {
      const den = r.pick([3, 4, 5, 6, 8, 10]), numr = r.int(1, den - 1), total = den * r.int(3, 20);
      const parte = total / den * numr;
      const o = opcoes(r, num(parte), [num(total - parte), num(total / den), num(parte + total / den), num(numr * den), num(Math.round(total / numr))]);
      return o && { ...o,
        statement: `Numa turma de ${total} estudantes, ${numr}/${den} pretendem fazer o ENEM neste ano. Quantos estudantes pretendem fazer a prova?`,
        explanation: `${total} ÷ ${den} = ${total / den}; ${total / den} × ${numr} = ${parte}.`,
        hint: 'Divida pelo denominador e multiplique pelo numerador.' };
    }
  },
  {
    subject: M, topic: ['Funções', 'Função afim'], level: 'medio', difficulty: 3, n: 50,
    make(r) {
      const base = r.int(10, 30) * 50, com = r.pick([2, 3, 4, 5, 8, 10]), vendas = r.int(5, 40) * 500;
      const sal = base + vendas * com / 100;
      const o = opcoes(r, brl(sal), [brl(base + vendas * com / 10), brl(vendas * com / 100), brl(base * (1 + com / 100)), brl(base + vendas), brl(sal + base / 2)]);
      return o && { ...o,
        statement: `O salário mensal de um vendedor é dado por S(x) = ${num(base)} + ${num(com / 100)}x, em reais, em que x é o total vendido no mês. Em um mês em que ele vendeu ${brl(vendas)}, qual foi seu salário?`,
        explanation: `S = ${num(base)} + ${num(com / 100)} × ${num(vendas)} = ${num(base)} + ${num(vendas * com / 100)} = ${brl(sal)}.`,
        hint: 'Substitua x pelo valor vendido.' };
    }
  },
  {
    subject: M, topic: ['Grandezas e medidas', 'Escala'], level: 'enem', difficulty: 2, n: 60,
    make(r) {
      const esc = r.pick([1000, 5000, 10000, 20000, 50000, 100000, 250000, 500000]), cm = r.int(2, 18);
      const km = cm * esc / 100000;
      const fmt = v => v >= 1 ? `${num(v)} km` : `${num(v * 1000)} m`;
      const o = opcoes(r, fmt(km), [fmt(km * 10), fmt(km / 10), fmt(cm * esc / 1000), fmt(km * 100), fmt(km + 1)]);
      return o && { ...o,
        statement: `Em um mapa na escala 1 : ${num(esc)}, a distância entre duas escolas é de ${cm} cm. Qual é a distância real entre elas?`,
        explanation: `${cm} cm × ${num(esc)} = ${num(cm * esc)} cm = ${fmt(km)} (1 km = 100.000 cm).`,
        hint: 'Multiplique a medida do mapa pelo denominador da escala e converta a unidade.' };
    }
  },

  // ---------------- FÍSICA ----------------
  {
    subject: F, topic: ['Cinemática', 'Velocidade média'], level: 'medio', difficulty: 1, n: 70,
    make(r) {
      const t = r.pick([0.5, 1, 1.5, 2, 2.5, 3, 4, 5]), v = r.pick([40, 50, 60, 72, 80, 90, 100, 110]);
      const d = t * v;
      const o = opcoes(r, `${num(v)} km/h`, [`${num(d * t)} km/h`, `${num(round2(t / d * 100))} km/h`, `${num(v + 10)} km/h`, `${num(v / 3.6, 1)} km/h`, `${num(v - 10)} km/h`]);
      return o && { ...o,
        statement: `Um ônibus sai de ${r.pick(CIDADES)} e percorre ${num(d)} km em ${num(t)} h, sem paradas. Qual foi sua velocidade média?`,
        explanation: `vₘ = Δs ÷ Δt = ${num(d)} km ÷ ${num(t)} h = ${num(v)} km/h.`,
        hint: 'Velocidade média é distância dividida pelo tempo.' };
    }
  },
  {
    subject: F, topic: ['Cinemática', 'Conversão de unidades'], level: 'medio', difficulty: 2, n: 40,
    make(r) {
      const v = r.pick([18, 36, 54, 72, 90, 108, 126, 144]);
      const o = opcoes(r, `${num(v / 3.6)} m/s`, [`${num(v * 3.6)} m/s`, `${num(v / 3.6 * 2)} m/s`, `${num(v / 10)} m/s`, `${num(v / 3.6 + 5)} m/s`, `${num(v)} m/s`]);
      return o && { ...o, statement: `Um carro trafega a ${v} km/h numa avenida. Qual é essa velocidade em metros por segundo?`,
        explanation: `Para passar de km/h para m/s, divida por 3,6: ${v} ÷ 3,6 = ${num(v / 3.6)} m/s.`, hint: '1 km/h = 1.000 m ÷ 3.600 s.' };
    }
  },
  {
    subject: F, topic: ['Dinâmica', 'Leis de Newton'], level: 'medio', difficulty: 2, n: 60,
    make(r) {
      const m = r.pick([2, 4, 5, 8, 10, 20, 50, 100, 800, 1000]), a = r.pick([0.5, 1, 1.5, 2, 3, 4, 5]);
      const Fx = m * a;
      const o = opcoes(r, `${num(Fx)} N`, [`${num(m / a)} N`, `${num(m + a)} N`, `${num(Fx * 10)} N`, `${num(a / m, 2)} N`, `${num(Fx / 2)} N`]);
      return o && { ...o, statement: `Um corpo de massa ${num(m)} kg recebe uma força resultante que lhe dá aceleração de ${num(a)} m/s². Pela segunda lei de Newton, qual é a intensidade dessa força?`,
        explanation: `F = m · a = ${num(m)} × ${num(a)} = ${num(Fx)} N.`, hint: 'Segunda lei: força resultante = massa × aceleração.' };
    }
  },
  {
    subject: F, topic: ['Energia', 'Energia cinética e potencial'], level: 'enem', difficulty: 3, n: 60,
    make(r) {
      const m = r.pick([1, 2, 4, 5, 10, 50, 60, 70, 80]), tipo = r.pick(['cin', 'pot']);
      if (tipo === 'cin') {
        const v = r.pick([2, 4, 5, 6, 10, 20]); const E = m * v * v / 2;
        const o = opcoes(r, `${num(E)} J`, [`${num(m * v)} J`, `${num(m * v * v)} J`, `${num(m * v / 2)} J`, `${num(E * 2)} J`, `${num(E / 4)} J`]);
        return o && { ...o, statement: `Um corpo de ${m} kg se move a ${v} m/s. Qual é sua energia cinética?`,
          explanation: `Ec = m·v²/2 = ${m} × ${v}² ÷ 2 = ${num(E)} J.`, hint: 'Ec = m · v² ÷ 2. Cuidado: a velocidade vai ao quadrado.' };
      }
      const h = r.pick([2, 3, 5, 10, 15, 20, 30]); const E = m * 10 * h;
      const o = opcoes(r, `${num(E)} J`, [`${num(m * h)} J`, `${num(E / 2)} J`, `${num(m * 10)} J`, `${num(E * 2)} J`, `${num(m * h * 100)} J`]);
      return o && { ...o, statement: `Um objeto de ${m} kg é levado a uma altura de ${h} m em relação ao solo. Considerando g = 10 m/s², qual é sua energia potencial gravitacional nessa posição?`,
        explanation: `Ep = m·g·h = ${m} × 10 × ${h} = ${num(E)} J.`, hint: 'Ep = m · g · h.' };
    }
  },
  {
    subject: F, topic: ['Eletricidade', 'Consumo de energia elétrica'], level: 'enem', difficulty: 3, n: 80,
    make(r) {
      const [ap, P] = r.pick([['um chuveiro elétrico', 5500], ['um ferro de passar', 1000], ['um secador de cabelo', 2000], ['um micro-ondas', 1200], ['uma geladeira', 150], ['um computador', 300], ['um ar-condicionado', 1500], ['uma lâmpada de LED', 10]]);
      const h = r.pick([0.5, 1, 2, 3, 4, 5, 8]), dias = 30, tarifa = r.pick([0.6, 0.7, 0.8, 0.9, 1]);
      const kwh = round2(P / 1000 * h * dias), custo = round2(kwh * tarifa);
      const o = opcoes(r, brl(custo), [brl(round2(P * h * dias * tarifa)), brl(round2(kwh)), brl(round2(custo / dias)), brl(round2(custo * 2)), brl(round2(P / 1000 * h * tarifa))]);
      return o && { ...o,
        statement: `Em uma casa, ${ap} de ${num(P)} W fica ligado ${num(h)} h por dia, durante ${dias} dias. Se o kWh custa ${brl(tarifa)}, qual é o custo mensal desse aparelho?`,
        explanation: `Energia = P × t = ${num(P / 1000)} kW × ${num(h * dias)} h = ${num(kwh)} kWh. Custo = ${num(kwh)} × ${brl(tarifa)} = ${brl(custo)}.`,
        hint: 'Passe a potência para kW e multiplique pelas horas do mês; depois pela tarifa.' };
    }
  },
  {
    subject: F, topic: ['Eletricidade', 'Lei de Ohm'], level: 'medio', difficulty: 2, n: 50,
    make(r) {
      const Rr = r.pick([2, 4, 5, 10, 11, 20, 22, 44, 55, 110]), U = r.pick([12, 110, 127, 220]);
      const I = round2(U / Rr);
      const o = opcoes(r, `${num(I)} A`, [`${num(U * Rr)} A`, `${num(round2(Rr / U))} A`, `${num(round2(I * 2))} A`, `${num(round2(I / 2))} A`, `${num(U + Rr)} A`]);
      return o && { ...o, statement: `Um resistor de ${Rr} Ω é ligado a uma tensão de ${U} V. Qual é a intensidade da corrente elétrica que o atravessa?`,
        explanation: `Lei de Ohm: U = R · i ⇒ i = U ÷ R = ${U} ÷ ${Rr} = ${num(I)} A.`, hint: 'i = U ÷ R.' };
    }
  },
  {
    subject: F, topic: ['Termologia', 'Calorimetria'], level: 'enem', difficulty: 3, n: 50,
    make(r) {
      const m = r.pick([100, 200, 250, 500, 1000, 2000]), dT = r.pick([10, 20, 30, 40, 50, 60, 80]);
      const Qc = m * 1 * dT;
      const o = opcoes(r, `${num(Qc)} cal`, [`${num(m + dT)} cal`, `${num(Qc / 10)} cal`, `${num(Qc * 4)} cal`, `${num(m * dT / 2)} cal`, `${num(Qc + m)} cal`]);
      return o && { ...o, statement: `Para preparar um chá, ${num(m)} g de água são aquecidos e sua temperatura sobe ${dT} °C. Sabendo que o calor específico da água é 1 cal/g·°C, quanto calor a água recebeu?`,
        explanation: `Q = m · c · ΔT = ${num(m)} × 1 × ${dT} = ${num(Qc)} cal.`, hint: 'Use Q = m · c · ΔT.' };
    }
  },
  {
    subject: F, topic: ['Ondulatória', 'Equação fundamental da onda'], level: 'medio', difficulty: 2, n: 40,
    make(r) {
      const lam = r.pick([0.5, 1, 2, 3, 4, 5]), f = r.pick([2, 5, 10, 20, 50, 100]);
      const v = lam * f;
      const o = opcoes(r, `${num(v)} m/s`, [`${num(round2(lam / f))} m/s`, `${num(round2(f / lam))} m/s`, `${num(lam + f)} m/s`, `${num(v * 2)} m/s`, `${num(v / 2)} m/s`]);
      return o && { ...o, statement: `Uma onda tem comprimento de ${num(lam)} m e frequência de ${f} Hz. Qual é a velocidade de propagação dessa onda?`,
        explanation: `v = λ · f = ${num(lam)} × ${f} = ${num(v)} m/s.`, hint: 'v = λ · f.' };
    }
  },
  {
    subject: F, topic: ['Hidrostática', 'Densidade e pressão'], level: 'medio', difficulty: 2, n: 40,
    make(r) {
      const m = r.pick([200, 300, 500, 800, 1000, 1500, 2700]), V = r.pick([100, 200, 250, 500, 1000]);
      const d = round2(m / V);
      const o = opcoes(r, `${num(d)} g/cm³`, [`${num(round2(V / m))} g/cm³`, `${num(m * V)} g/cm³`, `${num(round2(d * 10))} g/cm³`, `${num(round2(d / 2))} g/cm³`, `${num(round2(d + 1))} g/cm³`]);
      return o && { ...o, statement: `Um bloco maciço tem massa de ${num(m)} g e volume de ${num(V)} cm³. Qual é a densidade do material?`,
        explanation: `d = m ÷ V = ${num(m)} ÷ ${num(V)} = ${num(d)} g/cm³. ${d < 1 ? 'Como é menor que 1 g/cm³, ele flutua na água.' : d > 1 ? 'Como é maior que 1 g/cm³, ele afunda na água.' : 'Igual à da água.'}`,
        hint: 'Densidade = massa ÷ volume.' };
    }
  },

  // ---------------- QUÍMICA ----------------
  {
    subject: Q, topic: ['Química geral', 'Massa molar'], level: 'medio', difficulty: 2, n: 50,
    make(r) {
      const [nome, f, mm] = r.pick([['água', 'H₂O', 18], ['gás carbônico', 'CO₂', 44], ['metano', 'CH₄', 16], ['amônia', 'NH₃', 17], ['glicose', 'C₆H₁₂O₆', 180], ['cloreto de sódio', 'NaCl', 58.5], ['ácido sulfúrico', 'H₂SO₄', 98], ['etanol', 'C₂H₆O', 46], ['carbonato de cálcio', 'CaCO₃', 100], ['gás oxigênio', 'O₂', 32]]);
      const mols = r.pick([0.5, 1, 2, 3, 4, 5, 10]);
      const massa = round2(mm * mols);
      const o = opcoes(r, `${num(massa)} g`, [`${num(mm)} g`, `${num(round2(mm / mols))} g`, `${num(round2(massa * 2))} g`, `${num(round2(massa + mm))} g`, `${num(round2(mols * 6))} g`]);
      return o && { ...o, statement: `Quantos gramas correspondem a ${num(mols)} mol de ${nome} (${f})? Dados: H = 1, C = 12, N = 14, O = 16, Na = 23, S = 32, Cl = 35,5, Ca = 40.`,
        explanation: `Massa molar do ${f} = ${num(mm)} g/mol. Massa = n × M = ${num(mols)} × ${num(mm)} = ${num(massa)} g.`, hint: 'Some as massas dos átomos da fórmula e multiplique pelo número de mols.' };
    }
  },
  {
    subject: Q, topic: ['Soluções', 'Concentração comum'], level: 'enem', difficulty: 2, n: 60,
    make(r) {
      const m = r.pick([2, 5, 10, 20, 30, 40, 50, 60]), V = r.pick([0.25, 0.5, 1, 2, 4, 5]);
      const C = round2(m / V);
      const sol = r.pick(['soro caseiro', 'uma solução de açúcar', 'uma salmoura', 'um suco concentrado', 'uma solução de limpeza']);
      const o = opcoes(r, `${num(C)} g/L`, [`${num(round2(m * V))} g/L`, `${num(round2(V / m))} g/L`, `${num(round2(C / 1000))} g/L`, `${num(round2(C * 2))} g/L`, `${num(m)} g/L`]);
      return o && { ...o, statement: `Para preparar ${sol}, dissolvem-se ${m} g de soluto em água até completar ${num(V)} L de solução. Qual a concentração comum obtida?`,
        explanation: `C = m ÷ V = ${m} g ÷ ${num(V)} L = ${num(C)} g/L.`, hint: 'Concentração comum = massa do soluto ÷ volume da solução em litros.' };
    }
  },
  {
    subject: Q, topic: ['Soluções', 'Diluição'], level: 'enem', difficulty: 3, n: 50,
    make(r) {
      const C1 = r.pick([20, 40, 50, 60, 80, 100, 120]), V1 = r.pick([100, 200, 250, 500]), k = r.pick([2, 4, 5, 10]);
      const V2 = V1 * k, C2 = round2(C1 / k);
      const o = opcoes(r, `${num(C2)} g/L`, [`${num(C1 * k)} g/L`, `${num(C1)} g/L`, `${num(round2(C1 / k / 2))} g/L`, `${num(round2(C2 + 5))} g/L`, `${num(round2(C1 - k))} g/L`]);
      return o && { ...o, statement: `${V1} mL de uma solução de concentração ${C1} g/L são diluídos com água até ${num(V2)} mL. Qual a nova concentração?`,
        explanation: `Na diluição a massa de soluto não muda: C₁·V₁ = C₂·V₂ ⇒ ${C1} × ${V1} = C₂ × ${num(V2)} ⇒ C₂ = ${num(C2)} g/L.`, hint: 'Use C₁ · V₁ = C₂ · V₂.' };
    }
  },
  {
    subject: Q, topic: ['Físico-química', 'pH e acidez'], level: 'enem', difficulty: 3, n: 40,
    make(r) {
      const p = r.int(1, 13), prod = p < 7 ? 'ácida' : p > 7 ? 'básica' : 'neutra';
      const o = opcoes(r, `pH = ${p}, solução ${prod}`, [`pH = ${14 - p || 7}, solução ${14 - p < 7 ? 'ácida' : 14 - p > 7 ? 'básica' : 'neutra'}`, `pH = ${p}, solução ${prod === 'ácida' ? 'básica' : 'ácida'}`, `pH = −${p}, solução ${prod}`, `pH = ${p + 1}, solução ${prod}`, `pH = 10${p}, solução neutra`]);
      return o && { ...o, statement: `A 25 °C, uma solução aquosa tem concentração de íons H⁺ igual a 10⁻${p} mol/L. Qual é o pH e o caráter dessa solução?`,
        explanation: `pH = −log[H⁺] = −log(10⁻${p}) = ${p}. A 25 °C, pH menor que 7 é ácido, igual a 7 é neutro e maior que 7 é básico: a solução é ${prod}.`,
        hint: 'O pH é o expoente da concentração de H⁺ com o sinal trocado.' };
    }
  },
  {
    subject: Q, topic: ['Radioatividade', 'Meia-vida'], level: 'enem', difficulty: 3, n: 40,
    make(r) {
      const m0 = r.pick([80, 100, 160, 200, 320, 400, 640]), T = r.pick([5, 8, 10, 20, 30]), n = r.int(1, 4);
      const mf = m0 / 2 ** n;
      const o = opcoes(r, `${num(mf)} g`, [`${num(m0 - n * m0 / 4)} g`, `${num(m0 / (2 * n))} g`, `${num(mf * 2)} g`, `${num(mf / 2)} g`, `${num(m0 / n)} g`]);
      return o && { ...o, statement: `Um isótopo radioativo usado em medicina tem meia-vida de ${T} dias. Partindo de ${m0} g, qual massa ainda restará após ${n * T} dias?`,
        explanation: `${n * T} dias = ${n} meias-vidas. A cada meia-vida a massa cai pela metade: ${m0} ÷ 2^${n} = ${num(mf)} g.`, hint: 'Conte quantas meias-vidas se passaram e divida por 2 essa quantidade de vezes.' };
    }
  },
  {
    subject: Q, topic: ['Estequiometria', 'Proporção em massa'], level: 'enem', difficulty: 4, n: 40,
    make(r) {
      const [reac, a, b, mA, mB] = r.pick([
        ['C + O₂ → CO₂ (carbono e gás carbônico)', 'carbono', 'gás carbônico', 12, 44],
        ['CH₄ + 2 O₂ → CO₂ + 2 H₂O (metano e gás carbônico)', 'metano', 'gás carbônico', 16, 44],
        ['2 H₂ + O₂ → 2 H₂O (hidrogênio e água)', 'hidrogênio', 'água', 4, 36],
        ['CaCO₃ → CaO + CO₂ (calcário e cal virgem)', 'calcário (CaCO₃)', 'cal virgem (CaO)', 100, 56]
      ]);
      const k = r.pick([2, 3, 5, 10, 0.5, 25]);
      const res = round2(mB * k);
      const o = opcoes(r, `${num(res)} g`, [`${num(round2(mA * k))} g`, `${num(round2(mA / mB * k))} g`, `${num(round2(res / 2))} g`, `${num(round2(res * 2))} g`, `${num(round2(mB + mA * k))} g`]);
      return o && { ...o, statement: `Na reação ${reac}, ${num(mA)} g de ${a} produzem ${num(mB)} g de ${b}. Quantos gramas de ${b} se formam a partir de ${num(round2(mA * k))} g de ${a}?`,
        explanation: `A proporção em massa é constante: ${num(mA)} g → ${num(mB)} g. Multiplicando por ${num(k)}: ${num(round2(mA * k))} g → ${num(res)} g.`, hint: 'Monte uma regra de três com a proporção dada.' };
    }
  },

  // ---------------- RACIOCÍNIO LÓGICO ----------------
  {
    subject: R, topic: ['Sequências', 'Sequências numéricas'], level: 'concurso', difficulty: 2, n: 60,
    make(r) {
      const tipo = r.pick(['pa', 'pg', 'alt']);
      let seq, prox, regra;
      if (tipo === 'pa') { const a = r.int(1, 20), d = r.int(2, 11); seq = [0, 1, 2, 3, 4].map(i => a + i * d); prox = a + 5 * d; regra = `soma-se ${d} a cada termo`; }
      else if (tipo === 'pg') { const a = r.int(1, 5), q = r.pick([2, 3]); seq = [0, 1, 2, 3, 4].map(i => a * q ** i); prox = a * q ** 5; regra = `multiplica-se por ${q} a cada termo`; }
      else { const a = r.int(1, 10), x = r.int(2, 5), y = r.int(1, 4); seq = [a]; for (let i = 1; i < 5; i++) seq.push(i % 2 ? seq[i - 1] + x : seq[i - 1] - y); prox = seq[4] + x; regra = `alterna-se +${x} e −${y}`; }
      const o = opcoes(r, num(prox), vizinhos(r, prox, num, [prox + 1, prox - 2, seq[4] * 2]));
      return o && { ...o, statement: `Qual é o próximo termo da sequência ${seq.join(', ')}, …?`, explanation: `Na sequência, ${regra}. O próximo termo é ${num(prox)}.`, hint: 'Observe a diferença (ou a razão) entre termos vizinhos.' };
    }
  },
  {
    subject: R, topic: ['Lógica proposicional', 'Negação'], level: 'concurso', difficulty: 3, n: 50,
    make(r) {
      const p = r.pick(['João estuda', 'Maria vai à praia', 'o ônibus atrasou', 'choveu ontem', 'Pedro passou no ENEM', 'a loja abriu', 'Ana fez a redação']);
      const q = r.pick(['ele é aprovado', 'ela leva protetor solar', 'cheguei tarde', 'o jogo foi adiado', 'ele comemorou', 'houve fila', 'ela revisou o texto']);
      const neg = s => s.replace(/^(o |a )?/, m => m).replace(/(\w+)( |$)/, (w) => w) ;
      void neg;
      const tipo = r.pick(['se', 'e', 'ou']);
      const naoP = `não é verdade que ${p}`;
      let enun, certo, ds, exp;
      if (tipo === 'se') { enun = `Se ${p}, então ${q}`; certo = `${p[0].toUpperCase() + p.slice(1)} e não é verdade que ${q}.`; ds = [`Se ${q}, então ${p}.`, `Se não é verdade que ${p}, então não é verdade que ${q}.`, `Não é verdade que ${p} ou ${q}.`, `${naoP[0].toUpperCase() + naoP.slice(1)} e ${q}.`]; exp = 'A negação de "se p, então q" é "p e não q".'; }
      else if (tipo === 'e') { enun = `${p[0].toUpperCase() + p.slice(1)} e ${q}`; certo = `Não é verdade que ${p} ou não é verdade que ${q}.`; ds = [`Não é verdade que ${p} e não é verdade que ${q}.`, `Se ${p}, então ${q}.`, `${p[0].toUpperCase() + p.slice(1)} ou ${q}.`, `${naoP[0].toUpperCase() + naoP.slice(1)} e ${q}.`]; exp = 'Pela lei de De Morgan, ~(p ∧ q) ≡ ~p ∨ ~q.'; }
      else { enun = `${p[0].toUpperCase() + p.slice(1)} ou ${q}`; certo = `Não é verdade que ${p} e não é verdade que ${q}.`; ds = [`Não é verdade que ${p} ou não é verdade que ${q}.`, `${p[0].toUpperCase() + p.slice(1)} e ${q}.`, `Se ${p}, então não é verdade que ${q}.`, `${naoP[0].toUpperCase() + naoP.slice(1)} ou ${q}.`]; exp = 'Pela lei de De Morgan, ~(p ∨ q) ≡ ~p ∧ ~q.'; }
      const o = opcoes(r, certo, ds);
      return o && { ...o, statement: `Qual é a negação lógica da proposição: "${enun}"?`, explanation: exp, hint: 'Lembre das leis de De Morgan e da negação do condicional.' };
    }
  }
];
