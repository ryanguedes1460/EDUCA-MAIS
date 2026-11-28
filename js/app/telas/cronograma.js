// Cronograma da semana (com geração automática que se ajusta ao seu desempenho) e metas.
import { html, useState, useApp, useData, go, PageHead, Tabs, Modal, Field, Select, Ring, Empty, toast, confirmar } from '../ui.js';
import * as store from '../../core/store.js';
import { catalog } from '../../core/conteudo.js';
import { goalProgress, GOAL_KINDS, accuracy } from '../../lib/stats.js';
import { OBJETIVOS, montarCronograma } from '../../lib/cronograma.js';
import { weekdayIdx, weekStart, dayKey } from '../../core/util.js';
import * as auth from '../../core/auth.js';

const DAYS = ['Segunda', 'Terça', 'Quarta', 'Quinta', 'Sexta', 'Sábado', 'Domingo'];
const COLORS = ['#e0a83b', '#22c55e', '#38bdf8', '#f87171', '#a855f7', '#2dd4bf', '#ec4899', '#f97316'];
const colorOf = name => { let h = 0; for (const ch of String(name).toLowerCase()) h = (h * 31 + ch.charCodeAt(0)) >>> 0; return COLORS[h % COLORS.length]; };
const doneThisWeek = t => t.done_on && new Date(t.done_on + 'T12:00:00') >= weekStart();

function TaskForm({ task, onClose }) {
  const [t, setT] = useState(task || { title: '', weekday: weekdayIdx(), start_time: '19:00', duration_min: 50 });
  const set = (k, v) => setT({ ...t, [k]: v });
  const save = async () => {
    if (!t.title.trim()) return toast('Escreva a atividade.');
    const row = { title: t.title.trim().slice(0, 60), weekday: +t.weekday, start_time: t.start_time || '19:00', duration_min: Math.min(600, Math.max(5, +t.duration_min || 50)) };
    if (task) await store.patch('plan_tasks', task.id, row); else await store.put('plan_tasks', { ...row, done_on: null });
    toast(task ? 'Atividade atualizada' : 'Adicionada ao cronograma'); onClose();
  };
  return html`<${Modal} title=${task ? 'Editar atividade' : 'Nova atividade'} icon="🗓️" onClose=${onClose} foot=${html`${task && html`<button class="btn danger" onClick=${async () => { await store.remove('plan_tasks', task.id); toast('Removida'); onClose(); }}>Remover</button>`}<button class="btn primary" id="saveTask" onClick=${save}>Salvar</button>`}>
    <${Field} label="Matéria ou atividade"><input class="input" id="taskTitle" maxlength="60" value=${t.title} placeholder="Ex.: Matemática" onInput=${e => set('title', e.target.value)} /></${Field}>
    <div class="grid g3"><${Field} label="Dia"><${Select} value=${t.weekday} onChange=${v => set('weekday', v)} all=${null} options=${DAYS.map((d, i) => [i, d])} /></${Field}>
      <${Field} label="Horário"><input class="input" type="time" value=${String(t.start_time).slice(0, 5)} onInput=${e => set('start_time', e.target.value)} /></${Field}>
      <${Field} label="Duração (min)"><input class="input" type="number" min="5" max="600" step="5" value=${t.duration_min} onInput=${e => set('duration_min', e.target.value)} /></${Field}></div>
  </${Modal}>`;
}

