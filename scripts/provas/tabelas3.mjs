// Versão 2.3: tabelas de conceitos (autorais) para os conteúdos do ensino médio que faltavam:
// Biologia, Química conceitual, História, Geografia, Filosofia, Sociologia e Língua Portuguesa.
// Cada linha da tabela vira questões nos dois sentidos (conceito → descrição e descrição → conceito).
import { opcoes } from '../banco/util.mjs';

function familia({ subject, topic, level = 'enem', difficulty = 2, itens, formatos, explicar, dica, extras = {} }) {
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
// Atalho: tabela "a ↔ b" com duas perguntas prontas
const T = (subject, topic, itens, { q1, q2, dica, level = 'enem', difficulty = 2, extras, exp }) => familia({
  subject, topic, level, difficulty, itens, dica, extras,
  formatos: [it => ({ campo: 'a', statement: q1(it) }), ...(q2 ? [it => ({ campo: 'b', statement: q2(it) })] : [])],
  explicar: exp || (it => `${it.a}: ${it.b}.`)
});

// ============================ BIOLOGIA ============================
const BIO = [
  T('Biologia', ['Citologia', 'Divisão celular'], [
    { a: 'Mitose', b: 'divisão em que uma célula origina duas células-filhas geneticamente iguais, com o mesmo número de cromossomos' },
    { a: 'Meiose', b: 'divisão que forma quatro células com metade do número de cromossomos, gerando variabilidade genética' },
    { a: 'Prófase', b: 'fase em que os cromossomos se condensam e a carioteca começa a se desfazer' },
    { a: 'Metáfase', b: 'fase em que os cromossomos, bem condensados, se alinham no plano equatorial da célula' },
    { a: 'Anáfase', b: 'fase em que as cromátides-irmãs se separam e migram para polos opostos' },
    { a: 'Telófase', b: 'fase em que a carioteca se refaz e os cromossomos se descondensam nos dois novos núcleos' },
    { a: 'Crossing-over', b: 'troca de pedaços entre cromossomos homólogos na prófase I da meiose' }
  ], { q1: it => `Na divisão celular, qual termo corresponde a: ${it.b}?`, q2: it => `Na divisão celular, o termo "${it.a}" se refere a:`, dica: 'A meiose reduz o número de cromossomos pela metade; a mitose mantém.' }),
  T('Biologia', ['Embriologia', 'Folhetos e anexos embrionários'], [
    { a: 'Ectoderme', b: 'folheto que origina a epiderme, os pelos, as unhas e o sistema nervoso' },
    { a: 'Mesoderme', b: 'folheto que origina músculos, ossos, sangue, coração e rins' },
    { a: 'Endoderme', b: 'folheto que origina o revestimento interno do tubo digestório e respiratório, o fígado e o pâncreas' },
    { a: 'Âmnio', b: 'anexo que forma uma bolsa com líquido que protege o embrião contra choques e desidratação' },
    { a: 'Placenta', b: 'anexo dos mamíferos placentários que faz trocas de nutrientes, gases e excretas entre mãe e feto' },
    { a: 'Saco vitelínico', b: 'anexo que armazena reservas nutritivas (vitelo), muito desenvolvido em aves e répteis' },
    { a: 'Alantoide', b: 'anexo que armazena excretas e participa das trocas gasosas no ovo de répteis e aves' }
  ], { q1: it => `Em embriologia, qual estrutura corresponde a: ${it.b}?`, q2: it => `Em embriologia, qual descrição corresponde a ${it.a}?`, dica: 'Ecto = fora (pele e nervos); endo = dentro (tubo digestório); meso = meio (músculo, osso, sangue).' }),
  T('Biologia', ['Histologia', 'Tecidos animais'], [
    { a: 'Tecido epitelial', b: 'tecido de células justapostas, com pouca substância entre elas, que reveste superfícies e forma glândulas' },
    { a: 'Tecido conjuntivo', b: 'tecido com muita matriz extracelular, que une, sustenta e preenche (inclui osso, cartilagem e sangue)' },
    { a: 'Tecido muscular', b: 'tecido de células alongadas com actina e miosina, especializado em contração' },
    { a: 'Tecido nervoso', b: 'tecido formado por neurônios e células da glia, que conduz impulsos elétricos' },
    { a: 'Tecido adiposo', b: 'tipo de conjuntivo que armazena gordura e funciona como isolante térmico' }
  ], { q1: it => `Qual tecido do corpo humano corresponde a: ${it.b}?`, q2: it => `O ${it.a.toLowerCase()} é caracterizado como:`, dica: 'Pense na função: revestir, sustentar, contrair ou conduzir.' }),
  T('Biologia', ['Fisiologia humana', 'Sistemas do corpo humano'], [
    { a: 'Sistema digestório', b: 'transforma os alimentos em moléculas menores e absorve os nutrientes, principalmente no intestino delgado' },
    { a: 'Sistema respiratório', b: 'faz as trocas gasosas nos alvéolos pulmonares, por difusão de O₂ e CO₂' },
    { a: 'Sistema circulatório', b: 'transporta gases, nutrientes, hormônios e células de defesa pelo sangue, bombeado pelo coração' },
    { a: 'Sistema excretor', b: 'filtra o sangue nos néfrons dos rins e elimina a ureia pela urina' },
    { a: 'Sistema endócrino', b: 'produz hormônios em glândulas que os lançam no sangue para regular o corpo' },
    { a: 'Sistema nervoso', b: 'recebe estímulos, integra informações e coordena respostas por impulsos nervosos' },
    { a: 'Sistema imunológico', b: 'defende o corpo contra agentes estranhos por meio de anticorpos e células de defesa' }
  ], { q1: it => `Qual sistema do corpo humano tem esta função: ${it.b}?`, q2: it => `Qual é a principal função do ${it.a.toLowerCase()}?`, dica: 'Associe o órgão principal ao sistema: pulmões, rins, coração, glândulas.' }),
  T('Biologia', ['Microbiologia', 'Doenças e seus agentes'], [
    { a: 'Vírus', b: 'agente da dengue, da gripe, do sarampo e da covid-19' },
    { a: 'Bactéria', b: 'agente da tuberculose, da hanseníase, do tétano e da leptospirose' },
    { a: 'Protozoário', b: 'agente da malária, da doença de Chagas e da leishmaniose' },
    { a: 'Fungo', b: 'agente das micoses de pele e da candidíase' },
    { a: 'Verme (helminto)', b: 'agente da esquistossomose, da ascaridíase e da teníase' }
  ], { q1: it => `Que tipo de agente causa estas doenças: ${it.b.replace(/^agente d[aoe]s? /, '')}?`, dica: 'Antibiótico só funciona contra bactérias; vacinas existem para vírus e bactérias.',
    exp: it => `${it.a}: ${it.b}.` }),
  T('Biologia', ['Botânica', 'Grupos de plantas'], [
    { a: 'Briófitas', b: 'plantas sem vasos condutores, pequenas e de lugares úmidos, como os musgos' },
    { a: 'Pteridófitas', b: 'plantas com vasos condutores, mas sem sementes, como as samambaias' },
    { a: 'Gimnospermas', b: 'plantas com sementes, mas sem frutos (sementes "nuas"), como os pinheiros' },
    { a: 'Angiospermas', b: 'plantas com flores, sementes e frutos, o grupo mais numeroso' }
  ], { q1: it => `Qual grupo vegetal corresponde a: ${it.b}?`, q2: it => `Qual alternativa descreve corretamente as ${it.a.toLowerCase()}?`, extras: { a: ['Algas pardas', 'Líquens'], b: ['seres sem clorofila que fazem simbiose com raízes', 'organismos unicelulares sem parede celular'] }, dica: 'Sequência evolutiva: vasos → sementes → flores e frutos.' }),
  T('Biologia', ['Botânica', 'Tecidos e órgãos vegetais'], [
    { a: 'Xilema', b: 'tecido que conduz água e sais minerais da raiz até as folhas (seiva bruta)' },
    { a: 'Floema', b: 'tecido que conduz a seiva elaborada, com açúcares produzidos na fotossíntese' },
    { a: 'Meristema', b: 'tecido de células indiferenciadas responsável pelo crescimento da planta' },
    { a: 'Estômatos', b: 'estruturas da epiderme da folha que controlam as trocas gasosas e a transpiração' },
    { a: 'Parênquima clorofiliano', b: 'tecido da folha rico em cloroplastos, onde ocorre a maior parte da fotossíntese' }
  ], { q1: it => `Na anatomia vegetal, qual estrutura corresponde a: ${it.b}?`, q2: it => `Na anatomia vegetal, qual é a função de ${it.a.toLowerCase()}?`, dica: 'Xilema sobe com água; floema distribui açúcar.' }),
  T('Biologia', ['Zoologia', 'Características dos grupos animais'], [
    { a: 'Poríferos', b: 'animais sem tecidos verdadeiros, com o corpo cheio de poros, como as esponjas' },
    { a: 'Cnidários', b: 'animais com células urticantes (cnidócitos), como águas-vivas e corais' },
    { a: 'Platelmintos', b: 'vermes de corpo achatado, como a tênia e o esquistossomo' },
    { a: 'Nematelmintos', b: 'vermes de corpo cilíndrico, como a lombriga' },
    { a: 'Anelídeos', b: 'animais de corpo segmentado em anéis, como a minhoca e a sanguessuga' },
    { a: 'Moluscos', b: 'animais de corpo mole, muitos com concha, como caramujos e polvos' },
    { a: 'Artrópodes', b: 'animais com exoesqueleto de quitina e patas articuladas, como insetos e crustáceos' },
    { a: 'Equinodermos', b: 'animais marinhos com espinhos e sistema ambulacrário, como a estrela-do-mar' }
  ], { q1: it => `Qual grupo animal corresponde a: ${it.b}?`, q2: it => `Qual alternativa descreve corretamente os ${it.a.toLowerCase()}?`, dica: 'Achatado = platelminto; cilíndrico = nematelminto; anéis = anelídeo.' }),
  T('Biologia', ['Evolução', 'Teorias evolutivas'], [
    { a: 'Lamarckismo', b: 'teoria do uso e desuso e da herança dos caracteres adquiridos' },
    { a: 'Darwinismo', b: 'teoria da seleção natural: os mais adaptados sobrevivem e deixam mais descendentes' },
    { a: 'Neodarwinismo', b: 'teoria sintética, que junta a seleção natural com mutação e recombinação genética' },
    { a: 'Fixismo', b: 'ideia de que as espécies foram criadas como são e não mudam' },
    { a: 'Especiação', b: 'formação de novas espécies, por exemplo após isolamento geográfico e reprodutivo' }
  ], { q1: it => `Na história da biologia, qual ideia corresponde a: ${it.b}?`, q2: it => `Qual ideia é defendida pelo ${it.a.toLowerCase()}?`, dica: 'Lamarck: uso e desuso. Darwin: seleção natural.' }),
  T('Biologia', ['Ecologia', 'Ciclos biogeoquímicos'], [
    { a: 'Fixação do nitrogênio', b: 'transformação do N₂ do ar em compostos nitrogenados por bactérias, como as do gênero Rhizobium' },
    { a: 'Nitrificação', b: 'transformação da amônia em nitrito e depois em nitrato por bactérias do solo' },
    { a: 'Desnitrificação', b: 'devolução do nitrogênio ao ar na forma de N₂, feita por bactérias' },
    { a: 'Fotossíntese', b: 'processo que retira CO₂ da atmosfera e produz glicose e O₂' },
    { a: 'Respiração celular', b: 'processo que consome O₂ e libera CO₂, devolvendo carbono ao ambiente' },
    { a: 'Evapotranspiração', b: 'saída de água para a atmosfera pela evaporação e pela transpiração das plantas' }
  ], { q1: it => `Nos ciclos da matéria, qual processo corresponde a: ${it.b}?`, q2: it => `Nos ciclos biogeoquímicos, o que é a ${it.a.toLowerCase()}?`, dica: 'Leguminosas abrigam bactérias fixadoras de nitrogênio nas raízes.' })
];

// ============================ QUÍMICA (conceitos) ============================
const QUI = [
  T('Química', ['Química geral', 'Separação de misturas'], [
    { a: 'Filtração', b: 'separar um sólido não dissolvido de um líquido, como areia na água' },
    { a: 'Destilação simples', b: 'separar um sólido dissolvido de um líquido, recuperando o líquido, como sal e água' },
    { a: 'Destilação fracionada', b: 'separar líquidos miscíveis com pontos de ebulição diferentes, como no refino do petróleo' },
    { a: 'Decantação com funil de separação', b: 'separar líquidos imiscíveis, como água e óleo' },
    { a: 'Separação magnética', b: 'separar limalha de ferro de outros sólidos usando um ímã' },
    { a: 'Centrifugação', b: 'acelerar a separação de partículas em suspensão girando a mistura em alta velocidade' },
    { a: 'Evaporação', b: 'obter o sal de cozinha nas salinas, deixando a água evaporar ao sol' }
  ], { q1: it => `Qual método é mais adequado para ${it.b}?`, dica: 'Pense no estado físico dos componentes e se eles se misturam.', exp: it => `${it.a} é o método usado para ${it.b}.` }),
  T('Química', ['Ligações químicas', 'Geometria molecular e polaridade'], [
    { a: 'Linear e apolar', b: 'CO₂' }, { a: 'Angular e polar', b: 'H₂O' }, { a: 'Piramidal e polar', b: 'NH₃' },
    { a: 'Tetraédrica e apolar', b: 'CH₄' }, { a: 'Trigonal plana e apolar', b: 'BF₃' }, { a: 'Linear e polar', b: 'HCl' }
  ], { q1: it => `Qual é a geometria e a polaridade da molécula de ${it.b}?`, q2: it => `Qual destas moléculas é ${it.a.toLowerCase()}?`, difficulty: 3, level: 'medio',
    dica: 'Pares de elétrons livres no átomo central entortam a molécula e costumam deixá-la polar.', exp: it => `${it.b}: geometria ${it.a.toLowerCase()}.` }),
  T('Química', ['Funções inorgânicas', 'Nomenclatura de ácidos, bases e sais'], [
    { a: 'HCl', b: 'ácido clorídrico' }, { a: 'H₂SO₄', b: 'ácido sulfúrico' }, { a: 'HNO₃', b: 'ácido nítrico' }, { a: 'H₃PO₄', b: 'ácido fosfórico' },
    { a: 'H₂CO₃', b: 'ácido carbônico' }, { a: 'NaOH', b: 'hidróxido de sódio' }, { a: 'Ca(OH)₂', b: 'hidróxido de cálcio' }, { a: 'NaCl', b: 'cloreto de sódio' },
    { a: 'CaCO₃', b: 'carbonato de cálcio' }, { a: 'NaHCO₃', b: 'bicarbonato de sódio (hidrogenocarbonato de sódio)' }, { a: 'Mg(OH)₂', b: 'hidróxido de magnésio' }
  ], { q1: it => `Qual é a fórmula do ${it.b}?`, q2: it => `Qual é o nome da substância ${it.a}?`, dica: 'Ácidos começam com H; bases terminam em OH; sais juntam o cátion da base com o ânion do ácido.' }),
  T('Química', ['Química orgânica', 'Funções orgânicas'], [
    { a: 'Álcool', b: 'hidroxila (–OH) ligada a carbono saturado, como no etanol' },
    { a: 'Ácido carboxílico', b: 'grupo carboxila (–COOH), como no ácido acético do vinagre' },
    { a: 'Aldeído', b: 'carbonila na ponta da cadeia (–CHO), como no formol (metanal)' },
    { a: 'Cetona', b: 'carbonila entre dois carbonos, como na acetona (propanona)' },
    { a: 'Éster', b: 'grupo –COO– entre carbonos, responsável por aromas de frutas' },
    { a: 'Amina', b: 'derivado da amônia com nitrogênio ligado a carbono, como na metilamina' },
    { a: 'Fenol', b: 'hidroxila ligada diretamente a um anel aromático' },
    { a: 'Éter', b: 'oxigênio entre dois carbonos (R–O–R), como no éter etílico' }
  ], { q1: it => `Qual função orgânica tem esta característica: ${it.b}?`, q2: it => `A função ${it.a.toLowerCase()} é caracterizada por:`, level: 'medio', difficulty: 3, dica: 'Localize o grupo funcional: onde está o oxigênio ou o nitrogênio?' }),
  T('Química', ['Propriedades coligativas', 'Efeitos coligativos'], [
    { a: 'Tonoscopia', b: 'diminuição da pressão de vapor de um solvente ao dissolver um soluto não volátil' },
    { a: 'Ebulioscopia', b: 'aumento da temperatura de ebulição de um solvente ao dissolver um soluto não volátil' },
    { a: 'Crioscopia', b: 'diminuição da temperatura de congelamento de um solvente ao dissolver um soluto, como no sal jogado no gelo' },
    { a: 'Osmose', b: 'passagem de solvente por membrana semipermeável do meio menos concentrado para o mais concentrado' }
  ], { q1: it => `Qual efeito coligativo corresponde a: ${it.b}?`, q2: it => `O que é a ${it.a.toLowerCase()}?`, level: 'medio', difficulty: 3, extras: { a: ['Eletrólise', 'Titulação'], b: ['separação de líquidos por diferença de densidade', 'reação de neutralização entre ácido e base'] }, dica: 'Efeitos coligativos dependem do número de partículas dissolvidas, não do tipo.' }),
  T('Química', ['Tabela periódica', 'Propriedades periódicas'], [
    { a: 'Raio atômico', b: 'aumenta de cima para baixo na família e da direita para a esquerda no período' },
    { a: 'Eletronegatividade', b: 'tendência de atrair elétrons numa ligação, maior no flúor' },
    { a: 'Energia de ionização', b: 'energia para retirar um elétron de um átomo gasoso, maior nos gases nobres' },
    { a: 'Afinidade eletrônica', b: 'energia liberada quando um átomo gasoso recebe um elétron, alta nos halogênios' },
    { a: 'Caráter metálico', b: 'facilidade de perder elétrons, maior no frâncio e no césio' }
  ], { q1: it => `Qual propriedade periódica é descrita assim: ${it.b}?`, level: 'medio', difficulty: 3, dica: 'Raio cresce para baixo e para a esquerda; eletronegatividade cresce para cima e para a direita.' })
];

// ============================ HISTÓRIA ============================
const HIS = [
  T('História', ['História do Brasil', 'Linha do tempo do Brasil'], [
    { a: '1534', b: 'criação das capitanias hereditárias' }, { a: '1549', b: 'chegada de Tomé de Sousa e fundação de Salvador, sede do Governo-Geral' },
    { a: '1789', b: 'Inconfidência Mineira' }, { a: '1798', b: 'Conjuração Baiana (Revolta dos Alfaiates)' }, { a: '1808', b: 'chegada da família real portuguesa e abertura dos portos' },
    { a: '1822', b: 'Independência do Brasil' }, { a: '1824', b: 'primeira Constituição do Brasil, com o Poder Moderador' }, { a: '1850', b: 'Lei Eusébio de Queirós, que proibiu o tráfico de africanos escravizados' },
    { a: '1888', b: 'Lei Áurea, que aboliu a escravidão' }, { a: '1889', b: 'Proclamação da República' }, { a: '1922', b: 'Semana de Arte Moderna em São Paulo' },
    { a: '1930', b: 'Revolução que levou Getúlio Vargas ao poder' }, { a: '1943', b: 'Consolidação das Leis do Trabalho (CLT)' }, { a: '1960', b: 'inauguração de Brasília' },
    { a: '1964', b: 'golpe que iniciou a ditadura civil-militar' }, { a: '1968', b: 'Ato Institucional nº 5 (AI-5)' }, { a: '1988', b: 'promulgação da Constituição Cidadã' }, { a: '1994', b: 'lançamento do Plano Real' }
  ], { q1: it => `Em que ano ocorreu este fato da história do Brasil: ${it.b}?`, q2: it => `Na história do Brasil, o ano de ${it.a} é marcado por:`, dica: 'Monte uma linha do tempo por períodos: Colônia, Império, República.' }),
  T('História', ['História do Brasil', 'Revoltas e movimentos'], [
    { a: 'Cabanagem', b: 'revolta popular no Pará (1835–1840), durante o período regencial' }, { a: 'Balaiada', b: 'revolta no Maranhão (1838–1841), com vaqueiros, escravizados e sertanejos pobres' },
    { a: 'Farroupilha', b: 'revolta no Rio Grande do Sul (1835–1845) que proclamou a República Rio-Grandense' }, { a: 'Sabinada', b: 'revolta na Bahia (1837–1838) que declarou a República Bahiense provisória' },
    { a: 'Guerra de Canudos', b: 'conflito no sertão da Bahia (1896–1897) contra a comunidade liderada por Antônio Conselheiro' }, { a: 'Revolta da Vacina', b: 'reação popular no Rio de Janeiro (1904) contra a vacinação obrigatória' },
    { a: 'Revolta da Chibata', b: 'motim de marinheiros (1910) contra os castigos físicos, liderado por João Cândido' }, { a: 'Quilombo dos Palmares', b: 'maior quilombo do período colonial, na Serra da Barriga, liderado por Zumbi' }
  ], { q1: it => `Qual movimento é descrito assim: ${it.b}?`, q2: it => `A ${it.a} foi:`, dica: 'Regência (1831–1840): Cabanagem, Balaiada, Farroupilha e Sabinada.' }),
  T('História', ['História Geral', 'Linha do tempo mundial'], [
    { a: '1453', b: 'tomada de Constantinopla pelos turcos otomanos, marco do fim da Idade Média' }, { a: '1492', b: 'chegada de Cristóvão Colombo à América' },
    { a: '1517', b: 'início da Reforma Protestante, com as 95 teses de Lutero' }, { a: '1688', b: 'Revolução Gloriosa na Inglaterra' },
    { a: '1776', b: 'Independência dos Estados Unidos' }, { a: '1789', b: 'início da Revolução Francesa, com a Queda da Bastilha' },
    { a: '1815', b: 'Congresso de Viena, após a derrota de Napoleão' }, { a: '1914', b: 'início da Primeira Guerra Mundial' },
    { a: '1917', b: 'Revolução Russa' }, { a: '1929', b: 'quebra da Bolsa de Nova York e início da Grande Depressão' },
    { a: '1939', b: 'início da Segunda Guerra Mundial' }, { a: '1949', b: 'Revolução Chinesa, liderada por Mao Tsé-Tung' }, { a: '1989', b: 'queda do Muro de Berlim' }
  ], { q1: it => `Em que ano aconteceu: ${it.b}?`, q2: it => `O ano de ${it.a} é marcado por:`, dica: 'Associe cada data a um processo maior: Idade Moderna, revoluções, guerras.' }),
  T('História', ['História Geral', 'Conceitos e períodos'], [
    { a: 'Feudalismo', b: 'sistema da Europa medieval baseado na terra, na relação entre suseranos e vassalos e no trabalho servil' },
    { a: 'Absolutismo', b: 'concentração do poder nas mãos do rei, justificada pelo direito divino' },
    { a: 'Mercantilismo', b: 'conjunto de práticas econômicas que buscavam acumular metais e manter a balança comercial favorável' },
    { a: 'Iluminismo', b: 'movimento do século XVIII que defendia a razão, a liberdade e criticava o absolutismo' },
    { a: 'Renascimento', b: 'movimento cultural que valorizou o ser humano (antropocentrismo) e a Antiguidade clássica' },
    { a: 'Neocolonialismo', b: 'partilha da África e da Ásia pelas potências industriais no século XIX' },
    { a: 'Guerra Fria', b: 'disputa ideológica entre EUA e URSS após 1945, sem confronto direto entre as duas potências' },
    { a: 'Nazifascismo', b: 'regimes totalitários de extrema direita na Itália e na Alemanha do entreguerras' }
  ], { q1: it => `Qual conceito histórico corresponde a: ${it.b}?`, q2: it => `Na história, o ${it.a.toLowerCase()} foi:`, dica: 'Pense no período: medieval, moderno ou contemporâneo.' })
];

// ============================ GEOGRAFIA ============================
const GEO = [
  T('Geografia', ['Geologia', 'Tipos de rochas'], [
    { a: 'Granito', b: 'rocha magmática intrusiva, formada pelo resfriamento lento do magma no interior da crosta' },
    { a: 'Basalto', b: 'rocha magmática extrusiva, formada pelo resfriamento rápido da lava na superfície' },
    { a: 'Arenito', b: 'rocha sedimentar formada pela compactação de grãos de areia' },
    { a: 'Calcário', b: 'rocha sedimentar rica em carbonato de cálcio, usada na fabricação de cimento' },
    { a: 'Mármore', b: 'rocha metamórfica originada do calcário submetido a calor e pressão' },
    { a: 'Gnaisse', b: 'rocha metamórfica originada principalmente do granito' }
  ], { q1: it => `Qual rocha corresponde a: ${it.b}?`, q2: it => `Como se classifica e se forma o ${it.a.toLowerCase()}?`, dica: 'Magmáticas vêm do magma; sedimentares, de sedimentos; metamórficas, da transformação de outras.' }),
  T('Geografia', ['Climatologia', 'Fenômenos climáticos'], [
    { a: 'Inversão térmica', b: 'camada de ar quente sobre ar frio que impede a dispersão de poluentes, comum em manhãs de inverno nas cidades' },
    { a: 'Ilha de calor', b: 'temperatura mais alta no centro das cidades por causa do asfalto, do concreto e da pouca vegetação' },
    { a: 'Chuva ácida', b: 'precipitação com ácidos formados a partir de óxidos de enxofre e nitrogênio lançados por indústrias e veículos' },
    { a: 'El Niño', b: 'aquecimento anormal das águas do Pacífico equatorial que tende a causar seca no Nordeste e chuvas no Sul' },
    { a: 'La Niña', b: 'resfriamento anormal das águas do Pacífico equatorial, com efeitos em geral opostos aos do El Niño' },
    { a: 'Efeito estufa', b: 'retenção natural de calor por gases como CO₂ e metano, intensificada pela ação humana' }
  ], { q1: it => `Qual fenômeno corresponde a: ${it.b}?`, q2: it => `O que é o fenômeno chamado ${it.a.toLowerCase()}?`, dica: 'Diferencie fenômenos naturais dos intensificados pela ação humana.' }),
  T('Geografia', ['Climatologia', 'Massas de ar do Brasil'], [
    { a: 'Massa Equatorial continental (mEc)', b: 'massa quente e úmida da Amazônia, que leva chuvas de verão ao interior do país' },
    { a: 'Massa Tropical atlântica (mTa)', b: 'massa quente e úmida do oceano Atlântico, que atua no litoral leste' },
    { a: 'Massa Polar atlântica (mPa)', b: 'massa fria e úmida que causa quedas de temperatura e friagem no inverno' },
    { a: 'Massa Tropical continental (mTc)', b: 'massa quente e seca formada na região do Chaco' },
    { a: 'Massa Equatorial atlântica (mEa)', b: 'massa quente e úmida que atua no litoral do Norte e do Nordeste' }
  ], { q1: it => `Qual massa de ar é descrita assim: ${it.b}?`, level: 'medio', difficulty: 3, dica: 'Equatorial e tropical são quentes; polar é fria; continental tende a ser mais seca.' }),
  T('Geografia', ['Geografia urbana', 'Urbanização'], [
    { a: 'Conurbação', b: 'encontro físico das manchas urbanas de duas ou mais cidades vizinhas' },
    { a: 'Metrópole', b: 'grande cidade que polariza uma região, com muitos serviços e influência sobre outras cidades' },
    { a: 'Megalópole', b: 'junção de duas ou mais metrópoles por uma faixa urbana contínua' },
    { a: 'Gentrificação', b: 'valorização de um bairro que expulsa os moradores mais pobres pelo aumento do custo de vida' },
    { a: 'Macrocefalia urbana', b: 'crescimento exagerado de grandes cidades sem infraestrutura e serviços suficientes' },
    { a: 'Segregação socioespacial', b: 'separação dos grupos sociais no espaço urbano conforme a renda' }
  ], { q1: it => `Qual conceito de geografia urbana corresponde a: ${it.b}?`, q2: it => `Em geografia urbana, o que significa ${it.a.toLowerCase()}?`, dica: 'Conurbação junta cidades; megalópole junta metrópoles.' }),
  T('Geografia', ['Geopolítica', 'Blocos econômicos'], [
    { a: 'Mercosul', b: 'bloco formado em 1991 por Brasil, Argentina, Uruguai e Paraguai' },
    { a: 'União Europeia', b: 'bloco europeu com livre circulação de pessoas e, em muitos países, moeda única (euro)' },
    { a: 'USMCA (antigo Nafta)', b: 'acordo comercial entre Estados Unidos, México e Canadá' },
    { a: 'ASEAN', b: 'associação de nações do Sudeste Asiático' },
    { a: 'BRICS', b: 'grupo de economias emergentes criado com Brasil, Rússia, Índia, China e, depois, África do Sul' }
  ], { q1: it => `Qual bloco ou grupo corresponde a: ${it.b}?`, q2: it => `Qual alternativa descreve corretamente o ${it.a}?`, dica: 'Lembre-se dos países que fundaram cada bloco.' }),
  T('Geografia', ['População', 'Conceitos demográficos'], [
    { a: 'Crescimento vegetativo', b: 'diferença entre a taxa de natalidade e a taxa de mortalidade' },
    { a: 'Transição demográfica', b: 'passagem de altas taxas de natalidade e mortalidade para taxas baixas, com envelhecimento da população' },
    { a: 'Êxodo rural', b: 'migração em massa do campo para as cidades' },
    { a: 'Migração pendular', b: 'deslocamento diário entre a cidade onde se mora e a cidade onde se trabalha ou estuda' },
    { a: 'Bônus demográfico', b: 'fase em que a população em idade de trabalhar é proporcionalmente maior que a de dependentes' },
    { a: 'IDH', b: 'índice que combina renda, educação e expectativa de vida' }
  ], { q1: it => `Qual conceito de demografia corresponde a: ${it.b}?`, q2: it => `Em demografia, qual é o significado de ${it.a.toLowerCase()}?`, dica: 'Pense em natalidade, mortalidade e migração.' })
];

// ============================ FILOSOFIA ============================
const FIL = [
  T('Filosofia', ['História da filosofia', 'Pensadores e ideias'], [
    { a: 'Heráclito', b: 'tudo flui: "ninguém se banha duas vezes no mesmo rio"' }, { a: 'Parmênides', b: 'o ser é imutável e o movimento é ilusão dos sentidos' },
    { a: 'Sócrates', b: 'maiêutica e "só sei que nada sei"' }, { a: 'Platão', b: 'mundo das ideias e alegoria da caverna' },
    { a: 'Aristóteles', b: 'ato e potência e a ética da virtude como justo meio' }, { a: 'Epicuro', b: 'a felicidade como prazer moderado e ausência de perturbação (ataraxia)' },
    { a: 'Santo Agostinho', b: 'conhecimento por iluminação divina e a obra "Cidade de Deus"' }, { a: 'Tomás de Aquino', b: 'conciliação entre fé e razão e as cinco vias para provar a existência de Deus' },
    { a: 'Maquiavel', b: 'separação entre ética e política, com virtù e fortuna, em "O Príncipe"' }, { a: 'Descartes', b: 'dúvida metódica e "penso, logo existo"' },
    { a: 'Francis Bacon', b: 'método indutivo e a crítica aos "ídolos" que atrapalham o conhecimento' }, { a: 'John Locke', b: 'a mente como tábula rasa e o direito natural à vida, à liberdade e à propriedade' },
    { a: 'Thomas Hobbes', b: 'estado de natureza como guerra de todos contra todos e o Estado forte do "Leviatã"' }, { a: 'Rousseau', b: 'contrato social e vontade geral; o ser humano nasce bom e a sociedade o corrompe' },
    { a: 'Montesquieu', b: 'separação dos poderes em Executivo, Legislativo e Judiciário' }, { a: 'David Hume', b: 'ceticismo empirista: a causalidade vem do hábito' },
    { a: 'Kant', b: 'imperativo categórico e a síntese entre racionalismo e empirismo' }, { a: 'Hegel', b: 'dialética: tese, antítese e síntese na história do Espírito' },
    { a: 'Nietzsche', b: 'crítica à moral tradicional, "morte de Deus" e o além-do-homem' }, { a: 'Sartre', b: 'existencialismo: "a existência precede a essência"' },
    { a: 'Simone de Beauvoir', b: '"ninguém nasce mulher: torna-se mulher"' }, { a: 'Hannah Arendt', b: 'banalidade do mal e análise dos regimes totalitários' },
    { a: 'Michel Foucault', b: 'poder disciplinar, vigilância e a relação entre saber e poder' }
  ], { q1: it => `Qual filósofo está ligado a esta ideia: ${it.b}?`, q2: it => `Qual ideia é associada a ${it.a}?`, dica: 'Associe o pensador ao período: antigo, medieval, moderno ou contemporâneo.' }),
  T('Filosofia', ['Conceitos filosóficos', 'Áreas e conceitos'], [
    { a: 'Ética', b: 'área da filosofia que reflete sobre o agir humano, o bem e o dever' }, { a: 'Epistemologia', b: 'área da filosofia que estuda o conhecimento, sua origem e seus limites' },
    { a: 'Metafísica', b: 'área que investiga o ser, a realidade e o que está além da experiência sensível' }, { a: 'Estética', b: 'área que estuda o belo e a arte' },
    { a: 'Lógica', b: 'área que estuda as formas válidas de raciocínio e argumentação' }, { a: 'Empirismo', b: 'corrente que afirma que o conhecimento vem da experiência sensível' },
    { a: 'Racionalismo', b: 'corrente que afirma que a razão é a principal fonte do conhecimento' }, { a: 'Mito', b: 'narrativa que explica o mundo por forças sobrenaturais, anterior ao pensamento filosófico (logos)' }
  ], { q1: it => `Qual termo filosófico corresponde a: ${it.b}?`, q2: it => `Na filosofia, o que é ${it.a.toLowerCase()}?`, dica: 'Ética = agir; epistemologia = conhecer; metafísica = ser.' })
];

// ============================ SOCIOLOGIA ============================
const SOC = [
  T('Sociologia', ['Teoria sociológica', 'Pensadores e conceitos'], [
    { a: 'Émile Durkheim', b: 'fato social, solidariedade mecânica e orgânica e anomia' }, { a: 'Max Weber', b: 'ação social, tipos de dominação e o desencantamento do mundo' },
    { a: 'Karl Marx', b: 'luta de classes, mais-valia e alienação do trabalho' }, { a: 'Auguste Comte', b: 'positivismo e a lei dos três estados' },
    { a: 'Pierre Bourdieu', b: 'capital cultural, habitus e violência simbólica' }, { a: 'Zygmunt Bauman', b: 'modernidade líquida e a fragilidade dos laços sociais' },
    { a: 'Gilberto Freyre', b: 'obra "Casa-Grande & Senzala" (1933), sobre a formação da sociedade patriarcal brasileira' }, { a: 'Sérgio Buarque de Holanda', b: 'obra "Raízes do Brasil" (1936) e o conceito de homem cordial' },
    { a: 'Florestan Fernandes', b: 'crítica ao mito da democracia racial no Brasil' }, { a: 'Darcy Ribeiro', b: 'obra "O Povo Brasileiro", sobre a formação étnica do país' },
    { a: 'Adorno e Horkheimer', b: 'conceito de indústria cultural, da Escola de Frankfurt' }
  ], { q1: it => `Qual pensador ou dupla está ligado(a) a: ${it.b}?`, q2: it => `Qual contribuição é associada a ${it.a}?`, dica: 'Clássicos: Durkheim (fato social), Weber (ação social), Marx (classes).' }),
  T('Sociologia', ['Trabalho e sociedade', 'Modelos produtivos'], [
    { a: 'Taylorismo', b: 'organização científica do trabalho, com cronometragem e divisão rígida de tarefas' },
    { a: 'Fordismo', b: 'produção em massa com linha de montagem e trabalhador especializado numa só tarefa' },
    { a: 'Toyotismo', b: 'produção flexível, just in time, estoque mínimo e trabalhador multifuncional' },
    { a: 'Uberização', b: 'trabalho por aplicativos, sem vínculo empregatício e com riscos assumidos pelo trabalhador' }
  ], { q1: it => `Qual modelo de organização do trabalho corresponde a: ${it.b}?`, q2: it => `O ${it.a.toLowerCase()} se caracteriza por:`, extras: { a: ['Feudalismo', 'Mercantilismo'], b: ['trabalho servil em troca de proteção', 'acúmulo de metais preciosos pelo Estado'] }, dica: 'Ford: linha de montagem. Toyota: flexibilidade e just in time.' }),
  T('Sociologia', ['Cultura', 'Conceitos de cultura'], [
    { a: 'Etnocentrismo', b: 'julgar outras culturas tomando a própria como medida do que é certo' },
    { a: 'Relativismo cultural', b: 'compreender cada cultura a partir de seus próprios valores e contexto' },
    { a: 'Aculturação', b: 'mudança cultural resultante do contato contínuo entre grupos de culturas diferentes' },
    { a: 'Indústria cultural', b: 'produção da cultura como mercadoria padronizada para o consumo em massa' },
    { a: 'Patrimônio imaterial', b: 'saberes, celebrações e formas de expressão reconhecidos e protegidos, como o registro feito pelo IPHAN' }
  ], { q1: it => `Qual conceito corresponde a: ${it.b}?`, q2: it => `O que significa ${it.a.toLowerCase()}?`, dica: 'Etnocentrismo julga; relativismo compreende.' })
];

// ============================ LÍNGUA PORTUGUESA ============================
const POR = [
  T('Português', ['Sintaxe', 'Orações coordenadas'], [
    { a: 'Aditiva', b: '"Estudou e passou no vestibular."' }, { a: 'Adversativa', b: '"Estudou muito, mas não passou."' },
    { a: 'Alternativa', b: '"Ou você estuda, ou vai trabalhar."' }, { a: 'Conclusiva', b: '"Estudou bastante; portanto, está preparado."' },
    { a: 'Explicativa', b: '"Estude agora, pois a prova é amanhã."' }
  ], { q1: it => `Como se classifica a segunda oração coordenada no período ${it.b}?`, dica: 'Olhe a conjunção: e (adição), mas (oposição), ou (alternância), portanto (conclusão), pois (explicação).', exp: it => `Oração coordenada sindética ${it.a.toLowerCase()}: ${it.b}` }),
  T('Português', ['Sintaxe', 'Orações subordinadas adverbiais'], [
    { a: 'Causal', b: '"Como choveu, o jogo foi adiado."' }, { a: 'Concessiva', b: '"Embora estivesse cansado, terminou a redação."' },
    { a: 'Condicional', b: '"Se você revisar hoje, vai lembrar amanhã."' }, { a: 'Final', b: '"Saiu cedo para que não perdesse o ônibus."' },
    { a: 'Temporal', b: '"Quando a prova começou, todos ficaram em silêncio."' }, { a: 'Consecutiva', b: '"Estudou tanto que ficou com dor de cabeça."' },
    { a: 'Conformativa', b: '"Fiz o exercício conforme o professor explicou."' }, { a: 'Proporcional', b: '"À medida que estudava, ganhava confiança."' }
  ], { q1: it => `A oração subordinada adverbial destacada no período ${it.b} é:`, level: 'medio', difficulty: 3, dica: 'Embora = concessão; para que = finalidade; à medida que = proporção.', exp: it => `Oração subordinada adverbial ${it.a.toLowerCase()}: ${it.b}` }),
  T('Português', ['Gramática', 'Regência verbal'], [
    { a: '"Assistimos ao filme ontem."', b: 'assistir, no sentido de ver, pede a preposição "a"' },
    { a: '"Prefiro estudar a dormir tarde."', b: 'preferir pede a preposição "a", sem "do que"' },
    { a: '"Os alunos obedecem ao regulamento."', b: 'obedecer pede a preposição "a"' },
    { a: '"Ela aspira a uma vaga em Medicina."', b: 'aspirar, no sentido de desejar, pede a preposição "a"' },
    { a: '"Cheguei à escola cedo."', b: 'chegar, com ideia de destino, pede a preposição "a"' },
    { a: '"Esqueci o livro em casa."', b: 'esquecer, sem pronome, não pede preposição' }
  ], { q1: it => `Qual frase segue a norma-padrão, sabendo que ${it.b}?`, level: 'medio', difficulty: 3, extras: { a: ['"Assistimos o filme ontem."', '"Prefiro mais estudar do que dormir."', '"Cheguei na escola cedo."'] }, dica: 'Na norma-padrão, vários verbos pedem a preposição "a".', exp: it => `Correta: ${it.a} Porque ${it.b}.` }),
  T('Português', ['Linguagem', 'Variação linguística'], [
    { a: 'Variação diatópica (regional)', b: 'diferenças de vocabulário e pronúncia entre regiões, como "mandioca", "aipim" e "macaxeira"' },
    { a: 'Variação diastrática (social)', b: 'diferenças ligadas a grupos sociais, como gírias de jovens ou jargões de profissões' },
    { a: 'Variação diafásica (situacional)', b: 'adequação da fala à situação, mais formal numa entrevista de emprego e mais informal entre amigos' },
    { a: 'Variação diacrônica (histórica)', b: 'mudanças da língua ao longo do tempo, como "vossa mercê" que virou "você"' }
  ], { q1: it => `Que tipo de variação linguística aparece em: ${it.b}?`, extras: { a: ['Erro de concordância', 'Figura de linguagem'] }, dica: 'Lugar = diatópica; grupo social = diastrática; situação = diafásica; tempo = diacrônica.' }),
  T('Português', ['Texto', 'Intertextualidade'], [
    { a: 'Paródia', b: 'retoma um texto conhecido mudando o sentido, muitas vezes com humor ou crítica' },
    { a: 'Paráfrase', b: 'retoma as ideias de um texto com outras palavras, mantendo o sentido' },
    { a: 'Epígrafe', b: 'trecho de outro autor colocado no início de uma obra ou capítulo' },
    { a: 'Citação', b: 'transcrição de trecho de outro texto, com aspas e indicação do autor' },
    { a: 'Alusão', b: 'referência indireta a outra obra, sem citá-la explicitamente' }
  ], { q1: it => `Que recurso de intertextualidade ${it.b}?`, q2: it => `Na intertextualidade, a ${it.a.toLowerCase()}:`, dica: 'Paródia subverte; paráfrase mantém o sentido.' }),
  T('Português', ['Texto', 'Tipologias textuais'], [
    { a: 'Narração', b: 'conta fatos com personagens, tempo e espaço, numa sequência de ações' },
    { a: 'Descrição', b: 'apresenta características de seres, objetos ou lugares, como um retrato em palavras' },
    { a: 'Dissertação argumentativa', b: 'defende um ponto de vista com argumentos, como na redação do ENEM' },
    { a: 'Exposição', b: 'apresenta informações sobre um assunto sem defender opinião, como num verbete' },
    { a: 'Injunção', b: 'orienta o leitor a fazer algo, com verbos no imperativo, como numa receita' }
  ], { q1: it => `Qual tipo textual ${it.b}?`, dica: 'Pergunte-se o que o texto quer: contar, mostrar, convencer, informar ou instruir.' })
];

export const TABELAS3 = [...BIO, ...QUI, ...HIS, ...GEO, ...FIL, ...SOC, ...POR];
