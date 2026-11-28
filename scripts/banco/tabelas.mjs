// Famílias de questões construídas a partir de tabelas de conhecimento
// (conceitos, autores, exemplos). Cada linha da tabela vira várias questões
// em formatos diferentes, e os erros vêm das outras linhas, como no ENEM.
import { opcoes } from './util.mjs';

/**
 * Cria uma família a partir de uma tabela.
 * itens: [{ a, b, extra? }]  (a = nome/termo, b = descrição/exemplo)
 * formatos: funções (item, r) => { statement, certo, campo } onde campo indica
 *   se as alternativas são 'a' (termos) ou 'b' (descrições).
 */
export function familia({ subject, topic, level = 'enem', difficulty = 2, itens, formatos, explicar, dica, n }) {
  let k = 0;
  return {
    subject, topic, level, difficulty, n: n ?? itens.length * formatos.length,
    make(r) {
      const idx = k++;
      const item = itens[idx % itens.length];
      const fmt = formatos[Math.floor(idx / itens.length) % formatos.length];
      const f = fmt(item, r);
      if (!f) return null;
      const outros = r.shuffle(itens.filter(x => x !== item && x[f.campo] !== item[f.campo] && !(item.nao || []).includes(x.a)));
      const o = opcoes(r, item[f.campo], outros.map(x => x[f.campo]));
      return o && { ...o, statement: f.statement, explanation: explicar(item, f), hint: typeof dica === 'function' ? dica(item) : dica };
    }
  };
}

const cap = s => s[0].toUpperCase() + s.slice(1);

// ---------------- PORTUGUÊS ----------------
const FIGURAS = [
  { a: 'Metáfora', b: 'comparação implícita, sem conectivo', ex: ['Aquela professora é uma luz na vida dos alunos.', 'Meu coração é um balde despejado.', 'A cidade era um forno naquela tarde de janeiro.', 'Seus olhos são duas estrelas.'] },
  { a: 'Comparação', b: 'aproximação de dois elementos com conectivo (como, tal qual)', ex: ['Ele corria como um raio pela avenida.', 'Ficou vermelha feito um tomate.', 'O silêncio da sala era tal qual o de uma igreja vazia.', 'Dormiu como uma pedra depois da prova.'] },
  { a: 'Hipérbole', b: 'exagero intencional para dar ênfase', ex: ['Já te falei isso um milhão de vezes!', 'Estou morrendo de fome.', 'Chorou rios de lágrimas no velório.', 'Esperei uma eternidade na fila do banco.'] },
  { a: 'Eufemismo', b: 'suavização de uma ideia desagradável', ex: ['Ele partiu desta para melhor.', 'O candidato faltou com a verdade durante o debate.', 'Aquele senhor está na melhor idade.', 'A empresa precisou desligar alguns funcionários.'] },
  { a: 'Personificação', b: 'atribuição de ações ou sentimentos humanos a seres inanimados', ex: ['O vento sussurrava segredos na janela.', 'A lua sorria para os namorados.', 'O relógio da sala gritava que eu estava atrasado.', 'As árvores dançavam com a tempestade.'] },
  { a: 'Antítese', b: 'aproximação de palavras de sentidos opostos', ex: ['Na alegria e na tristeza, estarei com você.', 'Há tanta vida lá fora e tanta morte aqui dentro.', 'Era um silêncio barulhento de pensamentos.', 'Riso e choro se misturavam na formatura.'] },
  { a: 'Paradoxo', b: 'ideias contraditórias que parecem impossíveis juntas', ex: ['Amor é fogo que arde sem se ver.', 'Estou cego de tanto ver.', 'Quanto mais aprendo, menos sei.', 'É um contentamento descontente.'] },
  { a: 'Ironia', b: 'dizer o contrário do que se pensa, com intenção crítica', ex: ['Que aluno dedicado: só faltou a metade das aulas!', 'Parabéns pela pontualidade: chegou só duas horas atrasado.', 'Que lindo, deixou a cozinha toda suja!', 'Ótima ideia sair sem guarda-chuva num dia de temporal.'] },
  { a: 'Metonímia', b: 'troca de uma palavra por outra com relação de proximidade (autor pela obra, parte pelo todo)', ex: ['Adoro ler Machado de Assis nas férias.', 'Tomou dois copos de suco no almoço.', 'O Planalto anunciou novas medidas econômicas.', 'Não há teto para todos os desabrigados.'] },
  { a: 'Onomatopeia', b: 'palavra que imita um som', ex: ['O tique-taque do relógio não me deixava dormir.', 'Atchim! Acho que peguei um resfriado.', 'O cachorro fez au-au a noite inteira.', 'Ouvimos o vrum dos carros na corrida.'] },
  { a: 'Pleonasmo', b: 'repetição de uma ideia para reforçá-la', ex: ['Vi com meus próprios olhos o acidente.', 'Sonhei um sonho bonito esta noite.', 'O livro, eu já o li duas vezes.', 'Chorei lágrimas de saudade.'] },
  { a: 'Sinestesia', b: 'mistura de sensações de sentidos diferentes', ex: ['Senti um cheiro doce de bolo na cozinha.', 'Ela tem uma voz aveludada.', 'Era um perfume quente e envolvente.', 'Ouvi um grito amargo vindo da rua.'] }
];
const figurasFam = familia({
  subject: 'Português', topic: ['Semântica e estilística', 'Figuras de linguagem'], difficulty: 2,
  itens: FIGURAS.flatMap(f => f.ex.map(e => ({ a: f.a, b: f.b, e }))),
  formatos: [
    it => ({ campo: 'a', statement: `Leia a frase: "${it.e}"\n\nQual figura de linguagem predomina nela?` }),
    it => ({ campo: 'b', statement: `Na frase "${it.e}", o efeito de sentido foi construído principalmente por meio de:` })
  ],
  explicar: it => `A frase apresenta ${it.a.toLowerCase()}: ${it.b}.`,
  dica: 'Pergunte-se qual recurso o autor usou para criar o efeito: exagero, oposição, comparação, som…'
});

