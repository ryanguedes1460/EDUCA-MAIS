// Classifica cada questão oficial do ENEM em matéria e conteúdo, pelas palavras do texto.
// A área (Linguagens, Humanas, Natureza, Matemática) vem da própria prova; dentro dela
// a matéria e o conteúdo são escolhidos pela maior pontuação de palavras-chave.
// É uma classificação automática: a professora pode corrigir qualquer questão no painel.

const sem = s => s.normalize('NFD').replace(/[̀-ͯ]/g, '').toLowerCase();

// [matéria, [conteúdo pai, conteúdo], padrões...]
const R = (subject, topic, ...words) => ({ subject, topic, re: new RegExp(words.map(w => w === '%' ? '%' : '(?<![a-z0-9])' + w.trim()).join('|'), 'g') });

export const REGRAS = {
  'ciencias-humanas': [
    R('Filosofia', ['História da filosofia', 'Filosofia antiga'], 'socrat', 'platao', 'platon', 'aristotel', 'pre-socratic', 'sofist', 'heraclit', 'parmenid', 'epicur', 'estoic'),
    R('Filosofia', ['História da filosofia', 'Filosofia medieval'], 'santo agostinho', 'tomas de aquino', 'escolastic', 'patristic'),
    R('Filosofia', ['História da filosofia', 'Filosofia moderna'], 'descartes', 'cartesian', 'kant', 'hume', 'espinosa', 'spinoza', 'francis bacon', 'empiris', 'racionalis', 'leibniz', 'pascal'),
    R('Filosofia', ['Filosofia política', 'Contratualismo e poder'], 'hobbes', 'locke', 'rousseau', 'maquiavel', 'contrato social', 'estado de natureza', 'montesquieu', 'leviata'),
    R('Filosofia', ['Filosofia contemporânea', 'Pensadores contemporâneos'], 'nietzsche', 'sartre', 'existencial', 'hannah arendt', 'arendt', 'heidegger', 'adorno', 'horkheimer', 'habermas', 'escola de frankfurt', 'wittgenstein', 'simone de beauvoir', 'beauvoir'),
    R('Filosofia', ['Ética e conhecimento', 'Ética, moral e conhecimento'], 'filosof', 'etica', 'moral', 'virtude', 'metafisic', 'epistemolog', 'razao', 'verdade'),
    R('Sociologia', ['Teoria sociológica', 'Clássicos da sociologia'], 'durkheim', 'max weber', 'weber', 'karl marx', 'marx', 'fato social', 'mais-valia', 'alienacao', 'sociolog'),
    R('Sociologia', ['Sociedade contemporânea', 'Cultura, trabalho e cidadania'], 'bourdieu', 'bauman', 'foucault', 'movimento social', 'movimentos sociais', 'cidadania', 'desigualdade social', 'industria cultural', 'etnocentr', 'cultura de massa', 'preconceito', 'racismo', 'feminis', 'genero', 'direitos humanos', 'trabalho informal', 'precariza'),
    R('Geografia', ['Geografia física', 'Relevo, solos e geologia'], 'relevo', 'erosao', 'solo', 'intemperismo', 'placa tectonic', 'tectonic', 'vulcan', 'terremoto', 'sismo', 'rochas', 'geolog', 'planalto', 'planicie', 'assoreamento', 'vocoroca'),
    R('Geografia', ['Clima', 'Climas do Brasil'], 'clima', 'chuva', 'precipitac', 'massa de ar', 'massas de ar', 'el nino', 'la nina', 'efeito estufa', 'aquecimento global', 'ilha de calor', 'inversao termica', 'temperatura media', 'semiarido', 'seca'),
    R('Geografia', ['Hidrografia', 'Bacias hidrográficas do Brasil'], 'bacia hidrograf', 'rios?\\b', 'aquifero', 'lencol freatico', 'hidrel', 'recursos hidricos', 'agua doce', 'transposicao'),
    R('Geografia', ['Geografia humana e ambiental', 'Questões ambientais'], 'desmatament', 'queimada', 'impacto ambiental', 'sustentab', 'biodiversidade', 'poluic', 'unidade de conservacao', 'ambiental', 'bioma', 'cerrado', 'caatinga', 'amazonia', 'mata atlantica', 'pantanal'),
    R('Geografia', ['População', 'Urbanização'], 'urbaniza', 'metropol', 'favela', 'segregacao', 'cidade', 'urbano', 'conurbac', 'mobilidade urbana', 'periferia'),
    R('Geografia', ['População', 'Migrações e demografia'], 'migra', 'imigra', 'emigra', 'demograf', 'natalidade', 'mortalidade', 'envelhecimento', 'populacao', 'refugiad', 'piramide etaria', 'exodo rural'),
    R('Geografia', ['Espaço agrário e indústria', 'Agropecuária, indústria e energia'], 'agricultura', 'agronegocio', 'agropecuar', 'latifund', 'reforma agraria', 'agrari', 'monocultura', 'agrotox', 'industria', 'industrial', 'fontes de energia', 'matriz energetica', 'petroleo', 'biocombust', 'mineracao', 'revolucao verde'),
    R('Geografia', ['Geopolítica e globalização', 'Globalização e mundo atual'], 'globaliza', 'geopolit', 'bloco economico', 'mercosul', 'uniao europeia', 'fluxos', 'transnaciona', 'multinaciona', 'neoliberal', 'guerra fria', 'fronteira', 'territorio', 'conflito'),
    R('Geografia', ['Cartografia', 'Escalas, mapas e projeções'], 'cartograf', 'escala', 'mapa', 'projecao', 'coordenada', 'latitude', 'longitude', 'fuso horario', 'meridiano', 'paralelo', 'gps', 'sensoriamento', 'anamorfose'),
    R('História', ['História Geral', 'Antiguidade'], 'grecia', 'grego', 'atenas', 'esparta', 'roma\\b', 'romano', 'imperio romano', 'egito', 'mesopotam', 'antiguidade', 'polis', 'fenici', 'hebreus'),
    R('História', ['História Geral', 'Idade Média'], 'medieval', 'idade media', 'feudal', 'feudo', 'servo', 'senhor feudal', 'cruzada', 'igreja catolica', 'cavaleiro', 'bizanti', 'isla'),
    R('História', ['História Geral', 'Idade Moderna'], 'renascimento', 'renascentista', 'reforma protestante', 'lutero', 'calvin', 'absolutis', 'mercantilis', 'grandes navegac', 'iluminis', 'revolucao francesa', 'revolucao inglesa', 'napoleao', 'antigo regime'),
    R('História', ['História Geral', 'Mundo contemporâneo'], 'revolucao industrial', 'imperialis', 'neocolonial', 'primeira guerra', 'segunda guerra', 'guerra mundial', 'nazis', 'fascis', 'totalitar', 'revolucao russa', 'socialis', 'capitalis', 'guerra fria', 'descoloniza', 'apartheid', 'holocausto', 'sovietic'),
    R('História', ['História do Brasil', 'Brasil Colônia'], 'colonia', 'colonial', 'capitania', 'sesmaria', 'jesuit', 'bandeirant', 'engenho', 'acucar', 'quilombo', 'palmares', 'escraviz', 'escravid', 'inconfidencia', 'minas gerais colonial', 'ouro', 'cabral', 'tupinamb', 'indigen', 'missoes'),
    R('História', ['Brasil Império', 'Império e Regências'], 'imperio', 'imperador', 'dom pedro', 'd. pedro', 'regencia', 'regencial', 'cabanagem', 'balaiada', 'farroupilha', 'sabinada', 'abolicao', 'lei aurea', 'lei do ventre livre', 'cafe', 'independencia'),
    R('História', ['Brasil República', 'República Velha e Era Vargas'], 'republica velha', 'primeira republica', 'coronelis', 'cangaco', 'canudos', 'contestado', 'revolta da vacina', 'revolta da chibata', 'tenentis', 'getulio', 'vargas', 'estado novo', 'era vargas', 'clt', 'semana de arte moderna'),
    R('História', ['Brasil República', 'Ditadura e redemocratização'], 'ditadura', 'regime militar', 'golpe de 1964', 'ai-5', 'ato institucional', 'censura', 'diretas ja', 'redemocratiza', 'constituicao de 1988', 'anistia', 'juscelino', 'jk', 'brasilia', 'populis'),
    R('História', ['História do Brasil', 'Processos históricos'], 'seculo', 'historia', 'historic', 'revolta', 'revolucao', 'republica', 'colonizad')
  ],
  'ciencias-natureza': [
    R('Biologia', ['Citologia', 'Célula e metabolismo'], 'celula', 'celular', 'mitocondri', 'cloroplast', 'membrana plasmatica', 'organela', 'ribossom', 'respiracao celular', 'fermentac', 'atp', 'metabolis', 'enzima'),
    R('Biologia', ['Genética', 'DNA, genes e hereditariedade'], 'dna', 'rna', 'gene', 'genetic', 'cromossom', 'mutac', 'hereditar', 'alelo', 'mendel', 'clonagem', 'transgenic', 'biotecnolog', 'sequenciamento', 'crispr'),
    R('Biologia', ['Evolução', 'Evolução e seleção natural'], 'evolu', 'selecao natural', 'darwin', 'lamarck', 'especiacao', 'adaptac', 'ancestral', 'fossil'),
    R('Biologia', ['Ecologia', 'Ecossistemas e relações ecológicas'], 'ecossistema', 'cadeia alimentar', 'teia alimentar', 'populac', 'comunidade', 'nicho', 'habitat', 'predad', 'parasit', 'mutualism', 'competicao', 'sucessao ecologica', 'ciclo do carbono', 'ciclo do nitrogenio', 'bioacumul', 'eutrofiza', 'especie invasora', 'biodiversidade', 'bioma'),
    R('Biologia', ['Saúde', 'Doenças e prevenção'], 'doenca', 'virus', 'viral', 'bacteri', 'vacina', 'imun', 'anticorpo', 'antibiotic', 'infecc', 'parasitose', 'dengue', 'malaria', 'zika', 'covid', 'epidemi', 'pandemi', 'protozoar', 'vermino'),
    R('Biologia', ['Corpo humano', 'Fisiologia humana'], 'hormoni', 'insulina', 'sangue', 'coracao', 'rim', 'renal', 'pulmao', 'digest', 'neuron', 'sistema nervoso', 'musculo', 'figado', 'glicose', 'diabetes', 'nutric', 'vitamina', 'gestac', 'reproducao humana', 'anticoncepcional'),
    R('Biologia', ['Botânica', 'Plantas e fotossíntese'], 'fotossint', 'planta', 'vegetal', 'vegeta', 'folha', 'raiz', 'semente', 'flor', 'polinizac', 'estomato', 'xilema', 'floema'),
    R('Biologia', ['Zoologia', 'Animais'], 'animal', 'animais', 'inseto', 'mamifer', 'peixe', 'anfibio', 'reptil', 'ave', 'vertebrad', 'invertebrad', 'artropod', 'molusco'),
    R('Química', ['Química orgânica', 'Funções e reações orgânicas'], 'organic', 'hidrocarbon', 'alcool', 'etanol', 'ester', 'acido carboxil', 'cetona', 'aldeido', 'amina', 'polimer', 'isomer', 'cadeia carbonica', 'benzeno', 'saponific', 'biodiesel', 'grupo funcional', 'formula estrutural'),
    R('Química', ['Físico-química', 'Eletroquímica'], 'eletrolis', 'pilha', 'bateria', 'oxirreduc', 'oxidac', 'reducao', 'nox', 'eletrodo', 'anodo', 'catodo', 'galvaniz', 'corrosao'),
    R('Química', ['Físico-química', 'Termoquímica, cinética e equilíbrio'], 'entalpia', 'endotermic', 'exotermic', 'termoquim', 'velocidade da reacao', 'catalis', 'equilibrio quimico', 'le chatelier', 'constante de equilibrio', 'energia de ativacao'),
    R('Química', ['Físico-química', 'pH e acidez'], 'ph\\b', 'acido', 'acida', 'basico', 'alcalin', 'neutraliz', 'indicador', 'hidroxid', 'tampao'),
    R('Química', ['Soluções', 'Concentração e diluição'], 'concentrac', 'solucao', 'soluto', 'solvente', 'diluic', 'mol/l', 'g/l', 'solubilid', 'ppm'),
    R('Química', ['Estequiometria', 'Cálculo estequiométrico'], 'estequiometr', 'massa molar', 'mols?\\b', 'rendimento', 'reagente limitante', 'g/mol', 'g mol'),
    R('Química', ['Química geral', 'Substâncias, misturas e separação'], 'mistura', 'destilac', 'filtrac', 'decantac', 'separacao', 'substancia pura', 'propriedades fisicas', 'densidade'),
    R('Química', ['Estrutura atômica', 'Átomo, tabela periódica e ligações'], 'atomo', 'atomic', 'eletron', 'proton', 'neutron', 'isotopo', 'tabela periodica', 'ligacao ionica', 'ligacao covalente', 'ligacoes', 'radioativ', 'meia-vida', 'decaimento', 'fissao', 'fusao nuclear'),
    R('Química', ['Química ambiental', 'Química e ambiente'], 'chuva acida', 'camada de ozonio', 'poluente', 'combustao', 'efeito estufa', 'tratamento de agua', 'reciclagem', 'metais pesados', 'quimic'),
    R('Física', ['Eletricidade', 'Circuitos e energia elétrica'], 'corrente eletrica', 'tensao eletrica', 'resistor', 'resistencia eletrica', 'circuito', 'voltagem', 'ampere', 'volt', 'ohm', 'kwh', 'potencia eletrica', 'chuveiro', 'lampada', 'fusivel', 'disjuntor', 'eletric'),
    R('Física', ['Eletromagnetismo', 'Campo magnético e indução'], 'magnet', 'ima\\b', 'bussola', 'inducao', 'eletromagnet', 'gerador', 'transformador', 'motor eletrico'),
    R('Física', ['Ondulatória', 'Ondas, som e luz'], 'onda', 'frequencia', 'comprimento de onda', 'som\\b', 'sonor', 'acustic', 'resson', 'doppler', 'radiacao', 'ultravioleta', 'infravermelho', 'micro-onda', 'espectro'),
    R('Física', ['Óptica', 'Lentes, espelhos e luz'], 'lente', 'espelho', 'refracao', 'reflexao', 'optic', 'luz\\b', 'luminos', 'arco-iris', 'miopia', 'hipermetropia', 'fibra optica'),
    R('Física', ['Termologia', 'Calor e termodinâmica'], 'calor', 'temperatura', 'termic', 'termodinam', 'dilatac', 'calorimetr', 'caloria', 'conducao', 'conveccao', 'irradiacao', 'maquina termica', 'isolante'),
    R('Física', ['Hidrostática', 'Pressão e empuxo'], 'pressao', 'empuxo', 'arquimedes', 'pascal', 'hidrostat', 'flutua', 'densidade'),
    R('Física', ['Dinâmica', 'Forças e leis de Newton'], 'forca', 'newton', 'atrito', 'inercia', 'aceleracao', 'massa', 'peso', 'gravidade', 'gravitac', 'quantidade de movimento', 'colisao', 'impulso', 'mola', 'tracao'),
    R('Física', ['Energia', 'Trabalho, energia e potência'], 'energia cinetica', 'energia potencial', 'conservacao da energia', 'trabalho', 'potencia', 'rendimento', 'energia mecanica', 'usina', 'eolica', 'solar'),
    R('Física', ['Cinemática', 'Movimento'], 'velocidade', 'movimento', 'trajetoria', 'deslocamento', 'km/h', 'm/s', 'queda', 'lancamento', 'aceleracao', 'radar')
  ],
  linguagens: [
    R('Literatura', ['Literatura brasileira', 'Escolas e textos literários'], 'poema', 'poeta', 'poesia', 'verso', 'estrofe', 'soneto', 'romance', 'romantis', 'realis', 'naturalis', 'modernis', 'barroc', 'arcadis', 'parnasian', 'simbolis', 'machado de assis', 'drummond', 'clarice', 'guimaraes rosa', 'graciliano', 'literari', 'narrador', 'personagem', 'conto', 'cronica', 'lirico', 'eu lirico', 'cordel'),
    R('Artes', ['Artes', 'Arte e cultura'], 'arte', 'artista', 'artistic', 'pintura', 'pintor', 'escultura', 'museu', 'obra de arte', 'instalacao', 'grafite', 'fotografia', 'cinema', 'teatro', 'danca', 'musica', 'musical', 'cancao', 'vanguarda', 'performance', 'bienal'),
    R('Educação Física', ['Educação Física', 'Corpo, esporte e saúde'], 'esporte', 'esportiv', 'atividade fisica', 'exercicio fisico', 'educacao fisica', 'atleta', 'futebol', 'olimpi', 'paralimp', 'ginastica', 'capoeira', 'jogo', 'brincadeira', 'lutas', 'sedentar', 'condicionamento'),
    R('Português', ['Linguagem e sociedade', 'Variação linguística'], 'variacao linguistica', 'variante', 'norma-padrao', 'norma padrao', 'norma culta', 'regionalis', 'sotaque', 'girias', 'giria', 'preconceito linguistico', 'coloquial', 'dialeto'),
    R('Português', ['Interpretação de texto', 'Gêneros textuais'], 'genero textual', 'generos textuais', 'propaganda', 'publicidade', 'anuncio', 'campanha', 'charge', 'tirinha', 'cartum', 'infografico', 'reportagem', 'noticia', 'editorial', 'artigo de opiniao', 'carta', 'verbete', 'manifesto', 'resenha'),
    R('Português', ['Interpretação de texto', 'Funções da linguagem'], 'funcao da linguagem', 'metalinguag', 'funcao poetica', 'funcao conativa', 'funcao referencial', 'funcao emotiva', 'funcao fatica'),
    R('Português', ['Gramática', 'Gramática e sentido'], 'conjuncao', 'pronome', 'verbo', 'verbal', 'concordancia', 'regencia', 'crase', 'pontuacao', 'virgula', 'adjetivo', 'substantivo', 'advérbio', 'adverbio', 'oracao', 'coesao', 'conectivo', 'sintatic', 'morfolog'),
    R('Português', ['Linguagem e tecnologia', 'Tecnologias da comunicação'], 'internet', 'rede social', 'redes sociais', 'digital', 'tecnologia', 'celular', 'virtual', 'online', 'informacao', 'midia'),
    R('Português', ['Interpretação de texto', 'Compreensão e interpretação'], 'texto', 'autor', 'leitor', 'argument', 'sentido', 'linguagem')
  ],
  matematica: [
    R('Matemática', ['Estatística', 'Média, moda e mediana'], 'media', 'mediana', 'moda', 'desvio padrao', 'variancia', 'estatistic', 'grafico', 'tabela'),
    R('Matemática', ['Probabilidade', 'Probabilidade'], 'probabilidade', 'chance', 'aleatori', 'sorteio', 'sortead'),
    R('Matemática', ['Análise combinatória', 'Contagem'], 'combinac', 'arranjo', 'permutac', 'anagrama', 'maneiras diferentes', 'quantas maneiras', 'possibilidades'),
    R('Matemática', ['Geometria', 'Geometria espacial e volumes'], 'volume', 'cilindr', 'cone', 'esfera', 'prisma', 'piramide', 'cubo', 'paralelepiped', 'capacidade', 'litros', 'reservatorio', 'caixa d'),
    R('Matemática', ['Geometria', 'Geometria plana e áreas'], 'area', 'perimetro', 'triangulo', 'quadrado', 'retangul', 'circulo', 'circunferencia', 'angulo', 'poligono', 'hexagon', 'losango', 'trapezio', 'pitagoras', 'semelhanca'),
    R('Matemática', ['Trigonometria', 'Trigonometria'], 'seno', 'cosseno', 'tangente', 'trigonometr', 'radiano'),
    R('Matemática', ['Funções', 'Funções e gráficos'], 'funcao', 'grafico da', 'parabola', 'crescente', 'decrescente', 'exponencial', 'logaritm', 'f\\(x\\)'),
    R('Matemática', ['Matemática financeira', 'Porcentagem e juros'], 'porcent', '%', 'juros', 'desconto', 'lucro', 'prejuizo', 'aumento', 'reajuste', 'imposto', 'taxa', 'parcela', 'financiamento', 'prestac'),
    R('Matemática', ['Grandezas e medidas', 'Escalas, unidades e proporção'], 'escala', 'proporc', 'razao', 'regra de tres', 'unidade de medida', 'metro', 'quilometro', 'centimetro', 'grama', 'velocidade', 'consumo'),
    R('Matemática', ['Sequências', 'Progressões'], 'progressao', 'sequencia', 'termo geral', 'padrao'),
    R('Matemática', ['Aritmética', 'Números e operações'], 'fracao', 'decimal', 'numero', 'multiplo', 'divisor', 'mmc', 'mdc', 'potencia', 'raiz', 'notacao cientifica', 'algarismo')
  ]
};

