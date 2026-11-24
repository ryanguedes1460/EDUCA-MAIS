// Gráficos em SVG puro (sem bibliotecas externas: funciona offline e respeita o tema).
import { html, raw, esc } from '../core/util.js';

/** Colunas verticais. data: [{label, value}] */
export function columns(data, { height = 160, unit = '', color = 'var(--brand)', title = '' } = {}) {
  const W = Math.max(data.length * 22, 280), H = height, pad = 22;
  const max = Math.max(1, ...data.map(d => d.value));
  const bw = (W - pad) / data.length;
  const bars = data.map((d, i) => {
    const h = Math.round((d.value / max) * (H - pad - 14));
    const x = pad + i * bw + 2, y = H - pad - h;
    const lbl = (i % Math.ceil(data.length / 10) === 0 || data.length <= 10) ? `<text x="${x + (bw - 4) / 2}" y="${H - 6}" text-anchor="middle">${esc(d.label)}</text>` : '';
    return `<rect x="${x}" y="${y}" width="${Math.max(2, bw - 4)}" height="${Math.max(h, d.value ? 2 : 0)}" rx="3" fill="${color}"><title>${esc(d.label)}: ${esc(fmt(d.value))}${esc(unit)}</title></rect>${lbl}`;
  }).join('');
  return raw(`<svg class="chart" viewBox="0 0 ${W} ${H}" role="img" aria-label="${esc(title)}">
    <line class="axis" x1="${pad}" x2="${W}" y1="${H - pad}" y2="${H - pad}"/>
    <text x="0" y="12">${esc(fmt(max))}${esc(unit)}</text>${bars}</svg>`);
}

/** Barras horizontais com porcentagem (acerto por matéria). data: [{label, ok, n}] */
export function percentBars(data) {
  if (!data.length) return html`<p class="muted small">Ainda não há respostas suficientes.</p>`;
  return html`<div class="stack">${data.map(d => {
    const p = Math.round(d.ok / d.n * 100);
    const c = p >= 70 ? 'var(--good)' : p >= 40 ? 'var(--warn)' : 'var(--bad)';
    return html`<div class="hbar"><div class="row between"><span>${d.label}</span><span class="num muted small">${p}% · ${d.ok}/${d.n}</span></div>
      <div class="bar" role="progressbar" aria-valuenow="${p}" aria-valuemin="0" aria-valuemax="100" aria-label="${d.label}"><i style="width:${p}%;background:${raw(c)}"></i></div></div>`;
  })}</div>`;
}

/** Linha (evolução do acerto). data: [{label, value|null}] valores 0-100 */
export function line(data, { height = 150, title = '' } = {}) {
  const W = 320, H = height, pad = 24;
  const pts = data.map((d, i) => d.value == null ? null : [pad + i * ((W - pad - 6) / Math.max(1, data.length - 1)), H - pad - (d.value / 100) * (H - pad - 10)]);
  const path = pts.filter(Boolean).map((p, i) => `${i ? 'L' : 'M'}${p[0].toFixed(1)},${p[1].toFixed(1)}`).join(' ');
  const dots = pts.map((p, i) => p ? `<circle cx="${p[0].toFixed(1)}" cy="${p[1].toFixed(1)}" r="3.5" fill="var(--second)"><title>${esc(data[i].label)}: ${data[i].value}%</title></circle>` : '').join('');
  const labels = data.map((d, i) => (i === 0 || i === data.length - 1 || i % Math.ceil(data.length / 6) === 0) ? `<text x="${(pad + i * ((W - pad - 6) / Math.max(1, data.length - 1))).toFixed(1)}" y="${H - 6}" text-anchor="middle">${esc(d.label)}</text>` : '').join('');
  return raw(`<svg class="chart" viewBox="0 0 ${W} ${H}" role="img" aria-label="${esc(title)}">
    <line class="axis" x1="${pad}" x2="${W}" y1="${H - pad}" y2="${H - pad}"/>
    <line class="axis" x1="${pad}" x2="${W}" y1="${(H - pad - 0.7 * (H - pad - 10)).toFixed(1)}" y2="${(H - pad - 0.7 * (H - pad - 10)).toFixed(1)}" stroke-dasharray="3 3"/>
    <text x="0" y="14">100%</text><text x="0" y="${(H - pad - 0.7 * (H - pad - 10) + 4).toFixed(1)}">70%</text>
    ${path ? `<path d="${path}" fill="none" stroke="var(--second)" stroke-width="2.5" stroke-linejoin="round"/>` : ''}${dots}${labels}</svg>`);
}

/** Mapa de calor de frequência (estilo calendário). days: array de {key, value} em ordem, começando numa segunda. */
export function heatmap(days) {
  const max = Math.max(1, ...days.map(d => d.value));
  return html`<div class="heat" role="img" aria-label="Frequência de estudos">${days.map(d => {
    const l = d.value <= 0 ? 0 : Math.min(4, Math.ceil(d.value / max * 4));
    return html`<span data-l="${l}" title="${d.key}: ${Math.round(d.value)} min"></span>`;
  })}</div>`;
}

/** Anel de progresso. */
export function ring(value, target, label) {
  const p = Math.min(1, target ? value / target : 0), C = 2 * Math.PI * 34;
  return raw(`<svg viewBox="0 0 80 80" width="80" height="80" role="img" aria-label="${esc(label)}: ${Math.round(p * 100)}%">
    <circle cx="40" cy="40" r="34" fill="none" stroke="var(--surface-2)" stroke-width="8"/>
    <circle cx="40" cy="40" r="34" fill="none" stroke="${p >= 1 ? 'var(--good)' : 'var(--brand)'}" stroke-width="8" stroke-linecap="round" stroke-dasharray="${C.toFixed(2)}" stroke-dashoffset="${(C * (1 - p)).toFixed(2)}" transform="rotate(-90 40 40)"/>
    <text x="40" y="45" text-anchor="middle" style="font-size:15px;font-weight:800;fill:var(--ink)">${Math.round(p * 100)}%</text></svg>`);
}

const fmt = v => Number.isInteger(v) ? String(v) : v.toFixed(1).replace('.', ',');
