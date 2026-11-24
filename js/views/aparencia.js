// Personalização: tema, cores (paleta + cor livre), cartões, densidade, letra,
// movimento, modo de dispositivo e organização da tela inicial. Salvo na conta.
import { html, setHTML, actions, toast } from '../core/util.js';
import { icon } from '../core/icones.js';
import * as aparencia from '../core/aparencia.js';
import * as auth from '../core/auth.js';

const SECTIONS = { continuar: 'Continuar de onde parou', metas: 'Metas', revisoes: 'Resumo do dia', trilha: 'Trilha sugerida', ferramentas: 'Atalhos das ferramentas' };
const COLOR_FIELDS = [['color_primary', 'Cor principal', 'Botões, menus e destaques'], ['color_secondary', 'Cor secundária', 'Gráficos e detalhes'], ['color_accent', 'Cor de destaque', 'Marca-texto e avisos']];

export default {
  title: 'Aparência',
  async render(el) {
    const draw = () => {
      const s = aparencia.settings();
      const order = [...(s.home_sections || []), ...Object.keys(SECTIONS).filter(k => !(s.home_sections || []).includes(k))];
      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Personalização</span><h1>Aparência</h1><p>Deixe a Educa Mais do seu jeito. ${auth.isLogged() ? 'Suas escolhas ficam salvas na sua conta e valem em qualquer aparelho, sem mudar nada para outras pessoas.' : 'Sem conta, as escolhas ficam só neste aparelho.'}</p></div>
          <button class="btn ghost" type="button" data-action="reset">Restaurar padrão</button></div>

        <section class="card stack" aria-labelledby="h-dev"><h2 id="h-dev">Modo de visualização</h2>
          <p class="muted small">"Automático" detecta o aparelho pela largura da tela. Você pode fixar um modo; a tela continua se ajustando para não cortar nada.</p>
          <div class="grid g4" role="group" aria-label="Modo de visualização">${[['auto', 'Automático'], ['desktop', 'Computador'], ['tablet', 'Tablet'], ['mobile', 'Celular']].map(([k, n]) => html`<button type="button" class="device-opt" data-action="device" data-v="${k}" aria-pressed="${(s.device_mode || 'auto') === k}">${icon(k)}${n}</button>`)}</div>
          <p class="small">Agora exibindo: <b id="devNow">${{ desktop: 'Computador', tablet: 'Tablet', mobile: 'Celular' }[document.documentElement.dataset.device]}</b></p>
        </section>

        <section class="card stack" aria-labelledby="h-theme"><h2 id="h-theme">Tema</h2>
          <div class="grid g4">${aparencia.THEMES.map(t => html`<button type="button" class="theme-opt" data-action="theme" data-v="${t.id}" aria-pressed="${s.theme === t.id}"><span class="prev" style="background:${t.prev[0]}"><i style="background:${t.prev[1]}"></i><i style="background:${t.prev[2]}"></i></span><b>${t.name}</b></button>`)}</div>
        </section>

        <section class="card stack" aria-labelledby="h-cor"><h2 id="h-cor">Cores</h2>
          ${COLOR_FIELDS.map(([f, n, d]) => html`<div class="stack" style="gap:6px"><div class="row between"><span><b>${n}</b> <span class="muted small">${d}</span></span>${s[f] ? html`<button class="linkbtn small" type="button" data-action="clearColor" data-f="${f}">usar a do tema</button>` : ''}</div>
            <div class="row"><div class="swatches" role="group" aria-label="${n}">${aparencia.PALETTE.map(c => html`<button type="button" class="swatch" style="background:${c}" data-action="color" data-f="${f}" data-c="${c}" aria-pressed="${s[f] === c}" aria-label="${n}: ${c}"></button>`)}</div>
            <label class="f" style="grid-template-columns:auto auto;align-items:center;gap:8px">Personalizada<input type="color" class="input" data-f="${f}" value="${s[f] || '#2340b8'}" aria-label="${n} personalizada"></label></div></div>`)}
        </section>

        <section class="card stack" aria-labelledby="h-pref"><h2 id="h-pref">Preferências de interface</h2>
          <div class="form-grid">
            <label class="f">Aparência dos cartões<select class="input" data-pref="card_style">${[['elevated', 'Com sombra'], ['flat', 'Planos'], ['outlined', 'Contorno']].map(([v, n]) => html`<option value="${v}" ${s.card_style === v ? 'selected' : ''}>${n}</option>`)}</select></label>
            <label class="f">Espaçamento<select class="input" data-pref="density">${[['comfortable', 'Confortável'], ['compact', 'Compacto']].map(([v, n]) => html`<option value="${v}" ${s.density === v ? 'selected' : ''}>${n}</option>`)}</select></label>
            <label class="f">Tamanho da letra<select class="input" data-pref="font_scale">${[[0.9, 'Pequena'], [1, 'Normal'], [1.1, 'Grande'], [1.25, 'Muito grande']].map(([v, n]) => html`<option value="${v}" ${Number(s.font_scale) === v ? 'selected' : ''}>${n}</option>`)}</select></label>
          </div>
          <label class="check"><input type="checkbox" data-pref="reduce_motion" ${s.reduce_motion ? 'checked' : ''}> Reduzir animações</label>
        </section>

        <section class="card stack" aria-labelledby="h-home"><h2 id="h-home">Organização da tela inicial</h2>
          <p class="muted small">Escolha o que aparece no Início e em que ordem.</p>
          <div class="list">${order.map((k, i) => html`<div class="row between"><label class="check"><input type="checkbox" data-action="sec" data-k="${k}" ${(s.home_sections || []).includes(k) ? 'checked' : ''}> ${SECTIONS[k]}</label>
            <span class="row" style="gap:4px"><button class="btn ghost sm" type="button" data-action="move" data-k="${k}" data-d="-1" ${i ? '' : 'disabled'} aria-label="Subir ${SECTIONS[k]}">↑</button><button class="btn ghost sm" type="button" data-action="move" data-k="${k}" data-d="1" ${i < order.length - 1 ? '' : 'disabled'} aria-label="Descer ${SECTIONS[k]}">↓</button></span></div>`)}</div>
        </section>
      </div>`);
      el.querySelectorAll('input[type=color]').forEach(i => i.onchange = () => set({ [i.dataset.f]: i.value }));
      el.querySelectorAll('[data-pref]').forEach(i => i.onchange = () => set({ [i.dataset.pref]: i.type === 'checkbox' ? i.checked : i.dataset.pref === 'font_scale' ? Number(i.value) : i.value }));
    };
    const set = async patch => { await aparencia.save(patch); draw(); toast('Preferência salva'); };
    actions(el, {
      device(b) { set({ device_mode: b.dataset.v }); },
      theme(b) { set({ theme: b.dataset.v }); },
      color(b) { set({ [b.dataset.f]: b.dataset.c }); },
      clearColor(b) { set({ [b.dataset.f]: null }); },
      sec(b) { const cur = aparencia.settings().home_sections || []; set({ home_sections: b.checked ? [...cur, b.dataset.k] : cur.filter(k => k !== b.dataset.k) }); },
      move(b) {
        const s = aparencia.settings(); const order = [...(s.home_sections || []), ...Object.keys(SECTIONS).filter(k => !(s.home_sections || []).includes(k))];
        const i = order.indexOf(b.dataset.k), j = i + +b.dataset.d; [order[i], order[j]] = [order[j], order[i]];
        set({ home_sections: order.filter(k => (s.home_sections || []).includes(k)) });
      },
      reset() { const d = aparencia.DEFAULTS; set({ theme: d.theme, color_primary: null, color_secondary: null, color_accent: null, device_mode: 'auto', card_style: d.card_style, density: d.density, font_scale: 1, reduce_motion: false, home_sections: d.home_sections }); }
    });
    draw();
    const onDev = () => { const x = el.querySelector('#devNow'); if (x) x.textContent = { desktop: 'Computador', tablet: 'Tablet', mobile: 'Celular' }[document.documentElement.dataset.device]; };
    const { on } = await import('../core/bus.js');
    return on('device:change', onDev);
  }
};
