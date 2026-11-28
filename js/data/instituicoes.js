// Universidades públicas do Brasil por estado (federais, estaduais e institutos federais) e os
// principais vestibulares próprios. A forma de ingresso muda a cada ano: a tela sempre manda
// o aluno conferir o edital. Quando não há vestibular próprio, a referência é o ENEM (SISU).
export const UFS = {
  AC: 'Acre', AL: 'Alagoas', AP: 'Amapá', AM: 'Amazonas', BA: 'Bahia', CE: 'Ceará', DF: 'Distrito Federal', ES: 'Espírito Santo', GO: 'Goiás',
  MA: 'Maranhão', MT: 'Mato Grosso', MS: 'Mato Grosso do Sul', MG: 'Minas Gerais', PA: 'Pará', PB: 'Paraíba', PR: 'Paraná', PE: 'Pernambuco',
  PI: 'Piauí', RJ: 'Rio de Janeiro', RN: 'Rio Grande do Norte', RS: 'Rio Grande do Sul', RO: 'Rondônia', RR: 'Roraima', SC: 'Santa Catarina',
  SP: 'São Paulo', SE: 'Sergipe', TO: 'Tocantins'
};

// [sigla, nome]
export const UNIVERSIDADES = {
  AC: [['UFAC', 'Universidade Federal do Acre'], ['IFAC', 'Instituto Federal do Acre']],
  AL: [['UFAL', 'Universidade Federal de Alagoas'], ['UNEAL', 'Universidade Estadual de Alagoas'], ['UNCISAL', 'Universidade Estadual de Ciências da Saúde de Alagoas'], ['IFAL', 'Instituto Federal de Alagoas']],
  AP: [['UNIFAP', 'Universidade Federal do Amapá'], ['UEAP', 'Universidade do Estado do Amapá'], ['IFAP', 'Instituto Federal do Amapá']],
  AM: [['UFAM', 'Universidade Federal do Amazonas'], ['UEA', 'Universidade do Estado do Amazonas'], ['IFAM', 'Instituto Federal do Amazonas']],
  BA: [['UFBA', 'Universidade Federal da Bahia'], ['UFRB', 'Universidade Federal do Recôncavo da Bahia'], ['UFOB', 'Universidade Federal do Oeste da Bahia'], ['UFSB', 'Universidade Federal do Sul da Bahia'], ['UNEB', 'Universidade do Estado da Bahia'], ['UEFS', 'Universidade Estadual de Feira de Santana'], ['UESB', 'Universidade Estadual do Sudoeste da Bahia'], ['UESC', 'Universidade Estadual de Santa Cruz'], ['IFBA', 'Instituto Federal da Bahia']],
  CE: [['UFC', 'Universidade Federal do Ceará'], ['UFCA', 'Universidade Federal do Cariri'], ['UNILAB', 'Universidade da Integração Internacional da Lusofonia Afro-Brasileira'], ['UECE', 'Universidade Estadual do Ceará'], ['URCA', 'Universidade Regional do Cariri'], ['UVA', 'Universidade Estadual Vale do Acaraú'], ['IFCE', 'Instituto Federal do Ceará']],
  DF: [['UnB', 'Universidade de Brasília'], ['IFB', 'Instituto Federal de Brasília']],
  ES: [['UFES', 'Universidade Federal do Espírito Santo'], ['IFES', 'Instituto Federal do Espírito Santo']],
  GO: [['UFG', 'Universidade Federal de Goiás'], ['UFJ', 'Universidade Federal de Jataí'], ['UEG', 'Universidade Estadual de Goiás'], ['IFG', 'Instituto Federal de Goiás']],
  MA: [['UFMA', 'Universidade Federal do Maranhão'], ['UEMA', 'Universidade Estadual do Maranhão'], ['UEMASUL', 'Universidade Estadual da Região Tocantina do Maranhão'], ['IFMA', 'Instituto Federal do Maranhão']],
  MT: [['UFMT', 'Universidade Federal de Mato Grosso'], ['UFR', 'Universidade Federal de Rondonópolis'], ['UNEMAT', 'Universidade do Estado de Mato Grosso'], ['IFMT', 'Instituto Federal de Mato Grosso']],
  MS: [['UFMS', 'Universidade Federal de Mato Grosso do Sul'], ['UFGD', 'Universidade Federal da Grande Dourados'], ['UEMS', 'Universidade Estadual de Mato Grosso do Sul'], ['IFMS', 'Instituto Federal de Mato Grosso do Sul']],
  MG: [['UFMG', 'Universidade Federal de Minas Gerais'], ['UFJF', 'Universidade Federal de Juiz de Fora'], ['UFOP', 'Universidade Federal de Ouro Preto'], ['UFV', 'Universidade Federal de Viçosa'], ['UFLA', 'Universidade Federal de Lavras'], ['UFU', 'Universidade Federal de Uberlândia'], ['UFTM', 'Universidade Federal do Triângulo Mineiro'], ['UFSJ', 'Universidade Federal de São João del-Rei'], ['UNIFAL', 'Universidade Federal de Alfenas'], ['UNIFEI', 'Universidade Federal de Itajubá'], ['UFVJM', 'Universidade Federal dos Vales do Jequitinhonha e Mucuri'], ['UNIMONTES', 'Universidade Estadual de Montes Claros'], ['UEMG', 'Universidade do Estado de Minas Gerais'], ['CEFET-MG', 'Centro Federal de Educação Tecnológica de Minas Gerais']],
  PA: [['UFPA', 'Universidade Federal do Pará'], ['UFRA', 'Universidade Federal Rural da Amazônia'], ['UFOPA', 'Universidade Federal do Oeste do Pará'], ['UNIFESSPA', 'Universidade Federal do Sul e Sudeste do Pará'], ['UEPA', 'Universidade do Estado do Pará'], ['IFPA', 'Instituto Federal do Pará']],
  PB: [['UFPB', 'Universidade Federal da Paraíba'], ['UFCG', 'Universidade Federal de Campina Grande'], ['UEPB', 'Universidade Estadual da Paraíba'], ['IFPB', 'Instituto Federal da Paraíba']],
  PR: [['UFPR', 'Universidade Federal do Paraná'], ['UTFPR', 'Universidade Tecnológica Federal do Paraná'], ['UNILA', 'Universidade Federal da Integração Latino-Americana'], ['UEL', 'Universidade Estadual de Londrina'], ['UEM', 'Universidade Estadual de Maringá'], ['UEPG', 'Universidade Estadual de Ponta Grossa'], ['UNIOESTE', 'Universidade Estadual do Oeste do Paraná'], ['UNICENTRO', 'Universidade Estadual do Centro-Oeste'], ['UENP', 'Universidade Estadual do Norte do Paraná'], ['UNESPAR', 'Universidade Estadual do Paraná'], ['IFPR', 'Instituto Federal do Paraná']],
  PE: [['UFPE', 'Universidade Federal de Pernambuco'], ['UFRPE', 'Universidade Federal Rural de Pernambuco'], ['UFAPE', 'Universidade Federal do Agreste de Pernambuco'], ['UNIVASF', 'Universidade Federal do Vale do São Francisco'], ['UPE', 'Universidade de Pernambuco'], ['IFPE', 'Instituto Federal de Pernambuco']],
  PI: [['UFPI', 'Universidade Federal do Piauí'], ['UFDPar', 'Universidade Federal do Delta do Parnaíba'], ['UESPI', 'Universidade Estadual do Piauí'], ['IFPI', 'Instituto Federal do Piauí']],
  RJ: [['UFRJ', 'Universidade Federal do Rio de Janeiro'], ['UFF', 'Universidade Federal Fluminense'], ['UNIRIO', 'Universidade Federal do Estado do Rio de Janeiro'], ['UFRRJ', 'Universidade Federal Rural do Rio de Janeiro'], ['UERJ', 'Universidade do Estado do Rio de Janeiro'], ['UENF', 'Universidade Estadual do Norte Fluminense'], ['CEFET/RJ', 'Centro Federal de Educação Tecnológica do Rio de Janeiro'], ['IFRJ', 'Instituto Federal do Rio de Janeiro']],
  RN: [['UFRN', 'Universidade Federal do Rio Grande do Norte'], ['UFERSA', 'Universidade Federal Rural do Semi-Árido'], ['UERN', 'Universidade do Estado do Rio Grande do Norte'], ['IFRN', 'Instituto Federal do Rio Grande do Norte']],
  RS: [['UFRGS', 'Universidade Federal do Rio Grande do Sul'], ['UFSM', 'Universidade Federal de Santa Maria'], ['UFPel', 'Universidade Federal de Pelotas'], ['FURG', 'Universidade Federal do Rio Grande'], ['UNIPAMPA', 'Universidade Federal do Pampa'], ['UFCSPA', 'Universidade Federal de Ciências da Saúde de Porto Alegre'], ['UERGS', 'Universidade Estadual do Rio Grande do Sul'], ['IFRS', 'Instituto Federal do Rio Grande do Sul']],
  RO: [['UNIR', 'Universidade Federal de Rondônia'], ['IFRO', 'Instituto Federal de Rondônia']],
  RR: [['UFRR', 'Universidade Federal de Roraima'], ['UERR', 'Universidade Estadual de Roraima'], ['IFRR', 'Instituto Federal de Roraima']],
  SC: [['UFSC', 'Universidade Federal de Santa Catarina'], ['UFFS', 'Universidade Federal da Fronteira Sul'], ['UDESC', 'Universidade do Estado de Santa Catarina'], ['IFSC', 'Instituto Federal de Santa Catarina']],
  SP: [['USP', 'Universidade de São Paulo'], ['UNICAMP', 'Universidade Estadual de Campinas'], ['UNESP', 'Universidade Estadual Paulista'], ['UNIFESP', 'Universidade Federal de São Paulo'], ['UFSCar', 'Universidade Federal de São Carlos'], ['UFABC', 'Universidade Federal do ABC'], ['ITA', 'Instituto Tecnológico de Aeronáutica'], ['FATEC', 'Faculdades de Tecnologia do Estado de São Paulo'], ['IFSP', 'Instituto Federal de São Paulo']],
  SE: [['UFS', 'Universidade Federal de Sergipe'], ['IFS', 'Instituto Federal de Sergipe']],
  TO: [['UFT', 'Universidade Federal do Tocantins'], ['UFNT', 'Universidade Federal do Norte do Tocantins'], ['UNITINS', 'Universidade Estadual do Tocantins'], ['IFTO', 'Instituto Federal do Tocantins']]
};
export const nomeInstituicao = ([sigla, nome]) => `${sigla} (${nome})`;

