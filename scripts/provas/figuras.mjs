// Figuras SVG das questões autorais (gráficos, triângulos, circuitos). Tudo é desenhado aqui,
// a partir dos números da própria questão: nada é copiado de prova ou livro.
// As figuras têm fundo branco próprio para ficarem legíveis no tema claro e no escuro.
const esc = s => String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
const fmt = n => String(Math.round(n * 100) / 100).replace('.', ',');
const FONT = 'font-family="Arial, Helvetica, sans-serif"';

function base(w, h, corpo) {
  return `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${w} ${h}" width="${w}" height="${h}" role="img"><rect width="${w}" height="${h}" fill="#fff"/>${corpo}</svg>`;
}

/** Eixos com marcas. xs/ys: valores das marcas; rótulos dos eixos. Devolve { svg, X, Y } para desenhar dentro. */
function eixos({ w = 460, h = 300, xmax, ymax, xmin = 0, ymin = 0, xs, ys, xl, yl, grade = true }) {
  const L = 58, R = 20, T = 18, B = 46;
  const X = x => L + (x - xmin) / (xmax - xmin) * (w - L - R);
  const Y = y => h - B - (y - ymin) / (ymax - ymin) * (h - T - B);
  let s = '';
  if (grade) for (const y of ys) s += `<line x1="${X(xmin)}" y1="${Y(y)}" x2="${X(xmax)}" y2="${Y(y)}" stroke="#e5e7eb"/>`;
  s += `<line x1="${X(xmin)}" y1="${Y(Math.max(ymin, 0))}" x2="${X(xmax) + 6}" y2="${Y(Math.max(ymin, 0))}" stroke="#111" stroke-width="1.6"/>`;
  s += `<line x1="${X(Math.max(xmin, 0))}" y1="${Y(ymin)}" x2="${X(Math.max(xmin, 0))}" y2="${Y(ymax) - 6}" stroke="#111" stroke-width="1.6"/>`;
  for (const x of xs) s += `<line x1="${X(x)}" y1="${Y(Math.max(ymin, 0)) - 3}" x2="${X(x)}" y2="${Y(Math.max(ymin, 0)) + 3}" stroke="#111"/><text x="${X(x)}" y="${Y(Math.max(ymin, 0)) + 17}" text-anchor="middle" font-size="12" ${FONT}>${fmt(x)}</text>`;
  for (const y of ys) s += `<line x1="${X(Math.max(xmin, 0)) - 3}" y1="${Y(y)}" x2="${X(Math.max(xmin, 0)) + 3}" y2="${Y(y)}" stroke="#111"/><text x="${X(Math.max(xmin, 0)) - 7}" y="${Y(y) + 4}" text-anchor="end" font-size="12" ${FONT}>${fmt(y)}</text>`;
  s += `<text x="${X(xmax)}" y="${h - 8}" text-anchor="end" font-size="13" font-style="italic" ${FONT}>${esc(xl)}</text>`;
  s += `<text x="12" y="${T + 2}" font-size="13" font-style="italic" ${FONT}>${esc(yl)}</text>`;
  return { s, X, Y, w, h };
}

/** Gráfico de linha (segmentos ligando os pontos). */
export function linha({ pontos, xl, yl, xs, ys, xmax, ymax, ymin = 0, tracejado = true }) {
  const e = eixos({ xmax, ymax, ymin, xs, ys, xl, yl });
  let s = e.s;
  if (tracejado) for (const [x, y] of pontos) if (x > 0 && y !== 0) s += `<line x1="${e.X(x)}" y1="${e.Y(y)}" x2="${e.X(x)}" y2="${e.Y(Math.max(0, ymin))}" stroke="#6b7280" stroke-dasharray="4 4"/><line x1="${e.X(0)}" y1="${e.Y(y)}" x2="${e.X(x)}" y2="${e.Y(y)}" stroke="#6b7280" stroke-dasharray="4 4"/>`;
  s += `<polyline points="${pontos.map(([x, y]) => `${e.X(x)},${e.Y(y)}`).join(' ')}" fill="none" stroke="#2340b8" stroke-width="3"/>`;
  for (const [x, y] of pontos) s += `<circle cx="${e.X(x)}" cy="${e.Y(y)}" r="3.5" fill="#2340b8"/>`;
  return base(e.w, e.h, s);
}

