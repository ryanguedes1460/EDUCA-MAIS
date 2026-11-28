// Estilos de prova do banco de questões. As questões são AUTORAIS da Educa Mais:
// "Estilo FUVEST" quer dizer que a questão segue o jeito daquela prova (nível, tipo de
// contexto, região), e não que ela tenha caído na prova. Cada estilo usa cidades da
// região da prova nos enunciados.
const SP = ['São Paulo', 'Campinas', 'Santos', 'Ribeirão Preto', 'Sorocaba', 'São José dos Campos', 'Bauru', 'Piracicaba'];
const RJ = ['Rio de Janeiro', 'Niterói', 'Petrópolis', 'Duque de Caxias', 'Nova Iguaçu', 'Volta Redonda'];

export const BANCAS = [
  { id: 20, nome: 'Estilo ENEM', cidades: null, peso: 10 },
  { id: 21, nome: 'Estilo FUVEST', cidades: SP, peso: 2, min: 3 },
  { id: 22, nome: 'Estilo UNICAMP', cidades: SP, peso: 2, min: 3 },
  { id: 23, nome: 'Estilo ITA', cidades: ['São José dos Campos', 'Taubaté', 'Jacareí', 'São Paulo', 'Campinas'], peso: 0, duras: 3 },
  { id: 24, nome: 'Estilo IME', cidades: RJ, peso: 0, duras: 3 },
  { id: 25, nome: 'Estilo UFMG', cidades: ['Belo Horizonte', 'Contagem', 'Uberlândia', 'Juiz de Fora', 'Montes Claros', 'Ouro Preto', 'Betim'], peso: 1.5 },
  { id: 26, nome: 'Estilo PAS/UnB', cidades: ['Brasília', 'Taguatinga', 'Ceilândia', 'Sobradinho', 'Gama', 'Planaltina', 'Samambaia'], peso: 1.5 },
  { id: 27, nome: 'Estilo UEMA', cidades: ['São Luís', 'Imperatriz', 'Caxias', 'Timon', 'Bacabal', 'Codó', 'Balsas'], peso: 1.5 },
  { id: 28, nome: 'Estilo UNITINS', cidades: ['Palmas', 'Araguaína', 'Gurupi', 'Porto Nacional', 'Paraíso do Tocantins', 'Augustinópolis'], peso: 1.5 },
  { id: 29, nome: 'Estilo UERJ', cidades: RJ, peso: 1 },
  { id: 30, nome: 'Estilo UFPR', cidades: ['Curitiba', 'Londrina', 'Maringá', 'Ponta Grossa', 'Cascavel', 'Foz do Iguaçu'], peso: 1 },
  { id: 31, nome: 'Estilo UFRGS', cidades: ['Porto Alegre', 'Caxias do Sul', 'Pelotas', 'Santa Maria', 'Canoas', 'Passo Fundo'], peso: 1 },
  { id: 32, nome: 'Estilo UFSC', cidades: ['Florianópolis', 'Joinville', 'Blumenau', 'Chapecó', 'Criciúma', 'Itajaí'], peso: 1 },
  { id: 33, nome: 'Estilo UFPE', cidades: ['Recife', 'Olinda', 'Caruaru', 'Petrolina', 'Jaboatão dos Guararapes', 'Garanhuns'], peso: 1 },
  { id: 34, nome: 'Estilo UFBA', cidades: ['Salvador', 'Feira de Santana', 'Vitória da Conquista', 'Ilhéus', 'Juazeiro', 'Itabuna'], peso: 1 },
  { id: 35, nome: 'Estilo UECE', cidades: ['Fortaleza', 'Juazeiro do Norte', 'Sobral', 'Crato', 'Caucaia', 'Quixadá'], peso: 1 },
  { id: 36, nome: 'Estilo UFPA', cidades: ['Belém', 'Ananindeua', 'Santarém', 'Marabá', 'Castanhal', 'Altamira'], peso: 1 },
  { id: 37, nome: 'Estilo UEA', cidades: ['Manaus', 'Parintins', 'Itacoatiara', 'Manacapuru', 'Tefé', 'Coari'], peso: 1 },
  { id: 38, nome: 'Estilo UFG', cidades: ['Goiânia', 'Anápolis', 'Aparecida de Goiânia', 'Rio Verde', 'Catalão', 'Jataí'], peso: 1 },
  { id: 39, nome: 'Estilo Unesp', cidades: ['Bauru', 'Botucatu', 'Araraquara', 'Presidente Prudente', 'São José do Rio Preto', 'Marília'], peso: 1, duras: 1 },
  { id: 40, nome: 'Estilo UFPI', cidades: ['Teresina', 'Parnaíba', 'Picos', 'Floriano'], peso: 0.7 },
  { id: 41, nome: 'Estilo UFRN', cidades: ['Natal', 'Mossoró', 'Caicó', 'Parnamirim'], peso: 0.7 },
  { id: 42, nome: 'Estilo UFMT', cidades: ['Cuiabá', 'Várzea Grande', 'Rondonópolis', 'Sinop'], peso: 0.7 },
  { id: 43, nome: 'Estilo UFMS', cidades: ['Campo Grande', 'Dourados', 'Três Lagoas', 'Corumbá'], peso: 0.7 },
  { id: 44, nome: 'Estilo UFES', cidades: ['Vitória', 'Vila Velha', 'Serra', 'Cachoeiro de Itapemirim'], peso: 0.7 },
  { id: 45, nome: 'Estilo UFAL', cidades: ['Maceió', 'Arapiraca', 'Palmeira dos Índios', 'Penedo'], peso: 0.7 },
  { id: 46, nome: 'Estilo UFS', cidades: ['Aracaju', 'Lagarto', 'Itabaiana', 'Estância'], peso: 0.7 },
  { id: 47, nome: 'Estilo UFPB', cidades: ['João Pessoa', 'Campina Grande', 'Patos', 'Sousa'], peso: 0.7 },
  { id: 48, nome: 'Estilo UNIR', cidades: ['Porto Velho', 'Ji-Paraná', 'Ariquemes', 'Vilhena'], peso: 0.5 },
  { id: 49, nome: 'Estilo UFRR', cidades: ['Boa Vista', 'Rorainópolis', 'Caracaraí'], peso: 0.5 },
  { id: 50, nome: 'Estilo UNIFAP', cidades: ['Macapá', 'Santana', 'Laranjal do Jari'], peso: 0.5 },
  { id: 51, nome: 'Estilo UFAC', cidades: ['Rio Branco', 'Cruzeiro do Sul', 'Sena Madureira'], peso: 0.5 }
];

const EXATAS = new Set(['Matemática', 'Física', 'Química']);
const peso = (b, fam) => {
  const d = fam.difficulty;
  if (d >= 5) return EXATAS.has(fam.subject) ? (b.duras || 0) : (b.min ? b.peso : 0);
  if (d >= 4 && EXATAS.has(fam.subject)) return (b.duras || 0) + (b.min ? b.peso : 0) + (b.id === 20 ? 2 : 0);
  if (b.duras && !b.peso) return 0;                 // ITA e IME só nas questões difíceis de exatas
  if (b.min && d < b.min) return 0;                 // FUVEST e UNICAMP a partir da dificuldade 3
  if (fam.level === 'fundamental' && b.id !== 20) return b.peso / 2;
  return b.peso;
};

/** Sorteia o estilo de prova de uma questão, de acordo com a matéria e a dificuldade. */
export function escolherBanca(r, fam) {
  const ws = BANCAS.map(b => peso(b, fam)), tot = ws.reduce((a, b) => a + b, 0);
  let x = r.next() * tot;
  for (let i = 0; i < BANCAS.length; i++) { x -= ws[i]; if (x < 0) return BANCAS[i]; }
  return BANCAS[0];
}
