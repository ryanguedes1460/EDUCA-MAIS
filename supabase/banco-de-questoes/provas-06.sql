-- Educa Mais · provas (ENEM oficial e concursos), parte 6 de 17 (gerado por scripts/gerar-provas.mjs)
-- Cole no Supabase > SQL Editor e clique em Run. Pode rodar de novo sem duplicar nada.
begin;
insert into public.questions (id, code, subject_id, topic_id, level, difficulty, board_id, year, qtype, theme, statement, explanation, hint, source, status, updated_at) values
  ('e2000000-0000-4000-a000-0000000009c5', 'ENEM-2022-117', 7, 26, 'enem', 3, 2, 2022, 'multiple_choice', 'pH e acidez', 'Um grupo de alunos realizou um experimento para observar algumas propriedades dos ácidos, adicionando um pedaço de mármore (CaCO3 ) a uma solução aquosa de ácido clorídrico (HCl), observando a liberação de um gás e o aumento da temperatura.

![](conteudo/enem/2022/117-d1b41872.webp)

O gás obtido no experimento é o:', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 117 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009c6', 'ENEM-2022-118', 5, 404, 'enem', 3, 2, 2022, 'multiple_choice', 'Fisiologia humana', 'Em 2002, foi publicado um artigo científico que  
relacionava alterações na produção de hormônios sexuais  
de sapos machos expostos à atrazina, um herbicida, com  
o desenvolvimento anômalo de seus caracteres sexuais  
primários e secundários. Entre os animais sujeitos à  
contaminação, observaram-se casos de hermafroditismo  
e desmasculinização da laringe. O estudo em questão  
comparou a concentração de um hormônio específico  
no sangue de machos expostos ao agrotóxico com a de  
outros machos e fêmeas que não o foram (controles).  
Os resultados podem ser vistos na figura.

![](conteudo/enem/2022/118-e51b0279.webp)

HAYES, T. B. et al. Hermaphroditic, Demasculinized Frogs After Exposure to  
the Herbicide Atrazine at Low Ecologically Relevant Doses. **Proceedings of**  
**the National Academy of Sciences**, n. 8, 2002 (adaptado).

Com base nas informações do texto, qual é o hormônio
cujas concentrações estão representadas na figura?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 118 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009c7', 'ENEM-2022-119', 7, 408, 'enem', 3, 2, 2022, 'multiple_choice', 'Eletroquímica', 'Uma lanterna funciona com três pilhas de resistência interna igual a 0,5 Ω cada, ligadas em série. Quando posicionadas corretamente, devem acender a lâmpada incandescente de especificações 4,5 W e 4,5 V. Cada pilha na posição correta gera uma f.e.m. (força eletromotriz) de 1,5 V. Uma pessoa, ao trocar as pilhas da lanterna, comete o equívoco de inverter a posição de uma das pilhas. Considere que as pilhas mantêm contato independentemente da posição.

Com esse equívoco, qual é a intensidade de corrente que passa pela lâmpada ao se ligar a lanterna?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 119 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009c8', 'ENEM-2022-120', 5, 459, 'enem', 3, 2, 2022, 'multiple_choice', 'Célula e metabolismo', 'Em uma aula prática de bioquímica, para medir a atividade catalítica da enzima catalase, foram realizados seis ensaios independentes, nas mesmas condições, variando-se apenas a temperatura. A catalase decompõe o peróxido de hidrogênio (H2O2), produzindo água e oxigênio. Os resultados dos ensaios estão apresentados no quadro.

![](conteudo/enem/2022/120-b54f40a5.webp)

Os diferentes resultados dos ensaios justificam-se pelo(a)', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 120 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009c9', 'ENEM-2022-121', 5, 261, 'enem', 3, 2, 2022, 'multiple_choice', 'Doenças e prevenção', 'Antimicrobianos são substâncias naturais ou sintéticas que têm capacidade de matar ou inibir o crescimento de microrganismos. A tabela apresenta uma lista de antimicrobianos hipotéticos, bem como suas ações e efeitos sobre o metabolismo microbiano.

![](conteudo/enem/2022/121-e95c1ba6.webp)

Qual dos antimicrobianos deve ser utilizado para curar uma infecção causada por um fungo sem afetar as bactérias da microbiota normal do organismo?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 121 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009ca', 'ENEM-2022-122', 5, 261, 'enem', 3, 2, 2022, 'multiple_choice', 'Doenças e prevenção', 'O veneno da cascavel pode causar hemorragia com risco de morte a quem é picado pela serpente. No entanto, pesquisadores do Brasil e da Bélgica desenvolveram uma molécula de interesse farmacêutico, a PEG-collineína-1,  
a partir de uma proteína encontrada no veneno dessa cobra, capaz de modular a coagulação sanguínea. Embora a técnica não seja nova, foi a primeira vez que o método foi usado a partir de uma toxina animal na sua forma recombinante, ou seja, produzida em laboratório por um fungo geneticamente modificado.

JULIÃO, A. **Técnica modifica proteína do veneno de cascavel e permite**  
**criar fármaco que modula a coagulação sanguínea**. Disponível em:  
https://agencia.fapesp.br. Acesso em: 22 nov. 2021 (adaptado).

Esse novo medicamento apresenta potencial aplicação para', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 122 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009cb', 'ENEM-2022-123', 6, 412, 'enem', 3, 2, 2022, 'multiple_choice', 'Forças e leis de Newton', 'Um Buraco Negro é um corpo celeste que possui uma grande quantidade de matéria concentrada em uma pequena região do espaço, de modo que sua força gravitacional é tão grande que qualquer partícula fica aprisionada em sua superfície, inclusive a luz. O raio dessa região caracteriza uma superfície-limite, chamada de horizonte de eventos, da qual nada consegue escapar. Considere que o Sol foi instantaneamente substituído por um Buraco Negro com a mesma massa solar, de modo que o seu horizonte de eventos seja de aproximadamente 3,0 km.

SCHWARZSCHILD, K. **On the Gravitational Field of a Mass Point According to** **Einstein’s Theory**. Disponível em: arxiv.org. Acesso em: 26 maio 2022 (adaptado).

Após a substituição descrita, o que aconteceria aos planetas do Sistema Solar?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 123 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009cc', 'ENEM-2022-124', 7, 414, 'enem', 3, 2, 2022, 'multiple_choice', 'Química e ambiente', 'Durante o ano de 2020, impulsionado pela necessidade de respostas rápidas e eficientes para desinfectar ambientes de possíveis contaminações com o SARS-CoV-2, causador da covid-19, diversas alternativas foram buscadas para  
os procedimentos de descontaminação de materiais e ambientes. Entre elas, o uso de ozônio em meio aquoso como agente sanitizante para pulverização em humanos e equipamentos de proteção em câmaras ou túneis, higienização de automóveis e de ambientes fechados e descontaminação de trajes. No entanto, pouca atenção foi dada à toxicidade do ozônio, à formação de subprodutos, ao  
nível de concentração segura e às precauções necessárias.

LIMA, M. J. A.; FELIX, E. P.; CARDOSO, A. A. Aplicações e implicações do ozônio na indústria, ambiente e saúde. Química Nova, n. 9, 2021 (adaptado).

O grande risco envolvido no emprego indiscriminado dessa substância deve-se à sua ação química como', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 124 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009cd', 'ENEM-2022-125', 5, 403, 'enem', 3, 2, 2022, 'multiple_choice', 'DNA, genes e hereditariedade', 'Na figura está representado o mosaicismo em função da inativação aleatória de um dos cromossomos X, que ocorre em todas as mulheres sem alterações  patológicas.

![](conteudo/enem/2022/125-310a2901.webp)

Entre mulheres heterozigotas para doenças determinadas por genes recessivos ligados ao sexo, essa inativação tem como consequência a ocorrência de', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 125 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009ce', 'ENEM-2022-126', 7, 460, 'enem', 3, 2, 2022, 'multiple_choice', 'Substâncias, misturas e separação', 'A água bruta coletada de mananciais apresenta alto índice de sólidos suspensos, o que a deixa com um aspecto turvo. Para se obter uma água límpida e potável, ela deve passar por um processo de purificação numa estação de tratamento de água. Nesse processo, as principais etapas são, nesta ordem: coagulação, decantação, filtração, desinfecção e fluoretação.

Qual é a etapa de retirada de grande parte desses sólidos?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 126 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009cf', 'ENEM-2022-127', 5, 459, 'enem', 3, 2, 2022, 'multiple_choice', 'Célula e metabolismo', 'Os ursos, por não apresentarem uma hibernação verdadeira, acordam por causa da presença de termogenina, uma proteína mitocondrial que impede a chegada dos prótons até a ATP sintetase, gerando calor. Esse calor é importante para aquecer o organismo, permitindo seu despertar.

SADAVA, D. et al. Vida: a ciência da biologia. Porto Alegre: Artmed, 2009 (adaptado).

Em qual etapa do metabolismo energético celular a termogenina interfere?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 127 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d0', 'ENEM-2022-128', 6, 407, 'enem', 3, 2, 2022, 'multiple_choice', 'Circuitos e energia elétrica', 'A fim de classificar as melhores rotas em um aplicativo de trânsito, um pesquisador propõe um modelo com base em circuitos elétricos. Nesse modelo, a corrente representa o número de carros que passam por um ponto da pista no intervalo de 1 s. A diferença de potencial (d.d.p.) corresponde à quantidade de energia por carro necessária para o deslocamento de 1 m. De forma análoga à lei de Ohm, cada via é classificada pela sua resistência, sendo a de maior resistência a mais congestionada. O aplicativo mostra as rotas em ordem crescente, ou seja, da rota de menor para a de maior resistência.  
Como teste para o sistema, são utilizadas três possíveis vias para uma viagem de A até B, com os valores de d.d.p. e corrente conforme a tabela.

![](conteudo/enem/2022/128-3e38e718.webp)

Nesse teste, a ordenação das rotas indicadas pelo aplicativo será:', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 128 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d1', 'ENEM-2022-129', 7, 26, 'enem', 3, 2, 2022, 'multiple_choice', 'pH e acidez', 'O esquema representa o ciclo do nitrogênio:

![](conteudo/enem/2022/129-dceda47e.webp)

A chuva ácida interfere no ciclo do nitrogênio, principalmente, por proporcionar uma diminuição do pH do solo e da atmosfera, alterando a concentração dos compostos presentes nesse ciclo.

Disponível em: http://scienceprojectideasforkids.com. Acesso em: 6 ago. 2012 (adaptado).

Em um solo de menor pH, será favorecida a formação de:', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 129 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d2', 'ENEM-2022-130', 6, 416, 'enem', 3, 2, 2022, 'multiple_choice', 'Lentes, espelhos e luz', 'No processo de captação da luz pelo olho para a formação de imagens estão envolvidas duas estruturas celulares: os cones e os bastonetes. Os cones são sensíveis à energia dos fótons, e os bastonetes, à quantidade de fótons incidentes. A energia dos fótons que compõem os raios luminosos está associada à sua frequência, e a intensidade, ao número de fótons incidentes.

Um animal que tem bastonetes mais sensíveis irá', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 130 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d3', 'ENEM-2022-131', 7, 413, 'enem', 3, 2, 2022, 'multiple_choice', 'Átomo, tabela periódica e ligações', 'De modo geral, a palavra “aromático” invoca associações agradáveis, como cheiro de café fresco ou de um pão doce de canela.Associações similares ocorriam no passadoda história da químicaorgânica, quando os compostosditos “aromáticos” apresentavam um odor agradável e foram isolados de óleos naturais. À medida que as estruturas desses compostos eram elucidadas, foi se descobrindo que vários deles continham uma unidade estrutural específica. Os compostos aromáticos que continham essa unidade estrutural tornaram-se parte de uma grande família, muito mais com base em suas estruturas eletrônicas do que nos seus cheiros, como as substâncias a seguir, encontradas em óleos vegetais.

![](conteudo/enem/2022/131-ffcbcff6.webp)

SOLOMONS, T. W. G.; FRYHLE, C. B. Química orgânica. Rio de Janeiro: LTC, 2009 (adaptado).

A característica estrutural dessa família de compostos é a presença de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 131 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d4', 'ENEM-2022-132', 5, 261, 'enem', 3, 2, 2022, 'multiple_choice', 'Doenças e prevenção', 'Os resultados de um ensaio clínico randomizado na Indonésia apontaram uma redução de 77% dos casos de dengue nas áreas que receberam o mosquito _Aedes aegypti_ infectado com a bactéria _Wolbachia_. Trata-se da mesma técnica utilizada no Brasil pelo Método _Wolbachia_, iniciativa conduzida pela Fundação Oswaldo Cruz — Fiocruz. Essa bactéria induz a redução da carga viral no mosquito e, consequentemente, o número de casos de dengue na área, sendo repassada por meio do cruzamento entre os insetos. Como essa bactéria é um organismo intracelular e o vírus também precisa entrar nas células para se reproduzir, ambos necessitarão de recursos comuns.

COSTA, G. Agência Fiocruz de Notícias. Estudo confirma eficácia do Método Wolbachia para dengue. Disponível em: https://portal.fiocruz.br. Acesso em: 3 jun. 2022 (adaptado).

Essa tecnologia utilizada no combate à dengue consiste na', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 132 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d5', 'ENEM-2022-133', 5, 261, 'enem', 3, 2, 2022, 'multiple_choice', 'Doenças e prevenção', 'O protozoário Trypanosoma cruzi, causador da doença de Chagas, pode ser a nova arma da medicina contra o câncer. Pesquisadores brasileiros conseguiram criar uma vacina contra a doença usando uma variação do protozoário incapaz de desencadear a patologia (não patogênico). Para isso, realizaram uma modificação genética criando um T. cruzi capaz de produzir também moléculas fabricadas pelas células tumorais. Quando o organismo inicia o combate ao protozoário, entra em contato também com a molécula tumoral, que passa a ser  
vista também pelo sistema imune como um indicador de células do protozoário. Depois de induzidas as defesas, estas passam a destruir todas as células com a molécula tumoral, como se lutassem apenas contra o protozoário.

Disponível em: www.estadao.com.br. Acesso em: 1 mar. 2012 (adaptado).

Qual o mecanismo utilizado no experimento para enganar as células de defesa, fazendo com que ataquem o tumor?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 133 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d6', 'ENEM-2022-134', 6, 415, 'enem', 3, 2, 2022, 'multiple_choice', 'Ondas, som e luz', 'O sinal sonoro oriundo da queda de um grande bloco de gelo de uma geleira é detectado por dois dispositivos situados em um barco, sendo que o detector A está imerso em água e o B, na proa da embarcação. Sabe-se que a velocidade do som na água é de 1 540 m/s e no ar é de 340 m/s.

![](conteudo/enem/2022/134-6f7c3bcf.webp)

Os gráficos indicam, em tempo real, o sinal sonoro detectado pelos dois dispositivos, os quais foram ligados simultaneamente em um instante anterior à queda do bloco de gelo. Ao comparar pontos correspondentes desse sinal em cada dispositivo, é possível obter informações sobre a onda sonora.

![](conteudo/enem/2022/134-01e05752.webp)

A distância L, em metro, entre o barco e a geleira é mais próxima de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 134 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d7', 'ENEM-2022-135', 6, 416, 'enem', 3, 2, 2022, 'multiple_choice', 'Lentes, espelhos e luz', 'Em 2002, um mecânico da cidade mineira de Uberaba (MG) teve uma ideia para economizar o consumo de energia elétrica e iluminar a própria casa num dia de sol. Para isso, ele utilizou garrafas plásticas PET com água e cloro, conforme ilustram as figuras. Cada garrafa foi fixada ao telhado de sua casa em um buraco com diâmetro igual ao da garrafa, muito maior que o comprimento de onda da luz. Nos últimos dois anos, sua ideia já alcançou diversas partes do mundo e deve atingir a marca de 1 milhão de casas utilizando a “luz engarrafada”.

![](conteudo/enem/2022/135-c20e9e98.webp)

ZOBEL, G. Brasileiro inventor de “Iuz engarrafada” tem ideia espalhada pelo mundo.  
Disponível em: www.bbc.com. Acesso em 23 jun. 2022 (adaptado)

Que fenômeno óptico explica o funcionamento da “luz engarrafada”?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 135 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d8', 'ENEM-2022-136', 3, 446, 'enem', 3, 2, 2022, 'multiple_choice', 'Escalas, unidades e proporção', 'Uma máquina em operação tem sua temperatura T monitorada por meio de um registro gráfico, ao longo do tempo t. Essa máquina possui um pistão cuja velocidade V varia com a temperatura T da máquina, de acordo com a expressão V=T²−4. Após a máquina funcionar durante o intervalo de tempo de 10 horas, o seu operador analisa o registro gráfico, apresentado na figura, para avaliar a necessidade de eventuais ajustes, sabendo que a máquina apresenta falhas de funcionamento quando a velocidade do pistão se anula.

![](conteudo/enem/2022/136-44fff3b7.webp)

Quantas vezes a velocidade do pistão se anulou durante as 10 horas de funcionamento?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 136 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009d9', 'ENEM-2022-137', 3, 453, 'enem', 3, 2, 2022, 'multiple_choice', 'Probabilidade', 'A World Series é a decisão do campeonato norte-americano de beisebol. Os dois times que chegam  
a essa fase jogam, entre si, até sete partidas. O primeiro desses times que completar quatro vitórias é declarado campeão.

Considere que, em todas as partidas, a probabilidade de qualquer um dos dois times vencer é sempre ![](conteudo/enem/2022/137-091aafba.webp)

Qual é a probabilidade de o time campeão ser aquele que venceu a primeira partida da World Series?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 137 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009da', 'ENEM-2022-138', 3, 447, 'enem', 3, 2, 2022, 'multiple_choice', 'Porcentagem e juros', 'O gráfico apresenta os totais de receitas e despesas de uma empresa, expressos em milhão de reais, no  
decorrer dos meses de um determinado ano. A empresa obtém lucro quando a diferença entre receita e despesa é positiva e tem prejuízo quando essa diferença é negativa.

![](conteudo/enem/2022/138-d738a15a.webp)

Qual é a mediana, em milhão de reais, dos valores dos lucros apurados pela empresa nesse ano?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 138 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009db', 'ENEM-2022-139', 3, 446, 'enem', 3, 2, 2022, 'multiple_choice', 'Escalas, unidades e proporção', 'Um casal está reformando a cozinha de casa e decidiu comprar um refrigerador novo. Observando a planta da nova cozinha, desenhada na escala de 1: 50, notaram que o espaço destinado ao refrigerador tinha 3,8 cm de altura e 1,6 cm de largura. Eles sabem que os fabricantes de refrigeradores indicam que, para um bom funcionamento e fácil manejo na limpeza, esses eletrodomésticos devem ser colocados em espaços que permitam uma distância de, pelo menos, 10 cm de outros móveis ou paredes, tanto na parte superior quanto nas laterais. O casal comprou um refrigerador que caberia no local a ele destinado na nova cozinha, seguindo as instruções do fabricante.

Esse refrigerador tem altura e largura máximas, em metro, respectivamente, iguais a', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 139 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009dc', 'ENEM-2022-140', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Foram convidadas 32 equipes para um torneio de futebol, que foram divididas em 8 grupos com 4 equipes, sendo que, dentro de um grupo, cada equipe disputa uma única partida contra cada uma das demais equipes de seu grupo. A primeira e a segunda colocadas de cada grupo seguem para realizar as 8 partidas da próxima fase do torneio, chamada oitavas de final. Os vencedores das partidas das oitavas de final seguem para jogar as 4 partidas das quartas de final. Os vencedores das quartas de final disputam as 2 partidas das semifinais, e os vencedores avançam para a grande final, que define a campeã do torneio.

Pelas regras do torneio, cada equipe deve ter um período de descanso de, no mínimo, 3 dias entre dois jogos por ela disputados, ou seja, se um time disputar uma partida, por exemplo, num domingo, só poderá disputar a partida seguinte a partir da quinta-feira da mesma semana.

O número mínimo de dias necessários para a realização desse torneio é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 140 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009dd', 'ENEM-2022-141', 3, 453, 'enem', 3, 2, 2022, 'multiple_choice', 'Probabilidade', 'Em um jogo de bingo, as cartelas contêm 16 quadrículas dispostas em linhas e colunas. Cada quadrícula tem impresso um número, dentre os inteiros de 1 a 50, sem repetição de número. Na primeira rodada, um número é sorteado, aleatoriamente, dentre os 50 possíveis. Em todas as rodadas, o número sorteado é descartado e não participa dos sorteios das rodadas seguintes. Caso o jogador tenha em sua cartela o número sorteado, ele o assinala na cartela. Ganha o jogador que primeiro conseguir preencher quatro quadrículas que formam uma linha, uma coluna ou uma diagonal, conforme os tipos de situações ilustradas na Figura 1.

![](conteudo/enem/2022/141-e8e788ea.webp)

O jogo inicia e, nas quatro primeiras rodadas, foram sorteados os seguintes números: 03, 27, 07 e 48. Ao final da quarta rodada, somente Pedro possuía uma cartela que continha esses quatro números sorteados, sendo que todos os demais jogadores conseguiram assinalar, no máximo, um desses números em suas cartelas. Observe na Figura 2 o cartão de Pedro após as quatro primeiras rodadas.

![](conteudo/enem/2022/141-1e77b1bf.webp)

A probabilidade de Pedro ganhar o jogo em uma das duas próximas rodadas é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 141 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009de', 'ENEM-2022-142', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Uma montadora de automóveis divulgou que oferta a seus clientes mais de 1 000 configurações diferentes de carro, variando o modelo, a motorização, os opcionais e a cor do veículo. Atualmente, ela oferece 7 modelos de carros com 2 tipos de motores: 1.0 e 1.6. Já em relação aos opcionais, existem 3 escolhas possíveis: central multimídia, rodas de liga leve e bancos de couro, podendo o cliente optar por incluir um, dois, três ou nenhum dos opcionais disponíveis.

Para ser fiel à divulgação feita, a quantidade mínima de cores que a montadora deverá disponibilizar a seus clientes é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 142 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009df', 'ENEM-2022-143', 3, 449, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria espacial e volumes', 'Dentre as diversas planificações possíveis para o cubo, uma delas é a que se encontra apresentada na Figura 1.

![](conteudo/enem/2022/143-4da64c40.webp)

Em um cubo, foram pintados, em três de suas faces, quadrados de cor cinza escura, que ocupam um quarto dessas faces, tendo esses três quadrados um vértice em comum, conforme ilustrado na Figura 2.

![](conteudo/enem/2022/143-a05cd294.webp)

A planificação do cubo da Figura 2, conforme o tipo de planificação apresentada na Figura 1, é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 143 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e0', 'ENEM-2022-145', 3, 446, 'enem', 3, 2, 2022, 'multiple_choice', 'Escalas, unidades e proporção', 'O pacote básico de um jogo para smartphone, que é vendido a R$ 50,00, contém 2 000 gemas e 100 000 moedas de ouro, que são itens utilizáveis nesse jogo.  
A empresa que comercializa esse jogo decidiu criar um pacote especial que será vendido a R$ 100,00 e que se diferenciará do pacote básico por apresentar maiores quantidades de gemas e moedas de ouro. Para estimular as vendas desse novo pacote, a empresa decidiu inserir nele 6 000 gemas a mais, em relação ao que o cliente teria caso optasse por comprar, com a mesma quantia, dois pacotes básicos.

A quantidade de moedas de ouro que a empresa deverá inserir ao pacote especial, para que seja mantida a mesma proporção existente entre as quantidades de gemas e de moedas de ouro contidas no pacote básico, é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 145 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e1', 'ENEM-2022-146', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Um parque tem dois circuitos de tamanhos diferentes para corridas. Um corredor treina nesse parque e, no primeiro dia, inicia seu treino percorrendo  
3 voltas em torno do circuito maior e 2 voltas em torno do menor, perfazendo um total de 1 800 m. Em seguida, dando continuidade a seu treino, corre mais 2 voltas em torno do circuito maior e 1 volta em torno do menor,  
percorrendo mais 1 100 m.

No segundo dia, ele pretende percorrer 5 000 m nos circuitos do parque, fazendo um número inteiro de voltas em torno deles e de modo que o número de voltas seja o maior possível.

A soma do número de voltas em torno dos dois circuitos, no segundo dia, será', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 146 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e2', 'ENEM-2022-147', 3, 447, 'enem', 3, 2, 2022, 'multiple_choice', 'Porcentagem e juros', 'Uma equipe de marketing digital foi contratada para aumentar as vendas de um produto ofertado em um site de comércio eletrônico. Para isso, elaborou um anúncio que, quando o cliente clica sobre ele, é direcionado  
para a página de vendas do produto. Esse anúncio foi divulgado em duas redes sociais, A e B, e foram obtidos os seguintes resultados:

• rede social A: o anúncio foi visualizado por 3 000 pessoas; 10% delas clicaram sobre o anúncio e foram redirecionadas para o site; 3% das que clicaram sobre o anúncio compraram o produto. O investimento feito para a publicação do anúncio nessa rede foi de R$ 100,00;

• rede social B: o anúncio foi visualizado por 1 000 pessoas; 30% delas clicaram sobre o anúncio e foram redirecionadas para o site; 2% das que  
clicaram sobre o anúncio compraram o produto. O investimento feito para a publicação do anúncio nessa rede foi de R$ 200,00.

Por experiência, o pessoal da equipe de marketing considera que a quantidade de novas pessoas que verão o anúncio é diretamente proporcional ao investimento realizado, e que a quantidade de pessoas que comprarão o produto também se manterá proporcional à quantidade de pessoas que clicarão sobre o anúncio.  
O responsável pelo produto decidiu, então, investir mais R$ 300,00 em cada uma das duas redes sociais para a divulgação desse anúncio e obteve, de fato, o aumento proporcional esperado na quantidade de clientes que compraram esse produto. Para classificar o aumento obtido na quantidade (Q) de compradores desse produto, em consequência dessa segunda divulgação, em relação aos resultados observados na primeira divulgação, o  
responsável pelo produto adotou o seguinte critério:

• Q ≤ 60%: não satisfatório;  
• 60% < Q ≤ 100%: regular;  
• 100% < Q ≤ 150%: bom;  
• 150% < Q ≤ 190%: muito bom;  
• 190% < Q ≤ 200%: excelente

O aumento na quantidade de compradores, em consequência dessa segunda divulgação, em relação
ao que foi registrado com a primeira divulgação, foi classificado como', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 147 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e3', 'ENEM-2022-148', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'A luminosidade _L_ de uma estrela está relacionada com o raio _R_ e com a temperatura _T_ dessa estrela segundo a Lei de Stefan-Boltzmann: ![](conteudo/enem/2022/148-00e98ef8.webp) em que c é uma constante igual para todas as estrelas.

Disponível em: http://ciencia.hsw.uol.com.br. Acesso em: 22 nov. 2013 (adaptado)

Considere duas estrelas _E_ e _F_, sendo que a estrela _E_ tem metade do raio da estrela _F_ e o dobro da temperatura de _F_.

Indique por LE  e LF suas respectivas luminosidades.
A relação entre as luminosidades dessas duas estrelas é dada por', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 148 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e4', 'ENEM-2022-149', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Uma das informações que pode auxiliar no dimensionamento do número de pediatras que devem atender em uma Unidade Básica de Saúde (UBS) é o número que representa a mediana da quantidade de crianças por família existente na região sob sua responsabilidade. O quadro mostra a distribuição das frequências do número de crianças por família na região de responsabilidade de uma UBS.

![](conteudo/enem/2022/149-d92eba46.webp)

O número que representa a mediana da quantidade de crianças por família nessa região é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 149 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e5', 'ENEM-2022-150', 3, 452, 'enem', 3, 2, 2022, 'multiple_choice', 'Funções e gráficos', 'Em jogos de voleibol, um saque é invalidado se a bola atingir o teto do ginásio onde ocorre o jogo. Um jogador de uma equipe tem um saque que atinge uma grande altura. Seu recorde foi quando a batida do saque se iniciou a uma altura de 1,5 m do piso da quadra, e a trajetória da bola foi descrita pela parábola ![](conteudo/enem/2022/150-764fcc6a.webp) , em que y representa a altura da bola em relação ao eixo x (das abscissas) que está localizado a 1,5 m do piso da quadra, como representado na figura. Suponha que em todas as partidas algum saque desse jogador atinja a mesma altura do seu recorde.

![](conteudo/enem/2022/150-0964fd1c.webp)

A equipe desse jogador participou de um torneio de voleibol no qual jogou cinco partidas, cada uma delas  
em um ginásio diferente. As alturas dos tetos desses ginásios, em relação aos pisos das quadras, são:  
• ginásio I: 17 m;  
• ginásio II: 18 m;  
• ginásio III: 19 m;  
• ginásio IV: 21 m;  
• ginásio V: 40 m.

O saque desse atleta foi invalidado', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 150 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e6', 'ENEM-2022-151', 3, 105, 'enem', 3, 2, 2022, 'multiple_choice', 'Média, moda e mediana', 'Um médico faz o acompanhamento clínico de um grupo de pessoas que realizam atividades físicas diariamente. Ele observou que a perda média de massa dessas pessoas para cada hora de atividade física era de 1,5 kg. Sabendo que a massa de 1 L de água é de 1 kg, ele recomendou que ingerissem, ao longo das 3 horas seguintes ao final da atividade, uma quantidade total de água correspondente a 40% a mais do que a massa perdida na atividade física, para evitar desidratação.

Seguindo a recomendação médica, uma dessas pessoas ingeriu, certo dia, um total de 1,7 L de água após  
terminar seus exercícios físicos.

Para que a recomendação médica tenha efetivamente sido respeitada, a atividade física dessa pessoa, nesse dia, durou', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 151 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e7', 'ENEM-2022-152', 3, 448, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria plana e áreas', 'Em uma sala de cinema, para garantir que os espectadores vejam toda a imagem projetada na tela, a disposição das poltronas deve obedecer à norma técnica da Associação Brasileira de Normas Técnicas (ABNT), que faz as seguintes indicações:  
• Distância mínima (Dmín) entre a tela de projeção e o encosto da poltrona da primeira fileira deve ser de, pelo menos, 60% da largura (L) da tela.  
• Distância máxima (Dmáx) entre a tela de projeção e o encosto da poltrona da última fileira deve ser o dobro da largura (L) da tela, sendo aceitável uma distância de até 2,9 vezes a largura (L) da tela.  
Para o espaçamento entre as fileiras de poltronas, é considerada a distância de 1 metro entre os encostos de poltronas em duas fileiras consecutivas.

Disponível em: www.ctav.gov.br. Acesso em: 14 nov. 2013.

Disponível em: www.ctav.gov.br. Acesso em: 14 nov. 2013.

![](conteudo/enem/2022/152-f182fb95.webp)

Pretende-se ampliar essa sala, mantendo-se na mesma posição a tela e todas as poltronas já instaladas,  
ampliando-se ao máximo a sala para os fundos (área de instalação de novas poltronas), respeitando-se o limite aceitável da norma da ABNT. A intenção é aumentar, ao máximo, a quantidade de poltronas da sala, instalando-se novas unidades, iguais às já instaladas.

Quantas fileiras de poltronas a sala comportará após essa ampliação?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 152 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e8', 'ENEM-2022-153', 3, 449, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria espacial e volumes', '![](conteudo/enem/2022/153-f85bbaf3.webp)

Uma empresa produz e vende um tipo de chocolate, maciço, em formato de cone circular reto com as medidas do diâmetro da base e da altura iguais a 8 cm e 10 cm, respectivamente, como apresenta a figura.

Devido a um aumento de preço dos ingredientes utilizados na produção desse chocolate, a empresa  
decide produzir esse mesmo tipo de chocolate com um volume 19% menor, no mesmo formato de cone circular reto com altura de 10 cm.

Para isso, a empresa produzirá esses novos chocolates com medida do raio da base, em centímetro, igual a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 153 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009e9', 'ENEM-2022-154', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Em janeiro de 2013, foram declaradas 1 794 272 admissões e 1 765 372 desligamentos no Brasil, ou seja,  
foram criadas 28 900 vagas de emprego, segundo dados do Cadastro Geral de Empregados e Desempregados (Caged), divulgados pelo Ministério do Trabalho e Emprego (MTE). Segundo o Caged, o número de vagas criadas em janeiro de 2013 sofreu uma queda de 75%, quando comparado com o mesmo período de 2012.

Disponível em: http://portal.mte.gov.br. Acesso em: 23 fev. 2013 (adaptado).

De acordo com as informações dadas, o número de vagas criadas em janeiro de 2012 foi', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 154 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009ea', 'ENEM-2022-155', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Um prédio, com 9 andares e 8 apartamentos de 2 quartos por andar, está com todos os seus apartamentos à venda. Os apartamentos são identificados por números formados por dois algarismos, sendo que a dezena indica o andar onde se encontra o apartamento, e a unidade, um algarismo de 1 a 8, que diferencia os apartamentos de um mesmo andar. Quanto à incidência de sol nos quartos desses apartamentos, constatam-se as seguintes características, em função de seus números de identificação:  
• naqueles que finalizam em 1 ou 2, ambos os quartos recebem sol apenas na parte da manhã;  
• naqueles que finalizam em 3, 4, 5 ou 6, apenas um dos quartos recebe sol na parte da manhã;  
• naqueles que finalizam em 7 ou 8, ambos os quartos recebem sol apenas na parte da tarde.

Uma pessoa pretende comprar 2 desses apartamentos em um mesmo andar, mas quer que, em ambos, pelo menos um dos quartos receba sol na parte da manhã.

De quantas maneiras diferentes essa pessoa poderá escolher 2 desses apartamentos para compra nas condições desejadas?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 155 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009eb', 'ENEM-2022-156', 3, 448, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria plana e áreas', 'O professor de artes orientou seus estudantes a realizarem a seguinte sequência de atividades:  
• Dobrar uma folha de papel em formato quadrado duas vezes, em sequência, ao longo das linhas tracejadas, conforme ilustrado nas figuras 1 e 2, para obter o papel dobrado, conforme Figura 3.

![](conteudo/enem/2022/156-2b1f4d30.webp)

• Em seguida, no papel dobrado da Figura 3, considerar o ponto _R_, sobre o segmento _OM_, sendo  o ponto médio do lado do quadrado original, de modo que ![](conteudo/enem/2022/156-2a89a0e4.webp), traçar um arco de circunferência de raio medindo ![](conteudo/enem/2022/156-1665e780.webp) com centro no ponto _R_, obtendo a Figura 4. Por último, recortar o papel ao longo do arco de circunferência e excluir a parte que contém o setor circular, obtendo o papel dobrado, conforme Figura 5.

![](conteudo/enem/2022/156-bf9a172b.webp)

Após desdobrado o papel que restou na Figura 5, a figura plana que os estudantes obterão será', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 156 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009ec', 'ENEM-2022-157', 3, 452, 'enem', 3, 2, 2022, 'multiple_choice', 'Funções e gráficos', 'O funcionário de uma loja tem seu salário mensal formado por uma parcela fixa de 675 reais mais uma comissão que depende da quantidade de peças vendidas por ele no mês. O cálculo do valor dessa comissão é feito de acordo com estes critérios:  
• até a quinquagésima peça vendida, paga-se 5 reais por peça;  
• a partir da quinquagésima primeira peça vendida, o valor pago é de 7 reais por peça.  
Represente por q a quantidade de peças vendidas no mês por esse funcionário, e por S(q) o seu salário mensal, em real, nesse mês.

A expressão algébrica que descreve S(q) em função de q é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 157 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009ed', 'ENEM-2022-158', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Ao analisar os dados de uma epidemia em uma cidade, peritos obtiveram um modelo que avalia a quantidade de pessoas infectadas a cada mês, ao longo de um ano. O modelo é dado por ![](conteudo/enem/2022/158-94d1c253.webp), sendo t um número natural, variando de 1 a 12, que representa os meses do ano, e p(t) a quantidade de pessoas infectadas no mês t do ano. Para tentar diminuir o número de infectados no próximo ano, a Secretaria Municipal de Saúde decidiu intensificar a propaganda oficial sobre os cuidados com a epidemia. Foram apresentadas cinco propostas (I, II, III, IV e V), com diferentes períodos de intensificação das propagandas:

![](conteudo/enem/2022/158-e0b502d3.webp)

A sugestäo dos peritos é que seja escolhida a proposta cujo período de intensificação da propaganda englobe o mês em que, sequndo o modelo, há a maior quantidade de infectados. A sugestão foi aceita.

A proposta escolhida foi a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 158 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009ee', 'ENEM-2022-159', 3, 468, 'enem', 3, 2, 2022, 'multiple_choice', 'Progressões', 'Um atleta iniciou seu treinamento visando as competições de fim de ano. Seu treinamento consiste em cinco tipos diferentes de treinos: treino ![](conteudo/enem/2022/159-1de0b45e.webp),  treino ![](conteudo/enem/2022/159-0ab1a35f.webp), treino  ![](conteudo/enem/2022/159-8b00bc00.webp), treino ![](conteudo/enem/2022/159-14be4d1d.webp) e treino ![](conteudo/enem/2022/159-136e1c72.webp). A sequência dos treinamentos deve seguir esta ordem:

![](conteudo/enem/2022/159-1c8945f7.webp)

A letra R significa repouso. Após completar a sequência de treinamentos, o atleta começa novamente a sequência a partir do treino ![](conteudo/enem/2022/159-660fa349.webp), e segue a ordem descrita. Após 24 semanas completas de treinamento, se dará o inicio das competições.

Please select text to grab.

Copyfish

estöes20112Fonteestões2011

OCR successful

##### OCR Result(Auto-Detect)

N/A

##### Translated(English)

Redo OCR Recapture Re-Translate Copy to clipboard

A sequência de treinamentos que o atleta realizará na 24ª semana de treinos é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 159 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009ef', 'ENEM-2022-160', 3, 449, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria espacial e volumes', 'Um robô, que tem um ímã em sua base, se desloca sobre a superfície externa de um cubo metálico, ao longo de segmentos de reta cujas extremidades são pontos médios de arestas e centros de faces. Ele inicia seu deslocamento no ponto **P**, centro da face superior do cubo, segue para o centro da próxima face, converte à esquerda e segue para o centro da face seguinte, converte à direita e continua sua movimentação, sempre alternando entre conversões à esquerda e à direita quando alcança o centro de uma face. O robô só termina sua movimentação quando retorna ao ponto **P**. A figura apresenta os deslocamentos iniciais desse robô.

![](conteudo/enem/2022/160-c9e8168c.webp)

A projeção ortogonal do trajeto descrito por esse robô sobre o plano da base, após terminada sua movimentação, visualizada da posição em que se está enxergando esse cubo, é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 160 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f0', 'ENEM-2022-161', 3, 448, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria plana e áreas', 'Uma empresa de engenharia projetou uma casa com a forma de um retângulo para um de seus clientes. Esse cliente solicitou a inclusão de uma varanda em forma de L. A figura apresenta a planta baixa desenhada pela empresa, já com a varanda incluída, cujas medidas, indicadas em centímetro, representam os valores das dimensões da varanda na escala de 1 : 50.

![](conteudo/enem/2022/161-e1e86e81.webp)

A medida real da área da varanda, em metro quadrado, é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 161 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f1', 'ENEM-2022-162', 3, 449, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria espacial e volumes', 'Uma loja de roupas fixou uma meta de vendas de 77 000 reais para um determinado mês de 30 dias. O gráfico mostra o volume de vendas dessa loja, em real, nos dez primeiros dias do mês e entre o dia dez e o dia vinte desse mês, nos seus dois únicos setores (infantil e adulto). Suponha que a variação no volume de vendas, para o período registrado, tenha se dado de forma linear, como mostrado no gráfico, e que essa tendência se mantenha a mesma para os próximos dez dias.

![](conteudo/enem/2022/162-0942383a.webp)

Ao final do trigésimo dia, quanto faltará no volume de vendas, em real, para que a meta fixada para o mês seja alcançada?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 162 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f2', 'ENEM-2022-163', 3, 447, 'enem', 3, 2, 2022, 'multiple_choice', 'Porcentagem e juros', 'Em uma universidade, atuam professores que estão enquadrados funcionalmente pela sua maior titulação: mestre ou doutor. Nela há, atualmente, 60 mestres e 40 doutores. Os salários mensais dos professores mestres e dos doutores são, respectivamente, R$ 8 000,00 e  
R$ 12 000,00.  
A diretoria da instituição pretende proporcionar um aumento salarial diferenciado para o ano seguinte, de tal forma que o salário médio mensal dos professores dessa instituição não ultrapasse R$ 12 240,00. A universidade já estabeleceu que o aumento salarial será de 25% para os mestres e precisa ainda definir o percentual de reajuste para os doutores.

Mantido o número atual de professores com suas atuais titulações, o aumento salarial, em porcentagem, a ser concedido aos doutores deverá ser de, no máximo,', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 163 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f3', 'ENEM-2022-164', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Um borrifador de atuação automática libera, a cada acionamento, uma mesma quantidade de inseticida. O recipiente desse produto, quando cheio, contém 360 mL de inseticida, que duram 60 dias se o borrifador permanecer ligado ininterruptamente e for acionado a cada 48 minutos.

A quantidade de inseticida que é liberada a cada acionamento do borrifador, em mililitro, é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 164 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f4', 'ENEM-2022-165', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Definem-se o dia e o ano de um planeta de um sistema solar como sendo, respectivamente, o tempo que o planeta leva para dar 1 volta completa em torno de seu próprio eixo de rotação e o tempo para dar 1 volta completa em torno de seu Sol.  
Suponha que exista um planeta Z, em algum sistema solar, onde um dia corresponda a 73 dias terrestres e que 2 de seus anos correspondam a 1 ano terrestre. Considere que 1 ano terrestre tem 365 de seus dias.

No planeta Z, seu ano corresponderia a quantos de seus dias?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 165 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f5', 'ENEM-2022-167', 3, 447, 'enem', 3, 2, 2022, 'multiple_choice', 'Porcentagem e juros', 'Em uma loja, o preço promocional de uma geladeira é de R$ 1 000,00 para pagamento somente em dinheiro. Seu preço normal, fora da promoção, é 10% maior. Para pagamento feito com o cartão de crédito da loja, é dado um desconto de 2% sobre o preço normal.  
Uma cliente decidiu comprar essa geladeira, optando pelo pagamento com o cartão de crédito da loja. Ela calculou que o valor a ser pago seria o preço promocional acrescido de 8%. Ao ser informada pela loja do valor a  
pagar, segundo sua opção, percebeu uma diferença entre seu cálculo e o valor que lhe foi apresentado

O valor apresentado pela loja, comparado ao valor calculado pela cliente, foi', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 167 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f6', 'ENEM-2022-168', 3, 468, 'enem', 3, 2, 2022, 'multiple_choice', 'Progressões', 'Uma pessoa precisa se deslocar de automóvel do ponto P para o ponto Q, indicados na figura, na qual as linhas verticais e horizontais simbolizam ruas

![](conteudo/enem/2022/168-5c7c6e9a.webp)

Por causa do sentido de tráfego nessas ruas, o caminho poligonal destacado é a possibilidade mais curta de efetuar esse deslocamento. Para descrevê-lo, deve-se especificar qual o sentido a ser tomado em cada cruzamento de ruas, em relação à direção de deslocamento do automóvel, que se movimentará continuamente. Para isso, empregam-se as letras E, F e D para indicar  
“vire à esquerda”, “siga em frente” e “vire à direita”, respectivamente.

A sequência de letras que descreve o caminho poligonal destacado é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2022 · 2º dia · Questão 168 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f7', 'ENEM-2022-169', 3, 449, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria espacial e volumes', 'Uma loja comercializa cinco modelos de caixas-d’água (I, II, III, IV e V), todos em formato de cilindro reto de base circular. Os modelos II, III, IV e V têm as especificações de suas dimensões dadas em relação às dimensões do modelo I, cuja profundidade é P e área da base é Ab, como segue:

• modelo II: o dobro da profundidade e a metade da  
área da base do modelo I;  
• modelo III: o dobro da profundidade e a metade do  
raio da base do modelo I;  
• modelo IV: a metade da profundidade e o dobro da  
área da base do modelo I;  
• modelo V: a metade da profundidade e o dobro do  
raio da base do modelo I.

Uma pessoa pretende comprar nessa loja o modelo  
de caixa-d’água que ofereça a maior capacidade  
volumétrica

O modelo escolhido deve ser o', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 169 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f8', 'ENEM-2022-170', 3, 105, 'enem', 3, 2, 2022, 'multiple_choice', 'Média, moda e mediana', 'No período de 2005 a 2013, o valor de venda dos imóveis em uma cidade apresentou alta, o que resultou no aumento dos aluguéis. Os gráficos apresentam a evolução desses valores, para um mesmo imóvel, no  
mercado imobiliário dessa cidade.

![](conteudo/enem/2022/170-be397d74.webp)

A rentabilidade do aluguel de um imóvel é calculada pela razão entre o valor mensal de aluguel e o valor de mercado desse imóvel.

Com base nos dados fornecidos, em que ano a rentabilidade do aluguel foi maior?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 170 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009f9', 'ENEM-2022-171', 3, 105, 'enem', 3, 2, 2022, 'multiple_choice', 'Média, moda e mediana', 'Nos cinco jogos finais da última temporada, com uma média de 18 pontos por jogo, um jogador foi eleito o melhor do campeonato de basquete. Na atual temporada, cinco jogadores têm a chance de igualar ou melhorar essa média. No quadro estão registradas as pontuações desses cinco jogadores nos quatro primeiros jogos das finais deste ano.

![](conteudo/enem/2022/171-45b098d3.webp)

O quinto e último jogo será realizado para decidir a equipe campeã e qual o melhor jogador da temporada.

O jogador que precisa fazer a menor quantidade de pontos no quinto jogo, para igualar a média de pontos do melhor jogador da temporada passada, é o', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 171 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009fa', 'ENEM-2022-172', 3, 449, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria espacial e volumes', 'Um casal planeja construir em sua chácara uma piscina com o formato de um paralelepípedo reto retângulo com capacidade para 90 000 L de água. O casal contratou uma empresa de construções que apresentou cinco projetos com diferentes combinações nas dimensões internas de profundidade, largura e comprimento. A piscina a ser construída terá revestimento interno em suas paredes e fundo com uma mesma cerâmica, e o casal irá escolher o projeto que exija a menor área de revestimento.

As dimensões internas de profundidade, largura e comprimento, respectivamente, para cada um dos projetos, são:

• projeto I: 1,8 m, 2,0 m e 25,0 m;  
• projeto II: 2,0 m, 5,0 m e 9,0 m;  
• projeto III: 1,0 m, 6,0 m e 15,0 m;  
• projeto IV: 1,5 m, 15,0 m e 4,0 m;  
• projeto V: 2,5 m, 3,0 m e 12,0 m.

O projeto que o casal deverá escolher será o', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 172 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009fb', 'ENEM-2022-173', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Uma instituição de ensino superior ofereceu vagas em um processo seletivo de acesso a seus cursos. Finalizadas as inscrições, foi divulgada a relação do número de candidatos por vaga em cada um dos cursos oferecidos. Esses dados são apresentados no quadro.

![](conteudo/enem/2022/173-0e6a9a19.webp)

Qual foi o número total de candidatos inscritos nesse processo seletivo?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 173 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009fc', 'ENEM-2022-174', 3, 449, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria espacial e volumes', 'Peças metálicas de aeronaves abandonadas em aeroportos serão recicladas. Uma dessas peças é maciça e tem o formato cilíndrico, com a medida do raio da base igual a 4 cm e a da altura igual a 50 cm. Ela será derretida, e o volume de metal resultante será utilizado para a fabricação de esferas maciças com diâmetro de 1 cm, a serem usadas para confeccionar rolamentos. Para estimar a quantidade de esferas que poderão ser produzidas a partir de cada uma das peças cilíndricas, admite-se que não ocorre perda de material durante o processo de derretimento.

Quantas dessas esferas poderão ser obtidas a partir de cada peça cilíndrica?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 174 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009fd', 'ENEM-2022-175', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Ao escutar a notícia de que um filme recém-lançado arrecadou, no primeiro mês de lançamento, R$ 1,35 bilhão em bilheteria, um estudante escreveu corretamente o número que representa essa quantia, com todos os seus  
algarismos.

O número escrito pelo estudante foi', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 175 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009fe', 'ENEM-2022-176', 3, 449, 'enem', 3, 2, 2022, 'multiple_choice', 'Geometria espacial e volumes', '![](conteudo/enem/2022/176-eebeabf5.webp)

Pretende-se que a distância percorrida entre as duas cidades, pelas Rodovias 001 e 002, passando pelo ponto de conexão, seja a menor possível.
Dadas as exigências do projeto, qual das localizações sugeridas deve ser a escolhida para o ponto de conexão?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2022 · 2º dia · Questão 176 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000009ff', 'ENEM-2022-177', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Uma pessoa precisa contratar um operário para fazer um serviço em sua casa. Para isso, ela postou um anúncio em uma rede social.  
Cinco pessoas responderam informando preços por hora trabalhada, gasto diário com transporte e tempo necessário para conclusão do serviço, conforme valores apresentados no quadro.

![](conteudo/enem/2022/177-fb1d11e4.webp)

Se a pessoa pretende gastar o mínimo possível com essa contratação, irá contratar o operário', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2022 · 2º dia · Questão 177 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a00', 'ENEM-2022-178', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Uma cozinheira produz docinhos especiais por encomenda. Usando uma receita-base de massa, ela prepara uma porção, com a qual produz 50 docinhos maciços de formato esférico, com 2 cm de diâmetro. Um cliente encomenda 150 desses docinhos, mas pede que cada um tenha formato esférico com 4 cm de diâmetro.  
A cozinheira pretende preparar o número exato de porções da receita-base de massa necessário para produzir os docinhos dessa encomenda

Quantas porções da receita-base de massa ela deve preparar para atender esse cliente?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 178 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a01', 'ENEM-2022-179', 3, 105, 'enem', 3, 2, 2022, 'multiple_choice', 'Média, moda e mediana', 'A esperança de vida ao nascer é o número médio de anos que um indivíduo tende a viver a partir de seu nascimento, considerando dados da população. No Brasil, esse número vem aumentando consideravelmente, como mostra o gráfico.

![](conteudo/enem/2022/179-08b6ac03.webp)

Disponível em: http://cod.ibge.gov.br. Acesso em: 6 mar. 2014 (adaptado).

Pode-se observar que a esperança de vida ao nascer em 2012 foi exatamente a média das registradas nos anos de 2011 e 2013. Suponha que esse fato também ocorreu com a esperança de vida ao nascer em 2013, em relação às esperanças de vida de 2012 e de 2014.

Caso a suposição feita tenha sido confirmada, a esperança de vida ao nascer no Brasil no ano de 2014 terá sido, em ano, igual a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2022 · 2º dia · Questão 179 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a02', 'ENEM-2022-180', 3, 451, 'enem', 3, 2, 2022, 'multiple_choice', 'Números e operações', 'Na figura estão destacadas duas trajetórias sobre a superfície do globo terrestre, descritas ao se percorrer parte dos meridianos 1, 2 e da Linha do Equador, sendo que os meridianos 1 e 2 estão contidos em planos perpendiculares entre si. O plano α é paralelo ao que contém a Linha do Equador.

![](conteudo/enem/2022/180-f3e0feaa.webp)

A vista superior da projeção ortogonal sobre o plano α dessas duas trajetórias é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2022 · 2º dia · Questão 180 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a03', 'ENEM-2023-001-ING', 2, 467, 'enem', 3, 2, 2023, 'multiple_choice', 'Leitura em língua inglesa', '![](conteudo/enem/2023/1-ingles-59a5b837.webp)

Esse cartaz de campanha sugere que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 1 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a04', 'ENEM-2023-002-ESP', 14, 466, 'enem', 3, 2, 2023, 'multiple_choice', 'Leitura em língua espanhola', 'Me niego rotundamente
A negar mi voz,
Mi sangre y mi piel.
Y me niego rotundamente
A dejar de ser yo,
A dejar de sentirme bien
Cuando miro mi rostro en el es
Con mi boca
Rotundamente grande
Y mi nariz
Rotundamente hermosa,
Y mis dientes
Rotundamente blancos,
Y mi piel valientemente negra.
Y me niego categóricamente
A dejar de hablar
Mi lengua, mi acento y mi historia
Y me niego absolutamente
A ser parte de los que callan,
De los que temen,
De los que lloran
Porque me acepto
Rotundamente libre,
Rotundamente negra,
Rotundamente hermosa.
CAMPELL BARR, S. Disponível em:
https.negracubanateniaqueser.com
Acesso em 25 out. 2021.
Para enfatizar caracteristicas e atitudes que reforçam a identidade da mulher negra, o poema da escritora costarriquenha apresenta:', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 2 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a05', 'ENEM-2023-002-ING', 2, 467, 'enem', 3, 2, 2023, 'multiple_choice', 'Leitura em língua inglesa', 'No man is an island,  
Entire of itself;  
Every man is a piece of the continent,  
A part of the main.  
\[…\]  
Any man’s death diminishes me,  
Because I am involved in mankind.

DONNE, J. **The Works of John Donne**. Londres: John W. Parker, 1839 (fragmento).

Nesse poema, a expressão “No man is an island” ressalta o(a)', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 2 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a06', 'ENEM-2023-003-ESP', 14, 466, 'enem', 3, 2, 2023, 'multiple_choice', 'Leitura em língua espanhola', '**“Caramelos” en sus suelos**

Las tierras de España, tu vista enamoran;

sus gentes; te amistan; ¿“cocinas”?, ¡“te molan”!

¿El plato común?, ¡pues «tortilla/patatas»!;

en bares, figones, o tascas, ¡las «tapas»!;

“sabor nacional”, ¡el «gazpacho», sus «vinos»,

«sangría», y «jamón» de sabrosos cochinos!

(Cual “sellos”, te grabas sus «Típicos Platos»;

¡sabrás por dó pasas, por sólo tu olfato!,

¡si en cada lugar, un sabor peculiar,

“al paso” cautiva tu buen paladar!).

¡Son más que “recetas”!, será “alegoría”!,

¡será “identidad”! (¡hay “reserva” en su «Guía»!);

son platos allende un “timón conductor”,

¡son mar, ríos, sierras!, ¡son valles, son flor!,

¡y aportan “Conventos” a gastronomia,

sus «dulces»! (sabor “celestial”, ¡de ambrosia!).

QUIROZ Y LÓPEZ M. Disponível em: https://pt.calameo.com. Acesso em: 25 out. 2021.

Nesse poema, o eu poético enaltece a', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 3 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a07', 'ENEM-2023-003-ING', 2, 467, 'enem', 3, 2, 2023, 'multiple_choice', 'Leitura em língua inglesa', 'Things We Carry on the Sea

We carry tears in our eyes: good-bye father, good-bye mother  
We carry soi in smal bags: may home never fade in our hearts  
We carry carnage of mining. droughts, floods, genocides  
We carry dust of our families and neighbors incinerated in mushroom clouds  
We carry our islands sinking under the sea  
We carry our hands, feet, bones, hearts and best minds for a new life  
We carry diplomas: medicine, engineer, nurse, education, math, poetry, even if they mean nothing to the other shore  
We carry railroads, plantations, laundromats. bodegas, taco trucks, farms, factories, nursing homes, hospitals, schools, temples… built on our ancestors’ backs  
We carry old homes along the spine, new dreams in our chests  
We carry yesterday, today and tomorrow  
We’re orphans of the wars forced upon us  
We’re refugees of the sea rising from industrial wastes  
And we carry our mother tongues  
\[…\]  
As we drift… in our rubber boats… from shore… to shore…. to shore…

PING. W. Disponivel em: https://poets.org. Acesso en 1 jun. 2023 (fragmento)

Ao retratar a trajetória de refugiados, o poema recorre à imagem de viagem marítima para destacar o(a)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 3 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a08', 'ENEM-2023-004-ESP', 14, 466, 'enem', 3, 2, 2023, 'multiple_choice', 'Leitura em língua espanhola', 'Manipular es sembrar en la conciencia y en la mente de la gente ideas, actitudes, conceptos y aspiraciones -incluso falsas, inmorales y deshonestas- que sirvan a los objetivos -ocultos o abiertos- de sus manipuladores.

Manipular es una de las primeras cosas que aprendemos en la vida. A muy temprana edad, los bebes descubren el poder del llanto, el berrinche, los pataleos, la risa o alguna “gracia” como recursos para demandar atención, exigir comida, pedir ayuda o simplemente mantener ocupada a la gente. Nuestras actitudes de adultos reflejan lo mucho o poco que algunos maduraron, procesaron y rebasaron ese periodo.

Para que exista un manipulador, debe haber una base de ciudadanos indefensos, dóciles, desinformados. El manipulador es celoso, a veces casi paranoico; no admite cuestionamientos ni quiere que nadie ocupe su espacio, sabe que su vigencia depende de presencia controladora. Todos los días, hay que marcar la línea de discurso, incidir en el debate. El ridículo vale la pena si con ello se logra una cortina de humo.

Disponível em: www.forbes.com.mx. Acesso em: 7 out. 2021 (adaptado).

Nesse texto, a expressão “cortina de humo” revela que o manipulador', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 4 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a09', 'ENEM-2023-004-ING', 2, 467, 'enem', 3, 2, 2023, 'multiple_choice', 'Leitura em língua inglesa', '**Spanglish**

pues estoy creando Spanglish  
bi-cultural systems  
scientific lexicographical  
inter-textual integrations  
two expressions  
existentially wired  
two dominant languages  
continentally abrazándose  
in colloquial combate  
imperio spanglish emerges  
sobre territorio bi-lingual  
las novelas mexicanas  
mixing with radiorocknroll  
immigrant/migrant  
nasal mispronouncements  
hip-hop, street salsa, spanish pop  
standard english classroom  
with computer technicalities  
spanglish is literally perfect

LAVIERA T. **Benedición**. The Complete Poetry of Talo Laviera. Houston: Arte Público Press, 2014 (fragmento).

Nesse poema de Tato Laviera, o eu lírico destaca uma', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 4 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a0a', 'ENEM-2023-005-ESP', 14, 466, 'enem', 3, 2, 2023, 'multiple_choice', 'Leitura em língua espanhola', '**Que quede claro**

Cómo es posible que se cierren

tantas bocas, tantos ojos,

tantas puertas, muchas mentes ante un

acto xenofóbico sin precedentes.

Presidentes, ministros, cancilleres,

autoridades, responsables.

¿Quién pagará el daño causado a familiares?

Por un loco del estrada sin modales. \[…\]

Se alejó de aquel lugar donde su color era

mucho más que su color, era su raza.

Persiguiendo un sueño que desapareció,

que se fusionó y terminó en una pesadilla. \[…\]

Déjame que te cuente esta historia

que sucedió en el metro de Barcelona,

cuando aquella mañana la injusticia

y xenofobia se juntaron de la mano,

protagonizando una de las más feas escenas de racismo.

En aquel vagón viajaba un ángel de color diferente,

en su camino se interpuso aquel inconsciente,

que aún sabiendo lo que hacía,

seguía hablando con su gente.

Le dio al ángel dos patadas en su cara,

se rió de ella sin cambiar la mirada.

Y aún anda suelto, aún anda suelto…

ORISHAS. In: **Cosita buena**. Delaware: Suerte Publishing LCC, 2008 (fragmento).

A letra da canção Que quede claro, da banda cubana Orishas, revela o(a)', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 5 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a0b', 'ENEM-2023-006', 16, 444, 'enem', 3, 2, 2023, 'multiple_choice', 'Corpo, esporte e saúde', 'A sessão do Comitê Olímpico Internacional (COI) aprovou uma mudança histórica e inédita no lema olímpico, criado em 1894 pelo Barão Pierre de Coubertin para expressar os valores e a excelência do esporte. Mais de 120 anos depois, o lema tem sua primeira alteração para ressaltar a solidariedade e incluir a palavra “juntos” mais rápido, mais alto, mais forte – juntos. A mudança foi aprovada por unanimidade pelos membros do COI e celebrada pelo presidente da entidade.
Disponível em: https://ge.globo.com Acesso em: 10 nov. 2021 (adaptado)
De acordo com o texto, a alteração do lema olímpico teve como objetivo a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 6 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a0c', 'ENEM-2023-007', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', '**Mais iluminada que outras**

Tenho dois seios, estas duas coxas, duas mãos que me são muito úteis, olhos escuros, estas duas sobrancelhas que preencho com maquiagem comprada por dezenove e noventa e orelhas que não aceitam bijuterias. Este corpo é um corpo faminto, dentado, cruel, capaz e violento. Movo os braços e multidões correm desesperadas. Caminho no escuro com o rosto para baixo, pois cada parte isolada de mim tem sua própria vida e não quero domá-las. Animal da caatinga. Forte demais. Engolidora de espadas e espinhos. Dizem e eu ouvi, mas depois também li, que o estado do Ceará aboliu a escravidão quatro anos antes do restante do país. Todos aqueles corpos que eram trazidos com  
seus dedos contados, seus calcanhares prontos e seus umbigos em fogo, todos eles foram interrompidos no porto. Um homem – dizem e eu ouvi e depois também li — liderou o levante. E todos esses corpos foram buscar outros incômodos. Foram ser incomodados.

ARRAES. J. Redemoinho em dia quente. São Paulo: Alfaguara, 2019.

Nesse texto, os recursos expressivos usados pela narradora', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 7 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a0d', 'ENEM-2023-008', 1, 439, 'enem', 3, 2, 2023, 'multiple_choice', 'Compreensão e interpretação', '**De quem é esta língua?**

Uma pequena editora brasileira, a Urutau, acaba de lançar em Lisboa uma “antologia antirracista de poetas estrangeiros em Portugal”, com o título Volta para a tua terra.

O livro denuncia as diversas formas de racismo a que os imigrantes estão sujeitos. Alguns dos poetas brasileiros antologiados queixam-se do desdém com que um grande número de portugueses acolhe o português brasileiro. É uma queixa frequente.

“Aqui em Portugal eles dizem / — eles dizem – / que nosso português é errado, que nós não falamos português”, escreve a poetisa paulista Maria Giulia Pinheiro, para concluir: “Se a sua linguagem, a lusitana, / ainda conserva a palavra da opressão / ela não é a mais bonita do mundo./ Ela é uma das mais violentas”.

AGUALUSA, J. E. Disponível em: https.iloglobo.globo.com Acesso em: 22 nov. 2021 (adaptado).

O texto de Agualusa tematiza o preconceito em relação ao português brasileiro. Com base no trecho citado pelo autor, infere-se que esse preconceito se deve', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 8 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a0e', 'ENEM-2023-009', 1, 224, 'enem', 3, 2, 2023, 'multiple_choice', 'Gêneros textuais', 'Na Idade Média, as notícias se propagavam com surpreendente eficácia. Segundo uma emérita professora de Sorbonne, um cavalo era capaz de percorrer 30 quilômetros por dia, mas o tempo podia se acelerar dependendo do interesse da notícia. As ordens mendicantes tinham um papel importante na disseminação de informações, assim como os jograis, os peregrinos e os vagabundos, porque todos eles percorriam grandes distâncias. As cidades também tinham correios organizados e selos para lacrar mensagens e tentar certificar a veracidade das correspondências. Graças a tudo isso, a circulação de boatos era intensa e politicamente relevante. Um exemplo clássico de _fake news_ da era medieval é a história do rei que desaparece na batalha e reaparece muito depois, idoso e transformado.

Disponível em: www.elpais.com.br. Acesso em: 18 jun. 2018 (adaptado)

A propagação sistemática de informações é um fenômeno recorrente na história e no desenvolvimento das sociedades. No texto, a eficácia dessa propagação está diretamente relacionada ao (à)', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 9 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a0f', 'ENEM-2023-010', 1, 441, 'enem', 3, 2, 2023, 'multiple_choice', 'Tecnologias da comunicação', 'Se a interferência de contas falsas em discussões políticas nas redes sociais já representava um perigo para os sistemas democráticos, sua sofisticação e maior semelhança com pessoas reais têm agravado o problema pelo mundo.

O perigo cresceu porque a tecnologia e os métodos evoluíram dos robôs, os “bots” — softwares com tarefas on-line automatizadas —, para os “ciborgues” ou “trolls”, contas controladas diretamente por humanos com ajuda de um pouco de automação.

Mas pesquisadores começam agora a observar outros padrões de comportamento: quando mensagens não são programadas, sua publicação se concentra só em horários de trabalho, já que é controlada por pessoas cuja profissão é exatamente essa, administrar um perfil falso durante o dia.

Outra pista: a pobreza vocabular das mensagens publicadas por esses perfis. Um funcionário de uma empresa que supostamente produzia e vendia perfis falsos explica que às vezes “faltava criatividade” para criar mensagens distintas controlando tantos perfis falsos ao mesmo tempo.

GRAGNANI, J. Disponível em: www.bbc.com. Acesso em: 16 dez. 2017.

De acordo com o texto, a análise de características da linguagem empregada por perfis automatizados contribui para o(a)', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 10 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a10', 'ENEM-2023-011', 1, 439, 'enem', 3, 2, 2023, 'multiple_choice', 'Compreensão e interpretação', 'Maio foi colorido de amarelo, e o foi porque mundialmente amarelo é a cor convencionada para as advertências. No trânsito, essas advertências têm sido fatais. A estimativa, caso nada seja feito, é a de que se atinjam assustadoras 2,4 milhões de mortes no trânsito em 2030 em todo o mundo.  
A pressa constante, o sentimento de invencibilidade, a certeza de invulnerabilidade, a necessidade de poder, a falta de civilidade, a certeza de impunidade, a ausência de solidariedade, a inexistência de compaixão e o desrespeito por si próprio são circunstâncias reais que, não raro, concorrem para o comportamento violento no trânsito.  
O Maio Amarelo, que preconiza a atenção pela vida, é uma das iniciativas nesse sentido. E é precisamente a atenção pela vida que está esquecida. Essa atenção, por certo, requer menos pressa, mais civilidade, limites assegurados, consciência de vulnerabilidade, solidariedade, compaixão e respeito por si e pelo outro. Reafirmar e praticar esses princípios e valores talvez seja um caminho mais seguro e menos violento, que garanta a vida e não celebre a morte.

Disponível em: http://portaldotransito.com.br. Acesso em: 11 dez. 2018 (adaptado).

Considerando os procedimentos argumentativos utilizados, infere-se que o objetivo desse texto é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 11 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a11', 'ENEM-2023-012', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', 'Ainda daquela vez pude constatar a bizarrice dos costumes que constituíam as leis mais ou menos constantes do seu mundo: ao me aproximar, verifiquei que o Sr. Timóteo, gordo e suado, trajava um vestido de franjas e lantejoulas que pertencera a sua mãe. O corpete descia-lhe excessivamente justo na cintura, e aqui e ali rebentava através da costura um pouco da carne aprisionada, esgarçando a fazenda e tornando o prazer de vestir-se daquele modo uma autêntica espécie de suplício. Movia-se ele com lentidão, meneando todas as suas franjas e abanando-se vigorosamente com um desses leques de madeira de sândalo, o que o envolvia numa enjoativa onda de perfume. Não sei direito o que colocara sobre a cabeça, assemelhava-se mais a um turbante ou a um chapéu sem abas de onde saiam vigorosas mechas de cabelos alourados. Como era costume seu também, trazia o rosto pintado — e para isto, bem como para suas vestimentas, apoderara-se de todo o guarda-roupa deixado por sua mãe, também em sua época famosa pela extravagância com que se vestia — o que sem dúvida fazia sobressair-lhe o nariz enorme, tão característico da família Meneses.

CARDOSO, L. Crónica da casa assassinada. São Paulo: Circulo do Livro, s.d.

Pela voz de uma empregada da casa, a descrição de um dos membros da família exemplifica a renovação da ficção urbana nos anos 1950, aqui observada na', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 12 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a12', 'ENEM-2023-013', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', 'Girassol da madrugada  
Teu dedo curioso me segue lento no rosto  
Os sulcos, as sombras machucadas por onde a  
\[vida passou.  
Que silêncio, prenda minha… Que desvio triunfal  
\[da verdade,  
Que círculos vagarosos na lagoa em que uma asa  
\[gratuita roçou..

Tive quatro amores eternos…  
O primeiro era moça donzela,  
O segundo… eclipse, boi que fala, cataclisma,  
O terceiro era a rica senhora,  
O quarto és tu… E eu afinal me repousei dos  
\[meus cuidados

ANDRADE, M. Poesias completas. Rio de Janeiro: Nova Fronteira, 2013 (fragmento).

Perante o outro, o eu lírico revela, na força das memórias evocadas, a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 13 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a13', 'ENEM-2023-014', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', '**Dão Lalalão**  
Do povoado do Ão, ou dos sítios perto, alguém precisava urgente de querer vir por escutar a novela do rádio. Ouvia-a, aprendia-a, guardava na ideia, e, retornado ao Ão, no dia seguinte, a repetia a outros.

Assim estavam jantando, vinham os do povoado receber a nova parte da novela do rádio. Ouvir já tinham ouvido tudo, de uma vez, fugia da regra: falhara ali no Ão, na véspera, o caminhão de um comprador de galinhas e ovos, seo Abrãozinho Buristém, que carregava um rádio pequeno, de pilhas, armara um fio no arame da cerca… Mas queriam escutar outra vez, por confirmação. — “A estória é estável de boa, mal que acompridada: taca e não rende…” — explicava o Zuz ao Dalberto.

Soropita começou a recontar o capitulo da novela. Sem trabalho, se recordava das palavras, até com clareza — disso se admirava. Contava com prazer de demorar, encher a sala com o poder de outros altos personagens. Tomar a atenção de todos, pudesse contar aquilo noite adiante. Era preciso trazer luz, nem uns enxergavam mais os outros; quando alguém ria, ria de muito longe. O capitulo da novela estava terminando.

ROSA, J. G. **Noites do sertão (Corpo de baile)**. São Paulo: Global, 2021.

Nesse trecho do conto, o gosto dos moradores do povoado por ouvir a novela de rádio recontada por Soropita deve-se ao(à)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 14 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a14', 'ENEM-2023-015', 15, 438, 'enem', 3, 2, 2023, 'multiple_choice', 'Arte e cultura', 'As cinzas do Museu Nacional, no Rio de Janeiro, consumido pelas chamas no mês de setembro de 2018, são mais do que restos de fósseis, cerâmicas e espécimes raros. O museu abrigava, entre mais de 20 milhões de peças, os esqueletos com as respostas para perguntas que ainda não haviam sido respondidas — ou sequer feitas — por pesquisadores brasileiros. E o incêndio pode ter calado para sempre palavras e cantos indígenas ancestrais, de línguas que não existem mais no mundo.

O acervo do local continha gravações de conversas, cantos e rituais de dezenas de sociedades indígenas, muitas feitas durante a década de 1960 com antigos gravadores de rolo e que ainda não haviam sido digitalizadas. Alguns dos registros abordavam línguas já extintas, sem falantes originais ainda vivos. “A esperança é que outras instituições tenham registros dessas línguas”, diz a linguista Marilia Facó Soares. A pesquisadora, que trabalha com os índios Tikuna, o maior grupo da Amazônia brasileira, crê ter perdido parte de seu material. “Terei que fazer novas viagens de campo para recompor meus arquivos. Mas obviamente não dá para recuperar a fala de nativos já falecidos, geralmente os mais idosos”, lamenta.

Disponível em: https://brasil.elpais.com. Acesso em: 10 dez. 2018 (adaptado).

A perda dos registros linguísticos no incêndio do Museu Nacional tem impacto potencializado, uma vez que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 15 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a15', 'ENEM-2023-016', 1, 215, 'enem', 3, 2, 2023, 'multiple_choice', 'Variação linguística', 'Mandioca, macaxeira, aipim e castelinha são nomes diferentes da mesma planta. Semáforo, sinaleiro e farol também significam a mesma coisa. O que muda é só o hábito cultural de cada região. A mesma coisa acontece com a Língua Brasileira de Sinais (Libras). Embora ela seja a comunicação oficial da comunidade surda no Brasil, existem sinais que variam em relação à região, à idade e até ao gênero de quem se comunica. A cor verde, por exemplo, possui sinais diferentes no Rio de Janeiro, Paraná e São Paulo. São os regionalismos na língua de sinais.
Essas variações são um dos temas da disciplina Linguística na língua de sinais, oferecida pela Universidade Estadual Paulista (Unesp) ao longo do segundo semestre. “Muitas pessoas pensam que a língua de sinais é universal, o que não é verdade”, explica a professora e chefe do Departamento de Linguística, Literatura e Letras Clássicas da Unesp. “Mesmo dentro de um mesmo país, ela sofre variação em relação à localização geográfica, à faixa etária e até ao gênero dos usuários” completa a especialista.
Os surdos podem criar sinais diferentes para identificar lugares, objetos e conceitos. Em São Paulo, o sinal de “cerveja” é feito com um giro do punho como uma meia- volta. Em Minas, a bebida é citada quando os dedos in- dicador e médio batem no lado do rosto. Também ocorrem mudanças históricas. Um sinal pode sofrer alterações decorrentes dos costumes da geração que o utiliza.
Disponível em: www.educacao.sp.gov.br. Acesso em 1 nov. 2021 (adaptado)
Nesse texto, a Língua Brasileira de Sinais (Libras)', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 16 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a16', 'ENEM-2023-017', 1, 439, 'enem', 3, 2, 2023, 'multiple_choice', 'Compreensão e interpretação', 'Como é bom reencontrar os leitores da _Revista da Cultura_ por meio de uma publicação com outro visual, conteúdo de qualidade e interesses ampliados! _\]cultura\[_, este nome simples, e eu diria mesmo familiar, nasce entre dois colchetes voltados para fora. E não é por acaso: são sinais abertos, receptivos, propícios à circulação de ideias. O DNA da publicação se mantém o mesmo, afinal, por longos anos montamos nossas edições com assuntos saídos das estantes de uma grande livraria — e assim continuará sendo. Literatura, sociologia, filosofia, artes… nunca será difícil montar a pauta da revista porque os livros nos ensinam que monotonia é só para quem não lê.

HERZ, P. J _**\]cultura\[**_, n. 1, jun. 2018 (adaptado).

O uso não padrão dos colchetes para nomear a revista atribui-lhes uma nova função e está correlacionado ao(à)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 17 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a17', 'ENEM-2023-018', 1, 224, 'enem', 3, 2, 2023, 'multiple_choice', 'Gêneros textuais', '**TEXTO I**

**Alegria, alegria**  
O sol nas bancas de revista  
Me enche de alegria e preguiça  
Quem lê tanta noticia  
Eu vou  
Por entre fotos e nomes  
Os olhos cheios de cores  
O peito cheio de amores vãos  
Eu vou  
Por que não, por que não?

VELOSO, C. **Alegria, alegria**. Rio de Janeiro: Polygram, 1990 (fragmento)

**ТЕХТО II**

**Anjos tronchos**  
Uns anjos tronchos do Vale do Silício  
Desses que vivem no escuro em plena luz  
Disseram vai ser virtuoso no vício  
Das telas dos azuis mais do que azuis

Agora a minha história é um denso algoritmo  
Que vende venda a vendedores reais  
Neurônios meus ganharam novo outro ritmo  
E mais, e mais, e mais, e mais, e mais

VELOSO, C. **Meu coco**. Rio de Janeiro: Sony, 2021 (fragmento)

Embora oriundas de momentos históricos diferentes essas letras de canção têm em comum a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 18 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a18', 'ENEM-2023-019', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', '“São tantas formas de matar um preto
Que para alguns sua morte é justificada
Devia tá fazendo coisa errada
Se não era bandido, um dia ia ser
Por ser PRETO sua morte é defendida
O PRETO sempre merece morrer”.
A estrofe acima é do poeta e educador social Baticum Proletário, que atua na periferia de Fortaleza, no Ceará, preparando jovens — em quase sua totalidade negros – para enfrentar as dificuldades impostas pelo racismo estrutural no país.
É a partir da arte que Baticum consegue envolver a juventude em um projeto de fortalecimento dessa população ao promover batalhas de rimas, slams e saraus com temáticas que discutem os problemas sociais. Não por acaso, o tema mais explorado nas rimas, versos e prosas é a violência. De acordo com o mais recente Atlas da violência, em 2019, os negros representaram 77% das vítimas de homicídios, quase 30 assassinatos por 100 mil habitantes, a maioria deles jovens.
O Atlas revela ainda que um negro tem quase 2,7 vezes mais chance de ser morto do que um branco, o que justifica o movimento de resistência crescente no Brasil.
MENDONÇA. F. Disponível em: www.cartacapital.com.br. Acesso em: 22 nov. 2021 (adaptado).
O uso de citação e de dados estatísticos nesse texto tem o objetivo de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 19 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a19', 'ENEM-2023-020', 1, 439, 'enem', 3, 2, 2023, 'multiple_choice', 'Compreensão e interpretação', 'No princípio era o verbo. A frase que abre o primeiro capítulo do Evangelho de João e remete à criação do mundo, assim como também faz o Gênesis, é a mais famosa da Bíblia. A ideia de que o mundo é criado pela palavra, porém, é tão estruturante que está presente em outras religiões, para muito além das fundadas no cristianismo. Como humanos, a linguagem é o mundo que habitamos. Basta tentar imaginar um mundo em que não podemos usar palavras para dizer de nós e dos outros para compreender o que isso significa. Ou um mundo em que aquilo que você diz não é entendido pelo outro, e o que o outro diz não é entendido por você.
O que acontece então quando a palavra é destruída e, com ela, a linguagem?
Durante séculos, em diferentes sociedades e línguas, é importante lembrar, a linguagem serviu — e ainda serve — para manter privilégios de grupos de poder e deixar todos os outros de fora. Quem entende linguagem de advogados, juízes e promotores, linguagem de médicos, linguagem de burocratas, linguagem de cientistas? A maior parte da população foi submetida à violência de proposital mente ser impedida de compreender a linguagem daqueles que determinam seus destinos.
Se o princípio é o verbo, o fim pode ser o silenciamento. Mesmo que ele seja cheio de gritos entre aqueles que já não têm linguagem comum para compreender uns aos outros.
BRUM, E. Disponível em: https://brasil.elpais.com. Acesso em: 5 nov. 2021.
Nesse texto, a estratégia usada para convencer o leitor de que uma grande parcela da população não compreende a linguagem daqueles que detêm o poder foi', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 20 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a1a', 'ENEM-2023-021', 1, 439, 'enem', 3, 2, 2023, 'multiple_choice', 'Compreensão e interpretação', 'Um grupo de pesquisadores da Universidade Federal do Ceará desenvolveu um dicionário para traduzir sintomas de doenças da linguagem popular para os termos médicos. Defruço, chanha e piloura, por exemplo, podem ser termos conhecidos para muitos, mas, durante uma consulta médica, o desconhecimento pode significar um diagnóstico errado.
“Isso é um registro histórico e pode ser muito útil para estudos dessas comunidades, na abordagem médica delas. É de certa forma pioneiro no Brasil e, sem dúvida, um instrumento de trabalho importante, porque a comunicação é fundamental na relação médico-paciente”, avalia o reitor da instituição.
Disponível em: https://gl.globo.com. Acesso em: 1 nov. 2021 (adaptado).
Ao registrarem usos regionais de termos da área médica, Pesquisadores', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 21 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a1b', 'ENEM-2023-022', 15, 438, 'enem', 3, 2, 2023, 'multiple_choice', 'Arte e cultura', 'Alguém muito recentemente cortara o mato, que na época das chuvas crescia e rodeava a casa da mãe de Ponciá Vicêncio e de Luandi. Havia também vestígios de que a terra fora revolvida, como se ali fosse plantar uma pequena roça. Luandi sorriu. A mãe devia estar bastante forte, pois ainda labutava a terra. Cantou alto uma cantiga que aprendera com o pai, quando eles trabalhavam na terra dos brancos. Era uma canção que os negros mais velhos ensinavam aos mais novos. Eles diziam ser uma cantiga de voltar, que os homens, lá na África, entoavam sempre, quando estavam regressando da pesca, da caça ou de algum lugar. O pai de Luandi, no dia em que queria agradar à mulher, costumava entoar aquela cantiga ao se aproximar de casa. Luandi não entendia as palavras do canto; sabia, porém, que era uma língua que alguns negros falavam ainda, principalmente os velhos. Era uma cantiga alegre. Luandi, além de cantar, acompanhava o ritmo batendo com as palmas das mãos em um atabaque imaginário. Estava de regresso à terra. Voltava em casa. Chegava cantando, dançando a doce e vitoriosa cantiga de regressar.

EVARISTO, C. **Ponciá Vicêncio**. Rio de Janeiro: Pallas, 2018.

A leitura do texto permite reconhecer a “cantiga de voltar” como patrimônio linguístico que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 22 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a1c', 'ENEM-2023-023', 1, 439, 'enem', 3, 2, 2023, 'multiple_choice', 'Compreensão e interpretação', 'TEXTO I  
Zapeei os canais, como há dezenas de anos faço, e pá: parei num que exibia um episódio daquela velha família do futuro, Os Jetsons.  
Nesse episódio em particular, a Jane Jetson, esposa do George, tratava de dirigir aquele veículo voador deles. Meu queixo foi caindo à medida que as piadinhas machistas sobre mulheres dirigirem foram se acumulando.  
Impressionante! Que futuro careta aqueles roteiristas imaginavam! Seriam incapazes de projetar algo melhor, e não apenas em termos de tecnologias, robôs e carros voadores? Será que nossa máxima visão de futuro só atinge as coisas, e jamais as pessoas? Como a Jane, uma mulher de 33 anos no desenho, poderia ser o que foram as minhas bisavós?  
O futuro, naquele desenho, se esqueceu de ser melhor nas relações entre as pessoas. Aliás… tão parecido com a vida.  
Fiquei de cara, como dizemos aqui, ou como dizíamos na minha adolescência, pobre adolescência, aprendendo, sem querer e sem muita defesa, um futuro tão besta quanto o passado.

RIBEIRO, A. E. Disponível em: www.rascunho.com.br. Acesso em: 21 out. 2021 (adaptado).

TEXTO II  
Masculino e feminino são campos escorregadios que só se definem por oposição, sempre incompleta, um do outro. São formações imaginárias que buscam produzir uma diferença radical e complementar onde só existem, de fato, mínimas diferenças. O resto é questão de estilo. Até pelo menos a segunda metade do século 19, o divisor de águas era claro: os homens ocupavam o espaço público. As mulheres tratavam da vida privada. Privada de quê? De visibilidade, diria Hannah Arendt. De visibilidade pública. Do que as mulheres estiveram privadas até o século 20 foi de presença pública manifesta não em imagem, mas em palavra. A palavra feminina, reservada ao espaço doméstico, não produzia diferença na vida social.

KHEL, M. R. Disponível em: https://alias.estadao.com.br. Acesso em: 19 out. 2021 (adaptado).

A representação da mulher apresentada no Texto I pode ser explicada pelo Texto II no que diz respeito à(às)', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 23 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a1d', 'ENEM-2023-024', 1, 224, 'enem', 3, 2, 2023, 'multiple_choice', 'Gêneros textuais', '![](conteudo/enem/2023/24-78918e1a.webp)

Esse anúncio publicitário, veiculado durante o contexto da pandemia de covid-19, tem por finalidade', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 24 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a1e', 'ENEM-2023-025', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', 'Passado muito tempo, resolvi tentar falar, porque estava sozinha me embrenhando na mesma vereda que Donana costumava entrar. Ainda recordo da palavra que escolhi: arado. Me deleitava vendo meu pai conduzindo o arado velho da fazenda carregado pelo boi, rasgando a terra para depois lançar grãos de arroz em torrões marrons e vermelhos revolvidos. Gostava do som redondo fácil e ruidoso que tinha ao ser enunciado. “Vou trabalhar no arado.” “Vou arar a terra.” “Seria bom ter um arado novo, esse arado tá troncho e velho.” O som que deixou minha boca era uma aberração, uma desordem, como se no lugar do pedaço perdido da língua tivesse um ovo quente. Era um arado torto, deformado, que penetrava a terra de tal forma a deixá-la infértil, destruída, dilacerada.

VIEIRA JR.. I. **Torto arado**. São Paulo: Todavia, 2019.

Com a perda de parte da língua na infância, a narradora tenta voltar a falar. Essa tentativa revela uma experiência que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 25 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a1f', 'ENEM-2023-026', 15, 438, 'enem', 3, 2, 2023, 'multiple_choice', 'Arte e cultura', '**A escravidão**

Esses meninos que aí andam jogando peteca não viram nunca um escravo… Quando crescerem, saberão que já houve no Brasil uma raça triste, votada à escravidão e ao desespero; e verão nos museus a coleção hedionda dos troncos, dos vira-mundos e dos bacalhaus; e terão notícias dos trágicos horrores de uma época maldita: filhos arrancados ao seio das mães, virgens violadas em pranto, homens assados lentamente em fornos de cal, mulheres nuas recebendo na sua mísera nudez desvalida o duplo ultraje das chicotadas e dos olhares do feitor bestial. \[…\] Mas a sua indignação nunca poderá ser tão grande como a daqueles que nasceram e cresceram em pleno horror, no meio desse horrível drama de sangue e lodo, sentindo dentro do ouvido e da alma, numa arrastada e contínua melopeia, o longo gemer da raça mártir — orquestração satânica de todos os soluços, de todas as impressões, de todos os lamentos que a tortura e a injustiça podem arrancar a gargantas humanas.

BILAC, O. Disponível em: www.escritas.org. Acesso em: 29 out. 2021

Publicado em 1902, o texto de Olavo Bilac enfatiza as mazelas da escravidão no Brasil ao', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 26 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a20', 'ENEM-2023-027', 1, 445, 'enem', 3, 2, 2023, 'multiple_choice', 'Gramática e sentido', 'E assim as coisas continuaram acontecendo entre os dois, em quase sustos, um grande por acaso com cacoetes de gestos definitivos. Com o Nunca Mais se oferecendo o tempo todo, bastaria dizer foi um prazer ter te conhecido, bastaria não trocar telefones nem e-mails e enterrar a casualidade com a cal da sabedoria – nada poderia ser definitivo, os encontros duravam duas horas ou duas décadas ou duas vezes isso, mas em algum momento necessariamente seria o fim. De todos os grandes amores, De todos os pequenos. De todas as juras, das promessas, de todos os na-alegria-e-na-tristeza. De todos os não amores, os desamores, os casamentos para sempre, os rancores para sempre, de todas as paralelas que só se viabilizam na abstração da geometria, de todas as pequenas paixões e de todas as grandes paixões, de tudo que para na antessala da paixão, de todos os vínculos não experimentados, de todos.
LISBOA, A. Rahushisha. Rio de Janeiro Objetiva 2014.
O recurso que promove a progressão textual, contribuindo para a construção da ideia de que as relações amorosas têm um enredo comum, é a', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 27 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a21', 'ENEM-2023-028', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', 'A garganta é a gruta que guarda o som
A garganta está entre a mente e o coração
Vem coisa de cima, vem coisa de baixo e de 
[repente um nó (e o que eu quero dizer?)
Às vezes, acontece um negócio esquisito
Quando eu quero falar eu grito, quando eu quero
[gritar eu falo, o resultado
Calo.
ESTRELA D’ALVA, R. Disponível em: https://claudia.abril.com.br. Acesso em: 23 nov. 2021 (fragmento).
A função emotiva presente no poema cumpre o propósito do eu lírico de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 28 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a22', 'ENEM-2023-029', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', 'Era um gato preto, como convinha a um cultor das boas letras, que já lera Poe traduzido por Baudelaire. Preto e gordo. E lerdo. Tão gordo e lerdo que a certa altura observei que ia perdendo inteiramente as qualidades características da raça, que são em suma o ódio de morte aos ratos. Já nem os afugentava! Os ratos de Ouro Preto são também dignos e solenes — não ria — tradicionalistas… descendentes de outros ratos que naqueles mesmos casarões presenciaram acontecimentos importantes da nossa história… No sobrado do desembargador Tomás Antônio Gonzaga, imagine o senhor uma reunião dos sonhadores inconfidentes, com os antepassados daqueles ratos a passearem pelo sótão ou mesmo pelo assoalho por entre as pernas dos homens absortos na esperança da independência nacional! E depois, os ancestres daqueles roedores que eu via agora deslizar sutilmente no meu quarto podiam ter subido pelo poste da ignomínia colonial, onde estava exposta a cabeça do Tiradentes! E quando as órbitas se descarnaram ignominiosamente, podiam até ter penetrado no recesso daquele crânio onde verdadeiramente ardera a literatura, com a simplicidade do heroísmo, a febre nacionalista…

ALPHONSUS, J. **Contos e novelas**. Rio de Janeiro: Imago; Brasília: INL, 1976.

Descrevendo seu gato, o narrador remete ao contexto e a protagonistas da Inconfidência para criar um efeito desconcertante centrado no', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 29 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a23', 'ENEM-2023-030', 1, 439, 'enem', 3, 2, 2023, 'multiple_choice', 'Compreensão e interpretação', 'Enquanto estivemos entretidos com os urubus outras coisas andaram acontecendo na cidade. A Companhia baixou novas proibições, umas inteiramente bobocas, só pelo prazer de proibir (ninguém podia cuspir pra cima, nem carregar água em jacá, nem tapar o sol com peneira, como se todo mundo estivesse abusando dessas esquisitices); mas outras bem irritantes, como a de pular muro pra cortar caminho, tática que quase todo mundo que não sofria de reumatismo vinha adotando ultimamente, principalmente os meninos. E não confiando na proibição só, nem na força dos castigos, que eram rigorosos, a Companhia ainda mandou fincar cacos de garrafa nos muros. Achei isso um exagero, e comentei o assunto com mamãe. Meu pai ouviu lá do quarto e veio explicar. Disse que em épocas normais bastava uma coisa ou outra; mas agora a Companhia não podia admitir nenhuma brecha em suas ordens; se alguém desobedecesse à proibição podia se cortar nos cacos; se alguém conseguisse pular um muro quebrando era apanhado pela proibição, nhoc – e fez o gesto de quem torce o pescoço de um frango.
VEIGA, J. J. Sombras de reis barbudos. Rio de Janeiro: Civilização Brasileira, 1978.
Sob a perspectiva do menino que narra, os fatos ficcionais oferecem um esboço do momento político vigente na década de 1970, aqui representado pelo', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 30 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a24', 'ENEM-2023-031', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', '**Migalhas**

Entre a toalha branca e um bule de café

seria inapropriado dizer

eu não te amo mais.

Era necessário algo mais solene,

um jardim japonês para as perdas pensadas,

um noturno de tempestade para arrebentar de dor,

uma praia de pedras para chorar em silêncio,

uma cama alta para o incenso da despedida,

uma janela dando para o abismo.

No entanto você abaixa os olhos

e recolhe lentamente as migalhas de pão

sobre a mesa posta para dois.

MARQUES, A. M. **A vida submarina**. São Paulo: Cia. das Letras, 2021.

Nesse poema, a representação do sentimento amoroso recupera a tradição lírica, mas se ajusta à visão contemporânea ao', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 31 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a25', 'ENEM-2023-032', 15, 438, 'enem', 3, 2, 2023, 'multiple_choice', 'Arte e cultura', 'O sol começa a descer por trás da vegetação da Ilha da Restinga, na outra margem do rio Paraíba, colorindo o céu de amarelo, laranja e lilás. Então se ouvem as primeiras notas do Bolero, do compositor francês Maurice Ravel, executadas pelo saxofonista Jurandy. É assim o pôr do sol da praia do Jacaré, em Cabedelo (Grande João Pessoa). Depois do Bolero, Jurandy toca Asa branca, de Luiz Gonzaga, e Meu sublime torrão, de Genival Macedo, espécie de hino não oficial da Paraíba.
PINHEIRO, A. Sol se põe embaiado pelo Bolero de Ravel. Disponível em: http://tools.folha.com.br. Acesso em: 16 set. 20212 (adaptado).
A interpretação musical de Jurandy do Sax, codinome de José Jurandy Félix, apresenta caracterizado pela', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 32 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a26', 'ENEM-2023-033', 15, 438, 'enem', 3, 2, 2023, 'multiple_choice', 'Arte e cultura', '**Texto I**

![](conteudo/enem/2023/33-d3f9dfc2.webp)

SEGALL, L. Eternos caminhantes. Óleo sobre tela, 138 x 184 cm. Museu Lasar Segall. IbramMinc. São Paulo, 1919.

**Texto II**

Em 1933, a obra Eternos caminhantes ingressou em uma das primeiras edições das exposições de Arte Degenerada, promovida por membros do partido nazista alemão. Nos anos seguintes, ela voltaria a ser exibida na mostra denominada Exposição da Vergonha, promovida por pequenos grupos abastados. Em 1937, essa obra foi confiscada pelo Ministério da Propaganda daquele país, na grande ação nacional-socialista contra a “Arte Degenerada”.

SCHWARTZ, J. Perseguição à Arte Moderna em tempos de amarra São Paulo: Museu Lasar Segall, 2018 (adaptado)

Quase cinquenta obras de Lasar Segall foram confiscadas pelo regime totalitário alemão na primeira metade do século XX, entre elas a obra Eternos caminhantes, considerada degenerada por', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 33 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a27', 'ENEM-2023-035', 16, 444, 'enem', 3, 2, 2023, 'multiple_choice', 'Corpo, esporte e saúde', 'A indústria do esporte eletrônico é um mercado que está crescendo em um ritmo mais rápido do que a economia mundial. Sua popularidade cresceu muito e no Brasil não é diferente. De acordo com os dados de uma pesquisa, mais de 64% dos brasileiros que jogam videogame já ouviram falar de esporte eletrônico. No entanto, o que chama a atenção é o crescimento superior a 10% do público praticante comparado ao ano anterior, que subiu de 44,7% para 55,4%. Trata-se de um percentual expressivo, já que o Brasil está no top 3 dentre os países que têm maior número de espectadores de esporte eletrônico do mundo. Comparado ao ano anterior, em 2020, o Brasil teve um marco de crescimento de 20% na audiência. Mundo afora, a árdua dedicação de grandes gamers contribuiu para o reconhecimento do Comitê Olímpico Internacional, aliado a outras cinco federações esportivas e suas desenvolvedoras de jogos, que direcionaram um olhar mais atento ao assunto, permitindo dar o primeiro passo para concretizar, pela primeira vez na história dos jogos eletrônicos, um evento olímpico oficial.

Disponível em: https://chicoterra.com. Acesso em: 15 nov. 2021 (adaptado).

O contexto em que o esporte eletrônico é apresentado no texto demonstra o(a)', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 35 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a28', 'ENEM-2023-036', 15, 438, 'enem', 3, 2, 2023, 'multiple_choice', 'Arte e cultura', 'Marabaixo é uma expressão artistico-cultural formada nas tradições e na identificação cultural entre as comunidades negras do Amapá. O nome remonta às mortes de escravizados em navios negreiros que eram jogados na água. Em sua homenagem, hinos de lamento eram cantados mar abaixo, mar acima. Posteriormente, o Marabaixo se integrou à vivência das comunidades negras em um ciclo de danças, cantorias com tambores e festas religiosas, recebendo, em 2018, o título de Patrimônio Cultural do Brasil.

Disponível em: http://portal.iphan.gov.br. Acesso em: 15 nov. 2021 (adaptado).

A manifestação do Marabaixo se constituiu em expressão de arte e cultura, exercendo função de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 36 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a29', 'ENEM-2023-037', 15, 438, 'enem', 3, 2, 2023, 'multiple_choice', 'Arte e cultura', 'O uso das redes sociais como forma de ampliar universos foi uma descoberta recente para o artista Wolney Fernandes, que começou a criar quando o ambiente em Goiás era mais árido em relação às artes visuais. “Hoje, ser diferente é uma potência e quem sabe o que quer com a própria arte encontra espaço”, diz. As colagens artísticas do goiano aparecem em capas de obras literárias pelo Brasil e exterior.

Disponível em: https://opopular.com.br. Acesso em: 15 nov. 2021 (adaptado).

O artista goiano Wolney Fernandes busca expor seu trabalho por meio de plataformas virtuais com o objetivo de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 37 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a2a', 'ENEM-2023-038', 15, 438, 'enem', 3, 2, 2023, 'multiple_choice', 'Arte e cultura', 'O mais antigo grupo de rap indígena do país, Brô MCs, surgiu em 2009, na aldeia Jaguapiru, em Dourados, Mato Grosso do Sul. Os integrantes conheceram o rap pelo rádio, ouvindo um programa que apresentava cantores e grupos brasileiros desse gênero musical. O Brô MCs conseguiu influenciar outros a fazerem rap e a lutarem pelas causas indígenas. Um dos nomes do movimento, Kunumi MC, é um jovem de 16 anos, da aldeia Krukutu, em São Paulo.
O adolescente enxerga o rap como uma cultura da defesa e começou a fazer rimas quando percebeu que a poesia, pela qual sempre se interessou, podia virar música.
Nas letras que cria, inspiradas tanto pelo rap quanto pelos ritmos indígenas, tenta incluir sempre assuntos aos quais acha importante dar voz, principalmente, a questão da demarcação de terras.
Disponível em: www.correiobraziliense.com.br. Acesso em: 13 nov. 2021 (adaptado).
O movimento rap dos povos originários do Brasil revela o(a)', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 38 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a2b', 'ENEM-2023-039', 1, 224, 'enem', 3, 2, 2023, 'multiple_choice', 'Gêneros textuais', 'A petição on-line criada por um cidadão paulista surtiu efeito: casado há três anos com seu companheiro, ele pedia a alteração da definição de “casamento” no tradicional dicionário _Michaelis_ em português. Na definição anterior, casamento aparecia como “união legítima entre homem e mulher” e “união legal entre homem e mulher, para constituir família”.

O novo verbete não traz em nenhum momento as palavras homem ou mulher — agora a definição de casamento se refere a “pessoas”.

Para o diretor de comunicação do site onde a petição foi publicada, a iniciativa mostra a “eficiência da mobilização”. “Em dois dias, mudou-se uma definição que permanecia a mesma há décadas”, afirma. E conclui: “A plataforma serve para todos os tipos de causas, para as mudanças que importam para as pessoas.”.

SENRA, R. Disponível em: www.bbc.com. Acesso em: 29 out. 2015.

A notícia trata da mudança ocorrida em um dicionário da língua portuguesa. Segundo o texto, essa mudança foi impulsionada pela', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 39 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a2c', 'ENEM-2023-040', 16, 444, 'enem', 3, 2, 2023, 'multiple_choice', 'Corpo, esporte e saúde', 'A neozelandesa Laurel Hubbard fez história nos Jogos Olimpicos. Apesar de ter ficado de fora da disputa por medalhas, a levantadora de peso deixou sua marca na edição de Tóquio por ser a primeira mulher abertamente transgênero a participar de uma competição olímpica. No início da carreira, na década de 1990, a neozelandesa participava de disputas na categoria masculina. Em 2001, aos 23 anos, ela se afastou da atividade. “A pressão de tentar me encaixar em um mundo que talvez não tenha sido feito para pessoas como eu se tornou um fardo muito grande para suportar.” Em 2012, Laurel começou sua transição de gênero por meio de terapias hormonais e, em 2013, declarou abertamente ser uma mulher trans. Para o Comitê Olímpico Internacional, a participação de mulheres trans nos Jogos é permitida caso o nível de testosterona, hormônio que aumenta a massa muscular, esteja abaixo de 10 nanomols por litro por pelo menos 12 meses.

Disponivel em: https://revistagalileu.globo.com Acesso em: 18 nov. 2021 (adaptado).

No texto, os limites do potencial inclusivo do esporte são dados pela', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 40 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a2d', 'ENEM-2023-041', 16, 444, 'enem', 3, 2, 2023, 'multiple_choice', 'Corpo, esporte e saúde', '“Ganhei 25 medalhas em mundiais, sete em Jogos Olímpicos, e sou uma sobrevivente de abuso sexual.” Foi assim que Simone Biles se apresentou ao comitê do Senado norte-americano que investiga as supostas falhas do FBI no caso Larry Nassar. Biles e outras três atletas, vítimas dos abusos do ex-médico da equipe de ginástica feminina dos EUA, exigiram que os agentes da investigação sejam processados por falta de ação prévia contra Nassar, agora preso. Biles esclareceu que culpa Larry Nassar e “todo o sistema que o permitiu e o perpetrou”, acusando a Federação de Ginástica e o Comitê Olímpico dos Estados Unidos de saberem “muito antes” que ela havia sofrido abusos. A melhor ginasta do mundo é um ícone. Nos Jogos Olímpicos de Tóquio, uma lesão psicológica a impediu de competir como previa. No entanto, ela chegou ao topo como uma líder no trabalho de acabar com o preconceito com os problemas de saúde mental. “Não quero que nenhum outro atleta olímpico sofra o horror que eu e outras centenas suportamos e continuamos suportando até hoje”, afirmou.

Disponível em https://brasil.elpais.com Acesso em 31 out 2021 (adaptado).

O fato relatado na notícia chama a atenção acerca da necessidade de reflexão sobre a relação entre o esporte e', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 41 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a2e', 'ENEM-2023-042', 1, 439, 'enem', 3, 2, 2023, 'multiple_choice', 'Compreensão e interpretação', 'O acesso às Práticas Corporais/Atividades Físicas (PC/AF) é desigual no Brasil, à semelhança de outros indicadores sociais e de saúde. Em geral, PC/AF prazerosas, diversificadas, mais afeitas ao período de lazer estão concentradas nas populações mais abastadas. As atividades físicas de deslocamento, trajetos a pé ou de bicicleta para estudar ou trabalhar, por exemplo, são mais frequentes na classe social menos favorecida. Aqui, há uma relação inversa e perversa entre variáveis socioeconômicas de acesso às PC/AF. As maiores prevalências de inatividade física foram em mulheres, pessoas com 60 anos ou mais, negros, pessoas com autoavaliação de saúde ruim ou muito ruim, com renda familiar de até quatro salários mínimos por pessoa, pessoas que desconhecem programas públicos de PC/A e residentes em áreas sem locais públicos para a prática.

KNUTH, A. G.; ANTUNES, P. C. **Saúde e Sociedade**, n. 2, 2021 (adaptado).

O fator central que impacta a realização de práticas corporais/atividades fisicas no tempo de lazer no Brasil é a', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 42 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a2f', 'ENEM-2023-043', 11, 442, 'enem', 3, 2, 2023, 'multiple_choice', 'Escolas e textos literários', 'Mestre e companheiro, disse eu que nos íamos despedir. Mas disse mal. A morte não extingue: transforma; não aniquila; renova; não divorcia: aproxima. Um dia supuseste “morta e separada” a consorte dos teus sonhos e das tuas agonias, que te soubera “pôr um undo inteiro no recanto” do teu ninho; e, todavia, nunca ela te esteve mais presente, no íntimo de ti mesmo e na expressão do teu canto, no fundo do teu ser e na face de tuas ações. Esses catorze versos inimitáveis, em que o enlevo dos teus discípulos resume o valor de toda uma literatura, eram a aliança de ouro do teu segundo noivado, um anel de outras núpcias, para a vida nova do teu renascimento e da tua glorificação, com a sócia sem nódoa dos teus anos e de mocidade e madureza, da florescência e frutificação de tua alma. Para os eleitos do mundo das ideias a miséria está em decadência, e não na morte. A nobreza de uma nos preserva das ruínas de outra. Quando eles atravessavam essa passagem do invisível, que os conduz à região da verdade sem mescla, então é que entramos a sentir o começo do seu reino, o reino dos mortos sobre os vivos.
BARBOSA, R. O adeus da Academia a Machado de Assis. Rio de Janeiro: Agir, 1962.
Esse é um trecho do discurso de Rui Barbosa na Academia Brasileira de Letras em homenagem a Machado de Assis por ocasião de sua morte. Uma das características desse discurso de homenagem é a presença de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 43 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a30', 'ENEM-2023-045', 1, 224, 'enem', 3, 2, 2023, 'multiple_choice', 'Gêneros textuais', 'Carta aberta à população brasileira
Prezados Cidadãos e Cidadãs, O envelhecimento populacional é um fenômeno mundial. Infelizmente, nosso país ainda não está preparado para atender às demandas dessa população.
Este é o retrato da saúde pública no Brasil, que, apesar dos indiscutíveis avanços, apresenta um cenário de deficiências e falta de integração em todos os níveis de atenção à saúde: primária (atendimento deficiente nas unidades de saúde da atenção básica), secundária (carência de centros de referência com atendimento por especialistas) e terciária (atendimento hospitalar com abordagem ao idoso centrada na doença), ou seja, não há, na prática, uma rede de atenção à saúde do idoso.
Diante desse cenário, a Sociedade Brasileira de Geriatria e Gerontologia (SBGG) vem a público manifestar suas preocupações com o presente e o futuro dos idosos no Brasil. É preciso garantir a saúde como direito universal.
Esperamos que tanto nossos atuais quanto os futuros governantes e legisladores reflitam sobre a necessidade de investir na saúde e na qualidade de vida associada ao envelhecimento.
Dignidade à saúde do idoso!
Rio de Janeiro, 15 de setembro de 2014.
Disponível em: www.sbgg.org.br. Acesso em: 20 out. 2021 (adaptado).
O objetivo desse texto é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 45 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a31', 'ENEM-2023-046', 9, 423, 'enem', 3, 2, 2023, 'multiple_choice', 'Globalização e mundo atual', '![](conteudo/enem/2023/46-4eac436b.webp)

Fotografia da avó bordada
SCARELI. G. A máquina de costura e os fios da memória Revista Brasileira de Pesquisa (Auto) Biográfica, n. 18 maio-ago, 2021
A definição de Sertão descrita no bordado associa esse recorte espacial a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 46 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a32', 'ENEM-2023-047', 8, 419, 'enem', 3, 2, 2023, 'multiple_choice', 'Processos históricos', 'Felizes tempos eram esses! As moças iam à missa de madrugada. De dia ninguém as via e se alguma, em dia de festa, queria passear com a avó ou a tia, havia de ir de cadeirinhas. Bem razão têm os nossos velhos de chorar por esses tempos, em que as filhas não sabiam escrever, e por isso não mandavam nem recebiam bilhetinhos.
 
Novo correio de Modas, 1853, apud DONEGÁ, A. L.
Publicar ficção em meado do século XIX,: um estudo de revistas femininas editadas pelos irmãos Laemmert. Campinas, unicamp, 2013 (adaptado)
Na perspectiva do autor,  as tradições e os costumes sociofamiliares sofreram alterações no século XIX, decorrentes de quais fatores?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 47 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a33', 'ENEM-2023-048', 9, 433, 'enem', 3, 2, 2023, 'multiple_choice', 'Agropecuária, indústria e energia', 'No Cerrado, o conhecimento local está sendo cada vez mais subordinado à lógica do agronegócio. De um lado, o capital impõe os conhecimentos biotecnológicos, como mecanismo de universalização de práticas agrícolas e de novas tecnologias, e de outro, o modelo capitalista subordina homens e mulheres à lógica do mercado. Assim, as águas, as sementes, os minerais, as terras (bens comuns) tornam-se propriedade privada. Além do mais, há outros fatores negativos, como a mecanização pesada, a “pragatização” dos seres humanos e não humanos, a violência simbólica, a superexploração, as chuvas de veneno e a violência contra a pessoa.
CALAÇA, M.; SILVA, E. B.; JESUS, J. N. Territorialização do agronegócio e subordinação
do campesinato no Cerrado, Élisée, Rev. Geo. ÚEG, n. 1, jan.-jun. 2021 (adaptado).
Os elementos descritos no texto, a respeito da territorialização da produção, demonstram que há um:', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 48 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a34', 'ENEM-2023-049', 9, 431, 'enem', 3, 2, 2023, 'multiple_choice', 'Migrações e demografia', 'TEXTO I
Com uma população de 25 milhões de habitantes (cerca de 60% de minorias muçulmanas, principalmente da etnia Uigur), Xinjiang é uma região estratégica para a China. Faz fronteira com oito países, é uma artéria crucial do megaprojeto de infraestrutura chinês Cinturão e Rota e tem as maiores reservas nacionais de carvão e gás natural.
(NINIO, M. Disponível em: https: oglobo.globo.com. Acesso em: 5 out. 2021 adaptado)
TEXTO II
Dentre as províncias da Região Oeste, Xinjiang se destaca ao receber mais de 1,7 milhão de migrantes entre 2000 e 2010. O principal motivo desse fluxo migratório é que o governo fornece subsídios à população visando aumentar a proporção de chineses da etnia Han em relação à população local de etnias turca e muçulmana.
ALVES. F.: TOYOSHIMA. S. Disparidade socioeconômica e fluxo migratório chinês: interpretação de eventos contemporâneos segundo os clássicos do desenvolvimento. Revista de Economia Contemporânea. n 1. jan. abr. 2017 (adaptado)
A política demográfica para a província mencionada nos textos é parte da seguinte ação estratégica do governo chinês:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 49 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a35', 'ENEM-2023-050', 8, 419, 'enem', 3, 2, 2023, 'multiple_choice', 'Processos históricos', 'Superar a história da escravidão como principal marca da trajetória do negro no país tem sido uma tônica daqueles que se dedicam a pesquisar as heranças de origem afro à cultura brasileira. A esse esforço de reconstrução da própria história do país, alia-se agora a criação da plataforma digital Ancestralidades. “A história do negro no Brasil vai continuar sendo contada, e cada passo que a gente dá para trás é um passo que a gente avança”, diz Márcio Black, idealizador da plataforma, sobre o estudo de figuras ainda encobertas pela perspectiva histórica imposta pelos colonizadores da América.
FIORATI, G. Projeto joga luz sobre negros e revê perspectiva histórica Disponivel em: www1.folha.uol.com.br. Acesso em: 10 nov. 2021 (adaptado)
Em relação ao conhecimento sobre a formação cultural brasileira, iniciativas como a descrita no texto favorecem o(a)', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 50 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a36', 'ENEM-2023-051', 9, 423, 'enem', 3, 2, 2023, 'multiple_choice', 'Globalização e mundo atual', 'Escrito durante a Primeira Guerra Mundial, o seguinte trecho faz parte da carta enviada pelo secretário do exterior britânico, Sir Arthur James Balfour, ao banqueiro Lord Rotschild, presidente da Liga Sionista, em 2 de novembro de 1917, a carta ficou conhecida como Declaração Balfour:
“O governo de Sua Majestade vê com aprovação o estabelecimento na Palestina de um lar nacional para o povo judeu, e fará todos os esforços para facilitar tal objetivo. Nada será feito que possa prejudicar os direitos civis e religiosos das comunidades não judaicas na Palestina.”
GATTAZ, A. A Guerra da Palestina. São Paulo: Usina do Livro, 2002 (adaptado).
A análise do resultado do processo em questão revela que o governo inglês foi incapaz de garantir seu objetivo de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 51 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a37', 'ENEM-2023-052', 13, 428, 'enem', 3, 2, 2023, 'multiple_choice', 'Ética, moral e conhecimento', 'TEXTO I
Como presença consciente no mundo não posso escapar à responsabilidade ética no meu mover-me no mundo. Se sou puro produto da determinação genética ou cultural ou de classe, sou irresponsável pelo que faço no meu mover-me no mundo e, se careço de responsabilidade, não posso falar em ética.
FREIRE, P. Pedagogia da autonomia: saberes necessários à prática educativa. São Paulo: Paz e Terra, 1996
ТЕХТО II
Paulo Freire construiu uma pedagogia da esperança. Na sua concepção, a história não é algo pronto e acabado. As estruturas de opressão e as desigualdades, apesar de serem naturalizadas, são sócio e historicamente construídas. Daí a importância de os educandos tomarem consciência da sua realidade para, assim, transformá-la.
DEMARCHI, J. L. Paulo Freire. Disponivel em: https://diplomatique.org.br. Acesso em: 6 out. 2021 (adaptado).
Com base no conceito de ética pedagógica presente nos textos, os educandos tornam-se responsáveis pela', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 52 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a38', 'ENEM-2023-053', 9, 436, 'enem', 3, 2, 2023, 'multiple_choice', 'Relevo, solos e geologia', 'A cordilheira do Himalaia tem mais de 50 milhões de anos., sendo classificada como a maior cordilheira do planeta. Originário da língua sânscrito, comum na região, seu nome quer dizer “morada da neve”. É possível encontrar nessa cordilheira as quinze maiores montanhas do mundo. Ao todo, existem mais de cem picos, que contam com altitudes bem maiores que 7 000 m. O Everest, considerado o ponto mais alto da Terra, tem nada menos que 8 848 m de altitude, e continua crescendo, aproximadamente, 0,8 mm a cada ano.

Disponível em: https://meioambiente.culturamix.com. Acesso em: 12 nov. 2021 (adaptado).

Qual dinâmica natural é responsável pelo fenômeno apresentado?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 53 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a39', 'ENEM-2023-054', 13, 474, 'enem', 3, 2, 2023, 'multiple_choice', 'Filosofia moderna', 'Eu poderia concluir que a raiva é um pensamento, que estar com raiva é pensar que alguém é detestável, e que esse pensamento, como todos os outros — assim como Descartes o mostrou —, não poderia residir em nenhum fragmento de matéria. A raiva seria, portanto, espírito. Porém, quando me volto para minha própria experiência da raiva, devo confessar que ela não estava fora do meu corpo, mas inexplicavelmente nele.
MERLEAU-PONTY, M. Quinta conversa: o homem visto de fora. São Paulo: Martins Fontes, 1948 (adaptado).
No que se refere ao problema do corpo, a filosofia cartesiana apresenta-se como contraponto ao entendimento expresso no texto por', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 54 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a3a', 'ENEM-2023-055', 13, 473, 'enem', 3, 2, 2023, 'multiple_choice', 'Pensadores contemporâneos', 'A diversão é o prolongamento do trabalho sob o capitalismo tardio. Ela é procurada por quem quer escapar ao processo de trabalho mecanizado para se pôr de novo em condições de enfrentá-lo. Mas, ao mesmo tempo, a mecanização atingiu um tal poderio sobre a pessoa em seu lazer e sobre a sua felicidade, ela determina tão profundamente a fabricação das mercadorias destinadas à diversão que essa pessoa não pode mais perceber outra coisa senão as cópias que reproduzem o próprio processo de trabalho…
ADORNO, T; HORKHEIMER, M. Dialética do esclarecimento. Rio de Janeiro: Zahar 1997.
No texto, o tempo livre é concebido como', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 55 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a3b', 'ENEM-2023-057', 8, 419, 'enem', 3, 2, 2023, 'multiple_choice', 'Processos históricos', 'Quem se mete pelo caminho do pedido de perdão deve estar pronto a escutar uma palavra de recusa. Entrar na atmosfera do perdão é aceitar medir-se com a possibilidade sempre aberta do imperdoável. Perdão pedido não é perdão a que se tem direito [devido]. É com o preço destas reservas que a grandeza do perdão se manifesta.
RICOEUR, P. O perdão pode curar. Disponível em: www.lusosofia.net. Acesso em: 14 out 2019.
A reflexão sobre o perdão apresentada no texto encontra fundamento na(s)', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 57 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a3c', 'ENEM-2023-058', 9, 255, 'enem', 3, 2, 2023, 'multiple_choice', 'Urbanização', 'A Cavalgada de Sant’Ana é uma expressão da devoção dos vaqueiros à padroeira de Caicó (RN). Nas décadas de 1950 a 1970, esse evento, então denominado Cavalaria, era celebrado pelas pessoas que residiam na zona rural do município de Caicó. Essas pessoas usavam os animais (jegues, mulas e cavalos) como único meio de transporte, sobretudo para se dirigirem à cidade nos dias de feiras, trazendo seus produtos para comercializarem. Estando em Caicó no período da Festa de Sant’Ana, esses agricultores se organizavam em cavalgada até o pátio da Catedral de Sant’Ana para louvar a santa e receber bênção para seus animais. Por volta da década de 1970, com a chegada do automóvel à zona rural do município, essa expressão cultural foi extinta. O meio de transporte utilizando os animais passou a ser substituído por carros, sobretudo caminhonetes e caminhões, que transportavam os camponeses para a cidade em dias de feiras e festas. Desde 2002, um grupo de caicoenses retomou essa expressão cultural e, em conjunto com a associação dos vaqueiros, realiza no primeiro domingo da Festa a Cavalgada de Sant’Ana. O evento, além de contar com a participação dos cavaleiros que residem nas zonas rurais, atrai também pessoas que residem em Caicó, cidades vizinhas e amantes das vaquejadas.

FESTA DE SANT’ANA. Disponivel em: http://portal.iphan.gov.br Acesso em: 12 out. 2021 (adaptado).

As mudanças culturais mencionadas no texto caracterizam-se pela presenca de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 58 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a3d', 'ENEM-2023-059', 8, 419, 'enem', 3, 2, 2023, 'multiple_choice', 'Processos históricos', 'Do século XVI em diante, pelo menos nas classes mais altas, o garfo passou a ser usado como utensílio para comer, chegando através da Itália primeiramente à França e, em seguida, à Inglaterra e à Alemanha, depois de ter servido, durante algum tempo, apenas para retirar alimentos sólidos da travessa. Henrique III introduziu-o na França, trazendo-o provavelmente de Veneza. Seus cortesãos não foram pouco ridicularizados por essa maneira “afetada” de comer e, no princípio, não eram muito hábeis no uso do utensílio: pelo menos se dizia que metade da comida cala do garfo no caminho do prato à boca. Em data tão recente como o século XVII, o garfo era ainda basicamente artigo de luxo, geralmente feito de prata ou ouro.

ELIAS. N. **O processo civilizador**: uma história dos costumes. Rio de Janeiro: Zahar, 1994.

O processo social relatado indica a formação de uma etiqueta que tem como principio a', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 59 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a3e', 'ENEM-2023-060', 8, 419, 'enem', 3, 2, 2023, 'multiple_choice', 'Processos históricos', 'Negar o pedido por dinheiro indispensável para necessidades pessoais ou comprar bens usando o nome da pessoa sem o consentimento dela. Ameaçar o corte de recursos dependendo de atitudes pessoais, esconder documentos ou trocar senhas do banco sem avisar. Ou, ainda, proibir a pessoa de trabalhar ou destruir seus pertences. As histórias são comuns, mas às vezes não são reconhecidas como abuso. Mas é uma das cinco formas de conduta contra a mulher previstas na Lei Maria da Penha.

LEWGOY. J. **Conduta quase invisível destrói a vida de mulheres**. Disponível em: https://valorinveste.globo.com. Acesso em: 23 out. 2021 (adaptado).

O texto apresenta tipos de conduta sujeitos a punição, conforme previsto na Lei Maria da Penha, porque consistem em formas de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 60 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a3f', 'ENEM-2023-061', 13, 428, 'enem', 3, 2, 2023, 'multiple_choice', 'Ética, moral e conhecimento', 'Por trás da “mágica” do Google Assistant de sua capacidade de interpretar 26 idiomas está uma enorme equipe de linguistas distribuídos globalmente, trabalhando como subcontratados, que devem rotular tediosamente os dados de treinamento para que funcione. Eles ganham baixos salários e são rotineiramente forçados a trabalhar horas extras não remuneradas. A inteligência artificial não funciona como um pozinho mágico. Ela funciona por meio de trabalhadores que treinam algoritmos incansavelmente até que eles automatizem seus próprios trabalhos.

**A Inteligência Artificial (IA) da economia freelancer está vindo atrás de você**. Disponível em: https://mittechreview.com.br. Acesso em: 6 out. 2021 (adaptado).

O texto critica a mudança tecnológica em razão da seguinte consequência:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 61 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a40', 'ENEM-2023-062', 9, 423, 'enem', 3, 2, 2023, 'multiple_choice', 'Globalização e mundo atual', 'Enormes alto-falantes sul-coreanos instalados na fronteira com o Norte costumavam transmitir desde canções em estilo K-pop (como é chamado o pop sul-coreano) até boletins climáticos e noticiário crítico ao vizinho comunista. O Norte costuma praticar atividade semelhante, transmitindo por seus alto-falantes discursos críticos a Seul e aliados. Durante os anos 1980, o governo sul-coreano construiu um mastro de 97 metros de altura para hastear sua bandeira no povoado de Daesong-dong, na fronteira com o Norte. O Norte respondeu com a construção de um mastro ainda mais alto (160 m) na cidade fronteiriça de Gijung-dong. “Essas demonstrações são uma válvula de escape competitiva e importante entre os dois lados, fora de um possível conflito militar”, diz o analista Ankit Panda.

TAN, Y. **Disputa de mastros e alto-falantes com K-pop:** as pequenas picuinhas do conflito entre as Coreias. Disponível em: www.bbc.com. Acesso em: 7 nov. 2021 (adaptado).

Os atos de competição citados têm suas origens históricas vinculadas a um contexto de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 62 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a41', 'ENEM-2023-063', 8, 429, 'enem', 3, 2, 2023, 'multiple_choice', 'Brasil Colônia', 'Seda, madeiras aromáticas e têxteis, obras de arte, lã, cristais e muitas, muitas peças de porcelana chegaram ao Brasil ao longo dos séculos XVII e XVIII. A opulência proporcionada pelo ouro fez com que esses itens fossem ainda mais presentes em cidades mineiras como Ouro Preto, Mariana e Sabará. Esses objetos inspiraram a criação das chinesices, termo que designa um tipo de arte que evoca motivos chineses, presentes em várias igrejas barrocas de Minas Gerais. No Brasil, é bem provável que a inspiração para as pinturas nas igrejas barrocas com pássaros, elefantes, tigres, mandarins e pagodes tenha sido tirada de gravuras, tecidos, móveis e, principalmente, das porcelanas chinesas que circulavam livremente em uma sociedade enriquecida pelo comércio do ouro e pedras preciosas.

MARIUZZO, P. **Estudos interdisciplinares ampliam conhecimento sobre chinesice no barroco mineiro**. Disponível em: http://cienciaecultura.bvs.br. Acesso em: 23 nov. 2021 (adaptado).

O desenvolvimento do processo artístico descrito no texto foi possível pelo(a)', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 63 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a42', 'ENEM-2023-064', 8, 429, 'enem', 3, 2, 2023, 'multiple_choice', 'Brasil Colônia', '**Txai Suruí, liderança da Juventude Indígena, profere seu discurso na abertura da COP-26**

“O clima está esquentando, os animais estão desaparecendo, os rios estão morrendo e nossas plantações não florescem como no passado. A Terra está falando: ela nos diz que não temos mais tempo.”

VICK, M. **Quais são as conquistas do movimento indígena na COP-26**. Disponível em: www.nexojornal.com.br. Acesso em: 10 nov. 2021 (adaptado).

O discurso da líder indígena explicita um problema global relacionado ao(à)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 64 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a43', 'ENEM-2023-066', 9, 255, 'enem', 3, 2, 2023, 'multiple_choice', 'Urbanização', '**ТЕХТО I**

Como é horrível ver um filho comer e perguntar: “Tem mais?” Esta palavra “tem mais” fica oscilando dentro do cérebro de uma mãe que olha as panela e não tem mais.

JESUS, C. M. Quarto de despejo: diário de uma favelada. São Paulo: Ática. 2014.

**ТЕХТО ІІ**

A experiência de ver os filhos com fome na década de 1950, descrita por Carolina, é vivida no Brasil de 2021 por uma moradora de Petrolândia, em Pernambuco. “Eu trabalhava de ajudante de cabeleireira, mas a moça que tinha o salão fechou. Eu vinha me sustentando com o auxílio que tinha, mas agora eu não fui contemplada. Às vezes as pessoas me ajudam com alimentos para os meus filhos. De vez em quando, eu acho algum bico para fazer, mas é muito raro. Tem dias que não tenho nem o leite da minha bebê.”

CARRANÇA, T. “Até o feijão nos esqueceu”: o livro de 1960 que poderia ter sido escritonas favelas de 2021.

Disponível em: www.bbc.com. Acesso em: 6 out. 2021 (adaptado).

Considerando a realidade brasileira, os textos se aproximam ao apresentarem uma reflexão sobre o(a)', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 66 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a44', 'ENEM-2023-067', 9, 433, 'enem', 3, 2, 2023, 'multiple_choice', 'Agropecuária, indústria e energia', 'No sul da Bahia, desde o século XVIII, tem-se registros de um tipo de sistema agroflorestal. Até hoje, esse sistema é característica marcante da paisagem da região, conhecido como cabruca, que consiste no cultivo do cacau à sombra do dossel da floresta nativa. Esse sistema de cultivo do cacau (graças à tolerância da espécie à sombra) é considerado amigável para a vida silvestre, pois apresenta superioridade em termos de conservação da biodiversidade quando comparado com outras plantações tropicais (monoculturas de dendê, seringa ou café), agricultura ou pastagens.
SOLLBERG, I.; SCHIAVETTI, A. MORAES M. E. B. Manejo agrícola no Refúgio de Vida Silvestre de Una: agroflorestas como uma perspectiva de conservação. Revista Árvore. n. 2, 2014 (adaptado)
A prática produtiva apresentada é um exemplo de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 67 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a45', 'ENEM-2023-068', 9, 249, 'enem', 3, 2, 2023, 'multiple_choice', 'Climas do Brasil', 'O masseiro, a mulher, e quatro filhos, dormindo numa tapera de quatro paredes de caixão, coberta de zinco. A água do mangue, na maré cheia, ia dentro de casa. Os maruins de noite encalombavam o corpo dos meninos. O mangue tinha ocasião que fedia, e os urubus faziam ponto por ali atrás dos petiscos. Perto da rua lavavam couro de boi, pele de bode para o curtume de um espanhol. Morria peixe envenenado e quando a maré secava os urubus enchiam o papo, ciscavam a lama, passeando banzeiros pelas biqueiras dos mocambos no Recife.
RÊGO. J. L. O moleque Ricardo. Rio de Janeiro. J. Olympio, 1966 (adaptado).
A aglomeração urbana representada no texto resulta em', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 68 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a46', 'ENEM-2023-069', 9, 255, 'enem', 3, 2, 2023, 'multiple_choice', 'Urbanização', 'Elas foram as pioneiras dos direitos das mulheres no Afeganistão. Defensoras ferrenhas da lei, buscaram justiça para os mais marginalizados. Mas, agora, mais de 220 juízas afegãs estão escondidas por medo de retaliação sob o regime do Talibã. Uma delas condenou centenas de homens por violência contra as mulheres, incluindo estupro, assassinato e tortura. Mas poucos dias depois que o Talibã assumiu o controle de sua cidade e milhares de criminosos condenados foram libertados da prisão, as ameaças de morte começaram. O país sempre foi considerado um dos lugares mais difíceis e perigosos do mundo para as mulheres. De acordo com estudos de organizações não governamentais, cerca de 87% das mulheres e meninas serão vítimas de abuso durante a vida.

Disponível em: https://g1.globo.com. Acesso em: 12 out. 2021 (adaptado).

O texto evidencia situação representativa de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 69 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a47', 'ENEM-2023-070', 13, 428, 'enem', 3, 2, 2023, 'multiple_choice', 'Ética, moral e conhecimento', 'No cemitério, a sociedade religiosa encarregada do funeral, aterrorizada, apressou a cerimônia de tal forma que a mãe de Herzog perdeu o momento em que o caixão do filho começou a ser coberto pela terra. Quatro jornalistas que estavam presos no DOI chegaram para assistir ao sepultamento. Um se afastara, chorando. Dizia: Eles matam, eles matam! Não pergunte nada. Não podemos dizer nada. Eles matam mesmo. Falava-se baixo. Ouviram-se dois curtos discursos. O primeiro, da atriz Ruth Escobar: Até quando vamos suportar tanta violência? Até quando vamos continuar enterrando nossos mortos em silêncio? No segundo, Audálio Dantas recitou o Navio negreiro, de Castro Alves: _Senhor Deus dos desgraçados / Dizei-me Vós, Senhor Deus / Se é mentira, se é verdade, / Tanto horror perante os céus._

GASPARI, E. A ditadura encurralada. São Paulo: Cia. das Letras, 2004.

O acontecimento descrito no texto, ocorrido em meados dos anos 1970, atesta a seguinte característica do regime político-institucional vigente:', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 70 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a48', 'ENEM-2023-071', 9, 426, 'enem', 3, 2, 2023, 'multiple_choice', 'Questões ambientais', 'Alternativas logísticas estão servindo de instrumentos que ativam os mercados especuladores de terras nas diferentes regiões da Amazônia e constituem em indicadores utilizados por diferentes atores para defender ou denunciar o avanço da cultura da soja na região e, com ela, a retomada do desmatamento. É evidente que o crescimento do desmatamento tem a ver também com a expansão da soja, porém atribuir a ela o fator principal parece não totalmente correto. Parto da compreensão central de que a lógica que gera o desmatamento está articulada pelo tripé grileiros, madeireiros e pecuaristas.

OLIVEIRA, A. U. A Amazônia e a nova geografia da produção da soja. **Terra Livre**, n. 26, jan.-jun. 2006 (adaptado).

Na visão do autor, o problema central da situação descrita é desencadeado pela', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 71 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a49', 'ENEM-2023-072', 9, 431, 'enem', 3, 2, 2023, 'multiple_choice', 'Migrações e demografia', '**TEXTO I**

Por hora, apenas os mais abastados poderão sonhar em viajar ao espaço, seja por um foguete ou por um avião híbrido, mas toda a população global poderá sentir os efeitos dessas viagens e avanços tecnológicos. Para uma aventura dessas, as empresas tiveram que criar novas tecnologias, materiais e softwares, o que podem, em algum momento, voltar para a sociedade. A câmera fotográfica, hoje comum no mundo, antes foi uma invenção para ser usada em telescópios e o titânio, usado até na medicina, foi desenvolvido para a construção de foguetes.

ORLANDO, G. **Corrida espacial dos bilionários pode trazer vantagens para todos**. Disponível em: https://noticias.r7.com/. Acesso em: 5 nov. 2021 (adaptado).

**TEXTO II**

![](conteudo/enem/2023/72-19b09a90.webp)

CAZO. Disponível em: www.humorpolitico.com.br. Acesso em: 5 nov. 2021.

Os textos apresentam perspectivas da nova corrida espacial que revelam, respectivamente:', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 72 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a4a', 'ENEM-2023-073', 8, 419, 'enem', 3, 2, 2023, 'multiple_choice', 'Processos históricos', 'Os séculos XV e XVI, quando se vão desmoronando as estruturas socioeconômicas da Idade Média perante os novos imperativos da Época moderna, constituem um momento-chave na história florestal de toda a Europa Ocidental. Abre-se, genericamente, um longo período de “crise florestal”, que se manifesta com acuidade nos países onde mais se desenvolvem as atividades industriais e comerciais. As necessidades em produtos lenhosos aumentam drasticamente com o crescimento do consumo nos mercados urbanos e nas regiões onde progridem a metalurgia e a construção naval, além da sua utilização na vida quotidiana de toda a população.

DEVY-VARETA, N. Para uma geografia histórica da floresta portuguesa. **Revista da Faculdade de Letras – Geografia,** n. 1, 1986 (adaptado).

Qual acontecimento do período contribuiu diretamente para o agravamento da situação descrita?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 73 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a4b', 'ENEM-2023-074', 8, 434, 'enem', 3, 2, 2023, 'multiple_choice', 'Império e Regências', 'Tahuantinsuyu — nome do Império Inca em quéchua — era dividido em quatro partes ou suyus: Chinchaysuyu (noroeste do Peru e Equador), Antisuyu (parte amazônica do império), Collasuyu (atual Bolívia) e Condesuyu (costa do Oceano Pacífico) e tinha Cuzco, no atual Peru, como sua capital imperial. Oficialmente, todas as etnias dominadas pelos incas deveriam adotar a língua quéchua, adorar o Sapa Inca e o Sol e pagar taxas em forma de horas de trabalhos periódicos. No entanto, pode-se dizer que o Império Inca era como um mosaico cultural em que vários e diferentes grupos étnicos adoravam o Sapa Inca e o Sol mas, simultaneamente, continuavam a adorar seus deuses locais e também a falar em suas línguas nativas.

MARTINS, C. **Os incas e os tahuantinsuyu**: apresentação. Disponível em: http://antigo.anphlac.org. Acesso em: 6 out. 2021 (adaptado).

Ao comparar, no texto, a vertente da dominação territorial com os aspectos culturais, os incas tinham uma postura', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 74 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a4c', 'ENEM-2023-075', 12, 425, 'enem', 3, 2, 2023, 'multiple_choice', 'Cultura, trabalho e cidadania', 'A torcida do Fluminense inicia um movimento para mudar a letra de uma das músicas mais populares das arquibancadas tricolores. Grupos pedem a remoção do termo “mulambo imundo”, em uma provocação direta ao Flamengo. Mulambo é um termo que surgiu em Angola, na época da escravatura, e eles eram chamados de mulambos pelos senhores de engenho, os patrões das fazendas.

Disponível em: https://oglobo.globo.com. Acesso em: 23 nov. 2021.

Qual mudança no comportamento social a proposta reportada no texto reflete?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 75 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a4d', 'ENEM-2023-076', 9, 431, 'enem', 3, 2, 2023, 'multiple_choice', 'Migrações e demografia', '![](conteudo/enem/2023/76-4b3eb253.webp)

Disponível em: www.insper.edu.br. Acesso em: 27 set. 2021 (adaptado).

Qual fator foi determinante para a mudança do indicador apresentado no gráfico?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 76 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a4e', 'ENEM-2023-077', 8, 419, 'enem', 3, 2, 2023, 'multiple_choice', 'Processos históricos', 'Havia já muito tempo que a Europa desfrutava os benefícios da vacina e arrancava à morte milhares de inocentes, condenados a serem vítimas do terrível flagelo das bexigas, e o governo de Portugal nunca se lembrara de transmitir ao Brasil a mais útil das descobertas humanas, quando aliás nenhum país mais do que ele carecia deste salutar invento ou se atendesse às vantagens da população ou ao perdimento de imensas somas na mortandade contínua de escravos, que este flagelo devorava. O certo é que mais ocupado de seu ouro que de seus habitantes, Portugal, como em outros muitos casos, esperou que o Brasil por seu próprio impulso remediasse a este mal.
PEREIRA, J. C. 12 jan. 1828 apud LOPES, M. B.; POLITO, R. Para uma história da vacina no Brasil: um manuscrito inédito de Norberto e Macedo. História, Ciências, Saúde – Manguinhos, n. 2, abr. -jun. 2007 (adaptado).
Escrito em 1828, o texto expressa a seguinte ideia de origem iluminista:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 77 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a4f', 'ENEM-2023-078', 9, 255, 'enem', 3, 2, 2023, 'multiple_choice', 'Urbanização', 'Os movimentos da agricultura urbana no Rio de Janeiro vêm crescendo nos últimos vinte anos, tanto por meio de reproduções de modelos de vida antigos, vinculados ao resgate dos próprios costumes, como — e cada vez mais — são revelados hábitos inventivos nos quais moradores urbanos de diferentes classes sociais, sem nenhuma referência anterior com o campo, passam a se dedicar a essas atividades. Ao possibilitar o acesso ao plantio e, consequentemente, à alimentação, permite-se uma nova relação com o que se come, reduzindo o percurso da cadeia produtiva e aproximando produtores de consumidores, pois ambos se confundem nas experiências de agricultura urbana.

PORTILHO, M.; RODRIGUES, C. G. O.; FERNANDEZ, A. C. F. Cultivando relações no arranjo local da Penha: a mobilização de mulheres a partir das práticas de agricultura urbana na favela. Cidades, Comunidades e Territórios, n. 42, jun. 2021.

A prática agrícola destacada no texto apresenta como vantagem no espaço urbano a', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 78 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a50', 'ENEM-2023-079', 13, 473, 'enem', 3, 2, 2023, 'multiple_choice', 'Pensadores contemporâneos', '**TEXTO I**

Gerineldo dorme porque já está conformado com o seu mundo. Porque já sabe tudo o que lhe pode acontecer após haver submetido todos os objetos que o rodeiam a um minucioso inventário de possibilidades. Seu apartamento, mais que um apartamento, é uma teoria de sorte e de azar. Melhor que ninguém, Gerineldo conhece o coeficiente da dilatação de suas janelas e mantém marcado no termômetro, com uma linha vermelha, o ponto em que se quebrarão os vidros, despedaçados em estilhaços de morte. Sabe que os arquitetos e os engenheiros já previram tudo, menos o que nunca já aconteceu.

MARQUEZ, G. G. O pessimista. In: Textos do Caribe. Rio de Janeiro: Record, 1981.

**ТЕХТО II**

A situação é o sujeito inteiro (ele não é nada a não ser a sua situação) e é também a coisa inteira (nunca há mais nada senão as coisas). É o sujeito a elucidar as coisas pela sua própria superação, se assim quisermos; ou são as coisas a reenviar ao sujeito a imagem dele. É a total facticidade, a contingência absoluta do mundo, do meu nascimento, do meu lugar, do meu passado, dos meus redores — e é a minha liberdade sem limites que faz com que haja para mim uma facticidade.

SARTRE, J.-P. O ser e o nada: ensaio de ontologia fenomenológica. Petrópolis: Vozes, 1997 (adaptado).

A postura determinista adotada pelo personagem Gerineldo contrasta com a ideia existencialista contida no pensamento filosófico de Sartre porque', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 79 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a51', 'ENEM-2023-080', 9, 251, 'enem', 3, 2, 2023, 'multiple_choice', 'Bacias hidrográficas do Brasil', 'O Golpe Militar de 1964 foi implacável no combate ao que restava das Ligas Camponesas, generalizadas na década anterior. No entanto, em relação aos sindicatos, sua atitude foi ambígua. Por meio de acordos com os Estados Unidos, foram concebidos centros sindicais e cursos de liderança com base em princípios conservadores e ministrados por membros da Igreja Católica.

DEL PRIORE, M.; VENÂNCIO, R. Uma história da vida rural no Brasil. Rio de Janeiro: Ediouro, 2006 (adaptado).

Os sindicatos rurais foram tratados da forma descrita no texto porque o governo pretendia utiliza-los para', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 80 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a52', 'ENEM-2023-081', 12, 425, 'enem', 3, 2, 2023, 'multiple_choice', 'Cultura, trabalho e cidadania', 'A economia das ilegalidades se reestruturou com o desenvolvimento da sociedade capitalista. A ilegalidade dos bens foi separada da ilegalidade dos direitos. Divisão que corresponde a uma oposição de classes, pois, de um lado, a ilegalidade mais acessível às classes populares será a dos bens — transferência violenta das propriedades; de outro, à burguesia, então, se reservará a ilegalidade dos direitos: a possibilidade de desviar seus próprios regulamentos e suas próprias leis; e essa grande redistribuição das ilegalidades se traduzirá até por uma especialização dos circuitos judiciários; para as ilegalidades de bens — para o roubo — os tribunais ordinários e os castigos; para as ilegalidades de direitos — fraudes, evasões fiscais, operações comerciais irregulares — jurisdições especiais com transações, acomodações, multas atenuadas etc.
 FOUCAULT, M. Vigiar e punir: nascimento da prisão. Petropolis: Vozes, 1987 
O texto apresenta uma relação de cálculo politico-econômico que caracteriza o poder punitivo por meio da • gestão das ilicitudes pelo sistema judicial. aplicação das sanções pelo modelo equânime. supressão dos crimes pela penalização severa. regulamentação dos privilégios pela justiça social. repartição de vantagens pela hierarquização cultural', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 81 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a53', 'ENEM-2023-082', 9, 431, 'enem', 3, 2, 2023, 'multiple_choice', 'Migrações e demografia', 'Os vapores cruzavam os mares transportando pessoas, mercadorias e ideias, e ainda carregavam a mala postal, repleta de mensagens. Múltiplas histórias escritas atravessavam o oceano buscando por notícias de filhos e pais, irmãos, maridos e esposas, noivos e noivas. As missivas traziam boas e más novas, comunicavam alegremente nascimentos e casamentos, também doenças e mortes; enviavam declarações de amor e fidelidade, fotos de família; encaminhavam conselhos de velhos, pedidos de ajuda e de dinheiro; expediam cartas bancárias e de chamada. Essa literatura epistolar possibilitava a transmissão e reconstrução das tradições. Os deslocamentos tornaram-se um dos mais potentes produtores de escritura ao longo da história.

TRUZZI, O.; MATOS, I. Saudades: sensibilidades no epistolário de e/imigrantes  
portuqueses (Portugal-Brasil 1890-1930). Rev. Bras. Hist., n. 70, jul.-dez. 2015.

Conforme o texto, as correspondências trocadas entre imigrantes no Brasil com os seus países de procedência constituíam um dispositivo tecnológico que possibilitava o(a)', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 82 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a54', 'ENEM-2023-083', 9, 436, 'enem', 3, 2, 2023, 'multiple_choice', 'Relevo, solos e geologia', 'Diversos são os fatores causadores da degradação do solo, atuando de forma direta ou indireta, mas quase sempre a grande maioria das terras degradadas inicia esse processo com o desmatamento, que pode ser seguido por diversas formas de ocupação desordenada, como: corte de taludes para a construção de casas, rodovias e ferrovias, agricultura, com uso da queimada, vários tipos de mineração, irrigação excessiva, crescimento desordenado das cidades, superpastoreio, uso do solo para diversos tipos de despejos industriais e domésticos, sem tratamento da área que recebe esses despejos; enfim, de uma forma ou de outra, os solos tornam-se degradados, sendo muitas vezes difícil, ou quase impossível, a sua recuperação.

GUERRA, A. T. Degradação dos solos: conceitos e temas. In: GUERRA, A. T.; JORGE, M. C. O. (Org.). **Degradação dos solos no Brasil**. Rio de Janeiro: Difel, 2018.

A partir da ocupação desordenada exporta no texto, o que impede a recuperação do recurso natural destacado é a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 1º dia · Questão 83 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a55', 'ENEM-2023-084', 9, 455, 'enem', 3, 2, 2023, 'multiple_choice', 'Escalas, mapas e projeções', 'A partir da década de 1930, começam a ser discutidos no Brasil os princípios de racionalização do trabalho. As preocupações com a cozinha e o trabalho doméstico foram introduzidas com a medicina sanitária e a oferta de gás e eletricidade para uso doméstico no início do século XX. A organização da cozinha visava atingir uma simplificação das tarefas, com a economia de movimentos, e o barateamento dos equipamentos, a partir da produção em grande escala. A padronização e racionalização da habitação e seus componentes visava uma radical transformação da casa, em especial da cozinha, e apoiava-se tanto no desenvolvimento de novos equipamentos quanto nos estudos de racionalização do trabalho doméstico. A principal preocupação era o desenvolvimento de um novo tipo de habitação, que deveria induzir um novo comportamento social.

SILVA, J. L. M. Transformações no espaço doméstico: o fogão a gás e a cozinha paulistana, 1870-1930. Anais do Museu Paulista, n. 2. jul-dez 2007 (adaptado).

No contexto descrito, as mudanças mencionadas proporcionavam às mulheres o(a)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 84 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a56', 'ENEM-2023-085', 9, 423, 'enem', 3, 2, 2023, 'multiple_choice', 'Globalização e mundo atual', 'Produtores rurais europeus são antigos opositores de um grande acordo com o Mercosul. Na visão deles, existe um nítido risco de concorrência desleal, pois, na Europa, é preciso seguir regras mais rígidas de produção, o que encarece o processo. Assim, eles não conseguiriam competir com os preços, por exemplo, da carne brasileira e teriam seus negócios ameaçados. Por outro lado, o setor industrial europeu se mobiliza a favor do acordo, uma vez que as reduções de tarifas no comércio internacional dariam maior acesso ao mercado sul-americano. Um exemplo é o setor automotivo europeu, que prevê maior participação e concorrência nos países do Mercosul caso o acordo siga em frente.

ROUBICEK, M. Como o risco ambiental afeta o acordo entre Mercosul e União Europeia.  
Disponível em: www.nexojornal.com.br. Acesso em: 25 out. 2021.

No contexto do acordo citado, os dois grupos econômicos europeus defendem, respectivamente, a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 85 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a57', 'ENEM-2023-086', 13, 428, 'enem', 3, 2, 2023, 'multiple_choice', 'Ética, moral e conhecimento', 'Durante a Revolução Francesa, um certo padre Niollant escondeu-se no pequeno castelo de L’Escarbas. Pagou amplamente a hospitalidade do velho fidalgo ocupando-se da educação de sua filha, Anaïs. A presença da mãe em nada modificou essa educação masculina dada a uma jovem criatura já muito inclinada à independência em virtude da vida no campo. O padre transmitiu à aluna sua intrepidez de opiniões e sua facilidade de julgamento, sem pensar que essas qualidades, tão necessárias num homem, se tornam defeitos numa mulher destinada aos humildes afazeres de mãe de família. Embora o padre recomendasse continuamente à aluna ser tanto mais graciosa e modesta quanto seu saber era mais extenso, a senhorita de Nègrepelisse ficou com excelente opinião de si mesma.

BALZAC. H. Ilusões perdidas. São Paulo: Penguin Classics:  
Cia. das Letras, 2011 (adaptado).

O comportamento desenvolvido pela personagem evidencia uma postura de', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 1º dia · Questão 86 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a58', 'ENEM-2023-087', 9, 251, 'enem', 3, 2, 2023, 'multiple_choice', 'Bacias hidrográficas do Brasil', '**TEXTO I**

Oriunda da Romênia, Genny Gleizer aportou no Brasil em 1932. Assim como milhares de judeus do Leste Europeu, sua vinda para o Brasil ocorreu em um momento de ascensão do antissemitismo na Europa que tornava precárias suas vidas. O Brasil se colocava como uma possibilidade na busca por condições de sobrevivência e desenvolvimento.

ANTÃO, A. C. C. B. Gênero, imigração e política: o caso da judia comunista Genny Gleizer no Governo Vargas (1932-1935). Rio de Janeiro: Casa de Oswaldo Cruz, 2017 (adaptado).

**ТЕХТО II**

A presença judaica no Brasil foi criando aos poucos certas desconfianças que se refletiram em órgãos da imprensa e em círculos intelectuais e políticos. Em parte, essa imagem negativa adviria da onda nacionalista surgida no final dos anos 1910, que concebia imigrantes como concorrentes dos trabalhadores brasileiros, ou como seres improdutivos, exploradores da mão de obra e da riqueza autóctone. Além disso, as elites políticas da época acreditavam que os estrangeiros eram portadores das doutrinas anarquista e comunista, estranhas à “indole do povo brasileiro”. Esses “indesejáveis” seriam um mal externo que corromperia a nação.

MAIO, M. C.: CALAÇA, C. E. Um balanço da bibliografia sobre o antissemitismo  
no Brasil. In: GRINBERG, K. (Org.). Os judeus no Brasil. Rio de Janeiro: Civilização Brasileira, 2005 (adaptado).

Conforme descrito nos textos, o tratamento dispensado aos grupos mencionados se fundamentava em', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 87 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a59', 'ENEM-2023-088', 13, 428, 'enem', 3, 2, 2023, 'multiple_choice', 'Ética, moral e conhecimento', 'Concorrer e competir não são a mesma coisa. A concorrência pode até ser saudável sempre que a batalha entre agentes, para melhor empreender uma tarefa e obter melhores resultados finais, exige o respeito a certas regras de convivência preestabelecidas ou não. Já a competitividade se funda na invenção de novas armas de luta, num exercício em que a única regra é a conquista da melhor posição. A competitividade é uma espécie de guerra em que tudo vale e, desse modo, sua prática provoca um afrouxamento dos valores morais e um convite ao exercício de violência.

SANTOS, M. **Por uma outra globalização**: do pensamento único à consciência universal. Rio de Janeiro: Record, 2006.

De acordo com a diferenciação feita pelo autor, que prática econômica é considerada moralmente condenável?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 1º dia · Questão 88 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a5a', 'ENEM-2023-089', 9, 436, 'enem', 3, 2, 2023, 'multiple_choice', 'Relevo, solos e geologia', '![](conteudo/enem/2023/89-9bf9cf75.webp)

Qual medida é capaz de minimizar as mudanças apresentadas nas simulações?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 1º dia · Questão 89 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a5b', 'ENEM-2023-090', 8, 417, 'enem', 3, 2, 2023, 'multiple_choice', 'Antiguidade', 'Não tinha outra filosofia. Nem eu. Não digo que a Universidade me não tivesse ensinado alguma; mas eu decorei-lhe só as fórmulas, o vocabulário, o esqueleto. Tratei-a como tratei o latim; embolsei três versos de Virgílio, dois de Horácio, uma dúzia de locuções morais e políticas, para as despesas da conversação. Tratei-os como tratei a história e a jurisprudência. Colhi de todas as cousas a fraseologia, a casca, a ornamentação.
ASSIS, M. Memórias póstumas do Brás Cubas. Belo Horizonte: Autêntica. 1999.
A descrição crítica do personagem de Machado de Assis assemelha-se às características dos sofistas, contestados pelos filósofos gregos da Antiguidade, porque se mostra alinhada à', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 1º dia · Questão 90 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a5c', 'ENEM-2023-091', 5, 402, 'enem', 3, 2, 2023, 'multiple_choice', 'Plantas e fotossíntese', 'O número de abelhas encontra-se em declínio em várias regiões do mundo, inclusive no Brasil, sendo que vários fatores contribuem para o colapso de suas colmeias. Nos Estados Unidos, bombas de sementes de espécies vegetais nativas têm sido utilizadas para combater o desaparecimento desses insetos. Elas são pequenas bolinhas recheadas com sementes, adubo e argila. Quando são arremessadas e ficam expostas ao sol e à chuva, germinam até mesmo em solo pouco fértil.

DARAYA, V. Disponível em: http://planetasustentavel.abril.com.br.  
Acesso em: 2 fev. 2015 (adaptado).

Esse método contribui para a preservação das abelhas porque', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 91 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a5d', 'ENEM-2023-092', 5, 261, 'enem', 3, 2, 2023, 'multiple_choice', 'Doenças e prevenção', 'Os mais antigos cozinhavam o feijão na panela de ferro a fim de acabar com a palidez de seus filhos. Alguns chegavam até a colocar um prego enferrujado nesse cozimento para liberar o ferro contido nele. Sabe-se que esse elemento pode ser encontrado na sua forma metálica ou iônica, sendo essencial para a manutenção da vida humana.

As estratégias citadas eram utilizadas com o objetivo de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 92 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a5e', 'ENEM-2023-093', 7, 26, 'enem', 3, 2, 2023, 'multiple_choice', 'pH e acidez', 'A utilização de tecnologia nuclear é um tema bastante controverso, por causa do risco de acidentes graves, como aqueles ocorridos em Chernobyl (1986), em Goiânia (1987) e em Fukushima (2011). Apesar de muitas desvantagens, como a geração de resíduos tóxicos, a descontaminação ambiental dispendiosa em caso de acidentes e a utilização em armas nucleares, a geração de energia nuclear apresenta vantagens em comparação a outras fontes de energia.
A geração dessa energia tem como característica:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 93 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a5f', 'ENEM-2023-094', 5, 406, 'enem', 3, 2, 2023, 'multiple_choice', 'Ecossistemas e relações ecológicas', 'Em uma indústria, o controle da dureza da água é importante quando ela é utilizada em caldeiras, uma vez que sais pouco solúveis, formados a partir de sulfatos e carbonatos, podem acumular-se no interior das tubulações, causando obstruções. Para avaliar a água utilizada nessa indústria, foram realizados testes de qualidade que consideraram os seauintes parâmetros:

![](conteudo/enem/2023/94-429989c0.webp)

Qual teste deve ser considerado para controlar a formação desse tipo de obstrução de tubulações?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 94 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a60', 'ENEM-2023-095', 5, 404, 'enem', 3, 2, 2023, 'multiple_choice', 'Fisiologia humana', 'As aves apresentam dois tipos de músculos em seus corpos: vermelhos e brancos. Aves migratórias como garças, gansos e patos selvagens têm os músculos vermelhos bem desenvolvidos, com ampla rede de vasos sanguíneos.
Nas viagens por grandes distâncias, tais músculos são fundamentais, pois favorecem o(a)', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 95 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a61', 'ENEM-2023-096', 6, 412, 'enem', 3, 2, 2023, 'multiple_choice', 'Forças e leis de Newton', 'Existe no comércio um produto antimofo constituído por uma embalagem com tampa perfurada contendo cloreto de cálcio anidro, CaCI,. Uma vez aberto o lacre, essa substância absorve a umidade ambiente, transformando-se em cloreto de cálcio di-hidratado, CaCI, 2H,0. Considere a massa molar da água igual a 18 g mol-1, e a massa molar do cloreto de cálcio anidro igual a 111 g mol-1.
Na hidratação da substância presente no antimofo, o ganho percentual, em massa, é mais próximo de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 96 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a62', 'ENEM-2023-097', 7, 408, 'enem', 3, 2, 2023, 'multiple_choice', 'Eletroquímica', 'Um garoto comprou vários abacates na feira, mas descobriu que eles não estavam maduros o suficiente para serem consumidos. Sua mãe recomendou que ele colocasse os abacates em um recipiente fechado, pois isso aceleraria seu amadurecimento. Com certa dúvida, o garoto realizou esta experiência: colocou alguns abacates no recipiente e deixou os demais em uma fruteira aberta. Surpreendendo-se, ele percebeu que os frutos que estavam no recipiente fechado amadureceram mais rapidamente.
A aceleração desse processo é causada por', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 97 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a63', 'ENEM-2023-098', 5, 459, 'enem', 3, 2, 2023, 'multiple_choice', 'Célula e metabolismo', 'Há muito tempo são conhecidas espécies de lesmas-do-mar com uma capacidade impar: guardar parte da maquinaria das células das algas que consomem — os cloroplastos — e mantê-los funcionais dentro das suas próprias células, obtendo assim parte do seu alimento. Investigadores portugueses descobriram que essas lesmas-do-mar podem ser mais eficientes nesse processo do que as próprias algas que consomem.

Disponível em: www.cienciahoje.pt. Acesso em: 10 fev. 2015 (adaptado).

Essa adaptação confere a esse organismo a capacidade de obter primariamente', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 98 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a64', 'ENEM-2023-099', 5, 261, 'enem', 3, 2, 2023, 'multiple_choice', 'Doenças e prevenção', 'A leishmaniose visceral é uma zoonose causada por um protozoário do gênero Leishmania que é encontrado em diversos tecidos. Ela é transmitida ao homem de forma indireta, por vetores do ambiente doméstico. O cão é considerado um importante hospedeiro desse protozoário, podendo ou não apresentar os sintomas da doença, como perda de peso, anemia, ferimentos na pele, diarreia, conjuntivite e insuficiência renal. Em uma região que sofre com alta incidência dessa doença, uma campanha do centro de zoonoses buscou verificar a presença desse protozoário nos cães para tentar controlar a doença.', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 99 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a65', 'ENEM-2023-100', 6, 409, 'enem', 3, 2, 2023, 'multiple_choice', 'Movimento', 'Um professor lança uma esfera verticalmente para cima, a qual retorna, depois de alguns segundos, ao ponto de lançamento. Em seguida, lista em um quadro todas as possibilidades para as grandezas cinemáticas.

![](conteudo/enem/2023/100-92848aa5.webp)

Ele solicita aos alunos que analisem as grandezas cinemáticas no instante em que a esfera atinge a altura máxima, escolhendo uma combinação para os módulos e sentidos da velocidade e da aceleração. A escolha que corresponde à combinação correta é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 100 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a66', 'ENEM-2023-101', 5, 404, 'enem', 3, 2, 2023, 'multiple_choice', 'Fisiologia humana', 'Muitas mulheres sofrem com desconfortos nos dias que antecedem a menstruação, a chamada tensão pré-menstrual. Entre outros sintomas, podem ocorrer alterações de humor. Atualmente, acredita-se que os sintomas são resultado da queda na concentração do neurotransmissor serotonina, que, por sua vez, está relacionado com a diminuição na produção dos hormônios ovarianos estrógeno e progesterona, observada nessa fase do ciclo feminino.
DIMMOCK, P. W. et al. Efficacy of Selective Serotonin-Reuptake Inhibitors in Premenstrual Syndrome: a Systematic Review. The Lancet, n. 9 236, 2000 (adaptado).
A redução da produção desses hormônios nessa fase está relacionada com o(a)', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 101 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a67', 'ENEM-2023-102', 7, 26, 'enem', 3, 2, 2023, 'multiple_choice', 'pH e acidez', 'As cetonas fazem parte de famílias olfativas encontradas em muitos alimentos. A molécula de hexan-3-ona é um exemplo desses compostos voláteis responsáveis pelo aroma, podendo ser obtida por processos energéticos realizados em meio ácido, na presença de oxidantes como o permanganato de potássio. Para se produzir esse composto volátil em laboratório, deve-se oxidar a molécula de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 102 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a68', 'ENEM-2023-103', 5, 402, 'enem', 3, 2, 2023, 'multiple_choice', 'Plantas e fotossíntese', 'Durante a evolução das plantas, ocorreu uma transição do ambiente aquático para o ambiente terrestre graças ao surgimento de algumas estruturas que as tornaram independentes da água. Esse fato permitiu maior dispersão desse grupo de seres vivos, sendo possível observá-los em diferentes ambientes na atualidade.
Qual estrutura possibilitou a independência da água para a fecundação dos seres vivos citados acima?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 103 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a69', 'ENEM-2023-104', 7, 401, 'enem', 3, 2, 2023, 'multiple_choice', 'Funções e reações orgânicas', 'O vidro contendo alumínio em sua composição é um excelente material para acondicionar medicamentos e suplementos, porque pode ser esterilizado por aquecimento. No entanto, quando o medicamento ou suplemento contém substâncias que se ligam fortemente ao íon desse metal, a dissolução do alumínio é promovida em função do deslocamento do equilíbrio químico estabelecido entre a espécie imobilizada no vidro e a espécie em solução. Por essa razão, recomenda-se que suplementos de nutrição de recém-nascidos contendo gluconato de cálcio sejam acondicionados em embalagens plásticas, e não nesse tipo de vidro.

**Atualização da recomendação da Sociedade Portuguesa de Neonatologia.**  
Disponível em: www.spneonatologia.pt. Acesso em: 22 out. 2021 (adaptado).

Caso esse suplemento seja acondicionado em embalagem desse tipo de vidro, o risco de contaminação por alumínio será maior se o(a)', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 104 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a6a', 'ENEM-2023-105', 5, 402, 'enem', 3, 2, 2023, 'multiple_choice', 'Plantas e fotossíntese', 'Barbatimão é o nome popular de uma árvore cuja casca e utilizada para fins medicinais. Essa casca é constituída principalmente de dois tecidos vegetais: periderme e floema. A extração da casca tem levado à morte muitos indivíduos dessa espécie, quando o corte retira um anel completo ao longo da circunferência do tronco. Aqueles que têm parte da casca retirada sem completar essa circunferência podem sobreviver.

A morte desses indivíduos, decorrente da retirada do anel completo da casca, é provocada pela interrupção da', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 105 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a6b', 'ENEM-2023-106', 5, 403, 'enem', 3, 2, 2023, 'multiple_choice', 'DNA, genes e hereditariedade', 'A tecnologia de vacinas de RNA mensageiro (RNAm) é investigada há anos. Avanços científicos em genética molecular permitiram desenvolver uma vacina para controle da pandemia da covid-19 causada pelo vírus de RNA SARS-CoV-2. A vacina de RNAm tem sequências de genes do vírus. Entretanto, por ser muito instável, o RNAm deve ser recoberto por uma capa de lipídios que evita sua degradação e favorece sua ação. Dessa forma, o RNAm desempenhará sua função especifica atuando no mesmo compartimento celular de sempre.

Disponível em: https://sbim.org.br. Acesso em: 29 nov. 2021 (adaptado).

A imunização produzida por esse tipo de vacina é alcançada por meio da', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 106 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a6c', 'ENEM-2023-107', 5, 459, 'enem', 3, 2, 2023, 'multiple_choice', 'Célula e metabolismo', 'Na fertilização in vitro, espermatozoides são adicionados aos gametas femininos retirados de uma mulher. Após o período de incubação, a fecundação é favorecida pela ação de enzimas. Em um procedimento realizado, observou-se que nenhum dos gametas femininos foi fertilizado e, posteriormente, verificou-se que havia sido adicionado, equivocadamente, um coquetel de inibidores das enzimas do acrossomo, no lugar de um dos nutrientes constituintes do meio de cultura.

O coquetel de inibidores impediu o(a)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 107 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a6d', 'ENEM-2023-108', 6, 407, 'enem', 3, 2, 2023, 'multiple_choice', 'Circuitos e energia elétrica', 'O fogão por indução funciona a partir do surgimento de uma corrente elétrica induzida no fundo da panela, com consequente transformação de energia elétrica em calor por efeito Joule. A principal vantagem desses fogões é a eficiência energética, que é substancialmente maior que a dos fogões convencionais.
A corrente elétrica mencionada é induzida por', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 108 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a6e', 'ENEM-2023-109', 6, 412, 'enem', 3, 2, 2023, 'multiple_choice', 'Forças e leis de Newton', 'Uma academia decide trocar gradualmente seus aparelhos de musculação. Agora, os frequentadores que utilizam os aparelhos do tipo 1 podem também utilizar os aparelhos do tipo 2, representados na figura, para elevar cargas correspondentes às massas M1 e M2 com velocidade constante. A fim de que o exercício seja realizado com a mesma força F, os usuários devem ser orientados a respeito da relação entre as cargas nos dois tipos de aparelhos, já que as polias fixas apenas mudam a direção das forças, enquanto a polia móvel divide as forças.

Em ambos os aparelhos, considere as cordas inextensíveis, as massas das polias e das cordas desprezíveis e que não há dissipação de energia.

![](conteudo/enem/2023/109-e083688b.webp)

Para essa academia, qual deve ser a razão M2/M1 informada aos usuários?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 109 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a6f', 'ENEM-2023-110', 6, 412, 'enem', 3, 2, 2023, 'multiple_choice', 'Forças e leis de Newton', 'Um assistente de laboratório precisou descartar sete frascos contendo solução de nitrato de mercúrio(l) que não foram utilizados em uma aula prática. Cada frasco continha 5,25 g de Hg2(NO3)2 dissolvidos em água. Temendo a toxidez do mercúrio e sabendo que o Hg2Cl2 tem solubilidade muito baixa, o assistente optou por retirar o mercúrio da solução por precipitação com cloreto de sódio (NaCl), conforme a equação química:

![](conteudo/enem/2023/110-9874e4c1.webp)

Na dúvida sobre a massa de NaCl a ser utilizada, o assistente aumentou gradativamente a quantidade adicionada em cada frasco, como apresentado no quadro.

![](conteudo/enem/2023/110-f0ce2b28.webp)

O produto obtido em cada experimento foi filtrado, secado e teve sua massa aferida. O assistente organizou os resultados na forma de um gráfico que correlaciona a massa de NaCl adicionada com a massa de Hg2Cl2 obtida em cada frasco. A massa molar do Hg2(NO3)2 é 525 g mol\-1, a do NaCl é 58 g mol\-1 e a do Hg2Cl2 é 472 g mol\-1.

Qual foi o gráfico obtido pelo assistente de laboratório?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 110 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a70', 'ENEM-2023-111', 6, 415, 'enem', 3, 2, 2023, 'multiple_choice', 'Ondas, som e luz', '![](conteudo/enem/2023/111-9ae85aec.webp)

SOUSA. M. Disponível em: www.monica.com.br. Acesso em: 2 out. 2012 (adaptado)

Na tirinha de Mauricio de Sousa, os personagens Cebolinha e Cascão fazem uma brincadeira utilizando duas latas e um barbante. Ao perceberem que o som pode ser transmitido através do barbante, resolvem alterar o comprimento do barbante para ficar cada vez mais extenso. As demais condições permaneceram inalteradas durante a brincadeira.
Na prática, à medida que se aumenta o comprimento do barbante, ocorre a redução de qual característica da onda sonora?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 111 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a71', 'ENEM-2023-112', 6, 416, 'enem', 3, 2, 2023, 'multiple_choice', 'Lentes, espelhos e luz', 'Informações digitais — dados — são gravadas em discos ópticos, como CD e DVD, na forma de cavidades microscópicas. A gravação e a leitura óptica dessas informações são realizadas por um laser (fonte de luz monocromática). Quanto menores as dimensões dessas cavidades, mais dados são armazenados na mesma área do disco. O fator limitante para a leitura de dados é o espalhamento da luz pelo efeito de difração, fenômeno que ocorre quando a luz atravessa um obstáculo com dimensões da ordem de seu comprimento de onda. Essa limitação motivou o desenvolvimento de lasers com emissão em menores comprimentos de onda, possibilitando armazenar e ler dados em cavidades cada vez menores.
Em qual região espectral se situa o comprimento de onda do laser que otimiza o armazenamento e a leitura de dados em discos de uma mesma área?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 112 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a72', 'ENEM-2023-113', 7, 413, 'enem', 3, 2, 2023, 'multiple_choice', 'Átomo, tabela periódica e ligações', 'O bluetooth é uma tecnologia de comunicação sem fio, de curto alcance, presente em diferentes dispositivos eletrônicos de consumo. Ela permite que aparelhos eletrônicos diferentes se conectem e troquem dados entre si. No padrão bluetooth, denominado de Classe 2, as antenas transmitem sinais de potência igual a 2,4 mW e possibilitam conectar dois dispositivos distanciados até 10 m. Considere que essas antenas se comportam como fontes puntiformes que emitem ondas eletromagnéticas esféricas e que a intensidade do sinal é calculada pela potência por unidade de área. Considere 3 como valor aproximado para π. 
Para que o sinal de bluetooth seja detectado pelas antenas, o valor mínimo de sua intensidade, em W/m²?, e mais próximo de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 113 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a73', 'ENEM-2023-115', 5, 402, 'enem', 3, 2, 2023, 'multiple_choice', 'Plantas e fotossíntese', 'A biorremediação designa tratamentos que usam organismos para reduzir a quantidade de substâncias tóxicas no ambiente ou degradá-las em substâncias não tóxicas ou de menor toxicidade. Uma planta aquática, o aguapé, tem sido utilizada para a biorremediação de ambientes contaminados por metais tóxicos. Sabe-se que esses poluentes serão captados para dentro do corpo do vegetal.
Dentro do corpo do vegetal, esses contaminantes serão', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 115 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a74', 'ENEM-2023-116', 5, 406, 'enem', 3, 2, 2023, 'multiple_choice', 'Ecossistemas e relações ecológicas', 'O ciclo do nitrogênio é composto por várias etapas, conforme a figura, sendo cada uma desempenhada por um grupo específico de microrganismos.

![](conteudo/enem/2023/116-aab4b4fe.webp)

Se o grupo dos microrganismos decompositores fosse exterminado, qual etapa não ocorreria?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 116 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a75', 'ENEM-2023-117', 6, 415, 'enem', 3, 2, 2023, 'multiple_choice', 'Ondas, som e luz', 'Os raios cósmicos são fontes de radiação ionizante potencialmente perigosas para o organismo humano. Para quantificar a dose de radiação recebida, utiliza-se o sievert (Sv), definido como a unidade de energia recebida por unidade de massa. A exposição à radiação proveniente de raios cósmicos aumenta com a altitude, o que pode representar um problema para as tripulações de aeronaves. Recentemente, foram realizadas medições acuradas das doses de radiação ionizante para voos entre Rio de Janeiro e Roma.
Os resultados têm indicado que a dose média de radiação recebida na fase de cruzeiro (que geralmente representa 80% do tempo total de voo) desse trecho intercontinental é 2 μSv/h. As normas internacionais da aviação civil limitam em 1 000 horas por ano o tempo de trabalho para as tripulações que atuem em voos intercontinentais. Considere que a dose de radiação ionizante para uma radiografia torácica é estimada em 0,2 mSv.
RUAS, A. C. O tripulante de aeronaves e a radiação ionizante. São Paulo: Edição do Autor, 2019 (adaptado).
 
A quantas radiografias torácicas corresponde a dose de radiação ionizante à qual um tripulante que atue no trecho Rio de Janeiro−Roma é exposto ao longo de um ano?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 117 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a76', 'ENEM-2023-118', 7, 401, 'enem', 3, 2, 2023, 'multiple_choice', 'Funções e reações orgânicas', 'A gasolina é uma mistura de hidrocarbonetos de cadeias saturadas contendo de 8 a 12 átomos de carbono. Além disso, a gasolina de alto desempenho deve conter elevados teores de hidrocarbonetos de cadeias ramificadas, de forma a resistir à compressão e entrar em ignição apenas quando a vela aciona uma centelha elétrica no motor. No quadro, estão apresentados compostos que podem ser utilizados como combustíveis.

![](conteudo/enem/2023/118-5d656ef9.webp)

Entre esses compostos, aquele que conferirá maior desempenho como combustível é o', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 118 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a77', 'ENEM-2023-119', 6, 400, 'enem', 3, 2, 2023, 'multiple_choice', 'Calor e termodinâmica', 'De acordo com a Constituição Federal, é competencia dos municípios o gerenciamento dos serviços de limpeza e coleta dos resíduos urbanos (lixo). No entanto, há relatos de que parte desse lixo acaba sendo incinerado, liberando substâncias tóxicas para o ambiente e causando acidentes por explosões, principalmente quando ocorre a incineração de frascos de aerossóis (por exemplo: desodorantes, inseticidas e repelentes). A temperatura elevada provoca a vaporização de todo o conteúdo dentro desse tipo de frasco, aumentando a pressão em seu interior até culminar na explosão da embalagem.

ZVEIBIL, V. Z. et al. **Cartilha de limpeza urbana**. Disponível em: www.lbam.org.br. Acesso em: 6 jul. 2015 (adaptado).

Suponha um frasco metálico de um aerossol de capacidade igual a 100 mL, contendo 0,1 mol de produtos gasosos à temperatura de 650 °C, no momento da explosão.

![](conteudo/enem/2023/119-47913cea.webp)

A pressão, em atm, dentro do frasco, no momento da explosão, é mais próxima de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 119 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a78', 'ENEM-2023-120', 6, 407, 'enem', 3, 2, 2023, 'multiple_choice', 'Circuitos e energia elétrica', 'O circuito com três lâmpadas incandescentes idênticas, representado na figura, consiste em uma associação mista de resistores. Cada lâmpada (L1, L2, e L3) é associada, em paralelo, a um resistor de resistência R, formando um conjunto. Esses conjuntos são associados em série, tendo todas as lâmpadas o mesmo brilho quando ligadas à fonte de energia. Após vários dias em uso, apenas a lâmpada L2 queima, enquanto as demais permanecem acesas.

![](conteudo/enem/2023/120-80ceec42.webp)

Em relação à situação em que todas as lâmpadas funcionam, após a queima de L2, os brilhos das lâmpadas serão', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 120 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a79', 'ENEM-2023-121', 7, 401, 'enem', 3, 2, 2023, 'multiple_choice', 'Funções e reações orgânicas', 'Os solos amazônicos, ricos em silicato, não são apropriados para o cultivo por serem incapazes de reter nutrientes. Contudo, descobertas arqueológicas têm demonstrado que os antigos habitantes da Amazônia dominavam a técnica de preparo de um insumo agrícola natural, denominado terra preta. Esse insumo era constituído principalmente de uma espécie de biocarvão (biochar) obtido da queima de matéria orgânica, como troncos de árvores, pedaços de ossos e esterco, capaz de manter um solo fértil por anos.

Admite-se que o efeito do biocarvão na fertilização do solo estava, em parte, relacionado à presença de grupos orgânicos do tipo carboxilato em sua superfície, carregados negativamente (—COO–). Esses grupos atraem íons positivos necessários como nutrientes, tais quais os provenientes do potássio (K), do cálcio (Ca) e do magnésio (Mg), além de micronutrientes, como zinco (Zn) e ferro (Fe). Essa ligação no solo fertilizado é predominantemente iônica, conforme ilustra a figura, em que M\* representa os cátions metálicos. De acordo com a escala de Pauling, a eletronegatividade do elemento oxigênio é igual a 3,44

![](conteudo/enem/2023/121-7814f78a.webp)

O quadro apresenta os valores de eletronegatividade desses cinco elementos metálicos.

![](conteudo/enem/2023/121-1913a73f.webp)

MICHALOVIC, M. Ancient Soil Chemists of the Amazon. **ChemMatters**, fev. 2009 (adaptado).

O cátion que resultará em uma interação de maior caráter iônico com o ânion carboxilato será aquele proveniente do elemento', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 121 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a7a', 'ENEM-2023-122', 6, 400, 'enem', 3, 2, 2023, 'multiple_choice', 'Calor e termodinâmica', 'Em uma indústria alimentícia, para produção de doce de leite, utiliza-se um tacho de parede oca com uma entrada para vapor de água a 120 °C e uma saída para água líquida em equilíbrio com o vapor a 100 °C. Ao passar pela parte oca do tacho, o vapor de água transforma-se em líquido, liberando energia. A parede transfere essa energia para o interior do tacho, resultando na evaporação de água e consequente concentração do produto.
No processo de concentração do produto, é utilizada energia proveniente', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 122 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a7b', 'ENEM-2023-123', 7, 401, 'enem', 3, 2, 2023, 'multiple_choice', 'Funções e reações orgânicas', 'Entre os medicamentos mais comuns consumidos para o alívio da dor está o ibuprofeno, um composto quiral com ação anti-inflamatória e efeito analgésico, que é comercializado como fármaco opticamente puro, ou seja, sem a mistura com outro isômero óptico. A fórmula estrutural plana do ibuprofeno é:

![](conteudo/enem/2023/123-045ed5ac.webp)

Além do ibuprofeno, destacam-se também os princípios ativos a seguir, presentes em outros medicamentos para o alívio da dor:

![](conteudo/enem/2023/123-5b164bb7.webp)

O princípio ativo que apresenta o mesmo tipo de isomeria espacial que o ibuprofeno é o(a)', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 123 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a7c', 'ENEM-2023-124', 6, 409, 'enem', 3, 2, 2023, 'multiple_choice', 'Movimento', 'Uma concessionária é responsável por um trecho de 480 quilômetros de uma rodovia. Nesse trecho, foram construídas 10 praças de pedágio, onde funcionários recebem os pagamentos nas cabines de cobrança. Também existe o serviço automático, em que os veículos providos de um dispositivo passam por uma cancela, que se abre automaticamente, evitando filas e diminuindo o tempo de viagem. Segundo a concessionária, o tempo médio para efetuar a passagem em uma cabine é de 3 minutos, e as velocidades máximas permitidas na rodovia são 100 km/h, para veículos leves, e 80 km/h, para veículos de grande porte.
Considere um carro e um caminhão viajando, ambos com velocidades constantes e iguais às máximas permitidas, e que somente o caminhão tenha o serviço automático de cobrança. Comparado ao caminhão, quantos minutos a menos o carro leva para percorrer toda a rodovia?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 124 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a7d', 'ENEM-2023-125', 5, 403, 'enem', 3, 2, 2023, 'multiple_choice', 'DNA, genes e hereditariedade', '**Pais com síndrome de Down**

A síndrome de Down é uma alteração genética associada à trissomia do cromossomo 21, ou seja, o indivíduo possui três cromossomos 21 e não um par, como é normal. Isso ocorre pela união de um gameta contendo um cromossomo 21 com um gameta possuidor de dois cromossomos 21. Embora, normalmente, as mulheres com a síndrome sejam estéreis, em 2008, no interior de São Paulo, uma delas deu à luz uma menina sem a síndrome de Down

MORENO, T. **Três anos após dar à luz, mãe portadora de síndrome de Down revela detalhes de seu dia a dia**. Disponível em: www.band.uol.com.br. Acesso em: 31 out. 2013 (adaptado).

Sabendo disso, um jovem casal, ambos com essa síndrome, procura um médico especialista para aconselhamento genético porque querem ter um bebê.
O médico informa ao casal que, com relação ao cromossomo 21, os zigotos formados serão', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 125 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a7e', 'ENEM-2023-126', 5, 459, 'enem', 3, 2, 2023, 'multiple_choice', 'Célula e metabolismo', 'Para que uma molécula dê origem a um medicamento de administração oral, além de apresentar atividade farmacológica, deve ser capaz de atingir o local de ação. Para tanto, essa molécula não deve se degradar no estômago (onde o meio é fortemente ácido e há várias enzimas que reagem mediante catálise ácida), deve ser capaz de atravessar as membranas celulares e ser solúvel no plasma sanguíneo (sistema aquoso). Para os fármacos cujas estruturas são formadas por cadeias carbônicas longas contendo pelo menos um grupamento amino, um recurso tecnológico empregado é sua conversão no cloridrato correspondente. Essa conversão é representada, de forma genérica, pela equação química:

![](conteudo/enem/2023/126-b0c226d9.webp)

O aumento da eficiência de circulação do fármaco no sangue, promovido por essa conversão, deve-se ao incremento de seu(sua)', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 126 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a7f', 'ENEM-2023-127', 5, 459, 'enem', 3, 2, 2023, 'multiple_choice', 'Célula e metabolismo', '**Toxicidade do cianeto**

A produção de ATP depende do gradiente de prótons gerado pela cadeia respiratória. Nessas reações, os elétrons  
provenientes da oxidação do NADH em NAD+ percorrem a cadeia até chegarem à citocromo c oxidase reduzindo o  
Fe3+ a Fe2+. O oxigênio atua como aceptor final desses elétrons formando água. O cianeto é uma espécie química  
altamente tóxica que tem grande afinidade pelo Fe3+. Quando células são expostas ao cianeto, ele se liga ao sítio de  
Fe3+ da citocromo c oxidase, impedindo a sua conversão em Fe2+ e bloqueando a cadeia respiratória.

![](conteudo/enem/2023/127-97828514.webp)

ALBERTS, B. et al. **Biologia molecular da célula**. Porto Alegre: Artmed, 2010 (adaptado).

Esse bloqueio aumenta a concentração celular de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 127 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a80', 'ENEM-2023-128', 6, 415, 'enem', 3, 2, 2023, 'multiple_choice', 'Ondas, som e luz', 'É comum em viagens de avião sermos solicitados a desligar aparelhos cujo funcionamento envolva a emissão ou a recepção de ondas eletromagnéticas, como celulares. A justificativa dada para esse procedimento é, entre outras coisas, a necessidade de eliminar fontes de sinais eletromagnéticos que possam interferir nas comunicações, via rádio, dos pilotos com a torre de controle.

Essa interferência poderá ocorrer somente se as ondas emitidas pelo celular e as recebidas pelo rádio do avião', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 128 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a81', 'ENEM-2023-130', 6, 400, 'enem', 3, 2, 2023, 'multiple_choice', 'Calor e termodinâmica', 'Uma cafeteria adotou copos fabricados a partir de uma composição de 50% de plástico reciclado não biodegradável e 50% de casca de café. O copo é reutilizável e retornável, pois o material, semelhante a uma cerâmica, suporta a lavagem. Embora ele seja comercializado por um preço considerado alto quando comparado ao de um copo de plástico descartável, essa cafeteria possibilita aos clientes retornarem o copo sujo e levarem o café quente servido em outro copo já limpo e higienizado. O material desse copo oferece também o conforto de não esquentar na parte externa.

**Cafeteria adota copo reutilizável feito com casca de café.** Disponível em: www.gazetadopovo.com.br. Acesso em: 5 dez. 2019 (adaptado).

Quais duas vantagens esse copo apresenta em comparação ao copo descartável?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 130 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a82', 'ENEM-2023-131', 6, 412, 'enem', 3, 2, 2023, 'multiple_choice', 'Forças e leis de Newton', 'O consumo exagerado de refrigerantes é preocupante, pois contribui para o aumento de casos de obesidade e diabetes. Considere dois refrigerantes enlatados, um comum e um diet, e que ambos possuam a mesma quantidade de aditivos, exceto pela presença de açúcar. O refrigerante comum contém basicamente água carbonatada e grande quantidade de açúcar; já o refrigerante diet tem água carbonatada e adoçantes, cujas massas são muito pequenas.

CAVAGIS, A. D. M.; PEREIRA, E. A.; OLIVEIRA, L. C. Um método simples para avaliar o teor de sacarose e CO2 em refrigerantes. **Química Nova na Escola**, n. 3, ago. 2014 (adaptado).

Entre as duas versões apresentadas, o refrigerante comum possui', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 131 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a83', 'ENEM-2023-133', 7, 414, 'enem', 3, 2, 2023, 'multiple_choice', 'Química e ambiente', 'O descarte de detergentes comuns nos esgotos domésticos ocasiona a formação de uma camada de espuma que impede a entrada de oxigênio na água. Os microrganismos que vivem nessas águas não são capazes de quebrar moléculas ramificadas, ocorrendo assim um desequilíbrio ambiental nos rios. A fórmula a seguir representa a estrutura química de um tensoativo presente na composição de um detergente não biodegradável.

![](conteudo/enem/2023/133-51c8e3c3.webp)

**Tensoativo não biodegradável**

Qual modificação química na estrutura desse tensoativo o tornaria um detergente biodegradável?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 133 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a84', 'ENEM-2023-134', 5, 459, 'enem', 3, 2, 2023, 'multiple_choice', 'Célula e metabolismo', '**Avaliação de substâncias genotóxicas**

O ensaio de micronúcleos é um teste de avaliação de genotoxicidade que associa a presença de micronúcleos (pequenos núcleos que aparecem próximo aos núcleos das células) com lesões genéticas. Os micronúcleos são fragmentos de DNA encapsulados, provenientes do fuso mitótico durante a divisão celular.

DIAS, V. M. **Micronúcleos em células tumorais**: biologia e implicações  
para a tumorigênese. Dissertação de Mestrado. USP, 2006 (adaptado).

Os micronúcleos se originam dos(as)', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 134 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a85', 'ENEM-2023-135', 6, 415, 'enem', 3, 2, 2023, 'multiple_choice', 'Ondas, som e luz', 'O petróleo é uma matéria-prima muito valiosa e métodos geofísicos são úteis na sua prospecção. É possível identificar a composição de materiais estratificados medindo-se a velocidade de propagação do som (onda mecânica) através deles. Considere que uma camada de 450 m de um líquido se encontra presa no subsolo entre duas camadas rochosas, conforme o esquema. Um pulso acústico (que gera uma vibração mecânica) é emitido a partir da superfície do solo, onde são posteriormente recebidas duas vibrações refletidas (ecos). A primeira corresponde à reflexão do pulso na interface superior do líquido com a camada rochosa. A segunda vibração deve-se à reflexão do pulso na interface inferior. O tempo entre a emissão do pulso e a chegada do primeiro eco é de 0,5 s. O segundo eco chega 1,1 s após a emissão do pulso

![](conteudo/enem/2023/135-11f4c343.webp)

A velocidade do som na camada líquida, em metro por segundo, é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 135 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a86', 'ENEM-2023-136', 3, 449, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria espacial e volumes', 'Um artista plástico esculpe uma escultura a partir de um bloco de madeira de lei, em etapas. Inicialmente, esculpe um cone reto com 36 cm de altura e diâmetro da base medindo 18 cm. Em seguida, remove desse cone um cone menor, cujo diâmetro da base mede 6 cm, obtendo, assim, um tronco de cone, conforme ilustrado na figura.

![](conteudo/enem/2023/136-565c2d5a.webp)

Em seguida, perfura esse tronco de cone, removendo um cilindro reto, de diâmetro 6 cm, cujo eixo de simetria é o mesmo do cone original. Dessa forma, ao final, a escultura tem a forma de um tronco de cone com uma perfuração cilíndrica de base a base.  
O tipo de madeira utilizada para produzir essa escultura tem massa igual a 0,6 g por centímetro cúbico de volume. Utilize 3 como aproximação para π.

Qual é a massa, em grama, dessa escultura?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 136 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a87', 'ENEM-2023-137', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Os 100 funcionários de uma empresa estão distribuídos em dois setores: Produção e Administração.

Os funcionários de um mesmo setor recebem salários com valores iguais. O quadro apresenta a quantidade de funcionários por setor e seus respectivos salários.

![](conteudo/enem/2023/137-fc161c5c.webp)

A média dos salários dos 100 funcionários dessa empresa, em real, é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 137 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a88', 'ENEM-2023-138', 3, 453, 'enem', 3, 2, 2023, 'multiple_choice', 'Probabilidade', 'Visando atrair mais clientes, o gerente de uma loja anunciou uma promoção em que cada cliente que realizar uma compra pode ganhar um voucher para ser usado em sua próxima compra. Para ganhar seu voucher, o cliente precisa retirar, ao acaso, uma bolinha de dentro de cada uma das duas urnas A e B disponibilizadas pelo gerente, nas quais há apenas bolinhas pretas e brancas. Atualmente, a probabilidade de se escolher, ao acaso, uma bolinha preta na urna A é igual a 20% e a probabilidade de se escolher uma bolinha preta na urna B é 25%. Ganha o voucher o cliente que retirar duas bolinhas pretas, uma de cada urna.

Com o passar dos dias, o gerente percebeu que, para a promoção ser viável aos negócios, era preciso alterar a probabilidade de acerto do cliente sem alterar a regra da promoção. Para isso, resolveu alterar a quantidade de bolinhas brancas na urna B de forma que a probabilidade de um cliente ganhar o voucher passasse a ser menor ou igual a 1%. Sabe-se que a urna B tem 4 bolinhas pretas e que, em ambas as urnas, todas as bolinhas têm a mesma probabilidade de serem retiradas.

Qual é o número mínimo de bolinhas brancas que o gerente deve adicionar à urna B?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 138 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a89', 'ENEM-2023-139', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'O gerente de uma fábrica pretende comparar a evolução das vendas de dois produtos similares (I e II). Para isso, passou a verificar o número de unidades vendidas de cada um desses produtos em cada mês. Os resultados dessa verificação, para os meses de abril a junho, são apresentados na tabela.

![](conteudo/enem/2023/139-abba5cb1.webp)

O gerente estava decidido a cessar a produção do produto II no mês seguinte àquele em que as vendas do produto I superassem as do produto II.  
Suponha que a variação na quantidade de unidades vendidas dos produtos I e II se manteve, mês a mês, como no período representado na tabela.

Em qual mês o produto II parou de ser produzido?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 139 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a8a', 'ENEM-2023-140', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Uma empresa de transporte faz regularmente um levantamento do número de viagens realizadas durante o dia por todos os 160 motoristas cadastrados em seu aplicativo. Em um certo dia, foi gerado um relatório, por meio de um gráfico de barras, no qual se relacionaram a quantidade de motoristas com a quantidade de viagens realizadas até aquele instante do dia.

![](conteudo/enem/2023/140-846c1155.webp)

Comparando os valores da média, da mediana e da moda da distribuição das quantidades de viagens realizadas pelos motoristas cadastrados nessa empresa, obtém-se', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 140 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a8b', 'ENEM-2023-141', 3, 453, 'enem', 3, 2, 2023, 'multiple_choice', 'Probabilidade', 'Qual a probabilidade de o vencedor do sorteio ser um estudante do terceiro ano?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 141 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a8c', 'ENEM-2023-142', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Qual é a quantidade mínima de água, em litro, que cada morador, em média, deverá economizar por dia, de modo que o reservatório não fique sem água nos próximos 10 dias?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 142 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a8d', 'ENEM-2023-143', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'Em janeiro do ano passado, a direção de uma fábrica abriu uma creche para os filhos de seus funcionários, com 10 salas, cada uma com capacidade para atender 10 crianças a cada ano. As vagas são sorteadas entre os filhos dos funcionários inscritos, enquanto os não contemplados pelo sorteio formam uma lista de espera. No ano passado, a lista de espera teve 400 nomes e, neste ano, esse número cresceu 10%. A direção da fábrica realizou uma pesquisa e constatou que a lista de espera para o próximo ano terá a mesma quantidade de nomes da lista de espera deste ano. Decidiu, então, construir, ao longo desse ano, novas salas para a creche, também com capacidade de atendimento para 10 crianças cada, de modo que o número de nomes na lista de espera no próximo ano seja 25% menor que o deste ano.

O número mínimo de salas que deverão ser construídas é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 143 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a8e', 'ENEM-2023-144', 3, 449, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria espacial e volumes', 'A foto mostra a construção de uma cisterna destinada ao armazenamento de água. Uma cisterna como essa, na forma de cilindro circular reto com 3 m² de área da base, foi abastecida por um curso-d’água com vazão constante. O seu proprietário registrou a altura do nível da água no interior da cisterna durante o abastecimento em diferentes momentos de um mesmo dia, conforme o quadro.

![](conteudo/enem/2023/144-c606403f.webp)

![](conteudo/enem/2023/144-2107cabc.webp)

Disponível em: www.paraibamix.com. Acesso em: 3 dez. 2012.

Qual foi a vazão, em metro cúbico por hora, do curso-d’água que abasteceu a cisterna?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 144 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a8f', 'ENEM-2023-145', 3, 448, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria plana e áreas', 'Num certo momento de um jogo digital, a tela apresenta a imagem representada na figura. O ponto Q1 representa a posição de um jogador que está com a bola, os pontos Q2, Q3, Q4 , Q5 e Q6  
também indicam posições de jogadores da mesma equipe, e os pontos A e B indicam os dois pés da trave mais próxima deles. No momento da partida retratado, o jogador Q1 tem a posse da bola, que será passada para um dos outros jogadores das posições Qn, n ∈ {2, 3, 4, 5, 6}, cujo ângulo AQnB tenha a mesma medida do ângulo AQ1 B.

![](conteudo/enem/2023/145-f338280e.webp)

Qual é o jogador que receberá a bola?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 145 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a90', 'ENEM-2023-146', 3, 448, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria plana e áreas', '![](conteudo/enem/2023/146-74e0c851.webp)

Considere que os números colocados nos vértices do triângulo estejam em progressão aritmética de razão igual a 2.
Nas condições propostas, quais as possíveis soluções para as somas dos números que formam os lados do triângulo?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 146 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a91', 'ENEM-2023-147', 3, 446, 'enem', 3, 2, 2023, 'multiple_choice', 'Escalas, unidades e proporção', 'Alguns estudos comprovam que os carboidratos fornecem energia ao corpo, preservam as proteínas estruturais dos músculos durante a prática de atividade física e ainda dão força para o cérebro coordenar os movimentos, o que de fato tem impacto positivo no desenvolvimento do praticante. O ideal é consumir 1 grama de carboidrato para cada minuto de caminhada.
CIRINO, C. Boa pergunta: consumir carboidratos antes dos exercícios melhora o desempenho do atleta? Revista Saúde! É Vital, n. 330, nov. 2010 (adaptado).
Um casal realizará diariamente 30 minutos de caminhada, ingerindo, antes dessa atividade, a quantidade ideal de carboidratos recomendada. Para ter o consumo ideal apenas por meio do consumo de pão de fôrma integral, o casal planeja garantir o suprimento de pães para um período de 30 dias ininterruptos. Sabe-se que cada pacote desse pão vem com 18 fatias, e que cada uma delas tem 15 gramas de carboidratos.
A quantidade mínima de pacotes de pão de fôrma necessários para prover o suprimento a esse casal é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 147 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a92', 'ENEM-2023-148', 3, 448, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria plana e áreas', 'O mastro de uma bandeira foi instalado perpendicularmente ao solo em uma região plana. Devido aos fortes ventos, três cabos de aço, de mesmo comprimento, serão instalados para dar sustentação ao mastro. Cada cabo de aço ficará perfeitamente esticado, com uma extremidade num ponto P do mastro, a uma altura h do solo, e a outra extremidade, num ponto no chão, como mostra a figura.

![](conteudo/enem/2023/148-c6c6b6c4.webp)

Os cabos de aço formam um ângulo a com o plano do chão. Por medida de segurança, há apenas três opções de instalação:
• opção I: h = 11 m e a = 30°
• opção II: h = 12 m e a = 45°
• opção III: h = 18 m e a = 60°
A opção a ser escolhida é aquela em que a medida dos cabos seja a menor possível.
Qual será a medida, em metro, de cada um dos cabos a serem instalados?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 148 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a93', 'ENEM-2023-149', 3, 446, 'enem', 3, 2, 2023, 'multiple_choice', 'Escalas, unidades e proporção', 'Um controlador de voo dispõe de um instrumento que descreve a altitude de uma aeronave em voo, em função da distância em solo. Essa distância em solo é a medida na horizontal entre o ponto de origem do voo até o ponto que representa a projeção ortogonal da posição da aeronave, em voo, no solo. Essas duas grandezas são dadas numa mesma unidade de medida.

A tela do instrumento representa proporcionalmente as dimensões reais das distâncias associadas ao voo. A figura apresenta a tela do instrumento depois de concluída a viagem de um avião, sendo a medida do lado de cada quadradinho da malha igual a 1 cm.

![](conteudo/enem/2023/149-a88a534d.webp)

Essa tela apresenta os dados de um voo cuja maior altitude alcançada foi de 5 km.
A escala em que essa tela representa as medidas reais é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 149 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a94', 'ENEM-2023-150', 3, 447, 'enem', 3, 2, 2023, 'multiple_choice', 'Porcentagem e juros', 'Dirigir após ingerir bebidas alcoólicas é uma atitude extremamente perigosa, uma vez que, a partir da primeira dose, a pessoa já começa a ter perda de sensibilidade de movimentos e de reflexos. Apesar de a eliminação e absorção do álcool depender de cada pessoa e de como o organismo consegue metabolizar a substância, ao final da primeira hora após a ingestão, a concentração de álcool (C) no sangue corresponde a aproximadamente 90% da quantidade (q) de álcool ingerida, e a eliminação total dessa concentração pode demorar até 12 horas.

Disponível em: http://g1.globo.com. Acesso em: 1 dez. 2018 (adaptado).

Nessas condições, ao final da primeira hora após a ingestão da quantidade q de álcool, a concentração C dessa substância no sangue é expressa algebricamente por', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 150 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a95', 'ENEM-2023-151', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Um investidor iniciante observou o gráfico que apresenta a evolução dos valores de duas criptomoedas A e B em relação ao tempo.

![](conteudo/enem/2023/151-276495a3.webp)

Durante horas consecutivas, esses valores foram observados em nove instantes, representados por horas exatas.

Em quantos desses instantes a criptomoeda A estava mais valorizada do que a criptomoeda B?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 151 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a96', 'ENEM-2023-152', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'A exposição a alguns níveis sonoros pode causar lesões auditivas. Por isso, em uma indústria, são adotadas medidas preventivas de acordo com a máquina que o funcionário opera e o nível _N_ de intensidade do som, medido em decibel (dB), a que o operário é exposto, sendo ![](conteudo/enem/2023/152-30b0ee85.webp), _I_ a intensidade do som e ![](conteudo/enem/2023/152-40f43a4f.webp).

Disponível em: www.sofisica.com.br. Acesso em: 8 jul. 2015 (adaptado).

Quando o som é considerado baixo, ou seja, _N_ = 48 dB ou menos, deve ser utilizada a medida preventiva I. No caso de o som ser moderado, quando _N_ está no intervalo (48 dB, 55 dB), deve ser utilizada a medida preventiva II. Quando o som é moderado alto, que equivale a _N_ no intervalo (55 dB, 80 dB), a medida preventiva a ser usada é a III. Se _N_ estiver no intervalo (80 dB, 115 dB), quando o som é considerado alto, deve ser utilizada a medida preventiva IV. E se o som é considerado muito alto, com _N_ maior que 115 dB, deve-se utilizar a medida preventiva V.  
Uma nova máquina, com ![](conteudo/enem/2023/152-13f26008.webp), foi adquirida e será classificada de acordo com o nível de ruído que produz.  
Considere 0,3 como aproximação para ![](conteudo/enem/2023/152-717fdd2f.webp).

O funcionário que operará a nova máquina deverá adotar a medida preventiva', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 152 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a97', 'ENEM-2023-153', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'Um supermercado conta com cinco caixas disponíveis para pagamento. Foram instaladas telas que apresentam o tempo médio gasto por cada caixa para iniciar e finalizar o atendimento de cada cliente, e o número de pessoas presentes na fila de cada caixa em tempo real. Um cliente, na hora de passar sua compra, sabendo que cada um dos cinco caixas iniciará um novo atendimento naquele momento, pretende gastar o menor tempo possível de espera na fila. Ele observa que as telas apresentavam as informações a seguir.  
• Caixa I: atendimento 12 minutos, 5 pessoas na fila.  
• Caixa II: atendimento 6 minutos, 9 pessoas na fila.  
• Caixa III: atendimento 5 minutos, 6 pessoas na fila.  
• Caixa IV: atendimento 15 minutos, 2 pessoas na fila.  
• Caixa V: atendimento 9 minutos, 3 pessoas na fila.

Para alcançar seu objetivo, o cliente deverá escolher o caixa', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 153 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a98', 'ENEM-2023-154', 3, 448, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria plana e áreas', 'As figuras pintadas no quadro da sala de estar de uma residência representam as silhuetas de parte das torres de um castelo e, ao fundo, a de uma lua cheia. A lua foi pintada na forma de um círculo, e o telhado da torre mais alta, na forma de triângulo equilátero, foi pintado sobrepondo parte da lua. O centro da lua coincide com um dos vértices do telhado da torre mais alta.

![](conteudo/enem/2023/154-d39268bf.webp)

Nesse quadro, a parte da lua escondida atrás da torre mais alta do castelo pode ser representada por um', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 154 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a99', 'ENEM-2023-155', 3, 448, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria plana e áreas', 'Na planta baixa de um clube, a piscina é representada por um quadrado cuja área real mede 400 m². Ao redor dessa piscina, será construída uma calçada, de largura constante igual a 5 m.

![](conteudo/enem/2023/155-05746583.webp)

Qual é a medida da área, em metro quadrado, ocupada pela calçada?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 155 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a9a', 'ENEM-2023-156', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Uma pessoa caminha por 30 minutos e utiliza um aplicativo instalado em seu celular para monitorar a variação da intensidade do sinal de internet recebido pelo aparelho durante o deslocamento. Chegando ao seu destino, o aplicativo forneceu este gráfico:

![](conteudo/enem/2023/156-e9e0b793.webp)

Por quantos minutos, durante essa caminhada, o celular dessa pessoa ficou sem receber sinal de internet?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 156 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a9b', 'ENEM-2023-157', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Um professor, para promover a aprendizagem dos estudantes em estatística, propôs uma atividade. O objetivo era verificar o percentual de estudantes com massa corporal abaixo da média e altura acima da média de um grupo de estudantes. Para isso, usando uma balança e uma fita métrica, avaliou uma amostra de dez estudantes, anotando as medidas observadas. O gráfico apresenta a massa corporal, em quilograma, e a altura, em metro, obtidas na atividade

![](conteudo/enem/2023/157-13cfbc97.webp)

Após a coleta dos dados, os estudantes calcularam a média dos valores obtidos, referentes à massa corporal e à altura, obtendo, respectivamente, 80 kg e 1,65 m.

Qual é o percentual de estudantes dessa amostra com massa corporal abaixo da média e altura acima da média?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 157 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a9c', 'ENEM-2023-158', 3, 447, 'enem', 3, 2, 2023, 'multiple_choice', 'Porcentagem e juros', 'Um pescador tem um custo fixo diário de R$ 900,00 com combustível, iscas, manutenção de seu barco e outras pequenas despesas. Ele vende cada quilograma de peixe por R$ 5,00. Sua meta é obter um lucro mínimo de R$ 800,00 por dia. Sozinho, ele consegue, ao final de um dia de trabalho, pescar 180 kg de peixe, o que é suficiente apenas para cobrir o custo fixo diário. Portanto, precisa contratar ajudantes, pagando para cada um R$ 250,00 por dia de trabalho. Além desse valor, 4%dareceita obtida pela venda de peixe é repartida igualmente entre os ajudantes. Considerando o tamanho de seu barco, ele pode contratar até 5 ajudantes. Ele sabe que com um ajudante a pesca diária é de 300 kg e que, a partir do segundo ajudante contratado, aumenta-se em 100 kg a quantidade de peixe pescada por ajudante em um dia de trabalho.

A quantidade mínima de ajudantes que esse pescador precisa contratar para conseguir o lucro diário pretendido é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 158 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a9d', 'ENEM-2023-159', 3, 449, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria espacial e volumes', 'Um agricultor é informado sobre um método de proteção para sua lavoura que consiste em inserir larvas específicas, de rápida reprodução. A reprodução dessas larvas faz com que sua população multiplique-se por 10 a cada 3 dias e, para evitar eventuais desequilíbrios, é possível cessar essa reprodução aplicando-se um produto X. O agricultor decide iniciar esse método com 100 larvas e dispõe de 5 litros do produto X, cuja aplicação recomendada é de exatamente 1 litro para cada população de 200 000 larvas. A quantidade total do produto X de que ele dispõe deverá ser aplicada de uma única vez.

Quantos dias após iniciado esse método o agricultor deverá aplicar o produto X?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 159 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a9e', 'ENEM-2023-160', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'Ao realizar o cadastro em um aplicativo de investimentos, foi solicitado ao usuário que criasse uma senha, sendo permitido o uso somente dos seguintes caracteres:

• algarismos de 0 a 9;

• 26 letras minúsculas do alfabeto;

• 26 letras maiúsculas do alfabeto;

• 6 caracteres especiais !, @, #, $, \*, &.

Três tipos de estruturas para senha foram apresentadas ao usuário:

• tipo I: formada por quaisquer quatro caracteres distintos, escolhidos dentre os permitidos;

• tipo II: formada por cinco caracteres distintos, iniciando por três letras, seguidas por um algarismo e, ao final, um caractere especial;

• tipo III: formada por seis caracteres distintos, iniciando por duas letras, seguidas por dois algarismos e, ao final, dois caracteres especiais.

Considere ![](conteudo/enem/2023/160-a2d565c2.webp) as probabilidades de se descobrirem ao acaso, na primeira tentativa, as senhas dos tipos I, II e III, respectivamente.

Nessas condições, o tipo de senha que apresenta a menor probabilidade de ser descoberta ao acaso, na primeira tentativa, é o', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 160 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000a9f', 'ENEM-2023-161', 3, 447, 'enem', 3, 2, 2023, 'multiple_choice', 'Porcentagem e juros', 'Uma loja vende seus produtos de duas formas: à vista ou financiado em três parcelas mensais iguais. Para definir o valor dessas parcelas nas vendas financiadas, a loja aumenta em 20% o valor do produto à vista e divide esse novo valor por 3. A primeira parcela deve ser paga no ato da compra, e as duas últimas, em 30 e 60 dias após a compra.

Um cliente da loja decidiu comprar, de forma financiada, um produto cujo valor à vista é R$ 1 500,00.

Utilize 5,29 como aproximação para 28.

A taxa mensal de juros compostos praticada nesse financiamento é de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 161 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa0', 'ENEM-2023-162', 3, 449, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria espacial e volumes', 'Para concretar a laje de sua residência, uma pessoa contratou uma construtora. Tal empresa informa que o preço _y_ do concreto bombeado é composto de duas partes: uma fixa, chamada de taxa de bombeamento, e uma variável, que depende do volume _x_ de concreto utilizado. Sabe-se que a taxa de bombeamento custa R$ 500,00 e que o metro cúbico do concreto bombeado é de R$ 250,00.

A expressão que representa o preço y em função do volume x, em metro cúbico, é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 162 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa1', 'ENEM-2023-163', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Uma empresa de segurança domiciliar oferece o serviço de patrulha noturna, no qual vigilantes em motocicletas fazem o monitoramento periódico de residências. A empresa conta com uma base, de onde acompanha o trajeto realizado pelos vigilantes durante as patrulhas e orienta o deslocamento de equipes de reforço quando necessário. Numa patrulha rotineira, sem ocorrências, um vigilante conduziu sua motocicleta a uma velocidade constante durante todo o itinerário estabelecido, levando 30 minutos para conclusão. De acordo com os registros do GPS alocado na motocicleta, a distância da posição do vigilante à base, ao longo do tempo de realização do trajeto, é descrita pelo gráfico.

![](conteudo/enem/2023/163-ff0caefb.webp)

A vista superior da trajetória realizada pelo vigilante durante a patrulha registrada no gráfico é descrita pela representação', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 163 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa2', 'ENEM-2023-164', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'O gráfico expõe alguns números da gripe A-H1N1. Entre as categorias que estão em processo de imunização, uma já está completamente imunizada, a dos trabalhadores da saúde.

![](conteudo/enem/2023/164-194cf28a.webp)

Época, 26 abr. 2010 (adaptado).

De acordo com o gráfico, entre as demais categorias, a que está mais exposta ao vírus da gripe A-H1N1 é a categoria de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 164 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa3', 'ENEM-2023-165', 3, 448, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria plana e áreas', 'A figura representa uma escada com três degraus, construída em concreto maciço, com suas medidas especificadas.

![](conteudo/enem/2023/165-bf369224.webp)

Nessa escada, pisos e espelhos têm formato retangular, e as paredes laterais têm formato de um polígono cujos lados adjacentes são perpendiculares. Pisos, espelhos e paredes laterais serão revestidos em cerâmica.

A área a ser revestida em cerâmica, em metro quadrado, mede', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 165 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa4', 'ENEM-2023-166', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'Uma pessoa pratica quatro atividades físicas — caminhar, correr, andar de bicicleta e jogar futebol — como parte de seu programa de emagrecimento. Essas atividades são praticadas semanalmente de acordo com o quadro, que apresenta o número de horas diárias por atividade.

![](conteudo/enem/2023/166-80863c14.webp)

Ela deseja comemorar seu aniversário e escolhe o dia da semana em que o gasto calórico com as atividades físicas  praticadas for o maior. Para tanto, considera que os valores dos gastos calóricos das atividades por hora (cal/h) são os seguintes:

![](conteudo/enem/2023/166-e3d70b62.webp)

O dia da semana em que será comemorado o aniversário é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 166 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa5', 'ENEM-2023-167', 3, 447, 'enem', 3, 2, 2023, 'multiple_choice', 'Porcentagem e juros', 'A cada bimestre, a diretora de uma escola compra uma quantidade de folhas de papel ofício proporcional ao número de alunos matriculados. No bimestre passado, ela comprou 6 000 folhas para serem utilizadas pelos 1 200 alunos matriculados. Neste bimestre, alguns alunos cancelaram suas matrículas e a escola tem, agora, 1 150 alunos. A diretora só pode gastar R$ 220,00 nessa compra, e sabe que o fornecedor da escola vende as folhas de papel ofício em embalagens de 100 unidades a R$ 4,00 a embalagem. Assim, será preciso convencer o fornecedor a dar um desconto à escola, de modo que seja possível comprar a quantidade total de papel ofício necessária para o bimestre.

O desconto necessário no preço final da compra, em porcentagem, pertence ao intervalo', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 167 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa6', 'ENEM-2023-168', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'Em um colégio público, a admissão no primeiro ano se dá por sorteio. Neste ano há 55 candidatos, cujas inscrições são numeradas de 01 a 55. O sorteio de cada número de inscrição será realizado em etapas, utilizando-se duas urnas. Da primeira urna será sorteada uma bola, dentre bolas numeradas de 0 a 9, que representará o algarismo das unidades do número de inscrição a ser sorteado e, em seguida, da segunda urna, será sorteada uma bola para representar o algarismo das dezenas desse número. Depois do primeiro sorteio, e antes de se sortear o algarismo das dezenas, as bolas que estarão presentes na segunda urna serão apenas aquelas cujos números formam, com o algarismo já sorteado, um número de 01 a 55.

As probabilidades de os candidatos de inscrição número 50 e 02 serem sorteados são, respectivamente,', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 168 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa7', 'ENEM-2023-169', 3, 447, 'enem', 3, 2, 2023, 'multiple_choice', 'Porcentagem e juros', 'O esquema mostra como a intensidade luminosa decresce com o aumento da profundidade em um rio, sendo ![](conteudo/enem/2023/169-76239f15.webp) a intensidade na sua superfície.

![](conteudo/enem/2023/169-3af229c8.webp)

Considere que a intensidade luminosa diminui, a cada metro acrescido na profundidade, segundo o mesmo padrão do esquema.

A intensidade luminosa correspondente à profundidade de 6 m é igual a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 169 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa8', 'ENEM-2023-170', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'Analisando as vendas de uma empresa, o gerente concluiu que o montante diário arrecadado, em milhar de real, poderia ser calculado pela expressão ![](conteudo/enem/2023/170-369b24e4.webp) , em que os valores de x representam os dias do mês, variando de 1 a 30.

Um dos fatores para avaliar o desempenho mensal da empresa é verificar qual é o menor montante diário ![](conteudo/enem/2023/170-b158b079.webp) arrecadado ao longo do mês e classificar o desempenho conforme as categorias apresentadas a seguir, em que as quantidades estão expressas em milhar de real.

![](conteudo/enem/2023/170-e7404490.webp)

No caso analisado, qual seria a classificação do desempenho da empresa?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2023 · 2º dia · Questão 170 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aa9', 'ENEM-2023-171', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'O calendário maia apresenta duas contagens simultâneas de anos, o chamado ano Tzolkim, composto por 260 dias e que determinava o calendário religioso, e o ano Haab, composto por 365 dias e que determinava o calendário agrícola. Um historiador encontrou evidências de que gerações de uma mesma família governaram certa comunidade maia pelo período de 20 ciclos, sendo cada ciclo formado por 52 anos Haab.

Disponível em: www.suapesquisa.com. Acesso em: 20 ago. 2014.

De acordo com as informações fornecidas, durante quantos anos Tzolkim aquela comunidade maia foi governada por tal família?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 171 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aaa', 'ENEM-2023-172', 3, 448, 'enem', 3, 2, 2023, 'multiple_choice', 'Geometria plana e áreas', 'Sejam _a_, _b_ e _c_ as medidas dos lados de um triângulo retângulo, tendo a como medida da hipotenusa. Esses valores _a_, _b_ e _c_ são, respectivamente, os diâmetros dos círculos _C1_ , _C2_ e _C3_, como apresentados na figura.

![](conteudo/enem/2023/172-dcdd2743.webp)

Observe que essa construção assegura, pelo teorema de Pitágoras, que área (C1) = área (C2) + área (C3).

Um professor de matemática era conhecedor dessa construção e, confraternizando com dois amigos em uma pizzaria onde são vendidas pizzas somente em formato de círculo, lançou um desafio: mesmo sem usar um instrumento de medição, poderia afirmar com certeza se a área do círculo correspondente à pizza que ele pedisse era maior, igual ou menor do que a soma das áreas das pizzas dos dois amigos. Assim, foram pedidas três pizzas. O professor as dividiu ao meio e formou um triângulo com os diâmetros das pizzas, conforme indicado na figura.

![](conteudo/enem/2023/172-8bd02f79.webp)

A partir da medida do ângulo a, o professor afirmou que a área de sua pizza é maior do que a soma das áreas das outras duas pizzas.

A área da pizza do professor de matemática é maior do que a soma das áreas das outras duas pizzas, pois', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 172 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aab', 'ENEM-2023-173', 3, 446, 'enem', 3, 2, 2023, 'multiple_choice', 'Escalas, unidades e proporção', 'Entre maratonistas, um parâmetro utilizado é o de economia de corrida (EC). O valor desse parâmetro é calculado pela razão entre o consumo de oxigênio, em mililitro (mL) por minuto (min), e a massa, em quilograma (kg), do atleta correndo a uma velocidade constante.

Disponível em: www.treinamentoonline.com.br. Acesso em: 23 out. 2019 (adaptado).

Um maratonista, visando melhorar sua performance, auxiliado por um médico, mensura o seu consumo de oxigênio por minuto a velocidade constante. Com base nesse consumo e na massa do atleta, o médico calcula o EC do atleta.
A unidade de medida da grandeza descrita pelo parâmetro EC é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 173 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aac', 'ENEM-2023-175', 3, 446, 'enem', 3, 2, 2023, 'multiple_choice', 'Escalas, unidades e proporção', 'O metrô de um município oferece dois tipos de tíquetes com colorações diferentes, azul e vermelha, sendo vendidos em cartelas, cada qual com nove tíquetes da mesma cor e mesmo valor unitário. Duas cartelas de tíquetes azuis e uma cartela de tíquetes vermelhos são vendidas por R$ 32,40. Sabe-se que o preço de um tíquete azul menos o preço de um tíquete vermelho é igual ao preço de um tíquete vermelho mais cinco centavos.

Qual o preço, em real, de uma cartela de tíquetes vermelhos?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 175 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aad', 'ENEM-2023-176', 3, 451, 'enem', 3, 2, 2023, 'multiple_choice', 'Números e operações', 'Os números figurados pentagonais provavelmente foram introduzidos pelos pitagóricos por volta do século V a.C. As figuras ilustram como obter os seis primeiros deles, sendo os demais obtidos seguindo o mesmo padrão geométrico.

![](conteudo/enem/2023/176-d21e916b.webp)

O oitavo número pentagonal é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2023 · 2º dia · Questão 176 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aae', 'ENEM-2023-177', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'A figura ilustra uma roda-gigante no exato instante em que a cadeira onde se encontra a pessoa P está no ponto mais alto dessa roda-gigante.

![](conteudo/enem/2023/177-27c49bd5.webp)

Com o passar do tempo, à medida que a roda-gigante gira, com velocidade angular constante e no sentido horário, a altura da cadeira onde se encontra a pessoa P, em relação ao solo, vai se alterando.

O gráfico que melhor representa a variação dessa altura, em função do tempo, contado a partir do instante em que a cadeira da pessoa P se encontra na posição mais alta da roda-gigante, é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2023 · 2º dia · Questão 177 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aaf', 'ENEM-2023-178', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Estudantes trabalhando com robótica criaram uma “torneira inteligente” que automatiza sua abertura e seu fechamento durante a limpeza das mãos. A tecnologia funciona da seguinte forma: ao se colocarem as mãos sob a torneira, ela libera água durante 3 segundos para que a pessoa possa molhá-las. Em seguida, interrompe o fornecimento de água por 5 segundos, enquanto a pessoa ensaboa suas mãos, e finaliza o ciclo liberando água para o enxágue por mais 3 segundos. Considere o tempo (_t_), em segundo, contado a partir do instante em que se inicia o ciclo. A vazão de água nessa torneira é constante.

Um esboço de gráfico que descreve o volume de água acumulado, em litro, liberado por essa torneira durante um ciclo de lavagem das mãos, em função do tempo (t), em segundo, é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2023 · 2º dia · Questão 178 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab0', 'ENEM-2023-179', 3, 468, 'enem', 3, 2, 2023, 'multiple_choice', 'Progressões', 'As características culturais variam de povo para povo. Há notícias de um povo que possuía formas de contar diferentes das nossas, como indicado no quadrinho a seguir.

![](conteudo/enem/2023/179-d2b83dd3.webp)

Segundo o padrão de contagem indicado na figura, as representações dos numerais cinco e sete, nessa cultura, devem ser, respectivamente,', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 179 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab1', 'ENEM-2023-180', 3, 105, 'enem', 3, 2, 2023, 'multiple_choice', 'Média, moda e mediana', 'Um tipo de semente necessita de bastante água nos dois primeiros meses após o plantio. Um produtor pretende estabelecer o melhor momento para o plantio desse tipo de semente, nos meses de outubro a março. Após consultar a previsão do índice mensal de precipitação de chuva (ImPC) da região onde ocorrerá o plantio, para o período chuvoso de 2020-2021, ele obteve os seguintes dados:  
• outubro/2020: ImPC = 250 mm;  
• novembro/2020: ImPC = 150 mm;  
• dezembro/2020: ImPC = 200 mm;  
• janeiro/2021: ImPC = 450 mm;  
• fevereiro/2021: ImPC = 100 mm;  
• março/2021: ImPC = 200 mm.

Com base nessas previsões, ele precisa escolher dois meses consecutivos em que a média mensal de precipitação seja a maior possível.

No início de qual desses meses o produtor deverá plantar esse tipo de semente?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2023 · 2º dia · Questão 180 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab2', 'CO-CMA-00001', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu a fundação de São Luís?', '1612: fundação de São Luís pelos franceses, liderados por Daniel de La Touche.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab3', 'CO-CMA-00002', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu a expulsão dos franceses do Maranhão?', '1615: expulsão dos franceses de São Luís pelos portugueses.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab4', 'CO-CMA-00003', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu a criação do Estado do Maranhão?', '1621: criação do Estado do Maranhão, separado do Estado do Brasil.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab5', 'CO-CMA-00004', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu a invasão holandesa de São Luís?', '1641: ocupação de São Luís pelos holandeses.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab6', 'CO-CMA-00005', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu a Revolta de Beckman?', '1684: Revolta de Beckman, contra o monopólio da Companhia de Comércio do Estado do Maranhão.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab7', 'CO-CMA-00006', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu a adesão do Maranhão à Independência?', '1823: adesão do Maranhão à Independência do Brasil, em 28 de julho.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab8', 'CO-CMA-00007', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu o início da Balaiada?', '1838: início da Balaiada, revolta popular no período regencial.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ab9', 'CO-CMA-00008', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu o título de Patrimônio Mundial ao Centro Histórico de São Luís?', '1997: reconhecimento do Centro Histórico de São Luís como Patrimônio Mundial pela UNESCO.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aba', 'CO-CMA-00009', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Em que ano ocorreu o título de Patrimônio Imaterial da Humanidade ao Bumba meu boi?', '2019: reconhecimento do Bumba meu boi do Maranhão como Patrimônio Cultural Imaterial da Humanidade.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000abb', 'CO-CMA-00010', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 1612 está ligado a qual fato?', '1612: fundação de São Luís pelos franceses, liderados por Daniel de La Touche.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000abc', 'CO-CMA-00011', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 1615 está ligado a qual fato?', '1615: expulsão dos franceses de São Luís pelos portugueses.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000abd', 'CO-CMA-00012', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 1621 está ligado a qual fato?', '1621: criação do Estado do Maranhão, separado do Estado do Brasil.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000abe', 'CO-CMA-00013', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 1641 está ligado a qual fato?', '1641: ocupação de São Luís pelos holandeses.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000abf', 'CO-CMA-00014', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 1684 está ligado a qual fato?', '1684: Revolta de Beckman, contra o monopólio da Companhia de Comércio do Estado do Maranhão.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac0', 'CO-CMA-00015', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 1823 está ligado a qual fato?', '1823: adesão do Maranhão à Independência do Brasil, em 28 de julho.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac1', 'CO-CMA-00016', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 1838 está ligado a qual fato?', '1838: início da Balaiada, revolta popular no período regencial.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac2', 'CO-CMA-00017', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 1997 está ligado a qual fato?', '1997: reconhecimento do Centro Histórico de São Luís como Patrimônio Mundial pela UNESCO.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac3', 'CO-CMA-00018', 17, 478, 'concurso', 2, 60, 2026, 'multiple_choice', 'Datas e fatos', 'Na história do Maranhão, o ano de 2019 está ligado a qual fato?', '2019: reconhecimento do Bumba meu boi do Maranhão como Patrimônio Cultural Imaterial da Humanidade.', 'Monte uma linha do tempo: França Equinocial (1612), Beckman (1684), Adesão (1823), Balaiada (1838).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac4', 'CO-CMA-00019', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Qual episódio da história maranhense é descrito a seguir? "Revolta popular de 1838 a 1841, com vaqueiros, escravizados e sertanejos pobres, reprimida pelas tropas de Luís Alves de Lima e Silva."', 'Balaiada: revolta popular de 1838 a 1841, com vaqueiros, escravizados e sertanejos pobres, reprimida pelas tropas de Luís Alves de Lima e Silva.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac5', 'CO-CMA-00020', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Qual episódio da história maranhense é descrito a seguir? "Movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman."', 'Revolta de Beckman: movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac6', 'CO-CMA-00021', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Qual episódio da história maranhense é descrito a seguir? "Projeto colonial francês que deu origem à cidade de São Luís em 1612."', 'França Equinocial: projeto colonial francês que deu origem à cidade de São Luís em 1612.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac7', 'CO-CMA-00022', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Qual episódio da história maranhense é descrito a seguir? "Fato de 28 de julho de 1823, quando o Maranhão passou a integrar o Brasil independente."', 'Adesão à Independência: fato de 28 de julho de 1823, quando o Maranhão passou a integrar o Brasil independente.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac8', 'CO-CMA-00023', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Qual episódio da história maranhense é descrito a seguir? "Empresa que detinha o monopólio do comércio na região e provocou revolta em 1684."', 'Companhia de Comércio do Estado do Maranhão: empresa que detinha o monopólio do comércio na região e provocou revolta em 1684.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ac9', 'CO-CMA-00024', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Qual episódio da história maranhense é descrito a seguir? "Ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses."', 'Invasão holandesa: ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aca', 'CO-CMA-00025', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Sobre a Balaiada, é correto afirmar que se trata de:', 'Balaiada: revolta popular de 1838 a 1841, com vaqueiros, escravizados e sertanejos pobres, reprimida pelas tropas de Luís Alves de Lima e Silva.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000acb', 'CO-CMA-00026', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Sobre a Revolta de Beckman, é correto afirmar que se trata de:', 'Revolta de Beckman: movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000acc', 'CO-CMA-00027', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Sobre a França Equinocial, é correto afirmar que se trata de:', 'França Equinocial: projeto colonial francês que deu origem à cidade de São Luís em 1612.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000acd', 'CO-CMA-00028', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Sobre a Adesão à Independência, é correto afirmar que se trata de:', 'Adesão à Independência: fato de 28 de julho de 1823, quando o Maranhão passou a integrar o Brasil independente.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ace', 'CO-CMA-00029', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Sobre a Companhia de Comércio do Estado do Maranhão, é correto afirmar que se trata de:', 'Companhia de Comércio do Estado do Maranhão: empresa que detinha o monopólio do comércio na região e provocou revolta em 1684.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000acf', 'CO-CMA-00030', 17, 479, 'concurso', 3, 60, 2026, 'multiple_choice', 'Revoltas e movimentos', 'Sobre a Invasão holandesa, é correto afirmar que se trata de:', 'Invasão holandesa: ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses.', 'Associe cada movimento ao seu período: colonial, imperial ou regencial.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad0', 'CO-CMA-00031', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: rio que marca a divisa entre o Maranhão e o Piauí?', 'Rio Parnaíba: rio que marca a divisa entre o Maranhão e o Piauí.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad1', 'CO-CMA-00032', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: rio que marca boa parte da divisa entre o Maranhão e o Pará?', 'Rio Gurupi: rio que marca boa parte da divisa entre o Maranhão e o Pará.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad2', 'CO-CMA-00033', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz?', 'Rio Tocantins: rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad3', 'CO-CMA-00034', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: rio que nasce no sul do estado, atravessa cidades como Caxias e Codó e deságua na baía de São José?', 'Rio Itapecuru: rio que nasce no sul do estado, atravessa cidades como Caxias e Codó e deságua na baía de São José.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad4', 'CO-CMA-00035', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos?', 'Rio Mearim: rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad5', 'CO-CMA-00036', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas?', 'Lençóis Maranhenses: parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad6', 'CO-CMA-00037', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: grande reentrância do litoral formada pelas baías de São Marcos e de São José?', 'Golfão Maranhense: grande reentrância do litoral formada pelas baías de São Marcos e de São José.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad7', 'CO-CMA-00038', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa?', 'Ilha de Upaon-Açu: ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad8', 'CO-CMA-00039', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: litoral recortado do noroeste do estado, com extensos manguezais?', 'Reentrâncias Maranhenses: litoral recortado do noroeste do estado, com extensos manguezais.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ad9', 'CO-CMA-00040', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Qual elemento da geografia maranhense corresponde à descrição: parque nacional no sul do estado, perto de Carolina, conhecido por cachoeiras e morros tabulares?', 'Chapada das Mesas: parque nacional no sul do estado, perto de Carolina, conhecido por cachoeiras e morros tabulares.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ada', 'CO-CMA-00041', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Rio Parnaíba é:', 'Rio Parnaíba: rio que marca a divisa entre o Maranhão e o Piauí.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000adb', 'CO-CMA-00042', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Rio Gurupi é:', 'Rio Gurupi: rio que marca boa parte da divisa entre o Maranhão e o Pará.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000adc', 'CO-CMA-00043', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Rio Tocantins é:', 'Rio Tocantins: rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000add', 'CO-CMA-00044', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Rio Itapecuru é:', 'Rio Itapecuru: rio que nasce no sul do estado, atravessa cidades como Caxias e Codó e deságua na baía de São José.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ade', 'CO-CMA-00045', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Rio Mearim é:', 'Rio Mearim: rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000adf', 'CO-CMA-00046', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Lençóis Maranhenses é:', 'Lençóis Maranhenses: parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae0', 'CO-CMA-00047', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Golfão Maranhense é:', 'Golfão Maranhense: grande reentrância do litoral formada pelas baías de São Marcos e de São José.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae1', 'CO-CMA-00048', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Ilha de Upaon-Açu é:', 'Ilha de Upaon-Açu: ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae2', 'CO-CMA-00049', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Reentrâncias Maranhenses é:', 'Reentrâncias Maranhenses: litoral recortado do noroeste do estado, com extensos manguezais.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae3', 'CO-CMA-00050', 17, 481, 'concurso', 2, 60, 2026, 'multiple_choice', 'Rios e paisagens', 'Na geografia do Maranhão, o(a) Chapada das Mesas é:', 'Chapada das Mesas: parque nacional no sul do estado, perto de Carolina, conhecido por cachoeiras e morros tabulares.', 'Divisas: Parnaíba (Piauí), Tocantins (Tocantins) e Gurupi (Pará).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae4', 'CO-CMA-00051', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'No Maranhão, qual bioma ou ecossistema corresponde a: bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará?', 'Amazônia: bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae5', 'CO-CMA-00052', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'No Maranhão, qual bioma ou ecossistema corresponde a: bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja?', 'Cerrado: bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae6', 'CO-CMA-00053', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'No Maranhão, qual bioma ou ecossistema corresponde a: bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí?', 'Caatinga: bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae7', 'CO-CMA-00054', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'No Maranhão, qual bioma ou ecossistema corresponde a: ecossistema do litoral maranhense, importante berçário de peixes e crustáceos?', 'Manguezal: ecossistema do litoral maranhense, importante berçário de peixes e crustáceos. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae8', 'CO-CMA-00055', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'No Maranhão, qual bioma ou ecossistema corresponde a: formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba?', 'Mata dos Cocais: formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ae9', 'CO-CMA-00056', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'Sobre a presença do(a) Amazônia no território maranhense, é correto dizer que é o:', 'Amazônia: bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aea', 'CO-CMA-00057', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'Sobre a presença do(a) Cerrado no território maranhense, é correto dizer que é o:', 'Cerrado: bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aeb', 'CO-CMA-00058', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'Sobre a presença do(a) Caatinga no território maranhense, é correto dizer que é o:', 'Caatinga: bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aec', 'CO-CMA-00059', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'Sobre a presença do(a) Manguezal no território maranhense, é correto dizer que é o:', 'Manguezal: ecossistema do litoral maranhense, importante berçário de peixes e crustáceos. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aed', 'CO-CMA-00060', 17, 482, 'concurso', 2, 60, 2026, 'multiple_choice', 'Biomas e ecossistemas', 'Sobre a presença do(a) Mata dos Cocais no território maranhense, é correto dizer que é o:', 'Mata dos Cocais: formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba. O Maranhão é uma área de transição entre Amazônia, Cerrado e Caatinga.', 'O Maranhão fica na transição entre o Norte e o Nordeste.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aee', 'CO-CMA-00061', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor"?', 'São Luís: capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor". O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aef', 'CO-CMA-00062', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: segunda cidade mais populosa do Maranhão, às margens do rio Tocantins?', 'Imperatriz: segunda cidade mais populosa do Maranhão, às margens do rio Tocantins. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af0', 'CO-CMA-00063', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: cidade do leste maranhense onde nasceu o poeta Gonçalves Dias?', 'Caxias: cidade do leste maranhense onde nasceu o poeta Gonçalves Dias. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af1', 'CO-CMA-00064', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba?', 'Timon: cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af2', 'CO-CMA-00065', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira?', 'Alcântara: cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af3', 'CO-CMA-00066', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: principal porta de entrada do Parque Nacional dos Lençóis Maranhenses?', 'Barreirinhas: principal porta de entrada do Parque Nacional dos Lençóis Maranhenses. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af4', 'CO-CMA-00067', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: cidade do sul do Maranhão, polo da produção de soja no Cerrado?', 'Balsas: cidade do sul do Maranhão, polo da produção de soja no Cerrado. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af5', 'CO-CMA-00068', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: cidade do sul do estado, porta de entrada da Chapada das Mesas?', 'Carolina: cidade do sul do estado, porta de entrada da Chapada das Mesas. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af6', 'CO-CMA-00069', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'Qual município maranhense corresponde à descrição: cidade da Ilha de Upaon-Açu conhecida pelo santuário do padroeiro do Maranhão?', 'São José de Ribamar: cidade da Ilha de Upaon-Açu conhecida pelo santuário do padroeiro do Maranhão. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af7', 'CO-CMA-00070', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de São Luís é conhecido por ser:', 'São Luís: capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor". O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af8', 'CO-CMA-00071', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de Imperatriz é conhecido por ser:', 'Imperatriz: segunda cidade mais populosa do Maranhão, às margens do rio Tocantins. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000af9', 'CO-CMA-00072', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de Caxias é conhecido por ser:', 'Caxias: cidade do leste maranhense onde nasceu o poeta Gonçalves Dias. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000afa', 'CO-CMA-00073', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de Timon é conhecido por ser:', 'Timon: cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000afb', 'CO-CMA-00074', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de Alcântara é conhecido por ser:', 'Alcântara: cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000afc', 'CO-CMA-00075', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de Barreirinhas é conhecido por ser:', 'Barreirinhas: principal porta de entrada do Parque Nacional dos Lençóis Maranhenses. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000afd', 'CO-CMA-00076', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de Balsas é conhecido por ser:', 'Balsas: cidade do sul do Maranhão, polo da produção de soja no Cerrado. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000afe', 'CO-CMA-00077', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de Carolina é conhecido por ser:', 'Carolina: cidade do sul do estado, porta de entrada da Chapada das Mesas. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000aff', 'CO-CMA-00078', 17, 483, 'concurso', 2, 60, 2026, 'multiple_choice', 'Municípios', 'O município de São José de Ribamar é conhecido por ser:', 'São José de Ribamar: cidade da Ilha de Upaon-Açu conhecida pelo santuário do padroeiro do Maranhão. O Maranhão tem 217 municípios.', 'Pense na localização: litoral, ilha, leste (Parnaíba) ou sul (Cerrado).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b00', 'CO-CMA-00079', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Qual manifestação da cultura maranhense é descrita a seguir: festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019?', 'Bumba meu boi: festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b01', 'CO-CMA-00080', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Qual manifestação da cultura maranhense é descrita a seguir: dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007?', 'Tambor de crioula: dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b02', 'CO-CMA-00081', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Qual manifestação da cultura maranhense é descrita a seguir: dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís?', 'Cacuriá: dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b03', 'CO-CMA-00082', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Qual manifestação da cultura maranhense é descrita a seguir: celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara?', 'Festa do Divino Espírito Santo: celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b04', 'CO-CMA-00083', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Qual manifestação da cultura maranhense é descrita a seguir: gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira"?', 'Reggae maranhense: gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira".', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b05', 'CO-CMA-00084', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Qual manifestação da cultura maranhense é descrita a seguir: prato típico feito com vinagreira, gergelim e camarão seco?', 'Arroz de cuxá: prato típico feito com vinagreira, gergelim e camarão seco.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b06', 'CO-CMA-00085', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Qual manifestação da cultura maranhense é descrita a seguir: trabalhadoras extrativistas que vivem da coleta e quebra do coco de uma palmeira típica do estado?', 'Quebradeiras de coco babaçu: trabalhadoras extrativistas que vivem da coleta e quebra do coco de uma palmeira típica do estado.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b07', 'CO-CMA-00086', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Na cultura do Maranhão, o(a) Bumba meu boi é:', 'Bumba meu boi: festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b08', 'CO-CMA-00087', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Na cultura do Maranhão, o(a) Tambor de crioula é:', 'Tambor de crioula: dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b09', 'CO-CMA-00088', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Na cultura do Maranhão, o(a) Cacuriá é:', 'Cacuriá: dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b0a', 'CO-CMA-00089', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Na cultura do Maranhão, o(a) Festa do Divino Espírito Santo é:', 'Festa do Divino Espírito Santo: celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b0b', 'CO-CMA-00090', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Na cultura do Maranhão, o(a) Reggae maranhense é:', 'Reggae maranhense: gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira".', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b0c', 'CO-CMA-00091', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Na cultura do Maranhão, o(a) Arroz de cuxá é:', 'Arroz de cuxá: prato típico feito com vinagreira, gergelim e camarão seco.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b0d', 'CO-CMA-00092', 17, 485, 'concurso', 2, 60, 2026, 'multiple_choice', 'Festas, danças e culinária', 'Na cultura do Maranhão, o(a) Quebradeiras de coco babaçu é:', 'Quebradeiras de coco babaçu: trabalhadoras extrativistas que vivem da coleta e quebra do coco de uma palmeira típica do estado.', 'Bumba meu boi: UNESCO (2019). Tambor de crioula: IPHAN (2007).', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b0e', 'CO-CMA-00093', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'Qual escritor maranhense é autor de "Canção do Exílio" e "I-Juca-Pirama"?', 'Gonçalves Dias (nascido em Caxias) escreveu "Canção do Exílio" e "I-Juca-Pirama". A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b0f', 'CO-CMA-00094', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'Qual escritor maranhense é autor de "O Mulato", marco do Naturalismo no Brasil?', 'Aluísio Azevedo (nascido em São Luís) escreveu "O Mulato", marco do Naturalismo no Brasil. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b10', 'CO-CMA-00095', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'Qual escritor maranhense é autor de "Poema Sujo", escrito no exílio em Buenos Aires?', 'Ferreira Gullar (nascido em São Luís) escreveu "Poema Sujo", escrito no exílio em Buenos Aires. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b11', 'CO-CMA-00096', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'Qual escritor maranhense é autor de "Os Tambores de São Luís"?', 'Josué Montello (nascido em São Luís) escreveu "Os Tambores de São Luís". A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b12', 'CO-CMA-00097', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'Qual escritor maranhense é autor de "Canaã", romance pré-modernista?', 'Graça Aranha (nascido em São Luís) escreveu "Canaã", romance pré-modernista. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b13', 'CO-CMA-00098', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'Qual escritor maranhense é autor de "O Guesa", poema longo do Romantismo?', 'Sousândrade (nascido em Guimarães) escreveu "O Guesa", poema longo do Romantismo. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b14', 'CO-CMA-00099', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'Qual escritor maranhense é autor de vasta obra de romances e contos, como "Rei Negro"?', 'Coelho Neto (nascido em Caxias) escreveu vasta obra de romances e contos, como "Rei Negro". A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b15', 'CO-CMA-00100', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'O escritor Gonçalves Dias, nascido em Caxias, é autor de:', 'Gonçalves Dias (nascido em Caxias) escreveu "Canção do Exílio" e "I-Juca-Pirama". A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b16', 'CO-CMA-00101', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'O escritor Aluísio Azevedo, nascido em São Luís, é autor de:', 'Aluísio Azevedo (nascido em São Luís) escreveu "O Mulato", marco do Naturalismo no Brasil. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b17', 'CO-CMA-00102', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'O escritor Ferreira Gullar, nascido em São Luís, é autor de:', 'Ferreira Gullar (nascido em São Luís) escreveu "Poema Sujo", escrito no exílio em Buenos Aires. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b18', 'CO-CMA-00103', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'O escritor Josué Montello, nascido em São Luís, é autor de:', 'Josué Montello (nascido em São Luís) escreveu "Os Tambores de São Luís". A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b19', 'CO-CMA-00104', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'O escritor Graça Aranha, nascido em São Luís, é autor de:', 'Graça Aranha (nascido em São Luís) escreveu "Canaã", romance pré-modernista. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b1a', 'CO-CMA-00105', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'O escritor Sousândrade, nascido em Guimarães, é autor de:', 'Sousândrade (nascido em Guimarães) escreveu "O Guesa", poema longo do Romantismo. A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b1b', 'CO-CMA-00106', 17, 486, 'concurso', 3, 60, 2026, 'multiple_choice', 'Literatura maranhense', 'O escritor Coelho Neto, nascido em Caxias, é autor de:', 'Coelho Neto (nascido em Caxias) escreveu vasta obra de romances e contos, como "Rei Negro". A tradição literária deu a São Luís o apelido de "Atenas Brasileira".', 'Gonçalves Dias: Romantismo. Aluísio Azevedo: Naturalismo. Ferreira Gullar: poesia contemporânea.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b1c', 'CO-CMA-00107', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Qual elemento da economia maranhense corresponde a: ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís?', 'Estrada de Ferro Carajás: ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b1d', 'CO-CMA-00108', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Qual elemento da economia maranhense corresponde a: porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes?', 'Porto do Itaqui: porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b1e', 'CO-CMA-00109', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Qual elemento da economia maranhense corresponde a: base espacial favorecida pela proximidade da linha do Equador?', 'Centro de Lançamento de Alcântara: base espacial favorecida pela proximidade da linha do Equador.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b1f', 'CO-CMA-00110', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Qual elemento da economia maranhense corresponde a: produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba?', 'Soja no sul do estado: produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b20', 'CO-CMA-00111', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Qual elemento da economia maranhense corresponde a: atividade tradicional que gera óleo, carvão e renda para milhares de famílias?', 'Extrativismo do babaçu: atividade tradicional que gera óleo, carvão e renda para milhares de famílias.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b21', 'CO-CMA-00112', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Na economia do Maranhão, o(a) Estrada de Ferro Carajás se destaca como:', 'Estrada de Ferro Carajás: ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b22', 'CO-CMA-00113', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Na economia do Maranhão, o(a) Porto do Itaqui se destaca como:', 'Porto do Itaqui: porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b23', 'CO-CMA-00114', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Na economia do Maranhão, o(a) Centro de Lançamento de Alcântara se destaca como:', 'Centro de Lançamento de Alcântara: base espacial favorecida pela proximidade da linha do Equador.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b24', 'CO-CMA-00115', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Na economia do Maranhão, o(a) Soja no sul do estado se destaca como:', 'Soja no sul do estado: produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b25', 'CO-CMA-00116', 17, 488, 'concurso', 3, 60, 2026, 'multiple_choice', 'Infraestrutura e produção', 'Na economia do Maranhão, o(a) Extrativismo do babaçu se destaca como:', 'Extrativismo do babaçu: atividade tradicional que gera óleo, carvão e renda para milhares de famílias.', 'São Luís concentra a logística: Itaqui e Ponta da Madeira.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b26', 'CO-CMA-00117', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'Em São Luís, qual destes corresponde a: sede do governo do Maranhão, em São Luís?', 'Palácio dos Leões: sede do governo do Maranhão, em São Luís.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b27', 'CO-CMA-00118', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'Em São Luís, qual destes corresponde a: teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil?', 'Teatro Arthur Azevedo: teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b28', 'CO-CMA-00119', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'Em São Luís, qual destes corresponde a: chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas?', 'Fonte do Ribeirão: chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b29', 'CO-CMA-00120', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'Em São Luís, qual destes corresponde a: bairro histórico de São Luís com casarões cobertos de azulejos portugueses?', 'Praia Grande: bairro histórico de São Luís com casarões cobertos de azulejos portugueses.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b2a', 'CO-CMA-00121', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'Em São Luís, qual destes corresponde a: refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local?', 'Guaraná Jesus: refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b2b', 'CO-CMA-00122', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'O(A) Palácio dos Leões, em São Luís, é:', 'Palácio dos Leões: sede do governo do Maranhão, em São Luís.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b2c', 'CO-CMA-00123', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'O(A) Teatro Arthur Azevedo, em São Luís, é:', 'Teatro Arthur Azevedo: teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b2d', 'CO-CMA-00124', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'O(A) Fonte do Ribeirão, em São Luís, é:', 'Fonte do Ribeirão: chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b2e', 'CO-CMA-00125', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'O(A) Praia Grande, em São Luís, é:', 'Praia Grande: bairro histórico de São Luís com casarões cobertos de azulejos portugueses.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b2f', 'CO-CMA-00126', 17, 489, 'concurso', 2, 60, 2026, 'multiple_choice', 'Patrimônio de São Luís', 'O(A) Guaraná Jesus, em São Luís, é:', 'Guaraná Jesus: refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local.', 'O Centro Histórico de São Luís é Patrimônio Mundial desde 1997.', 'Questão autoral da Educa Mais no estilo dos concursos do Maranhão (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b30', 'CO-DIR-00001', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'De acordo com a Constituição Federal (arts. 29 a 31), qual termo corresponde a: norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal?', 'Lei Orgânica: norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b31', 'CO-DIR-00002', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'De acordo com a Constituição Federal (arts. 29 a 31), qual termo corresponde a: órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas?', 'Câmara Municipal: órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b32', 'CO-DIR-00003', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'De acordo com a Constituição Federal (arts. 29 a 31), qual termo corresponde a: chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição?', 'Prefeito: chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b33', 'CO-DIR-00004', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'De acordo com a Constituição Federal (arts. 29 a 31), qual termo corresponde a: membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar?', 'Vereador: membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b34', 'CO-DIR-00005', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'De acordo com a Constituição Federal (arts. 29 a 31), qual termo corresponde a: opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores?', 'Parecer prévio do Tribunal de Contas: opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b35', 'CO-DIR-00006', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'Segundo a Constituição Federal, sobre o(a) Lei Orgânica no âmbito municipal, é correto afirmar:', 'Lei Orgânica: norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b36', 'CO-DIR-00007', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'Segundo a Constituição Federal, sobre o(a) Câmara Municipal no âmbito municipal, é correto afirmar:', 'Câmara Municipal: órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b37', 'CO-DIR-00008', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'Segundo a Constituição Federal, sobre o(a) Prefeito no âmbito municipal, é correto afirmar:', 'Prefeito: chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b38', 'CO-DIR-00009', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'Segundo a Constituição Federal, sobre o(a) Vereador no âmbito municipal, é correto afirmar:', 'Vereador: membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b39', 'CO-DIR-00010', 10, 490, 'concurso', 3, 61, 2026, 'multiple_choice', 'Organização do município', 'Segundo a Constituição Federal, sobre o(a) Parecer prévio do Tribunal de Contas no âmbito municipal, é correto afirmar:', 'Parecer prévio do Tribunal de Contas: opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores. Base: arts. 29 a 31 da Constituição Federal.', 'Lei Orgânica: dois turnos, 10 dias, 2/3 da Câmara.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b3a', 'CO-DIR-00011', 10, 491, 'concurso', 3, 61, 2026, 'multiple_choice', 'Competências dos entes', 'Pela Constituição Federal, compete a qual ente: legislar sobre assuntos de interesse local e organizar o transporte coletivo urbano?', 'Compete ao(à) Município: legislar sobre assuntos de interesse local e organizar o transporte coletivo urbano.', 'Interesse local é sempre do Município (art. 30).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b3b', 'CO-DIR-00012', 10, 491, 'concurso', 3, 61, 2026, 'multiple_choice', 'Competências dos entes', 'Pela Constituição Federal, compete a qual ente: emitir moeda e manter relações com Estados estrangeiros?', 'Compete ao(à) União: emitir moeda e manter relações com Estados estrangeiros.', 'Interesse local é sempre do Município (art. 30).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b3c', 'CO-DIR-00013', 10, 491, 'concurso', 3, 61, 2026, 'multiple_choice', 'Competências dos entes', 'Pela Constituição Federal, compete a qual ente: explorar os serviços locais de gás canalizado?', 'Compete ao(à) Estado: explorar os serviços locais de gás canalizado.', 'Interesse local é sempre do Município (art. 30).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b3d', 'CO-DIR-00014', 10, 491, 'concurso', 3, 61, 2026, 'multiple_choice', 'Competências dos entes', 'Pela Constituição Federal, compete a qual ente: acumular as competências legislativas reservadas aos Estados e aos Municípios?', 'Compete ao(à) Distrito Federal: acumular as competências legislativas reservadas aos Estados e aos Municípios.', 'Interesse local é sempre do Município (art. 30).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b3e', 'CO-DIR-00015', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'Qual tributo corresponde a: imposto municipal sobre a propriedade predial e territorial urbana?', 'IPTU: imposto municipal sobre a propriedade predial e territorial urbana. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b3f', 'CO-DIR-00016', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'Qual tributo corresponde a: imposto municipal sobre serviços de qualquer natureza?', 'ISS: imposto municipal sobre serviços de qualquer natureza. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b40', 'CO-DIR-00017', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'Qual tributo corresponde a: imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos?', 'ITBI: imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b41', 'CO-DIR-00018', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'Qual tributo corresponde a: imposto estadual sobre a propriedade de veículos automotores?', 'IPVA: imposto estadual sobre a propriedade de veículos automotores. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b42', 'CO-DIR-00019', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'Qual tributo corresponde a: imposto estadual sobre circulação de mercadorias e alguns serviços?', 'ICMS: imposto estadual sobre circulação de mercadorias e alguns serviços. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b43', 'CO-DIR-00020', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'Qual tributo corresponde a: imposto federal sobre a renda e proventos de qualquer natureza?', 'IR: imposto federal sobre a renda e proventos de qualquer natureza. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b44', 'CO-DIR-00021', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'Qual tributo corresponde a: imposto federal sobre a propriedade territorial rural?', 'ITR: imposto federal sobre a propriedade territorial rural. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b45', 'CO-DIR-00022', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'O IPTU é o:', 'IPTU: imposto municipal sobre a propriedade predial e territorial urbana. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b46', 'CO-DIR-00023', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'O ISS é o:', 'ISS: imposto municipal sobre serviços de qualquer natureza. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b47', 'CO-DIR-00024', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'O ITBI é o:', 'ITBI: imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b48', 'CO-DIR-00025', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'O IPVA é o:', 'IPVA: imposto estadual sobre a propriedade de veículos automotores. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b49', 'CO-DIR-00026', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'O ICMS é o:', 'ICMS: imposto estadual sobre circulação de mercadorias e alguns serviços. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b4a', 'CO-DIR-00027', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'O IR é o:', 'IR: imposto federal sobre a renda e proventos de qualquer natureza. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b4b', 'CO-DIR-00028', 10, 493, 'concurso', 2, 61, 2026, 'multiple_choice', 'Tributos municipais', 'O ITR é o:', 'ITR: imposto federal sobre a propriedade territorial rural. Os impostos municipais são IPTU, ISS e ITBI (art. 156 da Constituição).', 'Municipais: IPTU, ISS e ITBI.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b4c', 'CO-DIR-00029', 10, 494, 'concurso', 2, 61, 2026, 'multiple_choice', 'Direitos políticos', 'Pela Constituição Federal (art. 14), qual é a idade mínima para se candidatar a vereador?', 'A idade mínima para vereador é 18 anos. Vereador 18, prefeito e deputado 21, governador 30, senador e presidente 35.', '18, 21, 30 e 35 anos.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b4d', 'CO-DIR-00030', 10, 494, 'concurso', 2, 61, 2026, 'multiple_choice', 'Direitos políticos', 'Pela Constituição Federal (art. 14), qual é a idade mínima para se candidatar a prefeito?', 'A idade mínima para prefeito é 21 anos. Vereador 18, prefeito e deputado 21, governador 30, senador e presidente 35.', '18, 21, 30 e 35 anos.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b4e', 'CO-DIR-00031', 10, 494, 'concurso', 2, 61, 2026, 'multiple_choice', 'Direitos políticos', 'Pela Constituição Federal (art. 14), qual é a idade mínima para se candidatar a governador?', 'A idade mínima para governador é 30 anos. Vereador 18, prefeito e deputado 21, governador 30, senador e presidente 35.', '18, 21, 30 e 35 anos.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b4f', 'CO-DIR-00032', 10, 494, 'concurso', 2, 61, 2026, 'multiple_choice', 'Direitos políticos', 'Pela Constituição Federal (art. 14), qual é a idade mínima para se candidatar a senador?', 'A idade mínima para senador é 35 anos. Vereador 18, prefeito e deputado 21, governador 30, senador e presidente 35.', '18, 21, 30 e 35 anos.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b50', 'CO-DIR-00033', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Segundo a Constituição Federal (arts. 37 e 41), qual instituto corresponde a: adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho?', 'Estabilidade: adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b51', 'CO-DIR-00034', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Segundo a Constituição Federal (arts. 37 e 41), qual instituto corresponde a: prazo de até dois anos, prorrogável uma vez por igual período?', 'Validade do concurso: prazo de até dois anos, prorrogável uma vez por igual período.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b52', 'CO-DIR-00035', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Segundo a Constituição Federal (arts. 37 e 41), qual instituto corresponde a: permitida, havendo compatibilidade de horários, para dois cargos de professor?', 'Acumulação de cargos: permitida, havendo compatibilidade de horários, para dois cargos de professor.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b53', 'CO-DIR-00036', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Segundo a Constituição Federal (arts. 37 e 41), qual instituto corresponde a: cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento?', 'Cargo em comissão: cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b54', 'CO-DIR-00037', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Segundo a Constituição Federal (arts. 37 e 41), qual instituto corresponde a: exercida exclusivamente por servidores ocupantes de cargo efetivo?', 'Função de confiança: exercida exclusivamente por servidores ocupantes de cargo efetivo.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b55', 'CO-DIR-00038', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Sobre estabilidade no serviço público, a Constituição estabelece:', 'Estabilidade: adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b56', 'CO-DIR-00039', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Sobre validade do concurso no serviço público, a Constituição estabelece:', 'Validade do concurso: prazo de até dois anos, prorrogável uma vez por igual período.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b57', 'CO-DIR-00040', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Sobre acumulação de cargos no serviço público, a Constituição estabelece:', 'Acumulação de cargos: permitida, havendo compatibilidade de horários, para dois cargos de professor.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b58', 'CO-DIR-00041', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Sobre cargo em comissão no serviço público, a Constituição estabelece:', 'Cargo em comissão: cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b59', 'CO-DIR-00042', 10, 495, 'concurso', 3, 61, 2026, 'multiple_choice', 'Servidores públicos', 'Sobre função de confiança no serviço público, a Constituição estabelece:', 'Função de confiança: exercida exclusivamente por servidores ocupantes de cargo efetivo.', 'Estabilidade: 3 anos. Concurso: até 2 anos, prorrogável uma vez.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b5a', 'CO-DIR-00043', 10, 496, 'concurso', 3, 61, 2026, 'multiple_choice', 'Improbidade administrativa', 'Pela Lei 8.429/1992, a conduta a seguir é exemplo de qual tipo de improbidade? "Receber vantagem patrimonial indevida em razão do cargo, como aceitar presente de quem tem interesse em decisão do agente."', 'Enriquecimento ilícito: receber vantagem patrimonial indevida em razão do cargo, como aceitar presente de quem tem interesse em decisão do agente. Desde a Lei 14.230/2021, a improbidade exige dolo (intenção).', 'Três tipos: enriquecimento, prejuízo ao erário e princípios.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b5b', 'CO-DIR-00044', 10, 496, 'concurso', 3, 61, 2026, 'multiple_choice', 'Improbidade administrativa', 'Pela Lei 8.429/1992, a conduta a seguir é exemplo de qual tipo de improbidade? "Ação que causa perda ou desvio de bens e recursos públicos, como permitir compra por preço acima do de mercado."', 'Prejuízo ao erário: ação que causa perda ou desvio de bens e recursos públicos, como permitir compra por preço acima do de mercado. Desde a Lei 14.230/2021, a improbidade exige dolo (intenção).', 'Três tipos: enriquecimento, prejuízo ao erário e princípios.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b5c', 'CO-DIR-00045', 10, 496, 'concurso', 3, 61, 2026, 'multiple_choice', 'Improbidade administrativa', 'Pela Lei 8.429/1992, a conduta a seguir é exemplo de qual tipo de improbidade? "Violar deveres de honestidade e imparcialidade, como revelar fato que deve ficar em segredo."', 'Atentado aos princípios da administração: violar deveres de honestidade e imparcialidade, como revelar fato que deve ficar em segredo. Desde a Lei 14.230/2021, a improbidade exige dolo (intenção).', 'Três tipos: enriquecimento, prejuízo ao erário e princípios.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b5d', 'CO-DIR-00046', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na Lei 14.133/2021, qual modalidade de licitação corresponde a: modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto?', 'Pregão: modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b5e', 'CO-DIR-00047', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na Lei 14.133/2021, qual modalidade de licitação corresponde a: modalidade para obras, serviços especiais e de engenharia e bens especiais?', 'Concorrência: modalidade para obras, serviços especiais e de engenharia e bens especiais. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b5f', 'CO-DIR-00048', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na Lei 14.133/2021, qual modalidade de licitação corresponde a: modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor?', 'Concurso: modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b60', 'CO-DIR-00049', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na Lei 14.133/2021, qual modalidade de licitação corresponde a: modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance?', 'Leilão: modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b61', 'CO-DIR-00050', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na Lei 14.133/2021, qual modalidade de licitação corresponde a: modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções?', 'Diálogo competitivo: modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b62', 'CO-DIR-00051', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na nova Lei de Licitações, a modalidade pregão é usada para:', 'Pregão: modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b63', 'CO-DIR-00052', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na nova Lei de Licitações, a modalidade concorrência é usada para:', 'Concorrência: modalidade para obras, serviços especiais e de engenharia e bens especiais. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b64', 'CO-DIR-00053', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na nova Lei de Licitações, a modalidade concurso é usada para:', 'Concurso: modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b65', 'CO-DIR-00054', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na nova Lei de Licitações, a modalidade leilão é usada para:', 'Leilão: modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b66', 'CO-DIR-00055', 10, 497, 'concurso', 3, 61, 2026, 'multiple_choice', 'Licitações (Lei 14.133/2021)', 'Na nova Lei de Licitações, a modalidade diálogo competitivo é usada para:', 'Diálogo competitivo: modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções. Convite e tomada de preços não existem mais na nova lei.', 'Cinco modalidades: pregão, concorrência, concurso, leilão e diálogo competitivo.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b67', 'CO-DIR-00056', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Lei Orgânica da Saúde, que organiza o SUS?', 'Lei 8.080/1990: Lei Orgânica da Saúde, que organiza o SUS.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b68', 'CO-DIR-00057', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Estatuto da Criança e do Adolescente (ECA)?', 'Lei 8.069/1990: Estatuto da Criança e do Adolescente (ECA).', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b69', 'CO-DIR-00058', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Lei de Diretrizes e Bases da Educação Nacional (LDB)?', 'Lei 9.394/1996: Lei de Diretrizes e Bases da Educação Nacional (LDB).', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b6a', 'CO-DIR-00059', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Estatuto da Pessoa Idosa?', 'Lei 10.741/2003: Estatuto da Pessoa Idosa.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b6b', 'CO-DIR-00060', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Lei de Acesso à Informação?', 'Lei 12.527/2011: Lei de Acesso à Informação.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b6c', 'CO-DIR-00061', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Lei de Responsabilidade Fiscal?', 'Lei Complementar 101/2000: Lei de Responsabilidade Fiscal.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b6d', 'CO-DIR-00062', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Lei de Licitações e Contratos Administrativos?', 'Lei 14.133/2021: Lei de Licitações e Contratos Administrativos.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b6e', 'CO-DIR-00063', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Lei de Improbidade Administrativa?', 'Lei 8.429/1992: Lei de Improbidade Administrativa.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b6f', 'CO-DIR-00064', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'Qual é o número da Lei Geral de Proteção de Dados Pessoais (LGPD)?', 'Lei 13.709/2018: Lei Geral de Proteção de Dados Pessoais (LGPD).', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b70', 'CO-DIR-00065', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei 8.080/1990 é conhecida como:', 'Lei 8.080/1990: Lei Orgânica da Saúde, que organiza o SUS.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b71', 'CO-DIR-00066', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei 8.069/1990 é conhecida como:', 'Lei 8.069/1990: Estatuto da Criança e do Adolescente (ECA).', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b72', 'CO-DIR-00067', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei 9.394/1996 é conhecida como:', 'Lei 9.394/1996: Lei de Diretrizes e Bases da Educação Nacional (LDB).', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b73', 'CO-DIR-00068', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei 10.741/2003 é conhecida como:', 'Lei 10.741/2003: Estatuto da Pessoa Idosa.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b74', 'CO-DIR-00069', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei 12.527/2011 é conhecida como:', 'Lei 12.527/2011: Lei de Acesso à Informação.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b75', 'CO-DIR-00070', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei Complementar 101/2000 é conhecida como:', 'Lei Complementar 101/2000: Lei de Responsabilidade Fiscal.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b76', 'CO-DIR-00071', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei 14.133/2021 é conhecida como:', 'Lei 14.133/2021: Lei de Licitações e Contratos Administrativos.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b77', 'CO-DIR-00072', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei 8.429/1992 é conhecida como:', 'Lei 8.429/1992: Lei de Improbidade Administrativa.', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b78', 'CO-DIR-00073', 10, 499, 'concurso', 2, 61, 2026, 'multiple_choice', 'Leis federais cobradas em prefeituras', 'A Lei 13.709/2018 é conhecida como:', 'Lei 13.709/2018: Lei Geral de Proteção de Dados Pessoais (LGPD).', 'Associe o ano ao tema: 1990 (SUS e ECA), 1996 (LDB), 2000 (LRF), 2011 (LAI), 2021 (licitações).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b79', 'CO-ATP-00001', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao público em uma prefeitura, qual conceito corresponde a: tratar o cidadão com educação e respeito, mesmo diante de reclamações?', 'Cortesia: tratar o cidadão com educação e respeito, mesmo diante de reclamações.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b7a', 'CO-ATP-00002', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao público em uma prefeitura, qual conceito corresponde a: usar linguagem simples, sem termos técnicos desnecessários?', 'Clareza: usar linguagem simples, sem termos técnicos desnecessários.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b7b', 'CO-ATP-00003', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao público em uma prefeitura, qual conceito corresponde a: atender com rapidez e disposição, sem demoras injustificadas?', 'Presteza: atender com rapidez e disposição, sem demoras injustificadas.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b7c', 'CO-ATP-00004', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao público em uma prefeitura, qual conceito corresponde a: garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência?', 'Atendimento prioritário: garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b7d', 'CO-ATP-00005', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao público em uma prefeitura, qual conceito corresponde a: atender a todos sem favorecer amigos, parentes ou conhecidos?', 'Impessoalidade no atendimento: atender a todos sem favorecer amigos, parentes ou conhecidos.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b7e', 'CO-ATP-00006', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao cidadão, cortesia significa:', 'Cortesia: tratar o cidadão com educação e respeito, mesmo diante de reclamações.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b7f', 'CO-ATP-00007', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao cidadão, clareza significa:', 'Clareza: usar linguagem simples, sem termos técnicos desnecessários.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b80', 'CO-ATP-00008', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao cidadão, presteza significa:', 'Presteza: atender com rapidez e disposição, sem demoras injustificadas.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b81', 'CO-ATP-00009', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao cidadão, atendimento prioritário significa:', 'Atendimento prioritário: garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b82', 'CO-ATP-00010', 19, 501, 'concurso', 1, 61, 2026, 'multiple_choice', 'Qualidade no atendimento', 'No atendimento ao cidadão, impessoalidade no atendimento significa:', 'Impessoalidade no atendimento: atender a todos sem favorecer amigos, parentes ou conhecidos.', 'Pense no que o cidadão espera de um bom atendimento.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b83', 'CO-INF-00001', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para aplicar negrito ao texto selecionado?', 'Ctrl + N: aplicar negrito ao texto selecionado. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b84', 'CO-INF-00002', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para aplicar itálico ao texto selecionado?', 'Ctrl + I: aplicar itálico ao texto selecionado. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b85', 'CO-INF-00003', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para sublinhar o texto selecionado?', 'Ctrl + S: sublinhar o texto selecionado. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b86', 'CO-INF-00004', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para salvar o documento?', 'Ctrl + B: salvar o documento. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b87', 'CO-INF-00005', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para desfazer a última ação?', 'Ctrl + Z: desfazer a última ação. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b88', 'CO-INF-00006', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para imprimir o documento?', 'Ctrl + P: imprimir o documento. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b89', 'CO-INF-00007', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para selecionar todo o documento?', 'Ctrl + T: selecionar todo o documento. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b8a', 'CO-INF-00008', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para centralizar o parágrafo?', 'Ctrl + E: centralizar o parágrafo. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b8b', 'CO-INF-00009', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para recortar o conteúdo selecionado?', 'Ctrl + X: recortar o conteúdo selecionado. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b8c', 'CO-INF-00010', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, qual atalho serve para colar o conteúdo da área de transferência?', 'Ctrl + V: colar o conteúdo da área de transferência. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b8d', 'CO-INF-00011', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + N serve para:', 'Ctrl + N: aplicar negrito ao texto selecionado. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b8e', 'CO-INF-00012', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + I serve para:', 'Ctrl + I: aplicar itálico ao texto selecionado. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b8f', 'CO-INF-00013', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + S serve para:', 'Ctrl + S: sublinhar o texto selecionado. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b90', 'CO-INF-00014', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + B serve para:', 'Ctrl + B: salvar o documento. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b91', 'CO-INF-00015', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + Z serve para:', 'Ctrl + Z: desfazer a última ação. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b92', 'CO-INF-00016', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + P serve para:', 'Ctrl + P: imprimir o documento. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b93', 'CO-INF-00017', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + T serve para:', 'Ctrl + T: selecionar todo o documento. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b94', 'CO-INF-00018', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + E serve para:', 'Ctrl + E: centralizar o parágrafo. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b95', 'CO-INF-00019', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + X serve para:', 'Ctrl + X: recortar o conteúdo selecionado. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b96', 'CO-INF-00020', 18, 503, 'concurso', 1, 61, 2026, 'multiple_choice', 'Editor de texto (Word)', 'No Microsoft Word em português, o atalho Ctrl + V serve para:', 'Ctrl + V: colar o conteúdo da área de transferência. No Word em português: N negrito, I itálico, S sublinhado, B salvar.', 'No Word em português os atalhos seguem as palavras em português.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b97', 'CO-INF-00021', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, qual atalho serve para abrir o Explorador de Arquivos?', 'Windows + E: abrir o Explorador de Arquivos.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b98', 'CO-INF-00022', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, qual atalho serve para mostrar a área de trabalho?', 'Windows + D: mostrar a área de trabalho.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b99', 'CO-INF-00023', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, qual atalho serve para bloquear o computador?', 'Windows + L: bloquear o computador.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b9a', 'CO-INF-00024', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, qual atalho serve para alternar entre as janelas abertas?', 'Alt + Tab: alternar entre as janelas abertas.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b9b', 'CO-INF-00025', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, qual atalho serve para abrir o Gerenciador de Tarefas?', 'Ctrl + Shift + Esc: abrir o Gerenciador de Tarefas.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b9c', 'CO-INF-00026', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, qual atalho serve para renomear o arquivo selecionado?', 'F2: renomear o arquivo selecionado.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b9d', 'CO-INF-00027', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, qual atalho serve para excluir o arquivo sem enviá-lo para a Lixeira?', 'Shift + Delete: excluir o arquivo sem enviá-lo para a Lixeira.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b9e', 'CO-INF-00028', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, qual atalho serve para fechar a janela ativa?', 'Alt + F4: fechar a janela ativa.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000b9f', 'CO-INF-00029', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, o atalho Windows + E serve para:', 'Windows + E: abrir o Explorador de Arquivos.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba0', 'CO-INF-00030', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, o atalho Windows + D serve para:', 'Windows + D: mostrar a área de trabalho.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba1', 'CO-INF-00031', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, o atalho Windows + L serve para:', 'Windows + L: bloquear o computador.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba2', 'CO-INF-00032', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, o atalho Alt + Tab serve para:', 'Alt + Tab: alternar entre as janelas abertas.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba3', 'CO-INF-00033', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, o atalho Ctrl + Shift + Esc serve para:', 'Ctrl + Shift + Esc: abrir o Gerenciador de Tarefas.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba4', 'CO-INF-00034', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, o atalho F2 serve para:', 'F2: renomear o arquivo selecionado.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba5', 'CO-INF-00035', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, o atalho Shift + Delete serve para:', 'Shift + Delete: excluir o arquivo sem enviá-lo para a Lixeira.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba6', 'CO-INF-00036', 18, 504, 'concurso', 1, 61, 2026, 'multiple_choice', 'Windows', 'No Windows, o atalho Alt + F4 serve para:', 'Alt + F4: fechar a janela ativa.', 'A tecla Windows combina com a inicial da ação (E = Explorador, D = Desktop, L = Lock).', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba7', 'CO-INF-00037', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em segurança da informação, qual termo corresponde a: golpe em que mensagens falsas imitam bancos ou órgãos públicos para roubar senhas e dados?', 'Phishing: golpe em que mensagens falsas imitam bancos ou órgãos públicos para roubar senhas e dados.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba8', 'CO-INF-00038', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em segurança da informação, qual termo corresponde a: programa malicioso que sequestra arquivos com criptografia e pede resgate?', 'Ransomware: programa malicioso que sequestra arquivos com criptografia e pede resgate.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000ba9', 'CO-INF-00039', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em segurança da informação, qual termo corresponde a: recurso que controla o tráfego de rede, bloqueando conexões não autorizadas?', 'Firewall: recurso que controla o tráfego de rede, bloqueando conexões não autorizadas.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000baa', 'CO-INF-00040', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em segurança da informação, qual termo corresponde a: cópia de segurança dos dados, guardada para recuperação em caso de perda?', 'Backup: cópia de segurança dos dados, guardada para recuperação em caso de perda.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bab', 'CO-INF-00041', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em segurança da informação, qual termo corresponde a: mensagem eletrônica não solicitada, enviada em massa?', 'Spam: mensagem eletrônica não solicitada, enviada em massa.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bac', 'CO-INF-00042', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em segurança da informação, qual termo corresponde a: campo do e-mail em que os destinatários não aparecem para os demais?', 'Cco (cópia oculta): campo do e-mail em que os destinatários não aparecem para os demais.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bad', 'CO-INF-00043', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em segurança da informação, qual termo corresponde a: protocolo que indica conexão criptografada entre o navegador e o site?', 'HTTPS: protocolo que indica conexão criptografada entre o navegador e o site.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bae', 'CO-INF-00044', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em segurança da informação, qual termo corresponde a: proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo?', 'Autenticação em dois fatores: proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000baf', 'CO-INF-00045', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em informática, Phishing é:', 'Phishing: golpe em que mensagens falsas imitam bancos ou órgãos públicos para roubar senhas e dados.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb0', 'CO-INF-00046', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em informática, Ransomware é:', 'Ransomware: programa malicioso que sequestra arquivos com criptografia e pede resgate.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb1', 'CO-INF-00047', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em informática, Firewall é:', 'Firewall: recurso que controla o tráfego de rede, bloqueando conexões não autorizadas.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb2', 'CO-INF-00048', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em informática, Backup é:', 'Backup: cópia de segurança dos dados, guardada para recuperação em caso de perda.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb3', 'CO-INF-00049', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em informática, Spam é:', 'Spam: mensagem eletrônica não solicitada, enviada em massa.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb4', 'CO-INF-00050', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em informática, Cco (cópia oculta) é:', 'Cco (cópia oculta): campo do e-mail em que os destinatários não aparecem para os demais.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb5', 'CO-INF-00051', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em informática, HTTPS é:', 'HTTPS: protocolo que indica conexão criptografada entre o navegador e o site.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb6', 'CO-INF-00052', 18, 505, 'concurso', 2, 61, 2026, 'multiple_choice', 'Segurança e internet', 'Em informática, Autenticação em dois fatores é:', 'Autenticação em dois fatores: proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo.', 'Desconfie de links que pedem senha com urgência.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb7', 'CO-INF-00053', 18, 506, 'concurso', 2, 61, 2026, 'multiple_choice', 'Planilhas (Excel e Calc)', 'Em uma planilha do Excel, qual fórmula serve para somar os valores das células de A1 até A5?', '=SOMA(A1:A5): somar os valores das células de A1 até A5.', 'Toda fórmula começa com = e os argumentos são separados por ponto e vírgula.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000bb8', 'CO-INF-00054', 18, 506, 'concurso', 2, 61, 2026, 'multiple_choice', 'Planilhas (Excel e Calc)', 'Em uma planilha do Excel, qual fórmula serve para calcular a média aritmética dos valores de A1 a A5?', '=MÉDIA(A1:A5): calcular a média aritmética dos valores de A1 a A5.', 'Toda fórmula começa com = e os argumentos são separados por ponto e vírgula.', 'Questão autoral da Educa Mais no estilo dos concursos de prefeituras (2026). Não é uma questão oficial.', 'published', '2026-11-28T00:00:00.000Z')
on conflict (id) do nothing;
insert into public.question_options (id, question_id, position, body, is_correct) values
  ('e2000000-0000-4000-b000-0000000061b2', 'e2000000-0000-4000-a000-0000000009c5', 0, 'H2', false),
  ('e2000000-0000-4000-b000-0000000061b3', 'e2000000-0000-4000-a000-0000000009c5', 1, 'O2', false),
  ('e2000000-0000-4000-b000-0000000061b4', 'e2000000-0000-4000-a000-0000000009c5', 2, 'CO2', true),
  ('e2000000-0000-4000-b000-0000000061b5', 'e2000000-0000-4000-a000-0000000009c5', 3, 'CO', false),
  ('e2000000-0000-4000-b000-0000000061b6', 'e2000000-0000-4000-a000-0000000009c5', 4, 'Cl2', false),
  ('e2000000-0000-4000-b000-0000000061bc', 'e2000000-0000-4000-a000-0000000009c6', 0, 'Estrogênio', false),
  ('e2000000-0000-4000-b000-0000000061bd', 'e2000000-0000-4000-a000-0000000009c6', 1, 'Feromônio', false),
  ('e2000000-0000-4000-b000-0000000061be', 'e2000000-0000-4000-a000-0000000009c6', 2, 'Testosterona.', true),
  ('e2000000-0000-4000-b000-0000000061bf', 'e2000000-0000-4000-a000-0000000009c6', 3, 'Somatotrofina', false),
  ('e2000000-0000-4000-b000-0000000061c0', 'e2000000-0000-4000-a000-0000000009c6', 4, 'Hormônio folículo estimulante.', false),
  ('e2000000-0000-4000-b000-0000000061c6', 'e2000000-0000-4000-a000-0000000009c7', 0, '0,25 A', true),
  ('e2000000-0000-4000-b000-0000000061c7', 'e2000000-0000-4000-a000-0000000009c7', 1, '0,33 A', false),
  ('e2000000-0000-4000-b000-0000000061c8', 'e2000000-0000-4000-a000-0000000009c7', 2, '0,75 A', false),
  ('e2000000-0000-4000-b000-0000000061c9', 'e2000000-0000-4000-a000-0000000009c7', 3, '1,00 A', false),
  ('e2000000-0000-4000-b000-0000000061ca', 'e2000000-0000-4000-a000-0000000009c7', 4, '1,33 A', false),
  ('e2000000-0000-4000-b000-0000000061d0', 'e2000000-0000-4000-a000-0000000009c8', 0, 'Variação do pH do meio.', false),
  ('e2000000-0000-4000-b000-0000000061d1', 'e2000000-0000-4000-a000-0000000009c8', 1, 'Aumento da energia de ativação.', false),
  ('e2000000-0000-4000-b000-0000000061d2', 'e2000000-0000-4000-a000-0000000009c8', 2, 'Consumo da enzima durante o ensaio.', false),
  ('e2000000-0000-4000-b000-0000000061d3', 'e2000000-0000-4000-a000-0000000009c8', 3, 'Diminuição da concentração do substrato.', false),
  ('e2000000-0000-4000-b000-0000000061d4', 'e2000000-0000-4000-a000-0000000009c8', 4, 'Modificação da estrutura tridimensional da enzima.', true),
  ('e2000000-0000-4000-b000-0000000061da', 'e2000000-0000-4000-a000-0000000009c9', 0, '1', false),
  ('e2000000-0000-4000-b000-0000000061db', 'e2000000-0000-4000-a000-0000000009c9', 1, '2', true),
  ('e2000000-0000-4000-b000-0000000061dc', 'e2000000-0000-4000-a000-0000000009c9', 2, '3', false),
  ('e2000000-0000-4000-b000-0000000061dd', 'e2000000-0000-4000-a000-0000000009c9', 3, '4', false),
  ('e2000000-0000-4000-b000-0000000061de', 'e2000000-0000-4000-a000-0000000009c9', 4, '5', false),
  ('e2000000-0000-4000-b000-0000000061e4', 'e2000000-0000-4000-a000-0000000009ca', 0, 'Impedir a formação de trombos, típicos em alguns casos de acidente vascular cerebral.', true),
  ('e2000000-0000-4000-b000-0000000061e5', 'e2000000-0000-4000-a000-0000000009ca', 1, 'Tratar consequências da anemia profunda, em razão da perda de grande volume de sangue.', false),
  ('e2000000-0000-4000-b000-0000000061e6', 'e2000000-0000-4000-a000-0000000009ca', 2, 'Evitar a manifestação de urticárias, comumente relacionadas a processos alérgicos.', false),
  ('e2000000-0000-4000-b000-0000000061e7', 'e2000000-0000-4000-a000-0000000009ca', 3, 'Reduzir o inchaço dos linfonodos, parte da resposta imunitária de diferentes infecções.', false),
  ('e2000000-0000-4000-b000-0000000061e8', 'e2000000-0000-4000-a000-0000000009ca', 4, 'Regular a oscilação da pressão arterial, característica dos quadros de hipertensão.', false),
  ('e2000000-0000-4000-b000-0000000061ee', 'e2000000-0000-4000-a000-0000000009cb', 0, 'Eles se moveriam em órbitas espirais, aproximando-se sucessivamente do Buraco Negro.', false),
  ('e2000000-0000-4000-b000-0000000061ef', 'e2000000-0000-4000-a000-0000000009cb', 1, 'Eles oscilariam aleatoriamente em torno de suas órbitas elípticas originais.', false),
  ('e2000000-0000-4000-b000-0000000061f0', 'e2000000-0000-4000-a000-0000000009cb', 2, 'Eles se moveriam em direção ao centro do Buraco Negro.', false),
  ('e2000000-0000-4000-b000-0000000061f1', 'e2000000-0000-4000-a000-0000000009cb', 3, 'Eles passariam a precessionar mais rapidamente.', false),
  ('e2000000-0000-4000-b000-0000000061f2', 'e2000000-0000-4000-a000-0000000009cb', 4, 'Eles manteriam suas órbitas inalteradas.', true),
  ('e2000000-0000-4000-b000-0000000061f8', 'e2000000-0000-4000-a000-0000000009cc', 0, 'Catalisador.', false),
  ('e2000000-0000-4000-b000-0000000061f9', 'e2000000-0000-4000-a000-0000000009cc', 1, 'Oxidante.', true),
  ('e2000000-0000-4000-b000-0000000061fa', 'e2000000-0000-4000-a000-0000000009cc', 2, 'Redutor.', false),
  ('e2000000-0000-4000-b000-0000000061fb', 'e2000000-0000-4000-a000-0000000009cc', 3, 'Ácido.', false),
  ('e2000000-0000-4000-b000-0000000061fc', 'e2000000-0000-4000-a000-0000000009cc', 4, 'Base.', false),
  ('e2000000-0000-4000-b000-000000006202', 'e2000000-0000-4000-a000-0000000009cd', 0, 'Pleiotropia.', false),
  ('e2000000-0000-4000-b000-000000006203', 'e2000000-0000-4000-a000-0000000009cd', 1, 'Mutação gênica.', false),
  ('e2000000-0000-4000-b000-000000006204', 'e2000000-0000-4000-a000-0000000009cd', 2, 'Interação gênica.', false),
  ('e2000000-0000-4000-b000-000000006205', 'e2000000-0000-4000-a000-0000000009cd', 3, 'Penetrância incompleta.', false),
  ('e2000000-0000-4000-b000-000000006206', 'e2000000-0000-4000-a000-0000000009cd', 4, 'Expressividade variável.', true),
  ('e2000000-0000-4000-b000-00000000620c', 'e2000000-0000-4000-a000-0000000009ce', 0, 'Coagulação.', false),
  ('e2000000-0000-4000-b000-00000000620d', 'e2000000-0000-4000-a000-0000000009ce', 1, 'Decantação.', true),
  ('e2000000-0000-4000-b000-00000000620e', 'e2000000-0000-4000-a000-0000000009ce', 2, 'Filtração.', false),
  ('e2000000-0000-4000-b000-00000000620f', 'e2000000-0000-4000-a000-0000000009ce', 3, 'Desinfecção.', false),
  ('e2000000-0000-4000-b000-000000006210', 'e2000000-0000-4000-a000-0000000009ce', 4, 'Fluoretação.', false),
  ('e2000000-0000-4000-b000-000000006216', 'e2000000-0000-4000-a000-0000000009cf', 0, 'Glicólise.', false),
  ('e2000000-0000-4000-b000-000000006217', 'e2000000-0000-4000-a000-0000000009cf', 1, 'Fermentação lática.', false),
  ('e2000000-0000-4000-b000-000000006218', 'e2000000-0000-4000-a000-0000000009cf', 2, 'Ciclo do ácido cítrico.', false),
  ('e2000000-0000-4000-b000-000000006219', 'e2000000-0000-4000-a000-0000000009cf', 3, 'Oxidação do piruvato.', false),
  ('e2000000-0000-4000-b000-00000000621a', 'e2000000-0000-4000-a000-0000000009cf', 4, 'Fosforilação oxidativa.', true),
  ('e2000000-0000-4000-b000-000000006220', 'e2000000-0000-4000-a000-0000000009d0', 0, '1, 2, 3.', true),
  ('e2000000-0000-4000-b000-000000006221', 'e2000000-0000-4000-a000-0000000009d0', 1, '1, 3, 2.', false),
  ('e2000000-0000-4000-b000-000000006222', 'e2000000-0000-4000-a000-0000000009d0', 2, '2, 1, 3.', false),
  ('e2000000-0000-4000-b000-000000006223', 'e2000000-0000-4000-a000-0000000009d0', 3, '3, 1, 2.', false),
  ('e2000000-0000-4000-b000-000000006224', 'e2000000-0000-4000-a000-0000000009d0', 4, '3, 2, 1.', false),
  ('e2000000-0000-4000-b000-00000000622a', 'e2000000-0000-4000-a000-0000000009d1', 0, 'N2', false),
  ('e2000000-0000-4000-b000-00000000622b', 'e2000000-0000-4000-a000-0000000009d1', 1, 'NH3', false),
  ('e2000000-0000-4000-b000-00000000622c', 'e2000000-0000-4000-a000-0000000009d1', 2, 'NH4 +', true),
  ('e2000000-0000-4000-b000-00000000622d', 'e2000000-0000-4000-a000-0000000009d1', 3, 'NO2 −', false),
  ('e2000000-0000-4000-b000-00000000622e', 'e2000000-0000-4000-a000-0000000009d1', 4, 'NO3', false),
  ('e2000000-0000-4000-b000-000000006234', 'e2000000-0000-4000-a000-0000000009d2', 0, 'Apresentar daltonismo.', false),
  ('e2000000-0000-4000-b000-000000006235', 'e2000000-0000-4000-a000-0000000009d2', 1, 'Perceber cores fora do espectro do visível.', false),
  ('e2000000-0000-4000-b000-000000006236', 'e2000000-0000-4000-a000-0000000009d2', 2, 'Enxergar bem em ambientes mal iluminados.', true),
  ('e2000000-0000-4000-b000-000000006237', 'e2000000-0000-4000-a000-0000000009d2', 3, 'Necessitar de mais luminosidade para enxergar.', false),
  ('e2000000-0000-4000-b000-000000006238', 'e2000000-0000-4000-a000-0000000009d2', 4, 'Fazer uma pequena distinção de cores em ambientes iluminados.', false),
  ('e2000000-0000-4000-b000-00000000623e', 'e2000000-0000-4000-a000-0000000009d3', 0, 'Ramificações.', false),
  ('e2000000-0000-4000-b000-00000000623f', 'e2000000-0000-4000-a000-0000000009d3', 1, 'Insaturações.', false),
  ('e2000000-0000-4000-b000-000000006240', 'e2000000-0000-4000-a000-0000000009d3', 2, 'Anel benzênico.', true),
  ('e2000000-0000-4000-b000-000000006241', 'e2000000-0000-4000-a000-0000000009d3', 3, 'Átomos de oxigênio.', false),
  ('e2000000-0000-4000-b000-000000006242', 'e2000000-0000-4000-a000-0000000009d3', 4, 'Carbonos assimétricos.', false),
  ('e2000000-0000-4000-b000-000000006248', 'e2000000-0000-4000-a000-0000000009d4', 0, 'Predação do vírus pela bactéria.', false),
  ('e2000000-0000-4000-b000-000000006249', 'e2000000-0000-4000-a000-0000000009d4', 1, 'Esterilização de mosquitos infectados.', false),
  ('e2000000-0000-4000-b000-00000000624a', 'e2000000-0000-4000-a000-0000000009d4', 2, 'Alteração no genótipo do mosquito pela bactéria.', false),
  ('e2000000-0000-4000-b000-00000000624b', 'e2000000-0000-4000-a000-0000000009d4', 3, 'Ompetição do vírus e da bactéria no hospedeiro.', true),
  ('e2000000-0000-4000-b000-00000000624c', 'e2000000-0000-4000-a000-0000000009d4', 4, 'Inserção de material genético do vírus na bactéria', false),
  ('e2000000-0000-4000-b000-000000006252', 'e2000000-0000-4000-a000-0000000009d5', 0, 'Autoimunidade.', false),
  ('e2000000-0000-4000-b000-000000006253', 'e2000000-0000-4000-a000-0000000009d5', 1, 'Hipersensibilidade.', false),
  ('e2000000-0000-4000-b000-000000006254', 'e2000000-0000-4000-a000-0000000009d5', 2, 'Ativação da resposta inata.', false),
  ('e2000000-0000-4000-b000-000000006255', 'e2000000-0000-4000-a000-0000000009d5', 3, 'Apresentação de antígeno específico.', true),
  ('e2000000-0000-4000-b000-000000006256', 'e2000000-0000-4000-a000-0000000009d5', 4, 'Desencadeamento de processo anti-inflamatório.', false),
  ('e2000000-0000-4000-b000-00000000625c', 'e2000000-0000-4000-a000-0000000009d6', 0, '339 000.', false),
  ('e2000000-0000-4000-b000-00000000625d', 'e2000000-0000-4000-a000-0000000009d6', 1, '78 900.', false),
  ('e2000000-0000-4000-b000-00000000625e', 'e2000000-0000-4000-a000-0000000009d6', 2, '14 400.', false),
  ('e2000000-0000-4000-b000-00000000625f', 'e2000000-0000-4000-a000-0000000009d6', 3, '5 240.', true),
  ('e2000000-0000-4000-b000-000000006260', 'e2000000-0000-4000-a000-0000000009d6', 4, '100.', false),
  ('e2000000-0000-4000-b000-000000006266', 'e2000000-0000-4000-a000-0000000009d7', 0, 'Difração.', false),
  ('e2000000-0000-4000-b000-000000006267', 'e2000000-0000-4000-a000-0000000009d7', 1, 'Absorção.', false),
  ('e2000000-0000-4000-b000-000000006268', 'e2000000-0000-4000-a000-0000000009d7', 2, 'Polarização.', false),
  ('e2000000-0000-4000-b000-000000006269', 'e2000000-0000-4000-a000-0000000009d7', 3, 'Reflexão.', false),
  ('e2000000-0000-4000-b000-00000000626a', 'e2000000-0000-4000-a000-0000000009d7', 4, 'Refração.', true),
  ('e2000000-0000-4000-b000-000000006270', 'e2000000-0000-4000-a000-0000000009d8', 0, '1', false),
  ('e2000000-0000-4000-b000-000000006271', 'e2000000-0000-4000-a000-0000000009d8', 1, '2', false),
  ('e2000000-0000-4000-b000-000000006272', 'e2000000-0000-4000-a000-0000000009d8', 2, '3', false),
  ('e2000000-0000-4000-b000-000000006273', 'e2000000-0000-4000-a000-0000000009d8', 3, '4', false),
  ('e2000000-0000-4000-b000-000000006274', 'e2000000-0000-4000-a000-0000000009d8', 4, '5', true),
  ('e2000000-0000-4000-b000-00000000627a', 'e2000000-0000-4000-a000-0000000009d9', 0, '![](conteudo/enem/2022/137-a-a62b92ab.webp)', false),
  ('e2000000-0000-4000-b000-00000000627b', 'e2000000-0000-4000-a000-0000000009d9', 1, '![](conteudo/enem/2022/137-b-bcc4e92c.webp)', false),
  ('e2000000-0000-4000-b000-00000000627c', 'e2000000-0000-4000-a000-0000000009d9', 2, '![](conteudo/enem/2022/137-c-b783250d.webp)', true),
  ('e2000000-0000-4000-b000-00000000627d', 'e2000000-0000-4000-a000-0000000009d9', 3, '![](conteudo/enem/2022/137-d-ccd84f4e.webp)', false),
  ('e2000000-0000-4000-b000-00000000627e', 'e2000000-0000-4000-a000-0000000009d9', 4, '![](conteudo/enem/2022/137-e-1cb4062d.webp)', false),
  ('e2000000-0000-4000-b000-000000006284', 'e2000000-0000-4000-a000-0000000009da', 0, '1,5', false),
  ('e2000000-0000-4000-b000-000000006285', 'e2000000-0000-4000-a000-0000000009da', 1, '2,0', false),
  ('e2000000-0000-4000-b000-000000006286', 'e2000000-0000-4000-a000-0000000009da', 2, '2,9', false),
  ('e2000000-0000-4000-b000-000000006287', 'e2000000-0000-4000-a000-0000000009da', 3, '3,0', true),
  ('e2000000-0000-4000-b000-000000006288', 'e2000000-0000-4000-a000-0000000009da', 4, '5,5', false),
  ('e2000000-0000-4000-b000-00000000628e', 'e2000000-0000-4000-a000-0000000009db', 0, '1,80 e 0,60.', true),
  ('e2000000-0000-4000-b000-00000000628f', 'e2000000-0000-4000-a000-0000000009db', 1, '1,80 e 0,70.', false),
  ('e2000000-0000-4000-b000-000000006290', 'e2000000-0000-4000-a000-0000000009db', 2, '1,90 e 0,80.', false),
  ('e2000000-0000-4000-b000-000000006291', 'e2000000-0000-4000-a000-0000000009db', 3, '2,00 e 0,90.', false),
  ('e2000000-0000-4000-b000-000000006292', 'e2000000-0000-4000-a000-0000000009db', 4, '2,00 e 1,00.', false),
  ('e2000000-0000-4000-b000-000000006298', 'e2000000-0000-4000-a000-0000000009dc', 0, '22.', false),
  ('e2000000-0000-4000-b000-000000006299', 'e2000000-0000-4000-a000-0000000009dc', 1, '25.', true),
  ('e2000000-0000-4000-b000-00000000629a', 'e2000000-0000-4000-a000-0000000009dc', 2, '28.', false),
  ('e2000000-0000-4000-b000-00000000629b', 'e2000000-0000-4000-a000-0000000009dc', 3, '48.', false),
  ('e2000000-0000-4000-b000-00000000629c', 'e2000000-0000-4000-a000-0000000009dc', 4, '64.', false),
  ('e2000000-0000-4000-b000-0000000062a2', 'e2000000-0000-4000-a000-0000000009dd', 0, '![](conteudo/enem/2022/141-a-cd5a2722.webp)', false),
  ('e2000000-0000-4000-b000-0000000062a3', 'e2000000-0000-4000-a000-0000000009dd', 1, '![](conteudo/enem/2022/141-b-3098c816.webp)', false),
  ('e2000000-0000-4000-b000-0000000062a4', 'e2000000-0000-4000-a000-0000000009dd', 2, '![](conteudo/enem/2022/141-c-f1b1ddb0.webp)', false),
  ('e2000000-0000-4000-b000-0000000062a5', 'e2000000-0000-4000-a000-0000000009dd', 3, '![](conteudo/enem/2022/141-d-182be64f.webp)', false),
  ('e2000000-0000-4000-b000-0000000062a6', 'e2000000-0000-4000-a000-0000000009dd', 4, '![](conteudo/enem/2022/141-e-3d293613.webp)', true),
  ('e2000000-0000-4000-b000-0000000062ac', 'e2000000-0000-4000-a000-0000000009de', 0, '8.', false),
  ('e2000000-0000-4000-b000-0000000062ad', 'e2000000-0000-4000-a000-0000000009de', 1, '9.', true),
  ('e2000000-0000-4000-b000-0000000062ae', 'e2000000-0000-4000-a000-0000000009de', 2, '11.', false),
  ('e2000000-0000-4000-b000-0000000062af', 'e2000000-0000-4000-a000-0000000009de', 3, '18.', false),
  ('e2000000-0000-4000-b000-0000000062b0', 'e2000000-0000-4000-a000-0000000009de', 4, '24.', false),
  ('e2000000-0000-4000-b000-0000000062b6', 'e2000000-0000-4000-a000-0000000009df', 0, '![](conteudo/enem/2022/143-a-37b0d8a0.webp)', true),
  ('e2000000-0000-4000-b000-0000000062b7', 'e2000000-0000-4000-a000-0000000009df', 1, '![](conteudo/enem/2022/143-b-c2a2bae5.webp)', false),
  ('e2000000-0000-4000-b000-0000000062b8', 'e2000000-0000-4000-a000-0000000009df', 2, '![](conteudo/enem/2022/143-c-bfd0a9ed.webp)', false),
  ('e2000000-0000-4000-b000-0000000062b9', 'e2000000-0000-4000-a000-0000000009df', 3, '![](conteudo/enem/2022/143-d-b76f04c7.webp)', false),
  ('e2000000-0000-4000-b000-0000000062ba', 'e2000000-0000-4000-a000-0000000009df', 4, '![](conteudo/enem/2022/143-e-2e478466.webp)', false),
  ('e2000000-0000-4000-b000-0000000062c0', 'e2000000-0000-4000-a000-0000000009e0', 0, '50 000.', false),
  ('e2000000-0000-4000-b000-0000000062c1', 'e2000000-0000-4000-a000-0000000009e0', 1, '100 000.', false),
  ('e2000000-0000-4000-b000-0000000062c2', 'e2000000-0000-4000-a000-0000000009e0', 2, '200 000.', false),
  ('e2000000-0000-4000-b000-0000000062c3', 'e2000000-0000-4000-a000-0000000009e0', 3, '300 000.', false),
  ('e2000000-0000-4000-b000-0000000062c4', 'e2000000-0000-4000-a000-0000000009e0', 4, '400 000.', true),
  ('e2000000-0000-4000-b000-0000000062ca', 'e2000000-0000-4000-a000-0000000009e1', 0, '10.', false),
  ('e2000000-0000-4000-b000-0000000062cb', 'e2000000-0000-4000-a000-0000000009e1', 1, '13.', false),
  ('e2000000-0000-4000-b000-0000000062cc', 'e2000000-0000-4000-a000-0000000009e1', 2, '14.', false),
  ('e2000000-0000-4000-b000-0000000062cd', 'e2000000-0000-4000-a000-0000000009e1', 3, '15.', false),
  ('e2000000-0000-4000-b000-0000000062ce', 'e2000000-0000-4000-a000-0000000009e1', 4, '16', true),
  ('e2000000-0000-4000-b000-0000000062d4', 'e2000000-0000-4000-a000-0000000009e2', 0, 'Não satisfatório.', false),
  ('e2000000-0000-4000-b000-0000000062d5', 'e2000000-0000-4000-a000-0000000009e2', 1, 'Regular.', false),
  ('e2000000-0000-4000-b000-0000000062d6', 'e2000000-0000-4000-a000-0000000009e2', 2, 'Bom.', true),
  ('e2000000-0000-4000-b000-0000000062d7', 'e2000000-0000-4000-a000-0000000009e2', 3, 'Muito bom.', false),
  ('e2000000-0000-4000-b000-0000000062d8', 'e2000000-0000-4000-a000-0000000009e2', 4, 'Excelente.', false),
  ('e2000000-0000-4000-b000-0000000062de', 'e2000000-0000-4000-a000-0000000009e3', 0, '![](conteudo/enem/2022/148-a-623219f3.webp)', false),
  ('e2000000-0000-4000-b000-0000000062df', 'e2000000-0000-4000-a000-0000000009e3', 1, '![](conteudo/enem/2022/148-b-ac0ff64f.webp)', false),
  ('e2000000-0000-4000-b000-0000000062e0', 'e2000000-0000-4000-a000-0000000009e3', 2, '![](conteudo/enem/2022/148-c-282300db.webp)', false),
  ('e2000000-0000-4000-b000-0000000062e1', 'e2000000-0000-4000-a000-0000000009e3', 3, '![](conteudo/enem/2022/148-d-2e2fa9f3.webp)', true),
  ('e2000000-0000-4000-b000-0000000062e2', 'e2000000-0000-4000-a000-0000000009e3', 4, '![](conteudo/enem/2022/148-e-c37d4dda.webp)', false),
  ('e2000000-0000-4000-b000-0000000062e8', 'e2000000-0000-4000-a000-0000000009e4', 0, '1,0.', false),
  ('e2000000-0000-4000-b000-0000000062e9', 'e2000000-0000-4000-a000-0000000009e4', 1, '1,5.', true),
  ('e2000000-0000-4000-b000-0000000062ea', 'e2000000-0000-4000-a000-0000000009e4', 2, '1,9.', false),
  ('e2000000-0000-4000-b000-0000000062eb', 'e2000000-0000-4000-a000-0000000009e4', 3, '2,1.', false),
  ('e2000000-0000-4000-b000-0000000062ec', 'e2000000-0000-4000-a000-0000000009e4', 4, '2,5.', false),
  ('e2000000-0000-4000-b000-0000000062f2', 'e2000000-0000-4000-a000-0000000009e5', 0, 'Apenas no ginásio I.', false),
  ('e2000000-0000-4000-b000-0000000062f3', 'e2000000-0000-4000-a000-0000000009e5', 1, 'Apenas nos ginásios I e II.', false),
  ('e2000000-0000-4000-b000-0000000062f4', 'e2000000-0000-4000-a000-0000000009e5', 2, 'Apenas nos ginásios I, II e III.', false),
  ('e2000000-0000-4000-b000-0000000062f5', 'e2000000-0000-4000-a000-0000000009e5', 3, 'Apenas nos ginásios I, II, III e IV.', true),
  ('e2000000-0000-4000-b000-0000000062f6', 'e2000000-0000-4000-a000-0000000009e5', 4, 'Em todos os ginásios.', false),
  ('e2000000-0000-4000-b000-0000000062fc', 'e2000000-0000-4000-a000-0000000009e6', 0, '30 minutos ou menos.', false),
  ('e2000000-0000-4000-b000-0000000062fd', 'e2000000-0000-4000-a000-0000000009e6', 1, 'Mais de 35 e menos de 45 minutos.', false),
  ('e2000000-0000-4000-b000-0000000062fe', 'e2000000-0000-4000-a000-0000000009e6', 2, 'Mais de 45 e menos de 55 minutos.', true),
  ('e2000000-0000-4000-b000-0000000062ff', 'e2000000-0000-4000-a000-0000000009e6', 3, 'Mais de 60 e menos de 70 minutos.', false),
  ('e2000000-0000-4000-b000-000000006300', 'e2000000-0000-4000-a000-0000000009e6', 4, '70 minutos ou mais.', false),
  ('e2000000-0000-4000-b000-000000006306', 'e2000000-0000-4000-a000-0000000009e7', 0, '26', false),
  ('e2000000-0000-4000-b000-000000006307', 'e2000000-0000-4000-a000-0000000009e7', 1, '27', false),
  ('e2000000-0000-4000-b000-000000006308', 'e2000000-0000-4000-a000-0000000009e7', 2, '28', true),
  ('e2000000-0000-4000-b000-000000006309', 'e2000000-0000-4000-a000-0000000009e7', 3, '29', false),
  ('e2000000-0000-4000-b000-00000000630a', 'e2000000-0000-4000-a000-0000000009e7', 4, '35', false),
  ('e2000000-0000-4000-b000-000000006310', 'e2000000-0000-4000-a000-0000000009e8', 0, '1,52.', false),
  ('e2000000-0000-4000-b000-000000006311', 'e2000000-0000-4000-a000-0000000009e8', 1, '3,24.', false),
  ('e2000000-0000-4000-b000-000000006312', 'e2000000-0000-4000-a000-0000000009e8', 2, '3,60.', true),
  ('e2000000-0000-4000-b000-000000006313', 'e2000000-0000-4000-a000-0000000009e8', 3, '6,48.', false),
  ('e2000000-0000-4000-b000-000000006314', 'e2000000-0000-4000-a000-0000000009e8', 4, '7,20.', false),
  ('e2000000-0000-4000-b000-00000000631a', 'e2000000-0000-4000-a000-0000000009e9', 0, '16 514.', false),
  ('e2000000-0000-4000-b000-00000000631b', 'e2000000-0000-4000-a000-0000000009e9', 1, '86 700.', false),
  ('e2000000-0000-4000-b000-00000000631c', 'e2000000-0000-4000-a000-0000000009e9', 2, '115 600.', true),
  ('e2000000-0000-4000-b000-00000000631d', 'e2000000-0000-4000-a000-0000000009e9', 3, '441 343.', false),
  ('e2000000-0000-4000-b000-00000000631e', 'e2000000-0000-4000-a000-0000000009e9', 4, '448 568.', false),
  ('e2000000-0000-4000-b000-000000006324', 'e2000000-0000-4000-a000-0000000009ea', 0, '![](conteudo/enem/2022/155-a-4e4d5692.webp)', false),
  ('e2000000-0000-4000-b000-000000006325', 'e2000000-0000-4000-a000-0000000009ea', 1, '![](conteudo/enem/2022/155-b-2b0fcee8.webp)', true),
  ('e2000000-0000-4000-b000-000000006326', 'e2000000-0000-4000-a000-0000000009ea', 2, '![](conteudo/enem/2022/155-c-e2dfe176.webp)', false),
  ('e2000000-0000-4000-b000-000000006327', 'e2000000-0000-4000-a000-0000000009ea', 3, '![](conteudo/enem/2022/155-d-0681d716.webp)', false),
  ('e2000000-0000-4000-b000-000000006328', 'e2000000-0000-4000-a000-0000000009ea', 4, '![](conteudo/enem/2022/155-e-027b58bd.webp)', false),
  ('e2000000-0000-4000-b000-00000000632e', 'e2000000-0000-4000-a000-0000000009eb', 0, '![](conteudo/enem/2022/156-a-538392d5.webp)', false),
  ('e2000000-0000-4000-b000-00000000632f', 'e2000000-0000-4000-a000-0000000009eb', 1, '![](conteudo/enem/2022/156-b-78436952.webp)', false),
  ('e2000000-0000-4000-b000-000000006330', 'e2000000-0000-4000-a000-0000000009eb', 2, '![](conteudo/enem/2022/156-c-ddf97279.webp)', true),
  ('e2000000-0000-4000-b000-000000006331', 'e2000000-0000-4000-a000-0000000009eb', 3, '![](conteudo/enem/2022/156-d-b09ad37a.webp)', false),
  ('e2000000-0000-4000-b000-000000006332', 'e2000000-0000-4000-a000-0000000009eb', 4, '![](conteudo/enem/2022/156-e-c3221442.webp)', false),
  ('e2000000-0000-4000-b000-000000006338', 'e2000000-0000-4000-a000-0000000009ec', 0, '![](conteudo/enem/2022/157-a-fc471085.webp)', false),
  ('e2000000-0000-4000-b000-000000006339', 'e2000000-0000-4000-a000-0000000009ec', 1, '![](conteudo/enem/2022/157-b-e90bf791.webp)', false),
  ('e2000000-0000-4000-b000-00000000633a', 'e2000000-0000-4000-a000-0000000009ec', 2, '![](conteudo/enem/2022/157-c-693a22d0.webp)', false),
  ('e2000000-0000-4000-b000-00000000633b', 'e2000000-0000-4000-a000-0000000009ec', 3, '![](conteudo/enem/2022/157-d-62e359c4.webp)', false),
  ('e2000000-0000-4000-b000-00000000633c', 'e2000000-0000-4000-a000-0000000009ec', 4, '![](conteudo/enem/2022/157-e-af3c085b.webp)', true),
  ('e2000000-0000-4000-b000-000000006342', 'e2000000-0000-4000-a000-0000000009ed', 0, 'I.', false),
  ('e2000000-0000-4000-b000-000000006343', 'e2000000-0000-4000-a000-0000000009ed', 1, 'II.', false),
  ('e2000000-0000-4000-b000-000000006344', 'e2000000-0000-4000-a000-0000000009ed', 2, 'III.', true),
  ('e2000000-0000-4000-b000-000000006345', 'e2000000-0000-4000-a000-0000000009ed', 3, 'IV.', false),
  ('e2000000-0000-4000-b000-000000006346', 'e2000000-0000-4000-a000-0000000009ed', 4, 'V.', false),
  ('e2000000-0000-4000-b000-00000000634c', 'e2000000-0000-4000-a000-0000000009ee', 0, '![](conteudo/enem/2022/159-a-63615e39.webp)', false),
  ('e2000000-0000-4000-b000-00000000634d', 'e2000000-0000-4000-a000-0000000009ee', 1, '![](conteudo/enem/2022/159-b-cd6feba8.webp)', true),
  ('e2000000-0000-4000-b000-00000000634e', 'e2000000-0000-4000-a000-0000000009ee', 2, '![](conteudo/enem/2022/159-c-f321765a.webp)', false),
  ('e2000000-0000-4000-b000-00000000634f', 'e2000000-0000-4000-a000-0000000009ee', 3, '![](conteudo/enem/2022/159-d-0a5dac06.webp)', false),
  ('e2000000-0000-4000-b000-000000006350', 'e2000000-0000-4000-a000-0000000009ee', 4, '![](conteudo/enem/2022/159-e-a9fa3b63.webp)', false),
  ('e2000000-0000-4000-b000-000000006356', 'e2000000-0000-4000-a000-0000000009ef', 0, '![](conteudo/enem/2022/160-a-5d7821fa.webp)', true),
  ('e2000000-0000-4000-b000-000000006357', 'e2000000-0000-4000-a000-0000000009ef', 1, '![](conteudo/enem/2022/160-b-6a4daa1c.webp)', false),
  ('e2000000-0000-4000-b000-000000006358', 'e2000000-0000-4000-a000-0000000009ef', 2, '![](conteudo/enem/2022/160-c-41ab922d.webp)', false),
  ('e2000000-0000-4000-b000-000000006359', 'e2000000-0000-4000-a000-0000000009ef', 3, '![](conteudo/enem/2022/160-d-79a7fd8e.webp)', false),
  ('e2000000-0000-4000-b000-00000000635a', 'e2000000-0000-4000-a000-0000000009ef', 4, '![](conteudo/enem/2022/160-e-2dacf59f.webp)', false),
  ('e2000000-0000-4000-b000-000000006360', 'e2000000-0000-4000-a000-0000000009f0', 0, '33,40', true),
  ('e2000000-0000-4000-b000-000000006361', 'e2000000-0000-4000-a000-0000000009f0', 1, '66,80', false),
  ('e2000000-0000-4000-b000-000000006362', 'e2000000-0000-4000-a000-0000000009f0', 2, '89,24', false),
  ('e2000000-0000-4000-b000-000000006363', 'e2000000-0000-4000-a000-0000000009f0', 3, '133,60', false),
  ('e2000000-0000-4000-b000-000000006364', 'e2000000-0000-4000-a000-0000000009f0', 4, '534,40', false),
  ('e2000000-0000-4000-b000-00000000636a', 'e2000000-0000-4000-a000-0000000009f1', 0, '5 000', false),
  ('e2000000-0000-4000-b000-00000000636b', 'e2000000-0000-4000-a000-0000000009f1', 1, '7 000', false),
  ('e2000000-0000-4000-b000-00000000636c', 'e2000000-0000-4000-a000-0000000009f1', 2, '11 000', true),
  ('e2000000-0000-4000-b000-00000000636d', 'e2000000-0000-4000-a000-0000000009f1', 3, '18 000', false),
  ('e2000000-0000-4000-b000-00000000636e', 'e2000000-0000-4000-a000-0000000009f1', 4, '29 000', false),
  ('e2000000-0000-4000-b000-000000006374', 'e2000000-0000-4000-a000-0000000009f2', 0, '14,4.', false),
  ('e2000000-0000-4000-b000-000000006375', 'e2000000-0000-4000-a000-0000000009f2', 1, '20,7.', false),
  ('e2000000-0000-4000-b000-000000006376', 'e2000000-0000-4000-a000-0000000009f2', 2, '22,0.', false),
  ('e2000000-0000-4000-b000-000000006377', 'e2000000-0000-4000-a000-0000000009f2', 3, '30,0.', true),
  ('e2000000-0000-4000-b000-000000006378', 'e2000000-0000-4000-a000-0000000009f2', 4, '37,5', false),
  ('e2000000-0000-4000-b000-00000000637e', 'e2000000-0000-4000-a000-0000000009f3', 0, '0,125.', false),
  ('e2000000-0000-4000-b000-00000000637f', 'e2000000-0000-4000-a000-0000000009f3', 1, '0,200.', true),
  ('e2000000-0000-4000-b000-000000006380', 'e2000000-0000-4000-a000-0000000009f3', 2, '4,800.', false),
  ('e2000000-0000-4000-b000-000000006381', 'e2000000-0000-4000-a000-0000000009f3', 3, '6,000.', false),
  ('e2000000-0000-4000-b000-000000006382', 'e2000000-0000-4000-a000-0000000009f3', 4, '12,000.', false),
  ('e2000000-0000-4000-b000-000000006388', 'e2000000-0000-4000-a000-0000000009f4', 0, '2,5', true),
  ('e2000000-0000-4000-b000-000000006389', 'e2000000-0000-4000-a000-0000000009f4', 1, '10,0', false),
  ('e2000000-0000-4000-b000-00000000638a', 'e2000000-0000-4000-a000-0000000009f4', 2, '730,0', false),
  ('e2000000-0000-4000-b000-00000000638b', 'e2000000-0000-4000-a000-0000000009f4', 3, '13 322,5', false),
  ('e2000000-0000-4000-b000-00000000638c', 'e2000000-0000-4000-a000-0000000009f4', 4, '53 290,0', false),
  ('e2000000-0000-4000-b000-000000006392', 'e2000000-0000-4000-a000-0000000009f5', 0, 'R$ 2,00 menor.', true),
  ('e2000000-0000-4000-b000-000000006393', 'e2000000-0000-4000-a000-0000000009f5', 1, 'R$ 100,00 menor.', false),
  ('e2000000-0000-4000-b000-000000006394', 'e2000000-0000-4000-a000-0000000009f5', 2, 'R$ 200,00 menor.', false),
  ('e2000000-0000-4000-b000-000000006395', 'e2000000-0000-4000-a000-0000000009f5', 3, 'R$ 42,00 maior.', false),
  ('e2000000-0000-4000-b000-000000006396', 'e2000000-0000-4000-a000-0000000009f5', 4, 'R$ 80,00 maior.', false),
  ('e2000000-0000-4000-b000-00000000639c', 'e2000000-0000-4000-a000-0000000009f6', 0, 'DDEFDDEEFFD.', false),
  ('e2000000-0000-4000-b000-00000000639d', 'e2000000-0000-4000-a000-0000000009f6', 1, 'DFEFDDDEFFD.', false),
  ('e2000000-0000-4000-b000-00000000639e', 'e2000000-0000-4000-a000-0000000009f6', 2, 'DFEFDDEEFFD.', true),
  ('e2000000-0000-4000-b000-00000000639f', 'e2000000-0000-4000-a000-0000000009f6', 3, 'EFDFEEDDFFE.', false),
  ('e2000000-0000-4000-b000-0000000063a0', 'e2000000-0000-4000-a000-0000000009f6', 4, 'EFDFEEEDFFE.', false),
  ('e2000000-0000-4000-b000-0000000063a6', 'e2000000-0000-4000-a000-0000000009f7', 0, 'I.', false),
  ('e2000000-0000-4000-b000-0000000063a7', 'e2000000-0000-4000-a000-0000000009f7', 1, 'II.', false),
  ('e2000000-0000-4000-b000-0000000063a8', 'e2000000-0000-4000-a000-0000000009f7', 2, 'III.', false),
  ('e2000000-0000-4000-b000-0000000063a9', 'e2000000-0000-4000-a000-0000000009f7', 3, 'IV.', false),
  ('e2000000-0000-4000-b000-0000000063aa', 'e2000000-0000-4000-a000-0000000009f7', 4, 'V.', true),
  ('e2000000-0000-4000-b000-0000000063b0', 'e2000000-0000-4000-a000-0000000009f8', 0, '2005', false),
  ('e2000000-0000-4000-b000-0000000063b1', 'e2000000-0000-4000-a000-0000000009f8', 1, '2007', true),
  ('e2000000-0000-4000-b000-0000000063b2', 'e2000000-0000-4000-a000-0000000009f8', 2, '2009', false),
  ('e2000000-0000-4000-b000-0000000063b3', 'e2000000-0000-4000-a000-0000000009f8', 3, '2011', false),
  ('e2000000-0000-4000-b000-0000000063b4', 'e2000000-0000-4000-a000-0000000009f8', 4, '2013', false),
  ('e2000000-0000-4000-b000-0000000063ba', 'e2000000-0000-4000-a000-0000000009f9', 0, 'I.', true),
  ('e2000000-0000-4000-b000-0000000063bb', 'e2000000-0000-4000-a000-0000000009f9', 1, 'II.', false),
  ('e2000000-0000-4000-b000-0000000063bc', 'e2000000-0000-4000-a000-0000000009f9', 2, 'III.', false),
  ('e2000000-0000-4000-b000-0000000063bd', 'e2000000-0000-4000-a000-0000000009f9', 3, 'IV.', false),
  ('e2000000-0000-4000-b000-0000000063be', 'e2000000-0000-4000-a000-0000000009f9', 4, 'V.', false),
  ('e2000000-0000-4000-b000-0000000063c4', 'e2000000-0000-4000-a000-0000000009fa', 0, 'I.', false),
  ('e2000000-0000-4000-b000-0000000063c5', 'e2000000-0000-4000-a000-0000000009fa', 1, 'II.', true),
  ('e2000000-0000-4000-b000-0000000063c6', 'e2000000-0000-4000-a000-0000000009fa', 2, 'III.', false),
  ('e2000000-0000-4000-b000-0000000063c7', 'e2000000-0000-4000-a000-0000000009fa', 3, 'IV.', false),
  ('e2000000-0000-4000-b000-0000000063c8', 'e2000000-0000-4000-a000-0000000009fa', 4, 'V.', false),
  ('e2000000-0000-4000-b000-0000000063ce', 'e2000000-0000-4000-a000-0000000009fb', 0, '200', false),
  ('e2000000-0000-4000-b000-0000000063cf', 'e2000000-0000-4000-a000-0000000009fb', 1, '400', false),
  ('e2000000-0000-4000-b000-0000000063d0', 'e2000000-0000-4000-a000-0000000009fb', 2, '1200', false),
  ('e2000000-0000-4000-b000-0000000063d1', 'e2000000-0000-4000-a000-0000000009fb', 3, '1235', true),
  ('e2000000-0000-4000-b000-0000000063d2', 'e2000000-0000-4000-a000-0000000009fb', 4, '7200', false),
  ('e2000000-0000-4000-b000-0000000063d8', 'e2000000-0000-4000-a000-0000000009fc', 0, '800', false),
  ('e2000000-0000-4000-b000-0000000063d9', 'e2000000-0000-4000-a000-0000000009fc', 1, '1200', false),
  ('e2000000-0000-4000-b000-0000000063da', 'e2000000-0000-4000-a000-0000000009fc', 2, '2400', false),
  ('e2000000-0000-4000-b000-0000000063db', 'e2000000-0000-4000-a000-0000000009fc', 3, '4800', true),
  ('e2000000-0000-4000-b000-0000000063dc', 'e2000000-0000-4000-a000-0000000009fc', 4, '6400', false),
  ('e2000000-0000-4000-b000-0000000063e2', 'e2000000-0000-4000-a000-0000000009fd', 0, '135 000,00.', false),
  ('e2000000-0000-4000-b000-0000000063e3', 'e2000000-0000-4000-a000-0000000009fd', 1, '1 350 000,00.', false),
  ('e2000000-0000-4000-b000-0000000063e4', 'e2000000-0000-4000-a000-0000000009fd', 2, '13 500 000,00.', false),
  ('e2000000-0000-4000-b000-0000000063e5', 'e2000000-0000-4000-a000-0000000009fd', 3, '135 000 000,00.', false),
  ('e2000000-0000-4000-b000-0000000063e6', 'e2000000-0000-4000-a000-0000000009fd', 4, '1 350 000 000,00', true),
  ('e2000000-0000-4000-b000-0000000063ec', 'e2000000-0000-4000-a000-0000000009fe', 0, 'I', false),
  ('e2000000-0000-4000-b000-0000000063ed', 'e2000000-0000-4000-a000-0000000009fe', 1, 'II', false),
  ('e2000000-0000-4000-b000-0000000063ee', 'e2000000-0000-4000-a000-0000000009fe', 2, 'III', false),
  ('e2000000-0000-4000-b000-0000000063ef', 'e2000000-0000-4000-a000-0000000009fe', 3, 'IV', true),
  ('e2000000-0000-4000-b000-0000000063f0', 'e2000000-0000-4000-a000-0000000009fe', 4, 'V', false),
  ('e2000000-0000-4000-b000-0000000063f6', 'e2000000-0000-4000-a000-0000000009ff', 0, 'I.', true),
  ('e2000000-0000-4000-b000-0000000063f7', 'e2000000-0000-4000-a000-0000000009ff', 1, 'II.', false),
  ('e2000000-0000-4000-b000-0000000063f8', 'e2000000-0000-4000-a000-0000000009ff', 2, 'III.', false),
  ('e2000000-0000-4000-b000-0000000063f9', 'e2000000-0000-4000-a000-0000000009ff', 3, 'IV.', false),
  ('e2000000-0000-4000-b000-0000000063fa', 'e2000000-0000-4000-a000-0000000009ff', 4, 'V.', false),
  ('e2000000-0000-4000-b000-000000006400', 'e2000000-0000-4000-a000-000000000a00', 0, '2', false),
  ('e2000000-0000-4000-b000-000000006401', 'e2000000-0000-4000-a000-000000000a00', 1, '3', false),
  ('e2000000-0000-4000-b000-000000006402', 'e2000000-0000-4000-a000-000000000a00', 2, '6', false),
  ('e2000000-0000-4000-b000-000000006403', 'e2000000-0000-4000-a000-000000000a00', 3, '12', false),
  ('e2000000-0000-4000-b000-000000006404', 'e2000000-0000-4000-a000-000000000a00', 4, '24', true),
  ('e2000000-0000-4000-b000-00000000640a', 'e2000000-0000-4000-a000-000000000a01', 0, '74,23.', false),
  ('e2000000-0000-4000-b000-00000000640b', 'e2000000-0000-4000-a000-000000000a01', 1, '74,51.', true),
  ('e2000000-0000-4000-b000-00000000640c', 'e2000000-0000-4000-a000-000000000a01', 2, '75,07.', false),
  ('e2000000-0000-4000-b000-00000000640d', 'e2000000-0000-4000-a000-000000000a01', 3, '75,23.', false),
  ('e2000000-0000-4000-b000-00000000640e', 'e2000000-0000-4000-a000-000000000a01', 4, '78,49.', false),
  ('e2000000-0000-4000-b000-000000006414', 'e2000000-0000-4000-a000-000000000a02', 0, '![](conteudo/enem/2022/180-a-05cb2bb8.webp)', false),
  ('e2000000-0000-4000-b000-000000006415', 'e2000000-0000-4000-a000-000000000a02', 1, '![](conteudo/enem/2022/180-b-23fc7b65.webp)', false),
  ('e2000000-0000-4000-b000-000000006416', 'e2000000-0000-4000-a000-000000000a02', 2, '![](conteudo/enem/2022/180-c-5be81d3b.webp)', false),
  ('e2000000-0000-4000-b000-000000006417', 'e2000000-0000-4000-a000-000000000a02', 3, '![](conteudo/enem/2022/180-d-c29e4144.webp)', false),
  ('e2000000-0000-4000-b000-000000006418', 'e2000000-0000-4000-a000-000000000a02', 4, '![](conteudo/enem/2022/180-e-5e135009.webp)', true),
  ('e2000000-0000-4000-b000-00000000641e', 'e2000000-0000-4000-a000-000000000a03', 0, 'Os lixões precisam de ampliação.', false),
  ('e2000000-0000-4000-b000-00000000641f', 'e2000000-0000-4000-a000-000000000a03', 1, 'O desperdício degrada o ambiente.', true),
  ('e2000000-0000-4000-b000-000000006420', 'e2000000-0000-4000-a000-000000000a03', 2, 'Os mercados doam alimentos perecíveis.', false),
  ('e2000000-0000-4000-b000-000000006421', 'e2000000-0000-4000-a000-000000000a03', 3, 'A desnutrição compromete o raciocínio.', false),
  ('e2000000-0000-4000-b000-000000006422', 'e2000000-0000-4000-a000-000000000a03', 4, 'As residências carecem de refrigeradores.', false),
  ('e2000000-0000-4000-b000-000000006428', 'e2000000-0000-4000-a000-000000000a04', 0, 'Advérbios como "rotundamente" e "categóricamente".', true),
  ('e2000000-0000-4000-b000-000000006429', 'e2000000-0000-4000-a000-000000000a04', 1, 'Verbos reflexivos como "me niego" e "me acepto".', false),
  ('e2000000-0000-4000-b000-00000000642a', 'e2000000-0000-4000-a000-000000000a04', 2, 'Adjetivos como "grande" e "hermosa".', false),
  ('e2000000-0000-4000-b000-00000000642b', 'e2000000-0000-4000-a000-000000000a04', 3, 'Substantivos como "sangre" e "piel".', false),
  ('e2000000-0000-4000-b000-00000000642c', 'e2000000-0000-4000-a000-000000000a04', 4, 'Adjetivos possessivos como "mi" e "mis".', false),
  ('e2000000-0000-4000-b000-000000006432', 'e2000000-0000-4000-a000-000000000a05', 0, 'Medo da morte.', false),
  ('e2000000-0000-4000-b000-000000006433', 'e2000000-0000-4000-a000-000000000a05', 1, 'Ideia de conexão.', true),
  ('e2000000-0000-4000-b000-000000006434', 'e2000000-0000-4000-a000-000000000a05', 2, 'Conceito de solidão.', false),
  ('e2000000-0000-4000-b000-000000006435', 'e2000000-0000-4000-a000-000000000a05', 3, 'Risco de devastação.', false),
  ('e2000000-0000-4000-b000-000000006436', 'e2000000-0000-4000-a000-000000000a05', 4, 'Necessidade de empatia.', false),
  ('e2000000-0000-4000-b000-00000000643c', 'e2000000-0000-4000-a000-000000000a06', 0, 'Característica amistosa do povo espanhol.', false),
  ('e2000000-0000-4000-b000-00000000643d', 'e2000000-0000-4000-a000-000000000a06', 1, 'Beleza das paisagens naturais da Espanha.', false),
  ('e2000000-0000-4000-b000-00000000643e', 'e2000000-0000-4000-a000-000000000a06', 2, 'Variedade de pratos na gastronomia espanhola.', false),
  ('e2000000-0000-4000-b000-00000000643f', 'e2000000-0000-4000-a000-000000000a06', 3, 'Relação entre os sentidos do paladar e do olfato na gastronomia.', false),
  ('e2000000-0000-4000-b000-000000006440', 'e2000000-0000-4000-a000-000000000a06', 4, 'Gastronomia como representação da identidade cultural de um povo.', true),
  ('e2000000-0000-4000-b000-000000006446', 'e2000000-0000-4000-a000-000000000a07', 0, 'Risco de choques culturais.', false),
  ('e2000000-0000-4000-b000-000000006447', 'e2000000-0000-4000-a000-000000000a07', 1, 'Impacto do ensino de história.', false),
  ('e2000000-0000-4000-b000-000000006448', 'e2000000-0000-4000-a000-000000000a07', 2, 'Importância da luta ambiental.', false),
  ('e2000000-0000-4000-b000-000000006449', 'e2000000-0000-4000-a000-000000000a07', 3, 'Existência de experiências plurais.', true),
  ('e2000000-0000-4000-b000-00000000644a', 'e2000000-0000-4000-a000-000000000a07', 4, 'Necessidade de capacitação profissional.', false),
  ('e2000000-0000-4000-b000-000000006450', 'e2000000-0000-4000-a000-000000000a08', 0, 'Amadurece tardiamente.', false),
  ('e2000000-0000-4000-b000-000000006451', 'e2000000-0000-4000-a000-000000000a08', 1, 'Busca mascarar a verdade.', true),
  ('e2000000-0000-4000-b000-000000006452', 'e2000000-0000-4000-a000-000000000a08', 2, 'Rejeita questionamentos alheios.', false),
  ('e2000000-0000-4000-b000-000000006453', 'e2000000-0000-4000-a000-000000000a08', 3, 'Aproxima-se de pessoas indefesas.', false),
  ('e2000000-0000-4000-b000-000000006454', 'e2000000-0000-4000-a000-000000000a08', 4, 'Faz-se presente de forma controladora.', false),
  ('e2000000-0000-4000-b000-00000000645a', 'e2000000-0000-4000-a000-000000000a09', 0, 'Convergência linguístico-cultural.', true),
  ('e2000000-0000-4000-b000-00000000645b', 'e2000000-0000-4000-a000-000000000a09', 1, 'Características históricio-cultural.', false),
  ('e2000000-0000-4000-b000-00000000645c', 'e2000000-0000-4000-a000-000000000a09', 2, 'Tendência estilístico-literária', false),
  ('e2000000-0000-4000-b000-00000000645d', 'e2000000-0000-4000-a000-000000000a09', 3, 'Discriminação cultural.', false),
  ('e2000000-0000-4000-b000-00000000645e', 'e2000000-0000-4000-a000-000000000a09', 4, 'Censura musical.', false),
  ('e2000000-0000-4000-b000-000000006464', 'e2000000-0000-4000-a000-000000000a0a', 0, 'Indignação diante do desrespeito à diversidade.', true),
  ('e2000000-0000-4000-b000-000000006465', 'e2000000-0000-4000-a000-000000000a0a', 1, 'Violência característica das grandes metrópoles.', false),
  ('e2000000-0000-4000-b000-000000006466', 'e2000000-0000-4000-a000-000000000a0a', 2, 'Preconceito da sociedade com relação ao misticismo.', false),
  ('e2000000-0000-4000-b000-000000006467', 'e2000000-0000-4000-a000-000000000a0a', 3, 'Descuido da população com sonhos dos imigrantes.', false),
  ('e2000000-0000-4000-b000-000000006468', 'e2000000-0000-4000-a000-000000000a0a', 4, 'Falta de segurança existente no transporte público urbano.', false),
  ('e2000000-0000-4000-b000-00000000646e', 'e2000000-0000-4000-a000-000000000a0b', 0, 'Unificação do lema anterior ao atual.', false),
  ('e2000000-0000-4000-b000-00000000646f', 'e2000000-0000-4000-a000-000000000a0b', 1, 'Aproximação entre o lema olímpico e o COI.', false),
  ('e2000000-0000-4000-b000-000000006470', 'e2000000-0000-4000-a000-000000000a0b', 2, 'Junção do lema olímpico com os princípios esportivos.', false),
  ('e2000000-0000-4000-b000-000000006471', 'e2000000-0000-4000-a000-000000000a0b', 3, 'Associação entre o lema olímpico e a cooperatividade.', true),
  ('e2000000-0000-4000-b000-000000006472', 'e2000000-0000-4000-a000-000000000a0b', 4, 'Vinculação entre o lema olímpico e os eventos atléticos.', false),
  ('e2000000-0000-4000-b000-000000006478', 'e2000000-0000-4000-a000-000000000a0c', 0, 'Revelam as marcas da violência de raça e de gênero na construção da identidade.', true),
  ('e2000000-0000-4000-b000-000000006479', 'e2000000-0000-4000-a000-000000000a0c', 1, 'Questionam o pioneirismo do estado do Ceará no enfrentamento à escravidão.', false),
  ('e2000000-0000-4000-b000-00000000647a', 'e2000000-0000-4000-a000-000000000a0c', 2, 'Reproduzem padrões estéticos em busca da valorização da autoestima feminina.', false),
  ('e2000000-0000-4000-b000-00000000647b', 'e2000000-0000-4000-a000-000000000a0c', 3, 'Sugerem uma atmosfera onírica alinhada ao desejo de resgate da espiritualidade.', false),
  ('e2000000-0000-4000-b000-00000000647c', 'e2000000-0000-4000-a000-000000000a0c', 4, 'Mimetizam, na paisagem, os corpos transformados pela violência da escravidão.', false),
  ('e2000000-0000-4000-b000-000000006482', 'e2000000-0000-4000-a000-000000000a0d', 0, 'À dificuldade de consolidação da literatura brasileira em outros países.', false),
  ('e2000000-0000-4000-b000-000000006483', 'e2000000-0000-4000-a000-000000000a0d', 1, 'Aos diferentes graus de instrução formal entre os falantes de língua portuguesa.', false),
  ('e2000000-0000-4000-b000-000000006484', 'e2000000-0000-4000-a000-000000000a0d', 2, 'À existência de uma língua ideal que alguns falantes lusitanos creem ser a falada em Portugal.', true),
  ('e2000000-0000-4000-b000-000000006485', 'e2000000-0000-4000-a000-000000000a0d', 3, 'Ao intercâmbio cultural que ocorre entre os povos dos diferentes países de língua portuguesa.', false),
  ('e2000000-0000-4000-b000-000000006486', 'e2000000-0000-4000-a000-000000000a0d', 4, 'À distância territorial entre os falantes do português que vivem em Portugal e no Brasil.', false),
  ('e2000000-0000-4000-b000-00000000648c', 'e2000000-0000-4000-a000-000000000a0e', 0, 'Velocidade de circulação das notícias.', false),
  ('e2000000-0000-4000-b000-00000000648d', 'e2000000-0000-4000-a000-000000000a0e', 1, 'Nível de letramento da população marginalizada.', false),
  ('e2000000-0000-4000-b000-00000000648e', 'e2000000-0000-4000-a000-000000000a0e', 2, 'Poder de censura por parte dos serviços públicos.', false),
  ('e2000000-0000-4000-b000-00000000648f', 'e2000000-0000-4000-a000-000000000a0e', 3, 'Legitimidade da voz dos representantes da nobreza.', false),
  ('e2000000-0000-4000-b000-000000006490', 'e2000000-0000-4000-a000-000000000a0e', 4, 'Diversidade dos meios disponíveis em uma época histórica.', true),
  ('e2000000-0000-4000-b000-000000006496', 'e2000000-0000-4000-a000-000000000a0f', 0, 'Controle da atuação dos profissionais de TI.', false),
  ('e2000000-0000-4000-b000-000000006497', 'e2000000-0000-4000-a000-000000000a0f', 1, 'Desenvolvimento de tecnologias como os "trolls".', false),
  ('e2000000-0000-4000-b000-000000006498', 'e2000000-0000-4000-a000-000000000a0f', 2, 'Flexibilização dos turnos de trabalho dos controladores.', false),
  ('e2000000-0000-4000-b000-000000006499', 'e2000000-0000-4000-a000-000000000a0f', 3, 'Necessidade de regulamentação do funcionamento dos "bots"', false),
  ('e2000000-0000-4000-b000-00000000649a', 'e2000000-0000-4000-a000-000000000a0f', 4, 'Identificação de padrões de disseminação de informações inverídicas.', true),
  ('e2000000-0000-4000-b000-0000000064a0', 'e2000000-0000-4000-a000-000000000a10', 0, 'Enumerar as causas determinantes da violência no trânsito.', false),
  ('e2000000-0000-4000-b000-0000000064a1', 'e2000000-0000-4000-a000-000000000a10', 1, 'Contextualizar a campanha de advertência no cenário mundial.', false),
  ('e2000000-0000-4000-b000-0000000064a2', 'e2000000-0000-4000-a000-000000000a10', 2, 'Divulgar dados numéricos alarmantes sobre acidentes de trânsito.', false),
  ('e2000000-0000-4000-b000-0000000064a3', 'e2000000-0000-4000-a000-000000000a10', 3, 'Sensibilizar o público para a importância de uma direção responsável.', true),
  ('e2000000-0000-4000-b000-0000000064a4', 'e2000000-0000-4000-a000-000000000a10', 4, 'Restringir os problemas da violência no trânsito a aspectos emocionais.', false),
  ('e2000000-0000-4000-b000-0000000064aa', 'e2000000-0000-4000-a000-000000000a11', 0, 'Opção por termos e expressões de sentido ambíguo.', false),
  ('e2000000-0000-4000-b000-0000000064ab', 'e2000000-0000-4000-a000-000000000a11', 1, 'Crítica social inspirada pelo convívio com os patrões.', false),
  ('e2000000-0000-4000-b000-0000000064ac', 'e2000000-0000-4000-a000-000000000a11', 2, 'Descrição impressionista do fetiche do personagem.', true),
  ('e2000000-0000-4000-b000-0000000064ad', 'e2000000-0000-4000-a000-000000000a11', 3, 'Presença de um foco narrativo de caráter impreciso.', false),
  ('e2000000-0000-4000-b000-0000000064ae', 'e2000000-0000-4000-a000-000000000a11', 4, 'Ambiência de mistério das relações entre familiares.', false),
  ('e2000000-0000-4000-b000-0000000064b4', 'e2000000-0000-4000-a000-000000000a12', 0, 'Vergonha das marcas provocadas pela passagem do tempo.', false),
  ('e2000000-0000-4000-b000-0000000064b5', 'e2000000-0000-4000-a000-000000000a12', 1, 'Indecisão em face das possibilidades afetivas do presente.', false),
  ('e2000000-0000-4000-b000-0000000064b6', 'e2000000-0000-4000-a000-000000000a12', 2, 'Serenidade sedimentada pela entrega pacifica ao desejo.', true),
  ('e2000000-0000-4000-b000-0000000064b7', 'e2000000-0000-4000-a000-000000000a12', 3, 'Frustração causada pela vontade de retorno ao passado.', false),
  ('e2000000-0000-4000-b000-0000000064b8', 'e2000000-0000-4000-a000-000000000a12', 4, 'Disponibilidade para a exploração do prazer efêmero.', false),
  ('e2000000-0000-4000-b000-0000000064be', 'e2000000-0000-4000-a000-000000000a13', 0, 'Qualidade do som do rádio.', false),
  ('e2000000-0000-4000-b000-0000000064bf', 'e2000000-0000-4000-a000-000000000a13', 1, 'Estabilidade do enredo contado.', false),
  ('e2000000-0000-4000-b000-0000000064c0', 'e2000000-0000-4000-a000-000000000a13', 2, 'Ineditismo do capítulo da novela.', false),
  ('e2000000-0000-4000-b000-0000000064c1', 'e2000000-0000-4000-a000-000000000a13', 3, 'Jeito singular de falar aos ouvintes.', true),
  ('e2000000-0000-4000-b000-0000000064c2', 'e2000000-0000-4000-a000-000000000a13', 4, 'Dificuldade de compreensão da história.', false),
  ('e2000000-0000-4000-b000-0000000064c8', 'e2000000-0000-4000-a000-000000000a14', 0, 'Exige a retomada das pesquisas por especialistas de diferentes áreas.', false),
  ('e2000000-0000-4000-b000-0000000064c9', 'e2000000-0000-4000-a000-000000000a14', 1, 'Representa danos irreparáveis à memória e à identidade nacionais.', true),
  ('e2000000-0000-4000-b000-0000000064ca', 'e2000000-0000-4000-a000-000000000a14', 2, 'Impossibilita o surgimento de novas pesquisas na área.', false),
  ('e2000000-0000-4000-b000-0000000064cb', 'e2000000-0000-4000-a000-000000000a14', 3, 'Resulta na extinção da cultura de povos originários.', false),
  ('e2000000-0000-4000-b000-0000000064cc', 'e2000000-0000-4000-a000-000000000a14', 4, 'Inviabiliza o estudo da língua do povo Tikuna.', false),
  ('e2000000-0000-4000-b000-0000000064d2', 'e2000000-0000-4000-a000-000000000a15', 0, 'Passa por fenômenos de variação linguística como qualquer outra língua.', true),
  ('e2000000-0000-4000-b000-0000000064d3', 'e2000000-0000-4000-a000-000000000a15', 1, 'Apresenta variações regionais, assumindo novo sentido para algumas palavras.', false),
  ('e2000000-0000-4000-b000-0000000064d4', 'e2000000-0000-4000-a000-000000000a15', 2, 'Sofre mudança estrutural motivada pelo uso de sinais diferentes para algumas palavras.', false),
  ('e2000000-0000-4000-b000-0000000064d5', 'e2000000-0000-4000-a000-000000000a15', 3, 'Diferencia-se em todo o Brasil, desenvolvendo cada região a sua própria língua de sinais.', false),
  ('e2000000-0000-4000-b000-0000000064d6', 'e2000000-0000-4000-a000-000000000a15', 4, 'É ininteligível para parte dos usuários em razão das mudanças de sinais motivadas geograficamente.', false),
  ('e2000000-0000-4000-b000-0000000064dc', 'e2000000-0000-4000-a000-000000000a16', 0, 'Perfil de público-alvo, constituído por leitores exigentes e especializados em leitura acadêmica.', false),
  ('e2000000-0000-4000-b000-0000000064dd', 'e2000000-0000-4000-a000-000000000a16', 1, 'Propósito do editor, chamando a atenção para o rigor normativo nos textos da revista.', false),
  ('e2000000-0000-4000-b000-0000000064de', 'e2000000-0000-4000-a000-000000000a16', 2, 'Exclusividade na seleção temática, direcionada para a área das ciências humanas.', false),
  ('e2000000-0000-4000-b000-0000000064df', 'e2000000-0000-4000-a000-000000000a16', 3, 'Identidade da revista, voltada para a recepção e a promoção de ideias circulantes em livros.', true),
  ('e2000000-0000-4000-b000-0000000064e0', 'e2000000-0000-4000-a000-000000000a16', 4, 'Padrão editorial dos artigos, organizados em torno de uma proposta de design inovador.', false),
  ('e2000000-0000-4000-b000-0000000064e6', 'e2000000-0000-4000-a000-000000000a17', 0, 'Referência às cores como elemento de crítica a hábitos contemporâneos.', false),
  ('e2000000-0000-4000-b000-0000000064e7', 'e2000000-0000-4000-a000-000000000a17', 1, 'Percepção da profusão de informações gerada pela tecnologia.', true),
  ('e2000000-0000-4000-b000-0000000064e8', 'e2000000-0000-4000-a000-000000000a17', 2, 'Contraposição entre os vícios e as virtudes da vida moderna.', false),
  ('e2000000-0000-4000-b000-0000000064e9', 'e2000000-0000-4000-a000-000000000a17', 3, 'Busca constante pela liberdade de expressão individual.', false),
  ('e2000000-0000-4000-b000-0000000064ea', 'e2000000-0000-4000-a000-000000000a17', 4, 'Crítica à finalidade comercial das notícias.', false),
  ('e2000000-0000-4000-b000-0000000064f0', 'e2000000-0000-4000-a000-000000000a18', 0, 'Ressaltar a importância da poesia para denunciar a morte de negros, que cresce a cada dia.', false),
  ('e2000000-0000-4000-b000-0000000064f1', 'e2000000-0000-4000-a000-000000000a18', 1, 'Destacar o crescimento exponencial da temática do preconceito na produção literária no Brasil.', false),
  ('e2000000-0000-4000-b000-0000000064f2', 'e2000000-0000-4000-a000-000000000a18', 2, 'Demonstrar o incremento no quantitativo de expressões artísticas na discussão de problemas sociais.', false),
  ('e2000000-0000-4000-b000-0000000064f3', 'e2000000-0000-4000-a000-000000000a18', 3, 'Evidenciar argumentos que reforçam a ideia de que os negros são vítimas em potencial da violência.', true),
  ('e2000000-0000-4000-b000-0000000064f4', 'e2000000-0000-4000-a000-000000000a18', 4, 'Salientar o aumento da participação de jovens nos movimentos de resistência na área da cultura.', false),
  ('e2000000-0000-4000-b000-0000000064fa', 'e2000000-0000-4000-a000-000000000a19', 0, 'Revelar a origem religiosa da linguagem.', false),
  ('e2000000-0000-4000-b000-0000000064fb', 'e2000000-0000-4000-a000-000000000a19', 1, 'Questionar o temor sobre o futuro da linguagem.', false),
  ('e2000000-0000-4000-b000-0000000064fc', 'e2000000-0000-4000-a000-000000000a19', 2, 'Descrever a relação entre sociedade e linguagem.', false),
  ('e2000000-0000-4000-b000-0000000064fd', 'e2000000-0000-4000-a000-000000000a19', 3, 'Apresentar as consequências do esfacelamento da linguagem.', false),
  ('e2000000-0000-4000-b000-0000000064fe', 'e2000000-0000-4000-a000-000000000a19', 4, 'Criticar o obstáculo promovido pelos usos especializa- dos da linguagem.', true),
  ('e2000000-0000-4000-b000-000000006504', 'e2000000-0000-4000-a000-000000000a1a', 0, 'Apontaram erros motivados pelo desconhecimento da variedade linguística local.', false),
  ('e2000000-0000-4000-b000-000000006505', 'e2000000-0000-4000-a000-000000000a1a', 1, 'Explicaram problemas provocados pela incapacidade de comunicação.', false),
  ('e2000000-0000-4000-b000-000000006506', 'e2000000-0000-4000-a000-000000000a1a', 2, 'Descobriram novos sintomas de doenças existentes na comunidade.', false),
  ('e2000000-0000-4000-b000-000000006507', 'e2000000-0000-4000-a000-000000000a1a', 3, 'Propiciaram melhor compreensão dos sintomas dos pacientes.', true),
  ('e2000000-0000-4000-b000-000000006508', 'e2000000-0000-4000-a000-000000000a1a', 4, 'Divulgaram um novo rol de doenças características da localidade.', false),
  ('e2000000-0000-4000-b000-00000000650e', 'e2000000-0000-4000-a000-000000000a1b', 0, 'Representa a memória de uma língua africana extinta.', false),
  ('e2000000-0000-4000-b000-00000000650f', 'e2000000-0000-4000-a000-000000000a1b', 1, 'Exalta a rotina executada por jovens afrodescendentes.', false),
  ('e2000000-0000-4000-b000-000000006510', 'e2000000-0000-4000-a000-000000000a1b', 2, 'Preserva a ancestralidade africana por meio da tradição oral.', true),
  ('e2000000-0000-4000-b000-000000006511', 'e2000000-0000-4000-a000-000000000a1b', 3, 'Resgata a musicalidade africana por meio de palavras inteligíveis', false),
  ('e2000000-0000-4000-b000-000000006512', 'e2000000-0000-4000-a000-000000000a1b', 4, 'Remonta à tristeza dos negros mais velhos com saudade da África.', false),
  ('e2000000-0000-4000-b000-000000006518', 'e2000000-0000-4000-a000-000000000a1c', 0, 'Censura a formas de expressão femininas.', false),
  ('e2000000-0000-4000-b000-000000006519', 'e2000000-0000-4000-a000-000000000a1c', 1, 'Ausência da figura feminina na vida pública.', false),
  ('e2000000-0000-4000-b000-00000000651a', 'e2000000-0000-4000-a000-000000000a1c', 2, 'Construções imaginárias cristalizadas na sociedade.', true),
  ('e2000000-0000-4000-b000-00000000651b', 'e2000000-0000-4000-a000-000000000a1c', 3, 'Limitações inerentes às figuras femininas e masculinas.', false),
  ('e2000000-0000-4000-b000-00000000651c', 'e2000000-0000-4000-a000-000000000a1c', 4, 'Dificuldade na atribuição de papéis masculinos e femininos.', false),
  ('e2000000-0000-4000-b000-000000006522', 'e2000000-0000-4000-a000-000000000a1d', 0, 'Divulgar o canal telefônico de atendimento a casos de violência contra a mulher.', false),
  ('e2000000-0000-4000-b000-000000006523', 'e2000000-0000-4000-a000-000000000a1d', 1, 'Informar sobre a atuação de uma entidade defensora da mulher vítima de violência.', false),
  ('e2000000-0000-4000-b000-000000006524', 'e2000000-0000-4000-a000-000000000a1d', 2, 'Evidenciar o trabalho da Defensoria Pública em relação ao problema do abuso contra a mulher.', false),
  ('e2000000-0000-4000-b000-000000006525', 'e2000000-0000-4000-a000-000000000a1d', 3, 'Alertar a sociedade sobre o aumento da violência contra a mulher em decorrência do coronavírus.', false),
  ('e2000000-0000-4000-b000-000000006526', 'e2000000-0000-4000-a000-000000000a1d', 4, 'Incentivar o público feminino a denunciar crimes de violência contra a mulher durante o período de isolamento', true),
  ('e2000000-0000-4000-b000-00000000652c', 'e2000000-0000-4000-a000-000000000a1e', 0, 'Reflete o olhar do pai sobre as etapas do plantio.', false),
  ('e2000000-0000-4000-b000-00000000652d', 'e2000000-0000-4000-a000-000000000a1e', 1, 'Metaforiza a linguagem como ferramenta de lavoura.', true),
  ('e2000000-0000-4000-b000-00000000652e', 'e2000000-0000-4000-a000-000000000a1e', 2, 'Explicita, na busca pela palavra, o medo da solidão.', false),
  ('e2000000-0000-4000-b000-00000000652f', 'e2000000-0000-4000-a000-000000000a1e', 3, 'Confirma a frustração da narradora com relação à terra.', false),
  ('e2000000-0000-4000-b000-000000006530', 'e2000000-0000-4000-a000-000000000a1e', 4, 'Sugere, na ausência da linguagem, a estagnação do tempo.', false),
  ('e2000000-0000-4000-b000-000000006536', 'e2000000-0000-4000-a000-000000000a1f', 0, 'Descrever de modo impessoal as consequências da exploração racial sobre as gerações futuras.', false),
  ('e2000000-0000-4000-b000-000000006537', 'e2000000-0000-4000-a000-000000000a1f', 1, 'Contrapor a infância privilegiada das crianças da época à infância violentada das crianças escravizadas.', false),
  ('e2000000-0000-4000-b000-000000006538', 'e2000000-0000-4000-a000-000000000a1f', 2, 'Antecipar o futuro apagamento das marcas da escravidão no contexto social.', true),
  ('e2000000-0000-4000-b000-000000006539', 'e2000000-0000-4000-a000-000000000a1f', 3, 'Criticar a atenuação da violência contra os povos escravizados nas memórias retratadas pelos museus.', false),
  ('e2000000-0000-4000-b000-00000000653a', 'e2000000-0000-4000-a000-000000000a1f', 4, 'Imaginar a reação de indiferença de seus contemporâneos com os escravizados libertos.', false),
  ('e2000000-0000-4000-b000-000000006540', 'e2000000-0000-4000-a000-000000000a20', 0, 'Repetição do pronome indefinido "todos".', true),
  ('e2000000-0000-4000-b000-000000006541', 'e2000000-0000-4000-a000-000000000a20', 1, 'Utilização do travessão na marcação do oposto.', false),
  ('e2000000-0000-4000-b000-000000006542', 'e2000000-0000-4000-a000-000000000a20', 2, 'Retomada do antecedente pelo pronome "isso".', false),
  ('e2000000-0000-4000-b000-000000006543', 'e2000000-0000-4000-a000-000000000a20', 3, 'Contraposição de ideias marcada pela conjunção mas.', false),
  ('e2000000-0000-4000-b000-000000006544', 'e2000000-0000-4000-a000-000000000a20', 4, 'Substantivação de expressões pela anteposição do artigo.', false),
  ('e2000000-0000-4000-b000-00000000654a', 'e2000000-0000-4000-a000-000000000a21', 0, 'Revelar as desilusões amorosas.', false),
  ('e2000000-0000-4000-b000-00000000654b', 'e2000000-0000-4000-a000-000000000a21', 1, 'Refletir sobre a censura à sua voz', false),
  ('e2000000-0000-4000-b000-00000000654c', 'e2000000-0000-4000-a000-000000000a21', 2, 'Expressar a dificuldade de comunicação.', true),
  ('e2000000-0000-4000-b000-00000000654d', 'e2000000-0000-4000-a000-000000000a21', 3, 'Ressaltar a existência de pressões externas.', false),
  ('e2000000-0000-4000-b000-00000000654e', 'e2000000-0000-4000-a000-000000000a21', 4, 'Manifestar as dores do processo de criação.', false),
  ('e2000000-0000-4000-b000-000000006554', 'e2000000-0000-4000-a000-000000000a22', 0, 'Desenho imaginativo do casario colonial de Ouro Preto.', false),
  ('e2000000-0000-4000-b000-000000006555', 'e2000000-0000-4000-a000-000000000a22', 1, 'Efeito de apagamento de limites entre ficção e realidade.', false),
  ('e2000000-0000-4000-b000-000000006556', 'e2000000-0000-4000-a000-000000000a22', 2, 'Vínculo estabelecido entre animais urbanos e literatura.', false),
  ('e2000000-0000-4000-b000-000000006557', 'e2000000-0000-4000-a000-000000000a22', 3, 'Questionamento sutil quanto à sanidade dos inconfidentes.', false),
  ('e2000000-0000-4000-b000-000000006558', 'e2000000-0000-4000-a000-000000000a22', 4, 'Contraste entre austeridade pomposa e imagem repugnante.', true),
  ('e2000000-0000-4000-b000-00000000655e', 'e2000000-0000-4000-a000-000000000a23', 0, 'Culto ao medo, infiltrado em situações do cotidiano.', true),
  ('e2000000-0000-4000-b000-00000000655f', 'e2000000-0000-4000-a000-000000000a23', 1, 'Sentimento de dúvida quanto à veracidade das informações.', false),
  ('e2000000-0000-4000-b000-000000006560', 'e2000000-0000-4000-a000-000000000a23', 2, 'Ambiente de sonho, delineado por imagens perturbadoras.', false),
  ('e2000000-0000-4000-b000-000000006561', 'e2000000-0000-4000-a000-000000000a23', 3, 'Incentivo ao desenvolvimento econômico com a iniciativa privada.', false),
  ('e2000000-0000-4000-b000-000000006562', 'e2000000-0000-4000-a000-000000000a23', 4, 'Espaço urbano marcado por uma política de isolamento das crianças.', false),
  ('e2000000-0000-4000-b000-000000006568', 'e2000000-0000-4000-a000-000000000a24', 0, 'Invocar o interlocutor para uma tomada de posição.', false),
  ('e2000000-0000-4000-b000-000000006569', 'e2000000-0000-4000-a000-000000000a24', 1, 'Questionar a validade do envolvimento romântico.', false),
  ('e2000000-0000-4000-b000-00000000656a', 'e2000000-0000-4000-a000-000000000a24', 2, 'Diluir em banalidade a comoção de um amor frustrado.', true),
  ('e2000000-0000-4000-b000-00000000656b', 'e2000000-0000-4000-a000-000000000a24', 3, 'Transformar em paz as emoções conflituosas do casal.', false),
  ('e2000000-0000-4000-b000-00000000656c', 'e2000000-0000-4000-a000-000000000a24', 4, 'Condicionar a existência da paixão a espaços idealizados.', false),
  ('e2000000-0000-4000-b000-000000006572', 'e2000000-0000-4000-a000-000000000a25', 0, 'Inter-relação de referenciais estéticos aparentemente distanciados.', true),
  ('e2000000-0000-4000-b000-000000006573', 'e2000000-0000-4000-a000-000000000a25', 1, 'Valorização de músicas que revelam mensagens de serenidade.', false),
  ('e2000000-0000-4000-b000-000000006574', 'e2000000-0000-4000-a000-000000000a25', 2, 'Consagração do repertório erudito como cultura dominante.', false),
  ('e2000000-0000-4000-b000-000000006575', 'e2000000-0000-4000-a000-000000000a25', 3, 'Iniciativa de estímulo à vocação turística da cidade.', false),
  ('e2000000-0000-4000-b000-000000006576', 'e2000000-0000-4000-a000-000000000a25', 4, 'Divisão hierárquica entre gêneros e estilos musicais.', false),
  ('e2000000-0000-4000-b000-00000000657c', 'e2000000-0000-4000-a000-000000000a26', 0, 'Representar uma estética tida como inconveniente para o ideário político vigente.', true),
  ('e2000000-0000-4000-b000-00000000657d', 'e2000000-0000-4000-a000-000000000a26', 1, 'Manifestar um posicionamento político-cultural concebido por grupos de oposição.', false),
  ('e2000000-0000-4000-b000-00000000657e', 'e2000000-0000-4000-a000-000000000a26', 2, 'Expressar a cultura artística por meio da representação parcial do corpo humano.', false),
  ('e2000000-0000-4000-b000-00000000657f', 'e2000000-0000-4000-a000-000000000a26', 3, 'Apresentar uma composição que antecipa o imaginário artístico germânico.', false),
  ('e2000000-0000-4000-b000-000000006580', 'e2000000-0000-4000-a000-000000000a26', 4, 'Estimular discussões sobre o papel da arte na construção coletiva de cultura.', false),
  ('e2000000-0000-4000-b000-000000006586', 'e2000000-0000-4000-a000-000000000a27', 0, 'Condição favorável à expansão dessa modalidade.', true),
  ('e2000000-0000-4000-b000-000000006587', 'e2000000-0000-4000-a000-000000000a27', 1, 'Promoção dessa prática por jogadores profissionais.', false),
  ('e2000000-0000-4000-b000-000000006588', 'e2000000-0000-4000-a000-000000000a27', 2, 'Impulsionamento de um processo de marketing.', false),
  ('e2000000-0000-4000-b000-000000006589', 'e2000000-0000-4000-a000-000000000a27', 3, 'Favorecimento de fabricantes dos jogos.', false),
  ('e2000000-0000-4000-b000-00000000658a', 'e2000000-0000-4000-a000-000000000a27', 4, 'Modificação da audiência televisiva.', false),
  ('e2000000-0000-4000-b000-000000006590', 'e2000000-0000-4000-a000-000000000a28', 0, 'Ressignificar episódios dramáticos em novas práticas culturais.', true),
  ('e2000000-0000-4000-b000-000000006591', 'e2000000-0000-4000-a000-000000000a28', 1, 'Adaptar coreografias como imitação dos movimentos do mar.', false),
  ('e2000000-0000-4000-b000-000000006592', 'e2000000-0000-4000-a000-000000000a28', 2, 'Lembrar dos mortos no passado escravista como forma de lamento.', false),
  ('e2000000-0000-4000-b000-000000006593', 'e2000000-0000-4000-a000-000000000a28', 3, 'Perpetuar uma narrativa de apagamento dos fatos históricos traumáticos.', false),
  ('e2000000-0000-4000-b000-000000006594', 'e2000000-0000-4000-a000-000000000a28', 4, 'Ritualizar a passagem de atos fúnebres nas produções coletivas com espírito festivo.', false),
  ('e2000000-0000-4000-b000-00000000659a', 'e2000000-0000-4000-a000-000000000a29', 0, 'Dar suporte à técnica de colagem em Artes Visuais, contornando dificuldades práticas.', false),
  ('e2000000-0000-4000-b000-00000000659b', 'e2000000-0000-4000-a000-000000000a29', 1, 'Aproximar-se da estética visual própria da editoração de obras artísticas, como capas de livros.', false),
  ('e2000000-0000-4000-b000-00000000659c', 'e2000000-0000-4000-a000-000000000a29', 2, 'Oferecer uma vitrine internacional para sua produção artística, a fim de dar mais visibilidade a suas obras.', true),
  ('e2000000-0000-4000-b000-00000000659d', 'e2000000-0000-4000-a000-000000000a29', 3, 'Enfatizar o caráter original e inovador de suas criações artísticas, diferenciando-se das artes tradicionais.', false),
  ('e2000000-0000-4000-b000-00000000659e', 'e2000000-0000-4000-a000-000000000a29', 4, 'Trazer um sentido tecnológico às suas colagens, uma vez que as imagens artísticas são recorrentes nas redes sociais.', false),
  ('e2000000-0000-4000-b000-0000000065a4', 'e2000000-0000-4000-a000-000000000a2a', 0, 'Fusão de manifestações artísticas urbanas contemporâneas com a cultura indígena.', true),
  ('e2000000-0000-4000-b000-0000000065a5', 'e2000000-0000-4000-a000-000000000a2a', 1, 'Contraposição das temáticas socioambientais indigenas as questões urbanas.', false),
  ('e2000000-0000-4000-b000-0000000065a6', 'e2000000-0000-4000-a000-000000000a2a', 2, 'Rejeição da indústria radiofônica às músicas indígenas.', false),
  ('e2000000-0000-4000-b000-0000000065a7', 'e2000000-0000-4000-a000-000000000a2a', 3, 'Distanciamento da realidade social indígena.', false),
  ('e2000000-0000-4000-b000-0000000065a8', 'e2000000-0000-4000-a000-000000000a2a', 4, 'E estímulo ao estudo da poesia indígena.', false),
  ('e2000000-0000-4000-b000-0000000065ae', 'e2000000-0000-4000-a000-000000000a2b', 0, 'Inclusão de informações no verbete.', false),
  ('e2000000-0000-4000-b000-0000000065af', 'e2000000-0000-4000-a000-000000000a2b', 1, 'Relevância social da instituição casamento.', false),
  ('e2000000-0000-4000-b000-0000000065b0', 'e2000000-0000-4000-a000-000000000a2b', 2, 'Utilização pública da petição pelos cidadãos.', true),
  ('e2000000-0000-4000-b000-0000000065b1', 'e2000000-0000-4000-a000-000000000a2b', 3, 'Rapidez na disseminação digital do verbete.', false),
  ('e2000000-0000-4000-b000-0000000065b2', 'e2000000-0000-4000-a000-000000000a2b', 4, 'Divulgação de plataformas para a criação de petição', false),
  ('e2000000-0000-4000-b000-0000000065b8', 'e2000000-0000-4000-a000-000000000a2c', 0, 'Dificuldade de conseguir bons resultados esportivos.', false),
  ('e2000000-0000-4000-b000-0000000065b9', 'e2000000-0000-4000-a000-000000000a2c', 1, 'Dependência de características biológicas padronizadas.', true),
  ('e2000000-0000-4000-b000-0000000065ba', 'e2000000-0000-4000-a000-000000000a2c', 2, 'Inexistência de uma categoria para pessoas transgênero', false),
  ('e2000000-0000-4000-b000-0000000065bb', 'e2000000-0000-4000-a000-000000000a2c', 3, 'Necessidade de afastamento temporário das competições', false),
  ('e2000000-0000-4000-b000-0000000065bc', 'e2000000-0000-4000-a000-000000000a2c', 4, 'Impossibilidade de uso controlado de substâncias', false),
  ('e2000000-0000-4000-b000-0000000065c2', 'e2000000-0000-4000-a000-000000000a2d', 0, 'O desempenho atlético internacional.', false),
  ('e2000000-0000-4000-b000-0000000065c3', 'e2000000-0000-4000-a000-000000000a2d', 1, 'A dimensão emocional dos atletas.', true),
  ('e2000000-0000-4000-b000-0000000065c4', 'e2000000-0000-4000-a000-000000000a2d', 2, 'Os comitês olímpicos nacionais.', false),
  ('e2000000-0000-4000-b000-0000000065c5', 'e2000000-0000-4000-a000-000000000a2d', 3, 'As instituições de inteligência.', false),
  ('e2000000-0000-4000-b000-0000000065c6', 'e2000000-0000-4000-a000-000000000a2d', 4, 'As federações esportivas.', false),
  ('e2000000-0000-4000-b000-0000000065cc', 'e2000000-0000-4000-a000-000000000a2e', 0, 'Diferença entre homens e mulheres.', false),
  ('e2000000-0000-4000-b000-0000000065cd', 'e2000000-0000-4000-a000-000000000a2e', 1, 'Inexistência de políticas públicas.', false),
  ('e2000000-0000-4000-b000-0000000065ce', 'e2000000-0000-4000-a000-000000000a2e', 2, 'Diversidade de faixa etária.', false),
  ('e2000000-0000-4000-b000-0000000065cf', 'e2000000-0000-4000-a000-000000000a2e', 3, 'Variação de condição étnica.', false),
  ('e2000000-0000-4000-b000-0000000065d0', 'e2000000-0000-4000-a000-000000000a2e', 4, 'Desigualdade entre classes sociais.', true),
  ('e2000000-0000-4000-b000-0000000065d6', 'e2000000-0000-4000-a000-000000000a2f', 0, 'Metáforas relacionadas à trajetória pessoal e criadora do homenageado.', true),
  ('e2000000-0000-4000-b000-0000000065d7', 'e2000000-0000-4000-a000-000000000a2f', 1, 'Recursos fonológicos empregados para a valorização do ritmo do texto.', false),
  ('e2000000-0000-4000-b000-0000000065d8', 'e2000000-0000-4000-a000-000000000a2f', 2, 'Frases curtas e diretas no relato de vida e da morte do homenageado.', false),
  ('e2000000-0000-4000-b000-0000000065d9', 'e2000000-0000-4000-a000-000000000a2f', 3, 'Contraposição de ideias presentes na obra do homenageado.', false),
  ('e2000000-0000-4000-b000-0000000065da', 'e2000000-0000-4000-a000-000000000a2f', 4, 'Seleção vocabular representativa do sentimento de nostalgia.', false),
  ('e2000000-0000-4000-b000-0000000065e0', 'e2000000-0000-4000-a000-000000000a30', 0, 'A sensibilizar o idoso a respeito dos cuidados com a saude.', false),
  ('e2000000-0000-4000-b000-0000000065e1', 'e2000000-0000-4000-a000-000000000a30', 1, 'Alertar os governantes sobre os cuidados requeridos pelo idoso.', false),
  ('e2000000-0000-4000-b000-0000000065e2', 'e2000000-0000-4000-a000-000000000a30', 2, 'Divulgar o trabalho da Sociedade Brasileira de Geriatria e Gerontologia.', false),
  ('e2000000-0000-4000-b000-0000000065e3', 'e2000000-0000-4000-a000-000000000a30', 3, 'Informar o setor público sobre o retrocesso da legislação destinada à população idosa.', false),
  ('e2000000-0000-4000-b000-0000000065e4', 'e2000000-0000-4000-a000-000000000a30', 4, 'Chamar a atenção da população sobre a qualidade dos serviços de saúde pública para o idoso.', true),
  ('e2000000-0000-4000-b000-0000000065ea', 'e2000000-0000-4000-a000-000000000a31', 0, 'Percursos e roteiros turísticos.', false),
  ('e2000000-0000-4000-b000-0000000065eb', 'e2000000-0000-4000-a000-000000000a31', 1, 'Trajetos e movimentos holísticos.', false),
  ('e2000000-0000-4000-b000-0000000065ec', 'e2000000-0000-4000-a000-000000000a31', 2, 'Vivências e itinerários socioafetivos.', true),
  ('e2000000-0000-4000-b000-0000000065ed', 'e2000000-0000-4000-a000-000000000a31', 3, 'Fronteiras e demarcações territoriais.', false),
  ('e2000000-0000-4000-b000-0000000065ee', 'e2000000-0000-4000-a000-000000000a31', 4, 'Profissões e interesses econômicos.', false),
  ('e2000000-0000-4000-b000-0000000065f4', 'e2000000-0000-4000-a000-000000000a32', 0, 'Hábitos de leitura e mobilidade regional.', false),
  ('e2000000-0000-4000-b000-0000000065f5', 'e2000000-0000-4000-a000-000000000a32', 1, 'Circulação de impressos e trânsito religioso.', false),
  ('e2000000-0000-4000-b000-0000000065f6', 'e2000000-0000-4000-a000-000000000a32', 2, 'Valorização da lingua e imigração estrangeira.', false),
  ('e2000000-0000-4000-b000-0000000065f7', 'e2000000-0000-4000-a000-000000000a32', 3, 'Práticas de letramento e transformação cultural.', true),
  ('e2000000-0000-4000-b000-0000000065f8', 'e2000000-0000-4000-a000-000000000a32', 4, 'Flexibilização do ensino e reformismo pedagógico.', false),
  ('e2000000-0000-4000-b000-0000000065fe', 'e2000000-0000-4000-a000-000000000a33', 0, 'Cerco aos camponeses, inviabilizando a manutenção das condições para a vida.', true),
  ('e2000000-0000-4000-b000-0000000065ff', 'e2000000-0000-4000-a000-000000000a33', 1, 'Descaso aos latifundiários, impactando a plantação de alimentos para a exportação.', false),
  ('e2000000-0000-4000-b000-000000006600', 'e2000000-0000-4000-a000-000000000a33', 2, 'Desprezo ao assalariado, afetando o engajamento dos sindicatos para o trabalhador.', false),
  ('e2000000-0000-4000-b000-000000006601', 'e2000000-0000-4000-a000-000000000a33', 3, 'Desrespeito aos governantes, comprometendo a criação de empregos para o lavrador.', false),
  ('e2000000-0000-4000-b000-000000006602', 'e2000000-0000-4000-a000-000000000a33', 4, 'Assédio ao empresariado, dificultando o investimento de maquinários para a produção.', false),
  ('e2000000-0000-4000-b000-000000006608', 'e2000000-0000-4000-a000-000000000a34', 0, 'Promover a ocupação rural.', false),
  ('e2000000-0000-4000-b000-000000006609', 'e2000000-0000-4000-a000-000000000a34', 1, 'Favorecer a liberdade religiosa.', false),
  ('e2000000-0000-4000-b000-00000000660a', 'e2000000-0000-4000-a000-000000000a34', 2, 'Descentralizar a gestão pública.', false),
  ('e2000000-0000-4000-b000-00000000660b', 'e2000000-0000-4000-a000-000000000a34', 3, 'Incentivar a pluralidade cultural.', false),
  ('e2000000-0000-4000-b000-00000000660c', 'e2000000-0000-4000-a000-000000000a34', 4, 'Assegurar a integridade territorial.', true),
  ('e2000000-0000-4000-b000-000000006612', 'e2000000-0000-4000-a000-000000000a35', 0, 'Recuperação do tradicionalismo.', false),
  ('e2000000-0000-4000-b000-000000006613', 'e2000000-0000-4000-a000-000000000a35', 1, 'Estímulo ao antropocentrismo.', false),
  ('e2000000-0000-4000-b000-000000006614', 'e2000000-0000-4000-a000-000000000a35', 2, 'Reforço do etnocentrismo.', false),
  ('e2000000-0000-4000-b000-000000006615', 'e2000000-0000-4000-a000-000000000a35', 3, 'Resgate do teocentrismo.', false),
  ('e2000000-0000-4000-b000-000000006616', 'e2000000-0000-4000-a000-000000000a35', 4, 'Crítica ao eurocentrismo.', true),
  ('e2000000-0000-4000-b000-00000000661c', 'e2000000-0000-4000-a000-000000000a36', 0, 'Promover o bem-estar social.', false),
  ('e2000000-0000-4000-b000-00000000661d', 'e2000000-0000-4000-a000-000000000a36', 1, 'Negociar o apoio muçulmano.', false),
  ('e2000000-0000-4000-b000-00000000661e', 'e2000000-0000-4000-a000-000000000a36', 2, 'Mediar os conflitos territoriais.', true),
  ('e2000000-0000-4000-b000-00000000661f', 'e2000000-0000-4000-a000-000000000a36', 3, 'Estimular a cooperação regional.', false),
  ('e2000000-0000-4000-b000-000000006620', 'e2000000-0000-4000-a000-000000000a36', 4, 'Combater os governos autocráticos.', false),
  ('e2000000-0000-4000-b000-000000006626', 'e2000000-0000-4000-a000-000000000a37', 0, 'Participação sociopolítica.', true),
  ('e2000000-0000-4000-b000-000000006627', 'e2000000-0000-4000-a000-000000000a37', 1, 'Definição estético-cultural.', false),
  ('e2000000-0000-4000-b000-000000006628', 'e2000000-0000-4000-a000-000000000a37', 2, 'Competição econômica local.', false),
  ('e2000000-0000-4000-b000-000000006629', 'e2000000-0000-4000-a000-000000000a37', 3, 'Manutenção do sistema escolar.', false),
  ('e2000000-0000-4000-b000-00000000662a', 'e2000000-0000-4000-a000-000000000a37', 4, 'Capacitação de mobilidade individual.', false),
  ('e2000000-0000-4000-b000-000000006630', 'e2000000-0000-4000-a000-000000000a38', 0, 'Derrame de lava vulcânica.', false),
  ('e2000000-0000-4000-b000-000000006631', 'e2000000-0000-4000-a000-000000000a38', 1, 'Encontro de placas tectônicas.', true),
  ('e2000000-0000-4000-b000-000000006632', 'e2000000-0000-4000-a000-000000000a38', 2, 'Ação do intemperismo químico.', false),
  ('e2000000-0000-4000-b000-000000006633', 'e2000000-0000-4000-a000-000000000a38', 3, 'Sedimentação de erosão eólica.', false),
  ('e2000000-0000-4000-b000-000000006634', 'e2000000-0000-4000-a000-000000000a38', 4, 'Derretimento de geleiras glaciais.', false),
  ('e2000000-0000-4000-b000-00000000663a', 'e2000000-0000-4000-a000-000000000a39', 0, 'Apresentar uma visão dualista.', true),
  ('e2000000-0000-4000-b000-00000000663b', 'e2000000-0000-4000-a000-000000000a39', 1, 'Confirmar uma tese naturalista.', false),
  ('e2000000-0000-4000-b000-00000000663c', 'e2000000-0000-4000-a000-000000000a39', 2, 'Demonstrar uma premissa relativa.', false),
  ('e2000000-0000-4000-b000-00000000663d', 'e2000000-0000-4000-a000-000000000a39', 3, 'Sustentar um argumento idealista.', false),
  ('e2000000-0000-4000-b000-00000000663e', 'e2000000-0000-4000-a000-000000000a39', 4, 'Defender uma posição intencionalista.', false),
  ('e2000000-0000-4000-b000-000000006644', 'e2000000-0000-4000-a000-000000000a3a', 0, 'Consumo de produtos culturais e elaborados no mesmo sistema produtivo do capitalismo', true),
  ('e2000000-0000-4000-b000-000000006645', 'e2000000-0000-4000-a000-000000000a3a', 1, 'Forma de realizar as diversas potencialidades da natureza humana.', false),
  ('e2000000-0000-4000-b000-000000006646', 'e2000000-0000-4000-a000-000000000a3a', 2, 'Alternativa para equilibrar tensões psicológicas do dia a dia.', false),
  ('e2000000-0000-4000-b000-000000006647', 'e2000000-0000-4000-a000-000000000a3a', 3, 'Promoção da satisfação de necessidades artificiais.', false),
  ('e2000000-0000-4000-b000-000000006648', 'e2000000-0000-4000-a000-000000000a3a', 4, 'Mecanismo de organização do ócio e do prazer.', false),
  ('e2000000-0000-4000-b000-00000000664e', 'e2000000-0000-4000-a000-000000000a3b', 0, 'Rejeição particular amparada pelo desejo de poder.', false),
  ('e2000000-0000-4000-b000-00000000664f', 'e2000000-0000-4000-a000-000000000a3b', 1, 'Decisão subjetiva determinada pela vontade divina.', false),
  ('e2000000-0000-4000-b000-000000006650', 'e2000000-0000-4000-a000-000000000a3b', 2, 'Liberdade mitigada pela predestinação do espírito.', false),
  ('e2000000-0000-4000-b000-000000006651', 'e2000000-0000-4000-a000-000000000a3b', 3, 'Escolhas humanas definidas pelo conhecimento empírico.', false),
  ('e2000000-0000-4000-b000-000000006652', 'e2000000-0000-4000-a000-000000000a3b', 4, 'Relações interpessoais medidas pela autonomia dos indivíduos.', true),
  ('e2000000-0000-4000-b000-000000006658', 'e2000000-0000-4000-a000-000000000a3c', 0, 'Elementos tradicionais e modernos em torno de uma crença religiosa.', true),
  ('e2000000-0000-4000-b000-000000006659', 'e2000000-0000-4000-a000-000000000a3c', 1, 'Argumentos teológicos e históricos em consequência de uma ordem papal.', false),
  ('e2000000-0000-4000-b000-00000000665a', 'e2000000-0000-4000-a000-000000000a3c', 2, 'Fundamentos estéticos e etnográficos em função de uma cerimônia clerical.', false),
  ('e2000000-0000-4000-b000-00000000665b', 'e2000000-0000-4000-a000-000000000a3c', 3, 'Práticas corporais e esportivas em decorrência de uma imposição eclesiástica.', false),
  ('e2000000-0000-4000-b000-00000000665c', 'e2000000-0000-4000-a000-000000000a3c', 4, 'Discursos filosóficos e antropológicos em resultado de uma determinação paroquial.', false),
  ('e2000000-0000-4000-b000-000000006662', 'e2000000-0000-4000-a000-000000000a3d', 0, 'Distinção das classes sociais.', true),
  ('e2000000-0000-4000-b000-000000006663', 'e2000000-0000-4000-a000-000000000a3d', 1, 'Valorização de habitos de higiene.', false),
  ('e2000000-0000-4000-b000-000000006664', 'e2000000-0000-4000-a000-000000000a3d', 2, 'Exaltação da cultura mediterrânea.', false),
  ('e2000000-0000-4000-b000-000000006665', 'e2000000-0000-4000-a000-000000000a3d', 3, 'Consagração de tradições medievais.', false),
  ('e2000000-0000-4000-b000-000000006666', 'e2000000-0000-4000-a000-000000000a3d', 4, 'Disseminação de produtos manufaturados.', false),
  ('e2000000-0000-4000-b000-00000000666c', 'e2000000-0000-4000-a000-000000000a3e', 0, 'Ação difamatória.', false),
  ('e2000000-0000-4000-b000-00000000666d', 'e2000000-0000-4000-a000-000000000a3e', 1, 'Desvio comportamental.', false),
  ('e2000000-0000-4000-b000-00000000666e', 'e2000000-0000-4000-a000-000000000a3e', 2, 'Expressão preconceituosa.', false),
  ('e2000000-0000-4000-b000-00000000666f', 'e2000000-0000-4000-a000-000000000a3e', 3, 'Violência patrimonial.', true),
  ('e2000000-0000-4000-b000-000000006670', 'e2000000-0000-4000-a000-000000000a3e', 4, 'Desentendimento matrimonial.', false),
  ('e2000000-0000-4000-b000-000000006676', 'e2000000-0000-4000-a000-000000000a3f', 0, 'Diversificação da função.', false),
  ('e2000000-0000-4000-b000-000000006677', 'e2000000-0000-4000-a000-000000000a3f', 1, 'Mobilidade da população.', false),
  ('e2000000-0000-4000-b000-000000006678', 'e2000000-0000-4000-a000-000000000a3f', 2, 'Autonomia do empregado.', false),
  ('e2000000-0000-4000-b000-000000006679', 'e2000000-0000-4000-a000-000000000a3f', 3, 'Concentração da produção.', false),
  ('e2000000-0000-4000-b000-00000000667a', 'e2000000-0000-4000-a000-000000000a3f', 4, 'Invisibilidade do profissional.', true),
  ('e2000000-0000-4000-b000-000000006680', 'e2000000-0000-4000-a000-000000000a40', 0, 'Domínio cultural-identitário de atores sociais.', false),
  ('e2000000-0000-4000-b000-000000006681', 'e2000000-0000-4000-a000-000000000a40', 1, 'Disputas étnico-raciais de povos tradicionais.', false),
  ('e2000000-0000-4000-b000-000000006682', 'e2000000-0000-4000-a000-000000000a40', 2, 'Divergências político-ideológicas de agentes estatais.', true),
  ('e2000000-0000-4000-b000-000000006683', 'e2000000-0000-4000-a000-000000000a40', 3, 'Imposição econômico-financeira de empresas privadas', false),
  ('e2000000-0000-4000-b000-000000006684', 'e2000000-0000-4000-a000-000000000a40', 4, 'Protestos ecológico-sustentáveis de entidades ambientais', false),
  ('e2000000-0000-4000-b000-00000000668a', 'e2000000-0000-4000-a000-000000000a41', 0, 'Representação arquitetônica.', false),
  ('e2000000-0000-4000-b000-00000000668b', 'e2000000-0000-4000-a000-000000000a41', 1, 'Intercâmbio transcontinental.', true),
  ('e2000000-0000-4000-b000-00000000668c', 'e2000000-0000-4000-a000-000000000a41', 2, 'Dependência econômica.', false),
  ('e2000000-0000-4000-b000-00000000668d', 'e2000000-0000-4000-a000-000000000a41', 3, 'Intervenção estatal.', false),
  ('e2000000-0000-4000-b000-00000000668e', 'e2000000-0000-4000-a000-000000000a41', 4, 'Padrão estético.', false),
  ('e2000000-0000-4000-b000-000000006694', 'e2000000-0000-4000-a000-000000000a42', 0, 'Manejo tradicional.', false),
  ('e2000000-0000-4000-b000-000000006695', 'e2000000-0000-4000-a000-000000000a42', 1, 'Reciclagem residual.', false),
  ('e2000000-0000-4000-b000-000000006696', 'e2000000-0000-4000-a000-000000000a42', 2, 'Consumo consciente.', false),
  ('e2000000-0000-4000-b000-000000006697', 'e2000000-0000-4000-a000-000000000a42', 3, 'Exploração predatória.', true),
  ('e2000000-0000-4000-b000-000000006698', 'e2000000-0000-4000-a000-000000000a42', 4, 'Reaproveitamento energético.', false),
  ('e2000000-0000-4000-b000-00000000669e', 'e2000000-0000-4000-a000-000000000a43', 0, 'Recorrência da miséria.', true),
  ('e2000000-0000-4000-b000-00000000669f', 'e2000000-0000-4000-a000-000000000a43', 1, 'Planejamento da saúde.', false),
  ('e2000000-0000-4000-b000-0000000066a0', 'e2000000-0000-4000-a000-000000000a43', 2, 'Superação da escassez.', false),
  ('e2000000-0000-4000-b000-0000000066a1', 'e2000000-0000-4000-a000-000000000a43', 3, 'Constância da economia.', false),
  ('e2000000-0000-4000-b000-0000000066a2', 'e2000000-0000-4000-a000-000000000a43', 4, 'Romantização da carência.', false),
  ('e2000000-0000-4000-b000-0000000066a8', 'e2000000-0000-4000-a000-000000000a44', 0, 'Difusão comercial de lavouras temporárias.', false),
  ('e2000000-0000-4000-b000-0000000066a9', 'e2000000-0000-4000-a000-000000000a44', 1, 'Utilização sustentável dos recursos naturais.', true),
  ('e2000000-0000-4000-b000-0000000066aa', 'e2000000-0000-4000-a000-000000000a44', 2, 'Ampliação tecnológica da pecuária intensiva.', false),
  ('e2000000-0000-4000-b000-0000000066ab', 'e2000000-0000-4000-a000-000000000a44', 3, 'Padronização alimentar dos povos tradicionais.', false),
  ('e2000000-0000-4000-b000-0000000066ac', 'e2000000-0000-4000-a000-000000000a44', 4, 'Modernização logística de plantios convencionais.', false),
  ('e2000000-0000-4000-b000-0000000066b2', 'e2000000-0000-4000-a000-000000000a45', 0, 'Conservação do meio rural.', false),
  ('e2000000-0000-4000-b000-0000000066b3', 'e2000000-0000-4000-a000-000000000a45', 1, 'Crescimento da vegetação ciliar.', false),
  ('e2000000-0000-4000-b000-0000000066b4', 'e2000000-0000-4000-a000-000000000a45', 2, 'Interferência do espaço geográfico.', true),
  ('e2000000-0000-4000-b000-0000000066b5', 'e2000000-0000-4000-a000-000000000a45', 3, 'Equilíbrio do ambiente das cidades.', false),
  ('e2000000-0000-4000-b000-0000000066b6', 'e2000000-0000-4000-a000-000000000a45', 4, 'Controle da proliferação dos animais.', false),
  ('e2000000-0000-4000-b000-0000000066bc', 'e2000000-0000-4000-a000-000000000a46', 0, 'Afronta às estruturas sociais.', false),
  ('e2000000-0000-4000-b000-0000000066bd', 'e2000000-0000-4000-a000-000000000a46', 1, 'Desprezo aos valores religiosos.', false),
  ('e2000000-0000-4000-b000-0000000066be', 'e2000000-0000-4000-a000-000000000a46', 2, 'Transgressão às normas morais.', false),
  ('e2000000-0000-4000-b000-0000000066bf', 'e2000000-0000-4000-a000-000000000a46', 3, 'Desrespeito à dignidade humana.', true),
  ('e2000000-0000-4000-b000-0000000066c0', 'e2000000-0000-4000-a000-000000000a46', 4, 'Oposição aos princípios hierárquicos.', false),
  ('e2000000-0000-4000-b000-0000000066c6', 'e2000000-0000-4000-a000-000000000a47', 0, 'Incorporação da estética popular para justificar o ideal de integração nacional.', false),
  ('e2000000-0000-4000-b000-0000000066c7', 'e2000000-0000-4000-a000-000000000a47', 1, 'Afirmação da estratégia psicossocial para favorecer o objetivo de propaganda cívica.', false),
  ('e2000000-0000-4000-b000-0000000066c8', 'e2000000-0000-4000-a000-000000000a47', 2, 'Institucionalização de mecanismos repressivos para eliminar os focos de resistência.', true),
  ('e2000000-0000-4000-b000-0000000066c9', 'e2000000-0000-4000-a000-000000000a47', 3, 'Adoção de cerimoniais públicos para controlar as manifestações de grupos opositores.', false),
  ('e2000000-0000-4000-b000-0000000066ca', 'e2000000-0000-4000-a000-000000000a47', 4, 'Estatização de meios de comunicação para selecionar a divulgação de atos governamentais.', false),
  ('e2000000-0000-4000-b000-0000000066d0', 'e2000000-0000-4000-a000-000000000a48', 0, 'Apropriação de áreas devolutas.', true),
  ('e2000000-0000-4000-b000-0000000066d1', 'e2000000-0000-4000-a000-000000000a48', 1, 'Sonegação de impostos federais.', false),
  ('e2000000-0000-4000-b000-0000000066d2', 'e2000000-0000-4000-a000-000000000a48', 2, 'Incorporação de exportação ilegal.', false),
  ('e2000000-0000-4000-b000-0000000066d3', 'e2000000-0000-4000-a000-000000000a48', 3, 'Desoneração de setores produtivos.', false),
  ('e2000000-0000-4000-b000-0000000066d4', 'e2000000-0000-4000-a000-000000000a48', 4, 'Flexibilização de legislação ambiental.', false),
  ('e2000000-0000-4000-b000-0000000066da', 'e2000000-0000-4000-a000-000000000a49', 0, 'Dependência e progresso.', false),
  ('e2000000-0000-4000-b000-0000000066db', 'e2000000-0000-4000-a000-000000000a49', 1, 'Expectativa e desconfiança.', true),
  ('e2000000-0000-4000-b000-0000000066dc', 'e2000000-0000-4000-a000-000000000a49', 2, 'Angústia e adaptação.', false),
  ('e2000000-0000-4000-b000-0000000066dd', 'e2000000-0000-4000-a000-000000000a49', 3, 'Pioneirismo e retrocesso.', false),
  ('e2000000-0000-4000-b000-0000000066de', 'e2000000-0000-4000-a000-000000000a49', 4, 'Receio e civilidade.', false),
  ('e2000000-0000-4000-b000-0000000066e4', 'e2000000-0000-4000-a000-000000000a4a', 0, 'O processo de expansão marítima.', true),
  ('e2000000-0000-4000-b000-0000000066e5', 'e2000000-0000-4000-a000-000000000a4a', 1, 'A eclosão do renascimento cultural.', false),
  ('e2000000-0000-4000-b000-0000000066e6', 'e2000000-0000-4000-a000-000000000a4a', 2, 'A concretização da centralização política.', false),
  ('e2000000-0000-4000-b000-0000000066e7', 'e2000000-0000-4000-a000-000000000a4a', 3, 'O movimento de reformas religiosas.', false),
  ('e2000000-0000-4000-b000-0000000066e8', 'e2000000-0000-4000-a000-000000000a4a', 4, 'A manutenção do sistema feudal.', false),
  ('e2000000-0000-4000-b000-0000000066ee', 'e2000000-0000-4000-a000-000000000a4b', 0, 'Aceitável no que alude aos direitos humanos.', false),
  ('e2000000-0000-4000-b000-0000000066ef', 'e2000000-0000-4000-a000-000000000a4b', 1, 'Admissível no que remete às crenças coloniais.', false),
  ('e2000000-0000-4000-b000-0000000066f0', 'e2000000-0000-4000-a000-000000000a4b', 2, 'Tolerável no que se refere aos regimes tributários.', false),
  ('e2000000-0000-4000-b000-0000000066f1', 'e2000000-0000-4000-a000-000000000a4b', 3, 'Flexível no que diz respeito aos costumes religiosos.', true),
  ('e2000000-0000-4000-b000-0000000066f2', 'e2000000-0000-4000-a000-000000000a4b', 4, 'Compreensível no que concerne às normas laborais.', false),
  ('e2000000-0000-4000-b000-0000000066f8', 'e2000000-0000-4000-a000-000000000a4c', 0, 'A Rejeição de costumes elitistas.', false),
  ('e2000000-0000-4000-b000-0000000066f9', 'e2000000-0000-4000-a000-000000000a4c', 1, 'Repulsão de condutas misóginas.', false),
  ('e2000000-0000-4000-b000-0000000066fa', 'e2000000-0000-4000-a000-000000000a4c', 2, 'Condenação do preconceito racial.', true),
  ('e2000000-0000-4000-b000-0000000066fb', 'e2000000-0000-4000-a000-000000000a4c', 3, 'Criminalização de práticas homofóbicas', false),
  ('e2000000-0000-4000-b000-0000000066fc', 'e2000000-0000-4000-a000-000000000a4c', 4, 'Contestação do comportamento machista.', false),
  ('e2000000-0000-4000-b000-000000006702', 'e2000000-0000-4000-a000-000000000a4d', 0, 'Flexibilização legal da prática de aborto.', false),
  ('e2000000-0000-4000-b000-000000006703', 'e2000000-0000-4000-a000-000000000a4d', 1, 'Envelhecimento da população brasileira.', false),
  ('e2000000-0000-4000-b000-000000006704', 'e2000000-0000-4000-a000-000000000a4d', 2, 'Crescimento dos casos de gravidez precoce.', false),
  ('e2000000-0000-4000-b000-000000006705', 'e2000000-0000-4000-a000-000000000a4d', 3, 'Participação feminina no mercado de trabalho.', true),
  ('e2000000-0000-4000-b000-000000006706', 'e2000000-0000-4000-a000-000000000a4d', 4, 'Diminuição dos benefícios na licença-maternidade.', false),
  ('e2000000-0000-4000-b000-00000000670c', 'e2000000-0000-4000-a000-000000000a4e', 0, 'As leis observáveis regem o mundo material.', false),
  ('e2000000-0000-4000-b000-00000000670d', 'e2000000-0000-4000-a000-000000000a4e', 1, 'O monarca racional promove a sociedade justa.', false),
  ('e2000000-0000-4000-b000-00000000670e', 'e2000000-0000-4000-a000-000000000a4e', 2, 'O direito natural justifica a liberdade dos homens.', false),
  ('e2000000-0000-4000-b000-00000000670f', 'e2000000-0000-4000-a000-000000000a4e', 3, 'A produção da terra garante a riqueza das nações.', false),
  ('e2000000-0000-4000-b000-000000006710', 'e2000000-0000-4000-a000-000000000a4e', 4, 'A responsabilidade dos governantes assegura a saúde dos povos.', true),
  ('e2000000-0000-4000-b000-000000006716', 'e2000000-0000-4000-a000-000000000a4f', 0, 'Ocupação de lugares ociosos.', true),
  ('e2000000-0000-4000-b000-000000006717', 'e2000000-0000-4000-a000-000000000a4f', 1, 'Densificação da área central.', false),
  ('e2000000-0000-4000-b000-000000006718', 'e2000000-0000-4000-a000-000000000a4f', 2, 'Valorização do mercado externo.', false),
  ('e2000000-0000-4000-b000-000000006719', 'e2000000-0000-4000-a000-000000000a4f', 3, 'Priorização de insumos químicos.', false),
  ('e2000000-0000-4000-b000-00000000671a', 'e2000000-0000-4000-a000-000000000a4f', 4, 'Mecanização de técnicas de cultivo.', false),
  ('e2000000-0000-4000-b000-000000006720', 'e2000000-0000-4000-a000-000000000a50', 0, 'Evidencia a manifestação do inconsciente.', false),
  ('e2000000-0000-4000-b000-000000006721', 'e2000000-0000-4000-a000-000000000a50', 1, 'Nega a possibilidade de transcendência.', true),
  ('e2000000-0000-4000-b000-000000006722', 'e2000000-0000-4000-a000-000000000a50', 2, 'Contraria o conhecimento difuso.', false),
  ('e2000000-0000-4000-b000-000000006723', 'e2000000-0000-4000-a000-000000000a50', 3, 'Sustenta a fugacidade da vida.', false),
  ('e2000000-0000-4000-b000-000000006724', 'e2000000-0000-4000-a000-000000000a50', 4, 'Refuta a evolução biológica.', false),
  ('e2000000-0000-4000-b000-00000000672a', 'e2000000-0000-4000-a000-000000000a51', 0, 'Controlar as tensões políticas.', true),
  ('e2000000-0000-4000-b000-00000000672b', 'e2000000-0000-4000-a000-000000000a51', 1, 'Limitar a legislação trabalhista.', false),
  ('e2000000-0000-4000-b000-00000000672c', 'e2000000-0000-4000-a000-000000000a51', 2, 'Divulgar o programa populista.', false),
  ('e2000000-0000-4000-b000-00000000672d', 'e2000000-0000-4000-a000-000000000a51', 3, 'Regularizar a propriedade da terra.', false),
  ('e2000000-0000-4000-b000-00000000672e', 'e2000000-0000-4000-a000-000000000a51', 4, 'Estimular a oferta de mão de obra.', false),
  ('e2000000-0000-4000-b000-000000006734', 'e2000000-0000-4000-a000-000000000a52', 0, 'Gestão das ilicitudes pelo sistema judicial.', true),
  ('e2000000-0000-4000-b000-000000006735', 'e2000000-0000-4000-a000-000000000a52', 1, 'Aplicação das sanções pelo modelo equânime.', false),
  ('e2000000-0000-4000-b000-000000006736', 'e2000000-0000-4000-a000-000000000a52', 2, 'Supressão dos crimes pela penalização severa.', false),
  ('e2000000-0000-4000-b000-000000006737', 'e2000000-0000-4000-a000-000000000a52', 3, 'Regulamentação dos privilégios pela justiça social.', false),
  ('e2000000-0000-4000-b000-000000006738', 'e2000000-0000-4000-a000-000000000a52', 4, 'Repartição de vantagens pela hierarquização cultural.', false),
  ('e2000000-0000-4000-b000-00000000673e', 'e2000000-0000-4000-a000-000000000a53', 0, 'Disputa ideológica entre a comunidade de estrangeiros e a de nativos.', false),
  ('e2000000-0000-4000-b000-00000000673f', 'e2000000-0000-4000-a000-000000000a53', 1, 'Circularidade cultural entre a sociedade de partida e a de acolhimento.', true),
  ('e2000000-0000-4000-b000-000000006740', 'e2000000-0000-4000-a000-000000000a53', 2, 'Controle doutrinário das narrativas do cotidiano de origem e de destino..', false),
  ('e2000000-0000-4000-b000-000000006741', 'e2000000-0000-4000-a000-000000000a53', 3, 'Fiscalização política dos fluxos de populações do Novo e do Velho Mundo.', false),
  ('e2000000-0000-4000-b000-000000006742', 'e2000000-0000-4000-a000-000000000a53', 4, 'Monitoramento social dos grupos de trabalhadores da cidade e do campo.', false),
  ('e2000000-0000-4000-b000-000000006748', 'e2000000-0000-4000-a000-000000000a54', 0, 'Elevação da biomassa.', false),
  ('e2000000-0000-4000-b000-000000006749', 'e2000000-0000-4000-a000-000000000a54', 1, 'Redução da salinização.', false),
  ('e2000000-0000-4000-b000-00000000674a', 'e2000000-0000-4000-a000-000000000a54', 2, 'Diminuição da fertilidade.', true),
  ('e2000000-0000-4000-b000-00000000674b', 'e2000000-0000-4000-a000-000000000a54', 3, 'Ampliação da microfauna.', false),
  ('e2000000-0000-4000-b000-00000000674c', 'e2000000-0000-4000-a000-000000000a54', 4, 'Decomposição do substrato.', false),
  ('e2000000-0000-4000-b000-000000006752', 'e2000000-0000-4000-a000-000000000a55', 0, 'Controle do orçamento familiar.', false),
  ('e2000000-0000-4000-b000-000000006753', 'e2000000-0000-4000-a000-000000000a55', 1, 'Libertação das tradições religiosas.', false),
  ('e2000000-0000-4000-b000-000000006754', 'e2000000-0000-4000-a000-000000000a55', 2, 'Exercício da representatividade política.', false),
  ('e2000000-0000-4000-b000-000000006755', 'e2000000-0000-4000-a000-000000000a55', 3, 'Ampliação dos momentos de socialização.', true),
  ('e2000000-0000-4000-b000-000000006756', 'e2000000-0000-4000-a000-000000000a55', 4, 'Afastamento das atividades especializadas.', false),
  ('e2000000-0000-4000-b000-00000000675c', 'e2000000-0000-4000-a000-000000000a56', 0, 'Restrição dos fluxos migratórios e a maior atuação de sindicatos.', false),
  ('e2000000-0000-4000-b000-00000000675d', 'e2000000-0000-4000-a000-000000000a56', 1, 'Ampliação das leis trabalhistas e a plena importação de manufaturados.', false),
  ('e2000000-0000-4000-b000-00000000675e', 'e2000000-0000-4000-a000-000000000a56', 2, 'Proteção das florestas nacionais e a ampla transferência de tecnologias.', false),
  ('e2000000-0000-4000-b000-00000000675f', 'e2000000-0000-4000-a000-000000000a56', 3, 'Manutenção das barreiras fitossanitárias e a livre circulação de mercadorias.', true),
  ('e2000000-0000-4000-b000-000000006760', 'e2000000-0000-4000-a000-000000000a56', 4, 'Remoção dos entraves alfandegários e a melhor remuneração de empregados.', false),
  ('e2000000-0000-4000-b000-000000006766', 'e2000000-0000-4000-a000-000000000a57', 0, 'Abandono de laços afetivos.', false),
  ('e2000000-0000-4000-b000-000000006767', 'e2000000-0000-4000-a000-000000000a57', 1, 'Negação da ideia de subjetividade.', false),
  ('e2000000-0000-4000-b000-000000006768', 'e2000000-0000-4000-a000-000000000a57', 2, 'Aceitação da hierarquia de gênero.', false),
  ('e2000000-0000-4000-b000-000000006769', 'e2000000-0000-4000-a000-000000000a57', 3, 'Consolidação da estratificação social.', false),
  ('e2000000-0000-4000-b000-00000000676a', 'e2000000-0000-4000-a000-000000000a57', 4, 'Ruptura de valores institucionalizados.', true),
  ('e2000000-0000-4000-b000-000000006770', 'e2000000-0000-4000-a000-000000000a58', 0, 'Preceitos teológicos e religiosos.', false),
  ('e2000000-0000-4000-b000-000000006771', 'e2000000-0000-4000-a000-000000000a58', 1, 'Aspectos socioeconômicos e ideológicos.', true),
  ('e2000000-0000-4000-b000-000000006772', 'e2000000-0000-4000-a000-000000000a58', 2, 'Regulamentações territoriais e alfandegárias.', false),
  ('e2000000-0000-4000-b000-000000006773', 'e2000000-0000-4000-a000-000000000a58', 3, 'Orientações constitucionais e estatutárias.', false),
  ('e2000000-0000-4000-b000-000000006774', 'e2000000-0000-4000-a000-000000000a58', 4, 'Decretos legislativos e internacionais.', false),
  ('e2000000-0000-4000-b000-00000000677a', 'e2000000-0000-4000-a000-000000000a59', 0, 'Adoção do dumping comercial.', true),
  ('e2000000-0000-4000-b000-00000000677b', 'e2000000-0000-4000-a000-000000000a59', 1, 'Fusão da função administrativa.', false),
  ('e2000000-0000-4000-b000-00000000677c', 'e2000000-0000-4000-a000-000000000a59', 2, 'Criação de holding empresarial.', false),
  ('e2000000-0000-4000-b000-00000000677d', 'e2000000-0000-4000-a000-000000000a59', 3, 'Limitação do mercado monopolista.', false),
  ('e2000000-0000-4000-b000-00000000677e', 'e2000000-0000-4000-a000-000000000a59', 4, 'Modernização da produção industrial.', false),
  ('e2000000-0000-4000-b000-000000006784', 'e2000000-0000-4000-a000-000000000a5a', 0, 'Expandir o transporte marítimo.', false),
  ('e2000000-0000-4000-b000-000000006785', 'e2000000-0000-4000-a000-000000000a5a', 1, 'Incentivar os fluxos migratórios.', false),
  ('e2000000-0000-4000-b000-000000006786', 'e2000000-0000-4000-a000-000000000a5a', 2, 'Monitorar as atividades vulcânicas.', false),
  ('e2000000-0000-4000-b000-000000006787', 'e2000000-0000-4000-a000-000000000a5a', 3, 'Controlar as emissões de carbono.', true),
  ('e2000000-0000-4000-b000-000000006788', 'e2000000-0000-4000-a000-000000000a5a', 4, 'Priorizar a utilização de termoelétricas.', false),
  ('e2000000-0000-4000-b000-00000000678e', 'e2000000-0000-4000-a000-000000000a5b', 0, 'Elaboração conceitual de entendimentos.', false),
  ('e2000000-0000-4000-b000-00000000678f', 'e2000000-0000-4000-a000-000000000a5b', 1, 'Utilização persuasiva do discurso.', true),
  ('e2000000-0000-4000-b000-000000006790', 'e2000000-0000-4000-a000-000000000a5b', 2, 'Narração alegórica dos rapsodos.', false),
  ('e2000000-0000-4000-b000-000000006791', 'e2000000-0000-4000-a000-000000000a5b', 3, 'Investigação empírica da physis.', false),
  ('e2000000-0000-4000-b000-000000006792', 'e2000000-0000-4000-a000-000000000a5b', 4, 'Expressão pictográfica da pólis.', false),
  ('e2000000-0000-4000-b000-000000006798', 'e2000000-0000-4000-a000-000000000a5c', 0, 'Reduz sua predação', false),
  ('e2000000-0000-4000-b000-000000006799', 'e2000000-0000-4000-a000-000000000a5c', 1, 'Reduz o uso de pesticidas.', false),
  ('e2000000-0000-4000-b000-00000000679a', 'e2000000-0000-4000-a000-000000000a5c', 2, 'Reduz a competição por abrigo.', false),
  ('e2000000-0000-4000-b000-00000000679b', 'e2000000-0000-4000-a000-000000000a5c', 3, 'Aumenta a oferta de alimento', true),
  ('e2000000-0000-4000-b000-00000000679c', 'e2000000-0000-4000-a000-000000000a5c', 4, 'Aumenta os locais de reprodução', false),
  ('e2000000-0000-4000-b000-0000000067a2', 'e2000000-0000-4000-a000-000000000a5d', 0, 'Tratar a diarreia.', false),
  ('e2000000-0000-4000-b000-0000000067a3', 'e2000000-0000-4000-a000-000000000a5d', 1, 'Prevenir a anemia.', true),
  ('e2000000-0000-4000-b000-0000000067a4', 'e2000000-0000-4000-a000-000000000a5d', 2, 'Evitar as verminoses.', false),
  ('e2000000-0000-4000-b000-0000000067a5', 'e2000000-0000-4000-a000-000000000a5d', 3, 'Remediar o raquitismo', false),
  ('e2000000-0000-4000-b000-0000000067a6', 'e2000000-0000-4000-a000-000000000a5d', 4, 'Combater a febre amarela.', false),
  ('e2000000-0000-4000-b000-0000000067ac', 'e2000000-0000-4000-a000-000000000a5e', 0, 'Formar resíduos facilmente recicláveis.', false),
  ('e2000000-0000-4000-b000-0000000067ad', 'e2000000-0000-4000-a000-000000000a5e', 1, 'Promover o aumento do desmatamento.', false),
  ('e2000000-0000-4000-b000-0000000067ae', 'e2000000-0000-4000-a000-000000000a5e', 2, 'Contribuir para a produção de chuva ácida.', false),
  ('e2000000-0000-4000-b000-0000000067af', 'e2000000-0000-4000-a000-000000000a5e', 3, 'Emitir gases tóxicos que são lançados no ambiente.', false),
  ('e2000000-0000-4000-b000-0000000067b0', 'e2000000-0000-4000-a000-000000000a5e', 4, 'Produzir calor sem o consumo de combustíveis fósseis.', true),
  ('e2000000-0000-4000-b000-0000000067b6', 'e2000000-0000-4000-a000-000000000a5f', 0, '1', true),
  ('e2000000-0000-4000-b000-0000000067b7', 'e2000000-0000-4000-a000-000000000a5f', 1, '2', false),
  ('e2000000-0000-4000-b000-0000000067b8', 'e2000000-0000-4000-a000-000000000a5f', 2, '3', false),
  ('e2000000-0000-4000-b000-0000000067b9', 'e2000000-0000-4000-a000-000000000a5f', 3, '4', false),
  ('e2000000-0000-4000-b000-0000000067ba', 'e2000000-0000-4000-a000-000000000a5f', 4, '5', false),
  ('e2000000-0000-4000-b000-0000000067c0', 'e2000000-0000-4000-a000-000000000a60', 0, 'Execução de manobras.', false),
  ('e2000000-0000-4000-b000-0000000067c1', 'e2000000-0000-4000-a000-000000000a60', 1, 'Metabolismo corpóreo elevado.', true),
  ('e2000000-0000-4000-b000-0000000067c2', 'e2000000-0000-4000-a000-000000000a60', 2, 'Manutenção da aerodinâmica.', false),
  ('e2000000-0000-4000-b000-0000000067c3', 'e2000000-0000-4000-a000-000000000a60', 3, 'Deslocamento a grandes velocidades.', false),
  ('e2000000-0000-4000-b000-0000000067c4', 'e2000000-0000-4000-a000-000000000a60', 4, 'Capacidade de voo em grandes altitudes.', false),
  ('e2000000-0000-4000-b000-0000000067ca', 'e2000000-0000-4000-a000-000000000a61', 0, '14%', false),
  ('e2000000-0000-4000-b000-0000000067cb', 'e2000000-0000-4000-a000-000000000a61', 1, '16%', false),
  ('e2000000-0000-4000-b000-0000000067cc', 'e2000000-0000-4000-a000-000000000a61', 2, '24%', false),
  ('e2000000-0000-4000-b000-0000000067cd', 'e2000000-0000-4000-a000-000000000a61', 3, '32%', true),
  ('e2000000-0000-4000-b000-0000000067ce', 'e2000000-0000-4000-a000-000000000a61', 4, '75%', false),
  ('e2000000-0000-4000-b000-0000000067d4', 'e2000000-0000-4000-a000-000000000a62', 0, 'Acúmulo de gás etileno.', true),
  ('e2000000-0000-4000-b000-0000000067d5', 'e2000000-0000-4000-a000-000000000a62', 1, 'Redução da umidade do ar.', false),
  ('e2000000-0000-4000-b000-0000000067d6', 'e2000000-0000-4000-a000-000000000a62', 2, 'Aumento na concentração de CO2.', false),
  ('e2000000-0000-4000-b000-0000000067d7', 'e2000000-0000-4000-a000-000000000a62', 3, 'Diminuição da intensidade luminosa.', false),
  ('e2000000-0000-4000-b000-0000000067d8', 'e2000000-0000-4000-a000-000000000a62', 4, 'Isolamento do contato com O2 atmosférico.', false),
  ('e2000000-0000-4000-b000-0000000067de', 'e2000000-0000-4000-a000-000000000a63', 0, 'Ácidos necleicos.', false),
  ('e2000000-0000-4000-b000-0000000067df', 'e2000000-0000-4000-a000-000000000a63', 1, 'Carboidratos.', true),
  ('e2000000-0000-4000-b000-0000000067e0', 'e2000000-0000-4000-a000-000000000a63', 2, 'Proteínas.', false),
  ('e2000000-0000-4000-b000-0000000067e1', 'e2000000-0000-4000-a000-000000000a63', 3, 'Vitaminas.', false),
  ('e2000000-0000-4000-b000-0000000067e2', 'e2000000-0000-4000-a000-000000000a63', 4, 'Lipídios.', false),
  ('e2000000-0000-4000-b000-0000000067e8', 'e2000000-0000-4000-a000-000000000a64', 0, 'Urina.', false),
  ('e2000000-0000-4000-b000-0000000067e9', 'e2000000-0000-4000-a000-000000000a64', 1, 'Saliva.', false),
  ('e2000000-0000-4000-b000-0000000067ea', 'e2000000-0000-4000-a000-000000000a64', 2, 'Fezes.', false),
  ('e2000000-0000-4000-b000-0000000067eb', 'e2000000-0000-4000-a000-000000000a64', 3, 'Sangue.', true),
  ('e2000000-0000-4000-b000-0000000067ec', 'e2000000-0000-4000-a000-000000000a64', 4, 'Secreção ocular.', false),
  ('e2000000-0000-4000-b000-0000000067f2', 'e2000000-0000-4000-a000-000000000a65', 0, 'V = 0 e a ≠ 0 para cima.', false),
  ('e2000000-0000-4000-b000-0000000067f3', 'e2000000-0000-4000-a000-000000000a65', 1, 'V ≠ 0 para cima e a = 0', false),
  ('e2000000-0000-4000-b000-0000000067f4', 'e2000000-0000-4000-a000-000000000a65', 2, 'V = 0 e a ≠ 0 para baixo.', true),
  ('e2000000-0000-4000-b000-0000000067f5', 'e2000000-0000-4000-a000-000000000a65', 3, 'V ≠ 0 para cima e a ≠ 0 para cima.', false),
  ('e2000000-0000-4000-b000-0000000067f6', 'e2000000-0000-4000-a000-000000000a65', 4, 'V ≠ 0 para baixo e a ≠ 0 para baixo.', false),
  ('e2000000-0000-4000-b000-0000000067fc', 'e2000000-0000-4000-a000-000000000a66', 0, 'Regressão do corpo lúteo ovariano.', true),
  ('e2000000-0000-4000-b000-0000000067fd', 'e2000000-0000-4000-a000-000000000a66', 1, 'Diminuição na produção de ocitocina.', false),
  ('e2000000-0000-4000-b000-0000000067fe', 'e2000000-0000-4000-a000-000000000a66', 2, 'Liberação do gameta feminino na ovulação.', false),
  ('e2000000-0000-4000-b000-0000000067ff', 'e2000000-0000-4000-a000-000000000a66', 3, 'Aumento nos níveis dos hormônios LH e FSH.', false),
  ('e2000000-0000-4000-b000-000000006800', 'e2000000-0000-4000-a000-000000000a66', 4, 'Elevação nos níveis sorológicos de adrenalina.', false),
  ('e2000000-0000-4000-b000-000000006806', 'e2000000-0000-4000-a000-000000000a67', 0, 'Hexanal.', false),
  ('e2000000-0000-4000-b000-000000006807', 'e2000000-0000-4000-a000-000000000a67', 1, 'Hexan-1-ol.', false),
  ('e2000000-0000-4000-b000-000000006808', 'e2000000-0000-4000-a000-000000000a67', 2, 'Hexan-3-ol.', true),
  ('e2000000-0000-4000-b000-000000006809', 'e2000000-0000-4000-a000-000000000a67', 3, 'Hex-1-en-1-ol.', false),
  ('e2000000-0000-4000-b000-00000000680a', 'e2000000-0000-4000-a000-000000000a67', 4, 'Ácido hexanoico.', false),
  ('e2000000-0000-4000-b000-000000006810', 'e2000000-0000-4000-a000-000000000a68', 0, 'Fruto.', false),
  ('e2000000-0000-4000-b000-000000006811', 'e2000000-0000-4000-a000-000000000a68', 1, 'Esporo.', false),
  ('e2000000-0000-4000-b000-000000006812', 'e2000000-0000-4000-a000-000000000a68', 2, 'Semente.', false),
  ('e2000000-0000-4000-b000-000000006813', 'e2000000-0000-4000-a000-000000000a68', 3, 'Tubo polínico.', true),
  ('e2000000-0000-4000-b000-000000006814', 'e2000000-0000-4000-a000-000000000a68', 4, 'Vaso condutor.', false),
  ('e2000000-0000-4000-b000-00000000681a', 'e2000000-0000-4000-a000-000000000a69', 0, 'Vidro do frasco for translúcido.', false),
  ('e2000000-0000-4000-b000-00000000681b', 'e2000000-0000-4000-a000-000000000a69', 1, 'Concentração de gluconato de cálcio for alta.', true),
  ('e2000000-0000-4000-b000-00000000681c', 'e2000000-0000-4000-a000-000000000a69', 2, 'Frasco de vidro apresentar uma maior espessura.', false),
  ('e2000000-0000-4000-b000-00000000681d', 'e2000000-0000-4000-a000-000000000a69', 3, 'Vidro for previamente esterilizado em altas temperaturas.', false),
  ('e2000000-0000-4000-b000-00000000681e', 'e2000000-0000-4000-a000-000000000a69', 4, 'Reação do alumínio com gluconato de cálcio for endotérmica.', false),
  ('e2000000-0000-4000-b000-000000006824', 'e2000000-0000-4000-a000-000000000a6a', 0, 'Fotossíntese.', false),
  ('e2000000-0000-4000-b000-000000006825', 'e2000000-0000-4000-a000-000000000a6a', 1, 'Transpiração.', false),
  ('e2000000-0000-4000-b000-000000006826', 'e2000000-0000-4000-a000-000000000a6a', 2, 'Troca de gases.', false),
  ('e2000000-0000-4000-b000-000000006827', 'e2000000-0000-4000-a000-000000000a6a', 3, 'Formação de brotos.', false),
  ('e2000000-0000-4000-b000-000000006828', 'e2000000-0000-4000-a000-000000000a6a', 4, 'Nutrição das raízes.', true),
  ('e2000000-0000-4000-b000-00000000682e', 'e2000000-0000-4000-a000-000000000a6b', 0, 'Estimulação de leucócitos induzida pela capa lipídica contendo RNAm.', false),
  ('e2000000-0000-4000-b000-00000000682f', 'e2000000-0000-4000-a000-000000000a6b', 1, 'Atuação do RNAm como sequestrador do vírus para o meio extracelular.', false),
  ('e2000000-0000-4000-b000-000000006830', 'e2000000-0000-4000-a000-000000000a6b', 2, 'Tradução do RNAm em proteína viral, desencadeando a resposta antigênica.', true),
  ('e2000000-0000-4000-b000-000000006831', 'e2000000-0000-4000-a000-000000000a6b', 3, 'Competição entre o RNAm vacinal e o RNA viral pelos sítios dos ribossomos.', false),
  ('e2000000-0000-4000-b000-000000006832', 'e2000000-0000-4000-a000-000000000a6b', 4, 'Incorporação do RNAm viral ao genoma do hospedeiro. gerando novo fenótipo.', false),
  ('e2000000-0000-4000-b000-000000006838', 'e2000000-0000-4000-a000-000000000a6c', 0, 'Formação do pronúcleo masculino.', false),
  ('e2000000-0000-4000-b000-000000006839', 'e2000000-0000-4000-a000-000000000a6c', 1, 'Início da divisão mitótica do zigoto.', false),
  ('e2000000-0000-4000-b000-00000000683a', 'e2000000-0000-4000-a000-000000000a6c', 2, 'Término da segunda divisão meiótica do ovócito.', false),
  ('e2000000-0000-4000-b000-00000000683b', 'e2000000-0000-4000-a000-000000000a6c', 3, 'Passagem do espermatozoide pela corona radiata e zona pelúcida.', true),
  ('e2000000-0000-4000-b000-00000000683c', 'e2000000-0000-4000-a000-000000000a6c', 4, 'Fusão das membranas plasmáticas do ovócito e do espermatozoide.', false),
  ('e2000000-0000-4000-b000-000000006842', 'e2000000-0000-4000-a000-000000000a6d', 0, 'Radiação.', false),
  ('e2000000-0000-4000-b000-000000006843', 'e2000000-0000-4000-a000-000000000a6d', 1, 'Condução.', false),
  ('e2000000-0000-4000-b000-000000006844', 'e2000000-0000-4000-a000-000000000a6d', 2, 'Campo elétrico variável.', false),
  ('e2000000-0000-4000-b000-000000006845', 'e2000000-0000-4000-a000-000000000a6d', 3, 'Campo magnético variável.', true),
  ('e2000000-0000-4000-b000-000000006846', 'e2000000-0000-4000-a000-000000000a6d', 4, 'Ressonância eletromagnética.', false),
  ('e2000000-0000-4000-b000-00000000684c', 'e2000000-0000-4000-a000-000000000a6e', 0, '1/4', false),
  ('e2000000-0000-4000-b000-00000000684d', 'e2000000-0000-4000-a000-000000000a6e', 1, '1/2', false),
  ('e2000000-0000-4000-b000-00000000684e', 'e2000000-0000-4000-a000-000000000a6e', 2, '1', false),
  ('e2000000-0000-4000-b000-00000000684f', 'e2000000-0000-4000-a000-000000000a6e', 3, '2', true),
  ('e2000000-0000-4000-b000-000000006850', 'e2000000-0000-4000-a000-000000000a6e', 4, '4', false),
  ('e2000000-0000-4000-b000-000000006856', 'e2000000-0000-4000-a000-000000000a6f', 0, '![](conteudo/enem/2023/110-a-99a5e7f5.webp)', false),
  ('e2000000-0000-4000-b000-000000006857', 'e2000000-0000-4000-a000-000000000a6f', 1, '![](conteudo/enem/2023/110-b-23a075d7.webp)', true),
  ('e2000000-0000-4000-b000-000000006858', 'e2000000-0000-4000-a000-000000000a6f', 2, '![](conteudo/enem/2023/110-c-b8bb098b.webp)', false),
  ('e2000000-0000-4000-b000-000000006859', 'e2000000-0000-4000-a000-000000000a6f', 3, '![](conteudo/enem/2023/110-d-42caae88.webp)', false),
  ('e2000000-0000-4000-b000-00000000685a', 'e2000000-0000-4000-a000-000000000a6f', 4, '![](conteudo/enem/2023/110-e-8366e6b5.webp)', false),
  ('e2000000-0000-4000-b000-000000006860', 'e2000000-0000-4000-a000-000000000a70', 0, 'Altura.', false),
  ('e2000000-0000-4000-b000-000000006861', 'e2000000-0000-4000-a000-000000000a70', 1, 'Período.', false),
  ('e2000000-0000-4000-b000-000000006862', 'e2000000-0000-4000-a000-000000000a70', 2, 'Amplitude.', true),
  ('e2000000-0000-4000-b000-000000006863', 'e2000000-0000-4000-a000-000000000a70', 3, 'Velocidade.', false),
  ('e2000000-0000-4000-b000-000000006864', 'e2000000-0000-4000-a000-000000000a70', 4, 'Comprimento.', false),
  ('e2000000-0000-4000-b000-00000000686a', 'e2000000-0000-4000-a000-000000000a71', 0, 'Violeta.', true),
  ('e2000000-0000-4000-b000-00000000686b', 'e2000000-0000-4000-a000-000000000a71', 1, 'Azul.', false),
  ('e2000000-0000-4000-b000-00000000686c', 'e2000000-0000-4000-a000-000000000a71', 2, 'Verde.', false),
  ('e2000000-0000-4000-b000-00000000686d', 'e2000000-0000-4000-a000-000000000a71', 3, 'Vermelho.', false),
  ('e2000000-0000-4000-b000-00000000686e', 'e2000000-0000-4000-a000-000000000a71', 4, 'Infravermelho.', false),
  ('e2000000-0000-4000-b000-000000006874', 'e2000000-0000-4000-a000-000000000a72', 0, '![](conteudo/enem/2023/113-a-8d968451.webp)', true),
  ('e2000000-0000-4000-b000-000000006875', 'e2000000-0000-4000-a000-000000000a72', 1, '![](conteudo/enem/2023/113-b-7c34bc21.webp)', false),
  ('e2000000-0000-4000-b000-000000006876', 'e2000000-0000-4000-a000-000000000a72', 2, '![](conteudo/enem/2023/113-c-7286e182.webp)', false),
  ('e2000000-0000-4000-b000-000000006877', 'e2000000-0000-4000-a000-000000000a72', 3, '![](conteudo/enem/2023/113-d-335c851b.webp)', false),
  ('e2000000-0000-4000-b000-000000006878', 'e2000000-0000-4000-a000-000000000a72', 4, '![](conteudo/enem/2023/113-e-efe618e1.webp)', false),
  ('e2000000-0000-4000-b000-00000000687e', 'e2000000-0000-4000-a000-000000000a73', 0, 'Digeridos por enzimas.', false),
  ('e2000000-0000-4000-b000-00000000687f', 'e2000000-0000-4000-a000-000000000a73', 1, 'Acumulados nos tecidos.', true),
  ('e2000000-0000-4000-b000-000000006880', 'e2000000-0000-4000-a000-000000000a73', 2, 'Eliminados pelos estômatos.', false),
  ('e2000000-0000-4000-b000-000000006881', 'e2000000-0000-4000-a000-000000000a73', 3, 'Metabolizados por glândulas.', false),
  ('e2000000-0000-4000-b000-000000006882', 'e2000000-0000-4000-a000-000000000a73', 4, 'Utilizados como fonte energética.', false),
  ('e2000000-0000-4000-b000-000000006888', 'e2000000-0000-4000-a000-000000000a74', 0, '1', false),
  ('e2000000-0000-4000-b000-000000006889', 'e2000000-0000-4000-a000-000000000a74', 1, '2', true),
  ('e2000000-0000-4000-b000-00000000688a', 'e2000000-0000-4000-a000-000000000a74', 2, '3', false),
  ('e2000000-0000-4000-b000-00000000688b', 'e2000000-0000-4000-a000-000000000a74', 3, '4', false),
  ('e2000000-0000-4000-b000-00000000688c', 'e2000000-0000-4000-a000-000000000a74', 4, '5', false),
  ('e2000000-0000-4000-b000-000000006892', 'e2000000-0000-4000-a000-000000000a75', 0, '8', true),
  ('e2000000-0000-4000-b000-000000006893', 'e2000000-0000-4000-a000-000000000a75', 1, '10', false),
  ('e2000000-0000-4000-b000-000000006894', 'e2000000-0000-4000-a000-000000000a75', 2, '80', false),
  ('e2000000-0000-4000-b000-000000006895', 'e2000000-0000-4000-a000-000000000a75', 3, '100', false),
  ('e2000000-0000-4000-b000-000000006896', 'e2000000-0000-4000-a000-000000000a75', 4, '1000', false),
  ('e2000000-0000-4000-b000-00000000689c', 'e2000000-0000-4000-a000-000000000a76', 0, 'I.', false),
  ('e2000000-0000-4000-b000-00000000689d', 'e2000000-0000-4000-a000-000000000a76', 1, 'II.', false),
  ('e2000000-0000-4000-b000-00000000689e', 'e2000000-0000-4000-a000-000000000a76', 2, 'III.', true),
  ('e2000000-0000-4000-b000-00000000689f', 'e2000000-0000-4000-a000-000000000a76', 3, 'IV.', false),
  ('e2000000-0000-4000-b000-0000000068a0', 'e2000000-0000-4000-a000-000000000a76', 4, 'V.', false),
  ('e2000000-0000-4000-b000-0000000068a6', 'e2000000-0000-4000-a000-000000000a77', 0, '756.', false),
  ('e2000000-0000-4000-b000-0000000068a7', 'e2000000-0000-4000-a000-000000000a77', 1, '533.', false),
  ('e2000000-0000-4000-b000-0000000068a8', 'e2000000-0000-4000-a000-000000000a77', 2, '76.', true),
  ('e2000000-0000-4000-b000-0000000068a9', 'e2000000-0000-4000-a000-000000000a77', 3, '53.', false),
  ('e2000000-0000-4000-b000-0000000068aa', 'e2000000-0000-4000-a000-000000000a77', 4, '13.', false),
  ('e2000000-0000-4000-b000-0000000068b0', 'e2000000-0000-4000-a000-000000000a78', 0, 'Os mesmos.', false),
  ('e2000000-0000-4000-b000-0000000068b1', 'e2000000-0000-4000-a000-000000000a78', 1, 'Mais intensos.', false),
  ('e2000000-0000-4000-b000-0000000068b2', 'e2000000-0000-4000-a000-000000000a78', 2, 'Menos intensos.', true),
  ('e2000000-0000-4000-b000-0000000068b3', 'e2000000-0000-4000-a000-000000000a78', 3, 'Menos intenso para L1 e o mesmo para L3.', false),
  ('e2000000-0000-4000-b000-0000000068b4', 'e2000000-0000-4000-a000-000000000a78', 4, 'Mais intenso para L1 e menos intenso para L3.', false),
  ('e2000000-0000-4000-b000-0000000068ba', 'e2000000-0000-4000-a000-000000000a79', 0, 'Potássio.', true),
  ('e2000000-0000-4000-b000-0000000068bb', 'e2000000-0000-4000-a000-000000000a79', 1, 'Cálcio.', false),
  ('e2000000-0000-4000-b000-0000000068bc', 'e2000000-0000-4000-a000-000000000a79', 2, 'Magnésio.', false),
  ('e2000000-0000-4000-b000-0000000068bd', 'e2000000-0000-4000-a000-000000000a79', 3, 'Zinco.', false),
  ('e2000000-0000-4000-b000-0000000068be', 'e2000000-0000-4000-a000-000000000a79', 4, 'Ferro.', false),
  ('e2000000-0000-4000-b000-0000000068c4', 'e2000000-0000-4000-a000-000000000a7a', 0, 'Somente do calor latente de vaporização.', false),
  ('e2000000-0000-4000-b000-0000000068c5', 'e2000000-0000-4000-a000-000000000a7a', 1, 'Somente do calor latente de condensação.', false),
  ('e2000000-0000-4000-b000-0000000068c6', 'e2000000-0000-4000-a000-000000000a7a', 2, 'Do calor sensível e do calor latente de vaporização.', false),
  ('e2000000-0000-4000-b000-0000000068c7', 'e2000000-0000-4000-a000-000000000a7a', 3, 'Do calor sensível e do calor latente de condensação.', true),
  ('e2000000-0000-4000-b000-0000000068c8', 'e2000000-0000-4000-a000-000000000a7a', 4, 'Do calor latente de condensação e do calor latente de vaporização.', false),
  ('e2000000-0000-4000-b000-0000000068ce', 'e2000000-0000-4000-a000-000000000a7b', 0, 'Fenacetina.', false),
  ('e2000000-0000-4000-b000-0000000068cf', 'e2000000-0000-4000-a000-000000000a7b', 1, 'Paracetamol.', false),
  ('e2000000-0000-4000-b000-0000000068d0', 'e2000000-0000-4000-a000-000000000a7b', 2, 'Dipirona sódica.', false),
  ('e2000000-0000-4000-b000-0000000068d1', 'e2000000-0000-4000-a000-000000000a7b', 3, 'Diclofenaco sódico.', false),
  ('e2000000-0000-4000-b000-0000000068d2', 'e2000000-0000-4000-a000-000000000a7b', 4, 'Butilbrometo de escopolamina.', true),
  ('e2000000-0000-4000-b000-0000000068d8', 'e2000000-0000-4000-a000-000000000a7c', 0, '30', false),
  ('e2000000-0000-4000-b000-0000000068d9', 'e2000000-0000-4000-a000-000000000a7c', 1, '42', true),
  ('e2000000-0000-4000-b000-0000000068da', 'e2000000-0000-4000-a000-000000000a7c', 2, '72', false),
  ('e2000000-0000-4000-b000-0000000068db', 'e2000000-0000-4000-a000-000000000a7c', 3, '288', false),
  ('e2000000-0000-4000-b000-0000000068dc', 'e2000000-0000-4000-a000-000000000a7c', 4, '360', false),
  ('e2000000-0000-4000-b000-0000000068e2', 'e2000000-0000-4000-a000-000000000a7d', 0, 'Todos normais.', false),
  ('e2000000-0000-4000-b000-0000000068e3', 'e2000000-0000-4000-a000-000000000a7d', 1, 'Todos tetrassômicos.', false),
  ('e2000000-0000-4000-b000-0000000068e4', 'e2000000-0000-4000-a000-000000000a7d', 2, 'Apenas normais ou tetrassômicos', false),
  ('e2000000-0000-4000-b000-0000000068e5', 'e2000000-0000-4000-a000-000000000a7d', 3, 'Apenas trissômicos ou tetrassômicos', false),
  ('e2000000-0000-4000-b000-0000000068e6', 'e2000000-0000-4000-a000-000000000a7d', 4, 'Normais, trissômicos ou tetrassômicos.', true),
  ('e2000000-0000-4000-b000-0000000068ec', 'e2000000-0000-4000-a000-000000000a7e', 0, 'Basicidade.', false),
  ('e2000000-0000-4000-b000-0000000068ed', 'e2000000-0000-4000-a000-000000000a7e', 1, 'Lipofilicidade.', false),
  ('e2000000-0000-4000-b000-0000000068ee', 'e2000000-0000-4000-a000-000000000a7e', 2, 'Caráter iônico.', true),
  ('e2000000-0000-4000-b000-0000000068ef', 'e2000000-0000-4000-a000-000000000a7e', 3, 'Cadeia carbônica.', false),
  ('e2000000-0000-4000-b000-0000000068f0', 'e2000000-0000-4000-a000-000000000a7e', 4, 'Estado de oxidação.', false),
  ('e2000000-0000-4000-b000-0000000068f6', 'e2000000-0000-4000-a000-000000000a7f', 0, 'ATP.', false),
  ('e2000000-0000-4000-b000-0000000068f7', 'e2000000-0000-4000-a000-000000000a7f', 1, 'Água.', false),
  ('e2000000-0000-4000-b000-0000000068f8', 'e2000000-0000-4000-a000-000000000a7f', 2, 'NADH.', true),
  ('e2000000-0000-4000-b000-0000000068f9', 'e2000000-0000-4000-a000-000000000a7f', 3, 'Dióxido de carbono.', false),
  ('e2000000-0000-4000-b000-0000000068fa', 'e2000000-0000-4000-a000-000000000a7f', 4, 'Citocromo c oxidase.', false),
  ('e2000000-0000-4000-b000-000000006900', 'e2000000-0000-4000-a000-000000000a80', 0, 'Forem ambas audíveis.', false),
  ('e2000000-0000-4000-b000-000000006901', 'e2000000-0000-4000-a000-000000000a80', 1, 'Tiverem a mesma potência.', false),
  ('e2000000-0000-4000-b000-000000006902', 'e2000000-0000-4000-a000-000000000a80', 2, 'Tiverem a mesma frequência.', true),
  ('e2000000-0000-4000-b000-000000006903', 'e2000000-0000-4000-a000-000000000a80', 3, 'Tiverem a mesma intensidade.', false),
  ('e2000000-0000-4000-b000-000000006904', 'e2000000-0000-4000-a000-000000000a80', 4, 'Propagarem-se com velocidades diferentes.', false),
  ('e2000000-0000-4000-b000-00000000690a', 'e2000000-0000-4000-a000-000000000a81', 0, 'Ter a durabilidade de uma cerâmica e ser totalmente biodegradável.', false),
  ('e2000000-0000-4000-b000-00000000690b', 'e2000000-0000-4000-a000-000000000a81', 1, 'Ser tão durável quanto uma cerâmica e ter alta condutividade térmica.', false),
  ('e2000000-0000-4000-b000-00000000690c', 'e2000000-0000-4000-a000-000000000a81', 2, 'Ser um mau condutor térmico e aumentar o resíduo biodegradável na natureza.', false),
  ('e2000000-0000-4000-b000-00000000690d', 'e2000000-0000-4000-a000-000000000a81', 3, 'Ter baixa condutividade térmica e reduzir o resíduo não biodegradável na natureza.', true),
  ('e2000000-0000-4000-b000-00000000690e', 'e2000000-0000-4000-a000-000000000a81', 4, 'Ter alta condutividade térmica e possibilitar a degradação do material no meio ambiente.', false),
  ('e2000000-0000-4000-b000-000000006914', 'e2000000-0000-4000-a000-000000000a82', 0, 'Maior densidade.', true),
  ('e2000000-0000-4000-b000-000000006915', 'e2000000-0000-4000-a000-000000000a82', 1, 'Menor viscosidade.', false),
  ('e2000000-0000-4000-b000-000000006916', 'e2000000-0000-4000-a000-000000000a82', 2, 'Maior volume de gás dissolvido.', false),
  ('e2000000-0000-4000-b000-000000006917', 'e2000000-0000-4000-a000-000000000a82', 3, 'Menor massa de solutos dissolvidos.', false),
  ('e2000000-0000-4000-b000-000000006918', 'e2000000-0000-4000-a000-000000000a82', 4, 'Maior temperatura de congelamento.', false),
  ('e2000000-0000-4000-b000-00000000691e', 'e2000000-0000-4000-a000-000000000a83', 0, 'Retirar a parte polar da molécula.', false),
  ('e2000000-0000-4000-b000-00000000691f', 'e2000000-0000-4000-a000-000000000a83', 1, 'Eliminar as insaturações do anel aromático.', false),
  ('e2000000-0000-4000-b000-000000006920', 'e2000000-0000-4000-a000-000000000a83', 2, 'Trocar o grupo aniônico por um grupo neutro.', false),
  ('e2000000-0000-4000-b000-000000006921', 'e2000000-0000-4000-a000-000000000a83', 3, 'Alterar o grupo aniônico por um grupo catiônico.', false),
  ('e2000000-0000-4000-b000-000000006922', 'e2000000-0000-4000-a000-000000000a83', 4, 'Modificar a cadeia carbônica para cadeia normal.', true),
  ('e2000000-0000-4000-b000-000000006928', 'e2000000-0000-4000-a000-000000000a84', 0, 'Nucléolos.', false),
  ('e2000000-0000-4000-b000-000000006929', 'e2000000-0000-4000-a000-000000000a84', 1, 'Lisossomos.', false),
  ('e2000000-0000-4000-b000-00000000692a', 'e2000000-0000-4000-a000-000000000a84', 2, 'Ribossomos', false),
  ('e2000000-0000-4000-b000-00000000692b', 'e2000000-0000-4000-a000-000000000a84', 3, 'Mitocôndrias', false),
  ('e2000000-0000-4000-b000-00000000692c', 'e2000000-0000-4000-a000-000000000a84', 4, 'Cromossomos', true),
  ('e2000000-0000-4000-b000-000000006932', 'e2000000-0000-4000-a000-000000000a85', 0, '270.', false),
  ('e2000000-0000-4000-b000-000000006933', 'e2000000-0000-4000-a000-000000000a85', 1, '540.', false),
  ('e2000000-0000-4000-b000-000000006934', 'e2000000-0000-4000-a000-000000000a85', 2, '818.', false),
  ('e2000000-0000-4000-b000-000000006935', 'e2000000-0000-4000-a000-000000000a85', 3, '1 500.', true),
  ('e2000000-0000-4000-b000-000000006936', 'e2000000-0000-4000-a000-000000000a85', 4, '1 800.', false),
  ('e2000000-0000-4000-b000-00000000693c', 'e2000000-0000-4000-a000-000000000a86', 0, '1.198,8', false),
  ('e2000000-0000-4000-b000-00000000693d', 'e2000000-0000-4000-a000-000000000a86', 1, '1.296,0', true),
  ('e2000000-0000-4000-b000-00000000693e', 'e2000000-0000-4000-a000-000000000a86', 2, '1.360,8', false),
  ('e2000000-0000-4000-b000-00000000693f', 'e2000000-0000-4000-a000-000000000a86', 3, '4.665,6', false),
  ('e2000000-0000-4000-b000-000000006940', 'e2000000-0000-4000-a000-000000000a86', 4, '4.860,0', false),
  ('e2000000-0000-4000-b000-000000006946', 'e2000000-0000-4000-a000-000000000a87', 0, '2.000,00.', false),
  ('e2000000-0000-4000-b000-000000006947', 'e2000000-0000-4000-a000-000000000a87', 1, '2.500,00.', false),
  ('e2000000-0000-4000-b000-000000006948', 'e2000000-0000-4000-a000-000000000a87', 2, '3.250,00.', true),
  ('e2000000-0000-4000-b000-000000006949', 'e2000000-0000-4000-a000-000000000a87', 3, '4.500,00.', false),
  ('e2000000-0000-4000-b000-00000000694a', 'e2000000-0000-4000-a000-000000000a87', 4, '9.000,00.', false),
  ('e2000000-0000-4000-b000-000000006950', 'e2000000-0000-4000-a000-000000000a88', 0, '20', false),
  ('e2000000-0000-4000-b000-000000006951', 'e2000000-0000-4000-a000-000000000a88', 1, '60', false),
  ('e2000000-0000-4000-b000-000000006952', 'e2000000-0000-4000-a000-000000000a88', 2, '64', true),
  ('e2000000-0000-4000-b000-000000006953', 'e2000000-0000-4000-a000-000000000a88', 3, '68', false),
  ('e2000000-0000-4000-b000-000000006954', 'e2000000-0000-4000-a000-000000000a88', 4, '80', false),
  ('e2000000-0000-4000-b000-00000000695a', 'e2000000-0000-4000-a000-000000000a89', 0, 'Junho.', false),
  ('e2000000-0000-4000-b000-00000000695b', 'e2000000-0000-4000-a000-000000000a89', 1, 'Julho.', false),
  ('e2000000-0000-4000-b000-00000000695c', 'e2000000-0000-4000-a000-000000000a89', 2, 'Agosto.', false),
  ('e2000000-0000-4000-b000-00000000695d', 'e2000000-0000-4000-a000-000000000a89', 3, 'Setembro.', true),
  ('e2000000-0000-4000-b000-00000000695e', 'e2000000-0000-4000-a000-000000000a89', 4, 'Outubro.', false),
  ('e2000000-0000-4000-b000-000000006964', 'e2000000-0000-4000-a000-000000000a8a', 0, 'Mediana = média < moda.', false),
  ('e2000000-0000-4000-b000-000000006965', 'e2000000-0000-4000-a000-000000000a8a', 1, 'Mediana = moda < média.', false),
  ('e2000000-0000-4000-b000-000000006966', 'e2000000-0000-4000-a000-000000000a8a', 2, 'Mediana < média < moda.', false),
  ('e2000000-0000-4000-b000-000000006967', 'e2000000-0000-4000-a000-000000000a8a', 3, 'Moda < média < mediana.', false),
  ('e2000000-0000-4000-b000-000000006968', 'e2000000-0000-4000-a000-000000000a8a', 4, 'Moda < mediana < média.', true),
  ('e2000000-0000-4000-b000-00000000696e', 'e2000000-0000-4000-a000-000000000a8b', 0, '![](conteudo/enem/2023/141-a-e698edb1.webp)', false),
  ('e2000000-0000-4000-b000-00000000696f', 'e2000000-0000-4000-a000-000000000a8b', 1, '![](conteudo/enem/2023/141-b-b5f5bdf5.webp)', false),
  ('e2000000-0000-4000-b000-000000006970', 'e2000000-0000-4000-a000-000000000a8b', 2, '![](conteudo/enem/2023/141-c-d241fadb.webp)', false),
  ('e2000000-0000-4000-b000-000000006971', 'e2000000-0000-4000-a000-000000000a8b', 3, '![](conteudo/enem/2023/141-d-1dcce683.webp)', false),
  ('e2000000-0000-4000-b000-000000006972', 'e2000000-0000-4000-a000-000000000a8b', 4, '![](conteudo/enem/2023/141-e-7b4de18d.webp)', true),
  ('e2000000-0000-4000-b000-000000006978', 'e2000000-0000-4000-a000-000000000a8c', 0, '50', true),
  ('e2000000-0000-4000-b000-000000006979', 'e2000000-0000-4000-a000-000000000a8c', 1, '60', false),
  ('e2000000-0000-4000-b000-00000000697a', 'e2000000-0000-4000-a000-000000000a8c', 2, '80', false),
  ('e2000000-0000-4000-b000-00000000697b', 'e2000000-0000-4000-a000-000000000a8c', 3, '140', false),
  ('e2000000-0000-4000-b000-00000000697c', 'e2000000-0000-4000-a000-000000000a8c', 4, '150', false),
  ('e2000000-0000-4000-b000-000000006982', 'e2000000-0000-4000-a000-000000000a8d', 0, '10', false),
  ('e2000000-0000-4000-b000-000000006983', 'e2000000-0000-4000-a000-000000000a8d', 1, '11', true),
  ('e2000000-0000-4000-b000-000000006984', 'e2000000-0000-4000-a000-000000000a8d', 2, '12', false),
  ('e2000000-0000-4000-b000-000000006985', 'e2000000-0000-4000-a000-000000000a8d', 3, '30', false),
  ('e2000000-0000-4000-b000-000000006986', 'e2000000-0000-4000-a000-000000000a8d', 4, '33', false),
  ('e2000000-0000-4000-b000-00000000698c', 'e2000000-0000-4000-a000-000000000a8e', 0, '0,3', false),
  ('e2000000-0000-4000-b000-00000000698d', 'e2000000-0000-4000-a000-000000000a8e', 1, '0,5', false),
  ('e2000000-0000-4000-b000-00000000698e', 'e2000000-0000-4000-a000-000000000a8e', 2, '0,9', true),
  ('e2000000-0000-4000-b000-00000000698f', 'e2000000-0000-4000-a000-000000000a8e', 3, '1,8', false),
  ('e2000000-0000-4000-b000-000000006990', 'e2000000-0000-4000-a000-000000000a8e', 4, '2,7', false),
  ('e2000000-0000-4000-b000-000000006996', 'e2000000-0000-4000-a000-000000000a8f', 0, '![](conteudo/enem/2023/145-a-b794885b.webp)', false),
  ('e2000000-0000-4000-b000-000000006997', 'e2000000-0000-4000-a000-000000000a8f', 1, '![](conteudo/enem/2023/145-b-57b5461f.webp)', true),
  ('e2000000-0000-4000-b000-000000006998', 'e2000000-0000-4000-a000-000000000a8f', 2, '![](conteudo/enem/2023/145-c-d7e46a12.webp)', false),
  ('e2000000-0000-4000-b000-000000006999', 'e2000000-0000-4000-a000-000000000a8f', 3, '![](conteudo/enem/2023/145-d-7a03bf64.webp)', false),
  ('e2000000-0000-4000-b000-00000000699a', 'e2000000-0000-4000-a000-000000000a8f', 4, '![](conteudo/enem/2023/145-e-5be53460.webp)', false),
  ('e2000000-0000-4000-b000-0000000069a0', 'e2000000-0000-4000-a000-000000000a90', 0, 'Há somente uma solução possível, e as somas em cada lado do triângulo são iguais a 7.', false),
  ('e2000000-0000-4000-b000-0000000069a1', 'e2000000-0000-4000-a000-000000000a90', 1, 'Há somente uma solução possível, e as somas em cada lado do triângulo são iguais a 9.', false),
  ('e2000000-0000-4000-b000-0000000069a2', 'e2000000-0000-4000-a000-000000000a90', 2, 'Há somente duas soluções possíveis, uma em que as somas em cada lado do triângulo são iguais a 7 e outra em que as somas são iguais a 9.', false),
  ('e2000000-0000-4000-b000-0000000069a3', 'e2000000-0000-4000-a000-000000000a90', 3, 'Há somente duas soluções possíveis, uma em que as somas em cada lado do triângulo são iguais a 9 e outra em que as somas são iguais a 12.', false),
  ('e2000000-0000-4000-b000-0000000069a4', 'e2000000-0000-4000-a000-000000000a90', 4, 'Há somente duas soluções possíveis, uma em que as somas em cada lado do triângulo são iguais a 10 e outra em que as somas são iguais a 11.', true),
  ('e2000000-0000-4000-b000-0000000069aa', 'e2000000-0000-4000-a000-000000000a91', 0, '1', false),
  ('e2000000-0000-4000-b000-0000000069ab', 'e2000000-0000-4000-a000-000000000a91', 1, '4', false),
  ('e2000000-0000-4000-b000-0000000069ac', 'e2000000-0000-4000-a000-000000000a91', 2, '6', false),
  ('e2000000-0000-4000-b000-0000000069ad', 'e2000000-0000-4000-a000-000000000a91', 3, '7', true),
  ('e2000000-0000-4000-b000-0000000069ae', 'e2000000-0000-4000-a000-000000000a91', 4, '8', false),
  ('e2000000-0000-4000-b000-0000000069b4', 'e2000000-0000-4000-a000-000000000a92', 0, '![](conteudo/enem/2023/148-a-5caf269a.webp)', false),
  ('e2000000-0000-4000-b000-0000000069b5', 'e2000000-0000-4000-a000-000000000a92', 1, '![](conteudo/enem/2023/148-b-43a6cfb3.webp)', false),
  ('e2000000-0000-4000-b000-0000000069b6', 'e2000000-0000-4000-a000-000000000a92', 2, '![](conteudo/enem/2023/148-c-16d931ae.webp)', true),
  ('e2000000-0000-4000-b000-0000000069b7', 'e2000000-0000-4000-a000-000000000a92', 3, '![](conteudo/enem/2023/148-d-5de1f078.webp)', false),
  ('e2000000-0000-4000-b000-0000000069b8', 'e2000000-0000-4000-a000-000000000a92', 4, '![](conteudo/enem/2023/148-e-a642bb31.webp)', false),
  ('e2000000-0000-4000-b000-0000000069be', 'e2000000-0000-4000-a000-000000000a93', 0, '1 : 5.', false),
  ('e2000000-0000-4000-b000-0000000069bf', 'e2000000-0000-4000-a000-000000000a93', 1, '1 : 11.', false),
  ('e2000000-0000-4000-b000-0000000069c0', 'e2000000-0000-4000-a000-000000000a93', 2, '1 : 55.', false),
  ('e2000000-0000-4000-b000-0000000069c1', 'e2000000-0000-4000-a000-000000000a93', 3, '1 : 5000.', false),
  ('e2000000-0000-4000-b000-0000000069c2', 'e2000000-0000-4000-a000-000000000a93', 4, '1 : 500 000.', true),
  ('e2000000-0000-4000-b000-0000000069c8', 'e2000000-0000-4000-a000-000000000a94', 0, 'C = 0,9q', true),
  ('e2000000-0000-4000-b000-0000000069c9', 'e2000000-0000-4000-a000-000000000a94', 1, 'C = 0,1q', false),
  ('e2000000-0000-4000-b000-0000000069ca', 'e2000000-0000-4000-a000-000000000a94', 2, 'C = 1 − 0,1q', false),
  ('e2000000-0000-4000-b000-0000000069cb', 'e2000000-0000-4000-a000-000000000a94', 3, 'C = 1 − 0,9q', false),
  ('e2000000-0000-4000-b000-0000000069cc', 'e2000000-0000-4000-a000-000000000a94', 4, 'C = q − 10', false),
  ('e2000000-0000-4000-b000-0000000069d2', 'e2000000-0000-4000-a000-000000000a95', 0, '3', false),
  ('e2000000-0000-4000-b000-0000000069d3', 'e2000000-0000-4000-a000-000000000a95', 1, '4', true),
  ('e2000000-0000-4000-b000-0000000069d4', 'e2000000-0000-4000-a000-000000000a95', 2, '6', false),
  ('e2000000-0000-4000-b000-0000000069d5', 'e2000000-0000-4000-a000-000000000a95', 3, '7', false),
  ('e2000000-0000-4000-b000-0000000069d6', 'e2000000-0000-4000-a000-000000000a95', 4, '9', false),
  ('e2000000-0000-4000-b000-0000000069dc', 'e2000000-0000-4000-a000-000000000a96', 0, 'I.', false),
  ('e2000000-0000-4000-b000-0000000069dd', 'e2000000-0000-4000-a000-000000000a96', 1, 'II.', true),
  ('e2000000-0000-4000-b000-0000000069de', 'e2000000-0000-4000-a000-000000000a96', 2, 'III.', false),
  ('e2000000-0000-4000-b000-0000000069df', 'e2000000-0000-4000-a000-000000000a96', 3, 'IV.', false),
  ('e2000000-0000-4000-b000-0000000069e0', 'e2000000-0000-4000-a000-000000000a96', 4, 'V.', false),
  ('e2000000-0000-4000-b000-0000000069e6', 'e2000000-0000-4000-a000-000000000a97', 0, 'I.', false),
  ('e2000000-0000-4000-b000-0000000069e7', 'e2000000-0000-4000-a000-000000000a97', 1, 'II.', false),
  ('e2000000-0000-4000-b000-0000000069e8', 'e2000000-0000-4000-a000-000000000a97', 2, 'III.', false),
  ('e2000000-0000-4000-b000-0000000069e9', 'e2000000-0000-4000-a000-000000000a97', 3, 'IV.', false),
  ('e2000000-0000-4000-b000-0000000069ea', 'e2000000-0000-4000-a000-000000000a97', 4, 'V.', true),
  ('e2000000-0000-4000-b000-0000000069f0', 'e2000000-0000-4000-a000-000000000a98', 0, 'Cone.', false),
  ('e2000000-0000-4000-b000-0000000069f1', 'e2000000-0000-4000-a000-000000000a98', 1, 'Setor circular.', true),
  ('e2000000-0000-4000-b000-0000000069f2', 'e2000000-0000-4000-a000-000000000a98', 2, 'Segmento circular.', false),
  ('e2000000-0000-4000-b000-0000000069f3', 'e2000000-0000-4000-a000-000000000a98', 3, 'Triângulo isósceles.', false),
  ('e2000000-0000-4000-b000-0000000069f4', 'e2000000-0000-4000-a000-000000000a98', 4, 'Arco de circunferência.', false),
  ('e2000000-0000-4000-b000-0000000069fa', 'e2000000-0000-4000-a000-000000000a99', 0, '1.000', false),
  ('e2000000-0000-4000-b000-0000000069fb', 'e2000000-0000-4000-a000-000000000a99', 1, '900', false),
  ('e2000000-0000-4000-b000-0000000069fc', 'e2000000-0000-4000-a000-000000000a99', 2, '600', false),
  ('e2000000-0000-4000-b000-0000000069fd', 'e2000000-0000-4000-a000-000000000a99', 3, '500', true),
  ('e2000000-0000-4000-b000-0000000069fe', 'e2000000-0000-4000-a000-000000000a99', 4, '400', false),
  ('e2000000-0000-4000-b000-000000006a04', 'e2000000-0000-4000-a000-000000000a9a', 0, '6', true),
  ('e2000000-0000-4000-b000-000000006a05', 'e2000000-0000-4000-a000-000000000a9a', 1, '8', false),
  ('e2000000-0000-4000-b000-000000006a06', 'e2000000-0000-4000-a000-000000000a9a', 2, '10', false),
  ('e2000000-0000-4000-b000-000000006a07', 'e2000000-0000-4000-a000-000000000a9a', 3, '14', false),
  ('e2000000-0000-4000-b000-000000006a08', 'e2000000-0000-4000-a000-000000000a9a', 4, '24', false),
  ('e2000000-0000-4000-b000-000000006a0e', 'e2000000-0000-4000-a000-000000000a9b', 0, '10', false),
  ('e2000000-0000-4000-b000-000000006a0f', 'e2000000-0000-4000-a000-000000000a9b', 1, '20', true),
  ('e2000000-0000-4000-b000-000000006a10', 'e2000000-0000-4000-a000-000000000a9b', 2, '30', false),
  ('e2000000-0000-4000-b000-000000006a11', 'e2000000-0000-4000-a000-000000000a9b', 3, '50', false),
  ('e2000000-0000-4000-b000-000000006a12', 'e2000000-0000-4000-a000-000000000a9b', 4, '70', false),
  ('e2000000-0000-4000-b000-000000006a18', 'e2000000-0000-4000-a000-000000000a9c', 0, '1', false),
  ('e2000000-0000-4000-b000-000000006a19', 'e2000000-0000-4000-a000-000000000a9c', 1, '2', false),
  ('e2000000-0000-4000-b000-000000006a1a', 'e2000000-0000-4000-a000-000000000a9c', 2, '3', false),
  ('e2000000-0000-4000-b000-000000006a1b', 'e2000000-0000-4000-a000-000000000a9c', 3, '4', true),
  ('e2000000-0000-4000-b000-000000006a1c', 'e2000000-0000-4000-a000-000000000a9c', 4, '5', false),
  ('e2000000-0000-4000-b000-000000006a22', 'e2000000-0000-4000-a000-000000000a9d', 0, '2', false),
  ('e2000000-0000-4000-b000-000000006a23', 'e2000000-0000-4000-a000-000000000a9d', 1, '4', false),
  ('e2000000-0000-4000-b000-000000006a24', 'e2000000-0000-4000-a000-000000000a9d', 2, '6', false),
  ('e2000000-0000-4000-b000-000000006a25', 'e2000000-0000-4000-a000-000000000a9d', 3, '12', true),
  ('e2000000-0000-4000-b000-000000006a26', 'e2000000-0000-4000-a000-000000000a9d', 4, '18', false),
  ('e2000000-0000-4000-b000-000000006a2c', 'e2000000-0000-4000-a000-000000000a9e', 0, 'Tipo I, pois p1 < p2 < p3.', true),
  ('e2000000-0000-4000-b000-000000006a2d', 'e2000000-0000-4000-a000-000000000a9e', 1, 'Tipo I, pois tem menor quantidade de caracteres.', false),
  ('e2000000-0000-4000-b000-000000006a2e', 'e2000000-0000-4000-a000-000000000a9e', 2, 'Tipo II, pois tem maior quantidade de letras.', false),
  ('e2000000-0000-4000-b000-000000006a2f', 'e2000000-0000-4000-a000-000000000a9e', 3, 'Tipo III, pois p3 < p2 < p1', false),
  ('e2000000-0000-4000-b000-000000006a30', 'e2000000-0000-4000-a000-000000000a9e', 4, 'Tipo III, pois tem maior quantidade de caracteres.', false),
  ('e2000000-0000-4000-b000-000000006a36', 'e2000000-0000-4000-a000-000000000a9f', 0, '6,7%', false),
  ('e2000000-0000-4000-b000-000000006a37', 'e2000000-0000-4000-a000-000000000a9f', 1, '10%', false),
  ('e2000000-0000-4000-b000-000000006a38', 'e2000000-0000-4000-a000-000000000a9f', 2, '20%', false),
  ('e2000000-0000-4000-b000-000000006a39', 'e2000000-0000-4000-a000-000000000a9f', 3, '21,5%', true),
  ('e2000000-0000-4000-b000-000000006a3a', 'e2000000-0000-4000-a000-000000000a9f', 4, '23,3%', false),
  ('e2000000-0000-4000-b000-000000006a40', 'e2000000-0000-4000-a000-000000000aa0', 0, 'Y = 250x', false),
  ('e2000000-0000-4000-b000-000000006a41', 'e2000000-0000-4000-a000-000000000aa0', 1, 'Y = 500x', false),
  ('e2000000-0000-4000-b000-000000006a42', 'e2000000-0000-4000-a000-000000000aa0', 2, 'Y = 750x', false),
  ('e2000000-0000-4000-b000-000000006a43', 'e2000000-0000-4000-a000-000000000aa0', 3, 'Y = 250x + 500', true),
  ('e2000000-0000-4000-b000-000000006a44', 'e2000000-0000-4000-a000-000000000aa0', 4, 'Y = 500x + 250', false),
  ('e2000000-0000-4000-b000-000000006a4a', 'e2000000-0000-4000-a000-000000000aa1', 0, '![](conteudo/enem/2023/163-a-71c51165.webp)', true),
  ('e2000000-0000-4000-b000-000000006a4b', 'e2000000-0000-4000-a000-000000000aa1', 1, '![](conteudo/enem/2023/163-b-e04c3016.webp)', false),
  ('e2000000-0000-4000-b000-000000006a4c', 'e2000000-0000-4000-a000-000000000aa1', 2, '![](conteudo/enem/2023/163-c-1706f84a.webp)', false),
  ('e2000000-0000-4000-b000-000000006a4d', 'e2000000-0000-4000-a000-000000000aa1', 3, '![](conteudo/enem/2023/163-d-d49e3db4.webp)', false),
  ('e2000000-0000-4000-b000-000000006a4e', 'e2000000-0000-4000-a000-000000000aa1', 4, '![](conteudo/enem/2023/163-e-7f6e3bbf.webp)', false),
  ('e2000000-0000-4000-b000-000000006a54', 'e2000000-0000-4000-a000-000000000aa2', 0, 'Indígenas.', false),
  ('e2000000-0000-4000-b000-000000006a55', 'e2000000-0000-4000-a000-000000000aa2', 1, 'Gestantes.', false),
  ('e2000000-0000-4000-b000-000000006a56', 'e2000000-0000-4000-a000-000000000aa2', 2, 'Doentes crônicos.', false),
  ('e2000000-0000-4000-b000-000000006a57', 'e2000000-0000-4000-a000-000000000aa2', 3, 'Adultos entre 20 e 29 anos.', true),
  ('e2000000-0000-4000-b000-000000006a58', 'e2000000-0000-4000-a000-000000000aa2', 4, 'Crianças de 6 meses a 2 anos.', false),
  ('e2000000-0000-4000-b000-000000006a5e', 'e2000000-0000-4000-a000-000000000aa3', 0, '1,20.', false),
  ('e2000000-0000-4000-b000-000000006a5f', 'e2000000-0000-4000-a000-000000000aa3', 1, '1,35.', false),
  ('e2000000-0000-4000-b000-000000006a60', 'e2000000-0000-4000-a000-000000000aa3', 2, '1,65.', false),
  ('e2000000-0000-4000-b000-000000006a61', 'e2000000-0000-4000-a000-000000000aa3', 3, '1,80.', false),
  ('e2000000-0000-4000-b000-000000006a62', 'e2000000-0000-4000-a000-000000000aa3', 4, '1,95.', true),
  ('e2000000-0000-4000-b000-000000006a68', 'e2000000-0000-4000-a000-000000000aa4', 0, 'Segunda-feira.', false),
  ('e2000000-0000-4000-b000-000000006a69', 'e2000000-0000-4000-a000-000000000aa4', 1, 'Terça-feira.', false),
  ('e2000000-0000-4000-b000-000000006a6a', 'e2000000-0000-4000-a000-000000000aa4', 2, 'Quarta-feira.', true),
  ('e2000000-0000-4000-b000-000000006a6b', 'e2000000-0000-4000-a000-000000000aa4', 3, 'Quinta-feira.', false),
  ('e2000000-0000-4000-b000-000000006a6c', 'e2000000-0000-4000-a000-000000000aa4', 4, 'Sexta-feira.', false),
  ('e2000000-0000-4000-b000-000000006a72', 'e2000000-0000-4000-a000-000000000aa5', 0, '(5,0 ; 5,5).', true),
  ('e2000000-0000-4000-b000-000000006a73', 'e2000000-0000-4000-a000-000000000aa5', 1, '(8,0 ; 8,5).', false),
  ('e2000000-0000-4000-b000-000000006a74', 'e2000000-0000-4000-a000-000000000aa5', 2, '(11,5 ; 12,5).', false),
  ('e2000000-0000-4000-b000-000000006a75', 'e2000000-0000-4000-a000-000000000aa5', 3, '(19,5 ; 20,5).', false),
  ('e2000000-0000-4000-b000-000000006a76', 'e2000000-0000-4000-a000-000000000aa5', 4, '(3,5 ; 4,0).', false),
  ('e2000000-0000-4000-b000-000000006a7c', 'e2000000-0000-4000-a000-000000000aa6', 0, '![](conteudo/enem/2023/168-a-a5689a77.webp)', true),
  ('e2000000-0000-4000-b000-000000006a7d', 'e2000000-0000-4000-a000-000000000aa6', 1, '![](conteudo/enem/2023/168-b-67248715.webp)', false),
  ('e2000000-0000-4000-b000-000000006a7e', 'e2000000-0000-4000-a000-000000000aa6', 2, '![](conteudo/enem/2023/168-c-4d9a67e0.webp)', false),
  ('e2000000-0000-4000-b000-000000006a7f', 'e2000000-0000-4000-a000-000000000aa6', 3, '![](conteudo/enem/2023/168-d-24184847.webp)', false),
  ('e2000000-0000-4000-b000-000000006a80', 'e2000000-0000-4000-a000-000000000aa6', 4, '![](conteudo/enem/2023/168-e-adeb932f.webp)', false),
  ('e2000000-0000-4000-b000-000000006a86', 'e2000000-0000-4000-a000-000000000aa7', 0, '![](conteudo/enem/2023/169-a-0ad62fa9.webp)', false),
  ('e2000000-0000-4000-b000-000000006a87', 'e2000000-0000-4000-a000-000000000aa7', 1, '![](conteudo/enem/2023/169-b-74afb699.webp)', false),
  ('e2000000-0000-4000-b000-000000006a88', 'e2000000-0000-4000-a000-000000000aa7', 2, '![](conteudo/enem/2023/169-c-23fe5ab4.webp)', false),
  ('e2000000-0000-4000-b000-000000006a89', 'e2000000-0000-4000-a000-000000000aa7', 3, '![](conteudo/enem/2023/169-d-9394f679.webp)', true),
  ('e2000000-0000-4000-b000-000000006a8a', 'e2000000-0000-4000-a000-000000000aa7', 4, '![](conteudo/enem/2023/169-e-5037e73b.webp)', false),
  ('e2000000-0000-4000-b000-000000006a90', 'e2000000-0000-4000-a000-000000000aa8', 0, 'Ótimo.', false),
  ('e2000000-0000-4000-b000-000000006a91', 'e2000000-0000-4000-a000-000000000aa8', 1, 'Bom.', false),
  ('e2000000-0000-4000-b000-000000006a92', 'e2000000-0000-4000-a000-000000000aa8', 2, 'Normal.', false),
  ('e2000000-0000-4000-b000-000000006a93', 'e2000000-0000-4000-a000-000000000aa8', 3, 'Ruim.', true),
  ('e2000000-0000-4000-b000-000000006a94', 'e2000000-0000-4000-a000-000000000aa8', 4, 'Péssimo.', false),
  ('e2000000-0000-4000-b000-000000006a9a', 'e2000000-0000-4000-a000-000000000aa9', 0, '741', false),
  ('e2000000-0000-4000-b000-000000006a9b', 'e2000000-0000-4000-a000-000000000aa9', 1, '1 040', false),
  ('e2000000-0000-4000-b000-000000006a9c', 'e2000000-0000-4000-a000-000000000aa9', 2, '1 460', true),
  ('e2000000-0000-4000-b000-000000006a9d', 'e2000000-0000-4000-a000-000000000aa9', 3, '2 100', false),
  ('e2000000-0000-4000-b000-000000006a9e', 'e2000000-0000-4000-a000-000000000aa9', 4, '5 200', false),
  ('e2000000-0000-4000-b000-000000006aa4', 'e2000000-0000-4000-a000-000000000aaa', 0, '0° < a < 90°', false),
  ('e2000000-0000-4000-b000-000000006aa5', 'e2000000-0000-4000-a000-000000000aaa', 1, 'A = 90°', false),
  ('e2000000-0000-4000-b000-000000006aa6', 'e2000000-0000-4000-a000-000000000aaa', 2, '90° < a < 180°', true),
  ('e2000000-0000-4000-b000-000000006aa7', 'e2000000-0000-4000-a000-000000000aaa', 3, 'A = 180°', false),
  ('e2000000-0000-4000-b000-000000006aa8', 'e2000000-0000-4000-a000-000000000aaa', 4, '180° < a < 360°', false),
  ('e2000000-0000-4000-b000-000000006aae', 'e2000000-0000-4000-a000-000000000aab', 0, '![](conteudo/enem/2023/173-a-58763f45.webp)', false),
  ('e2000000-0000-4000-b000-000000006aaf', 'e2000000-0000-4000-a000-000000000aab', 1, '![](conteudo/enem/2023/173-b-81adc538.webp)', true),
  ('e2000000-0000-4000-b000-000000006ab0', 'e2000000-0000-4000-a000-000000000aab', 2, '![](conteudo/enem/2023/173-c-5d5d774d.webp)', false),
  ('e2000000-0000-4000-b000-000000006ab1', 'e2000000-0000-4000-a000-000000000aab', 3, '![](conteudo/enem/2023/173-d-3464da35.webp)', false),
  ('e2000000-0000-4000-b000-000000006ab2', 'e2000000-0000-4000-a000-000000000aab', 4, '![](conteudo/enem/2023/173-e-146d0f23.webp)', false),
  ('e2000000-0000-4000-b000-000000006ab8', 'e2000000-0000-4000-a000-000000000aac', 0, '4,68', false),
  ('e2000000-0000-4000-b000-000000006ab9', 'e2000000-0000-4000-a000-000000000aac', 1, '6,30', true),
  ('e2000000-0000-4000-b000-000000006aba', 'e2000000-0000-4000-a000-000000000aac', 2, '9,30', false),
  ('e2000000-0000-4000-b000-000000006abb', 'e2000000-0000-4000-a000-000000000aac', 3, '10,50', false),
  ('e2000000-0000-4000-b000-000000006abc', 'e2000000-0000-4000-a000-000000000aac', 4, '10,65', false),
  ('e2000000-0000-4000-b000-000000006ac2', 'e2000000-0000-4000-a000-000000000aad', 0, '59', false),
  ('e2000000-0000-4000-b000-000000006ac3', 'e2000000-0000-4000-a000-000000000aad', 1, '83', false),
  ('e2000000-0000-4000-b000-000000006ac4', 'e2000000-0000-4000-a000-000000000aad', 2, '86', false),
  ('e2000000-0000-4000-b000-000000006ac5', 'e2000000-0000-4000-a000-000000000aad', 3, '89', false),
  ('e2000000-0000-4000-b000-000000006ac6', 'e2000000-0000-4000-a000-000000000aad', 4, '92', true),
  ('e2000000-0000-4000-b000-000000006acc', 'e2000000-0000-4000-a000-000000000aae', 0, '![](conteudo/enem/2023/177-a-3837d9d0.webp)', true),
  ('e2000000-0000-4000-b000-000000006acd', 'e2000000-0000-4000-a000-000000000aae', 1, '![](conteudo/enem/2023/177-b-262c33a1.webp)', false),
  ('e2000000-0000-4000-b000-000000006ace', 'e2000000-0000-4000-a000-000000000aae', 2, '![](conteudo/enem/2023/177-c-b9b5c23e.webp)', false),
  ('e2000000-0000-4000-b000-000000006acf', 'e2000000-0000-4000-a000-000000000aae', 3, '![](conteudo/enem/2023/177-d-03cd2618.webp)', false),
  ('e2000000-0000-4000-b000-000000006ad0', 'e2000000-0000-4000-a000-000000000aae', 4, '![](conteudo/enem/2023/177-e-0624eace.webp)', false),
  ('e2000000-0000-4000-b000-000000006ad6', 'e2000000-0000-4000-a000-000000000aaf', 0, '![](conteudo/enem/2023/178-a-ad5cc202.webp)', false),
  ('e2000000-0000-4000-b000-000000006ad7', 'e2000000-0000-4000-a000-000000000aaf', 1, '![](conteudo/enem/2023/178-b-c3b0946f.webp)', true),
  ('e2000000-0000-4000-b000-000000006ad8', 'e2000000-0000-4000-a000-000000000aaf', 2, '![](conteudo/enem/2023/178-c-f9e8ae9f.webp)', false),
  ('e2000000-0000-4000-b000-000000006ad9', 'e2000000-0000-4000-a000-000000000aaf', 3, '![](conteudo/enem/2023/178-d-46326c50.webp)', false),
  ('e2000000-0000-4000-b000-000000006ada', 'e2000000-0000-4000-a000-000000000aaf', 4, '![](conteudo/enem/2023/178-e-7ebc0f53.webp)', false),
  ('e2000000-0000-4000-b000-000000006ae0', 'e2000000-0000-4000-a000-000000000ab0', 0, 'Okosa urapum urapum urapum e okosa okosa urapum urapum urapum.', false),
  ('e2000000-0000-4000-b000-000000006ae1', 'e2000000-0000-4000-a000-000000000ab0', 1, 'Okosa okosa urapum e okosa okosa okosa okosa urapum.', false),
  ('e2000000-0000-4000-b000-000000006ae2', 'e2000000-0000-4000-a000-000000000ab0', 2, 'Okosa okosa urapum e okosa okosa okosa urapum.', true),
  ('e2000000-0000-4000-b000-000000006ae3', 'e2000000-0000-4000-a000-000000000ab0', 3, 'Okosa urapum urapum e okosa urapum okosa urapum urapum.', false),
  ('e2000000-0000-4000-b000-000000006ae4', 'e2000000-0000-4000-a000-000000000ab0', 4, 'Okosa okosa urapum e okosa okosa okosa okosa.', false),
  ('e2000000-0000-4000-b000-000000006aea', 'e2000000-0000-4000-a000-000000000ab1', 0, 'Outubro.', false),
  ('e2000000-0000-4000-b000-000000006aeb', 'e2000000-0000-4000-a000-000000000ab1', 1, 'Novembro.', false),
  ('e2000000-0000-4000-b000-000000006aec', 'e2000000-0000-4000-a000-000000000ab1', 2, 'Dezembro.', true),
  ('e2000000-0000-4000-b000-000000006aed', 'e2000000-0000-4000-a000-000000000ab1', 3, 'Janeiro.', false),
  ('e2000000-0000-4000-b000-000000006aee', 'e2000000-0000-4000-a000-000000000ab1', 4, 'Fevereiro.', false),
  ('e2000000-0000-4000-b000-000000006af4', 'e2000000-0000-4000-a000-000000000ab2', 0, '1612', true),
  ('e2000000-0000-4000-b000-000000006af5', 'e2000000-0000-4000-a000-000000000ab2', 1, '1615', false),
  ('e2000000-0000-4000-b000-000000006af6', 'e2000000-0000-4000-a000-000000000ab2', 2, '1684', false),
  ('e2000000-0000-4000-b000-000000006af7', 'e2000000-0000-4000-a000-000000000ab2', 3, '1621', false),
  ('e2000000-0000-4000-b000-000000006af8', 'e2000000-0000-4000-a000-000000000ab2', 4, '1641', false),
  ('e2000000-0000-4000-b000-000000006afe', 'e2000000-0000-4000-a000-000000000ab3', 0, '1997', false),
  ('e2000000-0000-4000-b000-000000006aff', 'e2000000-0000-4000-a000-000000000ab3', 1, '1684', false),
  ('e2000000-0000-4000-b000-000000006b00', 'e2000000-0000-4000-a000-000000000ab3', 2, '2019', false),
  ('e2000000-0000-4000-b000-000000006b01', 'e2000000-0000-4000-a000-000000000ab3', 3, '1615', true),
  ('e2000000-0000-4000-b000-000000006b02', 'e2000000-0000-4000-a000-000000000ab3', 4, '1823', false),
  ('e2000000-0000-4000-b000-000000006b08', 'e2000000-0000-4000-a000-000000000ab4', 0, '1621', true),
  ('e2000000-0000-4000-b000-000000006b09', 'e2000000-0000-4000-a000-000000000ab4', 1, '1641', false),
  ('e2000000-0000-4000-b000-000000006b0a', 'e2000000-0000-4000-a000-000000000ab4', 2, '1612', false),
  ('e2000000-0000-4000-b000-000000006b0b', 'e2000000-0000-4000-a000-000000000ab4', 3, '1823', false),
  ('e2000000-0000-4000-b000-000000006b0c', 'e2000000-0000-4000-a000-000000000ab4', 4, '2019', false),
  ('e2000000-0000-4000-b000-000000006b12', 'e2000000-0000-4000-a000-000000000ab5', 0, '1621', false),
  ('e2000000-0000-4000-b000-000000006b13', 'e2000000-0000-4000-a000-000000000ab5', 1, '1997', false),
  ('e2000000-0000-4000-b000-000000006b14', 'e2000000-0000-4000-a000-000000000ab5', 2, '2019', false),
  ('e2000000-0000-4000-b000-000000006b15', 'e2000000-0000-4000-a000-000000000ab5', 3, '1641', true),
  ('e2000000-0000-4000-b000-000000006b16', 'e2000000-0000-4000-a000-000000000ab5', 4, '1684', false),
  ('e2000000-0000-4000-b000-000000006b1c', 'e2000000-0000-4000-a000-000000000ab6', 0, '1621', false),
  ('e2000000-0000-4000-b000-000000006b1d', 'e2000000-0000-4000-a000-000000000ab6', 1, '1823', false),
  ('e2000000-0000-4000-b000-000000006b1e', 'e2000000-0000-4000-a000-000000000ab6', 2, '1838', false),
  ('e2000000-0000-4000-b000-000000006b1f', 'e2000000-0000-4000-a000-000000000ab6', 3, '2019', false),
  ('e2000000-0000-4000-b000-000000006b20', 'e2000000-0000-4000-a000-000000000ab6', 4, '1684', true),
  ('e2000000-0000-4000-b000-000000006b26', 'e2000000-0000-4000-a000-000000000ab7', 0, '1838', false),
  ('e2000000-0000-4000-b000-000000006b27', 'e2000000-0000-4000-a000-000000000ab7', 1, '1997', false),
  ('e2000000-0000-4000-b000-000000006b28', 'e2000000-0000-4000-a000-000000000ab7', 2, '1615', false),
  ('e2000000-0000-4000-b000-000000006b29', 'e2000000-0000-4000-a000-000000000ab7', 3, '1823', true),
  ('e2000000-0000-4000-b000-000000006b2a', 'e2000000-0000-4000-a000-000000000ab7', 4, '1621', false),
  ('e2000000-0000-4000-b000-000000006b30', 'e2000000-0000-4000-a000-000000000ab8', 0, '1997', false),
  ('e2000000-0000-4000-b000-000000006b31', 'e2000000-0000-4000-a000-000000000ab8', 1, '1615', false),
  ('e2000000-0000-4000-b000-000000006b32', 'e2000000-0000-4000-a000-000000000ab8', 2, '1838', true),
  ('e2000000-0000-4000-b000-000000006b33', 'e2000000-0000-4000-a000-000000000ab8', 3, '2019', false),
  ('e2000000-0000-4000-b000-000000006b34', 'e2000000-0000-4000-a000-000000000ab8', 4, '1641', false),
  ('e2000000-0000-4000-b000-000000006b3a', 'e2000000-0000-4000-a000-000000000ab9', 0, '1838', false),
  ('e2000000-0000-4000-b000-000000006b3b', 'e2000000-0000-4000-a000-000000000ab9', 1, '1997', true),
  ('e2000000-0000-4000-b000-000000006b3c', 'e2000000-0000-4000-a000-000000000ab9', 2, '1612', false),
  ('e2000000-0000-4000-b000-000000006b3d', 'e2000000-0000-4000-a000-000000000ab9', 3, '1823', false),
  ('e2000000-0000-4000-b000-000000006b3e', 'e2000000-0000-4000-a000-000000000ab9', 4, '1684', false),
  ('e2000000-0000-4000-b000-000000006b44', 'e2000000-0000-4000-a000-000000000aba', 0, '2019', true),
  ('e2000000-0000-4000-b000-000000006b45', 'e2000000-0000-4000-a000-000000000aba', 1, '1997', false),
  ('e2000000-0000-4000-b000-000000006b46', 'e2000000-0000-4000-a000-000000000aba', 2, '1684', false),
  ('e2000000-0000-4000-b000-000000006b47', 'e2000000-0000-4000-a000-000000000aba', 3, '1823', false),
  ('e2000000-0000-4000-b000-000000006b48', 'e2000000-0000-4000-a000-000000000aba', 4, '1621', false),
  ('e2000000-0000-4000-b000-000000006b4e', 'e2000000-0000-4000-a000-000000000abb', 0, 'criação do Estado do Maranhão, separado do Estado do Brasil', false),
  ('e2000000-0000-4000-b000-000000006b4f', 'e2000000-0000-4000-a000-000000000abb', 1, 'fundação de São Luís pelos franceses, liderados por Daniel de La Touche', true),
  ('e2000000-0000-4000-b000-000000006b50', 'e2000000-0000-4000-a000-000000000abb', 2, 'Revolta de Beckman, contra o monopólio da Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006b51', 'e2000000-0000-4000-a000-000000000abb', 3, 'ocupação de São Luís pelos holandeses', false),
  ('e2000000-0000-4000-b000-000000006b52', 'e2000000-0000-4000-a000-000000000abb', 4, 'adesão do Maranhão à Independência do Brasil, em 28 de julho', false),
  ('e2000000-0000-4000-b000-000000006b58', 'e2000000-0000-4000-a000-000000000abc', 0, 'reconhecimento do Centro Histórico de São Luís como Patrimônio Mundial pela UNESCO', false),
  ('e2000000-0000-4000-b000-000000006b59', 'e2000000-0000-4000-a000-000000000abc', 1, 'fundação de São Luís pelos franceses, liderados por Daniel de La Touche', false),
  ('e2000000-0000-4000-b000-000000006b5a', 'e2000000-0000-4000-a000-000000000abc', 2, 'início da Balaiada, revolta popular no período regencial', false),
  ('e2000000-0000-4000-b000-000000006b5b', 'e2000000-0000-4000-a000-000000000abc', 3, 'adesão do Maranhão à Independência do Brasil, em 28 de julho', false),
  ('e2000000-0000-4000-b000-000000006b5c', 'e2000000-0000-4000-a000-000000000abc', 4, 'expulsão dos franceses de São Luís pelos portugueses', true),
  ('e2000000-0000-4000-b000-000000006b62', 'e2000000-0000-4000-a000-000000000abd', 0, 'criação do Estado do Maranhão, separado do Estado do Brasil', true),
  ('e2000000-0000-4000-b000-000000006b63', 'e2000000-0000-4000-a000-000000000abd', 1, 'adesão do Maranhão à Independência do Brasil, em 28 de julho', false),
  ('e2000000-0000-4000-b000-000000006b64', 'e2000000-0000-4000-a000-000000000abd', 2, 'Revolta de Beckman, contra o monopólio da Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006b65', 'e2000000-0000-4000-a000-000000000abd', 3, 'fundação de São Luís pelos franceses, liderados por Daniel de La Touche', false),
  ('e2000000-0000-4000-b000-000000006b66', 'e2000000-0000-4000-a000-000000000abd', 4, 'ocupação de São Luís pelos holandeses', false),
  ('e2000000-0000-4000-b000-000000006b6c', 'e2000000-0000-4000-a000-000000000abe', 0, 'início da Balaiada, revolta popular no período regencial', false),
  ('e2000000-0000-4000-b000-000000006b6d', 'e2000000-0000-4000-a000-000000000abe', 1, 'reconhecimento do Centro Histórico de São Luís como Patrimônio Mundial pela UNESCO', false),
  ('e2000000-0000-4000-b000-000000006b6e', 'e2000000-0000-4000-a000-000000000abe', 2, 'adesão do Maranhão à Independência do Brasil, em 28 de julho', false),
  ('e2000000-0000-4000-b000-000000006b6f', 'e2000000-0000-4000-a000-000000000abe', 3, 'reconhecimento do Bumba meu boi do Maranhão como Patrimônio Cultural Imaterial da Humanidade', false),
  ('e2000000-0000-4000-b000-000000006b70', 'e2000000-0000-4000-a000-000000000abe', 4, 'ocupação de São Luís pelos holandeses', true),
  ('e2000000-0000-4000-b000-000000006b76', 'e2000000-0000-4000-a000-000000000abf', 0, 'fundação de São Luís pelos franceses, liderados por Daniel de La Touche', false),
  ('e2000000-0000-4000-b000-000000006b77', 'e2000000-0000-4000-a000-000000000abf', 1, 'início da Balaiada, revolta popular no período regencial', false),
  ('e2000000-0000-4000-b000-000000006b78', 'e2000000-0000-4000-a000-000000000abf', 2, 'reconhecimento do Bumba meu boi do Maranhão como Patrimônio Cultural Imaterial da Humanidade', false),
  ('e2000000-0000-4000-b000-000000006b79', 'e2000000-0000-4000-a000-000000000abf', 3, 'expulsão dos franceses de São Luís pelos portugueses', false),
  ('e2000000-0000-4000-b000-000000006b7a', 'e2000000-0000-4000-a000-000000000abf', 4, 'Revolta de Beckman, contra o monopólio da Companhia de Comércio do Estado do Maranhão', true),
  ('e2000000-0000-4000-b000-000000006b80', 'e2000000-0000-4000-a000-000000000ac0', 0, 'reconhecimento do Bumba meu boi do Maranhão como Patrimônio Cultural Imaterial da Humanidade', false),
  ('e2000000-0000-4000-b000-000000006b81', 'e2000000-0000-4000-a000-000000000ac0', 1, 'adesão do Maranhão à Independência do Brasil, em 28 de julho', true),
  ('e2000000-0000-4000-b000-000000006b82', 'e2000000-0000-4000-a000-000000000ac0', 2, 'início da Balaiada, revolta popular no período regencial', false),
  ('e2000000-0000-4000-b000-000000006b83', 'e2000000-0000-4000-a000-000000000ac0', 3, 'ocupação de São Luís pelos holandeses', false),
  ('e2000000-0000-4000-b000-000000006b84', 'e2000000-0000-4000-a000-000000000ac0', 4, 'expulsão dos franceses de São Luís pelos portugueses', false),
  ('e2000000-0000-4000-b000-000000006b8a', 'e2000000-0000-4000-a000-000000000ac1', 0, 'início da Balaiada, revolta popular no período regencial', true),
  ('e2000000-0000-4000-b000-000000006b8b', 'e2000000-0000-4000-a000-000000000ac1', 1, 'reconhecimento do Centro Histórico de São Luís como Patrimônio Mundial pela UNESCO', false),
  ('e2000000-0000-4000-b000-000000006b8c', 'e2000000-0000-4000-a000-000000000ac1', 2, 'fundação de São Luís pelos franceses, liderados por Daniel de La Touche', false),
  ('e2000000-0000-4000-b000-000000006b8d', 'e2000000-0000-4000-a000-000000000ac1', 3, 'ocupação de São Luís pelos holandeses', false),
  ('e2000000-0000-4000-b000-000000006b8e', 'e2000000-0000-4000-a000-000000000ac1', 4, 'Revolta de Beckman, contra o monopólio da Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006b94', 'e2000000-0000-4000-a000-000000000ac2', 0, 'adesão do Maranhão à Independência do Brasil, em 28 de julho', false),
  ('e2000000-0000-4000-b000-000000006b95', 'e2000000-0000-4000-a000-000000000ac2', 1, 'fundação de São Luís pelos franceses, liderados por Daniel de La Touche', false),
  ('e2000000-0000-4000-b000-000000006b96', 'e2000000-0000-4000-a000-000000000ac2', 2, 'criação do Estado do Maranhão, separado do Estado do Brasil', false),
  ('e2000000-0000-4000-b000-000000006b97', 'e2000000-0000-4000-a000-000000000ac2', 3, 'expulsão dos franceses de São Luís pelos portugueses', false),
  ('e2000000-0000-4000-b000-000000006b98', 'e2000000-0000-4000-a000-000000000ac2', 4, 'reconhecimento do Centro Histórico de São Luís como Patrimônio Mundial pela UNESCO', true),
  ('e2000000-0000-4000-b000-000000006b9e', 'e2000000-0000-4000-a000-000000000ac3', 0, 'reconhecimento do Bumba meu boi do Maranhão como Patrimônio Cultural Imaterial da Humanidade', true),
  ('e2000000-0000-4000-b000-000000006b9f', 'e2000000-0000-4000-a000-000000000ac3', 1, 'início da Balaiada, revolta popular no período regencial', false),
  ('e2000000-0000-4000-b000-000000006ba0', 'e2000000-0000-4000-a000-000000000ac3', 2, 'expulsão dos franceses de São Luís pelos portugueses', false),
  ('e2000000-0000-4000-b000-000000006ba1', 'e2000000-0000-4000-a000-000000000ac3', 3, 'reconhecimento do Centro Histórico de São Luís como Patrimônio Mundial pela UNESCO', false),
  ('e2000000-0000-4000-b000-000000006ba2', 'e2000000-0000-4000-a000-000000000ac3', 4, 'Revolta de Beckman, contra o monopólio da Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006ba8', 'e2000000-0000-4000-a000-000000000ac4', 0, 'França Equinocial', false),
  ('e2000000-0000-4000-b000-000000006ba9', 'e2000000-0000-4000-a000-000000000ac4', 1, 'Revolta de Beckman', false),
  ('e2000000-0000-4000-b000-000000006baa', 'e2000000-0000-4000-a000-000000000ac4', 2, 'Invasão holandesa', false),
  ('e2000000-0000-4000-b000-000000006bab', 'e2000000-0000-4000-a000-000000000ac4', 3, 'Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006bac', 'e2000000-0000-4000-a000-000000000ac4', 4, 'Balaiada', true),
  ('e2000000-0000-4000-b000-000000006bb2', 'e2000000-0000-4000-a000-000000000ac5', 0, 'Invasão holandesa', false),
  ('e2000000-0000-4000-b000-000000006bb3', 'e2000000-0000-4000-a000-000000000ac5', 1, 'Revolta de Beckman', true),
  ('e2000000-0000-4000-b000-000000006bb4', 'e2000000-0000-4000-a000-000000000ac5', 2, 'França Equinocial', false),
  ('e2000000-0000-4000-b000-000000006bb5', 'e2000000-0000-4000-a000-000000000ac5', 3, 'Adesão à Independência', false),
  ('e2000000-0000-4000-b000-000000006bb6', 'e2000000-0000-4000-a000-000000000ac5', 4, 'Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006bbc', 'e2000000-0000-4000-a000-000000000ac6', 0, 'Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006bbd', 'e2000000-0000-4000-a000-000000000ac6', 1, 'França Equinocial', true),
  ('e2000000-0000-4000-b000-000000006bbe', 'e2000000-0000-4000-a000-000000000ac6', 2, 'Invasão holandesa', false),
  ('e2000000-0000-4000-b000-000000006bbf', 'e2000000-0000-4000-a000-000000000ac6', 3, 'Balaiada', false),
  ('e2000000-0000-4000-b000-000000006bc0', 'e2000000-0000-4000-a000-000000000ac6', 4, 'Revolta de Beckman', false),
  ('e2000000-0000-4000-b000-000000006bc6', 'e2000000-0000-4000-a000-000000000ac7', 0, 'Balaiada', false),
  ('e2000000-0000-4000-b000-000000006bc7', 'e2000000-0000-4000-a000-000000000ac7', 1, 'Adesão à Independência', true),
  ('e2000000-0000-4000-b000-000000006bc8', 'e2000000-0000-4000-a000-000000000ac7', 2, 'Revolta de Beckman', false),
  ('e2000000-0000-4000-b000-000000006bc9', 'e2000000-0000-4000-a000-000000000ac7', 3, 'Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006bca', 'e2000000-0000-4000-a000-000000000ac7', 4, 'França Equinocial', false),
  ('e2000000-0000-4000-b000-000000006bd0', 'e2000000-0000-4000-a000-000000000ac8', 0, 'Invasão holandesa', false),
  ('e2000000-0000-4000-b000-000000006bd1', 'e2000000-0000-4000-a000-000000000ac8', 1, 'Companhia de Comércio do Estado do Maranhão', true),
  ('e2000000-0000-4000-b000-000000006bd2', 'e2000000-0000-4000-a000-000000000ac8', 2, 'França Equinocial', false),
  ('e2000000-0000-4000-b000-000000006bd3', 'e2000000-0000-4000-a000-000000000ac8', 3, 'Adesão à Independência', false),
  ('e2000000-0000-4000-b000-000000006bd4', 'e2000000-0000-4000-a000-000000000ac8', 4, 'Balaiada', false),
  ('e2000000-0000-4000-b000-000000006bda', 'e2000000-0000-4000-a000-000000000ac9', 0, 'Balaiada', false),
  ('e2000000-0000-4000-b000-000000006bdb', 'e2000000-0000-4000-a000-000000000ac9', 1, 'Revolta de Beckman', false),
  ('e2000000-0000-4000-b000-000000006bdc', 'e2000000-0000-4000-a000-000000000ac9', 2, 'Invasão holandesa', true),
  ('e2000000-0000-4000-b000-000000006bdd', 'e2000000-0000-4000-a000-000000000ac9', 3, 'Companhia de Comércio do Estado do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006bde', 'e2000000-0000-4000-a000-000000000ac9', 4, 'Adesão à Independência', false),
  ('e2000000-0000-4000-b000-000000006be4', 'e2000000-0000-4000-a000-000000000aca', 0, 'movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman', false),
  ('e2000000-0000-4000-b000-000000006be5', 'e2000000-0000-4000-a000-000000000aca', 1, 'revolta popular de 1838 a 1841, com vaqueiros, escravizados e sertanejos pobres, reprimida pelas tropas de Luís Alves de Lima e Silva', true),
  ('e2000000-0000-4000-b000-000000006be6', 'e2000000-0000-4000-a000-000000000aca', 2, 'fato de 28 de julho de 1823, quando o Maranhão passou a integrar o Brasil independente', false),
  ('e2000000-0000-4000-b000-000000006be7', 'e2000000-0000-4000-a000-000000000aca', 3, 'empresa que detinha o monopólio do comércio na região e provocou revolta em 1684', false),
  ('e2000000-0000-4000-b000-000000006be8', 'e2000000-0000-4000-a000-000000000aca', 4, 'projeto colonial francês que deu origem à cidade de São Luís em 1612', false),
  ('e2000000-0000-4000-b000-000000006bee', 'e2000000-0000-4000-a000-000000000acb', 0, 'projeto colonial francês que deu origem à cidade de São Luís em 1612', false),
  ('e2000000-0000-4000-b000-000000006bef', 'e2000000-0000-4000-a000-000000000acb', 1, 'revolta popular de 1838 a 1841, com vaqueiros, escravizados e sertanejos pobres, reprimida pelas tropas de Luís Alves de Lima e Silva', false),
  ('e2000000-0000-4000-b000-000000006bf0', 'e2000000-0000-4000-a000-000000000acb', 2, 'movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman', true),
  ('e2000000-0000-4000-b000-000000006bf1', 'e2000000-0000-4000-a000-000000000acb', 3, 'fato de 28 de julho de 1823, quando o Maranhão passou a integrar o Brasil independente', false),
  ('e2000000-0000-4000-b000-000000006bf2', 'e2000000-0000-4000-a000-000000000acb', 4, 'ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses', false),
  ('e2000000-0000-4000-b000-000000006bf8', 'e2000000-0000-4000-a000-000000000acc', 0, 'empresa que detinha o monopólio do comércio na região e provocou revolta em 1684', false),
  ('e2000000-0000-4000-b000-000000006bf9', 'e2000000-0000-4000-a000-000000000acc', 1, 'movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman', false),
  ('e2000000-0000-4000-b000-000000006bfa', 'e2000000-0000-4000-a000-000000000acc', 2, 'fato de 28 de julho de 1823, quando o Maranhão passou a integrar o Brasil independente', false),
  ('e2000000-0000-4000-b000-000000006bfb', 'e2000000-0000-4000-a000-000000000acc', 3, 'ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses', false),
  ('e2000000-0000-4000-b000-000000006bfc', 'e2000000-0000-4000-a000-000000000acc', 4, 'projeto colonial francês que deu origem à cidade de São Luís em 1612', true),
  ('e2000000-0000-4000-b000-000000006c02', 'e2000000-0000-4000-a000-000000000acd', 0, 'ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses', false),
  ('e2000000-0000-4000-b000-000000006c03', 'e2000000-0000-4000-a000-000000000acd', 1, 'fato de 28 de julho de 1823, quando o Maranhão passou a integrar o Brasil independente', true),
  ('e2000000-0000-4000-b000-000000006c04', 'e2000000-0000-4000-a000-000000000acd', 2, 'movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman', false),
  ('e2000000-0000-4000-b000-000000006c05', 'e2000000-0000-4000-a000-000000000acd', 3, 'empresa que detinha o monopólio do comércio na região e provocou revolta em 1684', false),
  ('e2000000-0000-4000-b000-000000006c06', 'e2000000-0000-4000-a000-000000000acd', 4, 'projeto colonial francês que deu origem à cidade de São Luís em 1612', false),
  ('e2000000-0000-4000-b000-000000006c0c', 'e2000000-0000-4000-a000-000000000ace', 0, 'projeto colonial francês que deu origem à cidade de São Luís em 1612', false),
  ('e2000000-0000-4000-b000-000000006c0d', 'e2000000-0000-4000-a000-000000000ace', 1, 'revolta popular de 1838 a 1841, com vaqueiros, escravizados e sertanejos pobres, reprimida pelas tropas de Luís Alves de Lima e Silva', false),
  ('e2000000-0000-4000-b000-000000006c0e', 'e2000000-0000-4000-a000-000000000ace', 2, 'empresa que detinha o monopólio do comércio na região e provocou revolta em 1684', true),
  ('e2000000-0000-4000-b000-000000006c0f', 'e2000000-0000-4000-a000-000000000ace', 3, 'ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses', false),
  ('e2000000-0000-4000-b000-000000006c10', 'e2000000-0000-4000-a000-000000000ace', 4, 'movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman', false),
  ('e2000000-0000-4000-b000-000000006c16', 'e2000000-0000-4000-a000-000000000acf', 0, 'projeto colonial francês que deu origem à cidade de São Luís em 1612', false),
  ('e2000000-0000-4000-b000-000000006c17', 'e2000000-0000-4000-a000-000000000acf', 1, 'movimento de 1684 contra o monopólio da Companhia de Comércio do Estado do Maranhão, liderado por Manuel Beckman', false),
  ('e2000000-0000-4000-b000-000000006c18', 'e2000000-0000-4000-a000-000000000acf', 2, 'ocupação de São Luís entre 1641 e 1644, encerrada com a expulsão dos holandeses', true),
  ('e2000000-0000-4000-b000-000000006c19', 'e2000000-0000-4000-a000-000000000acf', 3, 'revolta popular de 1838 a 1841, com vaqueiros, escravizados e sertanejos pobres, reprimida pelas tropas de Luís Alves de Lima e Silva', false),
  ('e2000000-0000-4000-b000-000000006c1a', 'e2000000-0000-4000-a000-000000000acf', 4, 'empresa que detinha o monopólio do comércio na região e provocou revolta em 1684', false),
  ('e2000000-0000-4000-b000-000000006c20', 'e2000000-0000-4000-a000-000000000ad0', 0, 'Rio Mearim', false),
  ('e2000000-0000-4000-b000-000000006c21', 'e2000000-0000-4000-a000-000000000ad0', 1, 'Golfão Maranhense', false),
  ('e2000000-0000-4000-b000-000000006c22', 'e2000000-0000-4000-a000-000000000ad0', 2, 'Rio Parnaíba', true),
  ('e2000000-0000-4000-b000-000000006c23', 'e2000000-0000-4000-a000-000000000ad0', 3, 'Rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006c24', 'e2000000-0000-4000-a000-000000000ad0', 4, 'Rio Itapecuru', false),
  ('e2000000-0000-4000-b000-000000006c2a', 'e2000000-0000-4000-a000-000000000ad1', 0, 'Rio Mearim', false),
  ('e2000000-0000-4000-b000-000000006c2b', 'e2000000-0000-4000-a000-000000000ad1', 1, 'Rio Itapecuru', false),
  ('e2000000-0000-4000-b000-000000006c2c', 'e2000000-0000-4000-a000-000000000ad1', 2, 'Chapada das Mesas', false),
  ('e2000000-0000-4000-b000-000000006c2d', 'e2000000-0000-4000-a000-000000000ad1', 3, 'Golfão Maranhense', false),
  ('e2000000-0000-4000-b000-000000006c2e', 'e2000000-0000-4000-a000-000000000ad1', 4, 'Rio Gurupi', true),
  ('e2000000-0000-4000-b000-000000006c34', 'e2000000-0000-4000-a000-000000000ad2', 0, 'Rio Itapecuru', false),
  ('e2000000-0000-4000-b000-000000006c35', 'e2000000-0000-4000-a000-000000000ad2', 1, 'Lençóis Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006c36', 'e2000000-0000-4000-a000-000000000ad2', 2, 'Rio Parnaíba', false),
  ('e2000000-0000-4000-b000-000000006c37', 'e2000000-0000-4000-a000-000000000ad2', 3, 'Golfão Maranhense', false),
  ('e2000000-0000-4000-b000-000000006c38', 'e2000000-0000-4000-a000-000000000ad2', 4, 'Rio Tocantins', true),
  ('e2000000-0000-4000-b000-000000006c3e', 'e2000000-0000-4000-a000-000000000ad3', 0, 'Rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006c3f', 'e2000000-0000-4000-a000-000000000ad3', 1, 'Lençóis Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006c40', 'e2000000-0000-4000-a000-000000000ad3', 2, 'Rio Itapecuru', true),
  ('e2000000-0000-4000-b000-000000006c41', 'e2000000-0000-4000-a000-000000000ad3', 3, 'Golfão Maranhense', false),
  ('e2000000-0000-4000-b000-000000006c42', 'e2000000-0000-4000-a000-000000000ad3', 4, 'Rio Gurupi', false),
  ('e2000000-0000-4000-b000-000000006c48', 'e2000000-0000-4000-a000-000000000ad4', 0, 'Rio Mearim', true),
  ('e2000000-0000-4000-b000-000000006c49', 'e2000000-0000-4000-a000-000000000ad4', 1, 'Ilha de Upaon-Açu', false),
  ('e2000000-0000-4000-b000-000000006c4a', 'e2000000-0000-4000-a000-000000000ad4', 2, 'Chapada das Mesas', false),
  ('e2000000-0000-4000-b000-000000006c4b', 'e2000000-0000-4000-a000-000000000ad4', 3, 'Lençóis Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006c4c', 'e2000000-0000-4000-a000-000000000ad4', 4, 'Rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006c52', 'e2000000-0000-4000-a000-000000000ad5', 0, 'Rio Gurupi', false),
  ('e2000000-0000-4000-b000-000000006c53', 'e2000000-0000-4000-a000-000000000ad5', 1, 'Rio Mearim', false),
  ('e2000000-0000-4000-b000-000000006c54', 'e2000000-0000-4000-a000-000000000ad5', 2, 'Lençóis Maranhenses', true),
  ('e2000000-0000-4000-b000-000000006c55', 'e2000000-0000-4000-a000-000000000ad5', 3, 'Chapada das Mesas', false),
  ('e2000000-0000-4000-b000-000000006c56', 'e2000000-0000-4000-a000-000000000ad5', 4, 'Rio Parnaíba', false),
  ('e2000000-0000-4000-b000-000000006c5c', 'e2000000-0000-4000-a000-000000000ad6', 0, 'Ilha de Upaon-Açu', false),
  ('e2000000-0000-4000-b000-000000006c5d', 'e2000000-0000-4000-a000-000000000ad6', 1, 'Golfão Maranhense', true),
  ('e2000000-0000-4000-b000-000000006c5e', 'e2000000-0000-4000-a000-000000000ad6', 2, 'Rio Mearim', false),
  ('e2000000-0000-4000-b000-000000006c5f', 'e2000000-0000-4000-a000-000000000ad6', 3, 'Rio Gurupi', false),
  ('e2000000-0000-4000-b000-000000006c60', 'e2000000-0000-4000-a000-000000000ad6', 4, 'Chapada das Mesas', false),
  ('e2000000-0000-4000-b000-000000006c66', 'e2000000-0000-4000-a000-000000000ad7', 0, 'Rio Gurupi', false),
  ('e2000000-0000-4000-b000-000000006c67', 'e2000000-0000-4000-a000-000000000ad7', 1, 'Golfão Maranhense', false),
  ('e2000000-0000-4000-b000-000000006c68', 'e2000000-0000-4000-a000-000000000ad7', 2, 'Ilha de Upaon-Açu', true),
  ('e2000000-0000-4000-b000-000000006c69', 'e2000000-0000-4000-a000-000000000ad7', 3, 'Rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006c6a', 'e2000000-0000-4000-a000-000000000ad7', 4, 'Reentrâncias Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006c70', 'e2000000-0000-4000-a000-000000000ad8', 0, 'Rio Itapecuru', false),
  ('e2000000-0000-4000-b000-000000006c71', 'e2000000-0000-4000-a000-000000000ad8', 1, 'Rio Gurupi', false),
  ('e2000000-0000-4000-b000-000000006c72', 'e2000000-0000-4000-a000-000000000ad8', 2, 'Reentrâncias Maranhenses', true),
  ('e2000000-0000-4000-b000-000000006c73', 'e2000000-0000-4000-a000-000000000ad8', 3, 'Rio Parnaíba', false),
  ('e2000000-0000-4000-b000-000000006c74', 'e2000000-0000-4000-a000-000000000ad8', 4, 'Lençóis Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006c7a', 'e2000000-0000-4000-a000-000000000ad9', 0, 'Lençóis Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006c7b', 'e2000000-0000-4000-a000-000000000ad9', 1, 'Reentrâncias Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006c7c', 'e2000000-0000-4000-a000-000000000ad9', 2, 'Chapada das Mesas', true),
  ('e2000000-0000-4000-b000-000000006c7d', 'e2000000-0000-4000-a000-000000000ad9', 3, 'Rio Mearim', false),
  ('e2000000-0000-4000-b000-000000006c7e', 'e2000000-0000-4000-a000-000000000ad9', 4, 'Rio Itapecuru', false),
  ('e2000000-0000-4000-b000-000000006c84', 'e2000000-0000-4000-a000-000000000ada', 0, 'rio que nasce no sul do estado, atravessa cidades como Caxias e Codó e deságua na baía de São José', false),
  ('e2000000-0000-4000-b000-000000006c85', 'e2000000-0000-4000-a000-000000000ada', 1, 'parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006c86', 'e2000000-0000-4000-a000-000000000ada', 2, 'rio que marca a divisa entre o Maranhão e o Piauí', true),
  ('e2000000-0000-4000-b000-000000006c87', 'e2000000-0000-4000-a000-000000000ada', 3, 'rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz', false),
  ('e2000000-0000-4000-b000-000000006c88', 'e2000000-0000-4000-a000-000000000ada', 4, 'ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa', false),
  ('e2000000-0000-4000-b000-000000006c8e', 'e2000000-0000-4000-a000-000000000adb', 0, 'grande reentrância do litoral formada pelas baías de São Marcos e de São José', false),
  ('e2000000-0000-4000-b000-000000006c8f', 'e2000000-0000-4000-a000-000000000adb', 1, 'litoral recortado do noroeste do estado, com extensos manguezais', false),
  ('e2000000-0000-4000-b000-000000006c90', 'e2000000-0000-4000-a000-000000000adb', 2, 'ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa', false),
  ('e2000000-0000-4000-b000-000000006c91', 'e2000000-0000-4000-a000-000000000adb', 3, 'rio que marca boa parte da divisa entre o Maranhão e o Pará', true),
  ('e2000000-0000-4000-b000-000000006c92', 'e2000000-0000-4000-a000-000000000adb', 4, 'rio que marca a divisa entre o Maranhão e o Piauí', false),
  ('e2000000-0000-4000-b000-000000006c98', 'e2000000-0000-4000-a000-000000000adc', 0, 'ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa', false),
  ('e2000000-0000-4000-b000-000000006c99', 'e2000000-0000-4000-a000-000000000adc', 1, 'grande reentrância do litoral formada pelas baías de São Marcos e de São José', false),
  ('e2000000-0000-4000-b000-000000006c9a', 'e2000000-0000-4000-a000-000000000adc', 2, 'rio que marca boa parte da divisa entre o Maranhão e o Pará', false),
  ('e2000000-0000-4000-b000-000000006c9b', 'e2000000-0000-4000-a000-000000000adc', 3, 'rio que marca a divisa entre o Maranhão e o Piauí', false),
  ('e2000000-0000-4000-b000-000000006c9c', 'e2000000-0000-4000-a000-000000000adc', 4, 'rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz', true),
  ('e2000000-0000-4000-b000-000000006ca2', 'e2000000-0000-4000-a000-000000000add', 0, 'rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos', false),
  ('e2000000-0000-4000-b000-000000006ca3', 'e2000000-0000-4000-a000-000000000add', 1, 'rio que nasce no sul do estado, atravessa cidades como Caxias e Codó e deságua na baía de São José', true),
  ('e2000000-0000-4000-b000-000000006ca4', 'e2000000-0000-4000-a000-000000000add', 2, 'rio que marca a divisa entre o Maranhão e o Piauí', false),
  ('e2000000-0000-4000-b000-000000006ca5', 'e2000000-0000-4000-a000-000000000add', 3, 'rio que marca boa parte da divisa entre o Maranhão e o Pará', false),
  ('e2000000-0000-4000-b000-000000006ca6', 'e2000000-0000-4000-a000-000000000add', 4, 'parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006cac', 'e2000000-0000-4000-a000-000000000ade', 0, 'rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos', true),
  ('e2000000-0000-4000-b000-000000006cad', 'e2000000-0000-4000-a000-000000000ade', 1, 'rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz', false),
  ('e2000000-0000-4000-b000-000000006cae', 'e2000000-0000-4000-a000-000000000ade', 2, 'parque nacional no sul do estado, perto de Carolina, conhecido por cachoeiras e morros tabulares', false),
  ('e2000000-0000-4000-b000-000000006caf', 'e2000000-0000-4000-a000-000000000ade', 3, 'rio que marca boa parte da divisa entre o Maranhão e o Pará', false),
  ('e2000000-0000-4000-b000-000000006cb0', 'e2000000-0000-4000-a000-000000000ade', 4, 'litoral recortado do noroeste do estado, com extensos manguezais', false),
  ('e2000000-0000-4000-b000-000000006cb6', 'e2000000-0000-4000-a000-000000000adf', 0, 'grande reentrância do litoral formada pelas baías de São Marcos e de São José', false),
  ('e2000000-0000-4000-b000-000000006cb7', 'e2000000-0000-4000-a000-000000000adf', 1, 'parque nacional no sul do estado, perto de Carolina, conhecido por cachoeiras e morros tabulares', false),
  ('e2000000-0000-4000-b000-000000006cb8', 'e2000000-0000-4000-a000-000000000adf', 2, 'parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas', true),
  ('e2000000-0000-4000-b000-000000006cb9', 'e2000000-0000-4000-a000-000000000adf', 3, 'rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz', false),
  ('e2000000-0000-4000-b000-000000006cba', 'e2000000-0000-4000-a000-000000000adf', 4, 'rio que nasce no sul do estado, atravessa cidades como Caxias e Codó e deságua na baía de São José', false),
  ('e2000000-0000-4000-b000-000000006cc0', 'e2000000-0000-4000-a000-000000000ae0', 0, 'rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos', false),
  ('e2000000-0000-4000-b000-000000006cc1', 'e2000000-0000-4000-a000-000000000ae0', 1, 'grande reentrância do litoral formada pelas baías de São Marcos e de São José', true),
  ('e2000000-0000-4000-b000-000000006cc2', 'e2000000-0000-4000-a000-000000000ae0', 2, 'rio que marca a divisa entre o Maranhão e o Piauí', false),
  ('e2000000-0000-4000-b000-000000006cc3', 'e2000000-0000-4000-a000-000000000ae0', 3, 'rio que marca boa parte da divisa entre o Maranhão e o Pará', false),
  ('e2000000-0000-4000-b000-000000006cc4', 'e2000000-0000-4000-a000-000000000ae0', 4, 'parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006cca', 'e2000000-0000-4000-a000-000000000ae1', 0, 'grande reentrância do litoral formada pelas baías de São Marcos e de São José', false),
  ('e2000000-0000-4000-b000-000000006ccb', 'e2000000-0000-4000-a000-000000000ae1', 1, 'rio que marca trecho da divisa entre o Maranhão e o estado do Tocantins, passando por Imperatriz', false),
  ('e2000000-0000-4000-b000-000000006ccc', 'e2000000-0000-4000-a000-000000000ae1', 2, 'ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa', true),
  ('e2000000-0000-4000-b000-000000006ccd', 'e2000000-0000-4000-a000-000000000ae1', 3, 'litoral recortado do noroeste do estado, com extensos manguezais', false),
  ('e2000000-0000-4000-b000-000000006cce', 'e2000000-0000-4000-a000-000000000ae1', 4, 'parque nacional no sul do estado, perto de Carolina, conhecido por cachoeiras e morros tabulares', false),
  ('e2000000-0000-4000-b000-000000006cd4', 'e2000000-0000-4000-a000-000000000ae2', 0, 'rio que marca boa parte da divisa entre o Maranhão e o Pará', false),
  ('e2000000-0000-4000-b000-000000006cd5', 'e2000000-0000-4000-a000-000000000ae2', 1, 'rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos', false),
  ('e2000000-0000-4000-b000-000000006cd6', 'e2000000-0000-4000-a000-000000000ae2', 2, 'rio que marca a divisa entre o Maranhão e o Piauí', false),
  ('e2000000-0000-4000-b000-000000006cd7', 'e2000000-0000-4000-a000-000000000ae2', 3, 'ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa', false),
  ('e2000000-0000-4000-b000-000000006cd8', 'e2000000-0000-4000-a000-000000000ae2', 4, 'litoral recortado do noroeste do estado, com extensos manguezais', true),
  ('e2000000-0000-4000-b000-000000006cde', 'e2000000-0000-4000-a000-000000000ae3', 0, 'parque nacional de dunas e lagoas de água da chuva, com acesso principal por Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006cdf', 'e2000000-0000-4000-a000-000000000ae3', 1, 'ilha onde ficam São Luís, São José de Ribamar, Paço do Lumiar e Raposa', false),
  ('e2000000-0000-4000-b000-000000006ce0', 'e2000000-0000-4000-a000-000000000ae3', 2, 'rio de grande extensão que passa por Bacabal e Pedreiras e deságua na baía de São Marcos', false),
  ('e2000000-0000-4000-b000-000000006ce1', 'e2000000-0000-4000-a000-000000000ae3', 3, 'grande reentrância do litoral formada pelas baías de São Marcos e de São José', false),
  ('e2000000-0000-4000-b000-000000006ce2', 'e2000000-0000-4000-a000-000000000ae3', 4, 'parque nacional no sul do estado, perto de Carolina, conhecido por cachoeiras e morros tabulares', true),
  ('e2000000-0000-4000-b000-000000006ce8', 'e2000000-0000-4000-a000-000000000ae4', 0, 'Amazônia', true),
  ('e2000000-0000-4000-b000-000000006ce9', 'e2000000-0000-4000-a000-000000000ae4', 1, 'Cerrado', false),
  ('e2000000-0000-4000-b000-000000006cea', 'e2000000-0000-4000-a000-000000000ae4', 2, 'Mata dos Cocais', false),
  ('e2000000-0000-4000-b000-000000006ceb', 'e2000000-0000-4000-a000-000000000ae4', 3, 'Caatinga', false),
  ('e2000000-0000-4000-b000-000000006cec', 'e2000000-0000-4000-a000-000000000ae4', 4, 'Manguezal', false),
  ('e2000000-0000-4000-b000-000000006cf2', 'e2000000-0000-4000-a000-000000000ae5', 0, 'Amazônia', false),
  ('e2000000-0000-4000-b000-000000006cf3', 'e2000000-0000-4000-a000-000000000ae5', 1, 'Cerrado', true),
  ('e2000000-0000-4000-b000-000000006cf4', 'e2000000-0000-4000-a000-000000000ae5', 2, 'Manguezal', false),
  ('e2000000-0000-4000-b000-000000006cf5', 'e2000000-0000-4000-a000-000000000ae5', 3, 'Caatinga', false),
  ('e2000000-0000-4000-b000-000000006cf6', 'e2000000-0000-4000-a000-000000000ae5', 4, 'Mata dos Cocais', false),
  ('e2000000-0000-4000-b000-000000006cfc', 'e2000000-0000-4000-a000-000000000ae6', 0, 'Amazônia', false),
  ('e2000000-0000-4000-b000-000000006cfd', 'e2000000-0000-4000-a000-000000000ae6', 1, 'Mata dos Cocais', false),
  ('e2000000-0000-4000-b000-000000006cfe', 'e2000000-0000-4000-a000-000000000ae6', 2, 'Manguezal', false),
  ('e2000000-0000-4000-b000-000000006cff', 'e2000000-0000-4000-a000-000000000ae6', 3, 'Caatinga', true),
  ('e2000000-0000-4000-b000-000000006d00', 'e2000000-0000-4000-a000-000000000ae6', 4, 'Cerrado', false),
  ('e2000000-0000-4000-b000-000000006d06', 'e2000000-0000-4000-a000-000000000ae7', 0, 'Caatinga', false),
  ('e2000000-0000-4000-b000-000000006d07', 'e2000000-0000-4000-a000-000000000ae7', 1, 'Cerrado', false),
  ('e2000000-0000-4000-b000-000000006d08', 'e2000000-0000-4000-a000-000000000ae7', 2, 'Mata dos Cocais', false),
  ('e2000000-0000-4000-b000-000000006d09', 'e2000000-0000-4000-a000-000000000ae7', 3, 'Amazônia', false),
  ('e2000000-0000-4000-b000-000000006d0a', 'e2000000-0000-4000-a000-000000000ae7', 4, 'Manguezal', true),
  ('e2000000-0000-4000-b000-000000006d10', 'e2000000-0000-4000-a000-000000000ae8', 0, 'Manguezal', false),
  ('e2000000-0000-4000-b000-000000006d11', 'e2000000-0000-4000-a000-000000000ae8', 1, 'Caatinga', false),
  ('e2000000-0000-4000-b000-000000006d12', 'e2000000-0000-4000-a000-000000000ae8', 2, 'Cerrado', false),
  ('e2000000-0000-4000-b000-000000006d13', 'e2000000-0000-4000-a000-000000000ae8', 3, 'Amazônia', false),
  ('e2000000-0000-4000-b000-000000006d14', 'e2000000-0000-4000-a000-000000000ae8', 4, 'Mata dos Cocais', true),
  ('e2000000-0000-4000-b000-000000006d1a', 'e2000000-0000-4000-a000-000000000ae9', 0, 'bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará', true),
  ('e2000000-0000-4000-b000-000000006d1b', 'e2000000-0000-4000-a000-000000000ae9', 1, 'ecossistema do litoral maranhense, importante berçário de peixes e crustáceos', false),
  ('e2000000-0000-4000-b000-000000006d1c', 'e2000000-0000-4000-a000-000000000ae9', 2, 'bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja', false),
  ('e2000000-0000-4000-b000-000000006d1d', 'e2000000-0000-4000-a000-000000000ae9', 3, 'formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba', false),
  ('e2000000-0000-4000-b000-000000006d1e', 'e2000000-0000-4000-a000-000000000ae9', 4, 'bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí', false),
  ('e2000000-0000-4000-b000-000000006d24', 'e2000000-0000-4000-a000-000000000aea', 0, 'bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí', false),
  ('e2000000-0000-4000-b000-000000006d25', 'e2000000-0000-4000-a000-000000000aea', 1, 'bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja', true),
  ('e2000000-0000-4000-b000-000000006d26', 'e2000000-0000-4000-a000-000000000aea', 2, 'bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará', false),
  ('e2000000-0000-4000-b000-000000006d27', 'e2000000-0000-4000-a000-000000000aea', 3, 'formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba', false),
  ('e2000000-0000-4000-b000-000000006d28', 'e2000000-0000-4000-a000-000000000aea', 4, 'ecossistema do litoral maranhense, importante berçário de peixes e crustáceos', false),
  ('e2000000-0000-4000-b000-000000006d2e', 'e2000000-0000-4000-a000-000000000aeb', 0, 'bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí', true),
  ('e2000000-0000-4000-b000-000000006d2f', 'e2000000-0000-4000-a000-000000000aeb', 1, 'ecossistema do litoral maranhense, importante berçário de peixes e crustáceos', false),
  ('e2000000-0000-4000-b000-000000006d30', 'e2000000-0000-4000-a000-000000000aeb', 2, 'bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja', false),
  ('e2000000-0000-4000-b000-000000006d31', 'e2000000-0000-4000-a000-000000000aeb', 3, 'bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará', false),
  ('e2000000-0000-4000-b000-000000006d32', 'e2000000-0000-4000-a000-000000000aeb', 4, 'formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba', false),
  ('e2000000-0000-4000-b000-000000006d38', 'e2000000-0000-4000-a000-000000000aec', 0, 'bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí', false),
  ('e2000000-0000-4000-b000-000000006d39', 'e2000000-0000-4000-a000-000000000aec', 1, 'bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará', false),
  ('e2000000-0000-4000-b000-000000006d3a', 'e2000000-0000-4000-a000-000000000aec', 2, 'bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja', false),
  ('e2000000-0000-4000-b000-000000006d3b', 'e2000000-0000-4000-a000-000000000aec', 3, 'ecossistema do litoral maranhense, importante berçário de peixes e crustáceos', true),
  ('e2000000-0000-4000-b000-000000006d3c', 'e2000000-0000-4000-a000-000000000aec', 4, 'formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba', false),
  ('e2000000-0000-4000-b000-000000006d42', 'e2000000-0000-4000-a000-000000000aed', 0, 'formação de transição entre Amazônia, Cerrado e Caatinga, dominada por palmeiras como babaçu e carnaúba', true),
  ('e2000000-0000-4000-b000-000000006d43', 'e2000000-0000-4000-a000-000000000aed', 1, 'bioma de menor área no estado, no extremo leste, perto da divisa com o Piauí', false),
  ('e2000000-0000-4000-b000-000000006d44', 'e2000000-0000-4000-a000-000000000aed', 2, 'bioma predominante no centro e no sul do Maranhão, onde avança a produção de soja', false),
  ('e2000000-0000-4000-b000-000000006d45', 'e2000000-0000-4000-a000-000000000aed', 3, 'bioma presente no oeste e noroeste do Maranhão, perto da divisa com o Pará', false),
  ('e2000000-0000-4000-b000-000000006d46', 'e2000000-0000-4000-a000-000000000aed', 4, 'ecossistema do litoral maranhense, importante berçário de peixes e crustáceos', false),
  ('e2000000-0000-4000-b000-000000006d4c', 'e2000000-0000-4000-a000-000000000aee', 0, 'Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006d4d', 'e2000000-0000-4000-a000-000000000aee', 1, 'Timon', false),
  ('e2000000-0000-4000-b000-000000006d4e', 'e2000000-0000-4000-a000-000000000aee', 2, 'Imperatriz', false),
  ('e2000000-0000-4000-b000-000000006d4f', 'e2000000-0000-4000-a000-000000000aee', 3, 'São Luís', true),
  ('e2000000-0000-4000-b000-000000006d50', 'e2000000-0000-4000-a000-000000000aee', 4, 'Balsas', false),
  ('e2000000-0000-4000-b000-000000006d56', 'e2000000-0000-4000-a000-000000000aef', 0, 'Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006d57', 'e2000000-0000-4000-a000-000000000aef', 1, 'Carolina', false),
  ('e2000000-0000-4000-b000-000000006d58', 'e2000000-0000-4000-a000-000000000aef', 2, 'Caxias', false),
  ('e2000000-0000-4000-b000-000000006d59', 'e2000000-0000-4000-a000-000000000aef', 3, 'Imperatriz', true),
  ('e2000000-0000-4000-b000-000000006d5a', 'e2000000-0000-4000-a000-000000000aef', 4, 'Timon', false),
  ('e2000000-0000-4000-b000-000000006d60', 'e2000000-0000-4000-a000-000000000af0', 0, 'Alcântara', false),
  ('e2000000-0000-4000-b000-000000006d61', 'e2000000-0000-4000-a000-000000000af0', 1, 'Timon', false),
  ('e2000000-0000-4000-b000-000000006d62', 'e2000000-0000-4000-a000-000000000af0', 2, 'Balsas', false),
  ('e2000000-0000-4000-b000-000000006d63', 'e2000000-0000-4000-a000-000000000af0', 3, 'Caxias', true),
  ('e2000000-0000-4000-b000-000000006d64', 'e2000000-0000-4000-a000-000000000af0', 4, 'Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006d6a', 'e2000000-0000-4000-a000-000000000af1', 0, 'Caxias', false),
  ('e2000000-0000-4000-b000-000000006d6b', 'e2000000-0000-4000-a000-000000000af1', 1, 'Timon', true),
  ('e2000000-0000-4000-b000-000000006d6c', 'e2000000-0000-4000-a000-000000000af1', 2, 'Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006d6d', 'e2000000-0000-4000-a000-000000000af1', 3, 'Imperatriz', false),
  ('e2000000-0000-4000-b000-000000006d6e', 'e2000000-0000-4000-a000-000000000af1', 4, 'São José de Ribamar', false),
  ('e2000000-0000-4000-b000-000000006d74', 'e2000000-0000-4000-a000-000000000af2', 0, 'Carolina', false),
  ('e2000000-0000-4000-b000-000000006d75', 'e2000000-0000-4000-a000-000000000af2', 1, 'Timon', false),
  ('e2000000-0000-4000-b000-000000006d76', 'e2000000-0000-4000-a000-000000000af2', 2, 'Balsas', false),
  ('e2000000-0000-4000-b000-000000006d77', 'e2000000-0000-4000-a000-000000000af2', 3, 'Alcântara', true),
  ('e2000000-0000-4000-b000-000000006d78', 'e2000000-0000-4000-a000-000000000af2', 4, 'São José de Ribamar', false),
  ('e2000000-0000-4000-b000-000000006d7e', 'e2000000-0000-4000-a000-000000000af3', 0, 'Barreirinhas', true),
  ('e2000000-0000-4000-b000-000000006d7f', 'e2000000-0000-4000-a000-000000000af3', 1, 'Caxias', false),
  ('e2000000-0000-4000-b000-000000006d80', 'e2000000-0000-4000-a000-000000000af3', 2, 'São José de Ribamar', false),
  ('e2000000-0000-4000-b000-000000006d81', 'e2000000-0000-4000-a000-000000000af3', 3, 'Carolina', false),
  ('e2000000-0000-4000-b000-000000006d82', 'e2000000-0000-4000-a000-000000000af3', 4, 'Imperatriz', false),
  ('e2000000-0000-4000-b000-000000006d88', 'e2000000-0000-4000-a000-000000000af4', 0, 'Carolina', false),
  ('e2000000-0000-4000-b000-000000006d89', 'e2000000-0000-4000-a000-000000000af4', 1, 'Alcântara', false),
  ('e2000000-0000-4000-b000-000000006d8a', 'e2000000-0000-4000-a000-000000000af4', 2, 'Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006d8b', 'e2000000-0000-4000-a000-000000000af4', 3, 'São José de Ribamar', false),
  ('e2000000-0000-4000-b000-000000006d8c', 'e2000000-0000-4000-a000-000000000af4', 4, 'Balsas', true),
  ('e2000000-0000-4000-b000-000000006d92', 'e2000000-0000-4000-a000-000000000af5', 0, 'Timon', false),
  ('e2000000-0000-4000-b000-000000006d93', 'e2000000-0000-4000-a000-000000000af5', 1, 'Imperatriz', false),
  ('e2000000-0000-4000-b000-000000006d94', 'e2000000-0000-4000-a000-000000000af5', 2, 'Carolina', true),
  ('e2000000-0000-4000-b000-000000006d95', 'e2000000-0000-4000-a000-000000000af5', 3, 'Balsas', false),
  ('e2000000-0000-4000-b000-000000006d96', 'e2000000-0000-4000-a000-000000000af5', 4, 'São José de Ribamar', false),
  ('e2000000-0000-4000-b000-000000006d9c', 'e2000000-0000-4000-a000-000000000af6', 0, 'Balsas', false),
  ('e2000000-0000-4000-b000-000000006d9d', 'e2000000-0000-4000-a000-000000000af6', 1, 'São José de Ribamar', true),
  ('e2000000-0000-4000-b000-000000006d9e', 'e2000000-0000-4000-a000-000000000af6', 2, 'Barreirinhas', false),
  ('e2000000-0000-4000-b000-000000006d9f', 'e2000000-0000-4000-a000-000000000af6', 3, 'São Luís', false),
  ('e2000000-0000-4000-b000-000000006da0', 'e2000000-0000-4000-a000-000000000af6', 4, 'Carolina', false),
  ('e2000000-0000-4000-b000-000000006da6', 'e2000000-0000-4000-a000-000000000af7', 0, 'cidade do leste maranhense onde nasceu o poeta Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006da7', 'e2000000-0000-4000-a000-000000000af7', 1, 'capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor"', true),
  ('e2000000-0000-4000-b000-000000006da8', 'e2000000-0000-4000-a000-000000000af7', 2, 'principal porta de entrada do Parque Nacional dos Lençóis Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006da9', 'e2000000-0000-4000-a000-000000000af7', 3, 'cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba', false),
  ('e2000000-0000-4000-b000-000000006daa', 'e2000000-0000-4000-a000-000000000af7', 4, 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006db0', 'e2000000-0000-4000-a000-000000000af8', 0, 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins', true),
  ('e2000000-0000-4000-b000-000000006db1', 'e2000000-0000-4000-a000-000000000af8', 1, 'principal porta de entrada do Parque Nacional dos Lençóis Maranhenses', false),
  ('e2000000-0000-4000-b000-000000006db2', 'e2000000-0000-4000-a000-000000000af8', 2, 'cidade da Ilha de Upaon-Açu conhecida pelo santuário do padroeiro do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006db3', 'e2000000-0000-4000-a000-000000000af8', 3, 'cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira', false),
  ('e2000000-0000-4000-b000-000000006db4', 'e2000000-0000-4000-a000-000000000af8', 4, 'cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba', false),
  ('e2000000-0000-4000-b000-000000006dba', 'e2000000-0000-4000-a000-000000000af9', 0, 'cidade do leste maranhense onde nasceu o poeta Gonçalves Dias', true),
  ('e2000000-0000-4000-b000-000000006dbb', 'e2000000-0000-4000-a000-000000000af9', 1, 'cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira', false),
  ('e2000000-0000-4000-b000-000000006dbc', 'e2000000-0000-4000-a000-000000000af9', 2, 'capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor"', false),
  ('e2000000-0000-4000-b000-000000006dbd', 'e2000000-0000-4000-a000-000000000af9', 3, 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006dbe', 'e2000000-0000-4000-a000-000000000af9', 4, 'cidade da Ilha de Upaon-Açu conhecida pelo santuário do padroeiro do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006dc4', 'e2000000-0000-4000-a000-000000000afa', 0, 'cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba', true),
  ('e2000000-0000-4000-b000-000000006dc5', 'e2000000-0000-4000-a000-000000000afa', 1, 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006dc6', 'e2000000-0000-4000-a000-000000000afa', 2, 'cidade da Ilha de Upaon-Açu conhecida pelo santuário do padroeiro do Maranhão', false),
  ('e2000000-0000-4000-b000-000000006dc7', 'e2000000-0000-4000-a000-000000000afa', 3, 'cidade do leste maranhense onde nasceu o poeta Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006dc8', 'e2000000-0000-4000-a000-000000000afa', 4, 'capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor"', false),
  ('e2000000-0000-4000-b000-000000006dce', 'e2000000-0000-4000-a000-000000000afb', 0, 'cidade do sul do estado, porta de entrada da Chapada das Mesas', false),
  ('e2000000-0000-4000-b000-000000006dcf', 'e2000000-0000-4000-a000-000000000afb', 1, 'cidade do sul do Maranhão, polo da produção de soja no Cerrado', false),
  ('e2000000-0000-4000-b000-000000006dd0', 'e2000000-0000-4000-a000-000000000afb', 2, 'cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba', false),
  ('e2000000-0000-4000-b000-000000006dd1', 'e2000000-0000-4000-a000-000000000afb', 3, 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006dd2', 'e2000000-0000-4000-a000-000000000afb', 4, 'cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira', true),
  ('e2000000-0000-4000-b000-000000006dd8', 'e2000000-0000-4000-a000-000000000afc', 0, 'principal porta de entrada do Parque Nacional dos Lençóis Maranhenses', true),
  ('e2000000-0000-4000-b000-000000006dd9', 'e2000000-0000-4000-a000-000000000afc', 1, 'cidade do sul do estado, porta de entrada da Chapada das Mesas', false),
  ('e2000000-0000-4000-b000-000000006dda', 'e2000000-0000-4000-a000-000000000afc', 2, 'cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba', false),
  ('e2000000-0000-4000-b000-000000006ddb', 'e2000000-0000-4000-a000-000000000afc', 3, 'cidade do sul do Maranhão, polo da produção de soja no Cerrado', false),
  ('e2000000-0000-4000-b000-000000006ddc', 'e2000000-0000-4000-a000-000000000afc', 4, 'cidade do leste maranhense onde nasceu o poeta Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006de2', 'e2000000-0000-4000-a000-000000000afd', 0, 'cidade do sul do estado, porta de entrada da Chapada das Mesas', false),
  ('e2000000-0000-4000-b000-000000006de3', 'e2000000-0000-4000-a000-000000000afd', 1, 'cidade do sul do Maranhão, polo da produção de soja no Cerrado', true),
  ('e2000000-0000-4000-b000-000000006de4', 'e2000000-0000-4000-a000-000000000afd', 2, 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006de5', 'e2000000-0000-4000-a000-000000000afd', 3, 'capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor"', false),
  ('e2000000-0000-4000-b000-000000006de6', 'e2000000-0000-4000-a000-000000000afd', 4, 'cidade do leste maranhense onde nasceu o poeta Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006dec', 'e2000000-0000-4000-a000-000000000afe', 0, 'cidade do sul do estado, porta de entrada da Chapada das Mesas', true),
  ('e2000000-0000-4000-b000-000000006ded', 'e2000000-0000-4000-a000-000000000afe', 1, 'cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira', false),
  ('e2000000-0000-4000-b000-000000006dee', 'e2000000-0000-4000-a000-000000000afe', 2, 'capital do estado, fundada em 1612 e conhecida como "Atenas Brasileira" e "Ilha do Amor"', false),
  ('e2000000-0000-4000-b000-000000006def', 'e2000000-0000-4000-a000-000000000afe', 3, 'cidade do Maranhão que fica em frente a Teresina, do outro lado do rio Parnaíba', false),
  ('e2000000-0000-4000-b000-000000006df0', 'e2000000-0000-4000-a000-000000000afe', 4, 'cidade do sul do Maranhão, polo da produção de soja no Cerrado', false),
  ('e2000000-0000-4000-b000-000000006df6', 'e2000000-0000-4000-a000-000000000aff', 0, 'cidade do sul do estado, porta de entrada da Chapada das Mesas', false),
  ('e2000000-0000-4000-b000-000000006df7', 'e2000000-0000-4000-a000-000000000aff', 1, 'cidade da Ilha de Upaon-Açu conhecida pelo santuário do padroeiro do Maranhão', true),
  ('e2000000-0000-4000-b000-000000006df8', 'e2000000-0000-4000-a000-000000000aff', 2, 'cidade histórica que abriga o Centro de Lançamento de foguetes da Força Aérea Brasileira', false),
  ('e2000000-0000-4000-b000-000000006df9', 'e2000000-0000-4000-a000-000000000aff', 3, 'segunda cidade mais populosa do Maranhão, às margens do rio Tocantins', false),
  ('e2000000-0000-4000-b000-000000006dfa', 'e2000000-0000-4000-a000-000000000aff', 4, 'cidade do sul do Maranhão, polo da produção de soja no Cerrado', false),
  ('e2000000-0000-4000-b000-000000006e00', 'e2000000-0000-4000-a000-000000000b00', 0, 'Bumba meu boi', true),
  ('e2000000-0000-4000-b000-000000006e01', 'e2000000-0000-4000-a000-000000000b00', 1, 'Arroz de cuxá', false),
  ('e2000000-0000-4000-b000-000000006e02', 'e2000000-0000-4000-a000-000000000b00', 2, 'Tambor de crioula', false),
  ('e2000000-0000-4000-b000-000000006e03', 'e2000000-0000-4000-a000-000000000b00', 3, 'Cacuriá', false),
  ('e2000000-0000-4000-b000-000000006e04', 'e2000000-0000-4000-a000-000000000b00', 4, 'Quebradeiras de coco babaçu', false),
  ('e2000000-0000-4000-b000-000000006e0a', 'e2000000-0000-4000-a000-000000000b01', 0, 'Arroz de cuxá', false),
  ('e2000000-0000-4000-b000-000000006e0b', 'e2000000-0000-4000-a000-000000000b01', 1, 'Festa do Divino Espírito Santo', false),
  ('e2000000-0000-4000-b000-000000006e0c', 'e2000000-0000-4000-a000-000000000b01', 2, 'Reggae maranhense', false),
  ('e2000000-0000-4000-b000-000000006e0d', 'e2000000-0000-4000-a000-000000000b01', 3, 'Cacuriá', false),
  ('e2000000-0000-4000-b000-000000006e0e', 'e2000000-0000-4000-a000-000000000b01', 4, 'Tambor de crioula', true),
  ('e2000000-0000-4000-b000-000000006e14', 'e2000000-0000-4000-a000-000000000b02', 0, 'Tambor de crioula', false),
  ('e2000000-0000-4000-b000-000000006e15', 'e2000000-0000-4000-a000-000000000b02', 1, 'Festa do Divino Espírito Santo', false),
  ('e2000000-0000-4000-b000-000000006e16', 'e2000000-0000-4000-a000-000000000b02', 2, 'Quebradeiras de coco babaçu', false),
  ('e2000000-0000-4000-b000-000000006e17', 'e2000000-0000-4000-a000-000000000b02', 3, 'Cacuriá', true),
  ('e2000000-0000-4000-b000-000000006e18', 'e2000000-0000-4000-a000-000000000b02', 4, 'Bumba meu boi', false),
  ('e2000000-0000-4000-b000-000000006e1e', 'e2000000-0000-4000-a000-000000000b03', 0, 'Tambor de crioula', false),
  ('e2000000-0000-4000-b000-000000006e1f', 'e2000000-0000-4000-a000-000000000b03', 1, 'Quebradeiras de coco babaçu', false),
  ('e2000000-0000-4000-b000-000000006e20', 'e2000000-0000-4000-a000-000000000b03', 2, 'Arroz de cuxá', false),
  ('e2000000-0000-4000-b000-000000006e21', 'e2000000-0000-4000-a000-000000000b03', 3, 'Reggae maranhense', false),
  ('e2000000-0000-4000-b000-000000006e22', 'e2000000-0000-4000-a000-000000000b03', 4, 'Festa do Divino Espírito Santo', true),
  ('e2000000-0000-4000-b000-000000006e28', 'e2000000-0000-4000-a000-000000000b04', 0, 'Reggae maranhense', true),
  ('e2000000-0000-4000-b000-000000006e29', 'e2000000-0000-4000-a000-000000000b04', 1, 'Arroz de cuxá', false),
  ('e2000000-0000-4000-b000-000000006e2a', 'e2000000-0000-4000-a000-000000000b04', 2, 'Cacuriá', false),
  ('e2000000-0000-4000-b000-000000006e2b', 'e2000000-0000-4000-a000-000000000b04', 3, 'Bumba meu boi', false),
  ('e2000000-0000-4000-b000-000000006e2c', 'e2000000-0000-4000-a000-000000000b04', 4, 'Tambor de crioula', false),
  ('e2000000-0000-4000-b000-000000006e32', 'e2000000-0000-4000-a000-000000000b05', 0, 'Cacuriá', false),
  ('e2000000-0000-4000-b000-000000006e33', 'e2000000-0000-4000-a000-000000000b05', 1, 'Quebradeiras de coco babaçu', false),
  ('e2000000-0000-4000-b000-000000006e34', 'e2000000-0000-4000-a000-000000000b05', 2, 'Arroz de cuxá', true),
  ('e2000000-0000-4000-b000-000000006e35', 'e2000000-0000-4000-a000-000000000b05', 3, 'Festa do Divino Espírito Santo', false),
  ('e2000000-0000-4000-b000-000000006e36', 'e2000000-0000-4000-a000-000000000b05', 4, 'Tambor de crioula', false),
  ('e2000000-0000-4000-b000-000000006e3c', 'e2000000-0000-4000-a000-000000000b06', 0, 'Cacuriá', false),
  ('e2000000-0000-4000-b000-000000006e3d', 'e2000000-0000-4000-a000-000000000b06', 1, 'Festa do Divino Espírito Santo', false),
  ('e2000000-0000-4000-b000-000000006e3e', 'e2000000-0000-4000-a000-000000000b06', 2, 'Quebradeiras de coco babaçu', true),
  ('e2000000-0000-4000-b000-000000006e3f', 'e2000000-0000-4000-a000-000000000b06', 3, 'Bumba meu boi', false),
  ('e2000000-0000-4000-b000-000000006e40', 'e2000000-0000-4000-a000-000000000b06', 4, 'Tambor de crioula', false),
  ('e2000000-0000-4000-b000-000000006e46', 'e2000000-0000-4000-a000-000000000b07', 0, 'celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara', false),
  ('e2000000-0000-4000-b000-000000006e47', 'e2000000-0000-4000-a000-000000000b07', 1, 'dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007', false),
  ('e2000000-0000-4000-b000-000000006e48', 'e2000000-0000-4000-a000-000000000b07', 2, 'gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira"', false),
  ('e2000000-0000-4000-b000-000000006e49', 'e2000000-0000-4000-a000-000000000b07', 3, 'festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019', true),
  ('e2000000-0000-4000-b000-000000006e4a', 'e2000000-0000-4000-a000-000000000b07', 4, 'dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís', false),
  ('e2000000-0000-4000-b000-000000006e50', 'e2000000-0000-4000-a000-000000000b08', 0, 'dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís', false),
  ('e2000000-0000-4000-b000-000000006e51', 'e2000000-0000-4000-a000-000000000b08', 1, 'festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019', false),
  ('e2000000-0000-4000-b000-000000006e52', 'e2000000-0000-4000-a000-000000000b08', 2, 'gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira"', false),
  ('e2000000-0000-4000-b000-000000006e53', 'e2000000-0000-4000-a000-000000000b08', 3, 'trabalhadoras extrativistas que vivem da coleta e quebra do coco de uma palmeira típica do estado', false),
  ('e2000000-0000-4000-b000-000000006e54', 'e2000000-0000-4000-a000-000000000b08', 4, 'dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007', true),
  ('e2000000-0000-4000-b000-000000006e5a', 'e2000000-0000-4000-a000-000000000b09', 0, 'gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira"', false),
  ('e2000000-0000-4000-b000-000000006e5b', 'e2000000-0000-4000-a000-000000000b09', 1, 'festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019', false),
  ('e2000000-0000-4000-b000-000000006e5c', 'e2000000-0000-4000-a000-000000000b09', 2, 'celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara', false),
  ('e2000000-0000-4000-b000-000000006e5d', 'e2000000-0000-4000-a000-000000000b09', 3, 'prato típico feito com vinagreira, gergelim e camarão seco', false),
  ('e2000000-0000-4000-b000-000000006e5e', 'e2000000-0000-4000-a000-000000000b09', 4, 'dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís', true),
  ('e2000000-0000-4000-b000-000000006e64', 'e2000000-0000-4000-a000-000000000b0a', 0, 'prato típico feito com vinagreira, gergelim e camarão seco', false),
  ('e2000000-0000-4000-b000-000000006e65', 'e2000000-0000-4000-a000-000000000b0a', 1, 'dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís', false),
  ('e2000000-0000-4000-b000-000000006e66', 'e2000000-0000-4000-a000-000000000b0a', 2, 'dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007', false),
  ('e2000000-0000-4000-b000-000000006e67', 'e2000000-0000-4000-a000-000000000b0a', 3, 'celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara', true),
  ('e2000000-0000-4000-b000-000000006e68', 'e2000000-0000-4000-a000-000000000b0a', 4, 'gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira"', false),
  ('e2000000-0000-4000-b000-000000006e6e', 'e2000000-0000-4000-a000-000000000b0b', 0, 'celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara', false),
  ('e2000000-0000-4000-b000-000000006e6f', 'e2000000-0000-4000-a000-000000000b0b', 1, 'gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira"', true),
  ('e2000000-0000-4000-b000-000000006e70', 'e2000000-0000-4000-a000-000000000b0b', 2, 'dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís', false),
  ('e2000000-0000-4000-b000-000000006e71', 'e2000000-0000-4000-a000-000000000b0b', 3, 'trabalhadoras extrativistas que vivem da coleta e quebra do coco de uma palmeira típica do estado', false),
  ('e2000000-0000-4000-b000-000000006e72', 'e2000000-0000-4000-a000-000000000b0b', 4, 'prato típico feito com vinagreira, gergelim e camarão seco', false),
  ('e2000000-0000-4000-b000-000000006e78', 'e2000000-0000-4000-a000-000000000b0c', 0, 'festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019', false),
  ('e2000000-0000-4000-b000-000000006e79', 'e2000000-0000-4000-a000-000000000b0c', 1, 'prato típico feito com vinagreira, gergelim e camarão seco', true),
  ('e2000000-0000-4000-b000-000000006e7a', 'e2000000-0000-4000-a000-000000000b0c', 2, 'celebração religiosa com caixeiras, império e mastro, muito forte em Alcântara', false),
  ('e2000000-0000-4000-b000-000000006e7b', 'e2000000-0000-4000-a000-000000000b0c', 3, 'dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007', false),
  ('e2000000-0000-4000-b000-000000006e7c', 'e2000000-0000-4000-a000-000000000b0c', 4, 'dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís', false),
  ('e2000000-0000-4000-b000-000000006e82', 'e2000000-0000-4000-a000-000000000b0d', 0, 'festa junina com auto do boi e sotaques como matraca, zabumba e orquestra, reconhecida pela UNESCO em 2019', false),
  ('e2000000-0000-4000-b000-000000006e83', 'e2000000-0000-4000-a000-000000000b0d', 1, 'trabalhadoras extrativistas que vivem da coleta e quebra do coco de uma palmeira típica do estado', true),
  ('e2000000-0000-4000-b000-000000006e84', 'e2000000-0000-4000-a000-000000000b0d', 2, 'gênero musical tão forte em São Luís que deu à cidade o apelido de "Jamaica Brasileira"', false),
  ('e2000000-0000-4000-b000-000000006e85', 'e2000000-0000-4000-a000-000000000b0d', 3, 'dança de origem afro-brasileira com punga (umbigada), registrada pelo IPHAN como patrimônio imaterial em 2007', false),
  ('e2000000-0000-4000-b000-000000006e86', 'e2000000-0000-4000-a000-000000000b0d', 4, 'dança de roda animada, ligada à Festa do Divino, popularizada por Dona Teté em São Luís', false),
  ('e2000000-0000-4000-b000-000000006e8c', 'e2000000-0000-4000-a000-000000000b0e', 0, 'Ferreira Gullar', false),
  ('e2000000-0000-4000-b000-000000006e8d', 'e2000000-0000-4000-a000-000000000b0e', 1, 'Graça Aranha', false),
  ('e2000000-0000-4000-b000-000000006e8e', 'e2000000-0000-4000-a000-000000000b0e', 2, 'Aluísio Azevedo', false),
  ('e2000000-0000-4000-b000-000000006e8f', 'e2000000-0000-4000-a000-000000000b0e', 3, 'Sousândrade', false),
  ('e2000000-0000-4000-b000-000000006e90', 'e2000000-0000-4000-a000-000000000b0e', 4, 'Gonçalves Dias', true),
  ('e2000000-0000-4000-b000-000000006e96', 'e2000000-0000-4000-a000-000000000b0f', 0, 'Coelho Neto', false),
  ('e2000000-0000-4000-b000-000000006e97', 'e2000000-0000-4000-a000-000000000b0f', 1, 'Graça Aranha', false),
  ('e2000000-0000-4000-b000-000000006e98', 'e2000000-0000-4000-a000-000000000b0f', 2, 'Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006e99', 'e2000000-0000-4000-a000-000000000b0f', 3, 'Aluísio Azevedo', true),
  ('e2000000-0000-4000-b000-000000006e9a', 'e2000000-0000-4000-a000-000000000b0f', 4, 'Josué Montello', false),
  ('e2000000-0000-4000-b000-000000006ea0', 'e2000000-0000-4000-a000-000000000b10', 0, 'Aluísio Azevedo', false),
  ('e2000000-0000-4000-b000-000000006ea1', 'e2000000-0000-4000-a000-000000000b10', 1, 'Ferreira Gullar', true),
  ('e2000000-0000-4000-b000-000000006ea2', 'e2000000-0000-4000-a000-000000000b10', 2, 'Josué Montello', false),
  ('e2000000-0000-4000-b000-000000006ea3', 'e2000000-0000-4000-a000-000000000b10', 3, 'Sousândrade', false),
  ('e2000000-0000-4000-b000-000000006ea4', 'e2000000-0000-4000-a000-000000000b10', 4, 'Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006eaa', 'e2000000-0000-4000-a000-000000000b11', 0, 'Sousândrade', false),
  ('e2000000-0000-4000-b000-000000006eab', 'e2000000-0000-4000-a000-000000000b11', 1, 'Josué Montello', true),
  ('e2000000-0000-4000-b000-000000006eac', 'e2000000-0000-4000-a000-000000000b11', 2, 'Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006ead', 'e2000000-0000-4000-a000-000000000b11', 3, 'Aluísio Azevedo', false),
  ('e2000000-0000-4000-b000-000000006eae', 'e2000000-0000-4000-a000-000000000b11', 4, 'Graça Aranha', false),
  ('e2000000-0000-4000-b000-000000006eb4', 'e2000000-0000-4000-a000-000000000b12', 0, 'Graça Aranha', true),
  ('e2000000-0000-4000-b000-000000006eb5', 'e2000000-0000-4000-a000-000000000b12', 1, 'Sousândrade', false),
  ('e2000000-0000-4000-b000-000000006eb6', 'e2000000-0000-4000-a000-000000000b12', 2, 'Josué Montello', false),
  ('e2000000-0000-4000-b000-000000006eb7', 'e2000000-0000-4000-a000-000000000b12', 3, 'Aluísio Azevedo', false),
  ('e2000000-0000-4000-b000-000000006eb8', 'e2000000-0000-4000-a000-000000000b12', 4, 'Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006ebe', 'e2000000-0000-4000-a000-000000000b13', 0, 'Josué Montello', false),
  ('e2000000-0000-4000-b000-000000006ebf', 'e2000000-0000-4000-a000-000000000b13', 1, 'Graça Aranha', false),
  ('e2000000-0000-4000-b000-000000006ec0', 'e2000000-0000-4000-a000-000000000b13', 2, 'Sousândrade', true),
  ('e2000000-0000-4000-b000-000000006ec1', 'e2000000-0000-4000-a000-000000000b13', 3, 'Coelho Neto', false),
  ('e2000000-0000-4000-b000-000000006ec2', 'e2000000-0000-4000-a000-000000000b13', 4, 'Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006ec8', 'e2000000-0000-4000-a000-000000000b14', 0, 'Graça Aranha', false),
  ('e2000000-0000-4000-b000-000000006ec9', 'e2000000-0000-4000-a000-000000000b14', 1, 'Ferreira Gullar', false),
  ('e2000000-0000-4000-b000-000000006eca', 'e2000000-0000-4000-a000-000000000b14', 2, 'Sousândrade', false),
  ('e2000000-0000-4000-b000-000000006ecb', 'e2000000-0000-4000-a000-000000000b14', 3, 'Coelho Neto', true),
  ('e2000000-0000-4000-b000-000000006ecc', 'e2000000-0000-4000-a000-000000000b14', 4, 'Gonçalves Dias', false),
  ('e2000000-0000-4000-b000-000000006ed2', 'e2000000-0000-4000-a000-000000000b15', 0, '"Canção do Exílio" e "I-Juca-Pirama"', true),
  ('e2000000-0000-4000-b000-000000006ed3', 'e2000000-0000-4000-a000-000000000b15', 1, '"O Mulato", marco do Naturalismo no Brasil', false),
  ('e2000000-0000-4000-b000-000000006ed4', 'e2000000-0000-4000-a000-000000000b15', 2, '"Os Tambores de São Luís"', false),
  ('e2000000-0000-4000-b000-000000006ed5', 'e2000000-0000-4000-a000-000000000b15', 3, '"O Guesa", poema longo do Romantismo', false),
  ('e2000000-0000-4000-b000-000000006ed6', 'e2000000-0000-4000-a000-000000000b15', 4, '"Poema Sujo", escrito no exílio em Buenos Aires', false),
  ('e2000000-0000-4000-b000-000000006edc', 'e2000000-0000-4000-a000-000000000b16', 0, '"Canção do Exílio" e "I-Juca-Pirama"', false),
  ('e2000000-0000-4000-b000-000000006edd', 'e2000000-0000-4000-a000-000000000b16', 1, '"O Mulato", marco do Naturalismo no Brasil', true),
  ('e2000000-0000-4000-b000-000000006ede', 'e2000000-0000-4000-a000-000000000b16', 2, '"O Guesa", poema longo do Romantismo', false),
  ('e2000000-0000-4000-b000-000000006edf', 'e2000000-0000-4000-a000-000000000b16', 3, 'vasta obra de romances e contos, como "Rei Negro"', false),
  ('e2000000-0000-4000-b000-000000006ee0', 'e2000000-0000-4000-a000-000000000b16', 4, '"Os Tambores de São Luís"', false),
  ('e2000000-0000-4000-b000-000000006ee6', 'e2000000-0000-4000-a000-000000000b17', 0, '"Poema Sujo", escrito no exílio em Buenos Aires', true),
  ('e2000000-0000-4000-b000-000000006ee7', 'e2000000-0000-4000-a000-000000000b17', 1, 'vasta obra de romances e contos, como "Rei Negro"', false),
  ('e2000000-0000-4000-b000-000000006ee8', 'e2000000-0000-4000-a000-000000000b17', 2, '"O Guesa", poema longo do Romantismo', false),
  ('e2000000-0000-4000-b000-000000006ee9', 'e2000000-0000-4000-a000-000000000b17', 3, '"Os Tambores de São Luís"', false),
  ('e2000000-0000-4000-b000-000000006eea', 'e2000000-0000-4000-a000-000000000b17', 4, '"O Mulato", marco do Naturalismo no Brasil', false),
  ('e2000000-0000-4000-b000-000000006ef0', 'e2000000-0000-4000-a000-000000000b18', 0, 'vasta obra de romances e contos, como "Rei Negro"', false),
  ('e2000000-0000-4000-b000-000000006ef1', 'e2000000-0000-4000-a000-000000000b18', 1, '"O Mulato", marco do Naturalismo no Brasil', false),
  ('e2000000-0000-4000-b000-000000006ef2', 'e2000000-0000-4000-a000-000000000b18', 2, '"Os Tambores de São Luís"', true),
  ('e2000000-0000-4000-b000-000000006ef3', 'e2000000-0000-4000-a000-000000000b18', 3, '"O Guesa", poema longo do Romantismo', false),
  ('e2000000-0000-4000-b000-000000006ef4', 'e2000000-0000-4000-a000-000000000b18', 4, '"Poema Sujo", escrito no exílio em Buenos Aires', false),
  ('e2000000-0000-4000-b000-000000006efa', 'e2000000-0000-4000-a000-000000000b19', 0, 'vasta obra de romances e contos, como "Rei Negro"', false),
  ('e2000000-0000-4000-b000-000000006efb', 'e2000000-0000-4000-a000-000000000b19', 1, '"Canaã", romance pré-modernista', true),
  ('e2000000-0000-4000-b000-000000006efc', 'e2000000-0000-4000-a000-000000000b19', 2, '"O Mulato", marco do Naturalismo no Brasil', false),
  ('e2000000-0000-4000-b000-000000006efd', 'e2000000-0000-4000-a000-000000000b19', 3, '"O Guesa", poema longo do Romantismo', false),
  ('e2000000-0000-4000-b000-000000006efe', 'e2000000-0000-4000-a000-000000000b19', 4, '"Poema Sujo", escrito no exílio em Buenos Aires', false),
  ('e2000000-0000-4000-b000-000000006f04', 'e2000000-0000-4000-a000-000000000b1a', 0, '"Canção do Exílio" e "I-Juca-Pirama"', false),
  ('e2000000-0000-4000-b000-000000006f05', 'e2000000-0000-4000-a000-000000000b1a', 1, '"O Mulato", marco do Naturalismo no Brasil', false),
  ('e2000000-0000-4000-b000-000000006f06', 'e2000000-0000-4000-a000-000000000b1a', 2, 'vasta obra de romances e contos, como "Rei Negro"', false),
  ('e2000000-0000-4000-b000-000000006f07', 'e2000000-0000-4000-a000-000000000b1a', 3, '"O Guesa", poema longo do Romantismo', true),
  ('e2000000-0000-4000-b000-000000006f08', 'e2000000-0000-4000-a000-000000000b1a', 4, '"Canaã", romance pré-modernista', false),
  ('e2000000-0000-4000-b000-000000006f0e', 'e2000000-0000-4000-a000-000000000b1b', 0, '"Canaã", romance pré-modernista', false),
  ('e2000000-0000-4000-b000-000000006f0f', 'e2000000-0000-4000-a000-000000000b1b', 1, '"O Mulato", marco do Naturalismo no Brasil', false),
  ('e2000000-0000-4000-b000-000000006f10', 'e2000000-0000-4000-a000-000000000b1b', 2, '"Canção do Exílio" e "I-Juca-Pirama"', false),
  ('e2000000-0000-4000-b000-000000006f11', 'e2000000-0000-4000-a000-000000000b1b', 3, 'vasta obra de romances e contos, como "Rei Negro"', true),
  ('e2000000-0000-4000-b000-000000006f12', 'e2000000-0000-4000-a000-000000000b1b', 4, '"O Guesa", poema longo do Romantismo', false),
  ('e2000000-0000-4000-b000-000000006f18', 'e2000000-0000-4000-a000-000000000b1c', 0, 'Porto do Itaqui', false),
  ('e2000000-0000-4000-b000-000000006f19', 'e2000000-0000-4000-a000-000000000b1c', 1, 'Centro de Lançamento de Alcântara', false),
  ('e2000000-0000-4000-b000-000000006f1a', 'e2000000-0000-4000-a000-000000000b1c', 2, 'Soja no sul do estado', false),
  ('e2000000-0000-4000-b000-000000006f1b', 'e2000000-0000-4000-a000-000000000b1c', 3, 'Estrada de Ferro Carajás', true),
  ('e2000000-0000-4000-b000-000000006f1c', 'e2000000-0000-4000-a000-000000000b1c', 4, 'Extrativismo do babaçu', false),
  ('e2000000-0000-4000-b000-000000006f22', 'e2000000-0000-4000-a000-000000000b1d', 0, 'Extrativismo do babaçu', false),
  ('e2000000-0000-4000-b000-000000006f23', 'e2000000-0000-4000-a000-000000000b1d', 1, 'Centro de Lançamento de Alcântara', false),
  ('e2000000-0000-4000-b000-000000006f24', 'e2000000-0000-4000-a000-000000000b1d', 2, 'Porto do Itaqui', true),
  ('e2000000-0000-4000-b000-000000006f25', 'e2000000-0000-4000-a000-000000000b1d', 3, 'Soja no sul do estado', false),
  ('e2000000-0000-4000-b000-000000006f26', 'e2000000-0000-4000-a000-000000000b1d', 4, 'Estrada de Ferro Carajás', false),
  ('e2000000-0000-4000-b000-000000006f2c', 'e2000000-0000-4000-a000-000000000b1e', 0, 'Soja no sul do estado', false),
  ('e2000000-0000-4000-b000-000000006f2d', 'e2000000-0000-4000-a000-000000000b1e', 1, 'Extrativismo do babaçu', false),
  ('e2000000-0000-4000-b000-000000006f2e', 'e2000000-0000-4000-a000-000000000b1e', 2, 'Centro de Lançamento de Alcântara', true),
  ('e2000000-0000-4000-b000-000000006f2f', 'e2000000-0000-4000-a000-000000000b1e', 3, 'Estrada de Ferro Carajás', false),
  ('e2000000-0000-4000-b000-000000006f30', 'e2000000-0000-4000-a000-000000000b1e', 4, 'Porto do Itaqui', false),
  ('e2000000-0000-4000-b000-000000006f36', 'e2000000-0000-4000-a000-000000000b1f', 0, 'Centro de Lançamento de Alcântara', false),
  ('e2000000-0000-4000-b000-000000006f37', 'e2000000-0000-4000-a000-000000000b1f', 1, 'Extrativismo do babaçu', false),
  ('e2000000-0000-4000-b000-000000006f38', 'e2000000-0000-4000-a000-000000000b1f', 2, 'Porto do Itaqui', false),
  ('e2000000-0000-4000-b000-000000006f39', 'e2000000-0000-4000-a000-000000000b1f', 3, 'Estrada de Ferro Carajás', false),
  ('e2000000-0000-4000-b000-000000006f3a', 'e2000000-0000-4000-a000-000000000b1f', 4, 'Soja no sul do estado', true),
  ('e2000000-0000-4000-b000-000000006f40', 'e2000000-0000-4000-a000-000000000b20', 0, 'Extrativismo do babaçu', true),
  ('e2000000-0000-4000-b000-000000006f41', 'e2000000-0000-4000-a000-000000000b20', 1, 'Centro de Lançamento de Alcântara', false),
  ('e2000000-0000-4000-b000-000000006f42', 'e2000000-0000-4000-a000-000000000b20', 2, 'Estrada de Ferro Carajás', false),
  ('e2000000-0000-4000-b000-000000006f43', 'e2000000-0000-4000-a000-000000000b20', 3, 'Soja no sul do estado', false),
  ('e2000000-0000-4000-b000-000000006f44', 'e2000000-0000-4000-a000-000000000b20', 4, 'Porto do Itaqui', false),
  ('e2000000-0000-4000-b000-000000006f4a', 'e2000000-0000-4000-a000-000000000b21', 0, 'ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís', true),
  ('e2000000-0000-4000-b000-000000006f4b', 'e2000000-0000-4000-a000-000000000b21', 1, 'porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes', false),
  ('e2000000-0000-4000-b000-000000006f4c', 'e2000000-0000-4000-a000-000000000b21', 2, 'base espacial favorecida pela proximidade da linha do Equador', false),
  ('e2000000-0000-4000-b000-000000006f4d', 'e2000000-0000-4000-a000-000000000b21', 3, 'produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba', false),
  ('e2000000-0000-4000-b000-000000006f4e', 'e2000000-0000-4000-a000-000000000b21', 4, 'atividade tradicional que gera óleo, carvão e renda para milhares de famílias', false),
  ('e2000000-0000-4000-b000-000000006f54', 'e2000000-0000-4000-a000-000000000b22', 0, 'porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes', true),
  ('e2000000-0000-4000-b000-000000006f55', 'e2000000-0000-4000-a000-000000000b22', 1, 'ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís', false),
  ('e2000000-0000-4000-b000-000000006f56', 'e2000000-0000-4000-a000-000000000b22', 2, 'produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba', false),
  ('e2000000-0000-4000-b000-000000006f57', 'e2000000-0000-4000-a000-000000000b22', 3, 'base espacial favorecida pela proximidade da linha do Equador', false),
  ('e2000000-0000-4000-b000-000000006f58', 'e2000000-0000-4000-a000-000000000b22', 4, 'atividade tradicional que gera óleo, carvão e renda para milhares de famílias', false),
  ('e2000000-0000-4000-b000-000000006f5e', 'e2000000-0000-4000-a000-000000000b23', 0, 'produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba', false),
  ('e2000000-0000-4000-b000-000000006f5f', 'e2000000-0000-4000-a000-000000000b23', 1, 'atividade tradicional que gera óleo, carvão e renda para milhares de famílias', false),
  ('e2000000-0000-4000-b000-000000006f60', 'e2000000-0000-4000-a000-000000000b23', 2, 'porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes', false),
  ('e2000000-0000-4000-b000-000000006f61', 'e2000000-0000-4000-a000-000000000b23', 3, 'ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís', false),
  ('e2000000-0000-4000-b000-000000006f62', 'e2000000-0000-4000-a000-000000000b23', 4, 'base espacial favorecida pela proximidade da linha do Equador', true),
  ('e2000000-0000-4000-b000-000000006f68', 'e2000000-0000-4000-a000-000000000b24', 0, 'atividade tradicional que gera óleo, carvão e renda para milhares de famílias', false),
  ('e2000000-0000-4000-b000-000000006f69', 'e2000000-0000-4000-a000-000000000b24', 1, 'porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes', false),
  ('e2000000-0000-4000-b000-000000006f6a', 'e2000000-0000-4000-a000-000000000b24', 2, 'base espacial favorecida pela proximidade da linha do Equador', false),
  ('e2000000-0000-4000-b000-000000006f6b', 'e2000000-0000-4000-a000-000000000b24', 3, 'ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís', false),
  ('e2000000-0000-4000-b000-000000006f6c', 'e2000000-0000-4000-a000-000000000b24', 4, 'produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba', true),
  ('e2000000-0000-4000-b000-000000006f72', 'e2000000-0000-4000-a000-000000000b25', 0, 'atividade tradicional que gera óleo, carvão e renda para milhares de famílias', true),
  ('e2000000-0000-4000-b000-000000006f73', 'e2000000-0000-4000-a000-000000000b25', 1, 'ferrovia que leva minério de ferro da Serra dos Carajás, no Pará, até o terminal de Ponta da Madeira, em São Luís', false),
  ('e2000000-0000-4000-b000-000000006f74', 'e2000000-0000-4000-a000-000000000b25', 2, 'produção agrícola do Cerrado que integra a fronteira agrícola conhecida como Matopiba', false),
  ('e2000000-0000-4000-b000-000000006f75', 'e2000000-0000-4000-a000-000000000b25', 3, 'base espacial favorecida pela proximidade da linha do Equador', false),
  ('e2000000-0000-4000-b000-000000006f76', 'e2000000-0000-4000-a000-000000000b25', 4, 'porto público de São Luís, de águas profundas, usado para grãos, combustíveis e fertilizantes', false),
  ('e2000000-0000-4000-b000-000000006f7c', 'e2000000-0000-4000-a000-000000000b26', 0, 'Praia Grande', false),
  ('e2000000-0000-4000-b000-000000006f7d', 'e2000000-0000-4000-a000-000000000b26', 1, 'Palácio dos Leões', true),
  ('e2000000-0000-4000-b000-000000006f7e', 'e2000000-0000-4000-a000-000000000b26', 2, 'Guaraná Jesus', false),
  ('e2000000-0000-4000-b000-000000006f7f', 'e2000000-0000-4000-a000-000000000b26', 3, 'Fonte do Ribeirão', false),
  ('e2000000-0000-4000-b000-000000006f80', 'e2000000-0000-4000-a000-000000000b26', 4, 'Teatro Arthur Azevedo', false),
  ('e2000000-0000-4000-b000-000000006f86', 'e2000000-0000-4000-a000-000000000b27', 0, 'Fonte do Ribeirão', false),
  ('e2000000-0000-4000-b000-000000006f87', 'e2000000-0000-4000-a000-000000000b27', 1, 'Guaraná Jesus', false),
  ('e2000000-0000-4000-b000-000000006f88', 'e2000000-0000-4000-a000-000000000b27', 2, 'Teatro Arthur Azevedo', true),
  ('e2000000-0000-4000-b000-000000006f89', 'e2000000-0000-4000-a000-000000000b27', 3, 'Palácio dos Leões', false),
  ('e2000000-0000-4000-b000-000000006f8a', 'e2000000-0000-4000-a000-000000000b27', 4, 'Praia Grande', false),
  ('e2000000-0000-4000-b000-000000006f90', 'e2000000-0000-4000-a000-000000000b28', 0, 'Palácio dos Leões', false),
  ('e2000000-0000-4000-b000-000000006f91', 'e2000000-0000-4000-a000-000000000b28', 1, 'Praia Grande', false),
  ('e2000000-0000-4000-b000-000000006f92', 'e2000000-0000-4000-a000-000000000b28', 2, 'Fonte do Ribeirão', true),
  ('e2000000-0000-4000-b000-000000006f93', 'e2000000-0000-4000-a000-000000000b28', 3, 'Guaraná Jesus', false),
  ('e2000000-0000-4000-b000-000000006f94', 'e2000000-0000-4000-a000-000000000b28', 4, 'Teatro Arthur Azevedo', false),
  ('e2000000-0000-4000-b000-000000006f9a', 'e2000000-0000-4000-a000-000000000b29', 0, 'Teatro Arthur Azevedo', false),
  ('e2000000-0000-4000-b000-000000006f9b', 'e2000000-0000-4000-a000-000000000b29', 1, 'Fonte do Ribeirão', false),
  ('e2000000-0000-4000-b000-000000006f9c', 'e2000000-0000-4000-a000-000000000b29', 2, 'Palácio dos Leões', false),
  ('e2000000-0000-4000-b000-000000006f9d', 'e2000000-0000-4000-a000-000000000b29', 3, 'Guaraná Jesus', false),
  ('e2000000-0000-4000-b000-000000006f9e', 'e2000000-0000-4000-a000-000000000b29', 4, 'Praia Grande', true),
  ('e2000000-0000-4000-b000-000000006fa4', 'e2000000-0000-4000-a000-000000000b2a', 0, 'Palácio dos Leões', false),
  ('e2000000-0000-4000-b000-000000006fa5', 'e2000000-0000-4000-a000-000000000b2a', 1, 'Guaraná Jesus', true),
  ('e2000000-0000-4000-b000-000000006fa6', 'e2000000-0000-4000-a000-000000000b2a', 2, 'Praia Grande', false),
  ('e2000000-0000-4000-b000-000000006fa7', 'e2000000-0000-4000-a000-000000000b2a', 3, 'Fonte do Ribeirão', false),
  ('e2000000-0000-4000-b000-000000006fa8', 'e2000000-0000-4000-a000-000000000b2a', 4, 'Teatro Arthur Azevedo', false),
  ('e2000000-0000-4000-b000-000000006fae', 'e2000000-0000-4000-a000-000000000b2b', 0, 'sede do governo do Maranhão, em São Luís', true),
  ('e2000000-0000-4000-b000-000000006faf', 'e2000000-0000-4000-a000-000000000b2b', 1, 'refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local', false),
  ('e2000000-0000-4000-b000-000000006fb0', 'e2000000-0000-4000-a000-000000000b2b', 2, 'teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil', false),
  ('e2000000-0000-4000-b000-000000006fb1', 'e2000000-0000-4000-a000-000000000b2b', 3, 'bairro histórico de São Luís com casarões cobertos de azulejos portugueses', false),
  ('e2000000-0000-4000-b000-000000006fb2', 'e2000000-0000-4000-a000-000000000b2b', 4, 'chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas', false),
  ('e2000000-0000-4000-b000-000000006fb8', 'e2000000-0000-4000-a000-000000000b2c', 0, 'sede do governo do Maranhão, em São Luís', false),
  ('e2000000-0000-4000-b000-000000006fb9', 'e2000000-0000-4000-a000-000000000b2c', 1, 'teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil', true),
  ('e2000000-0000-4000-b000-000000006fba', 'e2000000-0000-4000-a000-000000000b2c', 2, 'bairro histórico de São Luís com casarões cobertos de azulejos portugueses', false),
  ('e2000000-0000-4000-b000-000000006fbb', 'e2000000-0000-4000-a000-000000000b2c', 3, 'chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas', false),
  ('e2000000-0000-4000-b000-000000006fbc', 'e2000000-0000-4000-a000-000000000b2c', 4, 'refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local', false),
  ('e2000000-0000-4000-b000-000000006fc2', 'e2000000-0000-4000-a000-000000000b2d', 0, 'refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local', false),
  ('e2000000-0000-4000-b000-000000006fc3', 'e2000000-0000-4000-a000-000000000b2d', 1, 'sede do governo do Maranhão, em São Luís', false),
  ('e2000000-0000-4000-b000-000000006fc4', 'e2000000-0000-4000-a000-000000000b2d', 2, 'teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil', false),
  ('e2000000-0000-4000-b000-000000006fc5', 'e2000000-0000-4000-a000-000000000b2d', 3, 'chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas', true),
  ('e2000000-0000-4000-b000-000000006fc6', 'e2000000-0000-4000-a000-000000000b2d', 4, 'bairro histórico de São Luís com casarões cobertos de azulejos portugueses', false),
  ('e2000000-0000-4000-b000-000000006fcc', 'e2000000-0000-4000-a000-000000000b2e', 0, 'bairro histórico de São Luís com casarões cobertos de azulejos portugueses', true),
  ('e2000000-0000-4000-b000-000000006fcd', 'e2000000-0000-4000-a000-000000000b2e', 1, 'teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil', false),
  ('e2000000-0000-4000-b000-000000006fce', 'e2000000-0000-4000-a000-000000000b2e', 2, 'refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local', false),
  ('e2000000-0000-4000-b000-000000006fcf', 'e2000000-0000-4000-a000-000000000b2e', 3, 'sede do governo do Maranhão, em São Luís', false),
  ('e2000000-0000-4000-b000-000000006fd0', 'e2000000-0000-4000-a000-000000000b2e', 4, 'chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas', false),
  ('e2000000-0000-4000-b000-000000006fd6', 'e2000000-0000-4000-a000-000000000b2f', 0, 'bairro histórico de São Luís com casarões cobertos de azulejos portugueses', false),
  ('e2000000-0000-4000-b000-000000006fd7', 'e2000000-0000-4000-a000-000000000b2f', 1, 'teatro de São Luís inaugurado em 1817, um dos mais antigos do Brasil', false),
  ('e2000000-0000-4000-b000-000000006fd8', 'e2000000-0000-4000-a000-000000000b2f', 2, 'sede do governo do Maranhão, em São Luís', false),
  ('e2000000-0000-4000-b000-000000006fd9', 'e2000000-0000-4000-a000-000000000b2f', 3, 'chafariz histórico do século XVIII no Centro de São Luís, cercado de lendas', false),
  ('e2000000-0000-4000-b000-000000006fda', 'e2000000-0000-4000-a000-000000000b2f', 4, 'refrigerante cor-de-rosa criado em São Luís por um farmacêutico, símbolo da cultura local', true),
  ('e2000000-0000-4000-b000-000000006fe0', 'e2000000-0000-4000-a000-000000000b30', 0, 'Prefeito', false),
  ('e2000000-0000-4000-b000-000000006fe1', 'e2000000-0000-4000-a000-000000000b30', 1, 'Vereador', false),
  ('e2000000-0000-4000-b000-000000006fe2', 'e2000000-0000-4000-a000-000000000b30', 2, 'Lei Orgânica', true),
  ('e2000000-0000-4000-b000-000000006fe3', 'e2000000-0000-4000-a000-000000000b30', 3, 'Câmara Municipal', false),
  ('e2000000-0000-4000-b000-000000006fe4', 'e2000000-0000-4000-a000-000000000b30', 4, 'Parecer prévio do Tribunal de Contas', false),
  ('e2000000-0000-4000-b000-000000006fea', 'e2000000-0000-4000-a000-000000000b31', 0, 'Lei Orgânica', false),
  ('e2000000-0000-4000-b000-000000006feb', 'e2000000-0000-4000-a000-000000000b31', 1, 'Vereador', false),
  ('e2000000-0000-4000-b000-000000006fec', 'e2000000-0000-4000-a000-000000000b31', 2, 'Parecer prévio do Tribunal de Contas', false),
  ('e2000000-0000-4000-b000-000000006fed', 'e2000000-0000-4000-a000-000000000b31', 3, 'Câmara Municipal', true),
  ('e2000000-0000-4000-b000-000000006fee', 'e2000000-0000-4000-a000-000000000b31', 4, 'Prefeito', false),
  ('e2000000-0000-4000-b000-000000006ff4', 'e2000000-0000-4000-a000-000000000b32', 0, 'Parecer prévio do Tribunal de Contas', false),
  ('e2000000-0000-4000-b000-000000006ff5', 'e2000000-0000-4000-a000-000000000b32', 1, 'Lei Orgânica', false),
  ('e2000000-0000-4000-b000-000000006ff6', 'e2000000-0000-4000-a000-000000000b32', 2, 'Vereador', false),
  ('e2000000-0000-4000-b000-000000006ff7', 'e2000000-0000-4000-a000-000000000b32', 3, 'Prefeito', true),
  ('e2000000-0000-4000-b000-000000006ff8', 'e2000000-0000-4000-a000-000000000b32', 4, 'Câmara Municipal', false),
  ('e2000000-0000-4000-b000-000000006ffe', 'e2000000-0000-4000-a000-000000000b33', 0, 'Vereador', true),
  ('e2000000-0000-4000-b000-000000006fff', 'e2000000-0000-4000-a000-000000000b33', 1, 'Parecer prévio do Tribunal de Contas', false),
  ('e2000000-0000-4000-b000-000000007000', 'e2000000-0000-4000-a000-000000000b33', 2, 'Câmara Municipal', false),
  ('e2000000-0000-4000-b000-000000007001', 'e2000000-0000-4000-a000-000000000b33', 3, 'Lei Orgânica', false),
  ('e2000000-0000-4000-b000-000000007002', 'e2000000-0000-4000-a000-000000000b33', 4, 'Prefeito', false),
  ('e2000000-0000-4000-b000-000000007008', 'e2000000-0000-4000-a000-000000000b34', 0, 'Prefeito', false),
  ('e2000000-0000-4000-b000-000000007009', 'e2000000-0000-4000-a000-000000000b34', 1, 'Parecer prévio do Tribunal de Contas', true),
  ('e2000000-0000-4000-b000-00000000700a', 'e2000000-0000-4000-a000-000000000b34', 2, 'Vereador', false),
  ('e2000000-0000-4000-b000-00000000700b', 'e2000000-0000-4000-a000-000000000b34', 3, 'Câmara Municipal', false),
  ('e2000000-0000-4000-b000-00000000700c', 'e2000000-0000-4000-a000-000000000b34', 4, 'Lei Orgânica', false),
  ('e2000000-0000-4000-b000-000000007012', 'e2000000-0000-4000-a000-000000000b35', 0, 'chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição', false),
  ('e2000000-0000-4000-b000-000000007013', 'e2000000-0000-4000-a000-000000000b35', 1, 'opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores', false),
  ('e2000000-0000-4000-b000-000000007014', 'e2000000-0000-4000-a000-000000000b35', 2, 'órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas', false),
  ('e2000000-0000-4000-b000-000000007015', 'e2000000-0000-4000-a000-000000000b35', 3, 'norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal', true),
  ('e2000000-0000-4000-b000-000000007016', 'e2000000-0000-4000-a000-000000000b35', 4, 'membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar', false),
  ('e2000000-0000-4000-b000-00000000701c', 'e2000000-0000-4000-a000-000000000b36', 0, 'opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores', false),
  ('e2000000-0000-4000-b000-00000000701d', 'e2000000-0000-4000-a000-000000000b36', 1, 'norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal', false),
  ('e2000000-0000-4000-b000-00000000701e', 'e2000000-0000-4000-a000-000000000b36', 2, 'órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas', true),
  ('e2000000-0000-4000-b000-00000000701f', 'e2000000-0000-4000-a000-000000000b36', 3, 'chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição', false),
  ('e2000000-0000-4000-b000-000000007020', 'e2000000-0000-4000-a000-000000000b36', 4, 'membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar', false),
  ('e2000000-0000-4000-b000-000000007026', 'e2000000-0000-4000-a000-000000000b37', 0, 'norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal', false),
  ('e2000000-0000-4000-b000-000000007027', 'e2000000-0000-4000-a000-000000000b37', 1, 'chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição', true),
  ('e2000000-0000-4000-b000-000000007028', 'e2000000-0000-4000-a000-000000000b37', 2, 'membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar', false),
  ('e2000000-0000-4000-b000-000000007029', 'e2000000-0000-4000-a000-000000000b37', 3, 'opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores', false),
  ('e2000000-0000-4000-b000-00000000702a', 'e2000000-0000-4000-a000-000000000b37', 4, 'órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas', false),
  ('e2000000-0000-4000-b000-000000007030', 'e2000000-0000-4000-a000-000000000b38', 0, 'chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição', false),
  ('e2000000-0000-4000-b000-000000007031', 'e2000000-0000-4000-a000-000000000b38', 1, 'opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores', false),
  ('e2000000-0000-4000-b000-000000007032', 'e2000000-0000-4000-a000-000000000b38', 2, 'norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal', false),
  ('e2000000-0000-4000-b000-000000007033', 'e2000000-0000-4000-a000-000000000b38', 3, 'órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas', false),
  ('e2000000-0000-4000-b000-000000007034', 'e2000000-0000-4000-a000-000000000b38', 4, 'membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar', true),
  ('e2000000-0000-4000-b000-00000000703a', 'e2000000-0000-4000-a000-000000000b39', 0, 'chefe do Poder Executivo municipal, eleito para mandato de quatro anos, com direito a uma reeleição', false),
  ('e2000000-0000-4000-b000-00000000703b', 'e2000000-0000-4000-a000-000000000b39', 1, 'opinião técnica sobre as contas do prefeito que só deixa de prevalecer pelo voto de dois terços dos vereadores', true),
  ('e2000000-0000-4000-b000-00000000703c', 'e2000000-0000-4000-a000-000000000b39', 2, 'norma que rege o município, votada em dois turnos, com intervalo mínimo de dez dias, e aprovada por dois terços da Câmara Municipal', false),
  ('e2000000-0000-4000-b000-00000000703d', 'e2000000-0000-4000-a000-000000000b39', 3, 'membro do Poder Legislativo municipal, com idade mínima de 18 anos para se candidatar', false),
  ('e2000000-0000-4000-b000-00000000703e', 'e2000000-0000-4000-a000-000000000b39', 4, 'órgão que exerce o controle externo da fiscalização do município, com o auxílio dos Tribunais de Contas', false),
  ('e2000000-0000-4000-b000-000000007044', 'e2000000-0000-4000-a000-000000000b3a', 0, 'Município', true),
  ('e2000000-0000-4000-b000-000000007045', 'e2000000-0000-4000-a000-000000000b3a', 1, 'Distrito Federal', false),
  ('e2000000-0000-4000-b000-000000007046', 'e2000000-0000-4000-a000-000000000b3a', 2, 'União, Estados e Municípios, em comum', false),
  ('e2000000-0000-4000-b000-000000007047', 'e2000000-0000-4000-a000-000000000b3a', 3, 'Estado', false),
  ('e2000000-0000-4000-b000-000000007048', 'e2000000-0000-4000-a000-000000000b3a', 4, 'União', false),
  ('e2000000-0000-4000-b000-00000000704e', 'e2000000-0000-4000-a000-000000000b3b', 0, 'Distrito Federal', false),
  ('e2000000-0000-4000-b000-00000000704f', 'e2000000-0000-4000-a000-000000000b3b', 1, 'Município', false),
  ('e2000000-0000-4000-b000-000000007050', 'e2000000-0000-4000-a000-000000000b3b', 2, 'União', true),
  ('e2000000-0000-4000-b000-000000007051', 'e2000000-0000-4000-a000-000000000b3b', 3, 'União, Estados e Municípios, em comum', false),
  ('e2000000-0000-4000-b000-000000007052', 'e2000000-0000-4000-a000-000000000b3b', 4, 'Estado', false),
  ('e2000000-0000-4000-b000-000000007058', 'e2000000-0000-4000-a000-000000000b3c', 0, 'Distrito Federal', false),
  ('e2000000-0000-4000-b000-000000007059', 'e2000000-0000-4000-a000-000000000b3c', 1, 'Estado', true),
  ('e2000000-0000-4000-b000-00000000705a', 'e2000000-0000-4000-a000-000000000b3c', 2, 'Município', false),
  ('e2000000-0000-4000-b000-00000000705b', 'e2000000-0000-4000-a000-000000000b3c', 3, 'União', false),
  ('e2000000-0000-4000-b000-00000000705c', 'e2000000-0000-4000-a000-000000000b3c', 4, 'União, Estados e Municípios, em comum', false),
  ('e2000000-0000-4000-b000-000000007062', 'e2000000-0000-4000-a000-000000000b3d', 0, 'União, Estados e Municípios, em comum', false),
  ('e2000000-0000-4000-b000-000000007063', 'e2000000-0000-4000-a000-000000000b3d', 1, 'Distrito Federal', true),
  ('e2000000-0000-4000-b000-000000007064', 'e2000000-0000-4000-a000-000000000b3d', 2, 'Município', false),
  ('e2000000-0000-4000-b000-000000007065', 'e2000000-0000-4000-a000-000000000b3d', 3, 'União', false),
  ('e2000000-0000-4000-b000-000000007066', 'e2000000-0000-4000-a000-000000000b3d', 4, 'Estado', false),
  ('e2000000-0000-4000-b000-00000000706c', 'e2000000-0000-4000-a000-000000000b3e', 0, 'ITBI', false),
  ('e2000000-0000-4000-b000-00000000706d', 'e2000000-0000-4000-a000-000000000b3e', 1, 'IR', false),
  ('e2000000-0000-4000-b000-00000000706e', 'e2000000-0000-4000-a000-000000000b3e', 2, 'IPVA', false),
  ('e2000000-0000-4000-b000-00000000706f', 'e2000000-0000-4000-a000-000000000b3e', 3, 'IPTU', true),
  ('e2000000-0000-4000-b000-000000007070', 'e2000000-0000-4000-a000-000000000b3e', 4, 'ISS', false),
  ('e2000000-0000-4000-b000-000000007076', 'e2000000-0000-4000-a000-000000000b3f', 0, 'ICMS', false),
  ('e2000000-0000-4000-b000-000000007077', 'e2000000-0000-4000-a000-000000000b3f', 1, 'ITR', false),
  ('e2000000-0000-4000-b000-000000007078', 'e2000000-0000-4000-a000-000000000b3f', 2, 'ITBI', false),
  ('e2000000-0000-4000-b000-000000007079', 'e2000000-0000-4000-a000-000000000b3f', 3, 'IPVA', false),
  ('e2000000-0000-4000-b000-00000000707a', 'e2000000-0000-4000-a000-000000000b3f', 4, 'ISS', true),
  ('e2000000-0000-4000-b000-000000007080', 'e2000000-0000-4000-a000-000000000b40', 0, 'ISS', false),
  ('e2000000-0000-4000-b000-000000007081', 'e2000000-0000-4000-a000-000000000b40', 1, 'ITR', false),
  ('e2000000-0000-4000-b000-000000007082', 'e2000000-0000-4000-a000-000000000b40', 2, 'ITBI', true),
  ('e2000000-0000-4000-b000-000000007083', 'e2000000-0000-4000-a000-000000000b40', 3, 'IPVA', false),
  ('e2000000-0000-4000-b000-000000007084', 'e2000000-0000-4000-a000-000000000b40', 4, 'IPTU', false),
  ('e2000000-0000-4000-b000-00000000708a', 'e2000000-0000-4000-a000-000000000b41', 0, 'ISS', false),
  ('e2000000-0000-4000-b000-00000000708b', 'e2000000-0000-4000-a000-000000000b41', 1, 'ITBI', false),
  ('e2000000-0000-4000-b000-00000000708c', 'e2000000-0000-4000-a000-000000000b41', 2, 'IPVA', true),
  ('e2000000-0000-4000-b000-00000000708d', 'e2000000-0000-4000-a000-000000000b41', 3, 'IR', false),
  ('e2000000-0000-4000-b000-00000000708e', 'e2000000-0000-4000-a000-000000000b41', 4, 'ICMS', false),
  ('e2000000-0000-4000-b000-000000007094', 'e2000000-0000-4000-a000-000000000b42', 0, 'ITBI', false),
  ('e2000000-0000-4000-b000-000000007095', 'e2000000-0000-4000-a000-000000000b42', 1, 'IPVA', false),
  ('e2000000-0000-4000-b000-000000007096', 'e2000000-0000-4000-a000-000000000b42', 2, 'ITR', false),
  ('e2000000-0000-4000-b000-000000007097', 'e2000000-0000-4000-a000-000000000b42', 3, 'ICMS', true),
  ('e2000000-0000-4000-b000-000000007098', 'e2000000-0000-4000-a000-000000000b42', 4, 'IR', false),
  ('e2000000-0000-4000-b000-00000000709e', 'e2000000-0000-4000-a000-000000000b43', 0, 'ISS', false),
  ('e2000000-0000-4000-b000-00000000709f', 'e2000000-0000-4000-a000-000000000b43', 1, 'IPTU', false),
  ('e2000000-0000-4000-b000-0000000070a0', 'e2000000-0000-4000-a000-000000000b43', 2, 'ITBI', false),
  ('e2000000-0000-4000-b000-0000000070a1', 'e2000000-0000-4000-a000-000000000b43', 3, 'IR', true),
  ('e2000000-0000-4000-b000-0000000070a2', 'e2000000-0000-4000-a000-000000000b43', 4, 'ICMS', false),
  ('e2000000-0000-4000-b000-0000000070a8', 'e2000000-0000-4000-a000-000000000b44', 0, 'ITBI', false),
  ('e2000000-0000-4000-b000-0000000070a9', 'e2000000-0000-4000-a000-000000000b44', 1, 'IR', false),
  ('e2000000-0000-4000-b000-0000000070aa', 'e2000000-0000-4000-a000-000000000b44', 2, 'IPTU', false),
  ('e2000000-0000-4000-b000-0000000070ab', 'e2000000-0000-4000-a000-000000000b44', 3, 'ITR', true),
  ('e2000000-0000-4000-b000-0000000070ac', 'e2000000-0000-4000-a000-000000000b44', 4, 'IPVA', false),
  ('e2000000-0000-4000-b000-0000000070b2', 'e2000000-0000-4000-a000-000000000b45', 0, 'imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos', false),
  ('e2000000-0000-4000-b000-0000000070b3', 'e2000000-0000-4000-a000-000000000b45', 1, 'imposto estadual sobre a propriedade de veículos automotores', false),
  ('e2000000-0000-4000-b000-0000000070b4', 'e2000000-0000-4000-a000-000000000b45', 2, 'imposto estadual sobre circulação de mercadorias e alguns serviços', false),
  ('e2000000-0000-4000-b000-0000000070b5', 'e2000000-0000-4000-a000-000000000b45', 3, 'imposto municipal sobre a propriedade predial e territorial urbana', true),
  ('e2000000-0000-4000-b000-0000000070b6', 'e2000000-0000-4000-a000-000000000b45', 4, 'imposto municipal sobre serviços de qualquer natureza', false),
  ('e2000000-0000-4000-b000-0000000070bc', 'e2000000-0000-4000-a000-000000000b46', 0, 'imposto federal sobre a renda e proventos de qualquer natureza', false),
  ('e2000000-0000-4000-b000-0000000070bd', 'e2000000-0000-4000-a000-000000000b46', 1, 'imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos', false),
  ('e2000000-0000-4000-b000-0000000070be', 'e2000000-0000-4000-a000-000000000b46', 2, 'imposto estadual sobre a propriedade de veículos automotores', false),
  ('e2000000-0000-4000-b000-0000000070bf', 'e2000000-0000-4000-a000-000000000b46', 3, 'imposto municipal sobre serviços de qualquer natureza', true),
  ('e2000000-0000-4000-b000-0000000070c0', 'e2000000-0000-4000-a000-000000000b46', 4, 'imposto municipal sobre a propriedade predial e territorial urbana', false),
  ('e2000000-0000-4000-b000-0000000070c6', 'e2000000-0000-4000-a000-000000000b47', 0, 'imposto municipal sobre serviços de qualquer natureza', false),
  ('e2000000-0000-4000-b000-0000000070c7', 'e2000000-0000-4000-a000-000000000b47', 1, 'imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos', true),
  ('e2000000-0000-4000-b000-0000000070c8', 'e2000000-0000-4000-a000-000000000b47', 2, 'imposto federal sobre a propriedade territorial rural', false),
  ('e2000000-0000-4000-b000-0000000070c9', 'e2000000-0000-4000-a000-000000000b47', 3, 'imposto estadual sobre circulação de mercadorias e alguns serviços', false),
  ('e2000000-0000-4000-b000-0000000070ca', 'e2000000-0000-4000-a000-000000000b47', 4, 'imposto federal sobre a renda e proventos de qualquer natureza', false),
  ('e2000000-0000-4000-b000-0000000070d0', 'e2000000-0000-4000-a000-000000000b48', 0, 'imposto federal sobre a propriedade territorial rural', false),
  ('e2000000-0000-4000-b000-0000000070d1', 'e2000000-0000-4000-a000-000000000b48', 1, 'imposto estadual sobre circulação de mercadorias e alguns serviços', false),
  ('e2000000-0000-4000-b000-0000000070d2', 'e2000000-0000-4000-a000-000000000b48', 2, 'imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos', false),
  ('e2000000-0000-4000-b000-0000000070d3', 'e2000000-0000-4000-a000-000000000b48', 3, 'imposto municipal sobre serviços de qualquer natureza', false),
  ('e2000000-0000-4000-b000-0000000070d4', 'e2000000-0000-4000-a000-000000000b48', 4, 'imposto estadual sobre a propriedade de veículos automotores', true),
  ('e2000000-0000-4000-b000-0000000070da', 'e2000000-0000-4000-a000-000000000b49', 0, 'imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos', false),
  ('e2000000-0000-4000-b000-0000000070db', 'e2000000-0000-4000-a000-000000000b49', 1, 'imposto municipal sobre a propriedade predial e territorial urbana', false),
  ('e2000000-0000-4000-b000-0000000070dc', 'e2000000-0000-4000-a000-000000000b49', 2, 'imposto estadual sobre a propriedade de veículos automotores', false),
  ('e2000000-0000-4000-b000-0000000070dd', 'e2000000-0000-4000-a000-000000000b49', 3, 'imposto federal sobre a renda e proventos de qualquer natureza', false),
  ('e2000000-0000-4000-b000-0000000070de', 'e2000000-0000-4000-a000-000000000b49', 4, 'imposto estadual sobre circulação de mercadorias e alguns serviços', true),
  ('e2000000-0000-4000-b000-0000000070e4', 'e2000000-0000-4000-a000-000000000b4a', 0, 'imposto municipal sobre serviços de qualquer natureza', false),
  ('e2000000-0000-4000-b000-0000000070e5', 'e2000000-0000-4000-a000-000000000b4a', 1, 'imposto municipal sobre a transmissão onerosa de bens imóveis entre vivos', false),
  ('e2000000-0000-4000-b000-0000000070e6', 'e2000000-0000-4000-a000-000000000b4a', 2, 'imposto federal sobre a renda e proventos de qualquer natureza', true),
  ('e2000000-0000-4000-b000-0000000070e7', 'e2000000-0000-4000-a000-000000000b4a', 3, 'imposto estadual sobre a propriedade de veículos automotores', false),
  ('e2000000-0000-4000-b000-0000000070e8', 'e2000000-0000-4000-a000-000000000b4a', 4, 'imposto municipal sobre a propriedade predial e territorial urbana', false),
  ('e2000000-0000-4000-b000-0000000070ee', 'e2000000-0000-4000-a000-000000000b4b', 0, 'imposto estadual sobre a propriedade de veículos automotores', false),
  ('e2000000-0000-4000-b000-0000000070ef', 'e2000000-0000-4000-a000-000000000b4b', 1, 'imposto municipal sobre a propriedade predial e territorial urbana', false),
  ('e2000000-0000-4000-b000-0000000070f0', 'e2000000-0000-4000-a000-000000000b4b', 2, 'imposto federal sobre a renda e proventos de qualquer natureza', false),
  ('e2000000-0000-4000-b000-0000000070f1', 'e2000000-0000-4000-a000-000000000b4b', 3, 'imposto federal sobre a propriedade territorial rural', true),
  ('e2000000-0000-4000-b000-0000000070f2', 'e2000000-0000-4000-a000-000000000b4b', 4, 'imposto estadual sobre circulação de mercadorias e alguns serviços', false),
  ('e2000000-0000-4000-b000-0000000070f8', 'e2000000-0000-4000-a000-000000000b4c', 0, '18 anos', true),
  ('e2000000-0000-4000-b000-0000000070f9', 'e2000000-0000-4000-a000-000000000b4c', 1, '21 anos', false),
  ('e2000000-0000-4000-b000-0000000070fa', 'e2000000-0000-4000-a000-000000000b4c', 2, '25 anos', false),
  ('e2000000-0000-4000-b000-0000000070fb', 'e2000000-0000-4000-a000-000000000b4c', 3, '30 anos', false),
  ('e2000000-0000-4000-b000-0000000070fc', 'e2000000-0000-4000-a000-000000000b4c', 4, '35 anos', false),
  ('e2000000-0000-4000-b000-000000007102', 'e2000000-0000-4000-a000-000000000b4d', 0, '21 anos', true),
  ('e2000000-0000-4000-b000-000000007103', 'e2000000-0000-4000-a000-000000000b4d', 1, '35 anos', false),
  ('e2000000-0000-4000-b000-000000007104', 'e2000000-0000-4000-a000-000000000b4d', 2, '16 anos', false),
  ('e2000000-0000-4000-b000-000000007105', 'e2000000-0000-4000-a000-000000000b4d', 3, '18 anos', false),
  ('e2000000-0000-4000-b000-000000007106', 'e2000000-0000-4000-a000-000000000b4d', 4, '30 anos', false),
  ('e2000000-0000-4000-b000-00000000710c', 'e2000000-0000-4000-a000-000000000b4e', 0, '21 anos', false),
  ('e2000000-0000-4000-b000-00000000710d', 'e2000000-0000-4000-a000-000000000b4e', 1, '16 anos', false),
  ('e2000000-0000-4000-b000-00000000710e', 'e2000000-0000-4000-a000-000000000b4e', 2, '35 anos', false),
  ('e2000000-0000-4000-b000-00000000710f', 'e2000000-0000-4000-a000-000000000b4e', 3, '30 anos', true),
  ('e2000000-0000-4000-b000-000000007110', 'e2000000-0000-4000-a000-000000000b4e', 4, '18 anos', false),
  ('e2000000-0000-4000-b000-000000007116', 'e2000000-0000-4000-a000-000000000b4f', 0, '35 anos', true),
  ('e2000000-0000-4000-b000-000000007117', 'e2000000-0000-4000-a000-000000000b4f', 1, '30 anos', false),
  ('e2000000-0000-4000-b000-000000007118', 'e2000000-0000-4000-a000-000000000b4f', 2, '21 anos', false),
  ('e2000000-0000-4000-b000-000000007119', 'e2000000-0000-4000-a000-000000000b4f', 3, '18 anos', false),
  ('e2000000-0000-4000-b000-00000000711a', 'e2000000-0000-4000-a000-000000000b4f', 4, '25 anos', false),
  ('e2000000-0000-4000-b000-000000007120', 'e2000000-0000-4000-a000-000000000b50', 0, 'Acumulação de cargos', false),
  ('e2000000-0000-4000-b000-000000007121', 'e2000000-0000-4000-a000-000000000b50', 1, 'Cargo em comissão', false),
  ('e2000000-0000-4000-b000-000000007122', 'e2000000-0000-4000-a000-000000000b50', 2, 'Função de confiança', false),
  ('e2000000-0000-4000-b000-000000007123', 'e2000000-0000-4000-a000-000000000b50', 3, 'Estabilidade', true),
  ('e2000000-0000-4000-b000-000000007124', 'e2000000-0000-4000-a000-000000000b50', 4, 'Validade do concurso', false),
  ('e2000000-0000-4000-b000-00000000712a', 'e2000000-0000-4000-a000-000000000b51', 0, 'Acumulação de cargos', false),
  ('e2000000-0000-4000-b000-00000000712b', 'e2000000-0000-4000-a000-000000000b51', 1, 'Estabilidade', false),
  ('e2000000-0000-4000-b000-00000000712c', 'e2000000-0000-4000-a000-000000000b51', 2, 'Função de confiança', false),
  ('e2000000-0000-4000-b000-00000000712d', 'e2000000-0000-4000-a000-000000000b51', 3, 'Validade do concurso', true),
  ('e2000000-0000-4000-b000-00000000712e', 'e2000000-0000-4000-a000-000000000b51', 4, 'Cargo em comissão', false),
  ('e2000000-0000-4000-b000-000000007134', 'e2000000-0000-4000-a000-000000000b52', 0, 'Acumulação de cargos', true),
  ('e2000000-0000-4000-b000-000000007135', 'e2000000-0000-4000-a000-000000000b52', 1, 'Cargo em comissão', false),
  ('e2000000-0000-4000-b000-000000007136', 'e2000000-0000-4000-a000-000000000b52', 2, 'Função de confiança', false),
  ('e2000000-0000-4000-b000-000000007137', 'e2000000-0000-4000-a000-000000000b52', 3, 'Estabilidade', false),
  ('e2000000-0000-4000-b000-000000007138', 'e2000000-0000-4000-a000-000000000b52', 4, 'Validade do concurso', false),
  ('e2000000-0000-4000-b000-00000000713e', 'e2000000-0000-4000-a000-000000000b53', 0, 'Validade do concurso', false),
  ('e2000000-0000-4000-b000-00000000713f', 'e2000000-0000-4000-a000-000000000b53', 1, 'Cargo em comissão', true),
  ('e2000000-0000-4000-b000-000000007140', 'e2000000-0000-4000-a000-000000000b53', 2, 'Acumulação de cargos', false),
  ('e2000000-0000-4000-b000-000000007141', 'e2000000-0000-4000-a000-000000000b53', 3, 'Função de confiança', false),
  ('e2000000-0000-4000-b000-000000007142', 'e2000000-0000-4000-a000-000000000b53', 4, 'Estabilidade', false),
  ('e2000000-0000-4000-b000-000000007148', 'e2000000-0000-4000-a000-000000000b54', 0, 'Acumulação de cargos', false),
  ('e2000000-0000-4000-b000-000000007149', 'e2000000-0000-4000-a000-000000000b54', 1, 'Estabilidade', false),
  ('e2000000-0000-4000-b000-00000000714a', 'e2000000-0000-4000-a000-000000000b54', 2, 'Função de confiança', true),
  ('e2000000-0000-4000-b000-00000000714b', 'e2000000-0000-4000-a000-000000000b54', 3, 'Validade do concurso', false),
  ('e2000000-0000-4000-b000-00000000714c', 'e2000000-0000-4000-a000-000000000b54', 4, 'Cargo em comissão', false),
  ('e2000000-0000-4000-b000-000000007152', 'e2000000-0000-4000-a000-000000000b55', 0, 'exercida exclusivamente por servidores ocupantes de cargo efetivo', false),
  ('e2000000-0000-4000-b000-000000007153', 'e2000000-0000-4000-a000-000000000b55', 1, 'adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho', true),
  ('e2000000-0000-4000-b000-000000007154', 'e2000000-0000-4000-a000-000000000b55', 2, 'prazo de até dois anos, prorrogável uma vez por igual período', false),
  ('e2000000-0000-4000-b000-000000007155', 'e2000000-0000-4000-a000-000000000b55', 3, 'cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento', false),
  ('e2000000-0000-4000-b000-000000007156', 'e2000000-0000-4000-a000-000000000b55', 4, 'permitida, havendo compatibilidade de horários, para dois cargos de professor', false),
  ('e2000000-0000-4000-b000-00000000715c', 'e2000000-0000-4000-a000-000000000b56', 0, 'permitida, havendo compatibilidade de horários, para dois cargos de professor', false),
  ('e2000000-0000-4000-b000-00000000715d', 'e2000000-0000-4000-a000-000000000b56', 1, 'cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento', false),
  ('e2000000-0000-4000-b000-00000000715e', 'e2000000-0000-4000-a000-000000000b56', 2, 'adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho', false),
  ('e2000000-0000-4000-b000-00000000715f', 'e2000000-0000-4000-a000-000000000b56', 3, 'exercida exclusivamente por servidores ocupantes de cargo efetivo', false),
  ('e2000000-0000-4000-b000-000000007160', 'e2000000-0000-4000-a000-000000000b56', 4, 'prazo de até dois anos, prorrogável uma vez por igual período', true),
  ('e2000000-0000-4000-b000-000000007166', 'e2000000-0000-4000-a000-000000000b57', 0, 'permitida, havendo compatibilidade de horários, para dois cargos de professor', true),
  ('e2000000-0000-4000-b000-000000007167', 'e2000000-0000-4000-a000-000000000b57', 1, 'exercida exclusivamente por servidores ocupantes de cargo efetivo', false),
  ('e2000000-0000-4000-b000-000000007168', 'e2000000-0000-4000-a000-000000000b57', 2, 'cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento', false),
  ('e2000000-0000-4000-b000-000000007169', 'e2000000-0000-4000-a000-000000000b57', 3, 'prazo de até dois anos, prorrogável uma vez por igual período', false),
  ('e2000000-0000-4000-b000-00000000716a', 'e2000000-0000-4000-a000-000000000b57', 4, 'adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho', false),
  ('e2000000-0000-4000-b000-000000007170', 'e2000000-0000-4000-a000-000000000b58', 0, 'permitida, havendo compatibilidade de horários, para dois cargos de professor', false),
  ('e2000000-0000-4000-b000-000000007171', 'e2000000-0000-4000-a000-000000000b58', 1, 'prazo de até dois anos, prorrogável uma vez por igual período', false),
  ('e2000000-0000-4000-b000-000000007172', 'e2000000-0000-4000-a000-000000000b58', 2, 'cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento', true),
  ('e2000000-0000-4000-b000-000000007173', 'e2000000-0000-4000-a000-000000000b58', 3, 'adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho', false),
  ('e2000000-0000-4000-b000-000000007174', 'e2000000-0000-4000-a000-000000000b58', 4, 'exercida exclusivamente por servidores ocupantes de cargo efetivo', false),
  ('e2000000-0000-4000-b000-00000000717a', 'e2000000-0000-4000-a000-000000000b59', 0, 'exercida exclusivamente por servidores ocupantes de cargo efetivo', true),
  ('e2000000-0000-4000-b000-00000000717b', 'e2000000-0000-4000-a000-000000000b59', 1, 'prazo de até dois anos, prorrogável uma vez por igual período', false),
  ('e2000000-0000-4000-b000-00000000717c', 'e2000000-0000-4000-a000-000000000b59', 2, 'permitida, havendo compatibilidade de horários, para dois cargos de professor', false),
  ('e2000000-0000-4000-b000-00000000717d', 'e2000000-0000-4000-a000-000000000b59', 3, 'adquirida pelo servidor nomeado em concurso após três anos de efetivo exercício e avaliação de desempenho', false),
  ('e2000000-0000-4000-b000-00000000717e', 'e2000000-0000-4000-a000-000000000b59', 4, 'cargo de livre nomeação e exoneração, destinado a direção, chefia e assessoramento', false),
  ('e2000000-0000-4000-b000-000000007184', 'e2000000-0000-4000-a000-000000000b5a', 0, 'Prejuízo ao erário', false),
  ('e2000000-0000-4000-b000-000000007185', 'e2000000-0000-4000-a000-000000000b5a', 1, 'Enriquecimento ilícito', true),
  ('e2000000-0000-4000-b000-000000007186', 'e2000000-0000-4000-a000-000000000b5a', 2, 'Infração disciplinar leve', false),
  ('e2000000-0000-4000-b000-000000007187', 'e2000000-0000-4000-a000-000000000b5a', 3, 'Atentado aos princípios da administração', false),
  ('e2000000-0000-4000-b000-000000007188', 'e2000000-0000-4000-a000-000000000b5a', 4, 'Abuso de poder econômico', false),
  ('e2000000-0000-4000-b000-00000000718e', 'e2000000-0000-4000-a000-000000000b5b', 0, 'Abuso de poder econômico', false),
  ('e2000000-0000-4000-b000-00000000718f', 'e2000000-0000-4000-a000-000000000b5b', 1, 'Enriquecimento ilícito', false),
  ('e2000000-0000-4000-b000-000000007190', 'e2000000-0000-4000-a000-000000000b5b', 2, 'Crime de responsabilidade', false),
  ('e2000000-0000-4000-b000-000000007191', 'e2000000-0000-4000-a000-000000000b5b', 3, 'Prejuízo ao erário', true),
  ('e2000000-0000-4000-b000-000000007192', 'e2000000-0000-4000-a000-000000000b5b', 4, 'Atentado aos princípios da administração', false),
  ('e2000000-0000-4000-b000-000000007198', 'e2000000-0000-4000-a000-000000000b5c', 0, 'Enriquecimento ilícito', false),
  ('e2000000-0000-4000-b000-000000007199', 'e2000000-0000-4000-a000-000000000b5c', 1, 'Crime de responsabilidade', false),
  ('e2000000-0000-4000-b000-00000000719a', 'e2000000-0000-4000-a000-000000000b5c', 2, 'Prejuízo ao erário', false),
  ('e2000000-0000-4000-b000-00000000719b', 'e2000000-0000-4000-a000-000000000b5c', 3, 'Abuso de poder econômico', false),
  ('e2000000-0000-4000-b000-00000000719c', 'e2000000-0000-4000-a000-000000000b5c', 4, 'Atentado aos princípios da administração', true),
  ('e2000000-0000-4000-b000-0000000071a2', 'e2000000-0000-4000-a000-000000000b5d', 0, 'Pregão', true),
  ('e2000000-0000-4000-b000-0000000071a3', 'e2000000-0000-4000-a000-000000000b5d', 1, 'Leilão', false),
  ('e2000000-0000-4000-b000-0000000071a4', 'e2000000-0000-4000-a000-000000000b5d', 2, 'Concorrência', false),
  ('e2000000-0000-4000-b000-0000000071a5', 'e2000000-0000-4000-a000-000000000b5d', 3, 'Diálogo competitivo', false),
  ('e2000000-0000-4000-b000-0000000071a6', 'e2000000-0000-4000-a000-000000000b5d', 4, 'Concurso', false),
  ('e2000000-0000-4000-b000-0000000071ac', 'e2000000-0000-4000-a000-000000000b5e', 0, 'Leilão', false),
  ('e2000000-0000-4000-b000-0000000071ad', 'e2000000-0000-4000-a000-000000000b5e', 1, 'Concurso', false),
  ('e2000000-0000-4000-b000-0000000071ae', 'e2000000-0000-4000-a000-000000000b5e', 2, 'Pregão', false),
  ('e2000000-0000-4000-b000-0000000071af', 'e2000000-0000-4000-a000-000000000b5e', 3, 'Diálogo competitivo', false),
  ('e2000000-0000-4000-b000-0000000071b0', 'e2000000-0000-4000-a000-000000000b5e', 4, 'Concorrência', true),
  ('e2000000-0000-4000-b000-0000000071b6', 'e2000000-0000-4000-a000-000000000b5f', 0, 'Pregão', false),
  ('e2000000-0000-4000-b000-0000000071b7', 'e2000000-0000-4000-a000-000000000b5f', 1, 'Diálogo competitivo', false),
  ('e2000000-0000-4000-b000-0000000071b8', 'e2000000-0000-4000-a000-000000000b5f', 2, 'Concurso', true),
  ('e2000000-0000-4000-b000-0000000071b9', 'e2000000-0000-4000-a000-000000000b5f', 3, 'Leilão', false),
  ('e2000000-0000-4000-b000-0000000071ba', 'e2000000-0000-4000-a000-000000000b5f', 4, 'Concorrência', false),
  ('e2000000-0000-4000-b000-0000000071c0', 'e2000000-0000-4000-a000-000000000b60', 0, 'Concorrência', false),
  ('e2000000-0000-4000-b000-0000000071c1', 'e2000000-0000-4000-a000-000000000b60', 1, 'Leilão', true),
  ('e2000000-0000-4000-b000-0000000071c2', 'e2000000-0000-4000-a000-000000000b60', 2, 'Diálogo competitivo', false),
  ('e2000000-0000-4000-b000-0000000071c3', 'e2000000-0000-4000-a000-000000000b60', 3, 'Concurso', false),
  ('e2000000-0000-4000-b000-0000000071c4', 'e2000000-0000-4000-a000-000000000b60', 4, 'Pregão', false),
  ('e2000000-0000-4000-b000-0000000071ca', 'e2000000-0000-4000-a000-000000000b61', 0, 'Pregão', false),
  ('e2000000-0000-4000-b000-0000000071cb', 'e2000000-0000-4000-a000-000000000b61', 1, 'Concurso', false),
  ('e2000000-0000-4000-b000-0000000071cc', 'e2000000-0000-4000-a000-000000000b61', 2, 'Concorrência', false),
  ('e2000000-0000-4000-b000-0000000071cd', 'e2000000-0000-4000-a000-000000000b61', 3, 'Diálogo competitivo', true),
  ('e2000000-0000-4000-b000-0000000071ce', 'e2000000-0000-4000-a000-000000000b61', 4, 'Leilão', false),
  ('e2000000-0000-4000-b000-0000000071d4', 'e2000000-0000-4000-a000-000000000b62', 0, 'modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor', false),
  ('e2000000-0000-4000-b000-0000000071d5', 'e2000000-0000-4000-a000-000000000b62', 1, 'modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto', true),
  ('e2000000-0000-4000-b000-0000000071d6', 'e2000000-0000-4000-a000-000000000b62', 2, 'modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance', false),
  ('e2000000-0000-4000-b000-0000000071d7', 'e2000000-0000-4000-a000-000000000b62', 3, 'modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções', false),
  ('e2000000-0000-4000-b000-0000000071d8', 'e2000000-0000-4000-a000-000000000b62', 4, 'modalidade para obras, serviços especiais e de engenharia e bens especiais', false),
  ('e2000000-0000-4000-b000-0000000071de', 'e2000000-0000-4000-a000-000000000b63', 0, 'modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance', false),
  ('e2000000-0000-4000-b000-0000000071df', 'e2000000-0000-4000-a000-000000000b63', 1, 'modalidade para obras, serviços especiais e de engenharia e bens especiais', true),
  ('e2000000-0000-4000-b000-0000000071e0', 'e2000000-0000-4000-a000-000000000b63', 2, 'modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções', false),
  ('e2000000-0000-4000-b000-0000000071e1', 'e2000000-0000-4000-a000-000000000b63', 3, 'modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto', false),
  ('e2000000-0000-4000-b000-0000000071e2', 'e2000000-0000-4000-a000-000000000b63', 4, 'modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor', false),
  ('e2000000-0000-4000-b000-0000000071e8', 'e2000000-0000-4000-a000-000000000b64', 0, 'modalidade para obras, serviços especiais e de engenharia e bens especiais', false),
  ('e2000000-0000-4000-b000-0000000071e9', 'e2000000-0000-4000-a000-000000000b64', 1, 'modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto', false),
  ('e2000000-0000-4000-b000-0000000071ea', 'e2000000-0000-4000-a000-000000000b64', 2, 'modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções', false),
  ('e2000000-0000-4000-b000-0000000071eb', 'e2000000-0000-4000-a000-000000000b64', 3, 'modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor', true),
  ('e2000000-0000-4000-b000-0000000071ec', 'e2000000-0000-4000-a000-000000000b64', 4, 'modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance', false),
  ('e2000000-0000-4000-b000-0000000071f2', 'e2000000-0000-4000-a000-000000000b65', 0, 'modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções', false),
  ('e2000000-0000-4000-b000-0000000071f3', 'e2000000-0000-4000-a000-000000000b65', 1, 'modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor', false),
  ('e2000000-0000-4000-b000-0000000071f4', 'e2000000-0000-4000-a000-000000000b65', 2, 'modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto', false),
  ('e2000000-0000-4000-b000-0000000071f5', 'e2000000-0000-4000-a000-000000000b65', 3, 'modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance', true),
  ('e2000000-0000-4000-b000-0000000071f6', 'e2000000-0000-4000-a000-000000000b65', 4, 'modalidade para obras, serviços especiais e de engenharia e bens especiais', false),
  ('e2000000-0000-4000-b000-0000000071fc', 'e2000000-0000-4000-a000-000000000b66', 0, 'modalidade para escolha de trabalho técnico, científico ou artístico, com prêmio ao vencedor', false),
  ('e2000000-0000-4000-b000-0000000071fd', 'e2000000-0000-4000-a000-000000000b66', 1, 'modalidade obrigatória para bens e serviços comuns, com critério de menor preço ou maior desconto', false),
  ('e2000000-0000-4000-b000-0000000071fe', 'e2000000-0000-4000-a000-000000000b66', 2, 'modalidade para alienação de imóveis ou de bens móveis inservíveis ou apreendidos, a quem oferecer o maior lance', false),
  ('e2000000-0000-4000-b000-0000000071ff', 'e2000000-0000-4000-a000-000000000b66', 3, 'modalidade para obras, serviços especiais e de engenharia e bens especiais', false),
  ('e2000000-0000-4000-b000-000000007200', 'e2000000-0000-4000-a000-000000000b66', 4, 'modalidade em que a administração dialoga com licitantes previamente selecionados para desenvolver soluções', true),
  ('e2000000-0000-4000-b000-000000007206', 'e2000000-0000-4000-a000-000000000b67', 0, 'Lei 8.080/1990', true),
  ('e2000000-0000-4000-b000-000000007207', 'e2000000-0000-4000-a000-000000000b67', 1, 'Lei 8.069/1990', false),
  ('e2000000-0000-4000-b000-000000007208', 'e2000000-0000-4000-a000-000000000b67', 2, 'Lei 8.429/1992', false),
  ('e2000000-0000-4000-b000-000000007209', 'e2000000-0000-4000-a000-000000000b67', 3, 'Lei 9.394/1996', false),
  ('e2000000-0000-4000-b000-00000000720a', 'e2000000-0000-4000-a000-000000000b67', 4, 'Lei 14.133/2021', false),
  ('e2000000-0000-4000-b000-000000007210', 'e2000000-0000-4000-a000-000000000b68', 0, 'Lei Complementar 101/2000', false),
  ('e2000000-0000-4000-b000-000000007211', 'e2000000-0000-4000-a000-000000000b68', 1, 'Lei 8.080/1990', false),
  ('e2000000-0000-4000-b000-000000007212', 'e2000000-0000-4000-a000-000000000b68', 2, 'Lei 9.394/1996', false),
  ('e2000000-0000-4000-b000-000000007213', 'e2000000-0000-4000-a000-000000000b68', 3, 'Lei 10.741/2003', false),
  ('e2000000-0000-4000-b000-000000007214', 'e2000000-0000-4000-a000-000000000b68', 4, 'Lei 8.069/1990', true),
  ('e2000000-0000-4000-b000-00000000721a', 'e2000000-0000-4000-a000-000000000b69', 0, 'Lei 8.069/1990', false),
  ('e2000000-0000-4000-b000-00000000721b', 'e2000000-0000-4000-a000-000000000b69', 1, 'Lei 9.394/1996', true),
  ('e2000000-0000-4000-b000-00000000721c', 'e2000000-0000-4000-a000-000000000b69', 2, 'Lei 13.709/2018', false),
  ('e2000000-0000-4000-b000-00000000721d', 'e2000000-0000-4000-a000-000000000b69', 3, 'Lei 14.133/2021', false),
  ('e2000000-0000-4000-b000-00000000721e', 'e2000000-0000-4000-a000-000000000b69', 4, 'Lei 12.527/2011', false),
  ('e2000000-0000-4000-b000-000000007224', 'e2000000-0000-4000-a000-000000000b6a', 0, 'Lei 10.741/2003', true),
  ('e2000000-0000-4000-b000-000000007225', 'e2000000-0000-4000-a000-000000000b6a', 1, 'Lei 9.394/1996', false),
  ('e2000000-0000-4000-b000-000000007226', 'e2000000-0000-4000-a000-000000000b6a', 2, 'Lei 8.429/1992', false),
  ('e2000000-0000-4000-b000-000000007227', 'e2000000-0000-4000-a000-000000000b6a', 3, 'Lei 8.080/1990', false),
  ('e2000000-0000-4000-b000-000000007228', 'e2000000-0000-4000-a000-000000000b6a', 4, 'Lei 8.069/1990', false),
  ('e2000000-0000-4000-b000-00000000722e', 'e2000000-0000-4000-a000-000000000b6b', 0, 'Lei 8.080/1990', false),
  ('e2000000-0000-4000-b000-00000000722f', 'e2000000-0000-4000-a000-000000000b6b', 1, 'Lei Complementar 101/2000', false),
  ('e2000000-0000-4000-b000-000000007230', 'e2000000-0000-4000-a000-000000000b6b', 2, 'Lei 10.741/2003', false),
  ('e2000000-0000-4000-b000-000000007231', 'e2000000-0000-4000-a000-000000000b6b', 3, 'Lei 12.527/2011', true),
  ('e2000000-0000-4000-b000-000000007232', 'e2000000-0000-4000-a000-000000000b6b', 4, 'Lei 9.394/1996', false),
  ('e2000000-0000-4000-b000-000000007238', 'e2000000-0000-4000-a000-000000000b6c', 0, 'Lei 12.527/2011', false),
  ('e2000000-0000-4000-b000-000000007239', 'e2000000-0000-4000-a000-000000000b6c', 1, 'Lei Complementar 101/2000', true),
  ('e2000000-0000-4000-b000-00000000723a', 'e2000000-0000-4000-a000-000000000b6c', 2, 'Lei 8.069/1990', false),
  ('e2000000-0000-4000-b000-00000000723b', 'e2000000-0000-4000-a000-000000000b6c', 3, 'Lei 9.394/1996', false),
  ('e2000000-0000-4000-b000-00000000723c', 'e2000000-0000-4000-a000-000000000b6c', 4, 'Lei 10.741/2003', false),
  ('e2000000-0000-4000-b000-000000007242', 'e2000000-0000-4000-a000-000000000b6d', 0, 'Lei 12.527/2011', false),
  ('e2000000-0000-4000-b000-000000007243', 'e2000000-0000-4000-a000-000000000b6d', 1, 'Lei 9.394/1996', false),
  ('e2000000-0000-4000-b000-000000007244', 'e2000000-0000-4000-a000-000000000b6d', 2, 'Lei 8.429/1992', false),
  ('e2000000-0000-4000-b000-000000007245', 'e2000000-0000-4000-a000-000000000b6d', 3, 'Lei 14.133/2021', true),
  ('e2000000-0000-4000-b000-000000007246', 'e2000000-0000-4000-a000-000000000b6d', 4, 'Lei 8.069/1990', false),
  ('e2000000-0000-4000-b000-00000000724c', 'e2000000-0000-4000-a000-000000000b6e', 0, 'Lei 14.133/2021', false),
  ('e2000000-0000-4000-b000-00000000724d', 'e2000000-0000-4000-a000-000000000b6e', 1, 'Lei 8.429/1992', true),
  ('e2000000-0000-4000-b000-00000000724e', 'e2000000-0000-4000-a000-000000000b6e', 2, 'Lei 10.741/2003', false),
  ('e2000000-0000-4000-b000-00000000724f', 'e2000000-0000-4000-a000-000000000b6e', 3, 'Lei 8.069/1990', false),
  ('e2000000-0000-4000-b000-000000007250', 'e2000000-0000-4000-a000-000000000b6e', 4, 'Lei 9.394/1996', false),
  ('e2000000-0000-4000-b000-000000007256', 'e2000000-0000-4000-a000-000000000b6f', 0, 'Lei 13.709/2018', true),
  ('e2000000-0000-4000-b000-000000007257', 'e2000000-0000-4000-a000-000000000b6f', 1, 'Lei Complementar 101/2000', false),
  ('e2000000-0000-4000-b000-000000007258', 'e2000000-0000-4000-a000-000000000b6f', 2, 'Lei 14.133/2021', false),
  ('e2000000-0000-4000-b000-000000007259', 'e2000000-0000-4000-a000-000000000b6f', 3, 'Lei 8.429/1992', false),
  ('e2000000-0000-4000-b000-00000000725a', 'e2000000-0000-4000-a000-000000000b6f', 4, 'Lei 9.394/1996', false),
  ('e2000000-0000-4000-b000-000000007260', 'e2000000-0000-4000-a000-000000000b70', 0, 'Lei de Licitações e Contratos Administrativos', false),
  ('e2000000-0000-4000-b000-000000007261', 'e2000000-0000-4000-a000-000000000b70', 1, 'Lei de Responsabilidade Fiscal', false),
  ('e2000000-0000-4000-b000-000000007262', 'e2000000-0000-4000-a000-000000000b70', 2, 'Lei Orgânica da Saúde, que organiza o SUS', true),
  ('e2000000-0000-4000-b000-000000007263', 'e2000000-0000-4000-a000-000000000b70', 3, 'Lei de Acesso à Informação', false),
  ('e2000000-0000-4000-b000-000000007264', 'e2000000-0000-4000-a000-000000000b70', 4, 'Lei de Improbidade Administrativa', false),
  ('e2000000-0000-4000-b000-00000000726a', 'e2000000-0000-4000-a000-000000000b71', 0, 'Lei Geral de Proteção de Dados Pessoais (LGPD)', false),
  ('e2000000-0000-4000-b000-00000000726b', 'e2000000-0000-4000-a000-000000000b71', 1, 'Estatuto da Pessoa Idosa', false),
  ('e2000000-0000-4000-b000-00000000726c', 'e2000000-0000-4000-a000-000000000b71', 2, 'Lei Orgânica da Saúde, que organiza o SUS', false),
  ('e2000000-0000-4000-b000-00000000726d', 'e2000000-0000-4000-a000-000000000b71', 3, 'Estatuto da Criança e do Adolescente (ECA)', true),
  ('e2000000-0000-4000-b000-00000000726e', 'e2000000-0000-4000-a000-000000000b71', 4, 'Lei de Acesso à Informação', false),
  ('e2000000-0000-4000-b000-000000007274', 'e2000000-0000-4000-a000-000000000b72', 0, 'Lei de Licitações e Contratos Administrativos', false),
  ('e2000000-0000-4000-b000-000000007275', 'e2000000-0000-4000-a000-000000000b72', 1, 'Lei de Diretrizes e Bases da Educação Nacional (LDB)', true),
  ('e2000000-0000-4000-b000-000000007276', 'e2000000-0000-4000-a000-000000000b72', 2, 'Estatuto da Pessoa Idosa', false),
  ('e2000000-0000-4000-b000-000000007277', 'e2000000-0000-4000-a000-000000000b72', 3, 'Lei Orgânica da Saúde, que organiza o SUS', false),
  ('e2000000-0000-4000-b000-000000007278', 'e2000000-0000-4000-a000-000000000b72', 4, 'Estatuto da Criança e do Adolescente (ECA)', false),
  ('e2000000-0000-4000-b000-00000000727e', 'e2000000-0000-4000-a000-000000000b73', 0, 'Lei de Licitações e Contratos Administrativos', false),
  ('e2000000-0000-4000-b000-00000000727f', 'e2000000-0000-4000-a000-000000000b73', 1, 'Lei de Diretrizes e Bases da Educação Nacional (LDB)', false),
  ('e2000000-0000-4000-b000-000000007280', 'e2000000-0000-4000-a000-000000000b73', 2, 'Lei Orgânica da Saúde, que organiza o SUS', false),
  ('e2000000-0000-4000-b000-000000007281', 'e2000000-0000-4000-a000-000000000b73', 3, 'Lei de Improbidade Administrativa', false),
  ('e2000000-0000-4000-b000-000000007282', 'e2000000-0000-4000-a000-000000000b73', 4, 'Estatuto da Pessoa Idosa', true),
  ('e2000000-0000-4000-b000-000000007288', 'e2000000-0000-4000-a000-000000000b74', 0, 'Lei de Diretrizes e Bases da Educação Nacional (LDB)', false),
  ('e2000000-0000-4000-b000-000000007289', 'e2000000-0000-4000-a000-000000000b74', 1, 'Estatuto da Criança e do Adolescente (ECA)', false),
  ('e2000000-0000-4000-b000-00000000728a', 'e2000000-0000-4000-a000-000000000b74', 2, 'Lei Geral de Proteção de Dados Pessoais (LGPD)', false),
  ('e2000000-0000-4000-b000-00000000728b', 'e2000000-0000-4000-a000-000000000b74', 3, 'Lei de Acesso à Informação', true),
  ('e2000000-0000-4000-b000-00000000728c', 'e2000000-0000-4000-a000-000000000b74', 4, 'Estatuto da Pessoa Idosa', false),
  ('e2000000-0000-4000-b000-000000007292', 'e2000000-0000-4000-a000-000000000b75', 0, 'Estatuto da Criança e do Adolescente (ECA)', false),
  ('e2000000-0000-4000-b000-000000007293', 'e2000000-0000-4000-a000-000000000b75', 1, 'Lei de Improbidade Administrativa', false),
  ('e2000000-0000-4000-b000-000000007294', 'e2000000-0000-4000-a000-000000000b75', 2, 'Lei de Diretrizes e Bases da Educação Nacional (LDB)', false),
  ('e2000000-0000-4000-b000-000000007295', 'e2000000-0000-4000-a000-000000000b75', 3, 'Lei Orgânica da Saúde, que organiza o SUS', false),
  ('e2000000-0000-4000-b000-000000007296', 'e2000000-0000-4000-a000-000000000b75', 4, 'Lei de Responsabilidade Fiscal', true),
  ('e2000000-0000-4000-b000-00000000729c', 'e2000000-0000-4000-a000-000000000b76', 0, 'Estatuto da Criança e do Adolescente (ECA)', false),
  ('e2000000-0000-4000-b000-00000000729d', 'e2000000-0000-4000-a000-000000000b76', 1, 'Lei de Responsabilidade Fiscal', false),
  ('e2000000-0000-4000-b000-00000000729e', 'e2000000-0000-4000-a000-000000000b76', 2, 'Lei Geral de Proteção de Dados Pessoais (LGPD)', false),
  ('e2000000-0000-4000-b000-00000000729f', 'e2000000-0000-4000-a000-000000000b76', 3, 'Lei de Licitações e Contratos Administrativos', true),
  ('e2000000-0000-4000-b000-0000000072a0', 'e2000000-0000-4000-a000-000000000b76', 4, 'Estatuto da Pessoa Idosa', false),
  ('e2000000-0000-4000-b000-0000000072a6', 'e2000000-0000-4000-a000-000000000b77', 0, 'Lei de Improbidade Administrativa', true),
  ('e2000000-0000-4000-b000-0000000072a7', 'e2000000-0000-4000-a000-000000000b77', 1, 'Lei de Licitações e Contratos Administrativos', false),
  ('e2000000-0000-4000-b000-0000000072a8', 'e2000000-0000-4000-a000-000000000b77', 2, 'Lei de Acesso à Informação', false),
  ('e2000000-0000-4000-b000-0000000072a9', 'e2000000-0000-4000-a000-000000000b77', 3, 'Estatuto da Pessoa Idosa', false),
  ('e2000000-0000-4000-b000-0000000072aa', 'e2000000-0000-4000-a000-000000000b77', 4, 'Lei Geral de Proteção de Dados Pessoais (LGPD)', false),
  ('e2000000-0000-4000-b000-0000000072b0', 'e2000000-0000-4000-a000-000000000b78', 0, 'Lei Geral de Proteção de Dados Pessoais (LGPD)', true),
  ('e2000000-0000-4000-b000-0000000072b1', 'e2000000-0000-4000-a000-000000000b78', 1, 'Lei de Diretrizes e Bases da Educação Nacional (LDB)', false),
  ('e2000000-0000-4000-b000-0000000072b2', 'e2000000-0000-4000-a000-000000000b78', 2, 'Estatuto da Pessoa Idosa', false),
  ('e2000000-0000-4000-b000-0000000072b3', 'e2000000-0000-4000-a000-000000000b78', 3, 'Lei de Improbidade Administrativa', false),
  ('e2000000-0000-4000-b000-0000000072b4', 'e2000000-0000-4000-a000-000000000b78', 4, 'Lei de Licitações e Contratos Administrativos', false),
  ('e2000000-0000-4000-b000-0000000072ba', 'e2000000-0000-4000-a000-000000000b79', 0, 'Clareza', false),
  ('e2000000-0000-4000-b000-0000000072bb', 'e2000000-0000-4000-a000-000000000b79', 1, 'Cortesia', true),
  ('e2000000-0000-4000-b000-0000000072bc', 'e2000000-0000-4000-a000-000000000b79', 2, 'Presteza', false),
  ('e2000000-0000-4000-b000-0000000072bd', 'e2000000-0000-4000-a000-000000000b79', 3, 'Atendimento prioritário', false),
  ('e2000000-0000-4000-b000-0000000072be', 'e2000000-0000-4000-a000-000000000b79', 4, 'Impessoalidade no atendimento', false),
  ('e2000000-0000-4000-b000-0000000072c4', 'e2000000-0000-4000-a000-000000000b7a', 0, 'Atendimento prioritário', false),
  ('e2000000-0000-4000-b000-0000000072c5', 'e2000000-0000-4000-a000-000000000b7a', 1, 'Impessoalidade no atendimento', false),
  ('e2000000-0000-4000-b000-0000000072c6', 'e2000000-0000-4000-a000-000000000b7a', 2, 'Cortesia', false),
  ('e2000000-0000-4000-b000-0000000072c7', 'e2000000-0000-4000-a000-000000000b7a', 3, 'Presteza', false),
  ('e2000000-0000-4000-b000-0000000072c8', 'e2000000-0000-4000-a000-000000000b7a', 4, 'Clareza', true),
  ('e2000000-0000-4000-b000-0000000072ce', 'e2000000-0000-4000-a000-000000000b7b', 0, 'Impessoalidade no atendimento', false),
  ('e2000000-0000-4000-b000-0000000072cf', 'e2000000-0000-4000-a000-000000000b7b', 1, 'Atendimento prioritário', false),
  ('e2000000-0000-4000-b000-0000000072d0', 'e2000000-0000-4000-a000-000000000b7b', 2, 'Cortesia', false),
  ('e2000000-0000-4000-b000-0000000072d1', 'e2000000-0000-4000-a000-000000000b7b', 3, 'Presteza', true),
  ('e2000000-0000-4000-b000-0000000072d2', 'e2000000-0000-4000-a000-000000000b7b', 4, 'Clareza', false),
  ('e2000000-0000-4000-b000-0000000072d8', 'e2000000-0000-4000-a000-000000000b7c', 0, 'Cortesia', false),
  ('e2000000-0000-4000-b000-0000000072d9', 'e2000000-0000-4000-a000-000000000b7c', 1, 'Clareza', false),
  ('e2000000-0000-4000-b000-0000000072da', 'e2000000-0000-4000-a000-000000000b7c', 2, 'Presteza', false),
  ('e2000000-0000-4000-b000-0000000072db', 'e2000000-0000-4000-a000-000000000b7c', 3, 'Impessoalidade no atendimento', false),
  ('e2000000-0000-4000-b000-0000000072dc', 'e2000000-0000-4000-a000-000000000b7c', 4, 'Atendimento prioritário', true),
  ('e2000000-0000-4000-b000-0000000072e2', 'e2000000-0000-4000-a000-000000000b7d', 0, 'Cortesia', false),
  ('e2000000-0000-4000-b000-0000000072e3', 'e2000000-0000-4000-a000-000000000b7d', 1, 'Impessoalidade no atendimento', true),
  ('e2000000-0000-4000-b000-0000000072e4', 'e2000000-0000-4000-a000-000000000b7d', 2, 'Presteza', false),
  ('e2000000-0000-4000-b000-0000000072e5', 'e2000000-0000-4000-a000-000000000b7d', 3, 'Atendimento prioritário', false),
  ('e2000000-0000-4000-b000-0000000072e6', 'e2000000-0000-4000-a000-000000000b7d', 4, 'Clareza', false),
  ('e2000000-0000-4000-b000-0000000072ec', 'e2000000-0000-4000-a000-000000000b7e', 0, 'atender com rapidez e disposição, sem demoras injustificadas', false),
  ('e2000000-0000-4000-b000-0000000072ed', 'e2000000-0000-4000-a000-000000000b7e', 1, 'tratar o cidadão com educação e respeito, mesmo diante de reclamações', true),
  ('e2000000-0000-4000-b000-0000000072ee', 'e2000000-0000-4000-a000-000000000b7e', 2, 'usar linguagem simples, sem termos técnicos desnecessários', false),
  ('e2000000-0000-4000-b000-0000000072ef', 'e2000000-0000-4000-a000-000000000b7e', 3, 'atender a todos sem favorecer amigos, parentes ou conhecidos', false),
  ('e2000000-0000-4000-b000-0000000072f0', 'e2000000-0000-4000-a000-000000000b7e', 4, 'garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência', false),
  ('e2000000-0000-4000-b000-0000000072f6', 'e2000000-0000-4000-a000-000000000b7f', 0, 'atender a todos sem favorecer amigos, parentes ou conhecidos', false),
  ('e2000000-0000-4000-b000-0000000072f7', 'e2000000-0000-4000-a000-000000000b7f', 1, 'atender com rapidez e disposição, sem demoras injustificadas', false),
  ('e2000000-0000-4000-b000-0000000072f8', 'e2000000-0000-4000-a000-000000000b7f', 2, 'garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência', false),
  ('e2000000-0000-4000-b000-0000000072f9', 'e2000000-0000-4000-a000-000000000b7f', 3, 'tratar o cidadão com educação e respeito, mesmo diante de reclamações', false),
  ('e2000000-0000-4000-b000-0000000072fa', 'e2000000-0000-4000-a000-000000000b7f', 4, 'usar linguagem simples, sem termos técnicos desnecessários', true),
  ('e2000000-0000-4000-b000-000000007300', 'e2000000-0000-4000-a000-000000000b80', 0, 'usar linguagem simples, sem termos técnicos desnecessários', false),
  ('e2000000-0000-4000-b000-000000007301', 'e2000000-0000-4000-a000-000000000b80', 1, 'atender com rapidez e disposição, sem demoras injustificadas', true),
  ('e2000000-0000-4000-b000-000000007302', 'e2000000-0000-4000-a000-000000000b80', 2, 'tratar o cidadão com educação e respeito, mesmo diante de reclamações', false),
  ('e2000000-0000-4000-b000-000000007303', 'e2000000-0000-4000-a000-000000000b80', 3, 'atender a todos sem favorecer amigos, parentes ou conhecidos', false),
  ('e2000000-0000-4000-b000-000000007304', 'e2000000-0000-4000-a000-000000000b80', 4, 'garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência', false),
  ('e2000000-0000-4000-b000-00000000730a', 'e2000000-0000-4000-a000-000000000b81', 0, 'atender com rapidez e disposição, sem demoras injustificadas', false),
  ('e2000000-0000-4000-b000-00000000730b', 'e2000000-0000-4000-a000-000000000b81', 1, 'atender a todos sem favorecer amigos, parentes ou conhecidos', false),
  ('e2000000-0000-4000-b000-00000000730c', 'e2000000-0000-4000-a000-000000000b81', 2, 'usar linguagem simples, sem termos técnicos desnecessários', false),
  ('e2000000-0000-4000-b000-00000000730d', 'e2000000-0000-4000-a000-000000000b81', 3, 'tratar o cidadão com educação e respeito, mesmo diante de reclamações', false),
  ('e2000000-0000-4000-b000-00000000730e', 'e2000000-0000-4000-a000-000000000b81', 4, 'garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência', true),
  ('e2000000-0000-4000-b000-000000007314', 'e2000000-0000-4000-a000-000000000b82', 0, 'garantido por lei a pessoas com 60 anos ou mais, gestantes, lactantes e pessoas com deficiência', false),
  ('e2000000-0000-4000-b000-000000007315', 'e2000000-0000-4000-a000-000000000b82', 1, 'usar linguagem simples, sem termos técnicos desnecessários', false),
  ('e2000000-0000-4000-b000-000000007316', 'e2000000-0000-4000-a000-000000000b82', 2, 'atender a todos sem favorecer amigos, parentes ou conhecidos', true),
  ('e2000000-0000-4000-b000-000000007317', 'e2000000-0000-4000-a000-000000000b82', 3, 'atender com rapidez e disposição, sem demoras injustificadas', false),
  ('e2000000-0000-4000-b000-000000007318', 'e2000000-0000-4000-a000-000000000b82', 4, 'tratar o cidadão com educação e respeito, mesmo diante de reclamações', false),
  ('e2000000-0000-4000-b000-00000000731e', 'e2000000-0000-4000-a000-000000000b83', 0, 'Ctrl + V', false),
  ('e2000000-0000-4000-b000-00000000731f', 'e2000000-0000-4000-a000-000000000b83', 1, 'Ctrl + E', false),
  ('e2000000-0000-4000-b000-000000007320', 'e2000000-0000-4000-a000-000000000b83', 2, 'Ctrl + S', false),
  ('e2000000-0000-4000-b000-000000007321', 'e2000000-0000-4000-a000-000000000b83', 3, 'Ctrl + T', false),
  ('e2000000-0000-4000-b000-000000007322', 'e2000000-0000-4000-a000-000000000b83', 4, 'Ctrl + N', true),
  ('e2000000-0000-4000-b000-000000007328', 'e2000000-0000-4000-a000-000000000b84', 0, 'Ctrl + B', false),
  ('e2000000-0000-4000-b000-000000007329', 'e2000000-0000-4000-a000-000000000b84', 1, 'Ctrl + E', false),
  ('e2000000-0000-4000-b000-00000000732a', 'e2000000-0000-4000-a000-000000000b84', 2, 'Ctrl + I', true),
  ('e2000000-0000-4000-b000-00000000732b', 'e2000000-0000-4000-a000-000000000b84', 3, 'Ctrl + V', false),
  ('e2000000-0000-4000-b000-00000000732c', 'e2000000-0000-4000-a000-000000000b84', 4, 'Ctrl + N', false),
  ('e2000000-0000-4000-b000-000000007332', 'e2000000-0000-4000-a000-000000000b85', 0, 'Ctrl + E', false),
  ('e2000000-0000-4000-b000-000000007333', 'e2000000-0000-4000-a000-000000000b85', 1, 'Ctrl + S', true),
  ('e2000000-0000-4000-b000-000000007334', 'e2000000-0000-4000-a000-000000000b85', 2, 'Ctrl + B', false),
  ('e2000000-0000-4000-b000-000000007335', 'e2000000-0000-4000-a000-000000000b85', 3, 'Ctrl + P', false),
  ('e2000000-0000-4000-b000-000000007336', 'e2000000-0000-4000-a000-000000000b85', 4, 'Ctrl + Z', false),
  ('e2000000-0000-4000-b000-00000000733c', 'e2000000-0000-4000-a000-000000000b86', 0, 'Ctrl + B', true),
  ('e2000000-0000-4000-b000-00000000733d', 'e2000000-0000-4000-a000-000000000b86', 1, 'Ctrl + X', false),
  ('e2000000-0000-4000-b000-00000000733e', 'e2000000-0000-4000-a000-000000000b86', 2, 'Ctrl + V', false),
  ('e2000000-0000-4000-b000-00000000733f', 'e2000000-0000-4000-a000-000000000b86', 3, 'Ctrl + S', false),
  ('e2000000-0000-4000-b000-000000007340', 'e2000000-0000-4000-a000-000000000b86', 4, 'Ctrl + N', false),
  ('e2000000-0000-4000-b000-000000007346', 'e2000000-0000-4000-a000-000000000b87', 0, 'Ctrl + N', false),
  ('e2000000-0000-4000-b000-000000007347', 'e2000000-0000-4000-a000-000000000b87', 1, 'Ctrl + E', false),
  ('e2000000-0000-4000-b000-000000007348', 'e2000000-0000-4000-a000-000000000b87', 2, 'Ctrl + B', false),
  ('e2000000-0000-4000-b000-000000007349', 'e2000000-0000-4000-a000-000000000b87', 3, 'Ctrl + V', false),
  ('e2000000-0000-4000-b000-00000000734a', 'e2000000-0000-4000-a000-000000000b87', 4, 'Ctrl + Z', true),
  ('e2000000-0000-4000-b000-000000007350', 'e2000000-0000-4000-a000-000000000b88', 0, 'Ctrl + T', false),
  ('e2000000-0000-4000-b000-000000007351', 'e2000000-0000-4000-a000-000000000b88', 1, 'Ctrl + E', false),
  ('e2000000-0000-4000-b000-000000007352', 'e2000000-0000-4000-a000-000000000b88', 2, 'Ctrl + P', true),
  ('e2000000-0000-4000-b000-000000007353', 'e2000000-0000-4000-a000-000000000b88', 3, 'Ctrl + B', false),
  ('e2000000-0000-4000-b000-000000007354', 'e2000000-0000-4000-a000-000000000b88', 4, 'Ctrl + X', false),
  ('e2000000-0000-4000-b000-00000000735a', 'e2000000-0000-4000-a000-000000000b89', 0, 'Ctrl + Z', false),
  ('e2000000-0000-4000-b000-00000000735b', 'e2000000-0000-4000-a000-000000000b89', 1, 'Ctrl + I', false),
  ('e2000000-0000-4000-b000-00000000735c', 'e2000000-0000-4000-a000-000000000b89', 2, 'Ctrl + P', false),
  ('e2000000-0000-4000-b000-00000000735d', 'e2000000-0000-4000-a000-000000000b89', 3, 'Ctrl + X', false),
  ('e2000000-0000-4000-b000-00000000735e', 'e2000000-0000-4000-a000-000000000b89', 4, 'Ctrl + T', true),
  ('e2000000-0000-4000-b000-000000007364', 'e2000000-0000-4000-a000-000000000b8a', 0, 'Ctrl + X', false),
  ('e2000000-0000-4000-b000-000000007365', 'e2000000-0000-4000-a000-000000000b8a', 1, 'Ctrl + N', false),
  ('e2000000-0000-4000-b000-000000007366', 'e2000000-0000-4000-a000-000000000b8a', 2, 'Ctrl + V', false),
  ('e2000000-0000-4000-b000-000000007367', 'e2000000-0000-4000-a000-000000000b8a', 3, 'Ctrl + E', true),
  ('e2000000-0000-4000-b000-000000007368', 'e2000000-0000-4000-a000-000000000b8a', 4, 'Ctrl + S', false),
  ('e2000000-0000-4000-b000-00000000736e', 'e2000000-0000-4000-a000-000000000b8b', 0, 'Ctrl + B', false),
  ('e2000000-0000-4000-b000-00000000736f', 'e2000000-0000-4000-a000-000000000b8b', 1, 'Ctrl + S', false),
  ('e2000000-0000-4000-b000-000000007370', 'e2000000-0000-4000-a000-000000000b8b', 2, 'Ctrl + N', false),
  ('e2000000-0000-4000-b000-000000007371', 'e2000000-0000-4000-a000-000000000b8b', 3, 'Ctrl + I', false),
  ('e2000000-0000-4000-b000-000000007372', 'e2000000-0000-4000-a000-000000000b8b', 4, 'Ctrl + X', true),
  ('e2000000-0000-4000-b000-000000007378', 'e2000000-0000-4000-a000-000000000b8c', 0, 'Ctrl + N', false),
  ('e2000000-0000-4000-b000-000000007379', 'e2000000-0000-4000-a000-000000000b8c', 1, 'Ctrl + V', true),
  ('e2000000-0000-4000-b000-00000000737a', 'e2000000-0000-4000-a000-000000000b8c', 2, 'Ctrl + S', false),
  ('e2000000-0000-4000-b000-00000000737b', 'e2000000-0000-4000-a000-000000000b8c', 3, 'Ctrl + P', false),
  ('e2000000-0000-4000-b000-00000000737c', 'e2000000-0000-4000-a000-000000000b8c', 4, 'Ctrl + Z', false),
  ('e2000000-0000-4000-b000-000000007382', 'e2000000-0000-4000-a000-000000000b8d', 0, 'aplicar negrito ao texto selecionado', true),
  ('e2000000-0000-4000-b000-000000007383', 'e2000000-0000-4000-a000-000000000b8d', 1, 'salvar o documento', false),
  ('e2000000-0000-4000-b000-000000007384', 'e2000000-0000-4000-a000-000000000b8d', 2, 'recortar o conteúdo selecionado', false),
  ('e2000000-0000-4000-b000-000000007385', 'e2000000-0000-4000-a000-000000000b8d', 3, 'colar o conteúdo da área de transferência', false),
  ('e2000000-0000-4000-b000-000000007386', 'e2000000-0000-4000-a000-000000000b8d', 4, 'desfazer a última ação', false),
  ('e2000000-0000-4000-b000-00000000738c', 'e2000000-0000-4000-a000-000000000b8e', 0, 'imprimir o documento', false),
  ('e2000000-0000-4000-b000-00000000738d', 'e2000000-0000-4000-a000-000000000b8e', 1, 'recortar o conteúdo selecionado', false),
  ('e2000000-0000-4000-b000-00000000738e', 'e2000000-0000-4000-a000-000000000b8e', 2, 'centralizar o parágrafo', false),
  ('e2000000-0000-4000-b000-00000000738f', 'e2000000-0000-4000-a000-000000000b8e', 3, 'aplicar itálico ao texto selecionado', true),
  ('e2000000-0000-4000-b000-000000007390', 'e2000000-0000-4000-a000-000000000b8e', 4, 'colar o conteúdo da área de transferência', false),
  ('e2000000-0000-4000-b000-000000007396', 'e2000000-0000-4000-a000-000000000b8f', 0, 'salvar o documento', false),
  ('e2000000-0000-4000-b000-000000007397', 'e2000000-0000-4000-a000-000000000b8f', 1, 'sublinhar o texto selecionado', true),
  ('e2000000-0000-4000-b000-000000007398', 'e2000000-0000-4000-a000-000000000b8f', 2, 'imprimir o documento', false),
  ('e2000000-0000-4000-b000-000000007399', 'e2000000-0000-4000-a000-000000000b8f', 3, 'centralizar o parágrafo', false),
  ('e2000000-0000-4000-b000-00000000739a', 'e2000000-0000-4000-a000-000000000b8f', 4, 'desfazer a última ação', false),
  ('e2000000-0000-4000-b000-0000000073a0', 'e2000000-0000-4000-a000-000000000b90', 0, 'imprimir o documento', false),
  ('e2000000-0000-4000-b000-0000000073a1', 'e2000000-0000-4000-a000-000000000b90', 1, 'colar o conteúdo da área de transferência', false),
  ('e2000000-0000-4000-b000-0000000073a2', 'e2000000-0000-4000-a000-000000000b90', 2, 'aplicar itálico ao texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073a3', 'e2000000-0000-4000-a000-000000000b90', 3, 'centralizar o parágrafo', false),
  ('e2000000-0000-4000-b000-0000000073a4', 'e2000000-0000-4000-a000-000000000b90', 4, 'salvar o documento', true),
  ('e2000000-0000-4000-b000-0000000073aa', 'e2000000-0000-4000-a000-000000000b91', 0, 'salvar o documento', false),
  ('e2000000-0000-4000-b000-0000000073ab', 'e2000000-0000-4000-a000-000000000b91', 1, 'desfazer a última ação', true),
  ('e2000000-0000-4000-b000-0000000073ac', 'e2000000-0000-4000-a000-000000000b91', 2, 'aplicar itálico ao texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073ad', 'e2000000-0000-4000-a000-000000000b91', 3, 'sublinhar o texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073ae', 'e2000000-0000-4000-a000-000000000b91', 4, 'recortar o conteúdo selecionado', false),
  ('e2000000-0000-4000-b000-0000000073b4', 'e2000000-0000-4000-a000-000000000b92', 0, 'aplicar itálico ao texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073b5', 'e2000000-0000-4000-a000-000000000b92', 1, 'imprimir o documento', true),
  ('e2000000-0000-4000-b000-0000000073b6', 'e2000000-0000-4000-a000-000000000b92', 2, 'centralizar o parágrafo', false),
  ('e2000000-0000-4000-b000-0000000073b7', 'e2000000-0000-4000-a000-000000000b92', 3, 'selecionar todo o documento', false),
  ('e2000000-0000-4000-b000-0000000073b8', 'e2000000-0000-4000-a000-000000000b92', 4, 'colar o conteúdo da área de transferência', false),
  ('e2000000-0000-4000-b000-0000000073be', 'e2000000-0000-4000-a000-000000000b93', 0, 'colar o conteúdo da área de transferência', false),
  ('e2000000-0000-4000-b000-0000000073bf', 'e2000000-0000-4000-a000-000000000b93', 1, 'selecionar todo o documento', true),
  ('e2000000-0000-4000-b000-0000000073c0', 'e2000000-0000-4000-a000-000000000b93', 2, 'centralizar o parágrafo', false),
  ('e2000000-0000-4000-b000-0000000073c1', 'e2000000-0000-4000-a000-000000000b93', 3, 'sublinhar o texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073c2', 'e2000000-0000-4000-a000-000000000b93', 4, 'salvar o documento', false),
  ('e2000000-0000-4000-b000-0000000073c8', 'e2000000-0000-4000-a000-000000000b94', 0, 'aplicar negrito ao texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073c9', 'e2000000-0000-4000-a000-000000000b94', 1, 'aplicar itálico ao texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073ca', 'e2000000-0000-4000-a000-000000000b94', 2, 'centralizar o parágrafo', true),
  ('e2000000-0000-4000-b000-0000000073cb', 'e2000000-0000-4000-a000-000000000b94', 3, 'desfazer a última ação', false),
  ('e2000000-0000-4000-b000-0000000073cc', 'e2000000-0000-4000-a000-000000000b94', 4, 'imprimir o documento', false),
  ('e2000000-0000-4000-b000-0000000073d2', 'e2000000-0000-4000-a000-000000000b95', 0, 'centralizar o parágrafo', false),
  ('e2000000-0000-4000-b000-0000000073d3', 'e2000000-0000-4000-a000-000000000b95', 1, 'salvar o documento', false),
  ('e2000000-0000-4000-b000-0000000073d4', 'e2000000-0000-4000-a000-000000000b95', 2, 'colar o conteúdo da área de transferência', false),
  ('e2000000-0000-4000-b000-0000000073d5', 'e2000000-0000-4000-a000-000000000b95', 3, 'recortar o conteúdo selecionado', true),
  ('e2000000-0000-4000-b000-0000000073d6', 'e2000000-0000-4000-a000-000000000b95', 4, 'sublinhar o texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073dc', 'e2000000-0000-4000-a000-000000000b96', 0, 'recortar o conteúdo selecionado', false),
  ('e2000000-0000-4000-b000-0000000073dd', 'e2000000-0000-4000-a000-000000000b96', 1, 'colar o conteúdo da área de transferência', true),
  ('e2000000-0000-4000-b000-0000000073de', 'e2000000-0000-4000-a000-000000000b96', 2, 'centralizar o parágrafo', false),
  ('e2000000-0000-4000-b000-0000000073df', 'e2000000-0000-4000-a000-000000000b96', 3, 'sublinhar o texto selecionado', false),
  ('e2000000-0000-4000-b000-0000000073e0', 'e2000000-0000-4000-a000-000000000b96', 4, 'imprimir o documento', false),
  ('e2000000-0000-4000-b000-0000000073e6', 'e2000000-0000-4000-a000-000000000b97', 0, 'Alt + Tab', false),
  ('e2000000-0000-4000-b000-0000000073e7', 'e2000000-0000-4000-a000-000000000b97', 1, 'Shift + Delete', false),
  ('e2000000-0000-4000-b000-0000000073e8', 'e2000000-0000-4000-a000-000000000b97', 2, 'Windows + L', false),
  ('e2000000-0000-4000-b000-0000000073e9', 'e2000000-0000-4000-a000-000000000b97', 3, 'Windows + E', true),
  ('e2000000-0000-4000-b000-0000000073ea', 'e2000000-0000-4000-a000-000000000b97', 4, 'F2', false),
  ('e2000000-0000-4000-b000-0000000073f0', 'e2000000-0000-4000-a000-000000000b98', 0, 'Shift + Delete', false),
  ('e2000000-0000-4000-b000-0000000073f1', 'e2000000-0000-4000-a000-000000000b98', 1, 'F2', false),
  ('e2000000-0000-4000-b000-0000000073f2', 'e2000000-0000-4000-a000-000000000b98', 2, 'Windows + D', true),
  ('e2000000-0000-4000-b000-0000000073f3', 'e2000000-0000-4000-a000-000000000b98', 3, 'Windows + E', false),
  ('e2000000-0000-4000-b000-0000000073f4', 'e2000000-0000-4000-a000-000000000b98', 4, 'Windows + L', false),
  ('e2000000-0000-4000-b000-0000000073fa', 'e2000000-0000-4000-a000-000000000b99', 0, 'Windows + L', true),
  ('e2000000-0000-4000-b000-0000000073fb', 'e2000000-0000-4000-a000-000000000b99', 1, 'Alt + F4', false),
  ('e2000000-0000-4000-b000-0000000073fc', 'e2000000-0000-4000-a000-000000000b99', 2, 'Shift + Delete', false),
  ('e2000000-0000-4000-b000-0000000073fd', 'e2000000-0000-4000-a000-000000000b99', 3, 'Alt + Tab', false),
  ('e2000000-0000-4000-b000-0000000073fe', 'e2000000-0000-4000-a000-000000000b99', 4, 'Windows + E', false),
  ('e2000000-0000-4000-b000-000000007404', 'e2000000-0000-4000-a000-000000000b9a', 0, 'Alt + F4', false),
  ('e2000000-0000-4000-b000-000000007405', 'e2000000-0000-4000-a000-000000000b9a', 1, 'Alt + Tab', true),
  ('e2000000-0000-4000-b000-000000007406', 'e2000000-0000-4000-a000-000000000b9a', 2, 'Windows + D', false),
  ('e2000000-0000-4000-b000-000000007407', 'e2000000-0000-4000-a000-000000000b9a', 3, 'Windows + L', false),
  ('e2000000-0000-4000-b000-000000007408', 'e2000000-0000-4000-a000-000000000b9a', 4, 'Shift + Delete', false),
  ('e2000000-0000-4000-b000-00000000740e', 'e2000000-0000-4000-a000-000000000b9b', 0, 'Windows + D', false),
  ('e2000000-0000-4000-b000-00000000740f', 'e2000000-0000-4000-a000-000000000b9b', 1, 'Windows + E', false),
  ('e2000000-0000-4000-b000-000000007410', 'e2000000-0000-4000-a000-000000000b9b', 2, 'Alt + Tab', false),
  ('e2000000-0000-4000-b000-000000007411', 'e2000000-0000-4000-a000-000000000b9b', 3, 'Windows + L', false),
  ('e2000000-0000-4000-b000-000000007412', 'e2000000-0000-4000-a000-000000000b9b', 4, 'Ctrl + Shift + Esc', true),
  ('e2000000-0000-4000-b000-000000007418', 'e2000000-0000-4000-a000-000000000b9c', 0, 'Windows + E', false),
  ('e2000000-0000-4000-b000-000000007419', 'e2000000-0000-4000-a000-000000000b9c', 1, 'Windows + D', false),
  ('e2000000-0000-4000-b000-00000000741a', 'e2000000-0000-4000-a000-000000000b9c', 2, 'Alt + F4', false),
  ('e2000000-0000-4000-b000-00000000741b', 'e2000000-0000-4000-a000-000000000b9c', 3, 'Shift + Delete', false),
  ('e2000000-0000-4000-b000-00000000741c', 'e2000000-0000-4000-a000-000000000b9c', 4, 'F2', true),
  ('e2000000-0000-4000-b000-000000007422', 'e2000000-0000-4000-a000-000000000b9d', 0, 'Windows + E', false),
  ('e2000000-0000-4000-b000-000000007423', 'e2000000-0000-4000-a000-000000000b9d', 1, 'Alt + F4', false),
  ('e2000000-0000-4000-b000-000000007424', 'e2000000-0000-4000-a000-000000000b9d', 2, 'Shift + Delete', true),
  ('e2000000-0000-4000-b000-000000007425', 'e2000000-0000-4000-a000-000000000b9d', 3, 'Alt + Tab', false),
  ('e2000000-0000-4000-b000-000000007426', 'e2000000-0000-4000-a000-000000000b9d', 4, 'Windows + D', false),
  ('e2000000-0000-4000-b000-00000000742c', 'e2000000-0000-4000-a000-000000000b9e', 0, 'Windows + L', false),
  ('e2000000-0000-4000-b000-00000000742d', 'e2000000-0000-4000-a000-000000000b9e', 1, 'Alt + F4', true),
  ('e2000000-0000-4000-b000-00000000742e', 'e2000000-0000-4000-a000-000000000b9e', 2, 'Windows + E', false),
  ('e2000000-0000-4000-b000-00000000742f', 'e2000000-0000-4000-a000-000000000b9e', 3, 'Windows + D', false),
  ('e2000000-0000-4000-b000-000000007430', 'e2000000-0000-4000-a000-000000000b9e', 4, 'Shift + Delete', false),
  ('e2000000-0000-4000-b000-000000007436', 'e2000000-0000-4000-a000-000000000b9f', 0, 'abrir o Explorador de Arquivos', true),
  ('e2000000-0000-4000-b000-000000007437', 'e2000000-0000-4000-a000-000000000b9f', 1, 'mostrar a área de trabalho', false),
  ('e2000000-0000-4000-b000-000000007438', 'e2000000-0000-4000-a000-000000000b9f', 2, 'fechar a janela ativa', false),
  ('e2000000-0000-4000-b000-000000007439', 'e2000000-0000-4000-a000-000000000b9f', 3, 'excluir o arquivo sem enviá-lo para a Lixeira', false),
  ('e2000000-0000-4000-b000-00000000743a', 'e2000000-0000-4000-a000-000000000b9f', 4, 'abrir o Gerenciador de Tarefas', false),
  ('e2000000-0000-4000-b000-000000007440', 'e2000000-0000-4000-a000-000000000ba0', 0, 'abrir o Gerenciador de Tarefas', false),
  ('e2000000-0000-4000-b000-000000007441', 'e2000000-0000-4000-a000-000000000ba0', 1, 'alternar entre as janelas abertas', false),
  ('e2000000-0000-4000-b000-000000007442', 'e2000000-0000-4000-a000-000000000ba0', 2, 'excluir o arquivo sem enviá-lo para a Lixeira', false),
  ('e2000000-0000-4000-b000-000000007443', 'e2000000-0000-4000-a000-000000000ba0', 3, 'fechar a janela ativa', false),
  ('e2000000-0000-4000-b000-000000007444', 'e2000000-0000-4000-a000-000000000ba0', 4, 'mostrar a área de trabalho', true),
  ('e2000000-0000-4000-b000-00000000744a', 'e2000000-0000-4000-a000-000000000ba1', 0, 'abrir o Explorador de Arquivos', false),
  ('e2000000-0000-4000-b000-00000000744b', 'e2000000-0000-4000-a000-000000000ba1', 1, 'fechar a janela ativa', false),
  ('e2000000-0000-4000-b000-00000000744c', 'e2000000-0000-4000-a000-000000000ba1', 2, 'bloquear o computador', true),
  ('e2000000-0000-4000-b000-00000000744d', 'e2000000-0000-4000-a000-000000000ba1', 3, 'mostrar a área de trabalho', false),
  ('e2000000-0000-4000-b000-00000000744e', 'e2000000-0000-4000-a000-000000000ba1', 4, 'renomear o arquivo selecionado', false),
  ('e2000000-0000-4000-b000-000000007454', 'e2000000-0000-4000-a000-000000000ba2', 0, 'excluir o arquivo sem enviá-lo para a Lixeira', false),
  ('e2000000-0000-4000-b000-000000007455', 'e2000000-0000-4000-a000-000000000ba2', 1, 'bloquear o computador', false),
  ('e2000000-0000-4000-b000-000000007456', 'e2000000-0000-4000-a000-000000000ba2', 2, 'alternar entre as janelas abertas', true),
  ('e2000000-0000-4000-b000-000000007457', 'e2000000-0000-4000-a000-000000000ba2', 3, 'abrir o Gerenciador de Tarefas', false),
  ('e2000000-0000-4000-b000-000000007458', 'e2000000-0000-4000-a000-000000000ba2', 4, 'renomear o arquivo selecionado', false),
  ('e2000000-0000-4000-b000-00000000745e', 'e2000000-0000-4000-a000-000000000ba3', 0, 'excluir o arquivo sem enviá-lo para a Lixeira', false),
  ('e2000000-0000-4000-b000-00000000745f', 'e2000000-0000-4000-a000-000000000ba3', 1, 'alternar entre as janelas abertas', false),
  ('e2000000-0000-4000-b000-000000007460', 'e2000000-0000-4000-a000-000000000ba3', 2, 'mostrar a área de trabalho', false),
  ('e2000000-0000-4000-b000-000000007461', 'e2000000-0000-4000-a000-000000000ba3', 3, 'abrir o Gerenciador de Tarefas', true),
  ('e2000000-0000-4000-b000-000000007462', 'e2000000-0000-4000-a000-000000000ba3', 4, 'renomear o arquivo selecionado', false),
  ('e2000000-0000-4000-b000-000000007468', 'e2000000-0000-4000-a000-000000000ba4', 0, 'abrir o Gerenciador de Tarefas', false),
  ('e2000000-0000-4000-b000-000000007469', 'e2000000-0000-4000-a000-000000000ba4', 1, 'alternar entre as janelas abertas', false),
  ('e2000000-0000-4000-b000-00000000746a', 'e2000000-0000-4000-a000-000000000ba4', 2, 'excluir o arquivo sem enviá-lo para a Lixeira', false),
  ('e2000000-0000-4000-b000-00000000746b', 'e2000000-0000-4000-a000-000000000ba4', 3, 'renomear o arquivo selecionado', true),
  ('e2000000-0000-4000-b000-00000000746c', 'e2000000-0000-4000-a000-000000000ba4', 4, 'abrir o Explorador de Arquivos', false),
  ('e2000000-0000-4000-b000-000000007472', 'e2000000-0000-4000-a000-000000000ba5', 0, 'renomear o arquivo selecionado', false),
  ('e2000000-0000-4000-b000-000000007473', 'e2000000-0000-4000-a000-000000000ba5', 1, 'fechar a janela ativa', false),
  ('e2000000-0000-4000-b000-000000007474', 'e2000000-0000-4000-a000-000000000ba5', 2, 'excluir o arquivo sem enviá-lo para a Lixeira', true),
  ('e2000000-0000-4000-b000-000000007475', 'e2000000-0000-4000-a000-000000000ba5', 3, 'bloquear o computador', false),
  ('e2000000-0000-4000-b000-000000007476', 'e2000000-0000-4000-a000-000000000ba5', 4, 'alternar entre as janelas abertas', false),
  ('e2000000-0000-4000-b000-00000000747c', 'e2000000-0000-4000-a000-000000000ba6', 0, 'abrir o Explorador de Arquivos', false),
  ('e2000000-0000-4000-b000-00000000747d', 'e2000000-0000-4000-a000-000000000ba6', 1, 'alternar entre as janelas abertas', false),
  ('e2000000-0000-4000-b000-00000000747e', 'e2000000-0000-4000-a000-000000000ba6', 2, 'fechar a janela ativa', true),
  ('e2000000-0000-4000-b000-00000000747f', 'e2000000-0000-4000-a000-000000000ba6', 3, 'bloquear o computador', false),
  ('e2000000-0000-4000-b000-000000007480', 'e2000000-0000-4000-a000-000000000ba6', 4, 'renomear o arquivo selecionado', false),
  ('e2000000-0000-4000-b000-000000007486', 'e2000000-0000-4000-a000-000000000ba7', 0, 'HTTPS', false),
  ('e2000000-0000-4000-b000-000000007487', 'e2000000-0000-4000-a000-000000000ba7', 1, 'Spam', false),
  ('e2000000-0000-4000-b000-000000007488', 'e2000000-0000-4000-a000-000000000ba7', 2, 'Phishing', true),
  ('e2000000-0000-4000-b000-000000007489', 'e2000000-0000-4000-a000-000000000ba7', 3, 'Backup', false),
  ('e2000000-0000-4000-b000-00000000748a', 'e2000000-0000-4000-a000-000000000ba7', 4, 'Cco (cópia oculta)', false),
  ('e2000000-0000-4000-b000-000000007490', 'e2000000-0000-4000-a000-000000000ba8', 0, 'Firewall', false),
  ('e2000000-0000-4000-b000-000000007491', 'e2000000-0000-4000-a000-000000000ba8', 1, 'HTTPS', false),
  ('e2000000-0000-4000-b000-000000007492', 'e2000000-0000-4000-a000-000000000ba8', 2, 'Autenticação em dois fatores', false),
  ('e2000000-0000-4000-b000-000000007493', 'e2000000-0000-4000-a000-000000000ba8', 3, 'Ransomware', true),
  ('e2000000-0000-4000-b000-000000007494', 'e2000000-0000-4000-a000-000000000ba8', 4, 'Spam', false),
  ('e2000000-0000-4000-b000-00000000749a', 'e2000000-0000-4000-a000-000000000ba9', 0, 'Firewall', true),
  ('e2000000-0000-4000-b000-00000000749b', 'e2000000-0000-4000-a000-000000000ba9', 1, 'Backup', false),
  ('e2000000-0000-4000-b000-00000000749c', 'e2000000-0000-4000-a000-000000000ba9', 2, 'Autenticação em dois fatores', false),
  ('e2000000-0000-4000-b000-00000000749d', 'e2000000-0000-4000-a000-000000000ba9', 3, 'Spam', false),
  ('e2000000-0000-4000-b000-00000000749e', 'e2000000-0000-4000-a000-000000000ba9', 4, 'Phishing', false),
  ('e2000000-0000-4000-b000-0000000074a4', 'e2000000-0000-4000-a000-000000000baa', 0, 'Backup', true),
  ('e2000000-0000-4000-b000-0000000074a5', 'e2000000-0000-4000-a000-000000000baa', 1, 'HTTPS', false),
  ('e2000000-0000-4000-b000-0000000074a6', 'e2000000-0000-4000-a000-000000000baa', 2, 'Phishing', false),
  ('e2000000-0000-4000-b000-0000000074a7', 'e2000000-0000-4000-a000-000000000baa', 3, 'Autenticação em dois fatores', false),
  ('e2000000-0000-4000-b000-0000000074a8', 'e2000000-0000-4000-a000-000000000baa', 4, 'Ransomware', false),
  ('e2000000-0000-4000-b000-0000000074ae', 'e2000000-0000-4000-a000-000000000bab', 0, 'Spam', true),
  ('e2000000-0000-4000-b000-0000000074af', 'e2000000-0000-4000-a000-000000000bab', 1, 'Ransomware', false),
  ('e2000000-0000-4000-b000-0000000074b0', 'e2000000-0000-4000-a000-000000000bab', 2, 'HTTPS', false),
  ('e2000000-0000-4000-b000-0000000074b1', 'e2000000-0000-4000-a000-000000000bab', 3, 'Backup', false),
  ('e2000000-0000-4000-b000-0000000074b2', 'e2000000-0000-4000-a000-000000000bab', 4, 'Cco (cópia oculta)', false),
  ('e2000000-0000-4000-b000-0000000074b8', 'e2000000-0000-4000-a000-000000000bac', 0, 'Phishing', false),
  ('e2000000-0000-4000-b000-0000000074b9', 'e2000000-0000-4000-a000-000000000bac', 1, 'Spam', false),
  ('e2000000-0000-4000-b000-0000000074ba', 'e2000000-0000-4000-a000-000000000bac', 2, 'Backup', false),
  ('e2000000-0000-4000-b000-0000000074bb', 'e2000000-0000-4000-a000-000000000bac', 3, 'Cco (cópia oculta)', true),
  ('e2000000-0000-4000-b000-0000000074bc', 'e2000000-0000-4000-a000-000000000bac', 4, 'Ransomware', false),
  ('e2000000-0000-4000-b000-0000000074c2', 'e2000000-0000-4000-a000-000000000bad', 0, 'Ransomware', false),
  ('e2000000-0000-4000-b000-0000000074c3', 'e2000000-0000-4000-a000-000000000bad', 1, 'HTTPS', true),
  ('e2000000-0000-4000-b000-0000000074c4', 'e2000000-0000-4000-a000-000000000bad', 2, 'Firewall', false),
  ('e2000000-0000-4000-b000-0000000074c5', 'e2000000-0000-4000-a000-000000000bad', 3, 'Spam', false),
  ('e2000000-0000-4000-b000-0000000074c6', 'e2000000-0000-4000-a000-000000000bad', 4, 'Autenticação em dois fatores', false),
  ('e2000000-0000-4000-b000-0000000074cc', 'e2000000-0000-4000-a000-000000000bae', 0, 'Ransomware', false),
  ('e2000000-0000-4000-b000-0000000074cd', 'e2000000-0000-4000-a000-000000000bae', 1, 'Backup', false),
  ('e2000000-0000-4000-b000-0000000074ce', 'e2000000-0000-4000-a000-000000000bae', 2, 'HTTPS', false),
  ('e2000000-0000-4000-b000-0000000074cf', 'e2000000-0000-4000-a000-000000000bae', 3, 'Cco (cópia oculta)', false),
  ('e2000000-0000-4000-b000-0000000074d0', 'e2000000-0000-4000-a000-000000000bae', 4, 'Autenticação em dois fatores', true),
  ('e2000000-0000-4000-b000-0000000074d6', 'e2000000-0000-4000-a000-000000000baf', 0, 'cópia de segurança dos dados, guardada para recuperação em caso de perda', false),
  ('e2000000-0000-4000-b000-0000000074d7', 'e2000000-0000-4000-a000-000000000baf', 1, 'golpe em que mensagens falsas imitam bancos ou órgãos públicos para roubar senhas e dados', true),
  ('e2000000-0000-4000-b000-0000000074d8', 'e2000000-0000-4000-a000-000000000baf', 2, 'mensagem eletrônica não solicitada, enviada em massa', false),
  ('e2000000-0000-4000-b000-0000000074d9', 'e2000000-0000-4000-a000-000000000baf', 3, 'programa malicioso que sequestra arquivos com criptografia e pede resgate', false),
  ('e2000000-0000-4000-b000-0000000074da', 'e2000000-0000-4000-a000-000000000baf', 4, 'protocolo que indica conexão criptografada entre o navegador e o site', false),
  ('e2000000-0000-4000-b000-0000000074e0', 'e2000000-0000-4000-a000-000000000bb0', 0, 'campo do e-mail em que os destinatários não aparecem para os demais', false),
  ('e2000000-0000-4000-b000-0000000074e1', 'e2000000-0000-4000-a000-000000000bb0', 1, 'protocolo que indica conexão criptografada entre o navegador e o site', false),
  ('e2000000-0000-4000-b000-0000000074e2', 'e2000000-0000-4000-a000-000000000bb0', 2, 'programa malicioso que sequestra arquivos com criptografia e pede resgate', true),
  ('e2000000-0000-4000-b000-0000000074e3', 'e2000000-0000-4000-a000-000000000bb0', 3, 'cópia de segurança dos dados, guardada para recuperação em caso de perda', false),
  ('e2000000-0000-4000-b000-0000000074e4', 'e2000000-0000-4000-a000-000000000bb0', 4, 'mensagem eletrônica não solicitada, enviada em massa', false),
  ('e2000000-0000-4000-b000-0000000074ea', 'e2000000-0000-4000-a000-000000000bb1', 0, 'cópia de segurança dos dados, guardada para recuperação em caso de perda', false),
  ('e2000000-0000-4000-b000-0000000074eb', 'e2000000-0000-4000-a000-000000000bb1', 1, 'recurso que controla o tráfego de rede, bloqueando conexões não autorizadas', true),
  ('e2000000-0000-4000-b000-0000000074ec', 'e2000000-0000-4000-a000-000000000bb1', 2, 'proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo', false),
  ('e2000000-0000-4000-b000-0000000074ed', 'e2000000-0000-4000-a000-000000000bb1', 3, 'golpe em que mensagens falsas imitam bancos ou órgãos públicos para roubar senhas e dados', false),
  ('e2000000-0000-4000-b000-0000000074ee', 'e2000000-0000-4000-a000-000000000bb1', 4, 'mensagem eletrônica não solicitada, enviada em massa', false),
  ('e2000000-0000-4000-b000-0000000074f4', 'e2000000-0000-4000-a000-000000000bb2', 0, 'proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo', false),
  ('e2000000-0000-4000-b000-0000000074f5', 'e2000000-0000-4000-a000-000000000bb2', 1, 'programa malicioso que sequestra arquivos com criptografia e pede resgate', false),
  ('e2000000-0000-4000-b000-0000000074f6', 'e2000000-0000-4000-a000-000000000bb2', 2, 'cópia de segurança dos dados, guardada para recuperação em caso de perda', true),
  ('e2000000-0000-4000-b000-0000000074f7', 'e2000000-0000-4000-a000-000000000bb2', 3, 'campo do e-mail em que os destinatários não aparecem para os demais', false),
  ('e2000000-0000-4000-b000-0000000074f8', 'e2000000-0000-4000-a000-000000000bb2', 4, 'mensagem eletrônica não solicitada, enviada em massa', false),
  ('e2000000-0000-4000-b000-0000000074fe', 'e2000000-0000-4000-a000-000000000bb3', 0, 'mensagem eletrônica não solicitada, enviada em massa', true),
  ('e2000000-0000-4000-b000-0000000074ff', 'e2000000-0000-4000-a000-000000000bb3', 1, 'proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo', false),
  ('e2000000-0000-4000-b000-000000007500', 'e2000000-0000-4000-a000-000000000bb3', 2, 'cópia de segurança dos dados, guardada para recuperação em caso de perda', false),
  ('e2000000-0000-4000-b000-000000007501', 'e2000000-0000-4000-a000-000000000bb3', 3, 'recurso que controla o tráfego de rede, bloqueando conexões não autorizadas', false),
  ('e2000000-0000-4000-b000-000000007502', 'e2000000-0000-4000-a000-000000000bb3', 4, 'programa malicioso que sequestra arquivos com criptografia e pede resgate', false),
  ('e2000000-0000-4000-b000-000000007508', 'e2000000-0000-4000-a000-000000000bb4', 0, 'programa malicioso que sequestra arquivos com criptografia e pede resgate', false),
  ('e2000000-0000-4000-b000-000000007509', 'e2000000-0000-4000-a000-000000000bb4', 1, 'golpe em que mensagens falsas imitam bancos ou órgãos públicos para roubar senhas e dados', false),
  ('e2000000-0000-4000-b000-00000000750a', 'e2000000-0000-4000-a000-000000000bb4', 2, 'recurso que controla o tráfego de rede, bloqueando conexões não autorizadas', false),
  ('e2000000-0000-4000-b000-00000000750b', 'e2000000-0000-4000-a000-000000000bb4', 3, 'protocolo que indica conexão criptografada entre o navegador e o site', false),
  ('e2000000-0000-4000-b000-00000000750c', 'e2000000-0000-4000-a000-000000000bb4', 4, 'campo do e-mail em que os destinatários não aparecem para os demais', true),
  ('e2000000-0000-4000-b000-000000007512', 'e2000000-0000-4000-a000-000000000bb5', 0, 'proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo', false),
  ('e2000000-0000-4000-b000-000000007513', 'e2000000-0000-4000-a000-000000000bb5', 1, 'mensagem eletrônica não solicitada, enviada em massa', false),
  ('e2000000-0000-4000-b000-000000007514', 'e2000000-0000-4000-a000-000000000bb5', 2, 'cópia de segurança dos dados, guardada para recuperação em caso de perda', false),
  ('e2000000-0000-4000-b000-000000007515', 'e2000000-0000-4000-a000-000000000bb5', 3, 'protocolo que indica conexão criptografada entre o navegador e o site', true),
  ('e2000000-0000-4000-b000-000000007516', 'e2000000-0000-4000-a000-000000000bb5', 4, 'programa malicioso que sequestra arquivos com criptografia e pede resgate', false),
  ('e2000000-0000-4000-b000-00000000751c', 'e2000000-0000-4000-a000-000000000bb6', 0, 'golpe em que mensagens falsas imitam bancos ou órgãos públicos para roubar senhas e dados', false),
  ('e2000000-0000-4000-b000-00000000751d', 'e2000000-0000-4000-a000-000000000bb6', 1, 'mensagem eletrônica não solicitada, enviada em massa', false),
  ('e2000000-0000-4000-b000-00000000751e', 'e2000000-0000-4000-a000-000000000bb6', 2, 'protocolo que indica conexão criptografada entre o navegador e o site', false),
  ('e2000000-0000-4000-b000-00000000751f', 'e2000000-0000-4000-a000-000000000bb6', 3, 'programa malicioso que sequestra arquivos com criptografia e pede resgate', false),
  ('e2000000-0000-4000-b000-000000007520', 'e2000000-0000-4000-a000-000000000bb6', 4, 'proteção que exige, além da senha, um código enviado ao celular ou gerado por aplicativo', true),
  ('e2000000-0000-4000-b000-000000007526', 'e2000000-0000-4000-a000-000000000bb7', 0, '=MÍNIMO(A1:A5)', false),
  ('e2000000-0000-4000-b000-000000007527', 'e2000000-0000-4000-a000-000000000bb7', 1, '=SOMA(A1:A5)', true),
  ('e2000000-0000-4000-b000-000000007528', 'e2000000-0000-4000-a000-000000000bb7', 2, '=PROCV(B2;D2:E20;2;0)', false),
  ('e2000000-0000-4000-b000-000000007529', 'e2000000-0000-4000-a000-000000000bb7', 3, '=MÉDIA(A1:A5)', false),
  ('e2000000-0000-4000-b000-00000000752a', 'e2000000-0000-4000-a000-000000000bb7', 4, '=CONT.SE(A1:A5;">10")', false),
  ('e2000000-0000-4000-b000-000000007530', 'e2000000-0000-4000-a000-000000000bb8', 0, '=SE(A1>=7;"Aprovado";"Reprovado")', false),
  ('e2000000-0000-4000-b000-000000007531', 'e2000000-0000-4000-a000-000000000bb8', 1, '=CONT.SE(A1:A5;">10")', false),
  ('e2000000-0000-4000-b000-000000007532', 'e2000000-0000-4000-a000-000000000bb8', 2, '=MÉDIA(A1:A5)', true),
  ('e2000000-0000-4000-b000-000000007533', 'e2000000-0000-4000-a000-000000000bb8', 3, '=MÍNIMO(A1:A5)', false),
  ('e2000000-0000-4000-b000-000000007534', 'e2000000-0000-4000-a000-000000000bb8', 4, '=PROCV(B2;D2:E20;2;0)', false)
on conflict (id) do nothing;
commit;