/** Gráfico de barras verticais com o valor escrito em cima de cada barra (ou sem, se mostrarValor = false). */
export function barras({ dados, yl, titulo, ymax, ys, mostrarValor = true }) {
  const w = Math.max(420, 80 + dados.length * 70), h = 300, L = 58, R = 16, T = titulo ? 38 : 18, B = 52;
  const Y = y => h - B - y / ymax * (h - T - B);
  const bw = (w - L - R) / dados.length;
  let s = titulo ? `<text x="${w / 2}" y="22" text-anchor="middle" font-size="14" font-weight="bold" ${FONT}>${esc(titulo)}</text>` : '';
  for (const y of ys) s += `<line x1="${L}" y1="${Y(y)}" x2="${w - R}" y2="${Y(y)}" stroke="#e5e7eb"/><text x="${L - 7}" y="${Y(y) + 4}" text-anchor="end" font-size="12" ${FONT}>${fmt(y)}</text>`;
  dados.forEach(([rot, v], i) => {
    const x = L + i * bw + bw * 0.18, bwi = bw * 0.64;
    s += `<rect x="${x}" y="${Y(v)}" width="${bwi}" height="${Y(0) - Y(v)}" fill="${['#2340b8', '#0e7c86', '#b7791f', '#7b3fb8', '#c2362f', '#1f8a4c', '#334155', '#d9480f'][i % 8]}"/>`;
    if (mostrarValor) s += `<text x="${x + bwi / 2}" y="${Y(v) - 5}" text-anchor="middle" font-size="12" font-weight="bold" ${FONT}>${fmt(v)}</text>`;
    s += `<text x="${x + bwi / 2}" y="${h - B + 18}" text-anchor="middle" font-size="12" ${FONT}>${esc(rot)}</text>`;
  });
  s += `<line x1="${L}" y1="${Y(0)}" x2="${w - R}" y2="${Y(0)}" stroke="#111" stroke-width="1.6"/><line x1="${L}" y1="${Y(0)}" x2="${L}" y2="${T - 4}" stroke="#111" stroke-width="1.6"/>`;
  s += `<text x="12" y="${T - 6 > 12 ? T - 6 : 14}" font-size="13" font-style="italic" ${FONT}>${esc(yl)}</text>`;
  return base(w, h, s);
}

/** Triângulo retângulo com rótulos nos lados (null = lado sem rótulo, '?' = lado pedido). */
export function trianguloRetangulo({ a, b, rotA, rotB, rotC, angulo }) {
  const w = 420, h = 280, k = Math.min(300 / a, 190 / b);
  const P0 = [60, 240], P1 = [60 + a * k, 240], P2 = [60, 240 - b * k];
  let s = `<polygon points="${[P0, P1, P2].map(p => p.join(',')).join(' ')}" fill="#eef2ff" stroke="#111" stroke-width="2.2"/>`;
  s += `<polyline points="${P0[0] + 16},${P0[1]} ${P0[0] + 16},${P0[1] - 16} ${P0[0]},${P0[1] - 16}" fill="none" stroke="#111"/>`;
  const t = (x, y, txt, anc = 'middle') => `<text x="${x}" y="${y}" text-anchor="${anc}" font-size="15" font-weight="bold" ${FONT}>${esc(txt)}</text>`;
  if (rotA) s += t((P0[0] + P1[0]) / 2, P0[1] + 24, rotA);
  if (rotB) s += t(P0[0] - 10, (P0[1] + P2[1]) / 2 + 5, rotB, 'end');
  if (rotC) s += t((P1[0] + P2[0]) / 2 + 14, (P1[1] + P2[1]) / 2 - 8, rotC, 'start');
  if (angulo) s += `<path d="M ${P1[0] - 34} ${P1[1]} A 34 34 0 0 0 ${P1[0] - 34 * Math.cos(Math.atan(b / a))} ${P1[1] - 34 * Math.sin(Math.atan(b / a))}" fill="none" stroke="#c2362f" stroke-width="2"/>` + t(P1[0] - 52, P1[1] - 8, angulo);
  return base(w, h, s);
}