const FUNCOES = [
  { a: 'Função referencial', b: 'informar de modo objetivo, com foco no assunto', ex: ['Segundo o IBGE, a população brasileira ultrapassou 203 milhões de pessoas no último censo.', 'A vacina deve ser aplicada em duas doses, com intervalo de 30 dias.', 'O rio São Francisco tem cerca de 2.800 km de extensão.'] },
  { a: 'Função emotiva', b: 'expressar sentimentos e opiniões do emissor', ex: ['Ah, como eu sinto falta daquela casa da minha infância!', 'Fiquei profundamente emocionada ao ver minha filha se formar.', 'Que medo eu senti naquela noite escura!'] },
  { a: 'Função conativa (apelativa)', b: 'convencer ou influenciar o receptor', ex: ['Vacine-se! Proteja quem você ama.', 'Não perca: só hoje, tudo com 50% de desconto!', 'Economize água: feche a torneira enquanto escova os dentes.'] },
  { a: 'Função metalinguística', b: 'usar o código para falar do próprio código', ex: ['"Saudade" é um substantivo abstrato que indica a falta de alguém ou de algo.', 'Este poema fala sobre a dificuldade de escrever um poema.', 'Verbo é a classe de palavras que indica ação, estado ou fenômeno.'] },
  { a: 'Função fática', b: 'testar ou manter o canal de comunicação', ex: ['— Alô? Alô? Está me ouvindo?', '— Oi, tudo bem? — Tudo, e com você?', 'Bom dia, pessoal! Todos conseguem me ver no vídeo?'] },
  { a: 'Função poética', b: 'valorizar a forma da mensagem: ritmo, som, rima', ex: ['"Minha terra tem palmeiras / Onde canta o sabiá."', 'Navegar é preciso, viver não é preciso.', '"Tecendo a manhã": um galo sozinho não tece uma manhã.'] }
];
const funcoesFam = familia({
  subject: 'Português', topic: ['Interpretação de texto', 'Funções da linguagem'], difficulty: 3,
  itens: FUNCOES.flatMap(f => f.ex.map(e => ({ a: f.a, b: f.b, e }))),
  formatos: [
    it => ({ campo: 'a', statement: `Considere o trecho: "${it.e}"\n\nA função da linguagem predominante é a:` }),
    it => ({ campo: 'b', statement: `No trecho "${it.e}", a intenção principal do emissor é:` })
  ],
  explicar: it => `Predomina a ${it.a.toLowerCase()}, cuja marca é ${it.b}.`,
  dica: 'Veja em qual elemento da comunicação o texto se concentra: emissor, receptor, mensagem, canal, código ou assunto.'
});

const CRASE = [
  { e: 'Vou ___ farmácia comprar remédio.', c: 'à', d: ['a', 'á', 'há', 'ao'], x: 'Quem vai, vai a algum lugar (preposição) + a farmácia (artigo) = à.' },
  { e: 'Ela chegou ___ escola atrasada.', c: 'à', d: ['a', 'há', 'á', 'as'], x: 'Chegar a + a escola = à escola.' },
  { e: 'Fomos ___ Bahia nas férias.', c: 'à', d: ['a', 'há', 'á', 'na'], x: 'Quem vai à Bahia volta da Bahia: há artigo, logo há crase.' },
  { e: 'Viajaremos ___ Curitiba em março.', c: 'a', d: ['à', 'há', 'á', 'as'], x: 'Quem vai a Curitiba volta de Curitiba (sem artigo): não há crase.' },
  { e: 'Começou ___ chover forte.', c: 'a', d: ['à', 'há', 'á', 'as'], x: 'Não há crase antes de verbo.' },
  { e: 'Entreguei o trabalho ___ professora.', c: 'à', d: ['a', 'há', 'á', 'na'], x: 'Entregar algo a alguém + a professora = à professora.' },
  { e: 'Fiquei frente ___ frente com o artista.', c: 'a', d: ['à', 'há', 'á', 'as'], x: 'Em expressões com palavras repetidas (frente a frente) não há crase.' },
  { e: 'A reunião será ___ 15 horas.', c: 'às', d: ['as', 'a', 'há', 'à'], x: 'Indicação de hora exata usa crase: às 15 horas.' },
  { e: 'Ele se referiu ___ você durante a palestra.', c: 'a', d: ['à', 'há', 'á', 'as'], x: 'Não há crase antes de pronomes de tratamento como "você".' },
  { e: 'Pintou o quadro ___ óleo.', c: 'a', d: ['à', 'há', 'á', 'ao'], x: 'Não há crase antes de palavra masculina.' },
  { e: 'Vestiu-se ___ moda antiga.', c: 'à', d: ['a', 'há', 'á', 'as'], x: 'Expressão "à moda de" leva crase, mesmo subentendida.' },
  { e: 'Assisti ___ peça de teatro ontem.', c: 'à', d: ['a', 'há', 'á', 'na'], x: 'Assistir (ver) pede preposição a + a peça = à peça.' },
  { e: 'Daqui ___ dois dias sairá o resultado.', c: 'a', d: ['à', 'há', 'á', 'às'], x: 'Tempo futuro usa a preposição "a" (daqui a dois dias); "há" indica tempo passado.' },
  { e: 'Moro aqui ___ dez anos.', c: 'há', d: ['a', 'à', 'á', 'às'], x: 'Tempo passado decorrido usa o verbo haver: há dez anos.' },
  { e: 'Dirigiu-se ___ todas as alunas.', c: 'a', d: ['à', 'às', 'há', 'á'], x: 'Não há crase antes de "todas" sem artigo; a preposição está antes de um pronome indefinido.' },
  { e: 'Obedeça ___ regras do laboratório.', c: 'às', d: ['as', 'a', 'à', 'há'], x: 'Obedecer a + as regras = às regras.' }
];
const craseFam = {
  subject: 'Português', topic: ['Gramática', 'Crase'], level: 'medio', difficulty: 2, n: CRASE.length * 2,
  _k: 0,
  make(r) {
    const it = CRASE[this._k % CRASE.length]; const v = Math.floor(this._k++ / CRASE.length);
    const o = opcoes(r, it.c, it.d);
    return o && { ...o, statement: v ? `Complete a lacuna de acordo com a norma-padrão:\n\n"${it.e}"` : `Qual forma completa corretamente a frase "${it.e}"?`, explanation: it.x, hint: 'Troque a palavra feminina por uma masculina: se aparecer "ao", há crase.' };
  }
};

const CONCORDANCIA = [
  { e: 'Faz dois anos que não o vejo.', ok: true }, { e: 'Fazem dois anos que não o vejo.', ok: false, c: 'Faz dois anos que não o vejo.' },
  { e: 'Houve muitos problemas na reunião.', ok: true }, { e: 'Houveram muitos problemas na reunião.', ok: false, c: 'Houve muitos problemas na reunião.' },
  { e: 'Vende-se casas na praia.', ok: false, c: 'Vendem-se casas na praia.' }, { e: 'Precisa-se de professores.', ok: true },
  { e: 'A maioria dos alunos aprovou a proposta.', ok: true }, { e: 'Os Estados Unidos anunciaram novas tarifas.', ok: true },
  { e: 'Existe muitas dúvidas sobre o tema.', ok: false, c: 'Existem muitas dúvidas sobre o tema.' }, { e: 'Deve haver soluções para o problema.', ok: true },
  { e: 'Devem haver soluções para o problema.', ok: false, c: 'Deve haver soluções para o problema.' }, { e: 'Fui eu que fiz o trabalho.', ok: true },
  { e: 'Sobrou poucas vagas no curso.', ok: false, c: 'Sobraram poucas vagas no curso.' }, { e: 'Chegaram as provas corrigidas.', ok: true },
  { e: 'É proibido entrada de animais.', ok: true }, { e: 'É proibida a entrada de animais.', ok: true },
  { e: 'Meio-dia e meio.', ok: false, c: 'Meio-dia e meia.' }, { e: 'Ela estava meio cansada.', ok: true },
  { e: 'Ela estava meia cansada.', ok: false, c: 'Ela estava meio cansada.' }, { e: 'Seguem anexas as fotos.', ok: true }
];
const concFam = {
  subject: 'Português', topic: ['Gramática', 'Concordância verbal e nominal'], level: 'medio', difficulty: 3, n: 60, _k: 0,
  make(r) {
    this._k++;
    const certas = CONCORDANCIA.filter(x => x.ok), erradas = CONCORDANCIA.filter(x => !x.ok);
    const alvoCerto = r.chance(0.5);
    if (alvoCerto) {
      const c = r.pick(certas); const o = opcoes(r, c.e, r.shuffle(erradas).map(x => x.e));
      return o && { ...o, statement: 'Assinale a frase que está de acordo com a norma-padrão quanto à concordância:', explanation: `"${c.e}" está correta. As outras têm erros de concordância, como "${erradas[0].e}" (correto: "${erradas[0].c}").`, hint: 'Verbos impessoais (haver = existir, fazer = tempo) ficam no singular; verbos com sujeito no plural vão ao plural.' };
    }
    const w = r.pick(erradas); const o = opcoes(r, w.e, r.shuffle(certas).map(x => x.e));
    return o && { ...o, statement: 'Assinale a frase que apresenta ERRO de concordância segundo a norma-padrão:', explanation: `"${w.e}" está errada. A forma correta é "${w.c}".`, hint: 'Procure o sujeito de cada verbo e veja se o número (singular/plural) combina.' };
  }
};

