// Estudar: trilhas por matéria em cartões (como as mesas do Nexus), com aulas, conteúdos e atalhos.
import { html, useState, useApp, useData, go, Bar, Modal, PageHead, Empty, subjectIcon, subjectColor, cover } from '../ui.js';
import * as store from '../../core/store.js';
import * as auth from '../../core/auth.js';
import * as controles from '../../core/controles.js';
import { catalog } from '../../core/conteudo.js';
import { accuracy } from '../../lib/stats.js';
import { norm, pct } from '../../core/util.js';

async function carregar() {
  let aulasP = store.meta.get('aulas:lista', []);
  if (auth.isLogged() && navigator.onLine && !controles.isBlocked('aulas')) aulasP = import('../../views/aulas.js').then(m => m.carregar()).then(r => r.lista).catch(() => store.meta.get('aulas:lista', []));
  const [cat, answers, aulas, feitas] = await Promise.all([catalog(), store.all('answers'), aulasP, store.all('lesson_progress')]);
  return { cat, answers, aulas: aulas || [], feitas: new Set(feitas.filter(f => f.completed_at).map(f => f.id)) };
}

function Trilha({ s, d, onClose }) {
  const { cat, answers } = d;
  const acc = accuracy(answers, cat.questions, cat.subjects, cat.topics);
  const tops = cat.topics.filter(t => t.subject_id === s.id && !t.parent_id);
  const nq = id => cat.bank.filter(q => q.topic_id === id || cat.topic(q.topic_id)?.parent_id === id).length;
  const aulas = d.aulas.filter(l => l.subject_id === s.id);
  return html`<${Modal} wide title=${'Trilha de ' + s.name} icon=${subjectIcon(s.name)} onClose=${onClose} foot=${html`<button class="btn" onClick=${() => { onClose(); go('flashcards', 'materia', s.id); }}>🃏 Flashcards</button><button class="btn primary" onClick=${() => { onClose(); go('questoes', 'materia', s.id); }}>✏️ Praticar ${s.name}</button>`}>
    ${aulas.length > 0 && html`<div><h3 class="mb">🎬 Aulas</h3><div class="col" style="gap:6px">${aulas.map(l => html`<button class="card qitem" style="padding:10px 14px" onClick=${() => { onClose(); go('aulas', l.id); }}><span class=${'chip ' + (d.feitas.has(l.id) ? 'ok' : '')}>${d.feitas.has(l.id) ? '✓' : '▶'}</span><span class="grow"><b>${l.title}</b>${l.module && html`<span class="small muted"> · ${l.module}</span>`}</span></button>`)}</div></div>`}
    <div><h3 class="mb">🔖 Conteúdos</h3>
      ${tops.length ? html`<div class="grid g2">${tops.map(t => { const a = Object.entries(acc.byTopic).filter(([id]) => +id === t.id || cat.topic(+id)?.parent_id === t.id).reduce((x, [, v]) => ({ ok: x.ok + v.ok, n: x.n + v.n }), { ok: 0, n: 0 }); return html`<button class="card qitem" style="flex-direction:column;gap:6px" onClick=${() => { onClose(); go('questoes', 'conteudo', t.id); }}>
        <div class="row between" style="width:100%"><b>${t.name}</b><span class="tiny muted">${nq(t.id)} questões</span></div>
        <div style="width:100%"><${Bar} value=${a.n ? a.ok / a.n * 100 : 0} /></div><span class="tiny muted">${a.n ? `${pct(a.ok, a.n)}% de acerto em ${a.n} respostas` : 'ainda não praticado'}</span></button>`; })}</div>` : html`<p class="muted small">Sem conteúdos cadastrados.</p>`}
    </div>
  </${Modal}>`;
}

export default function Estudar() {
  const app = useApp();
  const [q, setQ] = useState('');
  const [d, loading] = useData(carregar, [], ['answers', 'lesson_progress']);
  if (loading || !d) return html`<div class="skeleton" style="height:200px"></div>`;
  const { cat } = d;
  const acc = accuracy(d.answers, cat.questions, cat.subjects, cat.topics).bySubject;
  const count = new Map(); for (const x of cat.bank) count.set(x.subject_id, (count.get(x.subject_id) || 0) + 1);
  const subs = cat.subjects.filter(s => count.get(s.id) && (!q || norm(s.name).includes(norm(q))));
  const areas = cat.areas.length ? cat.areas : [{ id: null, name: 'Matérias' }];
  const card = s => {
    const a = acc[s.name], c = subjectColor(s), aulas = d.aulas.filter(l => l.subject_id === s.id);
    const feitas = aulas.filter(l => d.feitas.has(l.id)).length;
    return html`<button class="card tcard" key=${s.id} onClick=${() => app.setModal(html`<${Trilha} s=${s} d=${d} onClose=${() => app.setModal(null)} />`)}>
      <div class="tcover" style=${{ background: cover(c) }}><span class="emo">${subjectIcon(s.name)}</span><div class="chips"><span class="chip">${count.get(s.id).toLocaleString('pt-BR')} questões</span>${aulas.length > 0 && html`<span class="chip">${aulas.length} aulas</span>`}</div></div>
      <div class="tbody"><h3>${s.name}</h3>
        <div class="small muted">${a ? `${pct(a.ok, a.n)}% de acerto em ${a.n} respostas` : 'Comece esta trilha'}${aulas.length ? ` · ${feitas}/${aulas.length} aulas` : ''}</div>
        <${Bar} value=${a ? a.ok / a.n * 100 : 0} /></div></button>`;
  };
  return html`<div class="col fade-in" style="gap:22px">
    <${PageHead} eyebrow="Trilhas de estudo" title="Estudar" actions=${html`<input class="input" style="width:240px" placeholder="Buscar matéria" value=${q} onInput=${e => setQ(e.target.value)} />`}>Escolha uma matéria para ver as aulas, os conteúdos e o seu acerto em cada um.</${PageHead}>
    <div class="grid feature-grid">
      ${[['🎬', 'Aulas', auth.isLogged() ? `${d.aulas.length} aulas liberadas` : 'Entre na conta para ver', 'aulas'], ['📝', 'Anotações', 'Seu caderno digital com busca', 'anotacoes'], ['✍️', 'Redação', 'Temas e folha com cronômetro', 'redacao'], ['📄', 'Materiais', 'PDFs da professora', 'materiais'], ['💬', 'Falar com a professora', 'Tire suas dúvidas', 'duvidas']]
        .map(([ic, a, b, v]) => html`<button class="card feature" onClick=${() => go(v)}><div class="ic">${ic}</div><div><div class="bold">${a}</div><div class="small muted">${b}</div></div></button>`)}
    </div>
    ${areas.map(ar => { const ss = subs.filter(s => ar.id == null || s.area_id === ar.id); return ss.length > 0 && html`<section><h2 class="mb">${ar.name}</h2><div class="grid tables-grid">${ss.map(card)}</div></section>`; })}
    ${!subs.length && html`<div class="card"><${Empty} icon="🔎" title="Nenhuma matéria encontrada">Tente outro nome.</${Empty}></div>`}
  </div>`;
}