/** Circuito em série: gerador ideal e resistores em linha. */
export function circuitoSerie({ U, Rs }) {
  const w = 170 + Rs.length * 110, h = 220, top = 50, bot = 180, left = 100, right = w - 40;
  let s = `<polyline points="${left},${top + 40} ${left},${top} ${right},${top} ${right},${bot} ${left},${bot} ${left},${bot - 40}" fill="none" stroke="#111" stroke-width="2"/>`;
  s += `<line x1="${left - 18}" y1="${top + 58}" x2="${left + 18}" y2="${top + 58}" stroke="#111" stroke-width="3"/><line x1="${left - 10}" y1="${top + 72}" x2="${left + 10}" y2="${top + 72}" stroke="#111" stroke-width="3"/>`;
  s += `<line x1="${left}" y1="${top + 40}" x2="${left}" y2="${top + 58}" stroke="#111" stroke-width="2"/><line x1="${left}" y1="${top + 72}" x2="${left}" y2="${bot - 40}" stroke="#111" stroke-width="2"/>`;
  s += `<text x="${left - 24}" y="${top + 70}" text-anchor="end" font-size="14" font-weight="bold" ${FONT}>${fmt(U)} V</text>`;
  Rs.forEach((R, i) => {
    const x0 = left + 70 + i * 110;
    s += `<rect x="${x0}" y="${top - 10}" width="60" height="20" fill="#fff" stroke="#111" stroke-width="2"/><text x="${x0 + 30}" y="${top - 18}" text-anchor="middle" font-size="14" font-weight="bold" ${FONT}>${fmt(R)} Ω</text>`;
  });
  return base(w, h, s);
}

/** Pontos no plano cartesiano. */
export function pontos({ pts, lim = 10 }) {
  const ticks = Array.from({ length: 2 * lim / 2 + 1 }, (_, i) => -lim + i * 2).filter(v => v !== 0);
  const e = eixos({ w: 360, h: 340, xmin: -lim, xmax: lim, ymin: -lim, ymax: lim, xs: ticks, ys: ticks, xl: 'x', yl: 'y' });
  let s = e.s;
  for (const [n, x, y] of pts) s += `<circle cx="${e.X(x)}" cy="${e.Y(y)}" r="5" fill="#c2362f"/><text x="${e.X(x) + 8}" y="${e.Y(y) - 8}" font-size="14" font-weight="bold" ${FONT}>${esc(n)}</text>`;
  return base(e.w, e.h, s);
}

/** Gráfico de setores (pizza) com legenda e porcentagens. */
export function setores({ dados, titulo }) {
  const w = 460, h = 260, cx = 130, cy = 140, r = 100;
  let s = titulo ? `<text x="${w / 2}" y="22" text-anchor="middle" font-size="14" font-weight="bold" ${FONT}>${esc(titulo)}</text>` : '';
  let a0 = -Math.PI / 2;
  const cores = ['#2340b8', '#0e7c86', '#b7791f', '#7b3fb8', '#c2362f', '#1f8a4c'];
  dados.forEach(([rot, p], i) => {
    const a1 = a0 + p / 100 * 2 * Math.PI;
    const g = a1 - a0 > Math.PI ? 1 : 0;
    s += `<path d="M ${cx} ${cy} L ${cx + r * Math.cos(a0)} ${cy + r * Math.sin(a0)} A ${r} ${r} 0 ${g} 1 ${cx + r * Math.cos(a1)} ${cy + r * Math.sin(a1)} Z" fill="${cores[i % 6]}" stroke="#fff" stroke-width="2"/>`;
    s += `<rect x="260" y="${60 + i * 28}" width="16" height="16" fill="${cores[i % 6]}"/><text x="284" y="${73 + i * 28}" font-size="13" ${FONT}>${esc(rot)}: ${fmt(p)}%</text>`;
    a0 = a1;
  });
  return base(w, h, s);
}