const VARIACAO = [
  { a: 'Variação regional (diatópica)', b: 'diferenças de vocabulário e pronúncia entre regiões', ex: ['No Sul se diz "guri" e no Nordeste "menino" ou "pivete".', 'O mesmo alimento é chamado de "mandioca", "aipim" ou "macaxeira" dependendo do estado.', 'O "r" pronunciado de forma diferente por um carioca e por um paulista do interior.'] },
  { a: 'Variação social (diastrática)', b: 'diferenças ligadas ao grupo social, à profissão ou à idade', ex: ['Gírias como "mano", "top" e "crush" usadas por jovens.', 'Termos técnicos usados por médicos entre si, como "paciente evoluiu bem".', 'O vocabulário próprio de skatistas ou de jogadores de videogame.'] },
  { a: 'Variação situacional (diafásica)', b: 'adequação da fala ao contexto, mais formal ou informal', ex: ['Uma pessoa fala de um jeito com os amigos e de outro numa entrevista de emprego.', 'A mesma juíza usa linguagem formal no tribunal e informal em casa.', 'Um estudante escreve "vc" no celular e "você" na redação do ENEM.'] },
  { a: 'Variação histórica (diacrônica)', b: 'mudanças da língua ao longo do tempo', ex: ['"Vossa mercê" virou "vosmecê", depois "você" e hoje, na fala, "cê".', 'Palavras como "pharmacia" eram escritas com "ph" antigamente.', 'Expressões como "supimpa" caíram em desuso.'] }
];
const variacaoFam = familia({
  subject: 'Português', topic: ['Linguagem e sociedade', 'Variação linguística'], difficulty: 2,
  itens: VARIACAO.flatMap(f => f.ex.map(e => ({ a: f.a, b: f.b, e }))),
  formatos: [it => ({ campo: 'a', statement: `Observe a situação: ${it.e}\n\nEsse exemplo ilustra principalmente qual tipo de variação linguística?` })],
  explicar: it => `Trata-se de ${it.a.toLowerCase()}: ${it.b}. Importante para o ENEM: nenhuma variedade é "errada"; o que existe é adequação ao contexto.`,
  dica: 'Pergunte-se: a diferença vem do lugar, do grupo, da situação ou da época?'
});

// ---------------- LITERATURA ----------------
const ESCOLAS = [
  { a: 'Barroco', b: 'conflito entre fé e prazer, jogos de palavras e antíteses', aut: 'Gregório de Matos', ob: 'poemas satíricos sobre a Bahia', sec: 'século XVII' },
  { a: 'Arcadismo', b: 'vida simples no campo, bucolismo e equilíbrio clássico', aut: 'Tomás Antônio Gonzaga', ob: 'Marília de Dirceu', sec: 'século XVIII' },
  { a: 'Romantismo', b: 'sentimentalismo, nacionalismo e idealização do índio e da mulher', aut: 'José de Alencar', ob: 'Iracema', sec: 'século XIX (1836–1881)' },
  { a: 'Realismo', b: 'análise psicológica, crítica à sociedade burguesa e ironia', aut: 'Machado de Assis', ob: 'Memórias Póstumas de Brás Cubas', sec: 'final do século XIX' },
  { a: 'Naturalismo', b: 'visão científica do ser humano, determinismo do meio e da raça', aut: 'Aluísio Azevedo', ob: 'O Cortiço', sec: 'final do século XIX' },
  { a: 'Parnasianismo', b: 'culto à forma perfeita, rimas ricas e "arte pela arte"', aut: 'Olavo Bilac', ob: 'Via Láctea (sonetos)', sec: 'final do século XIX' },
  { a: 'Simbolismo', b: 'musicalidade, misticismo, sinestesia e subjetividade', aut: 'Cruz e Sousa', ob: 'Broquéis', sec: 'final do século XIX' },
  { a: 'Pré-Modernismo', b: 'denúncia da realidade brasileira e do sertão esquecido', aut: 'Euclides da Cunha', ob: 'Os Sertões', sec: 'início do século XX' },
  { a: 'Modernismo (1ª fase)', b: 'ruptura com o passado, verso livre, humor e linguagem coloquial', aut: 'Oswald de Andrade', ob: 'Manifesto Antropófago', sec: '1922–1930' },
  { a: 'Modernismo (2ª fase)', b: 'romance regionalista e poesia de reflexão social e existencial', aut: 'Graciliano Ramos', ob: 'Vidas Secas', sec: '1930–1945' },
  { a: 'Modernismo (3ª fase)', b: 'experimentação com a linguagem e o fluxo de consciência', aut: 'Clarice Lispector', ob: 'A Hora da Estrela', sec: 'a partir de 1945' }
];
const escolasFam = familia({
  subject: 'Literatura', topic: ['Escolas literárias', 'Escolas literárias brasileiras'], difficulty: 3,
  itens: ESCOLAS,
  formatos: [
    it => ({ campo: 'a', statement: `Um movimento literário brasileiro do ${it.sec} tem como marcas ${it.b}. Que movimento é esse?` }),
    it => ({ campo: 'a', statement: `A obra "${it.ob}", de ${it.aut}, é representativa de qual movimento literário?` }),
    it => ({ campo: 'b', statement: `Qual característica é típica do ${it.a}?` }),
    it => ({ campo: 'aut', statement: `Qual autor é um dos principais nomes do ${it.a}?` })
  ],
  explicar: it => `${it.a} (${it.sec}): ${it.b}. Autor de destaque: ${it.aut}, com "${it.ob}".`,
  dica: 'Associe o período histórico às características do texto.'
});

