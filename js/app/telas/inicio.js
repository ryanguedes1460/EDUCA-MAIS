// Início: painel do dia (nível, sequência, missões, prova, cronograma e o que reforçar).
import { html, useState, useApp, useData, go, Bar, Modal, Field, toast, subjectIcon } from '../ui.js';
import * as store from '../../core/store.js';
import * as aparencia from '../../core/aparencia.js';
import { catalog } from '../../core/conteudo.js';
import { dayKey, weekdayIdx, fmtMin, pct, DAY } from '../../core/util.js';
import { accuracy, weakTopics, inWeek } from '../../lib/stats.js';
import { isDue } from '../../lib/srs.js';
import { xpTotal, level, streakOf, missions } from '../jogo.js';

const saudacao = () => { const h = new Date().getHours(); return h < 5 ? 'Boa madrugada' : h < 12 ? 'Bom dia' : h < 18 ? 'Boa tarde' : 'Boa noite'; };
const FRASES = ['Um pouco todo dia vence muito de vez em quando.', 'Errar aqui é treino. Errar na prova é que não pode.', 'Quem revisa, lembra. Quem lembra, acerta.', 'Disciplina é lembrar do que você quer.', 'Hoje é um ótimo dia para subir de nível.', 'Pequenos passos, grandes aprovações.', 'Seu futuro agradece cada minuto de agora.'];

async function carregar() {
  const [cat, answers, reviews, sessions, lessons, attempts, cards, tasks, prova] = await Promise.all([
    catalog(), store.all('answers'), store.all('flashcard_reviews'), store.all('study_sessions'), store.all('lesson_progress'), store.all('exam_attempts'), store.all('flashcards'), store.all('plan_tasks'), store.meta.get('prova', null)
  ]);
  return { cat, answers, reviews, sessions, lessons, attempts, cards, tasks, prova };
}

function ProvaModal({ prova, onClose }) {
  const [nome, setNome] = useState(prova?.nome || 'ENEM');
  const [data, setData] = useState(prova?.data || '');
  return html`<${Modal} title="Contagem para a prova" icon="📅" onClose=${onClose} foot=${html`${prova && html`<button class="btn ghost" onClick=${async () => { await store.meta.set('prova', null); onClose(true); }}>Remover</button>`}<button class="btn primary" disabled=${!data} onClick=${async () => { await store.meta.set('prova', { nome: nome.trim() || 'Prova', data }); toast('Contagem salva'); onClose(true); }}>Salvar</button>`}>
    <p class="muted small">Coloque a data oficial da sua prova quando ela for divulgada. A contagem aparece no seu Início.</p>
    <${Field} label="Nome da prova"><input class="input" value=${nome} maxlength="40" onInput=${e => setNome(e.target.value)} /></${Field}>
    <${Field} label="Data do primeiro dia"><input class="input" type="date" value=${data} onInput=${e => setData(e.target.value)} /></${Field}>
  </${Modal}>`;
}

