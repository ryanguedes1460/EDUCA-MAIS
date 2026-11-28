// Trilhas do ensino médio: matéria → módulos (mapa de conteúdos) → resumo, mapa mental e questões.
// Inspirado na organização das grandes plataformas de estudo: tudo de um conteúdo num lugar só.
import { html, useState, useData, useMedia, go, PageHead, Empty, Bar, Seg, toast } from '../ui.js';
import * as store from '../../core/store.js';
import * as aparencia from '../../core/aparencia.js';
import { catalog } from '../../core/conteudo.js';
import { norm } from '../../core/util.js';
import { DISCIPLINAS, RESUMOS, resumo as acharResumo } from '../../data/resumos.js';
import { CURRICULO } from '../../data/curriculo.js';

const PRIO = { 3: ['🔥', 'Cai muito', 'danger'], 2: ['⭐', 'Cai com frequência', 'warn'], 1: ['·', 'Cai às vezes', ''] };
const CORES = ['#6d28d9', '#0e7c86', '#b7791f', '#c2362f', '#1f8a4c', '#2340b8'];
const LIDOS = 'resumos:lidos';

async function carregar() {
  const [cat, lidos] = await Promise.all([catalog(), store.meta.get(LIDOS, [])]);
  return { cat, lidos: new Set(lidos || []) };
}

/** Conteúdo do banco de questões que corresponde a um resumo (pela palavra de busca). */
function alvoQuestoes(cat, r) {
  const d = DISCIPLINAS.find(x => x.id === r.disc);
  const s = cat.subjects.find(x => x.name === d.materia);
  if (!s) return null;
  const b = norm(r.busca);
  const tops = cat.topics.filter(t => t.subject_id === s.id && norm(t.name).includes(b));
  const t = tops.find(x => !x.parent_id) || tops[0];
  const n = t ? cat.bank.filter(q => q.topic_id === t.id || cat.topic(q.topic_id)?.parent_id === t.id).length : 0;
  return t && n ? { tipo: 'conteudo', id: t.id, nome: t.name, n } : { tipo: 'materia', id: s.id, nome: s.name, n: cat.bank.filter(q => q.subject_id === s.id).length };
}
const praticar = a => a && go('questoes', a.tipo, a.id);