function GerarForm({ onClose }) {
  const [obj, setObj] = useState({ fundamental: 'fundamental', medio: 'medio', concurso: 'concurso' }[auth.state.profile?.study_profile] || 'enem');
  const [edital, setEdital] = useState('');
  const [dias, setDias] = useState([0, 1, 2, 3, 4, 5]);
  const [inicio, setInicio] = useState('19:00');
  const [horas, setHoras] = useState('2');
  const [bloco, setBloco] = useState('50');
  const [adapt, setAdapt] = useState(true);
  const [subst, setSubst] = useState(true);
  const gerar = async () => {
    if (!dias.length) return toast('Escolha pelo menos um dia.');
    const cat = await catalog();
    let ed = edital;
    if (!ed.trim() && adapt) {
      // matérias com menos acerto ganham mais blocos
      const acc = accuracy(await store.all('answers'), cat.questions, cat.subjects, cat.topics).bySubject;
      ed = (OBJETIVOS[obj] || OBJETIVOS.enem).mats.map(([n, p]) => { const a = acc[n]; const bonus = a && a.n >= 5 ? (a.ok / a.n < 0.5 ? 2 : a.ok / a.n < 0.7 ? 1 : 0) : 0; return `${n}: ${Math.min(9, p + bonus)}`; }).join('\n');
    }
    const blocos = montarCronograma({ objetivo: obj, edital: ed, dias: dias.slice().sort(), inicio, horas: +horas, bloco: +bloco, materias: cat.subjects });
    if (subst) for (const t of (await store.all('plan_tasks')).filter(t => t.auto)) await store.remove('plan_tasks', t.id);
    for (const b of blocos) await store.put('plan_tasks', { ...b, done_on: null, auto: true });
    toast(`Cronograma pronto: ${blocos.length} blocos na semana`); onClose();
  };
  return html`<${Modal} title="Montar meu cronograma" icon="✨" onClose=${onClose} foot=${html`<button class="btn primary" onClick=${gerar}>Montar cronograma</button>`}>
    <${Field} label="Estou estudando para"><${Select} value=${obj} onChange=${setObj} all=${null} options=${Object.entries(OBJETIVOS).map(([k, o]) => [k, o.nome])} /></${Field}>
    <${Field} label="Matérias do edital (opcional)" hint='Uma por linha; pode pôr o peso, ex.: "Português: 3". Vazio usa as matérias do objetivo.'><textarea class="input" rows="3" maxlength="2000" value=${edital} onInput=${e => setEdital(e.target.value)}></textarea></${Field}>
    <div><span class="small muted bold">Dias livres</span><div class="row wrap mt" style="margin-top:6px">${DAYS.map((d, i) => html`<button class=${'chip' + (dias.includes(i) ? ' on' : '')} onClick=${() => setDias(dias.includes(i) ? dias.filter(x => x !== i) : [...dias, i])}>${d.slice(0, 3)}</button>`)}</div></div>
    <div class="grid g3"><${Field} label="Começo"><input class="input" type="time" value=${inicio} onInput=${e => setInicio(e.target.value)} /></${Field}>
      <${Field} label="Horas por dia"><${Select} value=${horas} onChange=${setHoras} all=${null} options=${[1, 1.5, 2, 3, 4, 5, 6].map(h => [h, String(h).replace('.', ',') + ' h'])} /></${Field}>
      <${Field} label="Cada bloco"><${Select} value=${bloco} onChange=${setBloco} all=${null} options=${[[25, '25 min'], [50, '50 min'], [90, '90 min']]} /></${Field}></div>
    <label class="check"><input type="checkbox" checked=${adapt} onChange=${() => setAdapt(!adapt)} /> Dar mais tempo às matérias em que estou errando mais</label>
    <label class="check"><input type="checkbox" checked=${subst} onChange=${() => setSubst(!subst)} /> Substituir o cronograma automático anterior (o que você criou à mão fica)</label>
  </${Modal}>`;
}

function GoalForm({ kind, cur, onClose }) {
  const info = GOAL_KINDS[kind];
  const [v, setV] = useState(cur?.active !== false && cur?.target || info.def);
  return html`<${Modal} title=${info.name} icon="🎯" onClose=${onClose} foot=${html`<button class="btn primary" onClick=${async () => { const n = Math.min(info.max, Math.max(1, +v || info.def)); await store.put('goals', { ...(cur || {}), id: kind, kind, target: n, active: true, deleted_at: null }); toast('Meta salva'); onClose(); }}>Salvar</button>`}>
    <${Field} label="Meta"><input class="input" type="number" min="1" max=${info.max} value=${v} onInput=${e => setV(e.target.value)} /></${Field}></${Modal}>`;
}

