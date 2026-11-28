// Meu objetivo: perguntas do primeiro acesso (objetivo, prova, dificuldades, nota anterior, meta)
// e o plano para chegar à nota de corte. Fica salvo nas preferências da conta (user_settings.study_goal).
import { html, useState, useEffect, useMemo, go, PageHead, Field, Select, Ring, Bar, Loading, toast } from '../ui.js';
import * as store from '../../core/store.js';
import * as aparencia from '../../core/aparencia.js';
import { catalog } from '../../core/conteudo.js';
import { accuracy } from '../../lib/stats.js';
import { montarCronograma } from '../../lib/cronograma.js';
import { registrar } from '../../core/atividade.js';
import { TIPOS, FACULDADES, VESTIBULARES, CONCURSOS, CORTES_ENEM, corteSugerido, AREAS_ENEM, MATERIAS_ESCOLHA, DIFICULDADES_GERAIS, normalizar, montarPlano, editalDoPlano } from '../../lib/objetivo.js';

export const objetivoSalvo = () => aparencia.settings().study_goal || null;
export const PULOU = 'em:objetivo-depois';
const fmt = (v, esc) => v == null ? '–' : esc === 'pct' ? String(v).replace('.', ',') + '%' : String(v).replace('.', ',');
const anos = () => { const y = new Date().getFullYear(); return Array.from({ length: 8 }, (_, i) => y - i); };

const Grupo = ({ label, children }) => html`<div class="field" role="group" aria-label=${label}><span>${label}</span>${children}</div>`;

function Chips({ itens, sel, onChange, max = 12 }) {
  return html`<div class="row wrap" style="gap:6px">${itens.map(m => html`<button type="button" class=${'chip' + (sel.includes(m) ? ' on' : '')} aria-pressed=${sel.includes(m)}
    onClick=${() => onChange(sel.includes(m) ? sel.filter(x => x !== m) : sel.length < max ? [...sel, m] : sel)}>${m}</button>`)}</div>`;
}