// ---------------- Mapa mental em SVG (desenhado a partir dos tópicos do resumo) ----------------
function quebrar(txt, max) {
  const out = []; let l = '';
  for (const w of String(txt).split(' ')) { if ((l + ' ' + w).trim().length > max && l) { out.push(l); l = w; } else l = (l + ' ' + w).trim(); }
  if (l) out.push(l);
  return out;
}
export function MapaMental({ r, estreito }) {
  const col = estreito ? 1 : 2, W = estreito ? 390 : 980, CW = estreito ? 336 : 330, MAX = estreito ? 40 : 40, LH = 17;
  const blocos = r.ramos.map(([t, itens], i) => {
    const linhas = itens.map(x => quebrar(x, MAX));
    const titulo = quebrar(t, estreito ? 34 : 30);
    return { t: titulo, linhas, cor: CORES[i % CORES.length], h: 16 + titulo.length * 19 + linhas.reduce((a, l) => a + l.length * LH + 5, 0) + 8 };
  });
  const centro = quebrar(r.titulo, estreito ? 28 : 22);
  const cH = 28 + centro.length * 22;
  let svg = [], H;
  const caixa = (x, y, b, side) => {
    const parts = [`<rect x="${x}" y="${y}" width="${CW}" height="${b.h}" rx="14" fill="var(--panel-solid, #fff)" stroke="${b.cor}" stroke-width="2"/>`,
      `<rect x="${x}" y="${y}" width="${CW}" height="${10 + b.t.length * 19}" rx="14" fill="${b.cor}"/><rect x="${x}" y="${y + b.t.length * 19}" width="${CW}" height="10" fill="${b.cor}"/>`];
    b.t.forEach((l, k) => parts.push(`<text x="${x + 14}" y="${y + 21 + k * 19}" font-size="15" font-weight="700" fill="#fff">${esc(l)}</text>`));
    let yy = y + 16 + b.t.length * 19 + 12;
    for (const ls of b.linhas) {
      parts.push(`<circle cx="${x + 16}" cy="${yy - 4}" r="3" fill="${b.cor}"/>`);
      ls.forEach((l, k) => parts.push(`<text x="${x + 26}" y="${yy + k * LH}" font-size="13" fill="var(--text, #111)">${esc(l)}</text>`));
      yy += ls.length * LH + 5;
    }
    return parts.join('');
  };
  if (col === 1) {
    let y = cH + 40;
    const cx = W / 2;
    svg.push(`<line x1="24" y1="${cH + 10}" x2="24" y2="${cH + 40 + blocos.reduce((a, b) => a + b.h + 18, 0) - 18 - blocos[blocos.length - 1].h / 2}" stroke="var(--line2, #ccc)" stroke-width="3"/>`);
    for (const b of blocos) { svg.push(`<line x1="24" y1="${y + b.h / 2}" x2="48" y2="${y + b.h / 2}" stroke="${b.cor}" stroke-width="3"/>`, caixa(48, y, b)); y += b.h + 18; }
    H = y;
    svg.unshift(`<rect x="${cx - 170}" y="10" width="340" height="${cH}" rx="${cH / 2 > 30 ? 30 : cH / 2}" fill="var(--accent, #6d28d9)"/>` + centro.map((l, k) => `<text x="${cx}" y="${10 + 34 + k * 22}" text-anchor="middle" font-size="18" font-weight="800" fill="#fff">${esc(l)}</text>`).join(''));
  } else {
    const esq = blocos.filter((_, i) => i % 2 === 0), dir = blocos.filter((_, i) => i % 2 === 1);
    const alt = l => l.reduce((a, b) => a + b.h, 0) + Math.max(0, l.length - 1) * 22;
    H = Math.max(alt(esq), alt(dir), cH) + 40;
    const cx = W / 2, cy = H / 2;
    const lado = (lista, x, ancoraX) => {
      let y = (H - alt(lista)) / 2;
      for (const b of lista) {
        const my = y + b.h / 2, x0 = ancoraX < cx ? cx - 120 : cx + 120;
        svg.push(`<path d="M ${x0} ${cy} C ${(x0 + ancoraX) / 2} ${cy}, ${(x0 + ancoraX) / 2} ${my}, ${ancoraX} ${my}" fill="none" stroke="${b.cor}" stroke-width="3"/>`);
        svg.push(caixa(x, y, b));
        y += b.h + 22;
      }
    };
    lado(esq, 20, 20 + CW);
    lado(dir, W - 20 - CW, W - 20 - CW);
    svg.push(`<rect x="${cx - 125}" y="${cy - cH / 2}" width="250" height="${cH}" rx="22" fill="var(--accent, #6d28d9)"/>` + centro.map((l, k) => `<text x="${cx}" y="${cy - cH / 2 + 36 + k * 22}" text-anchor="middle" font-size="18" font-weight="800" fill="#fff">${esc(l)}</text>`).join(''));
  }
  return html`<div class="mapa-mental" role="img" aria-label=${'Mapa mental: ' + r.titulo} dangerouslySetInnerHTML=${{ __html: `<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 ${W} ${H}" font-family="inherit">${svg.join('')}</svg>` }}></div>`;
}
const esc = s => String(s).replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