// ---------------- INGLÊS ----------------
const COGNATOS = [
  ['actually', 'na verdade', 'atualmente'], ['pretend', 'fingir', 'pretender'], ['library', 'biblioteca', 'livraria'], ['push', 'empurrar', 'puxar'],
  ['college', 'faculdade', 'colégio'], ['parents', 'pais', 'parentes'], ['realize', 'perceber', 'realizar'], ['lunch', 'almoço', 'lanche'],
  ['exquisite', 'requintado', 'esquisito'], ['eventually', 'finalmente', 'eventualmente'], ['injury', 'ferimento', 'injúria'], ['novel', 'romance', 'novela'],
  ['costume', 'fantasia', 'costume'], ['sensible', 'sensato', 'sensível'], ['support', 'apoiar', 'suportar'], ['tax', 'imposto', 'taxa'],
  ['fabric', 'tecido', 'fábrica'], ['assist', 'ajudar', 'assistir'], ['comprehensive', 'abrangente', 'compreensivo'], ['legend', 'lenda', 'legenda'],
  ['data', 'dados', 'data'], ['prejudice', 'preconceito', 'prejuízo'], ['attend', 'frequentar', 'atender'], ['collar', 'gola', 'colar']
].map(([a, b, falso]) => ({ a, b, falso }));
const cognatosFam = {
  subject: 'Inglês', topic: ['Vocabulário', 'Falsos cognatos'], level: 'enem', difficulty: 2, n: COGNATOS.length * 2, _k: 0,
  make(r) {
    const it = COGNATOS[this._k % COGNATOS.length]; const v = Math.floor(this._k++ / COGNATOS.length);
    const ds = [it.falso, ...r.shuffle(COGNATOS.filter(x => x !== it)).map(x => x.b)];
    const o = opcoes(r, it.b, ds);
    const frases = { actually: 'Actually, I have never been to London.', pretend: 'The kids pretend to be superheroes.', library: 'I borrowed this book from the school library.', push: 'Push the door to open it.', college: 'She wants to go to college next year.', parents: 'My parents work in a hospital.', realize: 'I didn\'t realize it was so late.', lunch: 'We had lunch at noon.' };
    const f = frases[it.a];
    return o && { ...o, statement: v === 0 && f ? `Na frase "${f}", a palavra "${it.a}" significa:` : `Em textos em inglês, a palavra "${it.a}" deve ser traduzida como:`, explanation: `"${it.a}" significa "${it.b}". É um falso cognato: parece "${it.falso}", mas não tem esse sentido.`, hint: 'Cuidado com palavras parecidas com o português: elas podem enganar.' };
  }
};
const TEMPOS = [
  { a: 'Simple present', b: 'hábitos e verdades gerais', ex: ['She studies every night.', 'Water boils at 100 °C.', 'They play soccer on Sundays.'] },
  { a: 'Present continuous', b: 'ação acontecendo agora', ex: ['I am reading a book right now.', 'They are watching TV at the moment.', 'Look! It is raining.'] },
  { a: 'Simple past', b: 'ação concluída no passado', ex: ['We visited Salvador last year.', 'He finished the test yesterday.', 'She didn\'t go to school on Monday.'] },
  { a: 'Present perfect', b: 'ação do passado com ligação com o presente', ex: ['I have lived here since 2015.', 'She has already finished her homework.', 'Have you ever been to Manaus?'] },
  { a: 'Future with will', b: 'previsão ou decisão no momento da fala', ex: ['I think it will rain tomorrow.', 'I will help you with the bags.', 'Robots will do many jobs in the future.'] },
  { a: 'Future with going to', b: 'plano ou intenção já decidida', ex: ['I am going to take the ENEM this year.', 'They are going to travel in July.', 'Look at those clouds: it is going to rain.'] }
];
const temposFam = familia({
  subject: 'Inglês', topic: ['Gramática da língua inglesa', 'Tempos verbais'], level: 'medio', difficulty: 2,
  itens: TEMPOS.flatMap(t => t.ex.map(e => ({ a: t.a, b: t.b, e }))),
  formatos: [it => ({ campo: 'a', statement: `In the sentence "${it.e}", which verb tense is used?` }), it => ({ campo: 'b', statement: `Na frase "${it.e}", o tempo verbal indica:` })],
  explicar: it => `${it.a}: usado para ${it.b}.`, dica: 'Observe os auxiliares (do, am/is/are, have, will) e as expressões de tempo.'
});

export const LINGUAGENS = [figurasFam, funcoesFam, craseFam, concFam, variacaoFam, escolasFam, cognatosFam, temposFam];

