// Início: continuar de onde parou, metas do dia, revisões pendentes e trilha sugerida.
import { html, setHTML, actions, fmtMin, dayKey, plural } from '../core/util.js';
import { icon } from '../core/icones.js';
import * as store from '../core/store.js';
import * as auth from '../core/auth.js';
import * as aparencia from '../core/aparencia.js';
import { catalog } from '../core/conteudo.js';
import { goalProgress, GOAL_KINDS, dueCount, minutesByDay } from '../lib/stats.js';
import { configured } from '../core/backend.js';

const TRILHAS = {
  concurso: ['Concursos', [['Base', 'Língua Portuguesa: interpretação e gramática'], ['Base', 'Raciocínio lógico e matemática'], ['Específica', 'Direito Constitucional e Administrativo'], ['Prática', 'Simulado semanal no estilo da banca'], ['Revisão', 'Flashcards de leis e prazos']]],
  enem: ['ENEM e vestibular', [['Linguagens', 'Interpretação de texto e redação'], ['Matemática', 'Porcentagem, funções e geometria'], ['Natureza', 'Biologia, física e química'], ['Humanas', 'História do Brasil e geografia'], ['Prática', 'Um simulado por semana e uma redação']]],
  medio: ['Ensino médio', [['1º ano', 'Funções, cinemática e citologia'], ['2º ano', 'Trigonometria, termologia e genética'], ['3º ano', 'Revisão geral e preparação para o ENEM'], ['Sempre', 'Leitura e produção de texto'], ['Revisão', 'Flashcards antes das provas']]],
  fundamental: ['Ensino fundamental', [['Português', 'Leitura, ortografia e classes de palavras'], ['Matemática', 'Frações, porcentagem e equações'], ['Ciências', 'Corpo humano, ecologia e matéria'], ['História e Geografia', 'Brasil e o mundo'], ['Hábito', '25 minutos de estudo por dia com o timer']]]
};
const TOOLS = [
  ['questoes', 'Banco de questões', 'Filtre por matéria, conteúdo, nível e banca. Peça uma dica e veja a resolução.'],
  ['flashcards', 'Flashcards', 'Revisão espaçada: cada cartão volta no dia certo.'],
  ['plano', 'Plano e metas', 'Cronograma da semana e metas de estudo.'],
  ['foco', 'Timer de foco', 'Blocos de estudo com pausas (Pomodoro).'],
  ['anotacoes', 'Anotações', 'Resumos salvos automaticamente.'],
  ['desempenho', 'Desempenho', 'Gráficos de evolução, acertos por matéria e frequência.']
];
const VIEW_NAMES = { questoes: 'Questões', flashcards: 'Flashcards', plano: 'Plano e metas', foco: 'Foco', anotacoes: 'Anotações', desempenho: 'Desempenho', materiais: 'Materiais' };

