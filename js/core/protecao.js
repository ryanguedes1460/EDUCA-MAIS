// Proteção de aulas e materiais contra cópia.
// Limite honesto: num navegador NÃO é possível impedir print nem gravação de tela
// (o sistema do aparelho captura a imagem antes do site saber). O que fazemos aqui
// dificulta a cópia (cada abertura de aula e material também fica registrada no servidor):
//  - bloqueio de clique direito, seleção, copiar, arrastar e imprimir nas áreas protegidas;
//  - conteúdo escurece quando a janela perde o foco ou a tecla Print Screen é usada.
// Bloqueio real de print/gravação só existe em app nativo Android (FLAG_SECURE).

const root = document.documentElement;
let timer = null;
const dentro = e => e.target instanceof Element && e.target.closest('.protegido');
const temProtegido = () => !!document.querySelector('.protegido');
const esconder = (ms = 0) => {
  if (!temProtegido()) return;
  root.dataset.escondido = '1';
  clearTimeout(timer);
  if (ms) timer = setTimeout(mostrar, ms);
};
const mostrar = () => { if (document.visibilityState === 'visible' && document.hasFocus()) delete root.dataset.escondido; };

export function start() {
  for (const ev of ['contextmenu', 'copy', 'cut', 'dragstart', 'selectstart']) document.addEventListener(ev, e => { if (dentro(e)) e.preventDefault(); }, true);
  document.addEventListener('visibilitychange', () => { if (document.visibilityState !== 'visible') esconder(); else mostrar(); });
  window.addEventListener('blur', () => esconder());
  window.addEventListener('focus', () => setTimeout(mostrar, 150));
  document.addEventListener('keydown', e => {
    const k = (e.key || '').toLowerCase();
    if (!temProtegido()) return;
    if (k === 'printscreen' || (e.metaKey && e.shiftKey && ['3', '4', '5', 's'].includes(k)) || (e.key === 'Meta' && e.shiftKey)) { esconder(2500); limparArea(); }
    const campo = e.target instanceof Element && e.target.closest('input, textarea, select, [contenteditable]');
    if ((e.ctrlKey || e.metaKey) && (['p', 's'].includes(k) || (!campo && ['c', 'u'].includes(k)))) { e.preventDefault(); esconder(1200); }
  }, true);
  document.addEventListener('keyup', e => { if ((e.key || '').toLowerCase() === 'printscreen' && temProtegido()) { esconder(2500); limparArea(); } }, true);
  window.addEventListener('beforeprint', () => esconder());
  window.addEventListener('afterprint', () => setTimeout(mostrar, 300));
}

function limparArea() { try { navigator.clipboard?.writeText(' ').catch(() => {}); } catch { /* sem permissão */ } }

/** Marca um elemento como protegido (sem copiar, sem arrastar, escurece ao sair da janela). Devolve a função que desliga. */
export function proteger(el) {
  el.classList.add('protegido');
  return () => el.classList.remove('protegido');
}