/**
 * Área pela posição da questão na prova (a ordem oficial do INEP), que é mais confiável
 * do que o campo "discipline" da fonte, que tem erros em alguns anos.
 *   2009:        1–45 Natureza, 46–90 Humanas, 91–135 Linguagens, 136–180 Matemática
 *   2010 a 2016: 1–45 Humanas,  46–90 Natureza, 91–135 Linguagens, 136–180 Matemática
 *   2017 em diante: 1–45 Linguagens, 46–90 Humanas, 91–135 Natureza, 136–180 Matemática
 */
export function areaPorIndice(ano, i) {
  const b = Math.min(3, Math.floor((i - 1) / 45));
  const ordem = ano === 2009 ? ['ciencias-natureza', 'ciencias-humanas', 'linguagens', 'matematica']
    : ano <= 2016 ? ['ciencias-humanas', 'ciencias-natureza', 'linguagens', 'matematica']
    : ['linguagens', 'ciencias-humanas', 'ciencias-natureza', 'matematica'];
  return ordem[b];
}
export const diaDaProva = (ano, i) => (i <= 90 ? 1 : 2);

export function classificar(q) {
  const disc = areaPorIndice(q.year, q.index);
  let regras = REGRAS[disc] || [];
  if (disc === 'linguagens' && q.language) return { subject: q.language === 'ingles' ? 'Inglês' : 'Espanhol', topic: ['Interpretação de texto', q.language === 'ingles' ? 'Leitura em língua inglesa' : 'Leitura em língua espanhola'] };
  const txt = ' ' + sem([q.context || '', q.alternativesIntroduction || '', ...q.alternatives.map(a => a.text || '')].join(' ')).replace(/!\[[^\]]*\]\([^)]*\)/g, ' ') + ' ';
  let best = null, bestScore = 0;
  regras.forEach((r, i) => {
    const n = (txt.match(r.re) || []).length;
    // regras mais específicas vêm antes e ganham um pequeno bônus no desempate
    const score = n ? n + (regras.length - i) * 0.01 : 0;
    if (score > bestScore) { bestScore = score; best = r; }
  });
  if (!best) {
    const pad = { 'ciencias-humanas': ['História', ['História do Brasil', 'Processos históricos']], 'ciencias-natureza': ['Biologia', ['Ecologia', 'Ecossistemas e relações ecológicas']], linguagens: ['Português', ['Interpretação de texto', 'Compreensão e interpretação']], matematica: ['Matemática', ['Aritmética', 'Números e operações']] }[disc];
    return { subject: pad[0], topic: pad[1] };
  }
  return { subject: best.subject, topic: best.topic };
}