// ---------------- HISTÓRIA ----------------
const HIST_BR = [
  { a: 'Chegada da esquadra de Cabral', ano: 1500, per: 'Período Pré-Colonial', b: 'início da presença portuguesa e da exploração do pau-brasil' },
  { a: 'Criação das capitanias hereditárias', ano: 1534, per: 'Brasil Colônia', b: 'divisão do território em faixas entregues a donatários' },
  { a: 'Instalação do Governo-Geral', ano: 1549, per: 'Brasil Colônia', b: 'centralização da administração colonial em Salvador' },
  { a: 'Invasões holandesas no Nordeste', ano: 1630, per: 'Brasil Colônia', b: 'ocupação de Pernambuco ligada ao comércio do açúcar' },
  { a: 'Inconfidência Mineira', ano: 1789, per: 'Brasil Colônia', b: 'conspiração contra a cobrança de impostos (derrama) sobre o ouro' },
  { a: 'Conjuração Baiana', ano: 1798, per: 'Brasil Colônia', b: 'revolta popular com participação de pessoas escravizadas e ideias de igualdade' },
  { a: 'Chegada da família real portuguesa', ano: 1808, per: 'Período Joanino', b: 'abertura dos portos às nações amigas' },
  { a: 'Independência do Brasil', ano: 1822, per: 'Primeiro Reinado', b: 'separação política de Portugal, liderada por D. Pedro I' },
  { a: 'Primeira Constituição do Brasil', ano: 1824, per: 'Primeiro Reinado', b: 'criação do Poder Moderador, exclusivo do imperador' },
  { a: 'Revolução Farroupilha', ano: 1835, per: 'Período Regencial', b: 'revolta no Sul contra impostos sobre o charque' },
  { a: 'Cabanagem', ano: 1835, per: 'Período Regencial', b: 'revolta popular no Pará contra a miséria e o governo regencial' },
  { a: 'Lei Eusébio de Queirós', ano: 1850, per: 'Segundo Reinado', b: 'proibição do tráfico de africanos escravizados para o Brasil' },
  { a: 'Guerra do Paraguai', ano: 1864, per: 'Segundo Reinado', b: 'conflito entre Paraguai e a Tríplice Aliança' },
  { a: 'Lei do Ventre Livre', ano: 1871, per: 'Segundo Reinado', b: 'filhos de mulheres escravizadas nascidos a partir dali seriam livres' },
  { a: 'Lei Áurea', ano: 1888, per: 'Segundo Reinado', b: 'abolição da escravidão, sem políticas de inclusão dos libertos' },
  { a: 'Proclamação da República', ano: 1889, per: 'República Velha', b: 'fim da monarquia, com golpe militar liderado por Deodoro da Fonseca' },
  { a: 'Guerra de Canudos', ano: 1896, per: 'República Velha', b: 'massacre de comunidade sertaneja liderada por Antônio Conselheiro' },
  { a: 'Revolta da Vacina', ano: 1904, per: 'República Velha', b: 'reação popular à vacinação obrigatória e às reformas urbanas no Rio' },
  { a: 'Semana de Arte Moderna', ano: 1922, per: 'República Velha', b: 'marco do Modernismo brasileiro em São Paulo' },
  { a: 'Revolução de 1930', ano: 1930, per: 'Era Vargas', b: 'fim da política do café com leite e chegada de Vargas ao poder' },
  { a: 'Criação da CLT', ano: 1943, per: 'Era Vargas', b: 'reunião das leis trabalhistas durante o Estado Novo' },
  { a: 'Fundação de Brasília', ano: 1960, per: 'República Populista', b: 'transferência da capital no governo Juscelino Kubitschek' },
  { a: 'Golpe civil-militar', ano: 1964, per: 'Ditadura Militar', b: 'deposição de João Goulart e início de 21 anos de ditadura' },
  { a: 'AI-5', ano: 1968, per: 'Ditadura Militar', b: 'fechamento do Congresso, censura e suspensão do habeas corpus' },
  { a: 'Lei da Anistia', ano: 1979, per: 'Ditadura Militar', b: 'retorno de exilados políticos e perdão a crimes políticos' },
  { a: 'Movimento Diretas Já', ano: 1984, per: 'Redemocratização', b: 'campanha popular por eleições diretas para presidente' },
  { a: 'Constituição Cidadã', ano: 1988, per: 'Nova República', b: 'ampliação de direitos sociais e do voto, e criação do SUS' },
  { a: 'Plano Real', ano: 1994, per: 'Nova República', b: 'controle da hiperinflação com uma nova moeda' }
];
const histBrFam = familia({
  subject: 'História', topic: ['História do Brasil', 'Linha do tempo do Brasil'], difficulty: 2,
  itens: HIST_BR.map(x => ({ ...x, d: `${x.a} (${x.ano})` })),
  formatos: [
    it => ({ campo: 'per', statement: `O evento "${it.a}", ocorrido em ${it.ano}, pertence a qual período da história do Brasil?` }),
    it => ({ campo: 'a', statement: `Qual acontecimento da história do Brasil está associado a: ${it.b}?` }),
    it => ({ campo: 'b', statement: `Sobre o acontecimento "${it.a}" (${it.ano}), é correto afirmar que ele envolveu:` })
  ],
  explicar: it => `${it.a} (${it.ano}, ${it.per}): ${it.b}.`,
  dica: 'Situe o evento na linha do tempo: Colônia, Império (1822–1889) ou República (desde 1889).'
});
const cronoFam = {
  subject: 'História', topic: ['História do Brasil', 'Cronologia'], level: 'enem', difficulty: 3, n: 70,
  make(r) {
    const evs = r.sample(HIST_BR.filter((x, i, a) => a.findIndex(y => y.ano === x.ano) === i), 5);
    const pergunta = r.pick(['mais antigo', 'mais recente']);
    const alvo = [...evs].sort((a, b) => pergunta === 'mais antigo' ? a.ano - b.ano : b.ano - a.ano)[0];
    const o = opcoes(r, alvo.a, evs.filter(x => x !== alvo).map(x => x.a));
    return o && { ...o, statement: `Entre os acontecimentos abaixo, qual é o ${pergunta}?`, explanation: `Ordem: ${[...evs].sort((a, b) => a.ano - b.ano).map(x => `${x.a} (${x.ano})`).join('; ')}.`, hint: 'Pense em que século e em qual período (Colônia, Império, República) cada evento aconteceu.' };
  }
};
const HIST_GERAL = [
  { a: 'Revolução Francesa', ano: 1789, b: 'fim dos privilégios da nobreza e do clero, com o lema "Liberdade, Igualdade, Fraternidade"' },
  { a: 'Revolução Industrial', ano: 1760, b: 'mecanização da produção na Inglaterra, com máquinas a vapor e trabalho fabril' },
  { a: 'Independência dos Estados Unidos', ano: 1776, b: 'rompimento das Treze Colônias com a Inglaterra' },
  { a: 'Reforma Protestante', ano: 1517, b: 'críticas de Lutero à venda de indulgências pela Igreja Católica' },
  { a: 'Queda de Constantinopla', ano: 1453, b: 'tomada pelos turcos otomanos, marco do fim da Idade Média' },
  { a: 'Primeira Guerra Mundial', ano: 1914, b: 'conflito entre Tríplice Entente e Tríplice Aliança, com guerra de trincheiras' },
  { a: 'Revolução Russa', ano: 1917, b: 'chegada dos bolcheviques ao poder e criação de um Estado socialista' },
  { a: 'Crise de 1929', ano: 1929, b: 'quebra da Bolsa de Nova York e grande depressão econômica' },
  { a: 'Segunda Guerra Mundial', ano: 1939, b: 'conflito entre Aliados e Eixo, com o Holocausto e as bombas atômicas' },
  { a: 'Criação da ONU', ano: 1945, b: 'organização internacional para manter a paz após a Segunda Guerra' },
  { a: 'Queda do Muro de Berlim', ano: 1989, b: 'símbolo do fim da Guerra Fria e da reunificação alemã' },
  { a: 'Fim do apartheid', ano: 1994, b: 'eleição de Nelson Mandela na África do Sul' },
  { a: 'Renascimento', ano: 1450, b: 'valorização do ser humano e da razão (antropocentrismo) nas artes e ciências' },
  { a: 'Iluminismo', ano: 1750, b: 'defesa da razão, da liberdade e da divisão dos poderes contra o absolutismo' },
  { a: 'Grandes Navegações', ano: 1492, b: 'expansão marítima europeia em busca de novas rotas comerciais' }
];
const histGeralFam = familia({
  subject: 'História', topic: ['História Geral', 'Grandes acontecimentos'], difficulty: 2,
  itens: HIST_GERAL,
  formatos: [it => ({ campo: 'a', statement: `Qual processo histórico é caracterizado por: ${it.b}?` }), it => ({ campo: 'b', statement: `Sobre a ${it.a} (por volta de ${it.ano}), é correto afirmar que ela foi marcada por:` })],
  explicar: it => `${it.a} (c. ${it.ano}): ${it.b}.`, dica: 'Relacione a característica ao contexto da época.'
});

