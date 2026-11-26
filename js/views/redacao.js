// Temas de redação no estilo ENEM (sem correção automática): propostas autorais
// com eixo, perguntas para pensar e lembretes das 5 competências.
import { html, setHTML, actions, toast } from '../core/util.js';

export const TEMAS = [
  ['Os desafios para combater a desinformação nas redes sociais no Brasil', 'Tecnologia e cidadania', ['Por que notícias falsas se espalham mais rápido?', 'Qual o papel das escolas, das plataformas e do governo?']],
  ['Caminhos para reduzir a evasão escolar entre jovens brasileiros', 'Educação', ['O que leva o jovem a abandonar a escola?', 'Que medidas mantêm o aluno estudando?']],
  ['A persistência da insegurança alimentar no Brasil do século XXI', 'Direitos sociais', ['Por que ainda há fome num grande produtor de alimentos?', 'Como garantir comida na mesa de todos?']],
  ['O impacto do uso excessivo de telas na saúde mental dos adolescentes', 'Saúde', ['Quais os sinais do uso excessivo?', 'Família, escola e plataformas: quem faz o quê?']],
  ['Desafios para a valorização da cultura dos povos indígenas no Brasil', 'Cultura e diversidade', ['Como a escola trata a história indígena?', 'O que preserva línguas e tradições?']],
  ['Os entraves para a acessibilidade das pessoas com deficiência nas cidades', 'Inclusão', ['Calçadas, transporte e prédios estão prontos?', 'Como fazer a lei sair do papel?']],
  ['A importância do saneamento básico para a saúde pública', 'Meio ambiente e saúde', ['Que doenças aparecem sem esgoto tratado?', 'Como acelerar as obras?']],
  ['Caminhos para combater a violência contra a mulher no Brasil', 'Direitos humanos', ['Por que muitas vítimas não denunciam?', 'Que rede de apoio funciona?']],
  ['O desafio de reduzir o desperdício de alimentos', 'Consumo consciente', ['Onde o alimento se perde: campo, mercado ou casa?', 'Que incentivos mudam esse quadro?']],
  ['A inteligência artificial no mercado de trabalho brasileiro', 'Tecnologia e trabalho', ['Que profissões mudam primeiro?', 'Como preparar os trabalhadores?']],
  ['Os efeitos das queimadas para o meio ambiente e a população', 'Meio ambiente', ['Quem é afetado pela fumaça?', 'Fiscalização, educação ambiental e alternativas no campo']],
  ['O envelhecimento da população e os desafios para o Brasil', 'Sociedade', ['Previdência, saúde e cuidado com idosos', 'Como incluir o idoso na vida social e digital?']],
  ['A importância da leitura na formação dos jovens', 'Educação e cultura', ['Por que se lê pouco no Brasil?', 'Bibliotecas, escolas e famílias como incentivo']],
  ['Desafios da mobilidade urbana nas grandes cidades brasileiras', 'Cidades', ['Transporte público, trânsito e tempo perdido', 'Bicicleta, metrô e planejamento urbano']],
  ['O combate ao trabalho infantil no Brasil', 'Direitos da criança', ['Por que ele ainda existe?', 'Escola em tempo integral e renda para as famílias']],
  ['A valorização do professor como caminho para a educação de qualidade', 'Educação', ['Salário, formação e condições de trabalho', 'Como atrair bons profissionais para a sala de aula?']],
  ['Os riscos das apostas on-line para os jovens e as famílias', 'Saúde e economia', ['Por que viciam?', 'Regras, propaganda e educação financeira']],
  ['Caminhos para enfrentar o racismo estrutural na sociedade brasileira', 'Direitos humanos', ['Onde o racismo aparece no dia a dia?', 'Educação antirracista e políticas públicas']],
  ['A gravidez na adolescência e seus impactos sociais', 'Saúde e educação', ['Consequências para os estudos e o trabalho', 'Educação sexual e acesso à saúde']],
  ['O lixo eletrônico e o descarte correto no Brasil', 'Meio ambiente', ['Por que celulares velhos viram problema?', 'Logística reversa e reciclagem']],
  ['A doação de órgãos e o desafio de aumentar os transplantes', 'Saúde', ['Por que as famílias recusam?', 'Informação e conversa em família']],
  ['A democratização do acesso à internet no Brasil', 'Tecnologia e cidadania', ['Quem ainda está desconectado?', 'Internet como direito para estudar e trabalhar']],
  ['Os desafios da saúde mental no ambiente de trabalho', 'Saúde e trabalho', ['Excesso de trabalho e esgotamento', 'Empresas, leis e apoio psicológico']],
  ['A preservação da água como responsabilidade coletiva', 'Meio ambiente', ['Crises hídricas e desperdício', 'Uso consciente na indústria, no campo e em casa']]
];
const COMP = ['Domínio da norma-padrão da língua escrita.', 'Compreender a proposta e usar repertório de várias áreas, no formato dissertativo-argumentativo.', 'Selecionar e organizar informações e argumentos em defesa de um ponto de vista.', 'Usar bem os conectivos (coesão) para ligar as partes do texto.', 'Propor intervenção detalhada: agente, ação, meio, efeito e detalhamento, respeitando os direitos humanos.'];

export default {
  title: 'Temas de redação',
  async render(el) {
    let sorteado = null;
    const draw = () => setHTML(el, html`<div class="stack" style="gap:var(--gap)">
      <div class="head"><div><span class="eyebrow">Redação ENEM</span><h1>Temas de redação</h1><p>${TEMAS.length} propostas no estilo do ENEM para você treinar. Escreva no papel, com 30 linhas e 1 hora, e depois peça ajuda à professora em "Tirar dúvidas".</p></div>
        <button class="btn" type="button" data-action="sortear">Sortear um tema</button></div>
      ${sorteado != null ? html`<div class="card stack" style="border:2px solid var(--brand)"><span class="eyebrow">Tema sorteado</span><h2>${TEMAS[sorteado][0]}</h2><p class="muted small">Eixo: ${TEMAS[sorteado][1]}</p><ul>${TEMAS[sorteado][2].map(p => html`<li>${p}</li>`)}</ul></div>` : ''}
      <section class="card stack"><h2>O que a banca avalia (5 competências, 200 pontos cada)</h2><ol>${COMP.map(c => html`<li>${c}</li>`)}</ol></section>
      <div class="grid g2">${TEMAS.map(([t, eixo, pergs]) => html`<article class="card stack"><span class="chip">${eixo}</span><h3>${t}</h3><ul class="small">${pergs.map(p => html`<li>${p}</li>`)}</ul></article>`)}</div>
    </div>`);
    actions(el, { sortear() { sorteado = Math.floor(Math.random() * TEMAS.length); draw(); window.scrollTo(0, 0); toast('Bom treino!'); } });
    draw();
  }
};
