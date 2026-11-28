// Progresso: visão geral, horas por mês com cada sessão, acerto por matéria, simulados e conquistas.
import { html, useState, useData, go, PageHead, Tabs, Stat, Bar, Empty, subjectIcon } from '../ui.js';
import * as store from '../../core/store.js';
import { catalog } from '../../core/conteudo.js';
import { columns, heatmap, line } from '../../lib/graficos.js';
import { accuracy, minutesByDay, lastDays, weakTopics } from '../../lib/stats.js';
import { fmtMin, fmtDateTime, pct, dayKey, weekStart, DAY } from '../../core/util.js';
import { xpTotal, level, streakOf, achievements } from '../jogo.js';
import { stage } from '../../lib/srs.js';

const Raw = ({ v, cls }) => html`<div class=${cls} dangerouslySetInnerHTML=${{ __html: String(v) }}></div>`;
const MESES = ['jan', 'fev', 'mar', 'abr', 'mai', 'jun', 'jul', 'ago', 'set', 'out', 'nov', 'dez'];
const mesKey = d => { const x = new Date(d); return `${x.getFullYear()}-${String(x.getMonth() + 1).padStart(2, '0')}`; };
const mesNome = k => { const [y, m] = k.split('-'); return `${MESES[+m - 1]}/${y}`; };
const KIND = { foco: 'Sala de foco', questoes: 'Questões', revisao: 'Flashcards', leitura: 'Leitura' };

async function carregar() {
  const [cat, answers, reviews, sessions, lessons, attempts, cards] = await Promise.all([catalog(), store.all('answers'), store.all('flashcard_reviews'), store.all('study_sessions'), store.all('lesson_progress'), store.all('exam_attempts'), store.all('flashcards')]);
  const feitos = attempts.filter(a => a.finished_at).sort((a, b) => b.finished_at.localeCompare(a.finished_at));
  const notas = await Promise.all(feitos.map(a => store.meta.get('tri:' + a.id, null)));
  return { cat, answers, reviews, sessions, lessons, attempts, cards, feitos, notas };
}

