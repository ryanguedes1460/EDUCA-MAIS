// Tabelas de conhecimento novas (versão 1.3) para Linguagens, Humanas e Natureza.
// Cada item vira várias questões (formatos diferentes de pergunta), sempre autorais.
import { familia } from './tabelas.mjs';
import { num, pct, NOMES, opcoes } from './util.mjs';

const cap = s => s[0].toUpperCase() + s.slice(1);

// ---------------- GEOGRAFIA ----------------
const UFS = [
  ['Acre', 'Rio Branco', 'Norte'], ['Amapá', 'Macapá', 'Norte'], ['Amazonas', 'Manaus', 'Norte'], ['Pará', 'Belém', 'Norte'], ['Rondônia', 'Porto Velho', 'Norte'], ['Roraima', 'Boa Vista', 'Norte'], ['Tocantins', 'Palmas', 'Norte'],
  ['Alagoas', 'Maceió', 'Nordeste'], ['Bahia', 'Salvador', 'Nordeste'], ['Ceará', 'Fortaleza', 'Nordeste'], ['Maranhão', 'São Luís', 'Nordeste'], ['Paraíba', 'João Pessoa', 'Nordeste'], ['Pernambuco', 'Recife', 'Nordeste'], ['Piauí', 'Teresina', 'Nordeste'], ['Rio Grande do Norte', 'Natal', 'Nordeste'], ['Sergipe', 'Aracaju', 'Nordeste'],
  ['Distrito Federal', 'Brasília', 'Centro-Oeste'], ['Goiás', 'Goiânia', 'Centro-Oeste'], ['Mato Grosso', 'Cuiabá', 'Centro-Oeste'], ['Mato Grosso do Sul', 'Campo Grande', 'Centro-Oeste'],
  ['Espírito Santo', 'Vitória', 'Sudeste'], ['Minas Gerais', 'Belo Horizonte', 'Sudeste'], ['Rio de Janeiro', 'Rio de Janeiro', 'Sudeste'], ['São Paulo', 'São Paulo', 'Sudeste'],
  ['Paraná', 'Curitiba', 'Sul'], ['Rio Grande do Sul', 'Porto Alegre', 'Sul'], ['Santa Catarina', 'Florianópolis', 'Sul']
].map(([a, c, reg]) => ({ a, c, reg }));
const ufsFam = familia({
  subject: 'Geografia', topic: ['Brasil: território e regiões', 'Estados, capitais e regiões'], level: 'fundamental', difficulty: 1, itens: UFS,
  formatos: [
    it => ({ campo: 'c', statement: `Qual é a capital ${/^(Acre|Amapá|Amazonas|Pará|Maranhão|Piauí|Ceará|Rio|Espírito|Mato|Paraná|Tocantins|Distrito)/.test(it.a) ? 'do' : /^(Bahia|Paraíba)/.test(it.a) ? 'da' : 'de'} ${it.a}?` }),
    it => ({ campo: 'a', statement: `${it.c === it.a ? `A cidade de ${it.c}` : it.c} é a capital de qual unidade da federação?` }),
    it => ({ campo: 'reg', statement: `Pela divisão regional do IBGE, ${it.a} pertence a qual região do Brasil?` })
  ],
  explicar: it => `${it.a}: capital ${it.c}, região ${it.reg}.`, dica: 'O Brasil tem 26 estados e o Distrito Federal, divididos em 5 regiões pelo IBGE.'
});
const CLIMAS = [
  { a: 'Equatorial', b: 'quente e úmido o ano todo, com chuvas abundantes e pouca variação de temperatura', onde: 'Amazônia' },
  { a: 'Tropical', b: 'verão quente e chuvoso e inverno seco', onde: 'Brasil Central' },
  { a: 'Tropical semiárido', b: 'temperaturas altas, chuvas escassas e mal distribuídas, com longos períodos de seca', onde: 'Sertão nordestino' },
  { a: 'Tropical de altitude', b: 'temperaturas mais amenas por causa do relevo elevado, com geadas ocasionais', onde: 'serras do Sudeste' },
  { a: 'Subtropical', b: 'estações bem definidas, invernos frios com geadas e chuvas bem distribuídas', onde: 'Região Sul' },
  { a: 'Tropical litorâneo (atlântico)', b: 'quente e úmido, com chuvas trazidas pelos ventos do oceano', onde: 'litoral do Nordeste ao Sudeste' }
];
const climasFam = familia({
  subject: 'Geografia', topic: ['Clima', 'Climas do Brasil'], difficulty: 2, itens: CLIMAS,
  formatos: [it => ({ campo: 'a', statement: `Qual tipo climático do Brasil tem esta característica: ${it.b}?` }), it => ({ campo: 'a', statement: `Que clima predomina em: ${it.onde}?` }), it => ({ campo: 'b', statement: `Qual é a característica do clima ${it.a.toLowerCase()}?` })],
  explicar: it => `Clima ${it.a.toLowerCase()} (${it.onde}): ${it.b}.`, dica: 'Relacione latitude, altitude e proximidade do mar.'
});
const BACIAS = [
  { a: 'Bacia Amazônica', b: 'a maior do mundo em volume de água, com grande potencial de navegação' },
  { a: 'Bacia do São Francisco', b: 'atravessa o semiárido, é chamada de "rio da integração nacional" e é alvo de transposição' },
  { a: 'Bacia do Paraná', b: 'a de maior aproveitamento hidrelétrico, onde fica a usina de Itaipu' },
  { a: 'Bacia do Tocantins-Araguaia', b: 'a maior bacia inteiramente brasileira, onde fica a usina de Tucuruí' },
  { a: 'Bacia do Paraguai', b: 'drena o Pantanal, com rios de planície que alagam na época das cheias' },
  { a: 'Bacia do Uruguai', b: 'no Sul, com rios usados na irrigação de arroz e em hidrelétricas' }
];
const baciasFam = familia({
  subject: 'Geografia', topic: ['Hidrografia', 'Bacias hidrográficas do Brasil'], difficulty: 2, itens: BACIAS,
  formatos: [it => ({ campo: 'a', statement: `Qual bacia hidrográfica brasileira é descrita assim: ${it.b}?` }), it => ({ campo: 'b', statement: `Sobre a ${it.a}, é correto afirmar que ela:` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'Lembre-se das grandes hidrelétricas e de onde cada rio corre.'
});
const GEO2 = [
  { a: 'Globalização', b: 'integração econômica, cultural e de comunicações entre os países' }, { a: 'Megalópole', b: 'junção de grandes regiões metropolitanas formando uma área urbana contínua' },
  { a: 'Metrópole', b: 'cidade grande que polariza economicamente outras cidades à sua volta' }, { a: 'Desertificação', b: 'degradação do solo em áreas secas, tornando-o improdutivo' },
  { a: 'Assoreamento', b: 'acúmulo de sedimentos no leito dos rios, muitas vezes pela retirada da mata ciliar' }, { a: 'Ilha de calor', b: 'temperatura mais alta no centro urbano do que nas áreas ao redor' },
  { a: 'Inversão térmica', b: 'camada de ar frio presa abaixo de ar quente, que concentra a poluição perto do solo' }, { a: 'Chuva ácida', b: 'precipitação com ácidos formados por gases de enxofre e nitrogênio' },
  { a: 'Efeito estufa', b: 'retenção de calor na atmosfera por gases como o CO₂, que se intensifica com a poluição' }, { a: 'Eutrofização', b: 'excesso de nutrientes na água, que provoca proliferação de algas e falta de oxigênio' },
  { a: 'Gentrificação', b: 'valorização de um bairro que expulsa os moradores mais pobres' }, { a: 'Favelização', b: 'crescimento de moradias precárias por falta de acesso à habitação formal' },
  { a: 'Transição demográfica', b: 'queda da mortalidade seguida pela queda da natalidade, com envelhecimento da população' }, { a: 'Bônus demográfico', b: 'fase em que há proporcionalmente mais pessoas em idade de trabalhar' },
  { a: 'Agronegócio', b: 'cadeia que integra produção agropecuária, indústria e comércio, muitas vezes voltada à exportação' }, { a: 'Agricultura familiar', b: 'produção em pequenas propriedades com trabalho da família, responsável por boa parte dos alimentos consumidos no país' },
  { a: 'Matriz energética', b: 'conjunto de fontes de energia usadas por um país' }, { a: 'Energia renovável', b: 'fonte que se recompõe na natureza, como a solar, a eólica e a hídrica' },
  { a: 'Placas tectônicas', b: 'grandes blocos da litosfera que se movem e causam terremotos e vulcões' }, { a: 'Intemperismo', b: 'desgaste e decomposição das rochas pela ação da água, do calor e dos seres vivos' }
];
const geo2Fam = familia({
  subject: 'Geografia', topic: ['Geografia geral', 'Conceitos de geografia'], difficulty: 2, itens: GEO2,
  formatos: [it => ({ campo: 'a', statement: `Que conceito da geografia corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `Em geografia, "${it.a.toLowerCase()}" significa:` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'Associe o conceito ao fenômeno que ele descreve.'
});
const vegetativoFam = {
  subject: 'Geografia', topic: ['População', 'Crescimento vegetativo'], level: 'enem', difficulty: 3, n: 120,
  make(r) {
    const nat = r.int(8, 30), mort = r.int(5, Math.min(nat, 14)), cv = nat - mort, pais = r.pick(['um país', 'um estado', 'uma região', 'um município']);
    const o = opcoes(r, `${num(cv / 10)}% ao ano`, [nat + mort, cv, nat / 10, mort / 10, (nat + mort) / 10].map(x => `${num(x)}% ao ano`));
    return o && { ...o, statement: `Em ${pais}, a taxa de natalidade é de ${nat} por mil habitantes e a de mortalidade é de ${mort} por mil. Desconsiderando as migrações, qual é o crescimento vegetativo?`,
      explanation: `Crescimento vegetativo = natalidade − mortalidade = ${nat}‰ − ${mort}‰ = ${cv}‰, ou seja, ${num(cv / 10)}% ao ano.`, hint: 'Subtraia a mortalidade da natalidade e transforme "por mil" em porcentagem (divida por 10).' };
  }
};
const urbanFam = {
  subject: 'Geografia', topic: ['População', 'Urbanização'], level: 'enem', difficulty: 2, n: 120,
  make(r) {
    const tot = r.int(4, 90) * 10000, p = r.pick([45, 50, 60, 64, 72, 75, 80, 84, 88, 90, 92, 95]), urb = tot * p / 100;
    const o = opcoes(r, pct(p), [100 - p, p / 10, Math.round(urb / 10000), Math.min(99, p + 5), Math.max(5, p - 10)].map(pct));
    return o && { ...o, statement: `Um município tem ${num(tot)} habitantes, dos quais ${num(urb)} vivem na área urbana. Qual é a taxa de urbanização desse município?`,
      explanation: `Taxa de urbanização = população urbana ÷ total = ${num(urb)}/${num(tot)} = ${pct(p)}. No Brasil, a taxa passa de 85%.`, hint: 'Divida a população urbana pela total e multiplique por 100.' };
  }
};

// ---------------- HISTÓRIA ----------------
const HIST_BR2 = [
  { a: 'Tratado de Tordesilhas', ano: 1494, b: 'divisão das terras descobertas e a descobrir entre Portugal e Espanha' },
  { a: 'Confederação dos Tamoios', ano: 1554, b: 'aliança de povos indígenas contra a escravização pelos portugueses' },
  { a: 'Quilombo dos Palmares', ano: 1605, b: 'maior comunidade de resistência à escravidão, liderada por Zumbi' },
  { a: 'Ciclo do ouro em Minas Gerais', ano: 1700, b: 'deslocamento do eixo econômico para o Sudeste e transferência da capital para o Rio' },
  { a: 'Guerra dos Emboabas', ano: 1707, b: 'conflito entre bandeirantes paulistas e forasteiros pela exploração do ouro' },
  { a: 'Revolução Pernambucana', ano: 1817, b: 'movimento republicano e separatista no Nordeste durante o governo joanino' },
  { a: 'Confederação do Equador', ano: 1824, b: 'reação nordestina ao autoritarismo de D. Pedro I e à Constituição outorgada' },
  { a: 'Revolta dos Malês', ano: 1835, b: 'levante de africanos muçulmanos escravizados em Salvador' },
  { a: 'Balaiada', ano: 1838, b: 'revolta popular no Maranhão de vaqueiros, artesãos e pessoas escravizadas' },
  { a: 'Golpe da Maioridade', ano: 1840, b: 'antecipação da maioridade de D. Pedro II para encerrar o Período Regencial' },
  { a: 'Lei de Terras', ano: 1850, b: 'transformação da terra em mercadoria, dificultando o acesso dos pobres e libertos' },
  { a: 'Lei dos Sexagenários', ano: 1885, b: 'libertação dos escravizados com mais de 60 anos' },
  { a: 'Revolta da Armada', ano: 1893, b: 'levante da Marinha contra o governo de Floriano Peixoto' },
  { a: 'Revolta da Chibata', ano: 1910, b: 'motim de marinheiros contra os castigos físicos, liderado por João Cândido' },
  { a: 'Guerra do Contestado', ano: 1912, b: 'conflito no Sul envolvendo camponeses expulsos para a construção de uma ferrovia' },
  { a: 'Tenentismo', ano: 1922, b: 'movimento de jovens oficiais contra as oligarquias da República Velha' },
  { a: 'Revolução Constitucionalista', ano: 1932, b: 'levante paulista que exigia uma nova Constituição de Vargas' },
  { a: 'Estado Novo', ano: 1937, b: 'ditadura de Vargas com censura, Constituição outorgada e propaganda oficial' },
  { a: 'Criação da Petrobras', ano: 1953, b: 'monopólio estatal do petróleo após a campanha "O petróleo é nosso"' },
  { a: 'Plano de Metas', ano: 1956, b: 'industrialização acelerada ("50 anos em 5") no governo JK' },
  { a: 'Milagre econômico', ano: 1969, b: 'crescimento econômico alto na ditadura, com concentração de renda e dívida externa' },
  { a: 'Impeachment de Fernando Collor', ano: 1992, b: 'afastamento do presidente após denúncias de corrupção e protestos dos "caras-pintadas"' }
];
const histBr2Fam = familia({
  subject: 'História', topic: ['História do Brasil', 'Revoltas, leis e processos'], difficulty: 3, itens: HIST_BR2,
  formatos: [it => ({ campo: 'a', statement: `Qual acontecimento da história do Brasil teve como marca: ${it.b}?` }), it => ({ campo: 'b', statement: `Sobre "${it.a}" (${it.ano}), a descrição correta é:` }), it => ({ campo: 'a', statement: `Por volta de ${it.ano}, ocorreu no Brasil um processo caracterizado por: ${it.b}. Trata-se do(a):` })],
  explicar: it => `${it.a} (${it.ano}): ${it.b}.`, dica: 'Situe o fato no período (Colônia, Império ou República) e no grupo social envolvido.'
});
const HIST_G2 = [
  { a: 'Feudalismo', b: 'sociedade estamental com servos presos à terra e poder descentralizado nas mãos dos senhores' },
  { a: 'Absolutismo', b: 'concentração do poder nas mãos do rei, justificada muitas vezes pelo direito divino' },
  { a: 'Mercantilismo', b: 'política econômica de acúmulo de metais preciosos e balança comercial favorável' },
  { a: 'Revolução Gloriosa', b: 'estabelecimento da monarquia parlamentar na Inglaterra com a Declaração de Direitos' },
  { a: 'Era Napoleônica', b: 'expansão francesa pela Europa e criação do Código Civil' },
  { a: 'Unificação italiana e alemã', b: 'formação de Estados nacionais no século XIX liderados por Piemonte e Prússia' },
  { a: 'Imperialismo', b: 'partilha da África e da Ásia pelas potências industriais no século XIX' },
  { a: 'Guerra Fria', b: 'disputa ideológica, militar e tecnológica entre EUA e URSS sem confronto direto' },
  { a: 'Nazismo', b: 'regime totalitário alemão, com antissemitismo, expansionismo e culto ao líder' },
  { a: 'Fascismo italiano', b: 'regime totalitário liderado por Mussolini, com nacionalismo e repressão aos opositores' },
  { a: 'Descolonização afro-asiática', b: 'independência de colônias na África e na Ásia após a Segunda Guerra' },
  { a: 'Revolução Chinesa', b: 'chegada dos comunistas liderados por Mao Tsé-tung ao poder em 1949' },
  { a: 'Revolução Cubana', b: 'derrubada de Fulgêncio Batista em 1959 e aproximação com a URSS' },
  { a: 'Primavera Árabe', b: 'onda de protestos por democracia no Norte da África e no Oriente Médio a partir de 2010' },
  { a: 'Democracia ateniense', b: 'participação direta dos cidadãos nas decisões, excluindo mulheres, estrangeiros e escravizados' },
  { a: 'República Romana', b: 'governo com Senado e magistrados eleitos, marcado por conflitos entre patrícios e plebeus' },
  { a: 'Cruzadas', b: 'expedições militares cristãs ao Oriente que reativaram o comércio no Mediterrâneo' },
  { a: 'Peste Negra', b: 'epidemia do século XIV que matou cerca de um terço da população europeia' }
];
const histG2Fam = familia({
  subject: 'História', topic: ['História Geral', 'Sistemas, regimes e processos'], difficulty: 3, itens: HIST_G2,
  formatos: [it => ({ campo: 'a', statement: `Qual processo ou regime histórico é caracterizado por: ${it.b}?` }), it => ({ campo: 'b', statement: `Sobre "${it.a}", a característica correta é:` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'Pense no período (Antiguidade, Idade Média, Moderna ou Contemporânea) e em quem detinha o poder.'
});

// ---------------- BIOLOGIA ----------------
const VITAMINAS = [
  { a: 'Vitamina A', b: 'cegueira noturna e problemas na pele', f: 'cenoura, fígado e vegetais alaranjados' }, { a: 'Vitamina B1 (tiamina)', b: 'beribéri', f: 'cereais integrais e carnes' },
  { a: 'Vitamina B3 (niacina)', b: 'pelagra', f: 'carnes, ovos e leguminosas' }, { a: 'Vitamina B12', b: 'anemia perniciosa', f: 'alimentos de origem animal' },
  { a: 'Vitamina C', b: 'escorbuto, com sangramento nas gengivas', f: 'frutas cítricas e acerola' }, { a: 'Vitamina D', b: 'raquitismo em crianças', f: 'exposição ao sol, peixes e ovos' },
  { a: 'Vitamina K', b: 'problemas na coagulação do sangue', f: 'vegetais verde-escuros' }, { a: 'Vitamina E', b: 'danos causados por radicais livres (é antioxidante)', f: 'óleos vegetais e castanhas' }
];
const vitFam = familia({
  subject: 'Biologia', topic: ['Corpo humano', 'Vitaminas e nutrição'], difficulty: 2, itens: VITAMINAS,
  formatos: [it => ({ campo: 'a', statement: `A falta de qual vitamina está associada a ${it.b}?` }), it => ({ campo: 'b', statement: `A carência de ${it.a.split(' (')[0].replace('Vitamina', 'vitamina')} pode causar:` }), it => ({ campo: 'a', statement: `Qual vitamina é encontrada principalmente em ${it.f} e previne ${it.b}?` })],
  explicar: it => `${it.a}: a carência causa ${it.b}. Fontes: ${it.f}.`, dica: 'Associe cada vitamina à doença clássica de sua falta.'
});
const HORMONIOS = [
  { a: 'Insulina', g: 'pâncreas', b: 'diminuir a glicose no sangue, levando-a para dentro das células' }, { a: 'Glucagon', g: 'pâncreas', b: 'aumentar a glicose no sangue, liberando reservas do fígado' },
  { a: 'Adrenalina', g: 'glândulas suprarrenais', b: 'preparar o corpo para situações de estresse (luta ou fuga)' }, { a: 'Tiroxina (T4)', g: 'tireoide', b: 'regular o metabolismo do corpo' },
  { a: 'Hormônio do crescimento (GH)', g: 'hipófise', b: 'estimular o crescimento dos ossos e músculos' }, { a: 'Ocitocina', g: 'hipófise (liberação)', b: 'estimular as contrações do parto e a saída do leite' },
  { a: 'Antidiurético (ADH)', g: 'hipófise (liberação)', b: 'aumentar a reabsorção de água nos rins' }, { a: 'Testosterona', g: 'testículos', b: 'desenvolver as características sexuais masculinas' },
  { a: 'Estrógeno', g: 'ovários', b: 'desenvolver as características sexuais femininas e preparar o útero' }, { a: 'Progesterona', g: 'ovários', b: 'manter a gravidez, preparando e mantendo o endométrio' },
  { a: 'Melatonina', g: 'glândula pineal', b: 'regular o ciclo de sono e vigília' }, { a: 'Paratormônio', g: 'paratireoides', b: 'aumentar o cálcio no sangue' }
];
const hormFam = familia({
  subject: 'Biologia', topic: ['Corpo humano', 'Sistema endócrino'], difficulty: 3, itens: HORMONIOS,
  formatos: [it => ({ campo: 'a', statement: `Qual hormônio tem como função principal ${it.b}?` }), it => ({ campo: 'b', statement: `Qual é a principal função deste hormônio: ${it.a}?` })],
  explicar: it => `${it.a} (${it.g}): ${it.b}.`, dica: 'Pense na glândula que produz o hormônio e no efeito que ele causa.'
});
const ORGAOS = [
  { a: 'Estômago', b: 'digestão de proteínas em meio ácido, com a ação da pepsina' }, { a: 'Intestino delgado', b: 'maior parte da absorção dos nutrientes, graças às vilosidades' },
  { a: 'Intestino grosso', b: 'absorção de água e formação das fezes' }, { a: 'Fígado', b: 'produção da bile, armazenamento de glicogênio e desintoxicação' },
  { a: 'Pâncreas', b: 'produção de suco digestivo e dos hormônios insulina e glucagon' }, { a: 'Rins', b: 'filtração do sangue e produção da urina' },
  { a: 'Pulmões', b: 'trocas gasosas nos alvéolos (hematose)' }, { a: 'Coração', b: 'bombeamento do sangue para o corpo e para os pulmões' },
  { a: 'Baço', b: 'destruição de hemácias velhas e participação na defesa do corpo' }, { a: 'Cerebelo', b: 'controle do equilíbrio e da coordenação dos movimentos' },
  { a: 'Bulbo', b: 'controle de funções vitais automáticas, como respiração e batimentos' }, { a: 'Medula óssea vermelha', b: 'produção das células do sangue' }
];
const orgFam = familia({
  subject: 'Biologia', topic: ['Corpo humano', 'Órgãos e funções'], level: 'fundamental', difficulty: 2, itens: ORGAOS,
  formatos: [it => ({ campo: 'a', statement: `Qual órgão é responsável principalmente por ${it.b}?` }), it => ({ campo: 'b', statement: `A principal função do(a) ${it.a.toLowerCase()} é:` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'Lembre-se de qual sistema do corpo o órgão faz parte.'
});
const RELACOES = [
  { a: 'Mutualismo', b: 'as duas espécies se beneficiam e dependem uma da outra', ex: 'líquens (alga e fungo)' }, { a: 'Comensalismo', b: 'uma espécie se beneficia e a outra não é prejudicada', ex: 'rêmora e tubarão' },
  { a: 'Parasitismo', b: 'uma espécie vive à custa da outra, prejudicando-a', ex: 'lombriga no intestino humano' }, { a: 'Predatismo', b: 'uma espécie captura e mata a outra para se alimentar', ex: 'onça caçando capivara' },
  { a: 'Competição interespecífica', b: 'espécies diferentes disputam o mesmo recurso', ex: 'leões e hienas disputando presas' }, { a: 'Inquilinismo', b: 'uma espécie usa a outra como abrigo, sem prejudicá-la', ex: 'bromélias sobre árvores' },
  { a: 'Protocooperação', b: 'as duas espécies se beneficiam, mas podem viver separadas', ex: 'pássaro-palito e crocodilo' }, { a: 'Amensalismo', b: 'uma espécie libera substâncias que inibem o desenvolvimento de outra', ex: 'fungo que produz antibiótico' }
];
const relFam = familia({
  subject: 'Biologia', topic: ['Ecologia', 'Relações ecológicas'], difficulty: 2, itens: RELACOES,
  formatos: [it => ({ campo: 'a', statement: `No exemplo "${it.ex}", ${it.b}. Que relação ecológica é essa?` }), it => ({ campo: 'b', statement: `Na relação ecológica chamada ${it.a.toLowerCase()}:` })],
  explicar: it => `${it.a}: ${it.b}. Exemplo: ${it.ex}.`, dica: 'Veja quem ganha, quem perde e se a relação é obrigatória.'
});
const PLANTAS = [
  { a: 'Briófitas', b: 'plantas pequenas sem vasos condutores, como os musgos, que dependem da água para a reprodução' },
  { a: 'Pteridófitas', b: 'plantas com vasos condutores, mas sem sementes, como as samambaias' },
  { a: 'Gimnospermas', b: 'plantas com sementes nuas (sem fruto), como os pinheiros e a araucária' },
  { a: 'Angiospermas', b: 'plantas com flores e frutos que protegem as sementes, como o feijão e a mangueira' }
];
const plantasFam = familia({
  subject: 'Biologia', topic: ['Botânica', 'Grupos de plantas'], difficulty: 2, itens: [...PLANTAS, { a: 'Algas', b: 'seres fotossintetizantes sem raiz, caule e folha verdadeiros, em ambientes aquáticos' }],
  formatos: [it => ({ campo: 'a', statement: `Que grupo de seres fotossintetizantes é formado por ${it.b}?` }), it => ({ campo: 'b', statement: `As ${it.a.toLowerCase()} são caracterizadas como:` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'A sequência evolutiva: sem vasos → com vasos → com sementes → com flores e frutos.'
});
const hardyFam = {
  subject: 'Biologia', topic: ['Genética', 'Genética de populações'], level: 'medio', difficulty: 4, n: 60,
  make(r) {
    const q = r.pick([0.1, 0.2, 0.3, 0.4, 0.5, 0.6, 0.7]), p = Math.round((1 - q) * 10) / 10, het = Math.round(2 * p * q * 100), rec = Math.round(q * q * 100);
    const pede = r.chance(0.5) ? 'het' : 'rec';
    const certo = pede === 'het' ? het : rec;
    const o = opcoes(r, pct(certo), [Math.round(p * q * 100), Math.round(p * p * 100), pede === 'het' ? rec : het, Math.round(q * 100), Math.round(p * 100), 50].map(pct));
    return o && { ...o, statement: `Numa população em equilíbrio de Hardy-Weinberg, a frequência do alelo recessivo a é ${num(q)}. Qual é a porcentagem esperada de indivíduos ${pede === 'het' ? 'heterozigotos (Aa)' : 'homozigotos recessivos (aa)'}?`,
      explanation: `p = 1 − q = ${num(p)}. AA = p² = ${num(Math.round(p * p * 100) / 100)}; Aa = 2pq = ${num(het / 100)}; aa = q² = ${num(rec / 100)}. Resposta: ${pct(certo)}.`, hint: 'Use p + q = 1 e p² + 2pq + q² = 1.' };
  }
};
const mendelFam = {
  subject: 'Biologia', topic: ['Genética', 'Primeira lei de Mendel'], level: 'enem', difficulty: 3, n: 120,
  make(r) {
    const tr = r.pick([['ervilhas', 'amarela', 'verde'], ['cobaias', 'pelagem preta', 'pelagem branca'], ['plantas', 'flor roxa', 'flor branca'], ['moscas', 'asa longa', 'asa vestigial'], ['tomateiros', 'caule alto', 'caule anão']]);
    const cruz = r.pick(['AaxAa', 'Aaxaa']), N = r.int(2, 40) * 8;
    const fr = cruz === 'AaxAa' ? 1 / 4 : 1 / 2, rec = N * fr;
    const o = opcoes(r, num(rec), [N * 3 / 4, N / 2 === rec ? N / 4 : N / 2, N, N / 8, N * 3 / 8].map(x => num(x)));
    return o && { ...o, statement: `Em ${tr[0]}, ${tr[1]} é dominante sobre ${tr[2]}. Do cruzamento ${cruz === 'AaxAa' ? 'de dois heterozigotos (Aa × Aa)' : 'de um heterozigoto com um recessivo (Aa × aa)'} nasceram ${N} descendentes. Quantos devem ter o fenótipo recessivo (${tr[2]})?`,
      explanation: `${cruz === 'AaxAa' ? 'Aa × Aa → 1 AA : 2 Aa : 1 aa; 1/4 é recessivo.' : 'Aa × aa → 1 Aa : 1 aa; 1/2 é recessivo.'} Esperado: ${N} × ${cruz === 'AaxAa' ? '1/4' : '1/2'} = ${num(rec)}.`, hint: 'Monte o quadro de Punnett e veja a fração de aa.' };
  }
};

// ---------------- QUÍMICA (conceitos) ----------------
const FUNCOES_ORG = [
  { a: 'Álcool', b: 'hidroxila (−OH) ligada a carbono saturado', ex: 'etanol' }, { a: 'Ácido carboxílico', b: 'grupo carboxila (−COOH)', ex: 'ácido acético (vinagre)' },
  { a: 'Aldeído', b: 'carbonila (C=O) na ponta da cadeia (−CHO)', ex: 'formol (metanal)' }, { a: 'Cetona', b: 'carbonila (C=O) entre dois carbonos', ex: 'acetona (propanona)' },
  { a: 'Éster', b: 'grupo −COO− ligando duas cadeias carbônicas', ex: 'aromatizantes de frutas' }, { a: 'Éter', b: 'oxigênio entre dois carbonos (C−O−C)', ex: 'éter etílico' },
  { a: 'Amina', b: 'nitrogênio ligado a cadeia carbônica, derivado da amônia', ex: 'metilamina' }, { a: 'Fenol', b: 'hidroxila (−OH) ligada diretamente ao anel aromático', ex: 'fenol comum' },
  { a: 'Hidrocarboneto', b: 'apenas carbono e hidrogênio', ex: 'metano e gasolina' }, { a: 'Amida', b: 'carbonila ligada a nitrogênio (−CONH₂)', ex: 'ureia' }
];
const orgFamQ = familia({
  subject: 'Química', topic: ['Química orgânica', 'Funções orgânicas'], difficulty: 3, itens: FUNCOES_ORG,
  formatos: [it => ({ campo: 'a', statement: `Qual função orgânica é caracterizada por ${it.b}?` }), it => ({ campo: 'a', statement: `O(A) ${it.ex} é um exemplo de qual função orgânica?` }), it => ({ campo: 'b', statement: `O grupo funcional que identifica a função ${it.a.toLowerCase()} é:` })],
  explicar: it => `${it.a}: ${it.b}. Exemplo: ${it.ex}.`, dica: 'Procure o grupo de átomos (grupo funcional) que dá nome à função.'
});
const LIGACOES = [
  { a: 'Iônica', b: 'transferência de elétrons entre metal e ametal', ex: 'NaCl' }, { a: 'Covalente', b: 'compartilhamento de pares de elétrons entre ametais', ex: 'H₂O' },
  { a: 'Metálica', b: 'elétrons livres ("mar de elétrons") entre cátions de metais', ex: 'fio de cobre' }
];
const ligFam = familia({
  subject: 'Química', topic: ['Ligações químicas', 'Tipos de ligação'], level: 'medio', difficulty: 2, itens: [...LIGACOES, { a: 'Ponte de hidrogênio', b: 'interação forte entre moléculas com H ligado a F, O ou N', ex: 'entre moléculas de água' }, { a: 'Forças de Van der Waals', b: 'interações fracas entre moléculas apolares', ex: 'entre moléculas de metano' }],
  formatos: [it => ({ campo: 'a', statement: `Que tipo de ligação ou interação é caracterizado por ${it.b}?` }), it => ({ campo: 'a', statement: `Em ${it.ex}, predomina que tipo de ligação ou interação?` })],
  explicar: it => `${it.a}: ${it.b} (exemplo: ${it.ex}).`, dica: 'Metal + ametal: iônica; só ametais: covalente; só metais: metálica.'
});

// ---------------- PORTUGUÊS ----------------
const CONJ = [
  ['Estudou bastante, mas não passou na prova.', 'oposição (adversativa)'], ['Embora estivesse cansada, terminou a redação.', 'concessão'], ['Como choveu muito, a aula foi cancelada.', 'causa'],
  ['Estudou tanto que passou em primeiro lugar.', 'consequência'], ['Se você revisar hoje, lembrará amanhã.', 'condição'], ['Saiu cedo para que não perdesse o ônibus.', 'finalidade'],
  ['Quando o sinal tocou, todos saíram.', 'tempo'], ['Ela canta como os pássaros cantam.', 'comparação'], ['Conforme o professor explicou, a fórmula vale para todos os casos.', 'conformidade'],
  ['À medida que lia, compreendia melhor o texto.', 'proporção'], ['Não fui à festa, pois estava doente.', 'explicação'], ['Estude ou ficará de recuperação.', 'alternância'],
  ['Choveu muito; logo, o jogo foi adiado.', 'conclusão'], ['Ele trabalha e estuda à noite.', 'adição'], ['Apesar de ser jovem, já dirige uma empresa.', 'concessão'],
  ['Visto que o prazo acabou, não aceitaremos inscrições.', 'causa'], ['Fale baixo, porque o bebê está dormindo.', 'explicação'], ['Caso precise, ligue para mim.', 'condição'],
  ['Treinou a fim de vencer o campeonato.', 'finalidade'], ['Mal chegou, começou a reclamar.', 'tempo'], ['Ela é mais alta do que a irmã.', 'comparação'],
  ['O time jogou bem; no entanto, perdeu.', 'oposição (adversativa)'], ['Quanto mais estudo, mais aprendo.', 'proporção'], ['Gritou tão alto que ficou rouco.', 'consequência']
].map(([e, a]) => ({ e, a }));
const conjFam = familia({
  subject: 'Português', topic: ['Gramática', 'Conjunções e relações de sentido'], difficulty: 3, itens: CONJ,
  formatos: [it => ({ campo: 'a', statement: `No período "${it.e}", a relação de sentido estabelecida pelo conectivo é de:` }), it => ({ campo: 'a', statement: `Considere a frase: "${it.e}"\n\nO termo que liga as orações expressa ideia de:` })],
  explicar: it => `Em "${it.e}", o conectivo indica ${it.a}.`, dica: 'Troque o conectivo por outro conhecido (mas, porque, se, para que…) e veja se o sentido se mantém.'
});
const COLETIVOS = [['alcateia', 'lobos'], ['cardume', 'peixes'], ['enxame', 'abelhas'], ['matilha', 'cães'], ['manada', 'bois ou elefantes'], ['rebanho', 'ovelhas ou gado'], ['constelação', 'estrelas'], ['arquipélago', 'ilhas'], ['biblioteca', 'livros'], ['elenco', 'atores'], ['frota', 'navios ou veículos'], ['banda', 'músicos'], ['cordilheira', 'montanhas'], ['vocabulário', 'palavras'], ['acervo', 'obras de um museu'], ['pinacoteca', 'quadros'], ['réstia', 'cebolas ou alhos'], ['caravana', 'viajantes'], ['esquadrilha', 'aviões'], ['tripulação', 'marinheiros ou aeronautas']].map(([a, b]) => ({ a, b }));
const coletFam = familia({
  subject: 'Português', topic: ['Morfologia', 'Substantivos coletivos'], level: 'fundamental', difficulty: 1, itens: COLETIVOS,
  formatos: [it => ({ campo: 'a', statement: `Qual é o substantivo coletivo de ${it.b}?` }), it => ({ campo: 'b', statement: `O substantivo coletivo "${it.a}" indica um conjunto de:` })],
  explicar: it => `"${cap(it.a)}" é o coletivo de ${it.b}.`, dica: 'Coletivo é a palavra no singular que indica um conjunto de seres da mesma espécie.'
});
const PORQUES = [
  ['___ você faltou à aula?', 'Por que', 'Pergunta direta no início: "por que" separado e sem acento (equivale a "por qual motivo").'],
  ['Faltei ___ estava doente.', 'porque', 'Explicação ou causa: "porque" junto e sem acento (equivale a "pois").'],
  ['Você não veio ___?', 'por quê', 'No fim da frase, antes de ponto: "por quê" separado e com acento.'],
  ['Ninguém entendeu o ___ da decisão.', 'porquê', 'Substantivo (vem com artigo "o"): "porquê" junto e com acento.'],
  ['Não sei ___ ela desistiu.', 'por que', 'Pergunta indireta no meio da frase: "por que" separado e sem acento.'],
  ['Estude, ___ a prova é amanhã.', 'porque', 'Explicação: equivale a "pois", então "porque" junto.'],
  ['Eis o caminho ___ passamos ontem.', 'por que', 'Equivale a "pelo qual": "por que" separado.'],
  ['Ele chorou e não disse ___.', 'por quê', 'Antes de ponto final: "por quê" com acento.'],
  ['Quero entender os ___ dessa regra.', 'porquês', 'Substantivo no plural: "porquês".'],
  ['___ será que o ônibus atrasou?', 'Por que', 'Pergunta direta: "por que" separado.']
].map(([e, a, x]) => ({ e, a, x }));
const porqueFam = {
  subject: 'Português', topic: ['Ortografia', 'Uso dos porquês'], level: 'fundamental', difficulty: 2, n: PORQUES.length * 2, _k: 0,
  make(r) {
    const it = PORQUES[this._k % PORQUES.length], v = Math.floor(this._k++ / PORQUES.length);
    const maiusc = it.a[0] !== it.a[0].toLowerCase(), formas = ['por que', 'porque', 'por quê', 'porquê', 'porquês'].map(x => maiusc ? cap(x) : x);
    const o = opcoes(r, it.a, r.shuffle(formas.filter(x => x !== it.a)));
    return o && { ...o, statement: v ? `Qual forma completa corretamente a frase "${it.e}"?` : `Complete de acordo com a norma-padrão:\n\n"${it.e}"`, explanation: it.x, hint: 'Pergunta: por que. Resposta: porque. Fim de frase: por quê. Substantivo: o porquê.' };
  }
};
const GENEROS = [
  { a: 'Notícia', b: 'relato objetivo de um fato recente, com título, lide e linguagem impessoal' }, { a: 'Crônica', b: 'texto curto sobre fatos do cotidiano, com tom leve, reflexivo ou humorístico' },
  { a: 'Artigo de opinião', b: 'defesa de um ponto de vista com argumentos, assinada pelo autor' }, { a: 'Editorial', b: 'texto opinativo que expressa a posição do próprio jornal, sem assinatura' },
  { a: 'Charge', b: 'desenho humorístico que critica um fato político ou social da atualidade' }, { a: 'Resenha', b: 'apresentação e avaliação crítica de um livro, filme ou espetáculo' },
  { a: 'Conto', b: 'narrativa curta de ficção, com poucos personagens e um único conflito' }, { a: 'Fábula', b: 'narrativa curta com animais que agem como humanos e termina com uma moral' },
  { a: 'Reportagem', b: 'texto jornalístico aprofundado, com entrevistas, dados e diferentes fontes' }, { a: 'Manual de instruções', b: 'texto injuntivo com passos e verbos no imperativo para orientar o uso de algo' },
  { a: 'Carta aberta', b: 'texto dirigido a uma autoridade ou ao público para reivindicar ou protestar, divulgado publicamente' }, { a: 'Infográfico', b: 'combinação de textos curtos, imagens e gráficos para explicar uma informação' }
];
const generosFam = familia({
  subject: 'Português', topic: ['Interpretação de texto', 'Gêneros textuais'], difficulty: 2, itens: GENEROS,
  formatos: [it => ({ campo: 'a', statement: `Que gênero textual tem esta característica: ${it.b}?` }), it => ({ campo: 'b', statement: `Uma característica típica do gênero "${it.a.toLowerCase()}" é:` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'Pense na finalidade do texto, onde ele circula e quem o escreve.'
});

// ---------------- LITERATURA ----------------
const OBRAS = [
  ['Dom Casmurro', 'Machado de Assis', 'Realismo'], ['Memórias Póstumas de Brás Cubas', 'Machado de Assis', 'Realismo'], ['Quincas Borba', 'Machado de Assis', 'Realismo'],
  ['O Cortiço', 'Aluísio Azevedo', 'Naturalismo'], ['O Mulato', 'Aluísio Azevedo', 'Naturalismo'], ['Iracema', 'José de Alencar', 'Romantismo'], ['O Guarani', 'José de Alencar', 'Romantismo'], ['Senhora', 'José de Alencar', 'Romantismo'],
  ['A Moreninha', 'Joaquim Manuel de Macedo', 'Romantismo'], ['Memórias de um Sargento de Milícias', 'Manuel Antônio de Almeida', 'Romantismo'], ['Navio Negreiro', 'Castro Alves', 'Romantismo'], ['I-Juca-Pirama', 'Gonçalves Dias', 'Romantismo'],
  ['Macunaíma', 'Mário de Andrade', 'Modernismo'], ['Pauliceia Desvairada', 'Mário de Andrade', 'Modernismo'], ['Vidas Secas', 'Graciliano Ramos', 'Modernismo'], ['São Bernardo', 'Graciliano Ramos', 'Modernismo'],
  ['O Quinze', 'Rachel de Queiroz', 'Modernismo'], ['Capitães da Areia', 'Jorge Amado', 'Modernismo'], ['Grande Sertão: Veredas', 'Guimarães Rosa', 'Modernismo'], ['A Hora da Estrela', 'Clarice Lispector', 'Modernismo'],
  ['Morte e Vida Severina', 'João Cabral de Melo Neto', 'Modernismo'], ['Sentimento do Mundo', 'Carlos Drummond de Andrade', 'Modernismo'], ['Os Sertões', 'Euclides da Cunha', 'Pré-Modernismo'], ['Triste Fim de Policarpo Quaresma', 'Lima Barreto', 'Pré-Modernismo'],
  ['Eu', 'Augusto dos Anjos', 'Pré-Modernismo'], ['Broquéis', 'Cruz e Sousa', 'Simbolismo'], ['Via Láctea (Poesias)', 'Olavo Bilac', 'Parnasianismo'], ['Marília de Dirceu', 'Tomás Antônio Gonzaga', 'Arcadismo'],
  ['O Uraguai', 'Basílio da Gama', 'Arcadismo'], ['Sermão da Sexagésima', 'Padre Antônio Vieira', 'Barroco'], ['Quarto de Despejo', 'Carolina Maria de Jesus', 'Literatura contemporânea'], ['Torto Arado', 'Itamar Vieira Junior', 'Literatura contemporânea'],
  ['Os Lusíadas', 'Luís de Camões', 'Classicismo'], ['Auto da Compadecida', 'Ariano Suassuna', 'Modernismo'], ['Fogo Morto', 'José Lins do Rego', 'Modernismo'], ['Menino de Engenho', 'José Lins do Rego', 'Modernismo']
].map(([o, a, m]) => ({ o, a, m }));
const obrasFam = familia({
  subject: 'Literatura', topic: ['Literatura brasileira', 'Autores e obras'], difficulty: 2, itens: OBRAS,
  formatos: [it => ({ campo: 'a', statement: `Quem escreveu "${it.o}"?` }), it => ({ campo: 'm', statement: `A obra "${it.o}", de ${it.a}, pertence a qual escola ou período literário?` })],
  explicar: it => `"${it.o}" é de ${it.a} e pertence ao ${it.m}.`, dica: 'Associe o autor à época em que viveu e ao estilo da obra.'
});

// ---------------- INGLÊS ----------------
const VERBOS = [['be', 'was/were', 'been', 'ser/estar'], ['begin', 'began', 'begun', 'começar'], ['break', 'broke', 'broken', 'quebrar'], ['bring', 'brought', 'brought', 'trazer'], ['buy', 'bought', 'bought', 'comprar'], ['choose', 'chose', 'chosen', 'escolher'], ['come', 'came', 'come', 'vir'], ['do', 'did', 'done', 'fazer'], ['drink', 'drank', 'drunk', 'beber'], ['drive', 'drove', 'driven', 'dirigir'], ['eat', 'ate', 'eaten', 'comer'], ['fall', 'fell', 'fallen', 'cair'], ['feel', 'felt', 'felt', 'sentir'], ['find', 'found', 'found', 'encontrar'], ['fly', 'flew', 'flown', 'voar'], ['forget', 'forgot', 'forgotten', 'esquecer'], ['get', 'got', 'gotten', 'conseguir/obter'], ['give', 'gave', 'given', 'dar'], ['go', 'went', 'gone', 'ir'], ['grow', 'grew', 'grown', 'crescer'], ['have', 'had', 'had', 'ter'], ['hear', 'heard', 'heard', 'ouvir'], ['keep', 'kept', 'kept', 'manter/guardar'], ['know', 'knew', 'known', 'saber/conhecer'], ['leave', 'left', 'left', 'deixar/partir'], ['lose', 'lost', 'lost', 'perder'], ['make', 'made', 'made', 'fazer/fabricar'], ['meet', 'met', 'met', 'encontrar/conhecer alguém'], ['pay', 'paid', 'paid', 'pagar'], ['read', 'read', 'read', 'ler'], ['ride', 'rode', 'ridden', 'andar (de bicicleta, a cavalo)'], ['run', 'ran', 'run', 'correr'], ['say', 'said', 'said', 'dizer'], ['see', 'saw', 'seen', 'ver'], ['sell', 'sold', 'sold', 'vender'], ['send', 'sent', 'sent', 'enviar'], ['sing', 'sang', 'sung', 'cantar'], ['sleep', 'slept', 'slept', 'dormir'], ['speak', 'spoke', 'spoken', 'falar'], ['spend', 'spent', 'spent', 'gastar/passar (tempo)'], ['swim', 'swam', 'swum', 'nadar'], ['take', 'took', 'taken', 'pegar/levar'], ['teach', 'taught', 'taught', 'ensinar'], ['tell', 'told', 'told', 'contar/dizer'], ['think', 'thought', 'thought', 'pensar'], ['understand', 'understood', 'understood', 'entender'], ['wear', 'wore', 'worn', 'vestir/usar'], ['win', 'won', 'won', 'vencer'], ['write', 'wrote', 'written', 'escrever'], ['catch', 'caught', 'caught', 'pegar/apanhar']].map(([v, p, pp, t]) => ({ v, p, pp, t }));
const verbosFam = familia({
  subject: 'Inglês', topic: ['Gramática', 'Verbos irregulares'], level: 'medio', difficulty: 2, itens: VERBOS,
  formatos: [
    it => ({ campo: 'p', statement: `Qual é o passado simples (simple past) do verbo "to ${it.v}" (${it.t})?` }),
    it => ({ campo: 'pp', statement: `Complete com o particípio passado: "I have never ___ (${it.v}) anything like that."` }),
    it => ({ campo: 't', statement: `O verbo irregular "${it.v}" (passado "${it.p}") significa:` })
  ],
  explicar: it => `to ${it.v} (${it.t}): ${it.p} – ${it.pp}.`, dica: 'Verbos irregulares não seguem a regra do -ed: é preciso memorizar as formas.'
});
const CONECT = [['however', 'no entanto (oposição)'], ['therefore', 'portanto (conclusão)'], ['although', 'embora (concessão)'], ['because', 'porque (causa)'], ['moreover', 'além disso (adição)'], ['unless', 'a menos que (condição)'], ['meanwhile', 'enquanto isso (tempo)'], ['instead', 'em vez disso (substituição)'], ['such as', 'como, por exemplo (exemplificação)'], ['whereas', 'ao passo que (contraste)'], ['thus', 'assim, desse modo (conclusão)'], ['despite', 'apesar de (concessão)'], ['furthermore', 'além do mais (adição)'], ['since', 'já que (causa)'], ['so that', 'para que (finalidade)']].map(([a, b]) => ({ a, b }));
const conectFam = familia({
  subject: 'Inglês', topic: ['Interpretação de texto', 'Conectivos (linking words)'], difficulty: 3, itens: CONECT,
  formatos: [it => ({ campo: 'b', statement: `Num texto em inglês, o conectivo "${it.a}" tem o sentido de:` }), it => ({ campo: 'a', statement: `Qual conectivo em inglês corresponde a "${it.b}"?` })],
  explicar: it => `"${it.a}" = ${it.b}.`, dica: 'Os conectivos mostram a relação entre as ideias do texto: oposição, causa, conclusão…'
});

// ---------------- SOCIOLOGIA e FILOSOFIA ----------------
const SOC2 = [
  { a: 'Fato social', b: 'maneira de agir exterior ao indivíduo, geral e coercitiva', au: 'Émile Durkheim' }, { a: 'Mais-valia', b: 'valor produzido pelo trabalhador e não pago, apropriado pelo capitalista', au: 'Karl Marx' },
  { a: 'Ação social', b: 'conduta orientada pelo comportamento de outras pessoas, com um sentido para quem age', au: 'Max Weber' }, { a: 'Alienação', b: 'separação do trabalhador do produto e do sentido do seu trabalho', au: 'Karl Marx' },
  { a: 'Anomia', b: 'situação de enfraquecimento das normas sociais, com desorientação dos indivíduos', au: 'Émile Durkheim' }, { a: 'Indústria cultural', b: 'produção da cultura como mercadoria em série para as massas', au: 'Adorno e Horkheimer' },
  { a: 'Habitus', b: 'disposições incorporadas pela origem social que orientam gostos e práticas', au: 'Pierre Bourdieu' }, { a: 'Modernidade líquida', b: 'época de relações frágeis, instáveis e de consumo rápido', au: 'Zygmunt Bauman' },
  { a: 'Etnocentrismo', b: 'julgar outras culturas a partir dos valores da própria cultura', au: 'antropologia' }, { a: 'Relativismo cultural', b: 'compreender cada cultura a partir dos seus próprios valores', au: 'antropologia' },
  { a: 'Mobilidade social', b: 'mudança de posição de pessoas ou grupos na estrutura social', au: 'sociologia' }, { a: 'Socialização', b: 'processo pelo qual o indivíduo aprende as normas e valores da sociedade', au: 'sociologia' },
  { a: 'Burocracia', b: 'forma de dominação racional-legal baseada em regras, hierarquia e impessoalidade', au: 'Max Weber' }, { a: 'Solidariedade orgânica', b: 'coesão social baseada na divisão do trabalho e na interdependência', au: 'Émile Durkheim' },
  { a: 'Racismo estrutural', b: 'discriminação racial presente no funcionamento normal das instituições e da sociedade', au: 'Silvio Almeida' }, { a: 'Democracia racial (mito)', b: 'ideia de que no Brasil não haveria racismo por causa da miscigenação, criticada por sociólogos', au: 'Florestan Fernandes (crítica)' }
];
const soc2Fam = familia({
  subject: 'Sociologia', topic: ['Teoria sociológica', 'Conceitos e autores'], difficulty: 3, itens: SOC2,
  formatos: [it => ({ campo: 'a', statement: `Que conceito das ciências sociais corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `O conceito de "${it.a.toLowerCase()}" (${it.au}) refere-se a:` })],
  explicar: it => `${it.a} (${it.au}): ${it.b}.`, dica: 'Lembre-se do autor clássico ligado ao conceito.'
});
const FIL2 = [
  { a: 'Maiêutica', b: 'método de fazer perguntas para levar o interlocutor a "dar à luz" as próprias ideias', au: 'Sócrates' }, { a: 'Mundo das Ideias', b: 'realidade perfeita e eterna da qual o mundo sensível é apenas cópia', au: 'Platão' },
  { a: 'Justo meio (mesotes)', b: 'virtude como equilíbrio entre dois extremos', au: 'Aristóteles' }, { a: 'Cogito ("penso, logo existo")', b: 'a dúvida metódica leva à certeza da existência do sujeito pensante', au: 'Descartes' },
  { a: 'Empirismo', b: 'todo conhecimento vem da experiência sensível', au: 'John Locke e David Hume' }, { a: 'Imperativo categórico', b: 'agir de modo que a regra da ação possa valer como lei universal', au: 'Kant' },
  { a: 'Contrato social', b: 'a sociedade e o Estado nascem de um acordo entre os indivíduos', au: 'Hobbes, Locke e Rousseau' }, { a: 'Separação dos poderes', b: 'divisão do poder em Executivo, Legislativo e Judiciário para evitar abusos', au: 'Montesquieu' },
  { a: 'Utilitarismo', b: 'a ação correta é a que produz a maior felicidade para o maior número', au: 'Bentham e Stuart Mill' }, { a: 'Existencialismo', b: 'a existência precede a essência: o ser humano se define por suas escolhas', au: 'Sartre' },
  { a: 'Banalidade do mal', b: 'pessoas comuns podem cometer atrocidades apenas cumprindo ordens, sem refletir', au: 'Hannah Arendt' }, { a: 'Vontade de potência', b: 'impulso vital de superação e afirmação da vida', au: 'Nietzsche' },
  { a: 'Ética da virtude', b: 'a felicidade (eudaimonia) é alcançada pela prática das virtudes', au: 'Aristóteles' }, { a: 'Ceticismo', b: 'suspensão do juízo diante da impossibilidade de certezas absolutas', au: 'Pirro' },
  { a: 'Estoicismo', b: 'viver de acordo com a razão e aceitar com serenidade o que não depende de nós', au: 'Sêneca e Epiteto' }, { a: 'Panóptico', b: 'modelo de vigilância em que todos podem ser vistos sem saber quando, gerando autocontrole', au: 'Michel Foucault' }
];
const fil2Fam = familia({
  subject: 'Filosofia', topic: ['História da filosofia', 'Conceitos e filósofos'], difficulty: 3, itens: FIL2,
  formatos: [it => ({ campo: 'a', statement: `Que conceito filosófico corresponde a: ${it.b}?` }), it => ({ campo: 'b', statement: `O conceito de "${it.a}", associado a ${it.au}, significa:` }), it => ({ campo: 'a', statement: `Qual conceito, associado a ${it.au}, pode ser descrito como: ${it.b}?` })],
  explicar: it => `${it.a} (${it.au}): ${it.b}.`, dica: 'Associe o conceito ao filósofo e à época dele.'
});

export const LINGUAGENS2 = [conjFam, coletFam, porqueFam, generosFam, obrasFam, verbosFam, conectFam];
export const HUMANAS2 = [ufsFam, climasFam, baciasFam, geo2Fam, vegetativoFam, urbanFam, histBr2Fam, histG2Fam, soc2Fam, fil2Fam];
export const NATUREZA2 = [vitFam, hormFam, orgFam, relFam, plantasFam, hardyFam, mendelFam, orgFamQ, ligFam];
void NOMES;