// ---------------- GEOGRAFIA ----------------
const BIOMAS = [
  { a: 'Amazônia', b: 'floresta densa e úmida, com a maior bacia hidrográfica do mundo e grande biodiversidade', ameaca: 'desmatamento para pecuária e garimpo ilegal' },
  { a: 'Cerrado', b: 'vegetação de árvores tortas e casca grossa, com raízes profundas; "berço das águas" do Brasil', ameaca: 'expansão da soja e da pecuária' },
  { a: 'Caatinga', b: 'vegetação adaptada à seca, com plantas que perdem as folhas e cactos; exclusivo do Brasil', ameaca: 'desertificação e uso da lenha' },
  { a: 'Mata Atlântica', b: 'floresta tropical litorânea, a mais devastada, onde vive a maior parte da população', ameaca: 'urbanização e ocupação do litoral' },
  { a: 'Pantanal', b: 'maior planície alagável do mundo, com cheias e secas regulares', ameaca: 'queimadas e assoreamento dos rios' },
  { a: 'Pampa', b: 'campos com gramíneas no Sul do país, em relevo suave (coxilhas)', ameaca: 'monoculturas e arenização do solo' }
];
const biomasFam = familia({
  subject: 'Geografia', topic: ['Biomas brasileiros', 'Características dos biomas'], difficulty: 2, itens: BIOMAS,
  formatos: [it => ({ campo: 'a', statement: `Qual bioma brasileiro apresenta: ${it.b}?` }), it => ({ campo: 'a', statement: `Um dos principais problemas ambientais de um bioma brasileiro é ${it.ameaca}. Que bioma é esse?` }), it => ({ campo: 'b', statement: `Qual característica descreve o bioma ${it.a}?` })],
  explicar: it => `${it.a}: ${it.b}. Ameaça principal: ${it.ameaca}.`, dica: 'Pense no clima e na localização de cada bioma.'
});
const CONCEITOS_GEO = [
  { a: 'Êxodo rural', b: 'saída da população do campo para as cidades' }, { a: 'Conurbação', b: 'encontro das manchas urbanas de duas ou mais cidades vizinhas' },
  { a: 'Metrópole', b: 'grande cidade que polariza uma região e oferece serviços complexos' }, { a: 'Ilha de calor', b: 'temperatura maior no centro urbano do que nas áreas ao redor' },
  { a: 'Inversão térmica', b: 'camada de ar frio presa sob ar quente, concentrando poluição perto do solo' }, { a: 'Chuva ácida', b: 'precipitação com ácidos formados por gases poluentes de indústrias e veículos' },
  { a: 'Efeito estufa', b: 'retenção de calor na atmosfera por gases como o CO₂, essencial à vida, mas intensificado pela poluição' }, { a: 'Assoreamento', b: 'acúmulo de sedimentos no leito dos rios, geralmente após a retirada da mata ciliar' },
  { a: 'Lixiviação', b: 'lavagem dos nutrientes do solo pela água da chuva' }, { a: 'Globalização', b: 'integração econômica, cultural e tecnológica entre países' },
  { a: 'Transição demográfica', b: 'passagem de altas para baixas taxas de natalidade e mortalidade' }, { a: 'Bônus demográfico', b: 'período em que há mais pessoas em idade de trabalhar do que dependentes' },
  { a: 'Gentrificação', b: 'valorização de um bairro que expulsa os moradores mais pobres' }, { a: 'Agronegócio', b: 'cadeia que une produção agropecuária, indústria e comércio em grande escala' },
  { a: 'Agricultura familiar', b: 'produção em pequenas propriedades com mão de obra da família, responsável por grande parte dos alimentos consumidos no país' },
  { a: 'Desertificação', b: 'degradação do solo em áreas secas, que perde a capacidade produtiva' }
];
const geoConcFam = familia({
  subject: 'Geografia', topic: ['Geografia humana e ambiental', 'Conceitos geográficos'], difficulty: 2, itens: CONCEITOS_GEO,
  formatos: [it => ({ campo: 'a', statement: `O fenômeno caracterizado por ${it.b} é chamado de:` }), it => ({ campo: 'b', statement: `O conceito de "${it.a}" refere-se a:` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'Lembre da definição de cada conceito e elimine as que não combinam.'
});
const fusosFam = {
  subject: 'Geografia', topic: ['Cartografia', 'Fusos horários'], level: 'enem', difficulty: 3, n: 50,
  make(r) {
    const [c1, f1] = r.pick([['Brasília', -3], ['Manaus', -4], ['Rio Branco', -5]]);
    const [c2, f2] = r.pick([['Londres', 0], ['Lisboa', 0], ['Paris', 1], ['Tóquio', 9], ['Nova York', -5], ['Moscou', 3], ['Dubai', 4], ['Pequim', 8]]);
    const h = r.int(6, 20); const h2 = ((h + (f2 - f1)) % 24 + 24) % 24;
    const fmt = x => `${String(((x % 24) + 24) % 24).padStart(2, '0')}h`;
    const o = opcoes(r, fmt(h2), [fmt(h - (f2 - f1)), fmt(h2 + 1), fmt(h2 - 1), fmt(h), fmt(h2 + 2)]);
    return o && { ...o, statement: `Quando são ${fmt(h)} em ${c1} (UTC${f1}), que horas são em ${c2} (UTC${f2 >= 0 ? '+' + f2 : f2})? Desconsidere horário de verão.`, explanation: `A diferença é de ${Math.abs(f2 - f1)} h. ${c2} está ${f2 > f1 ? 'a leste, então as horas são adiantadas' : 'a oeste, então as horas são atrasadas'}: ${fmt(h2)}.`, hint: 'Indo para leste as horas aumentam; para oeste, diminuem.' };
  }
};
const densFam = {
  subject: 'Geografia', topic: ['População', 'Densidade demográfica'], level: 'medio', difficulty: 2, n: 40,
  make(r) {
    const area = r.pick([200, 500, 1000, 1250, 2000, 2500, 5000]), dens = r.pick([10, 20, 40, 50, 80, 120, 200, 350]);
    const pop = area * dens;
    const o = opcoes(r, `${dens} hab/km²`, [`${dens * 10} hab/km²`, `${dens / 2} hab/km²`, `${Math.round(area / pop * 1000)} hab/km²`, `${dens + 25} hab/km²`, `${dens * 2} hab/km²`]);
    return o && { ...o, statement: `Um município tem ${pop.toLocaleString('pt-BR')} habitantes e área de ${area.toLocaleString('pt-BR')} km². Qual é sua densidade demográfica?`, explanation: `Densidade = população ÷ área = ${pop.toLocaleString('pt-BR')} ÷ ${area.toLocaleString('pt-BR')} = ${dens} hab/km². Densidade alta não significa, sozinha, que o lugar é superpovoado.`, hint: 'Divida o número de habitantes pela área.' };
  }
};

// ---------------- SOCIOLOGIA E FILOSOFIA ----------------
const SOCIOLOGOS = [
  { a: 'Émile Durkheim', b: 'fato social, que é exterior, geral e coercitivo sobre o indivíduo' },
  { a: 'Max Weber', b: 'ação social e tipos de dominação (tradicional, carismática e racional-legal)' },
  { a: 'Karl Marx', b: 'luta de classes e mais-valia na exploração do trabalho' },
  { a: 'Zygmunt Bauman', b: 'modernidade líquida, com relações frágeis e passageiras' },
  { a: 'Pierre Bourdieu', b: 'capital cultural e a escola reproduzindo desigualdades' },
  { a: 'Michel Foucault', b: 'poder disciplinar e vigilância nas instituições (prisões, escolas)' },
  { a: 'Gilberto Freyre', b: 'interpretação da formação brasileira a partir da casa-grande e da senzala' },
  { a: 'Sérgio Buarque de Holanda', b: 'o "homem cordial", que mistura o público e o privado' },
  { a: 'Florestan Fernandes', b: 'crítica ao mito da democracia racial no Brasil' },
  { a: 'Theodor Adorno', b: 'indústria cultural, que transforma a cultura em mercadoria' },
  { a: 'Hannah Arendt', b: 'banalidade do mal, ao analisar o julgamento de Eichmann' }
];
const sociologiaFam = familia({
  subject: 'Sociologia', topic: ['Teoria sociológica', 'Pensadores e conceitos'], difficulty: 3, itens: SOCIOLOGOS,
  formatos: [it => ({ campo: 'a', statement: `O conceito de ${it.b} está associado a qual pensador?` }), it => ({ campo: 'b', statement: `Uma ideia central na obra de ${it.a} é:` })],
  explicar: it => `${it.a} é conhecido pela ideia de ${it.b}.`, dica: 'Associe cada autor ao seu conceito mais famoso.'
});
const FILOSOFOS = [
  { a: 'Sócrates', b: 'maiêutica e a frase "só sei que nada sei"' }, { a: 'Platão', b: 'mito da caverna e o mundo das ideias' },
  { a: 'Aristóteles', b: 'ética da virtude como justo meio e o ser humano como animal político' }, { a: 'Santo Agostinho', b: 'conciliação entre fé cristã e filosofia platônica' },
  { a: 'Maquiavel', b: 'separação entre ética e política: o governante deve manter o poder' }, { a: 'René Descartes', b: 'dúvida metódica e "penso, logo existo"' },
  { a: 'Thomas Hobbes', b: 'estado de natureza como guerra de todos contra todos e o Leviatã' }, { a: 'John Locke', b: 'direitos naturais à vida, liberdade e propriedade, e a mente como tábula rasa' },
  { a: 'Jean-Jacques Rousseau', b: 'contrato social e o ser humano nascendo bom, corrompido pela sociedade' }, { a: 'Immanuel Kant', b: 'imperativo categórico: agir segundo uma regra que valha para todos' },
  { a: 'Friedrich Nietzsche', b: 'crítica à moral tradicional e a "morte de Deus"' }, { a: 'Jean-Paul Sartre', b: 'existencialismo: "a existência precede a essência"' },
  { a: 'Simone de Beauvoir', b: '"ninguém nasce mulher: torna-se mulher"' }, { a: 'Montesquieu', b: 'divisão dos poderes em Executivo, Legislativo e Judiciário' }
];
const filosofiaFam = familia({
  subject: 'Filosofia', topic: ['História da filosofia', 'Filósofos e ideias'], difficulty: 3, itens: FILOSOFOS,
  formatos: [it => ({ campo: 'a', statement: `A ideia de ${it.b} pertence a qual filósofo?` }), it => ({ campo: 'b', statement: `Qual ideia é característica do pensamento de ${it.a}?` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'Lembre do período e da obra principal de cada filósofo.'
});

export const HUMANAS = [histBrFam, cronoFam, histGeralFam, biomasFam, geoConcFam, fusosFam, densFam, sociologiaFam, filosofiaFam];

// ---------------- BIOLOGIA ----------------
const ORGANELAS = [
  { a: 'Mitocôndria', b: 'respiração celular e produção de energia (ATP)' }, { a: 'Cloroplasto', b: 'fotossíntese, presente em células vegetais' },
  { a: 'Ribossomo', b: 'síntese de proteínas' }, { a: 'Complexo golgiense', b: 'armazenamento, modificação e secreção de substâncias' },
  { a: 'Lisossomo', b: 'digestão intracelular por enzimas' }, { a: 'Retículo endoplasmático liso', b: 'produção de lipídios e desintoxicação' },
  { a: 'Núcleo', b: 'guarda do material genético e controle das atividades da célula' }, { a: 'Membrana plasmática', b: 'controle da entrada e saída de substâncias (permeabilidade seletiva)' },
  { a: 'Parede celular', b: 'proteção e sustentação rígida em células vegetais' }, { a: 'Vacúolo', b: 'armazenamento de água e substâncias, regulando a pressão em células vegetais' }
];
const organelasFam = familia({
  subject: 'Biologia', topic: ['Citologia', 'Organelas'], level: 'medio', difficulty: 2, itens: ORGANELAS,
  formatos: [it => ({ campo: 'a', statement: `Qual estrutura celular é responsável por ${it.b}?` }), it => ({ campo: 'b', statement: `Qual é a função principal da estrutura chamada ${it.a.toLowerCase()}?` }), it => ({ campo: 'a', statement: `Um medicamento experimental bloqueia a estrutura celular responsável por ${it.b}. Que estrutura é atingida?` })],
  explicar: it => `${it.a}: ${it.b}.`, dica: 'Associe cada organela a uma "tarefa" da célula.'
});
const DOENCAS = [
  { a: 'Dengue', b: 'picada do mosquito Aedes aegypti', prev: 'eliminar água parada' }, { a: 'Malária', b: 'picada do mosquito Anopheles (protozoário Plasmodium)', prev: 'mosquiteiros e repelentes em áreas de risco' },
  { a: 'Doença de Chagas', b: 'fezes do barbeiro infectado pelo Trypanosoma cruzi', prev: 'casas de alvenaria e higiene no preparo de alimentos como açaí' }, { a: 'Esquistossomose', b: 'contato com água doce contaminada por larvas do caramujo', prev: 'saneamento básico e não entrar em lagoas contaminadas' },
  { a: 'Tuberculose', b: 'gotículas de ar expelidas por pessoa infectada (bactéria)', prev: 'vacina BCG e ambientes ventilados' }, { a: 'Leptospirose', b: 'contato com água ou lama contaminada pela urina de ratos', prev: 'evitar enchentes sem proteção e controlar roedores' },
  { a: 'Sarampo', b: 'gotículas respiratórias (vírus muito contagioso)', prev: 'vacina tríplice viral' }, { a: 'Ascaridíase (lombriga)', b: 'ingestão de ovos do verme em água ou alimentos contaminados', prev: 'lavar bem alimentos e ter saneamento' },
  { a: 'Tétano', b: 'bactéria que entra por ferimentos contaminados com terra', prev: 'vacina e limpeza de ferimentos' }, { a: 'Hepatite A', b: 'água e alimentos contaminados por fezes', prev: 'vacina, água tratada e higiene' }
];
const doencasFam = familia({
  subject: 'Biologia', topic: ['Saúde', 'Doenças e prevenção'], difficulty: 2, itens: DOENCAS,
  formatos: [it => ({ campo: 'a', statement: `Qual doença é transmitida principalmente por ${it.b}?` }), it => ({ campo: 'prev', statement: `Uma campanha de saúde pública quer reduzir os casos de ${it.a.toLowerCase()}. Qual medida é a mais adequada?` })],
  explicar: it => `${it.a}: transmissão por ${it.b}. Prevenção: ${it.prev}.`, dica: 'Pense em como o agente chega ao corpo: água, ar, vetor ou ferimento.'
});
const geneticaFam = {
  subject: 'Biologia', topic: ['Genética', 'Primeira lei de Mendel'], level: 'enem', difficulty: 3, n: 70,
  make(r) {
    const cruz = r.pick([['Aa', 'Aa'], ['Aa', 'aa'], ['AA', 'Aa'], ['AA', 'aa']]);
    const [p1, p2] = cruz;
    const filhos = []; for (const a of p1) for (const b of p2) filhos.push([a, b].sort().join(''));
    const nRec = filhos.filter(f => f === 'aa').length, nHet = filhos.filter(f => f === 'Aa').length;
    const [car, dom, rec] = r.pick([['cor da flor de uma planta', 'vermelha', 'branca'], ['cor da pelagem de coelhos', 'preta', 'branca'], ['textura da semente de ervilha', 'lisa', 'rugosa'], ['presença de albinismo', 'pigmentação normal', 'albinismo']]);
    const pergunta = r.pick(['rec', 'het']);
    const fr = k => ({ 0: '0%', 1: '25%', 2: '50%', 3: '75%', 4: '100%' }[k]);
    const certo = fr(pergunta === 'rec' ? nRec : nHet);
    const o = opcoes(r, certo, ['0%', '25%', '50%', '75%', '100%'].filter(x => x !== certo));
    return o && { ...o, statement: `Na ${car}, o alelo A (${dom}) é dominante sobre o alelo a (${rec}). Do cruzamento ${p1} × ${p2}, qual a probabilidade de nascer um descendente ${pergunta === 'rec' ? `com a característica "${rec}"` : 'heterozigoto (Aa)'}?`, explanation: `Quadro de Punnett: ${filhos.join(', ')}. ${pergunta === 'rec' ? `aa (${rec}) aparece ${nRec} de 4 vezes` : `Aa aparece ${nHet} de 4 vezes`}: ${certo}.`, hint: 'Monte o quadro de Punnett combinando os alelos de cada pai.' };
  }
};
const ecologiaFam = {
  subject: 'Biologia', topic: ['Ecologia', 'Cadeias alimentares e energia'], level: 'enem', difficulty: 3, n: 50,
  make(r) {
    const E = r.pick([10000, 20000, 50000, 100000, 1000000]);
    const cadeia = r.pick([['capim', 'gafanhoto', 'sapo', 'cobra'], ['algas', 'pequenos crustáceos', 'peixes', 'garças'], ['milho', 'rato', 'cobra', 'gavião'], ['folhas', 'lagarta', 'pássaro', 'gato-do-mato']]);
    const nivel = r.int(2, 3);
    const val = E / 10 ** nivel;
    const f = v => `${v.toLocaleString('pt-BR')} kcal`;
    const o = opcoes(r, f(val), [f(E / 10 ** (nivel - 1)), f(E / 10 ** (nivel + 1)), f(E / (nivel + 1)), f(E / 2 ** nivel), f(val * 5)]);
    return o && { ...o, statement: `Na cadeia ${cadeia.join(' → ')}, os produtores fixam ${f(E)}. Considerando que só cerca de 10% da energia passa de um nível trófico para o seguinte, quanta energia chega a(o) ${cadeia[nivel]}?`, explanation: `Cada passagem mantém cerca de 10%: ${cadeia.slice(0, nivel + 1).map((c, i) => `${c}: ${f(E / 10 ** i)}`).join(' → ')}. O resto se perde como calor e nas atividades vitais.`, hint: 'Divida por 10 a cada nível que você avança na cadeia.' };
  }
};
const SANGUE = { A: [['A', 'A'], ['A', 'O']], B: [['B', 'B'], ['B', 'O']], AB: [['A', 'B']], O: [['O', 'O']] };
const sangueFam = {
  subject: 'Biologia', topic: ['Genética', 'Sistema ABO'], level: 'enem', difficulty: 4, n: 40,
  make(r) {
    const tipos = ['A', 'B', 'AB', 'O'];
    const g1 = r.pick(Object.values(SANGUE).flat()), g2 = r.pick(Object.values(SANGUE).flat());
    const fen = g => g.includes('A') && g.includes('B') ? 'AB' : g.includes('A') ? 'A' : g.includes('B') ? 'B' : 'O';
    const nome = g => g.map(x => x === 'O' ? 'i' : 'I' + x).join('');
    const filhos = new Set(); for (const a of g1) for (const b of g2) filhos.add(fen([a, b]));
    const impossiveis = tipos.filter(t => !filhos.has(t));
    if (!impossiveis.length) return null;
    const certo = `Tipo ${r.pick(impossiveis)}`;
    const o = opcoes(r, certo, [...filhos].map(t => `Tipo ${t}`).concat(['Todos os tipos são possíveis']));
    return o && { ...o, statement: `Um casal tem genótipos ${nome(g1)} e ${nome(g2)} para o sistema ABO. Qual tipo sanguíneo NÃO pode aparecer entre os filhos desse casal?`, explanation: `Possíveis filhos: ${[...filhos].join(', ')}. Por isso, ${certo.toLowerCase()} é impossível.`, hint: 'Iᴬ e Iᴮ são codominantes; i é recessivo.' };
  }
};
export const NATUREZA = [organelasFam, doencasFam, geneticaFam, ecologiaFam, sangueFam];

// ---------------- DIREITO (concursos, menor peso) ----------------
const PRINC = [
  { a: 'Legalidade', b: 'a administração só pode agir conforme a lei autoriza' }, { a: 'Impessoalidade', b: 'a atuação visa ao interesse público, sem favorecer ou prejudicar pessoas' },
  { a: 'Moralidade', b: 'o agente deve agir com ética, honestidade e boa-fé' }, { a: 'Publicidade', b: 'os atos devem ser divulgados para permitir o controle pela sociedade' },
  { a: 'Eficiência', b: 'busca de bons resultados com o menor custo e qualidade no serviço' }
];
export const DIREITO = [familia({
  subject: 'Direito', topic: ['Direito Administrativo', 'Princípios da administração pública'], level: 'concurso', difficulty: 2, itens: PRINC,
  formatos: [it => ({ campo: 'a', statement: `Segundo o art. 37 da Constituição, qual princípio determina que ${it.b}?` }), it => ({ campo: 'b', statement: `O princípio da ${it.a.toLowerCase()} na administração pública significa que:` })],
  explicar: it => `${it.a}: ${it.b}. Os cinco princípios formam a sigla LIMPE.`, dica: 'Lembre-se da sigla LIMPE.'
})];
void cap;
