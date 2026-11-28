// Versão 2.3: questões AUTORAIS para concursos de Imperatriz e região tocantina e para concursos
// por profissão (saúde, educação, segurança, assistência social e área administrativa).
// Não são questões oficiais: a referência de cada uma diz isso. Os fatos e artigos foram conferidos
// com a Constituição Federal e as leis citadas (redação em vigor em 2026).
import { opcoes } from '../banco/util.mjs';

function familia({ subject, topic, level = 'concurso', difficulty = 2, itens, formatos, explicar, dica, extras = {} }) {
  let k = 0;
  return {
    subject, topic, level, difficulty, n: itens.length * formatos.length,
    make(r) {
      const idx = k++;
      const item = itens[idx % itens.length];
      const f = formatos[Math.floor(idx / itens.length) % formatos.length](item, r);
      if (!f) return null;
      const outros = r.shuffle(itens.filter(x => x !== item && x[f.campo] !== item[f.campo])).map(x => x[f.campo]);
      const o = opcoes(r, item[f.campo], [...outros, ...r.shuffle(extras[f.campo] || [])]);
      return o && { ...o, statement: f.statement, explanation: explicar(item, f), hint: typeof dica === 'function' ? dica(item) : dica };
    }
  };
}
const cap = s => s[0].toUpperCase() + s.slice(1);
const T = (subject, topic, itens, { q1, q2, dica, difficulty = 2, extras, exp }) => familia({
  subject, topic, difficulty, itens, dica, extras,
  formatos: [it => ({ campo: 'a', statement: q1(it) }), ...(q2 ? [it => ({ campo: 'b', statement: q2(it) })] : [])],
  explicar: exp || (it => `${it.a}: ${it.b}.`)
});