export default function Cronograma({ params = [] }) {
  const app = useApp();
  const [tab, setTab] = useState(params[0] === 'metas' ? 'metas' : 'semana');
  const [d] = useData(async () => { const [tasks, goals, sessions, answers, reviews] = await Promise.all(['plan_tasks', 'goals', 'study_sessions', 'answers', 'flashcard_reviews'].map(t => store.all(t))); return { tasks, goals, sessions, answers, reviews }; }, [], ['plan_tasks', 'goals', 'study_sessions', 'answers', 'flashcard_reviews']);
  if (!d) return html`<div class="skeleton" style="height:240px"></div>`;
  const close = () => app.setModal(null);
  const today = weekdayIdx();
  const done = d.tasks.filter(doneThisWeek).length;
  const horas = (d.tasks.reduce((a, t) => a + (+t.duration_min || 0), 0) / 60).toFixed(1).replace('.', ',');
  return html`<div class="col fade-in" style="gap:18px">
    <${PageHead} eyebrow="Planejamento" title="Cronograma e metas" actions=${tab === 'semana' && html`<button class="btn" id="addTask" onClick=${() => app.setModal(html`<${TaskForm} onClose=${close} />`)}>+ Atividade</button><button class="btn primary" data-action="gerar" onClick=${() => app.setModal(html`<${GerarForm} onClose=${close} />`)}>✨ Montar automático</button>`}>Organize a semana e acompanhe as metas com o que você realmente estudou.</${PageHead}>
    <${Tabs} value=${tab} onChange=${setTab} items=${[['semana', 'Semana'], ['metas', 'Metas']]} />
    ${tab === 'semana' ? html`
      <div class="row wrap between"><span class="chip num">${done} de ${d.tasks.length} concluídas nesta semana · ${horas} h planejadas</span>${done > 0 && html`<button class="btn ghost sm" onClick=${async () => { if (await confirmar(app.setModal, { title: 'Recomeçar a semana', text: 'Desmarcar todas as atividades concluídas?' })) for (const t of d.tasks.filter(doneThisWeek)) await store.patch('plan_tasks', t.id, { done_on: null }); }}>Recomeçar semana</button>`}</div>
      ${!d.tasks.length ? html`<div class="card"><${Empty} icon="🗓️" title="Sua semana está vazia" action=${html`<button class="btn primary" onClick=${() => app.setModal(html`<${GerarForm} onClose=${close} />`)}>✨ Montar cronograma automático</button>`}>Diga para que você estuda e quanto tempo tem. A plataforma monta a semana e dá mais tempo às matérias em que você mais erra.</${Empty}></div>` : html`
      <div class="week-scroll"><div class="week">${DAYS.map((dn, i) => { const list = d.tasks.filter(t => t.weekday === i).sort((a, b) => a.start_time.localeCompare(b.start_time)); const mins = list.reduce((s, t) => s + (+t.duration_min || 0), 0);
        return html`<div class=${'card day' + (i === today ? ' today' : '')}><h3>${dn}<span class="tiny muted num">${mins ? (mins / 60).toFixed(1).replace('.', ',') + ' h' : ''}</span></h3>
          ${list.map(t => html`<div class=${'task' + (doneThisWeek(t) ? ' done' : '')} style=${{ '--c': colorOf(t.title) }}><input type="checkbox" checked=${doneThisWeek(t)} aria-label=${'Concluir ' + t.title} onChange=${e => store.patch('plan_tasks', t.id, { done_on: e.target.checked ? dayKey() : null })} />
            <button style="all:unset;cursor:pointer;flex:1" onClick=${() => app.setModal(html`<${TaskForm} task=${t} onClose=${close} />`)}><div class="t-name">${t.title}</div><div class="t-time">${String(t.start_time).slice(0, 5)} · ${t.duration_min} min</div></button></div>`)}
          ${!list.length && html`<span class="tiny faint">Livre</span>`}</div>`; })}</div></div>`}`
    : html`<div class="grid g2">${Object.entries(GOAL_KINDS).map(([kind, info]) => { const g = d.goals.find(x => x.kind === kind && x.active !== false); const p = g ? goalProgress(g, d) : null;
        return html`<div class="card pad row" style="gap:16px">${g ? html`<${Ring} value=${p.value} max=${p.target} label=${info.name} />` : html`<div style="font-size:34px;width:84px;text-align:center">🎯</div>`}
          <div class="grow col" style="gap:6px"><h3>${info.name}</h3>${g ? html`<p class="num">${p.value}${p.unit || ''} de ${p.target}${p.unit || ''} <span class="small muted">${p.label}</span></p>` : html`<p class="small muted">Meta desativada.</p>`}
            <div class="row"><button class=${'btn sm ' + (g ? '' : 'primary')} onClick=${() => app.setModal(html`<${GoalForm} kind=${kind} cur=${g} onClose=${close} />`)}>${g ? 'Alterar' : 'Ativar'}</button>${g && html`<button class="btn ghost sm" onClick=${() => store.patch('goals', kind, { active: false })}>Desativar</button>`}</div></div></div>`; })}</div>`}
  </div>`;
}