// Vestibulares próprios mais procurados. banca = estilo de questões autorais da Educa Mais para treinar.
export const VESTIBULARES_BR = [
  { id: 'fuvest', nome: 'FUVEST (USP)', uf: 'SP', banca: 'Estilo FUVEST', detalhe: 'Duas fases; a USP também recebe pelo ENEM (SISU e Provão Paulista)' },
  { id: 'unicamp', nome: 'Vestibular Unicamp (Comvest)', uf: 'SP', banca: 'Estilo UNICAMP', detalhe: 'Duas fases, com questões dissertativas' },
  { id: 'unesp', nome: 'Vestibular Unesp', uf: 'SP', banca: 'Estilo Unesp', detalhe: 'Duas fases' },
  { id: 'ita', nome: 'ITA', uf: 'SP', banca: 'Estilo ITA', detalhe: 'Muito exigente em Matemática, Física e Química' },
  { id: 'ime', nome: 'IME', uf: 'RJ', banca: 'Estilo IME', detalhe: 'Exatas em nível avançado' },
  { id: 'uerj', nome: 'Vestibular UERJ', uf: 'RJ', banca: 'Estilo UERJ', detalhe: 'Exame de qualificação e exame discursivo' },
  { id: 'pas-unb', nome: 'PAS/UnB e vestibular da UnB', uf: 'DF', banca: 'Estilo PAS/UnB', detalhe: 'Itens de certo ou errado; o PAS é feito ao longo do ensino médio' },
  { id: 'ufpr', nome: 'Vestibular UFPR', uf: 'PR', banca: 'Estilo UFPR', detalhe: 'Duas fases' },
  { id: 'ufrgs', nome: 'Vestibular UFRGS', uf: 'RS', banca: 'Estilo UFRGS', detalhe: 'A UFRGS também tem vagas pelo SISU' },
  { id: 'ufsc', nome: 'Vestibular UFSC', uf: 'SC', banca: 'Estilo UFSC', detalhe: 'Questões de somatório' },
  { id: 'uece', nome: 'Vestibular UECE', uf: 'CE', banca: 'Estilo UECE', detalhe: 'Duas fases' },
  { id: 'uea', nome: 'Vestibular UEA', uf: 'AM', banca: 'Estilo UEA', detalhe: 'Vestibular e processo seriado' },
  { id: 'unitins', nome: 'Vestibular UNITINS', uf: 'TO', banca: 'Estilo UNITINS', detalhe: 'Tocantins' },
  { id: 'paes-uema', nome: 'PAES/UEMA', uf: 'MA', banca: 'Estilo PAES/UEMA', detalhe: 'Processo seletivo próprio da UEMA' },
  { id: 'uemasul', nome: 'Vestibular da UEMASUL', uf: 'MA', banca: 'Estilo vestibular UEMASUL', detalhe: 'Imperatriz, Açailândia e região tocantina' },
  { id: 'ifma', nome: 'Seletivo do IFMA (cursos técnicos)', uf: 'MA', banca: 'Estilo seletivo IFMA', detalhe: 'Português e Matemática do ensino fundamental' },
  { id: 'uneb', nome: 'Vestibular UNEB', uf: 'BA', banca: 'Estilo UFBA', detalhe: 'Bahia (treine com o estilo dos vestibulares baianos)' },
  { id: 'upe', nome: 'SSA/UPE (seriado)', uf: 'PE', banca: 'Estilo UFPE', detalhe: 'Seriado de Pernambuco' },
  { id: 'uel', nome: 'Vestibular UEL', uf: 'PR', banca: 'Estilo UFPR', detalhe: 'Paraná' },
  { id: 'uem', nome: 'Vestibular UEM', uf: 'PR', banca: 'Estilo UFPR', detalhe: 'Paraná' },
  { id: 'enem-sisu', nome: 'Universidade federal pelo ENEM (SISU)', uf: null, banca: 'INEP (ENEM)', detalhe: 'A maioria das federais seleciona pela nota do ENEM' }
];