// ---------------- Imperatriz e região tocantina ----------------
const IMPERATRIZ = [
  { a: 'Imperatriz', b: 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins' },
  { a: 'Frei Manoel Procópio do Coração de Maria', b: 'religioso que fundou, em 1852, a povoação que deu origem a Imperatriz' },
  { a: 'Rodovia Belém-Brasília (BR-010)', b: 'estrada aberta no fim da década de 1950 que acelerou o crescimento de Imperatriz nas décadas seguintes' },
  { a: 'Portal da Amazônia', b: 'apelido de Imperatriz, por sua posição na transição entre o Cerrado e a Amazônia' },
  { a: 'UEMASUL', b: 'universidade estadual criada em 2016, com sede em Imperatriz, para atender a região tocantina' },
  { a: 'Região Tocantina', b: 'região do sudoeste maranhense, polarizada por Imperatriz, banhada pelo rio Tocantins' },
  { a: 'Açailândia', b: 'município da região tocantina conhecido pela produção de ferro-gusa, cortado pela Estrada de Ferro Carajás' },
  { a: 'Estreito', b: 'município onde fica a usina hidrelétrica construída no rio Tocantins, na divisa com o Tocantins' },
  { a: 'Carolina', b: 'município sede do Parque Nacional da Chapada das Mesas, com cachoeiras e morros de topo plano' },
  { a: 'Porto Franco', b: 'município às margens do Tocantins, em frente a Tocantinópolis (TO)' },
  { a: 'João Lisboa, Davinópolis e Governador Edison Lobão', b: 'municípios que surgiram de áreas desmembradas de Imperatriz' },
  { a: 'Ferrovia Norte-Sul', b: 'ferrovia que passa pela região tocantina e se liga à Estrada de Ferro Carajás em Açailândia' }
];
export const IMPERATRIZ_REGIAO = [
  T('Conhecimentos do Maranhão', ['Conhecimentos do Maranhão', 'Imperatriz e região tocantina'], IMPERATRIZ, {
    q1: it => `Sobre Imperatriz e a região tocantina do Maranhão, qual item corresponde a: ${it.b}?`,
    q2: it => `Sobre a região de Imperatriz, o item "${it.a}" se refere a:`,
    dica: 'Imperatriz: fundada em 1852, às margens do Tocantins, cresceu com a Belém-Brasília.' })
];

// ---------------- Saúde: SUS ----------------
const SUS_PRINC = [
  { a: 'Universalidade', b: 'acesso aos serviços de saúde em todos os níveis de assistência para toda a população' },
  { a: 'Integralidade', b: 'conjunto articulado e contínuo de ações preventivas e curativas, individuais e coletivas, em todos os níveis de complexidade' },
  { a: 'Equidade', b: 'tratar desigualmente os desiguais, investindo mais onde a necessidade é maior' },
  { a: 'Descentralização', b: 'direção única em cada esfera de governo, com ênfase na municipalização dos serviços' },
  { a: 'Regionalização e hierarquização', b: 'organização da rede em níveis de complexidade crescente, numa área geográfica definida' },
  { a: 'Participação da comunidade', b: 'controle social exercido por meio dos conselhos e das conferências de saúde' }
];
const SUS_LEIS = [
  { a: 'Lei 8.080/1990', b: 'dispõe sobre as condições para a promoção, proteção e recuperação da saúde e o funcionamento dos serviços (Lei Orgânica da Saúde)' },
  { a: 'Lei 8.142/1990', b: 'dispõe sobre a participação da comunidade na gestão do SUS e as transferências de recursos entre os governos' },
  { a: 'Art. 196 da Constituição', b: 'a saúde é direito de todos e dever do Estado, garantido mediante políticas sociais e econômicas' },
  { a: 'Conferência de Saúde', b: 'instância que se reúne a cada quatro anos para avaliar a situação de saúde e propor diretrizes' },
  { a: 'Conselho de Saúde', b: 'órgão colegiado permanente e deliberativo, com representação paritária dos usuários' },
  { a: 'Vigilância epidemiológica', b: 'conjunto de ações que detecta e previne mudanças nos fatores que determinam a saúde coletiva, para controlar doenças' },
  { a: 'Vigilância sanitária', b: 'conjunto de ações capaz de eliminar, diminuir ou prevenir riscos à saúde ligados a produtos, serviços e ao meio ambiente' },
  { a: 'Estratégia Saúde da Família', b: 'modelo prioritário da atenção básica, com equipes multiprofissionais responsáveis por um território' }
];
export const SAUDE = [
  T('Saúde pública (SUS)', ['Saúde pública (SUS)', 'Princípios e diretrizes do SUS'], SUS_PRINC, {
    q1: it => `Na Lei 8.080/1990 e na Constituição, qual princípio ou diretriz do SUS corresponde a: ${it.b}?`,
    q2: it => `No SUS, o que significa ${it.a.toLowerCase()}?`, difficulty: 2,
    dica: 'Doutrinários: universalidade, integralidade e equidade. Organizativos: descentralização, regionalização e hierarquização, participação da comunidade.' }),
  T('Saúde pública (SUS)', ['Saúde pública (SUS)', 'Legislação do SUS'], SUS_LEIS, {
    q1: it => `Na legislação do SUS, qual item corresponde a: ${it.b}?`,
    q2: it => `Na legislação da saúde, o que estabelece ou define ${it.a.startsWith('Art') || it.a.startsWith('Lei') ? 'o(a) ' + it.a : 'a ' + it.a.toLowerCase()}?`, difficulty: 3,
    dica: '8.080 organiza o SUS; 8.142 trata do controle social e dos repasses.' })
];

// ---------------- Educação ----------------
const EDUCACAO = [
  { a: 'Educação básica', b: 'nível formado pela educação infantil, pelo ensino fundamental e pelo ensino médio (LDB, art. 21)' },
  { a: 'Educação obrigatória', b: 'educação básica gratuita dos 4 aos 17 anos de idade (LDB, art. 4º)' },
  { a: 'Creche', b: 'etapa da educação infantil para crianças de até 3 anos' },
  { a: 'Pré-escola', b: 'etapa da educação infantil para crianças de 4 e 5 anos' },
  { a: 'Ensino fundamental', b: 'etapa com duração de 9 anos, iniciando aos 6 anos de idade' },
  { a: 'Calendário escolar mínimo', b: 'pelo menos 200 dias de efetivo trabalho escolar por ano na educação básica' },
  { a: 'BNCC', b: 'documento normativo que define as aprendizagens essenciais da educação básica, organizado em dez competências gerais' },
  { a: 'PNE (Lei 13.005/2014)', b: 'plano decenal com metas e estratégias para a educação brasileira' },
  { a: 'Gestão democrática', b: 'princípio do ensino público com participação dos profissionais da educação e da comunidade escolar' }
];
const ECA = [
  { a: 'Criança', b: 'pessoa até 12 anos de idade incompletos, para o ECA' },
  { a: 'Adolescente', b: 'pessoa entre 12 e 18 anos de idade, para o ECA' },
  { a: 'Conselho Tutelar', b: 'órgão permanente e autônomo, não jurisdicional, encarregado de zelar pelos direitos da criança e do adolescente' },
  { a: 'Prioridade absoluta', b: 'garantia de que os direitos de crianças e adolescentes têm precedência no atendimento e nas políticas públicas' },
  { a: 'Medida socioeducativa', b: 'resposta aplicada ao adolescente que pratica ato infracional, como advertência e prestação de serviços à comunidade' }
];
export const EDUCACAO_LEIS = [
  T('Legislação educacional', ['Legislação educacional', 'LDB, BNCC e PNE'], EDUCACAO, {
    q1: it => `Na legislação educacional brasileira, qual item corresponde a: ${it.b}?`,
    q2: it => `Na legislação educacional, o que define ${it.a.length < 25 ? 'o termo "' + it.a + '"' : it.a}?`, difficulty: 2,
    dica: 'LDB: Lei 9.394/1996. Obrigatória dos 4 aos 17; fundamental de 9 anos; 200 dias letivos.' }),
  T('Legislação educacional', ['Legislação educacional', 'Estatuto da Criança e do Adolescente'], ECA, {
    q1: it => `No ECA (Lei 8.069/1990), qual termo corresponde a: ${it.b}?`,
    q2: it => `Para o ECA, o que é ${it.a.toLowerCase()}?`, difficulty: 2,
    dica: 'Criança até 12 anos incompletos; adolescente de 12 a 18.' })
];

// ---------------- Segurança pública ----------------
const SEG = [
  { a: 'Polícia Federal', b: 'apura infrações contra a ordem política e social ou contra bens da União e exerce as funções de polícia judiciária da União' },
  { a: 'Polícia Rodoviária Federal', b: 'faz o patrulhamento ostensivo das rodovias federais' },
  { a: 'Polícia Civil', b: 'exerce a polícia judiciária e a apuração de infrações penais nos estados, exceto as militares' },
  { a: 'Polícia Militar', b: 'faz a polícia ostensiva e a preservação da ordem pública' },
  { a: 'Corpo de Bombeiros Militar', b: 'executa atividades de defesa civil, além de outras atribuições definidas em lei' },
  { a: 'Polícia Penal', b: 'cuida da segurança dos estabelecimentos penais' },
  { a: 'Guarda Municipal', b: 'pode ser criada pelos municípios para proteger seus bens, serviços e instalações' }
];
export const SEGURANCA = [
  T('Direito', ['Direito Constitucional', 'Segurança pública (art. 144)'], SEG, {
    q1: it => `Segundo o art. 144 da Constituição Federal, qual órgão ou instituição tem esta atribuição: ${it.b}?`,
    q2: it => `Pelo art. 144 da Constituição, qual é a atribuição de: ${it.a}?`, difficulty: 3,
    dica: 'Ostensiva = PM; judiciária = Civil (estados) e Federal (União).' })
];

// ---------------- Assistência social ----------------
const ASSIST = [
  { a: 'LOAS (Lei 8.742/1993)', b: 'lei que organiza a assistência social como política de seguridade social não contributiva' },
  { a: 'CRAS', b: 'unidade pública da proteção social básica, que atende famílias em situação de vulnerabilidade' },
  { a: 'CREAS', b: 'unidade pública da proteção social especial, para famílias e pessoas com direitos violados' },
  { a: 'BPC', b: 'benefício de um salário mínimo mensal à pessoa com deficiência e à pessoa idosa com 65 anos ou mais que comprovem não ter meios de se manter' },
  { a: 'SUAS', b: 'sistema descentralizado e participativo que organiza a gestão da assistência social no país' },
  { a: 'Seguridade social', b: 'conjunto integrado de ações que garante os direitos relativos à saúde, à previdência e à assistência social' }
];
export const ASSISTENCIA = [
  T('Direito', ['Legislação', 'Assistência social (LOAS e SUAS)'], ASSIST, {
    q1: it => `Na política de assistência social, qual item corresponde a: ${it.b}?`,
    q2: it => `Na assistência social, o que é o(a) ${it.a}?`, difficulty: 2,
    dica: 'Proteção básica = CRAS; proteção especial = CREAS.' })
];

// ---------------- Área administrativa ----------------
const PODERES = [
  { a: 'Poder hierárquico', b: 'distribui e escalona as funções dos órgãos, ordena e revê a atuação dos agentes' },
  { a: 'Poder disciplinar', b: 'apura infrações e aplica penalidades aos servidores e a quem tem vínculo especial com a administração' },
  { a: 'Poder regulamentar', b: 'permite ao chefe do Executivo editar decretos para a fiel execução das leis' },
  { a: 'Poder de polícia', b: 'condiciona e restringe o uso de bens, atividades e direitos individuais em benefício da coletividade' }
];
const ATRIBUTOS = [
  { a: 'Presunção de legitimidade', b: 'o ato é considerado conforme a lei e verdadeiro até prova em contrário' },
  { a: 'Imperatividade', b: 'o ato se impõe a terceiros independentemente da sua concordância' },
  { a: 'Autoexecutoriedade', b: 'a administração pode executar o ato por seus próprios meios, sem ordem judicial, nos casos permitidos' },
  { a: 'Tipicidade', b: 'o ato deve corresponder a figuras definidas previamente pela lei' }
];
const PRINCIPIOS = [
  { a: 'Legalidade', b: 'o administrador só pode fazer o que a lei autoriza' },
  { a: 'Impessoalidade', b: 'a atuação visa ao interesse público, sem favorecimentos nem promoção pessoal' },
  { a: 'Moralidade', b: 'exige honestidade, boa-fé e ética na conduta administrativa' },
  { a: 'Publicidade', b: 'os atos devem ser divulgados, como regra, para permitir o controle' },
  { a: 'Eficiência', b: 'busca de resultados com qualidade, rapidez e menor custo' }
];
export const ADMINISTRATIVO = [
  T('Direito', ['Direito Administrativo', 'Poderes da administração'], PODERES, {
    q1: it => `Em Direito Administrativo, qual poder corresponde a: ${it.b}?`, q2: it => `O que caracteriza o ${it.a.toLowerCase()}?`, difficulty: 3,
    extras: { a: ['Poder moderador', 'Poder constituinte'], b: ['permite ao servidor recusar ordens legais dos superiores', 'autoriza o Judiciário a revogar atos administrativos por conveniência'] },
    dica: 'Multar um estabelecimento sem alvará é poder de polícia; punir servidor é disciplinar.' }),
  T('Direito', ['Direito Administrativo', 'Atributos do ato administrativo'], ATRIBUTOS, {
    q1: it => `Qual atributo do ato administrativo corresponde a: ${it.b}?`, q2: it => `No ato administrativo, o que significa ${it.a.toLowerCase()}?`, difficulty: 3,
    extras: { a: ['Onerosidade', 'Perpetuidade'], b: ['o ato só produz efeitos depois de homologado pelo Judiciário', 'o ato não pode ser anulado nem revogado'] },
    dica: 'Memorize PATI: presunção, autoexecutoriedade, tipicidade e imperatividade.' }),
  T('Direito', ['Direito Administrativo', 'Princípios da administração (art. 37)'], PRINCIPIOS, {
    q1: it => `Pelo art. 37 da Constituição, qual princípio corresponde a: ${it.b}?`, q2: it => `O princípio da ${it.a.toLowerCase()} significa que:`, difficulty: 2,
    dica: 'LIMPE: legalidade, impessoalidade, moralidade, publicidade e eficiência.' })
];

export const CIDADES_IMPERATRIZ = ['Imperatriz', 'Açailândia', 'João Lisboa', 'Davinópolis', 'Senador La Rocque', 'Governador Edison Lobão', 'Estreito', 'Porto Franco', 'Amarante do Maranhão', 'Montes Altos', 'Ribamar Fiquene', 'Cidelândia', 'Itinga do Maranhão', 'Carolina'];