function Assistente({ inicial, onFim }) {
  const [o, setO] = useState(() => ({ tipo: '', dificuldades: [], outras: [], notas: {}, horas_semana: 10, ...(inicial || {}) }));
  const [passo, setPasso] = useState(inicial ? 1 : 0);
  const set = (k, v) => setO(x => ({ ...x, [k]: v }));
  const esc = TIPOS[o.tipo]?.escala || 'enem';
  const PASSOS = ['Objetivo', 'Prova', 'Dificuldades', 'Já fez a prova?', 'Meta'];
  const proximo = () => {
    if (passo === 0 && !o.tipo) return toast('Escolha o seu objetivo.');
    setPasso(p => Math.min(PASSOS.length - 1, p + 1)); window.scrollTo(0, 0);
  };
  const salvar = async () => {
    const n = normalizar(o);
    if (n.meta == null && esc === 'enem' && o.curso) n.meta = corteSugerido(o.curso);
    await aparencia.save({ study_goal: n });
    try { localStorage.removeItem(PULOU); } catch {}
    registrar('objetivo.salvar', n.tipo, { prova: n.prova, meta: n.meta });
    toast('Objetivo salvo. Seu plano está pronto!');
    onFim(n);
  };
  const corteRef = esc === 'enem' ? corteSugerido(o.curso) : null;

  return html`<div class="col fade-in" style="gap:16px;max-width:820px;margin:0 auto">
    <${PageHead} eyebrow=${`Passo ${passo + 1} de ${PASSOS.length}`} title=${passo === 0 ? 'Qual é o seu objetivo?' : PASSOS[passo]}>Responda rapidinho: com isso a Educa Mais monta um plano para você chegar à nota de corte.</${PageHead}>
    <div class="steps" aria-hidden="true">${PASSOS.map((p, i) => html`<span class=${i <= passo ? 'on' : ''}></span>`)}</div>

    ${passo === 0 && html`<div class="grid-2">${Object.entries(TIPOS).map(([k, t]) => html`<button type="button" class=${'card pad pick-card' + (o.tipo === k ? ' on' : '')} aria-pressed=${o.tipo === k} onClick=${() => { set('tipo', k); setTimeout(() => setPasso(1), 120); }}>
      <span style="font-size:30px">${t.icone}</span><b>${t.nome}</b></button>`)}</div>`}

    ${passo === 1 && html`<section class="card pad col" style="gap:12px">
      ${o.tipo === 'enem' && html`
        <${Field} label="Faculdade que você quer (opcional)"><${Select} value=${o.instituicao || ''} onChange=${v => set('instituicao', v)} all="Ainda não sei" options=${FACULDADES.map(f => [f, f])} /></${Field}>
        <${Field} label="Curso (opcional)" hint="Usamos o curso para sugerir uma nota de corte de referência."><${Select} value=${o.curso || ''} onChange=${v => set('curso', v)} all="Ainda não sei" options=${CORTES_ENEM.map(([c]) => [c, c])} /></${Field}>
        <${Field} label="Ano em que vai fazer o ENEM"><${Select} value=${o.prova || ''} onChange=${v => set('prova', v)} all="Escolher" options=${[0, 1, 2].map(i => new Date().getFullYear() + i).map(y => ['ENEM ' + y, 'ENEM ' + y])} /></${Field}>`}
      ${o.tipo === 'vestibular' && html`
        <${Grupo} label="Qual vestibular? (opcional)"><div class="col" style="gap:6px">${VESTIBULARES.map(v => html`<label class="pick"><input type="radio" name="vest" checked=${o.prova === v.nome} onChange=${() => set('prova', v.nome)} /><span><b>${v.nome}</b>${v.detalhe && html`<br /><span class="small muted">${v.detalhe}</span>`}</span></label>`)}</div></${Grupo}>
        <${Field} label="Curso (opcional)"><input class="input" maxlength="80" value=${o.curso || ''} onInput=${e => set('curso', e.target.value)} placeholder="Ex.: Enfermagem" /></${Field}>`}
      ${o.tipo === 'concurso' && html`
        <${Grupo} label="Qual concurso? (opcional)"><div class="col" style="gap:6px">${CONCURSOS.map(c => html`<label class="pick"><input type="radio" name="conc" checked=${o.prova === c.nome} onChange=${() => set('prova', c.nome)} /><span>${c.nome}</span></label>`)}</div></${Grupo}>
        <${Field} label="Cargo (opcional)"><input class="input" maxlength="80" value=${o.curso || ''} onInput=${e => set('curso', e.target.value)} placeholder="Ex.: Agente administrativo" /></${Field}>`}
      ${o.tipo === 'escola' && html`
        <${Field} label="Série ou ano"><${Select} value=${o.prova || ''} onChange=${v => set('prova', v)} all="Escolher" options=${['6º ano', '7º ano', '8º ano', '9º ano', '1º ano do médio', '2º ano do médio', '3º ano do médio'].map(x => [x, x])} /></${Field}>`}
      <${Field} label="Data da prova (opcional)" hint="Com a data, o plano calcula quanto subir por semana."><input class="input" type="date" value=${o.data_prova || ''} onInput=${e => set('data_prova', e.target.value)} /></${Field}>
    </section>`}

    ${passo === 2 && html`<section class="card pad col" style="gap:14px">
      <${Grupo} label="Em quais matérias você tem mais dificuldade?"><${Chips} itens=${MATERIAS_ESCOLHA} sel=${o.dificuldades} onChange=${v => set('dificuldades', v)} /></${Grupo}>
      <${Grupo} label="E no jeito de estudar?"><${Chips} itens=${DIFICULDADES_GERAIS} sel=${o.outras} onChange=${v => set('outras', v)} /></${Grupo}>
      <${Field} label="Quantas horas por semana você consegue estudar?"><${Select} value=${o.horas_semana} onChange=${v => set('horas_semana', +v)} all=${null} options=${[3, 5, 8, 10, 14, 20, 25, 30, 40].map(h => [h, h + ' horas'])} /></${Field}>
      <${Field} label="Quer contar mais alguma coisa? (opcional)"><textarea class="input" rows="2" maxlength="500" value=${o.obs || ''} onInput=${e => set('obs', e.target.value)} placeholder="Ex.: trabalho de dia e estudo à noite"></textarea></${Field}>
    </section>`}

    ${passo === 3 && html`<section class="card pad col" style="gap:14px">
      <div class="seg">${[[false, 'Ainda não fiz'], [true, 'Já fiz esta prova']].map(([v, n]) => html`<button class=${!!o.ja_fez === v ? 'on' : ''} onClick=${() => set('ja_fez', v)}>${n}</button>`)}</div>
      ${o.ja_fez && html`
        <${Field} label="Em que ano?"><${Select} value=${o.ano_anterior || ''} onChange=${v => set('ano_anterior', v)} all="Escolher" options=${anos().map(y => [y, y])} /></${Field}>
        ${esc === 'enem' ? html`<p class="small muted">Digite as notas que você tirou (de 0 a 1000). Pode deixar em branco o que não lembra.</p>
          <div class="grid g3">${AREAS_ENEM.map(([k, nome]) => html`<${Field} label=${nome}><input class="input" type="number" min="0" max="1000" inputmode="numeric" value=${o.notas?.[k] ?? ''} onInput=${e => set('notas', { ...o.notas, [k]: e.target.value })} /></${Field}>`)}</div>`
        : html`<${Field} label=${esc === 'pct' ? 'Quanto você acertou? (em %)' : 'Sua média (de 0 a 10)'}><input class="input" type="number" min="0" max=${esc === 'pct' ? 100 : 10} step="0.1" value=${o.nota_geral ?? ''} onInput=${e => set('nota_geral', e.target.value)} /></${Field}>`}`}
      ${!o.ja_fez && html`<p class="muted">Sem problema! Depois de alguns simulados aqui, a plataforma estima a sua nota e o plano se ajusta.</p>`}
    </section>`}

    ${passo === 4 && html`<section class="card pad col" style="gap:14px">
      <${Field} label=${esc === 'enem' ? 'Nota de corte que você quer alcançar (média do ENEM)' : esc === 'pct' ? 'Percentual de acertos que você quer alcançar' : 'Média que você quer alcançar'}
        hint=${esc === 'enem' ? (corteRef ? `Referência aproximada para ${o.curso}: ${corteRef}. Confira a nota de corte do último SISU no site oficial e, se quiser, digite o valor exato.` : 'Confira a nota de corte do curso no último SISU e digite aqui.') : esc === 'pct' ? 'Em muitos concursos, ficar acima de 70% de acertos já é competitivo. Confira o edital.' : 'Ex.: 7'}>
        <input class="input" type="number" min="0" max=${esc === 'enem' ? 1000 : esc === 'pct' ? 100 : 10} step=${esc === 'media' ? 0.1 : 1} value=${o.meta ?? corteRef ?? ''} onInput=${e => setO(x => ({ ...x, meta: e.target.value, meta_fonte: 'informada' }))} /></${Field}>
      <p class="small muted">As notas de corte mudam a cada ano, por curso, campus e tipo de vaga. A referência serve para orientar o estudo, não é garantia de aprovação.</p>
    </section>`}

    <div class="row between">
      ${passo > 0 ? html`<button class="btn ghost" onClick=${() => setPasso(p => p - 1)}>← Voltar</button>` : html`<button class="btn ghost" onClick=${() => { try { localStorage.setItem(PULOU, String(Date.now())); } catch {} go('inicio'); }}>Responder depois</button>`}
      ${passo < PASSOS.length - 1 ? html`<button class="btn primary" onClick=${proximo}>Continuar →</button>` : html`<button class="btn primary" onClick=${salvar}>Ver meu plano ✨</button>`}
    </div>
  </div>`;
}