// ---------------- Tela de um resumo ----------------
function Resumo({ id, d }) {
  const r = acharResumo(id);
  const estreito = useMedia('(max-width: 700px)');
  const [aba, setAba] = useState('resumo');
  const [lido, setLido] = useState(d.lidos.has(id));
  if (!r) return html`<div class="card"><${Empty} icon="🔎" title="Resumo não encontrado" action=${html`<button class="btn" onClick=${() => go('trilhas')}>Voltar às trilhas</button>`} /></div>`;
  const disc = DISCIPLINAS.find(x => x.id === r.disc);
  const alvo = alvoQuestoes(d.cat, r);
  const p = PRIO[r.prioridade];
  const marcar = async () => {
    const l = new Set(await store.meta.get(LIDOS, []) || []); lido ? l.delete(id) : l.add(id);
    await store.meta.set(LIDOS, [...l]); setLido(!lido); if (!lido) toast('Resumo marcado como revisado ✓');
  };
  const irmaos = RESUMOS.filter(x => x.disc === r.disc);
  const i = irmaos.indexOf(r);
  return html`<div class="col fade-in" style="gap:18px">
    <div class="row wrap small"><button class="btn ghost sm" onClick=${() => go('trilhas', r.disc)}>← ${disc.icone} ${disc.nome}</button></div>
    <${PageHead} eyebrow=${html`${disc.nome} · <span class=${'chip ' + p[2]}>${p[0]} ${p[1]}</span>`} title=${r.titulo}
      actions=${html`<button class=${'btn ' + (lido ? 'ok' : '')} onClick=${marcar}>${lido ? '✓ Revisado' : 'Marcar como revisado'}</button>${alvo && html`<button class="btn primary" onClick=${() => praticar(alvo)}>✏️ ${alvo.n.toLocaleString('pt-BR')} questões</button>`}`}>${r.ideia}</${PageHead}>
    <${Seg} value=${aba} onChange=${setAba} items=${[['resumo', '📄 Resumo'], ['mapa', '🧠 Mapa mental']]} />
    ${aba === 'mapa' ? html`<div class="card pad"><${MapaMental} r=${r} estreito=${estreito} /><p class="tiny faint mt">Dica: tente redesenhar o mapa de memória no caderno. Depois compare.</p></div>`
      : html`<div class="grid g2">${r.ramos.map(([t, itens], k) => html`<div class="card pad resumo-ramo" style=${{ borderTop: `4px solid ${CORES[k % CORES.length]}` }}><h3 class="mb">${t}</h3><ul class="resumo-lista">${itens.map(x => html`<li>${x}</li>`)}</ul></div>`)}</div>`}
    <div class="card pad row wrap" style="gap:12px;align-items:flex-start"><span style="font-size:26px">🎯</span><div class="grow"><b>Como cai na prova</b><p class="small muted" style="margin:4px 0 0">${r.cai}</p></div>
      ${alvo && html`<button class="btn" onClick=${() => praticar(alvo)}>Treinar ${alvo.nome}</button>`}</div>
    <div class="row between wrap">
      ${i > 0 ? html`<button class="btn ghost" onClick=${() => go('resumo', irmaos[i - 1].id)}>← ${irmaos[i - 1].titulo}</button>` : html`<span></span>`}
      ${i < irmaos.length - 1 && html`<button class="btn ghost" onClick=${() => go('resumo', irmaos[i + 1].id)}>${irmaos[i + 1].titulo} →</button>`}
    </div>
    <p class="tiny faint">Resumo autoral da Educa Mais, escrito para revisão. Confira sempre com o seu material e o edital da sua prova.</p>
  </div>`;
}

// ---------------- Uma matéria: módulos do mapa de conteúdos ----------------
function Materia({ disc, d }) {
  const D = DISCIPLINAS.find(x => x.id === disc);
  const [filtro, setFiltro] = useState('todos');
  const [q, setQ] = useState('');
  if (!D) return html`<div class="card"><${Empty} icon="🔎" title="Matéria não encontrada" /></div>`;
  const mods = (CURRICULO[disc] || []).filter(m => (filtro === 'todos' || (filtro === 'top' ? m[1] === 3 : m[2] && !d.lidos.has(m[2]))) && (!q || norm(m[0]).includes(norm(q))));
  const resumos = RESUMOS.filter(r => r.disc === disc).sort((a, b) => b.prioridade - a.prioridade);
  const grupos = [...new Set(mods.map(m => m[3]))];
  const s = d.cat.subjects.find(x => x.name === D.materia);
  const lidos = resumos.filter(r => d.lidos.has(r.id)).length;
  return html`<div class="col fade-in" style="gap:20px">
    <div class="row wrap small"><button class="btn ghost sm" onClick=${() => go('trilhas')}>← Trilhas</button></div>
    <${PageHead} eyebrow="Trilha do ensino médio" title=${`${D.icone} ${D.nome}`} actions=${s && html`<button class="btn primary" onClick=${() => go('questoes', 'materia', s.id)}>✏️ Praticar ${D.nome}</button>`}>
      ${(CURRICULO[disc] || []).length ? `${(CURRICULO[disc] || []).length} módulos no mapa de conteúdos e ` : ''}${resumos.length} resumos com mapa mental. Comece pelos que têm 🔥: são os que mais caem.</${PageHead}>
    <section><div class="row between wrap mb"><h2>Resumos e mapas mentais</h2><span class="small muted">${lidos} de ${resumos.length} revisados</span></div>
      <div class="grid g3">${resumos.map(r => { const p = PRIO[r.prioridade]; return html`<button class="card qitem resumo-card" onClick=${() => go('resumo', r.id)}>
        <div class="row between" style="width:100%"><span class=${'chip ' + p[2]}>${p[0]} ${p[1]}</span>${d.lidos.has(r.id) && html`<span class="chip ok">✓</span>`}</div>
        <b>${r.titulo}</b><span class="small muted">${r.ideia}</span></button>`; })}</div></section>
    ${(CURRICULO[disc] || []).length > 0 && html`<section><div class="row between wrap mb"><h2>Mapa de conteúdos</h2>
        <div class="row wrap"><${Seg} value=${filtro} onChange=${setFiltro} items=${[['todos', 'Todos'], ['top', '🔥 Mais cobrados'], ['falta', 'Ainda não revisei']]} /><input class="input" style="width:200px" placeholder="Buscar módulo" value=${q} onInput=${e => setQ(e.target.value)} /></div></div>
      ${grupos.map(g => html`<div class="card pad mb">${g && html`<h3 class="mb">${g}</h3>`}<div class="col modulos">${mods.filter(m => m[3] === g).map(([nome, pr, rid]) => { const p = PRIO[pr]; return html`<div class="row modulo">
          <span class=${'prio p' + pr} title=${p[1]}>${p[0]}</span><span class="grow">${nome}</span>
          ${rid ? html`<button class="btn sm ${d.lidos.has(rid) ? 'ok' : 'ghost'}" onClick=${() => go('resumo', rid)}>${d.lidos.has(rid) ? '✓ ' : ''}Resumo</button>` : html`<span class="tiny faint">resumo em breve</span>`}</div>`; })}</div></div>`)}
      ${!mods.length && html`<div class="card"><${Empty} icon="✨" title="Nada aqui com esse filtro" /></div>`}
    </section>`}
  </div>`;
}

