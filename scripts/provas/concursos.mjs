// Questões AUTORAIS no estilo dos concursos do Maranhão e de prefeituras.
// Não são questões oficiais de nenhuma prova: cada uma diz isso na referência.
// Os fatos (datas, leis, artigos) foram conferidos com a Constituição e as leis citadas.
import { num, opcoes } from '../banco/util.mjs';

// Como familia() de scripts/banco/tabelas.mjs, mas aceita distratores extras
// (para tabelas pequenas, com menos de cinco linhas).
function familia({ subject, topic, level = 'concurso', difficulty = 2, itens, formatos, explicar, dica, extras = {} }) {
  let k = 0;
  return {
    subject, topic, level, difficulty, n: itens.length * formatos.length, _k: 0,
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

// ---------------- Conhecimentos do Maranhão ----------------
const HIST_MA = [
  { a: '1612', b: 'fundação de São Luís pelos franceses, liderados por Daniel de La Touche', ev: 'a fundação de São Luís' },
  { a: '1615', b: 'expulsão dos franceses de São Luís pelos portugueses', ev: 'a expulsão dos franceses do Maranhão' },
  { a: '1621', b: 'criação do Estado do Maranhão, separado do Estado do Brasil', ev: 'a criação do Estado do Maranhão' },
  { a: '1641', b: 'ocupação de São Luís pelos holandeses', ev: 'a invasão holandesa de São Luís' },
  { a: '1684', b: 'Revolta de Beckman, contra o monopólio da Companhia de Comércio do Estado do Maranhão', ev: 'a Revolta de Beckman' },
  { a: '1823', b: 'adesão do Maranhão à Independência do Brasil, em 28 de julho', ev: 'a adesão do Maranhão à Independência' },
  { a: '1838', b: 'início da Balaiada, revolta popular no período regencial', ev: 'o início da Balaiada' },
  { a: '1997', b: 'reconhecimento do Centro Histórico de São Luís como Patrimônio Mundial pela UNESCO', ev: 'o título de Patrimônio Mundial ao Centro Histórico de São Luís' },
  { a: '2019', b: 'reconhecimento do Bumba meu boi do Maranhão como Patrimônio Cultural Imaterial da Humanidade', ev: 'o título de Patrimônio Imaterial da Humanidade ao Bumba meu boi' }
];
const FATOS_MA = [
  { a: 'Balaiada', b: 'revolta popular de 1838 a 1841, com vaqueiros, escravizados e sertanejos pobres, reprimida pelas tropas de Luís Alves de Lima e Silva' },
  { a: 'Revolta de Beckman', b: 'movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman' },
  { a: 'França Equinocial', b: 'projeto colonial francês que deu origem à cidade de São Luís em 1612' },
  { a: 'Adesão à Independência', b: 'fato de 28 de julho de 1823, quando o Maranhão passou a integrar o Brasil independente' },
  { a: 'Companhia de Comércio do Estado do Maranhão', b: 'empresa que detinha o monopólio do comércio na região e provocou revolta em 1684' },
  { a: 'Invasão holandesa', b: 'ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses' }
];
const GEO_MA = [
  { a: 'Rio Parnaíba', b: 'rio que marca a divisa entre o Maranhão e o Piauí' },
  { a: 'Rio Gurupi', b: 'rio que marca boa parte da divisa entre o Maranhão e o Pará' },
  { a: 'Rio Tocantins', b: 'rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz' },
  { a: 'Rio Itapecuru', b: 'rio que nasce no sul do estado, atravessa cidades como Caxias e Codó e deságua na baía de São José' },
  { a: 'Rio Mearim', b: 'rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos' },
  { a: 'Lençóis Maranhenses', b: 'parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas' },
  { a: 'Golfão Maranhense', b: 'grande reentrância do litoral formada pelas baías de São Marcos e de São José' },
  { a: 'Ilha de Upaon-Açu', b: 'ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa' },
  { a: 'Reentrâncias Maranhenses', b: 'litoral recortado do noroeste do estado, com extensos manguezais' },
  { a: 'Chapada das Mesas', b: 'parque nacional no sul do estado, perto de Carolina, conhecido por cachoeiras e morros tabulares' }
];
const BIOMAS_MA = [
  { a: 'Amazônia', b: 'bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará' },
  { a: 'Cerrado', b: 'bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja' },
  { a: 'Caatinga', b: 'bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí' },
  { a: 'Manguezal', b: 'ecossistema do litoral maranhense, importante berçário de peixes e crustáceos' },
  { a: 'Mata dos Cocais', b: 'formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba' }
];
const CIDADES_MA = [
  { a: 'São Luís', b: 'capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor"' },
  { a: 'Imperatriz', b: 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins' },
  { a: 'Caxias', b: 'cidade do leste maranhense onde nasceu o poeta Gonçalves Dias' },
  { a: 'Timon', b: 'cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba' },
  { a: 'Alcântara', b: 'cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira' },
  { a: 'Barreirinhas', b: 'principal porta de entrada do Parque Nacional dos Lençóis Maranhenses' },
  { a: 'Balsas', b: 'cidade do sul do Maranhão, polo da produção de soja no Cerrado' },
  { a: 'Carolina', b: 'cidade do sul do estado, porta de entrada da Chapada das Mesas' },
  { a: 'São José de Ribamar', b: 'cidade da Ilha de Upaon-Açu conhecida pelo santuário do padroeiro do Maranhão' }
];
const CULTURA_MA = [
  { a: 'Bumba meu boi', b: 'festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019' },
  { a: 'Tambor de crioula', b: 'dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007' },
  { a: 'Cacuriá', b: 'dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís' },
  { a: 'Festa do Divino Espírito Santo', b: 'celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara' },
  { a: 'Reggae maranhense', b: 'gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira"' },
  { a: 'Arroz de cuxá', b: 'prato típico feito com vinagreira, gergelim e camarão seco' },
  { a: 'Quebradeiras de coco babaçu', b: 'trabalhadoras extrativistas que vivem da coleta e quebra do coco de uma palmeira típica do estado' }
];
const AUTORES_MA = [
  { a: 'Gonçalves Dias', b: '"Canção do Exílio" e "I-Juca-Pirama"', nasc: 'Caxias' },
  { a: 'Aluísio Azevedo', b: '"O Mulato", marco do Naturalismo no Brasil', nasc: 'São Luís' },
  { a: 'Ferreira Gullar', b: '"Poema Sujo", escrito no exílio em Buenos Aires', nasc: 'São Luís' },
  { a: 'Josué Montello', b: '"Os Tambores de São Luís"', nasc: 'São Luís' },
  { a: 'Graça Aranha', b: '"Canaã", romance pré-modernista', nasc: 'São Luís' },
  { a: 'Sousândrade', b: '"O Guesa", poema longo do Romantismo', nasc: 'Guimarães' },
  { a: 'Coelho Neto', b: 'vasta obra de romances e contos, como "Rei Negro"', nasc: 'Caxias' }
];
const ECON_MA = [
  { a: 'Estrada de Ferro Carajás', b: 'ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís' },
  { a: 'Porto do Itaqui', b: 'porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes' },
  { a: 'Centro de Lançamento de Alcântara', b: 'base espacial favorecida pela proximidade da linha do Equador' },
  { a: 'Soja no sul do estado', b: 'produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba' },
  { a: 'Extrativismo do babaçu', b: 'atividade tradicional que gera óleo, carvão e renda para milhares de famílias' }
];
const SIMBOLOS_MA = [
  { a: 'Palácio dos Leões', b: 'sede do governo do Maranhão, em São Luís' },
  { a: 'Teatro Arthur Azevedo', b: 'teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil' },
  { a: 'Fonte do Ribeirão', b: 'chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas' },
  { a: 'Praia Grande', b: 'bairro histórico de São Luís com casarões cobertos de azulejos portugueses' },
  { a: 'Guaraná Jesus', b: 'refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local' }
];

export const MARANHAO = [
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['História do Maranhão', 'Datas e fatos'], level: 'concurso', difficulty: 2, itens: HIST_MA,
    formatos: [it => ({ campo: 'a', statement: `Em que ano ocorreu ${it.ev}?` }), it => ({ campo: 'b', statement: `Na história do Maranhão, o ano de ${it.a} está ligado a qual fato?` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).' }),
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['História do Maranhão', 'Revoltas e movimentos'], level: 'concurso', difficulty: 3, itens: FATOS_MA,
    formatos: [it => ({ campo: 'a', statement: `Qual episódio da história maranhense é descrito a seguir? "${it.b[0].toUpperCase() + it.b.slice(1)}."` }), it => ({ campo: 'b', statement: `Sobre a ${it.a}, é correto afirmar que se trata de:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Associe cada movimento ao seu período: colonial, imperial ou regencial.' }),
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['Geografia do Maranhão', 'Rios e paisagens'], level: 'concurso', difficulty: 2, itens: GEO_MA,
    formatos: [it => ({ campo: 'a', statement: `Qual elemento da geografia maranhense corresponde à descrição: ${it.b}?` }), it => ({ campo: 'b', statement: `Na geografia do Maranhão, o(a) ${it.a} é:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).' }),
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['Geografia do Maranhão', 'Biomas e ecossistemas'], level: 'concurso', difficulty: 2, itens: BIOMAS_MA,
    formatos: [it => ({ campo: 'a', statement: `No Maranhão, qual bioma ou ecossistema corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `Sobre a presença do(a) ${it.a} no território maranhense, é correto dizer que é o:` })],
    explicar: it => `${it.a}: ${it.b}. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.`, dica: 'O Maranhão fica na transição entre o Norte e o Nordeste.' }),
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['Geografia do Maranhão', 'Municípios'], level: 'concurso', difficulty: 2, itens: CIDADES_MA,
    formatos: [it => ({ campo: 'a', statement: `Qual município maranhense corresponde à descrição: ${it.b}?` }), it => ({ campo: 'b', statement: `O município de ${it.a} é conhecido por ser:` })],
    explicar: it => `${it.a}: ${it.b}. O Maranhão tem 217 municípios.`, dica: 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).' }),
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['Cultura do Maranhão', 'Festas, danças e culinária'], level: 'concurso', difficulty: 2, itens: CULTURA_MA,
    formatos: [it => ({ campo: 'a', statement: `Qual manifestação da cultura maranhense é descrita a seguir: ${it.b}?` }), it => ({ campo: 'b', statement: `Na cultura do Maranhão, o(a) ${it.a} é:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).' }),
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['Cultura do Maranhão', 'Literatura maranhense'], level: 'concurso', difficulty: 3, itens: AUTORES_MA,
    formatos: [it => ({ campo: 'a', statement: `Qual escritor maranhense é autor de ${it.b}?` }), it => ({ campo: 'b', statement: `O escritor ${it.a}, nascido em ${it.nasc}, é autor de:` })],
    explicar: it => `${it.a} (nascido em ${it.nasc}) escreveu ${it.b}. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".`, dica: 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.' }),
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['Economia do Maranhão', 'Infraestrutura e produção'], level: 'concurso', difficulty: 3, itens: ECON_MA,
    formatos: [it => ({ campo: 'a', statement: `Qual elemento da economia maranhense corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `Na economia do Maranhão, o(a) ${it.a} se destaca como:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'São Luís concentra a logística: Itaqui e Ponta da Madeira.' }),
  familia({ subject: 'Conhecimentos do Maranhão', topic: ['Cultura do Maranhão', 'Patrimônio de São Luís'], level: 'concurso', difficulty: 2, itens: SIMBOLOS_MA,
    formatos: [it => ({ campo: 'a', statement: `Em São Luís, qual destes corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `O(A) ${it.a}, em São Luís, é:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.' })
];

// ---------------- Legislação para prefeituras ----------------
const MUNICIPIO = [
  { a: 'Lei Orgânica', b: 'norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal' },
  { a: 'Câmara Municipal', b: 'órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas' },
  { a: 'Prefeito', b: 'chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição' },
  { a: 'Vereador', b: 'membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar' },
  { a: 'Parecer prévio do Tribunal de Contas', b: 'opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores' }
];
const COMPETENCIAS = [
  { a: 'Município', b: 'legislar sobre assuntos de interesse local e organizar o transporte coletivo urbano' },
  { a: 'União', b: 'emitir moeda e manter relações com Estados estrangeiros' },
  { a: 'Estado', b: 'explorar os serviços locais de gás canalizado' },
  { a: 'Distrito Federal', b: 'acumular as competências legislativas reservadas aos Estados e aos Municípios' }
];
const TRIBUTOS = [
  { a: 'IPTU', b: 'imposto municipal sobre a propriedade predial e territorial urbana' },
  { a: 'ISS', b: 'imposto municipal sobre serviços de qualquer natureza' },
  { a: 'ITBI', b: 'imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos' },
  { a: 'IPVA', b: 'imposto estadual sobre a propriedade de veículos automotores' },
  { a: 'ICMS', b: 'imposto estadual sobre circulação de mercadorias e alguns serviços' },
  { a: 'IR', b: 'imposto federal sobre a renda e proventos de qualquer natureza' },
  { a: 'ITR', b: 'imposto federal sobre a propriedade territorial rural' }
];
const IDADES = [
  { a: '18 anos', b: 'vereador' }, { a: '21 anos', b: 'prefeito' }, { a: '30 anos', b: 'governador' }, { a: '35 anos', b: 'senador' }
];
const SERVIDOR = [
  { a: 'Estabilidade', b: 'adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho' },
  { a: 'Validade do concurso', b: 'prazo de até dois anos, prorrogável uma vez por igual período' },
  { a: 'Acumulação de cargos', b: 'permitida, havendo compatibilidade de horários, para dois cargos de professor' },
  { a: 'Cargo em comissão', b: 'cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento' },
  { a: 'Função de confiança', b: 'exercida exclusivamente por servidores ocupantes de cargo efetivo' }
];
const IMPROBIDADE = [
  { a: 'Enriquecimento ilícito', b: 'receber vantagem patrimonial indevida em razão do cargo, como aceitar presente de quem tem interesse em decisão do agente' },
  { a: 'Prejuízo ao erário', b: 'ação que causa perda ou desvio de bens e recursos públicos, como permitir compra por preço acima do de mercado' },
  { a: 'Atentado aos princípios da administração', b: 'violar deveres de honestidade e imparcialidade, como revelar fato que deve ficar em segredo' }
];
const LICITA = [
  { a: 'Pregão', b: 'modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto' },
  { a: 'Concorrência', b: 'modalidade para obras, serviços especiais e de engenharia e bens especiais' },
  { a: 'Concurso', b: 'modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor' },
  { a: 'Leilão', b: 'modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance' },
  { a: 'Diálogo competitivo', b: 'modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções' }
];
const LEIS = [
  { a: 'Lei 8.080/1990', b: 'Lei Orgânica da Saúde, que organiza o SUS' },
  { a: 'Lei 8.069/1990', b: 'Estatuto da Criança e do Adolescente (ECA)' },
  { a: 'Lei 9.394/1996', b: 'Lei de Diretrizes e Bases da Educação Nacional (LDB)' },
  { a: 'Lei 10.741/2003', b: 'Estatuto da Pessoa Idosa' },
  { a: 'Lei 12.527/2011', b: 'Lei de Acesso à Informação' },
  { a: 'Lei Complementar 101/2000', b: 'Lei de Responsabilidade Fiscal' },
  { a: 'Lei 14.133/2021', b: 'Lei de Licitações e Contratos Administrativos' },
  { a: 'Lei 8.429/1992', b: 'Lei de Improbidade Administrativa' },
  { a: 'Lei 13.709/2018', b: 'Lei Geral de Proteção de Dados Pessoais (LGPD)' }
];
const ATENDIMENTO = [
  { a: 'Cortesia', b: 'tratar o cidadão com educação e respeito, mesmo diante de reclamações' },
  { a: 'Clareza', b: 'usar linguagem simples, sem termos técnicos desnecessários' },
  { a: 'Presteza', b: 'atender com rapidez e disposição, sem demoras injustificadas' },
  { a: 'Atendimento prioritário', b: 'garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência' },
  { a: 'Impessoalidade no atendimento', b: 'atender a todos sem favorecer amigos, parentes ou conhecidos' }
];

export const PREFEITURAS = [
  familia({ subject: 'Direito', topic: ['Direito Constitucional', 'Organização do município'], level: 'concurso', difficulty: 3, itens: MUNICIPIO,
    formatos: [it => ({ campo: 'a', statement: `De acordo com a Constituição Federal (arts. 29 a 31), qual termo corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `Segundo a Constituição Federal, sobre o(a) ${it.a} no âmbito municipal, é correto afirmar:` })],
    explicar: it => `${it.a}: ${it.b}. Base: arts. 29 a 31 da Constituição Federal.`, dica: 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.' }),
  familia({ subject: 'Direito', topic: ['Direito Constitucional', 'Competências dos entes'], level: 'concurso', difficulty: 3, itens: COMPETENCIAS,
    extras: { a: ['União, Estados e Municípios, em comum'] },
    formatos: [it => ({ campo: 'a', statement: `Pela Constituição Federal, compete a qual ente: ${it.b}?` })],
    explicar: it => `Compete ao(à) ${it.a}: ${it.b}.`, dica: 'Interesse local é sempre do Município (art. 30).' }),
  familia({ subject: 'Direito', topic: ['Direito Tributário', 'Tributos municipais'], level: 'concurso', difficulty: 2, itens: TRIBUTOS,
    formatos: [it => ({ campo: 'a', statement: `Qual tributo corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `O ${it.a} é o:` })],
    explicar: it => `${it.a}: ${it.b}. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).`, dica: 'Municipais: IPTU, ISS e ITBI.' }),
  familia({ subject: 'Direito', topic: ['Direito Constitucional', 'Direitos políticos'], level: 'concurso', difficulty: 2, itens: IDADES,
    extras: { a: ['16 anos', '25 anos'] },
    formatos: [it => ({ campo: 'a', statement: `Pela Constituição Federal (art. 14), qual é a idade mínima para se candidatar a ${it.b}?` })],
    explicar: it => `A idade mínima para ${it.b} é ${it.a}. Vereador 18, prefeito e deputado 21, governador 30, senador e presidente 35.`, dica: '18, 21, 30 e 35 anos.' }),
  familia({ subject: 'Direito', topic: ['Direito Administrativo', 'Servidores públicos'], level: 'concurso', difficulty: 3, itens: SERVIDOR,
    formatos: [it => ({ campo: 'a', statement: `Segundo a Constituição Federal (arts. 37 e 41), qual instituto corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `Sobre ${it.a.toLowerCase()} no serviço público, a Constituição estabelece:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.' }),
  familia({ subject: 'Direito', topic: ['Direito Administrativo', 'Improbidade administrativa'], level: 'concurso', difficulty: 3, itens: IMPROBIDADE,
    extras: { a: ['Crime de responsabilidade', 'Abuso de poder econômico', 'Infração disciplinar leve'] },
    formatos: [it => ({ campo: 'a', statement: `Pela Lei 8.429/1992, a conduta a seguir é exemplo de qual tipo de improbidade? "${it.b[0].toUpperCase() + it.b.slice(1)}."` })],
    explicar: it => `${it.a}: ${it.b}. Desde a Lei 14.230/2021, a improbidade exige dolo (intenção).`, dica: 'Três tipos: enriquecimento, prejuízo ao erário e princípios.' }),
  familia({ subject: 'Direito', topic: ['Direito Administrativo', 'Licitações (Lei 14.133/2021)'], level: 'concurso', difficulty: 3, itens: LICITA,
    formatos: [it => ({ campo: 'a', statement: `Na Lei 14.133/2021, qual modalidade de licitação corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `Na nova Lei de Licitações, a modalidade ${it.a.toLowerCase()} é usada para:` })],
    explicar: it => `${it.a}: ${it.b}. Convite e tomada de preços não existem mais na nova lei.`, dica: 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.' }),
  familia({ subject: 'Direito', topic: ['Legislação', 'Leis federais cobradas em prefeituras'], level: 'concurso', difficulty: 2, itens: LEIS,
    formatos: [it => ({ campo: 'a', statement: `Qual é o número da ${it.b}?` }), it => ({ campo: 'b', statement: `A ${it.a} é conhecida como:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).' }),
  familia({ subject: 'Atendimento ao público', topic: ['Atendimento ao público', 'Qualidade no atendimento'], level: 'concurso', difficulty: 1, itens: ATENDIMENTO,
    formatos: [it => ({ campo: 'a', statement: `No atendimento ao público em uma prefeitura, qual conceito corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `No atendimento ao cidadão, ${it.a.toLowerCase()} significa:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Pense no que o cidadão espera de um bom atendimento.' })
];

// ---------------- Informática ----------------
const WORD = [
  { a: 'Ctrl + N', b: 'aplicar negrito ao texto selecionado' }, { a: 'Ctrl + I', b: 'aplicar itálico ao texto selecionado' },
  { a: 'Ctrl + S', b: 'sublinhar o texto selecionado' }, { a: 'Ctrl + B', b: 'salvar o documento' },
  { a: 'Ctrl + Z', b: 'desfazer a última ação' }, { a: 'Ctrl + P', b: 'imprimir o documento' },
  { a: 'Ctrl + T', b: 'selecionar todo o documento' }, { a: 'Ctrl + E', b: 'centralizar o parágrafo' },
  { a: 'Ctrl + X', b: 'recortar o conteúdo selecionado' }, { a: 'Ctrl + V', b: 'colar o conteúdo da área de transferência' }
];
const WINDOWS = [
  { a: 'Windows + E', b: 'abrir o Explorador de Arquivos' }, { a: 'Windows + D', b: 'mostrar a área de trabalho' },
  { a: 'Windows + L', b: 'bloquear o computador' }, { a: 'Alt + Tab', b: 'alternar entre as janelas abertas' },
  { a: 'Ctrl + Shift + Esc', b: 'abrir o Gerenciador de Tarefas' }, { a: 'F2', b: 'renomear o arquivo selecionado' },
  { a: 'Shift + Delete', b: 'excluir o arquivo sem enviá-lo para a Lixeira' }, { a: 'Alt + F4', b: 'fechar a janela ativa' }
];
const SEGURANCA = [
  { a: 'Phishing', b: 'golpe em que mensagens falsas imitam bancos ou órgãos públicos para roubar senhas e dados' },
  { a: 'Ransomware', b: 'programa malicioso que sequestra arquivos com criptografia e pede resgate' },
  { a: 'Firewall', b: 'recurso que controla o tráfego de rede, bloqueando conexões não autorizadas' },
  { a: 'Backup', b: 'cópia de segurança dos dados, guardada para recuperação em caso de perda' },
  { a: 'Spam', b: 'mensagem eletrônica não solicitada, enviada em massa' },
  { a: 'Cco (cópia oculta)', b: 'campo do e-mail em que os destinatários não aparecem para os demais' },
  { a: 'HTTPS', b: 'protocolo que indica conexão criptografada entre o navegador e o site' },
  { a: 'Autenticação em dois fatores', b: 'proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo' }
];
const EXCEL = [
  { a: '=SOMA(A1:A5)', b: 'somar os valores das células de A1 até A5' }, { a: '=MÉDIA(A1:A5)', b: 'calcular a média aritmética dos valores de A1 a A5' },
  { a: '=MÁXIMO(A1:A5)', b: 'mostrar o maior valor entre A1 e A5' }, { a: '=MÍNIMO(A1:A5)', b: 'mostrar o menor valor entre A1 e A5' },
  { a: '=CONT.SE(A1:A5;">10")', b: 'contar quantas células de A1 a A5 têm valor maior que 10' },
  { a: '=SE(A1>=7;"Aprovado";"Reprovado")', b: 'mostrar "Aprovado" quando A1 for pelo menos 7 e "Reprovado" nos outros casos' },
  { a: '=PROCV(B2;D2:E20;2;0)', b: 'procurar B2 na primeira coluna de D2:E20 e trazer o valor correspondente da segunda coluna' }
];

const fmtLista = v => v.map(x => num(x)).join(', ');
const EXCEL_CALC = {
  subject: 'Informática', topic: ['Informática', 'Planilhas (Excel e Calc)'], level: 'concurso', difficulty: 2, n: 90,
  make(r) {
    const vals = Array.from({ length: 5 }, () => r.int(2, 60));
    const f = r.pick(['SOMA', 'MÉDIA', 'MÁXIMO', 'MÍNIMO', 'CONT.SE']);
    const lim = r.int(10, 40);
    const certo = f === 'SOMA' ? vals.reduce((a, b) => a + b, 0) : f === 'MÉDIA' ? vals.reduce((a, b) => a + b, 0) / 5 : f === 'MÁXIMO' ? Math.max(...vals) : f === 'MÍNIMO' ? Math.min(...vals) : vals.filter(v => v > lim).length;
    if (f === 'MÉDIA' && !Number.isInteger(certo * 10)) return null;
    const formula = f === 'CONT.SE' ? `=CONT.SE(A1:A5;">${lim}")` : `=${f}(A1:A5)`;
    const soma = vals.reduce((a, b) => a + b, 0);
    const ds = [soma, soma / 5, Math.max(...vals), Math.min(...vals), vals.filter(v => v > lim).length, vals.filter(v => v >= lim).length, certo + 1, certo + 2, Math.max(0, certo - 1)].filter(x => Number.isInteger(x * 10));
    const o = opcoes(r, num(certo), r.shuffle(ds).map(x => num(x)));
    return o && { ...o, statement: `Em uma planilha da prefeitura, as células A1 a A5 contêm os valores ${fmtLista(vals)}. Qual resultado aparece em uma célula com a fórmula ${formula}?`, explanation: `${formula} → ${num(certo)}. ${f === 'CONT.SE' ? `Contam só os valores maiores que ${lim}.` : f === 'MÉDIA' ? `Soma ${num(soma)} dividida por 5.` : ''}`.trim(), hint: 'Resolva a função sobre os cinco valores, um a um.' };
  }
};

export const INFORMATICA = [
  familia({ subject: 'Informática', topic: ['Informática', 'Editor de texto (Word)'], level: 'concurso', difficulty: 1, itens: WORD,
    formatos: [it => ({ campo: 'a', statement: `No Microsoft Word em português, qual atalho serve para ${it.b}?` }), it => ({ campo: 'b', statement: `No Microsoft Word em português, o atalho ${it.a} serve para:` })],
    explicar: it => `${it.a}: ${it.b}. No Word em português: N negrito, I itálico, S sublinhado, B salvar.`, dica: 'No Word em português os atalhos seguem as palavras em português.' }),
  familia({ subject: 'Informática', topic: ['Informática', 'Windows'], level: 'concurso', difficulty: 1, itens: WINDOWS,
    formatos: [it => ({ campo: 'a', statement: `No Windows, qual atalho serve para ${it.b}?` }), it => ({ campo: 'b', statement: `No Windows, o atalho ${it.a} serve para:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).' }),
  familia({ subject: 'Informática', topic: ['Informática', 'Segurança e internet'], level: 'concurso', difficulty: 2, itens: SEGURANCA,
    formatos: [it => ({ campo: 'a', statement: `Em segurança da informação, qual termo corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `Em informática, ${it.a} é:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Desconfie de links que pedem senha com urgência.' }),
  familia({ subject: 'Informática', topic: ['Informática', 'Planilhas (Excel e Calc)'], level: 'concurso', difficulty: 2, itens: EXCEL,
    formatos: [it => ({ campo: 'a', statement: `Em uma planilha do Excel, qual fórmula serve para ${it.b}?` }), it => ({ campo: 'b', statement: `Em uma planilha do Excel, a fórmula ${it.a} serve para:` })],
    explicar: it => `${it.a}: ${it.b}.`, dica: 'Toda fórmula começa com = e os argumentos são separados por ponto e vírgula.' }),
  EXCEL_CALC
];

export const CIDADES_PREFEITURAS = ['Pinheiro', 'Chapadinha', 'Barra do Corda', 'Grajaú', 'Pedreiras', 'Viana', 'Itapecuru-Mirim', 'Zé Doca', 'Coroatá', 'Presidente Dutra', 'Santa Luzia', 'Buriticupu', 'Lago da Pedra', 'Estreito', 'Tutóia', 'São Bento', 'Rosário', 'Vargem Grande', 'Santa Inês', 'Açailândia', 'Codó', 'Bacabal', 'Paço do Lumiar', 'Raposa'];