export default function Inicio() {
  const app = useApp();
  const [d, loading, , reload] = useData(carregar, [], ['answers', 'flashcard_reviews', 'study_sessions', 'lesson_progress', 'exam_attempts', 'flashcards', 'plan_tasks']);
  if (loading || !d) return html`<div class="col" style="gap:18px"><div class="card hero"><div class="skeleton" style="height:40px;width:60%"></div><div class="skeleton mt" style="height:18px;width:40%"></div></div></div>`;
  const s = aparencia.settings();
  const nome = (app.profile?.display_name || '').split(' ')[0];
  const xp = xpTotal({ answers: d.answers, reviews: d.reviews, sessions: d.sessions, lessons: d.lessons, attempts: d.attempts });
  const lv = level(xp);
  const st = streakOf(d);
  const ms = missions({ ...d }, s.daily_goal_min || 60);
  const feitas = ms.filter(m => m.done).length;
  const semana = d.sessions.filter(x => inWeek(x.started_at)).reduce((t, x) => t + x.duration_sec, 0) / 60;
  const okAll = d.answers.filter(a => a.is_correct).length;
  const due = d.cards.filter(c => isDue(c)).length;
  const hoje = d.tasks.filter(t => t.weekday === weekdayIdx()).sort((a, b) => a.start_time.localeCompare(b.start_time));
  const aberto = d.attempts.filter(a => !a.finished_at && a.filters?.ids && !a.assignment_id && !a.filters?.desafio).sort((a, b) => b.started_at.localeCompare(a.started_at))[0];
  const fracos = weakTopics(accuracy(d.answers, d.cat.questions, d.cat.subjects, d.cat.topics).byTopic).slice(0, 4);
  const dias = d.prova?.data ? Math.ceil((new Date(d.prova.data + 'T08:00:00') - new Date()) / DAY) : null;
  const frase = FRASES[new Date().getDate() % FRASES.length];
  const ult = s.last_view && !['inicio', 'perfil', 'conta'].includes(s.last_view) ? s.last_view : null;

  return html`<div class="col fade-in" style="gap:20px">
    <section class="card hero">
      <div class="row wrap between" style="gap:20px;align-items:flex-start">
        <div class="col" style="gap:6px;max-width:640px">
          <div class="chip accent" style="align-self:flex-start">✦ ${frase}</div>
          <h1>${saudacao()}${nome ? ', ' + nome : ''}!</h1>
          <p>${feitas === ms.length ? 'Todas as missões de hoje concluídas. Que dia! 🎉' : `Você tem ${ms.length - feitas} ${ms.length - feitas === 1 ? 'missão' : 'missões'} para hoje. Bora?`}</p>
          <div class="row wrap mt">
            <button class="btn primary" onClick=${() => go('desafio')}>🔥 Desafio do dia</button>
            ${aberto ? html`<button class="btn" onClick=${() => go('questoes', 'simulado', aberto.id)}>▶ Continuar simulado</button>` : ult ? html`<button class="btn" onClick=${() => go(ult)}>▶ Continuar de onde parou</button>` : html`<button class="btn" onClick=${() => go('questoes')}>✏️ Praticar questões</button>`}
            <button class="btn ghost" onClick=${() => go('foco')}>⏱️ Sala de foco</button>
          </div>
        </div>
        <div class="card pad" style="min-width:250px;flex:0 1 300px;background:var(--panel2)">
          <div class="level"><div class="level-badge">${lv.L}</div><div class="grow"><div class="small muted">Nível ${lv.L}</div><div class="display bold" style="font-size:19px">${lv.title}</div></div>
            <div class="center"><div class="streak">${st ? '🔥' : '🌱'}</div><div class="tiny muted"><b class="num" style="color:var(--text)">${st}</b> ${st === 1 ? 'dia' : 'dias'}</div></div></div>
          <div class="mt"><${Bar} value=${lv.into} max=${lv.need} /></div>
          <div class="row between tiny muted mt" style="margin-top:6px"><span class="num">${lv.into} / ${lv.need} XP</span><span>faltam ${lv.need - lv.into} para o nível ${lv.L + 1}</span></div>
        </div>
      </div>
      <div class="stat-row">
        <div><b class="num">${fmtMin(semana)}</b><span class="small muted">estudados nesta semana</span></div>
        <div><b class="num">${d.answers.length}</b><span class="small muted">questões respondidas</span></div>
        <div><b class="num">${d.answers.length ? pct(okAll, d.answers.length) + '%' : '–'}</b><span class="small muted">de acerto</span></div>
        <div><b class="num">${due}</b><span class="small muted">flashcards para hoje</span></div>
      </div>
    </section>

    <div class="home-grid">
      <section class="card pad">
        <div class="row between mb"><h2>Missões de hoje</h2><span class="chip accent num">${feitas}/${ms.length}</span></div>
        ${ms.map(m => html`<div class=${'mission' + (m.done ? ' done' : '')}><span class="check">${m.done ? '✓' : m.icon}</span><span class="t grow">${m.t}</span><span class="chip tiny">+${m.xp} XP</span>${!m.done && html`<button class="btn sm" onClick=${() => go(...m.go)}>Ir</button>`}</div>`)}
      </section>
      <div class="col" style="gap:18px">
        <section class="card pad" style="cursor:pointer" onClick=${() => app.setModal(html`<${ProvaModal} prova=${d.prova} onClose=${ch => { app.setModal(null); if (ch) reload(); }} />`)}>
          ${dias != null && dias >= 0 ? html`<div class="small muted">Faltam para o ${d.prova.nome}</div><div class="row" style="align-items:baseline;gap:8px"><span class="big-score num" style="font-size:52px">${dias}</span><span class="countdown">${dias === 1 ? 'dia' : 'dias'}</span></div><div class="tiny faint">${new Date(d.prova.data + 'T12:00:00').toLocaleDateString('pt-BR', { day: '2-digit', month: 'long', year: 'numeric' })} · toque para mudar</div>`
            : html`<div class="row"><span style="font-size:30px">📅</span><div><b>Quando é a sua prova?</b><div class="small muted">Coloque a data do ENEM, do vestibular ou da prova da escola e acompanhe a contagem.</div></div></div>`}
        </section>
        <section class="card pad">
          <div class="row between mb"><h3>Hoje no cronograma</h3><button class="btn ghost sm" onClick=${() => go('cronograma')}>Ver semana</button></div>
          ${hoje.length ? hoje.slice(0, 5).map(t => html`<div class="row small" style="padding:6px 0;border-bottom:1px solid var(--line)"><span class="num faint">${t.start_time}</span><span class="grow">${t.title}</span><span class="muted">${t.duration_min} min</span></div>`)
            : html`<p class="small muted">Nada marcado para hoje. <button class="linkbtn" onClick=${() => go('cronograma')}>Monte um cronograma automático</button> em 1 minuto.</p>`}
        </section>
      </div>
    </div>

    ${fracos.length > 0 && html`<section>
      <div class="row between mb"><h2>Vale reforçar</h2><button class="btn ghost sm" onClick=${() => go('erros')}>Caderno de erros</button></div>
      <div class="grid feature-grid">${fracos.map(t => html`<button class="card feature" onClick=${() => go('questoes', 'conteudo', t.id)}><div class="ic">${subjectIcon(t.subject)}</div><div class="grow"><div class="bold">${t.name}</div><div class="small muted">${t.subject} · ${Math.round(t.rate * 100)}% de acerto em ${t.n}</div><div class="mt" style="margin-top:8px"><${Bar} value=${t.rate * 100} /></div></div></button>`)}</div>
    </section>`}

    <section>
      <h2 class="mb">Tudo num lugar só</h2>
      <div class="grid feature-grid">
        ${[
          ['✏️', 'Banco de questões', `${d.cat.bank.length.toLocaleString('pt-BR')} questões em ${d.cat.boards.length} estilos de prova`, 'questoes'],
          ['📝', 'Simulados com nota TRI', 'Cronometrados, com nota estimada como no ENEM', 'praticar'],
          ['🃏', 'Flashcards inteligentes', 'Cada erro vira cartão e volta na hora certa', 'flashcards'],
          ['🎬', 'Aulas', 'Videoaulas liberadas pela professora', 'aulas'],
          ['✍️', 'Redação', 'Temas no estilo ENEM e folha com cronômetro', 'redacao'],
          ['🗓️', 'Cronograma automático', 'A plataforma monta a sua semana', 'cronograma'],
          ['📈', 'Progresso e conquistas', 'Horas por mês, acerto por matéria e medalhas', 'progresso'],
          ['💬', 'Fale conosco', 'Dúvidas para o professor, erros para o desenvolvedor', 'duvidas']
        ].map(([ic, a, b, v]) => html`<button class="card feature" onClick=${() => go(v)}><div class="ic">${ic}</div><div><div class="bold">${a}</div><div class="small muted">${b}</div></div></button>`)}
      </div>
    </section>
  </div>`;
}
