// Redação: temas no estilo ENEM, folha de 30 linhas com cronômetro de 1 hora, contagem de linhas
// e lista das 5 competências. O texto fica guardado neste aparelho.
import { html, useState, useEffect, useRef, useApp, go, PageHead, Modal, Bar, toast } from '../ui.js';
import * as store from '../../core/store.js';
import { TEMAS } from '../../views/redacao.js';
import * as auth from '../../core/auth.js';

const COMP = [
  ['Norma-padrão', 'Ortografia, acentuação, concordância e pontuação.'],
  ['Tema e repertório', 'Entender a proposta e trazer conhecimento de várias áreas, no formato dissertativo-argumentativo.'],
  ['Argumentação', 'Selecionar e organizar argumentos em defesa de um ponto de vista.'],
  ['Coesão', 'Usar bem os conectivos para ligar frases e parágrafos.'],
  ['Proposta de intervenção', 'Agente, ação, meio, efeito e detalhamento, respeitando os direitos humanos.']
];
const CONECTIVOS = ['Além disso', 'Nesse sentido', 'Desse modo', 'Por conseguinte', 'Em contrapartida', 'Ademais', 'Sob essa ótica', 'Portanto', 'Dessa forma', 'Em síntese'];
const linhas = txt => txt.split('\n').reduce((n, l) => n + Math.max(1, Math.ceil(l.length / 75)), 0);

function Folha({ tema, onClose }) {
  const key = 'redacao:' + tema;
  const [txt, setTxt] = useState('');
  const [t0, setT0] = useState(null);
  const [, tick] = useState(0);
  const [check, setCheck] = useState([]);
  const sv = useRef(null);
  useEffect(() => { store.meta.get(key, null).then(r => { if (r) { setTxt(r.txt || ''); setCheck(r.check || []); } }); const i = setInterval(() => tick(x => x + 1), 1000); return () => clearInterval(i); }, []);
  const save = (v, c = check) => { clearTimeout(sv.current); sv.current = setTimeout(() => store.meta.set(key, { txt: v, check: c, at: Date.now() }), 500); };
  const n = txt.trim() ? linhas(txt) : 0;
  const el = t0 ? Math.floor((Date.now() - t0) / 1000) : 0;
  const rest = Math.max(0, 3600 - el);
  const finish = async () => {
    if (t0 && el > 60) await store.append('study_sessions', { kind: 'leitura', subject: 'Redação', started_at: new Date(t0).toISOString(), duration_sec: Math.min(el, 4 * 3600) });
    toast('Redação guardada neste aparelho.'); onClose();
  };
  const conectivos = CONECTIVOS.filter(c => txt.toLowerCase().includes(c.toLowerCase())).length;
  return html`<div class="col fade-in" style="gap:14px;max-width:980px;margin:0 auto">
    <div class="card pad row wrap between" style="position:sticky;top:64px;z-index:5">
      <div class="row"><button class="btn ghost sm" onClick=${finish}>✕ Sair</button><span class=${'chip num ' + (n > 30 ? 'danger' : n >= 7 ? 'ok' : '')}>${n}/30 linhas</span><span class="chip num">${txt.trim() ? txt.trim().split(/\s+/).length : 0} palavras</span></div>
      <div class="row">${t0 ? html`<span class=${'chip num ' + (rest < 600 ? 'danger' : 'accent')}>⏱ ${String(Math.floor(rest / 60)).padStart(2, '0')}:${String(rest % 60).padStart(2, '0')}</span>` : html`<button class="btn sm primary" onClick=${() => setT0(Date.now())}>▶ Começar 1 hora</button>`}<button class="btn sm" onClick=${finish}>Terminar</button></div></div>
    <div class="split-r">
      <div class="card pad col"><span class="eyebrow">Tema</span><h3 class="display" style="font-size:20px">${tema}</h3>
        <textarea class="input redacao-paper" placeholder="Comece pela introdução: apresente o tema e a sua tese…" value=${txt} onInput=${e => { setTxt(e.target.value); save(e.target.value); if (!t0) setT0(Date.now()); }}></textarea>
        <p class="tiny faint">Mínimo de 7 linhas e máximo de 30, como no ENEM (contagem aproximada: 75 letras por linha).</p></div>
      <aside class="col" style="gap:12px">
        <div class="card pad col"><b>Antes de entregar, confira</b>${COMP.map(([c, dd], i) => html`<label class="check" style="align-items:flex-start"><input type="checkbox" checked=${check.includes(i)} onChange=${() => { const c2 = check.includes(i) ? check.filter(x => x !== i) : [...check, i]; setCheck(c2); save(txt, c2); }} /><span><b>${i + 1}. ${c}</b><br /><span class="tiny muted">${dd}</span></span></label>`)}
          <${Bar} value=${check.length} max=${5} /></div>
        <div class="card pad col"><b>Conectivos usados: ${conectivos}</b><div class="row wrap" style="gap:5px">${CONECTIVOS.map(c => html`<span class=${'chip ' + (txt.toLowerCase().includes(c.toLowerCase()) ? 'ok' : '')}>${c}</span>`)}</div></div>
        ${auth.isLogged() && html`<button class="btn" onClick=${() => go('duvidas')}>💬 Pedir ajuda ao professor</button>`}
      </aside></div></div>`;
}

export default function Redacao() {
  const app = useApp();
  const [folha, setFolha] = useState(null);
  if (folha) return html`<${Folha} tema=${folha} onClose=${() => setFolha(null)} />`;
  const sortear = () => { const t = TEMAS[Math.floor(Math.random() * TEMAS.length)]; app.setModal(html`<${Modal} title="Tema sorteado" icon="🎲" onClose=${() => app.setModal(null)} foot=${html`<button class="btn" onClick=${() => { app.setModal(null); sortear(); }}>Sortear outro</button><button class="btn primary" onClick=${() => { app.setModal(null); setFolha(t[0]); }}>✍️ Escrever agora</button>`}><span class="chip accent">${t[1]}</span><h2>${t[0]}</h2><ul>${t[2].map(p => html`<li>${p}</li>`)}</ul></${Modal}>`); };
  return html`<div class="col fade-in" style="gap:20px">
    <${PageHead} eyebrow="Redação ENEM" title="Redação" actions=${html`<button class="btn primary" onClick=${sortear}>🎲 Sortear um tema</button>`}>${TEMAS.length} propostas no estilo do ENEM. Escreva na folha com cronômetro de 1 hora, contagem de linhas e checklist das competências.</${PageHead}>
    <section class="card pad col"><h3>O que a banca avalia (5 competências, 200 pontos cada)</h3><div class="grid g2">${COMP.map(([c, dd], i) => html`<div class="row top"><span class="level-badge" style="width:36px;height:36px;font-size:16px;border-radius:10px">${i + 1}</span><div><b>${c}</b><div class="small muted">${dd}</div></div></div>`)}</div></section>
    <div class="grid feature-grid">${TEMAS.map(([t, eixo, pergs]) => html`<button class="card mode" onClick=${() => setFolha(t)}><span class="chip">${eixo}</span><h3 style="font-size:17px">${t}</h3><ul class="small muted" style="margin:0;padding-left:18px">${pergs.map(p => html`<li>${p}</li>`)}</ul><span class="small" style="color:var(--accent)">✍️ Escrever</span></button>`)}</div>
  </div>`;
}