function Plano({ o, onEditar }) {
  const [dados, setDados] = useState(null);
  useEffect(() => { (async () => {
    const cat = await catalog();
    const answers = await store.all('answers');
    const acc = accuracy(answers, cat.questions, cat.subjects, cat.topics).bySubject;
    const sims = (await store.all('exam_attempts')).filter(a => a.finished_at).sort((a, b) => b.finished_at.localeCompare(a.finished_at));
    let ultimoSim = null;
    for (const a of sims.slice(0, 20)) { const n = await store.meta.get('tri:' + a.id, null); if (n) { ultimoSim = { nota: n, em: a.finished_at }; break; } }
    setDados({ cat, acc, ultimoSim });
  })(); }, []);
  const plano = useMemo(() => dados && montarPlano(o, dados.acc), [dados, o]);
  if (!plano) return html`<${Loading} />`;
  const esc = plano.escala;
  const nomeBanca = n => dados.cat.boards.find(b => b.name === n);
  const bancas = o.tipo === 'concurso' ? (CONCURSOS.find(c => c.nome === o.prova)?.banca || []) : o.tipo === 'vestibular' ? [VESTIBULARES.find(v => v.nome === o.prova)?.banca].filter(Boolean) : ['INEP (ENEM)'];
  const atalhos = bancas.map(nomeBanca).filter(Boolean);
  const pct = plano.meta && plano.atual != null ? Math.min(100, Math.round(plano.atual / plano.meta * 100)) : null;
  const montar = async () => {
    const blocos = montarCronograma({ edital: editalDoPlano(plano), dias: [0, 1, 2, 3, 4, 5], inicio: '19:00', horas: Math.max(1, Math.round(plano.horas / 6 * 2) / 2), bloco: 50, materias: dados.cat.subjects });
    for (const t of (await store.all('plan_tasks')).filter(t => t.auto)) await store.remove('plan_tasks', t.id);
    for (const b of blocos) await store.put('plan_tasks', { ...b, done_on: null, auto: true });
    registrar('objetivo.cronograma', o.tipo, { blocos: blocos.length });
    toast(`Cronograma montado: ${blocos.length} blocos na semana`); go('cronograma');
  };

  return html`<div class="col fade-in" style="gap:18px">
    <${PageHead} eyebrow="Meu objetivo" title=${[o.prova || TIPOS[o.tipo]?.nome, o.curso].filter(Boolean).join(' · ')} actions=${html`<button class="btn" onClick=${onEditar}>✏️ Mudar respostas</button>`}>
      ${o.instituicao ? o.instituicao + '. ' : ''}${plano.semanas ? `Faltam ${plano.semanas} semana${plano.semanas > 1 ? 's' : ''} para a prova.` : 'Coloque a data da prova para ver o ritmo semanal.'}</${PageHead}>

    <div class="grid g3">
      <div class="card pad row" style="gap:14px"><${Ring} value=${pct || 0} label="Caminho até a meta">${pct != null ? pct + '%' : '–'}</${Ring}><div><span class="small muted">Caminho até a meta</span><br /><b style="font-size:20px">${fmt(plano.atual, esc)} → ${fmt(plano.meta, esc)}</b><br /><span class="small muted">${plano.falta == null ? (plano.meta == null ? 'Defina a sua meta' : 'Faça um simulado para medir a nota atual') : plano.falta === 0 ? 'Meta alcançada!' : `faltam ${fmt(plano.falta, esc)} ${plano.unidade}`}</span></div></div>
      <div class="card pad"><span class="small muted">Ritmo necessário</span><br /><b style="font-size:20px">${plano.porSemana != null ? `+${fmt(plano.porSemana, esc)} por semana` : '–'}</b><br /><span class="small muted">${plano.horas} horas de estudo por semana</span></div>
      <div class="card pad"><span class="small muted">Último simulado aqui</span><br /><b style="font-size:20px">${dados.ultimoSim ? dados.ultimoSim.nota : '–'}</b><br /><span class="small muted">${dados.ultimoSim ? 'nota estimada estilo TRI' : 'Ainda não fez simulado'}</span></div>
    </div>

    ${plano.fraquezas.length > 0 && html`<section class="card pad col" style="gap:10px"><h3>Onde ganhar mais pontos</h3>
      ${plano.fraquezas.map(f => html`<div><div class="row between small"><b>${f.area}</b><span>${f.nota} · faltam ${f.falta} pontos</span></div><${Bar} value=${f.nota} max=${plano.meta || 1000} /></div>`)}</section>`}

    <section class="card pad col" style="gap:10px"><h3>Plano da semana</h3>
      <div class="col" style="gap:8px">${plano.distrib.map(d => {
        const s = dados.cat.subjects.find(x => x.name === d.materia);
        const a = dados.acc[d.materia];
        return html`<div class="row between wrap" style="gap:8px"><span><b>${d.materia}</b>${(o.dificuldades || []).includes(d.materia) ? html` <span class="chip warn">dificuldade</span>` : ''}${a && a.n >= 5 ? html` <span class="small muted">· ${Math.round(a.ok / a.n * 100)}% de acerto aqui</span>` : ''}</span>
          <span class="row" style="gap:8px"><span class="small">${String(d.horas).replace('.', ',')} h/semana</span>${s && html`<button class="btn sm" onClick=${() => go('questoes', 'materia', s.id)}>Praticar</button>`}</span></div>`;
      })}</div>
      <div class="row wrap" style="gap:8px;margin-top:6px"><button class="btn primary" onClick=${montar}>🗓️ Montar meu cronograma com este plano</button>
        ${atalhos.map(b => html`<button class="btn" onClick=${() => go('questoes', 'banca', b.id)}>🎯 Questões: ${b.name.replace(/^Estilo /, '')}</button>`)}</div></section>

    <section class="card pad col" style="gap:8px"><h3>Passo a passo</h3><ol class="col" style="gap:6px;padding-left:20px">${plano.passos.map(p => html`<li>${p}</li>`)}</ol>
      <p class="small muted">${esc === 'enem' ? 'Nota de corte: referência aproximada. Confira o valor do último SISU para o seu curso e campus.' : 'Confira sempre o edital oficial da prova.'}</p></section>
  </div>`;
}

export default function Objetivo({ params = [] }) {
  const [o, setO] = useState(objetivoSalvo);
  const [editar, setEditar] = useState(!o || params[0] === 'editar');
  if (editar || !o) return html`<${Assistente} inicial=${o} onFim=${n => { setO(n); setEditar(false); history.replaceState(null, '', '#objetivo'); }} />`;
  return html`<${Plano} o=${o} onEditar=${() => setEditar(true)} />`;
}
