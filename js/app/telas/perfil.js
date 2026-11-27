// Perfil: mundos visuais, cor de destaque, letra e atalhos da conta.
import { html, useState, useApp, useData, go, PageHead, Field, Select, Bar, toast } from '../ui.js';
import * as aparencia from '../../core/aparencia.js';
import * as store from '../../core/store.js';
import * as auth from '../../core/auth.js';
import { WORLDS, ACCENTS, worldOf, setWorld } from '../mundos.js';
import { xpTotal, level, streakOf } from '../jogo.js';
import { VERSION } from '../../main.js';

export default function Perfil() {
  const app = useApp();
  const [, force] = useState(0);
  const s = aparencia.settings();
  const save = async p => { await aparencia.save(p); force(x => x + 1); };
  const [d] = useData(async () => { const [answers, reviews, sessions, lessons, attempts] = await Promise.all(['answers', 'flashcard_reviews', 'study_sessions', 'lesson_progress', 'exam_attempts'].map(t => store.all(t))); return { answers, reviews, sessions, lessons, attempts }; }, []);
  const lv = d ? level(xpTotal(d)) : null;
  const nome = app.profile?.display_name || app.user?.email || 'Estudante';
  const cur = worldOf(s.theme);
  const links = [
    ['👤', 'Minha conta', 'Nome, senha, aparelhos conectados e seus dados', 'conta', auth.isLogged() || !app.configured],
    ['💬', 'Falar com a professora', 'Tire dúvidas de aulas e questões', 'duvidas', auth.isLogged()],
    ['🏫', 'Minhas turmas', 'Listas e simulados do professor', 'turmas', auth.isLogged()],
    ['📄', 'Materiais', 'PDFs liberados para você', 'materiais', auth.isLogged()],
    ['🧑‍🏫', 'Área do professor', 'Banco próprio, turmas e listas', 'professor', auth.can('teacher.area')],
    ['🛡️', 'Painel da professora', 'Liberar alunos, aulas, questões e configurações', 'admin', auth.can('admin.access')]
  ].filter(x => x[4]);
  return html`<div class="col fade-in" style="gap:20px">
    <section class="card hero"><div class="row wrap" style="gap:18px"><span class="avatar lg">${(nome[0] || '★').toUpperCase()}</span>
      <div class="grow"><h1 style="font-size:32px">${nome}</h1>${lv && html`<div class="small muted">Nível ${lv.L} · ${lv.title} · 🔥 ${streakOf(d)} dias seguidos</div><div class="mt" style="max-width:360px;margin-top:8px"><${Bar} value=${lv.into} max=${lv.need} /></div>`}</div>
      ${app.profile?.role === 'admin' && html`<span class="chip accent">Administração</span>`}</div></section>

    <div class="grid feature-grid">${links.map(([ic, a, b, v]) => html`<button class="card feature" onClick=${() => go(v)}><div class="ic">${ic}</div><div><div class="bold">${a}</div><div class="small muted">${b}</div></div></button>`)}</div>

    <section class="card pad col"><h2>Mundo visual</h2><p class="small muted">Cada mundo muda as cores, o fundo e as letras dos títulos. Fica salvo na sua conta.</p>
      <div class="world-grid">${WORLDS.map(w => html`<button class=${'world' + (cur === w.id && s.theme !== 'auto' ? ' on' : '')} onClick=${() => { setWorld(w.id).then(() => force(x => x + 1)); }}><div class="prev" style=${{ background: `radial-gradient(circle at 80% 0%, ${w.prev[1]}55, transparent 60%), ${w.prev[0]}` }}>${w.icon}<i style=${{ background: w.prev[1] }}></i></div><div class="nm">${w.label}</div></button>`)}
        <button class=${'world' + (s.theme === 'auto' ? ' on' : '')} onClick=${() => save({ theme: 'auto' })}><div class="prev" style="background:linear-gradient(90deg,#0e0b09 50%,#f5f7fb 50%)">🌓</div><div class="nm">Automático</div></button></div></section>

    <section class="card pad col"><h2>Cor de destaque</h2>
      <div class="swatches"><button class="swatch" aria-pressed=${!s.color_primary} title="Cor do mundo" style="background:conic-gradient(#e0a83b,#38bdf8,#22c55e,#ec4899,#e0a83b)" onClick=${() => save({ color_primary: null })}></button>
        ${ACCENTS.map(c => html`<button class="swatch" aria-pressed=${s.color_primary === c} style=${{ background: c }} aria-label=${'Cor ' + c} onClick=${() => save({ color_primary: c })}></button>`)}
        <input type="color" class="input" style="width:52px" value=${s.color_primary || '#e0a83b'} onChange=${e => save({ color_primary: e.target.value })} aria-label="Escolher outra cor" /></div></section>

    <section class="card pad col"><h2>Leitura e conforto</h2>
      <div class="grid g3">
        <${Field} label="Letra"><${Select} value=${s.font_family} onChange=${v => save({ font_family: v })} all=${null} options=${aparencia.FONTS} /></${Field}>
        <${Field} label="Tamanho da letra"><${Select} value=${String(s.font_scale)} onChange=${v => save({ font_scale: +v })} all=${null} options=${[['0.9', 'Pequena'], ['1', 'Normal'], ['1.1', 'Grande'], ['1.25', 'Muito grande']]} /></${Field}>
        <${Field} label="Cantos"><${Select} value=${s.radius} onChange=${v => save({ radius: v })} all=${null} options=${aparencia.RADII} /></${Field}>
        <${Field} label="Meta diária de estudo"><${Select} value=${String(s.daily_goal_min)} onChange=${v => save({ daily_goal_min: +v })} all=${null} options=${[30, 45, 60, 90, 120, 180, 240].map(m => [m, m + ' min'])} /></${Field}>
      </div>
      <label class="check"><input type="checkbox" checked=${!!s.reduce_motion} onChange=${() => save({ reduce_motion: !s.reduce_motion })} /> Reduzir animações</label></section>
    <p class="tiny faint center">Educa Mais ${VERSION} · Atalhos: <span class="kbd">Ctrl K</span> busca · <span class="kbd">A–E</span> responder · <span class="kbd">Enter</span> confirmar · <span class="kbd">Espaço</span> virar flashcard</p>
  </div>`;
}