export default function Progresso({ params = [] }) {
  const [tab, setTab] = useState(['geral', 'horas', 'materias', 'simulados', 'conquistas'].includes(params[0]) ? params[0] : 'geral');
  const [mes, setMes] = useState(mesKey(new Date()));
  const [d] = useData(carregar, [], ['answers', 'flashcard_reviews', 'study_sessions', 'lesson_progress', 'exam_attempts', 'flashcards']);
  if (!d) return html`<div class="skeleton" style="height:300px"></div>`;
  const xp = xpTotal(d), lv = level(xp), st = streakOf(d), ach = achievements(d);
  const ok = d.answers.filter(a => a.is_correct).length;
  const totalMin = d.sessions.reduce((t, s) => t + s.duration_sec, 0) / 60;
  const setT = k => { setTab(k); history.replaceState(null, '', '#progresso/' + k); };
  let body;
  if (tab === 'geral') {
    // 26 semanas, começando numa segunda
    const start = new Date(weekStart().getTime() - 25 * 7 * DAY);
    const mpd = minutesByDay(d.sessions);
    const days = []; for (let t = start.getTime(); t <= Date.now(); t += DAY) { const k = dayKey(new Date(t)); days.push({ key: k, value: (mpd[k] || 0) + d.answers.filter(a => dayKey(a.answered_at) === k).length * 0.0001 }); }
    const sem = []; for (let i = 11; i >= 0; i--) { const a = weekStart().getTime() - i * 7 * DAY, b = a + 7 * DAY; const as = d.answers.filter(x => { const t = new Date(x.answered_at).getTime(); return t >= a && t < b; }); sem.push({ label: i ? `-${i}` : 'agora', value: as.length ? pct(as.filter(x => x.is_correct).length, as.length) : null }); }
    const last14 = lastDays(14);
    body = html`<div class="stats"><${Stat} icon="⭐" v=${lv.L} k=${'nível · ' + lv.title} /><${Stat} icon="✨" v=${xp.toLocaleString('pt-BR')} k="XP total" /><${Stat} icon="🔥" v=${st} k="dias seguidos" /><${Stat} icon="⏳" v=${fmtMin(totalMin)} k="estudados no total" /><${Stat} icon="✏️" v=${d.answers.length.toLocaleString('pt-BR')} k="questões respondidas" /><${Stat} icon="🎯" v=${d.answers.length ? pct(ok, d.answers.length) + '%' : '–'} k="de acerto" /></div>
      <section class="card pad col"><h3>Dias de estudo (últimos 6 meses)</h3><${Raw} v=${heatmap(days)} /><p class="tiny faint">Quanto mais forte a cor, mais minutos estudados no dia.</p></section>
      <div class="grid g2"><section class="card pad col"><h3>Minutos por dia (14 dias)</h3><${Raw} v=${columns(last14.map(k => ({ label: k.slice(8), value: Math.round(mpd[k] || 0) })), { unit: ' min', color: 'var(--accent)' })} /></section>
        <section class="card pad col"><h3>Acerto por semana</h3><${Raw} v=${line(sem)} /></section></div>`;
  } else if (tab === 'horas') {
    const porMes = {}; for (const s of d.sessions) porMes[mesKey(s.started_at)] = (porMes[mesKey(s.started_at)] || 0) + s.duration_sec / 60;
    const ult = []; const now = new Date(); for (let i = 11; i >= 0; i--) ult.push(mesKey(new Date(now.getFullYear(), now.getMonth() - i, 1)));
    const doMes = d.sessions.filter(s => mesKey(s.started_at) === mes).sort((a, b) => b.started_at.localeCompare(a.started_at));
    const por = {}; doMes.forEach(s => { const k = s.subject || KIND[s.kind] || 'Outros'; por[k] = (por[k] || 0) + s.duration_sec / 60; });
    const tm = doMes.reduce((a, s) => a + s.duration_sec / 60, 0);
    body = html`<div class="stats"><${Stat} v=${fmtMin(tm)} k=${'em ' + mesNome(mes)} /><${Stat} v=${new Set(doMes.map(s => dayKey(s.started_at))).size} k="dias com estudo no mês" /><${Stat} v=${fmtMin(totalMin)} k="desde o início" /></div>
      <section class="card pad col"><div class="row wrap between"><h3>Horas por mês</h3><select class="input" style="width:auto" value=${mes} onChange=${e => setMes(e.target.value)}>${ult.slice().reverse().map(k => html`<option value=${k}>${mesNome(k)} · ${fmtMin(porMes[k] || 0)}</option>`)}</select></div>
        <${Raw} v=${columns(ult.map(k => ({ label: mesNome(k).slice(0, 3), value: Math.round((porMes[k] || 0) / 6) / 10 })), { unit: ' h', color: 'var(--accent)' })} /></section>
      ${Object.keys(por).length > 0 && html`<section class="card pad col"><h3>O que você estudou em ${mesNome(mes)}</h3>${Object.entries(por).sort((a, b) => b[1] - a[1]).map(([k, v]) => html`<div class="hbar"><div class="row between small"><span>${k}</span><span class="num muted">${fmtMin(v)} · ${pct(v, tm)}%</span></div><${Bar} value=${v} max=${tm} /></div>`)}</section>`}
      <section class="card pad col"><h3>Registro de cada sessão</h3>${doMes.length ? html`<div class="table-wrap"><table class="t"><thead><tr><th>Quando começou</th><th>Matéria</th><th>Como</th><th>Duração</th></tr></thead><tbody>${doMes.map(s => html`<tr><td class="num">${fmtDateTime(s.started_at)}</td><td>${s.subject || '–'}</td><td>${KIND[s.kind] || s.kind}</td><td class="num">${fmtMin(s.duration_sec / 60)}</td></tr>`)}</tbody></table></div>` : html`<p class="small muted">Nenhuma sessão neste mês. Use a Sala de foco, faça questões ou revise flashcards e tudo é registrado aqui.</p>`}</section>`;
  } else if (tab === 'materias') {
    const acc = accuracy(d.answers, d.cat.questions, d.cat.subjects, d.cat.topics);
    const fr = weakTopics(acc.byTopic).slice(0, 8);
    body = html`<section class="card pad col"><h3>Acerto por matéria</h3>${Object.keys(acc.bySubject).length ? Object.entries(acc.bySubject).sort((a, b) => b[1].n - a[1].n).map(([k, v]) => html`<div class="hbar"><div class="row between small"><span>${subjectIcon(k)} ${k}</span><span class="num muted">${pct(v.ok, v.n)}% · ${v.ok}/${v.n}</span></div><${Bar} value=${v.ok} max=${v.n} ok=${v.ok / v.n >= 0.7} /></div>`) : html`<p class="small muted">Responda algumas questões para ver o seu acerto.</p>`}</section>
      ${fr.length > 0 && html`<section class="card pad col"><h3>Conteúdos com mais dificuldade</h3>${fr.map(t => html`<button class="card qitem" style="padding:10px 14px" onClick=${() => go('questoes', 'conteudo', t.id)}><span class="grow"><b>${t.name}</b><div class="tiny muted">${t.subject} · ${Math.round(t.rate * 100)}% em ${t.n} respostas</div></span><span class="btn sm">Treinar</span></button>`)}</section>`}
      <section class="card pad col"><h3>Flashcards</h3>${(() => { const s = { novo: 0, aprendendo: 0, dominado: 0 }; d.cards.forEach(c => s[stage(c)]++); return html`<div class="stats"><${Stat} v=${s.novo} k="novos" /><${Stat} v=${s.aprendendo} k="aprendendo" /><${Stat} v=${s.dominado} k="dominados" /><${Stat} v=${d.reviews.length ? pct(d.reviews.filter(r => r.rating >= 2).length, d.reviews.length) + '%' : '–'} k="lembrados nas revisões" /></div>`; })()}</section>`;
  } else if (tab === 'simulados') {
    const comNota = d.feitos.map((a, i) => ({ a, n: d.notas[i] })).filter(x => x.n).reverse().slice(-12);
    body = html`${comNota.length > 1 && html`<section class="card pad col"><h3>Evolução da nota estilo TRI</h3><${Raw} v=${columns(comNota.map(x => ({ label: new Date(x.a.finished_at).toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit' }), value: x.n })), { color: 'var(--accent)' })} /></section>`}
      <section class="card pad col"><h3>Simulados, desafios e listas</h3>${d.feitos.length ? html`<div class="table-wrap"><table class="t"><thead><tr><th>Quando</th><th>Nome</th><th>Acertos</th><th>Nota TRI</th></tr></thead><tbody>${d.feitos.map((a, i) => html`<tr><td class="num small">${fmtDateTime(a.finished_at)}</td><td>${a.title || 'Simulado'}</td><td class="num">${a.correct}/${a.total} (${pct(a.correct, a.total)}%)</td><td class="num">${d.notas[i] ?? '–'}</td></tr>`)}</tbody></table></div>` : html`<${Empty} icon="📝" title="Nenhum simulado ainda" action=${html`<button class="btn primary" onClick=${() => go('praticar')}>Fazer um simulado</button>`}>Faça um simulado para ver a nota estimada.</${Empty}>`}
        <p class="tiny faint">A nota estilo TRI é uma estimativa para treino, não a nota oficial.</p></section>`;
  } else {
    const on = ach.filter(a => a.on).length;
    body = html`<div class="card pad level"><div class="level-badge">${lv.L}</div><div class="grow"><div class="display bold" style="font-size:20px">Nível ${lv.L} · ${lv.title}</div><div class="mt" style="margin-top:8px"><${Bar} value=${lv.into} max=${lv.need} /></div><div class="tiny muted mt" style="margin-top:6px">${lv.into}/${lv.need} XP para o próximo nível · ${on} de ${ach.length} conquistas</div></div></div>
      <div class="grid ach-grid">${ach.map(a => html`<div class=${'card ach' + (a.on ? ' on' : '')} title=${a.desc}><div class="ic">${a.icon}</div><div class="grow"><div class="bold">${a.name}</div><div class="tiny muted">${a.desc}</div>${!a.on && html`<div class="mt" style="margin-top:6px"><${Bar} value=${a.progress * 100} /></div><div class="tiny faint">${a.v}/${a.target}</div>`}</div></div>`)}</div>
      <p class="tiny faint">Como ganhar XP: acerto 10, erro 3 (o esforço conta), revisão de flashcard 2, minuto na sala de foco 1, aula concluída 25, simulado 30, desafio do dia 40.</p>`;
  }
  return html`<div class="col fade-in" style="gap:18px">
    <${PageHead} eyebrow="Seus números" title="Progresso" actions=${html`<button class="btn" onClick=${() => go('cronograma')}>🗓️ Cronograma e metas</button>`}>Tudo calculado a partir do que você realmente estudou. Nada é inventado.</${PageHead}>
    <${Tabs} value=${tab} onChange=${setT} items=${[['geral', 'Visão geral'], ['horas', 'Horas de estudo'], ['materias', 'Matérias'], ['simulados', 'Simulados'], ['conquistas', 'Conquistas']]} />
    ${body}</div>`;
}