// ---------------- Início das trilhas ----------------
function Hub({ d }) {
  const meta = aparencia.settings().study_goal;
  const total = RESUMOS.length, lidos = RESUMOS.filter(r => d.lidos.has(r.id)).length;
  const top = RESUMOS.filter(r => r.prioridade === 3 && !d.lidos.has(r.id)).slice(0, 6);
  return html`<div class="col fade-in" style="gap:22px">
    <${PageHead} eyebrow="Ensino médio completo" title="Trilhas, resumos e mapas mentais" actions=${html`<button class="btn" onClick=${() => go('objetivo')}>🎯 ${meta?.prova || meta?.curso ? 'Meu plano' : 'Definir objetivo'}</button>`}>
      Cada matéria tem o mapa de conteúdos do ensino médio, com o que mais cai no ENEM e nos vestibulares, resumos para revisar, mapas mentais e questões.</${PageHead}>
    <div class="card pad row wrap" style="gap:18px"><div class="grow"><b>Sua revisão</b><div class="small muted">${lidos} de ${total} resumos revisados</div><div class="mt"><${Bar} value=${lidos / total * 100} /></div></div>
      ${top[0] && html`<button class="btn primary" onClick=${() => go('resumo', top[0].id)}>Próximo: ${top[0].titulo}</button>`}</div>
    <div class="grid tables-grid">${DISCIPLINAS.map(D => {
      const rs = RESUMOS.filter(r => r.disc === D.id), l = rs.filter(r => d.lidos.has(r.id)).length, mods = (CURRICULO[D.id] || []).length;
      const s = d.cat.subjects.find(x => x.name === D.materia), nq = s ? d.cat.bank.filter(q => q.subject_id === s.id).length : 0;
      return html`<button class="card tcard" onClick=${() => go('trilhas', D.id)}>
        <div class="tcover" style=${{ background: `linear-gradient(135deg, ${s?.color || '#6d28d9'}, color-mix(in srgb, ${s?.color || '#6d28d9'} 45%, #000))` }}><span class="emo">${D.icone}</span><div class="chips">${mods > 0 && html`<span class="chip">${mods} módulos</span>`}<span class="chip">${rs.length} resumos</span></div></div>
        <div class="tbody"><h3>${D.nome}</h3><div class="small muted">${nq.toLocaleString('pt-BR')} questões · ${l}/${rs.length} revisados</div><${Bar} value=${rs.length ? l / rs.length * 100 : 0} /></div></button>`;
    })}</div>
    ${top.length > 0 && html`<section><h2 class="mb">🔥 Os que mais caem e você ainda não revisou</h2><div class="grid g3">${top.map(r => html`<button class="card qitem resumo-card" onClick=${() => go('resumo', r.id)}><span class="small muted">${DISCIPLINAS.find(x => x.id === r.disc).nome}</span><b>${r.titulo}</b><span class="small muted">${r.ideia}</span></button>`)}</div></section>`}
  </div>`;
}

export default function Trilhas({ params = [], modo }) {
  const [d] = useData(carregar, [], ['answers']);
  if (!d) return html`<div class="skeleton" style="height:240px"></div>`;
  if (modo === 'resumo') return html`<${Resumo} key=${params[0]} id=${params[0]} d=${d} />`;
  if (params[0]) return html`<${Materia} key=${params[0]} disc=${params[0]} d=${d} />`;
  return html`<${Hub} d=${d} />`;
}