export default {
  title: 'Início',
  async render(el, params, ctx) {
    const draw = async () => {
      const [cards, goals, sessions, answers, reviews, attempts, cat] = await Promise.all([
        store.all('flashcards'), store.all('goals'), store.all('study_sessions'), store.all('answers'), store.all('flashcard_reviews'), store.all('exam_attempts'), catalog()]);
      const s = aparencia.settings();
      const perfil = auth.state.profile?.study_profile || (await store.meta.get('study_profile')) || 'enem';
      const name = auth.state.profile?.display_name;
      const due = dueCount(cards);
      const todayMin = Math.round(minutesByDay(sessions)[dayKey()] || 0);
      const goalList = goals.filter(g => g.active !== false);
      if (!goalList.length) goalList.push({ kind: 'daily_focus_minutes', target: s.daily_goal_min || 60, _default: true });
      const openAttempt = attempts.filter(a => !a.finished_at).sort((a, b) => b.started_at.localeCompare(a.started_at))[0];
      const lastAns = answers.sort((a, b) => b.answered_at.localeCompare(a.answered_at))[0];
      const lastQ = lastAns && cat.question(lastAns.question_id);
      const sections = (s.home_sections?.length ? s.home_sections : aparencia.DEFAULTS.home_sections);
      const totalAns = answers.length, ok = answers.filter(a => a.is_correct).length;

      const blocks = {
        continuar: html`<div class="card stack"><h3>Continuar de onde parou</h3>
          ${openAttempt ? html`<a class="item-btn" href="${openAttempt.assignment_id ? `#questoes/lista/${openAttempt.assignment_id}` : `#questoes/simulado/${openAttempt.id}`}"><span><b>${openAttempt.assignment_id ? 'Lista do professor em andamento' : 'Simulado em andamento'}</b><span class="muted small">Começou em ${new Date(openAttempt.started_at).toLocaleString('pt-BR')}</span></span><span class="chip on">Continuar</span></a>` : ''}
          ${due ? html`<a class="item-btn" href="#flashcards"><span><b>${plural(due, 'flashcard para revisar', 'flashcards para revisar')}</b><span class="muted small">Revise agora para não esquecer</span></span><span class="chip on">Revisar</span></a>` : ''}
          ${lastQ ? html`<a class="item-btn" href="#questoes"><span><b>Última questão: ${cat.subject(lastQ.subject_id)?.name || ''}</b><span class="muted small">${lastQ.statement.slice(0, 90)}${lastQ.statement.length > 90 ? '…' : ''}</span></span><span class="chip">Mais questões</span></a>` : ''}
          ${s.last_view && VIEW_NAMES[s.last_view] ? html`<a class="item-btn" href="#${s.last_view}"><span><b>Voltar para ${VIEW_NAMES[s.last_view]}</b><span class="muted small">Última tela que você usou</span></span><span class="chip">Abrir</span></a>` : ''}
          ${!openAttempt && !due && !lastQ && !s.last_view ? html`<p class="muted">Comece pelo banco de questões ou pelos flashcards. Tudo o que você fizer fica salvo.</p><div><a class="btn" href="#questoes">Resolver questões</a></div>` : ''}</div>`,
        metas: html`<div class="card stack"><div class="row between"><h3>Metas</h3><a class="btn ghost sm" href="#plano/metas">Ajustar</a></div>
          ${goalList.map(g => { const p = goalProgress(g, { sessions, answers, reviews }); const v = Math.min(100, Math.round(p.value / p.target * 100)); return html`<div><div class="row between small"><span>${GOAL_KINDS[g.kind]?.name || g.kind}</span><span class="num muted">${p.value}${p.unit || ''} de ${p.target}${p.unit || ''}</span></div><div class="bar lg"><i style="width:${v}%;${v >= 100 ? 'background:var(--good)' : ''}"></i></div></div>`; })}
          ${goalList[0]?._default ? html`<p class="muted small">Meta padrão. Crie as suas em Plano e metas.</p>` : ''}</div>`,
        revisoes: html`<div class="grid g4">
          <div class="card stat"><div class="v num">${fmtMin(todayMin)}</div><div class="k">estudados hoje</div></div>
          <div class="card stat"><div class="v num">${due}</div><div class="k">flashcards para revisar</div></div>
          <div class="card stat"><div class="v num">${totalAns}</div><div class="k">questões respondidas</div></div>
          <div class="card stat"><div class="v num">${totalAns ? Math.round(ok / totalAns * 100) + '%' : '–'}</div><div class="k">taxa de acerto</div></div></div>`,
        trilha: html`<div class="card"><h3>Trilha sugerida: ${TRILHAS[perfil]?.[0]}</h3><p class="muted small">Um ponto de partida. Monte seu cronograma em Plano e metas.</p>
          <ul class="list" style="list-style:none;padding:0;margin:8px 0 0">${TRILHAS[perfil]?.[1].map(([t, d]) => html`<li class="row" style="gap:10px;align-items:baseline"><span class="small" style="font-weight:700;color:var(--brand);min-width:84px">${t}</span><span>${d}</span></li>`)}</ul></div>`,
        ferramentas: html`<div class="stack"><h2>Suas ferramentas</h2><div class="grid g3">${TOOLS.map(([v, n, d]) => html`<a class="card tool" href="#${v}"><span class="ic">${icon(v)}</span><h3>${n}</h3><p>${d}</p></a>`)}</div></div>`
      };

      setHTML(el, html`<div class="stack" style="gap:calc(var(--gap) + 6px)">
        <div class="hero">
          <span class="eyebrow" style="color:var(--mark)">${name ? `Olá, ${name}` : 'Bem-vindo à Educa Mais'}</span>
          <h1>Tudo o que você precisa para estudar, <span class="hl">num só lugar</span>.</h1>
          <p>Questões com resolução, flashcards inteligentes, metas e desempenho. Funciona mesmo sem internet.</p>
          <div><div class="small" style="font-weight:700;margin-bottom:8px;position:relative;z-index:1">Eu estudo para:</div>
          <div class="pills">${Object.entries(TRILHAS).map(([k, [n]]) => html`<button type="button" data-action="perfil" data-p="${k}" aria-pressed="${k === perfil}">${n}</button>`)}</div></div>
          ${configured && !auth.isLogged() ? html`<div class="row" style="position:relative;z-index:1"><a class="btn mark" href="#entrar">Criar conta grátis e salvar na nuvem</a></div>` : ''}
        </div>
        ${sections.filter(k => blocks[k]).map(k => blocks[k])}
      </div>`);
    };
    actions(el, {
      async perfil(b) {
        const p = b.dataset.p;
        await store.meta.set('study_profile', p);
        if (auth.isLogged()) {
          const { sb } = await import('../core/backend.js');
          await sb.from('profiles').update({ study_profile: p }).eq('id', auth.state.user.id).then(() => auth.loadProfile()).catch(() => {});
        }
        draw();
      }
    });
    await draw();
    const off = (await import('../core/bus.js')).on('store:change', () => draw());
    return off;
  }
};
