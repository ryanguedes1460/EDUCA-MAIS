-- Educa Mais · provas (ENEM oficial e concursos), parte 1 de 17 (gerado por scripts/gerar-provas.mjs)
-- Cole no Supabase > SQL Editor e clique em Run. Pode rodar de novo sem duplicar nada.
begin;
insert into public.questions (id, code, subject_id, topic_id, level, difficulty, board_id, year, qtype, theme, statement, explanation, hint, source, status, updated_at) values
  ('e2000000-0000-4000-a000-000000000001', 'ENEM-2009-001', 6, 400, 'enem', 3, 2, 2009, 'multiple_choice', 'Calor e termodinâmica', 'A atmosfera terrestre é composta pelos gases nitrogênio (N2) e oxigênio (O2), que somam cerca de 99%, e por gases traços, entre eles o gás carbônico (CO2), vapor de água (H2O), metano (CH4), ozônio (O3) e o óxido nitroso (N2O), que compõem o restante 1% do ar que respiramos. Os gases traços, por serem constituídos por pelo menos três átomos, conseguem absorver o calor irradiado pela Terra, aquecendo o planeta. Esse fenômeno, que acontece  
há bilhões de anos, é chamado de efeito estufa. A partir da Revolução Industrial (século XIX), a concentração de gases traços na atmosfera, em particular o CO2, tem aumentado significativamente, o que resultou no aumento da temperatura em escala global. Mais recentemente, outro fator tornou-se diretamente envolvido no aumento da concentração de CO2 na atmosfera: o desmatamento.

BROWN, I. F.; ALECHANDRE, A. S. Conceitos básicos sobre clima,carbono, florestas e comunidades. A.G. Moreira & S. Schwartzman. As mudanças climáticas globais e os ecossistemas brasileiros. Brasília: Instituto de Pesquisa Ambiental da Amazônia, 2000 (adaptado).

Considerando o texto, uma alternativa viável para combater o efeito estufa é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 1 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000002', 'ENEM-2009-002', 7, 401, 'enem', 3, 2, 2009, 'multiple_choice', 'Funções e reações orgânicas', 'Analise a figura.

![](conteudo/enem/2009/2-7af3247b.webp)

Supondo que seja necessário dar um título para essa figura, a alternativa que melhor traduziria o processo representado seria:', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 2 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000003', 'ENEM-2009-003', 5, 261, 'enem', 3, 2, 2009, 'multiple_choice', 'Doenças e prevenção', 'Estima-se que haja atualmente no mundo 40 milhões de pessoas infectadas pelo HIV (o vírus que causa a AIDS), sendo que as taxas de novas infecções continuam crescendo, principalmente na África, Ásia e Rússia. Nesse cenário de pandemia, uma vacina contra o HIV teria imenso impacto, pois salvaria milhões de vidas. Certamente seria um marco na história planetária e também uma esperança para as populações carentes de tratamento antiviral e de acompanhamento médico.

TANURI, A.; FERREIRA JUNIOR, O. C. Vacina contra Aids: desafios e esperanças. Ciência Hoje (44) 26, 2009 (adaptado).

Uma vacina eficiente contra o HIV deveria', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 3 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000004', 'ENEM-2009-004', 5, 402, 'enem', 3, 2, 2009, 'multiple_choice', 'Plantas e fotossíntese', 'Em um experimento, preparou-se um conjunto de plantas por técnica de clonagem a partir de uma planta original que apresentava folhas verdes. Esse conjunto foi dividido em dois grupos, que foram tratados de maneira idêntica, com exceção das condições de iluminação, sendo um grupo exposto a ciclos de iluminação solar natural e outro mantido no escuro. Após alguns dias, observou-se que o grupo exposto à luz apresentava folhas verdes como a planta original e o grupo cultivado no escuro apresentava folhas amareladas.

Ao final do experimento, os dois grupos de plantas apresentaram', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 4 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000005', 'ENEM-2009-005', 5, 403, 'enem', 3, 2, 2009, 'multiple_choice', 'DNA, genes e hereditariedade', 'Na linha de uma tradição antiga, o astrônomo grego Ptolomeu (100-170 d.C.) afirmou a tese do geocentrismo, segundo a qual a Terra seria o centro do universo, sendo que o Sol, a Lua e os planetas girariam em seu redor em órbitas circulares. A teoria de Ptolomeu resolvia de modo razoável os problemas astronômicos da sua época. Vários séculos mais tarde, o clérigo e astrônomo polonês Nicolau Copérnico (1473-1543), ao encontrar inexatidões na teoria de Ptolomeu, formulou a teoria do heliocentrismo, segundo a qual o Sol deveria ser considerado o centro do universo, com a Terra, a Lua e os planetas girando circularmente em torno dele. Por fim, o astrônomo e matemático alemão Johannes Kepler (1571- 1630), depois de estudar o planeta Marte por cerca de trinta anos, verificou que a sua órbita é elíptica. Esse resultado generalizou-se para os demais planetas.

A respeito dos estudiosos citados no texto, é correto afirmar que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 5 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000006', 'ENEM-2009-006', 5, 402, 'enem', 3, 2, 2009, 'multiple_choice', 'Plantas e fotossíntese', 'O ciclo biogeoquímico do carbono compreende diversos compartimentos, entre os quais a Terra, a atmosfera e os oceanos, e diversos processos que permitem a transferência de compostos entre esses reservatórios. Os estoques de carbono armazenados na forma de recursos não renováveis, por exemplo, o petróleo, são limitados, sendo de grande relevância que se perceba a importância da substituição de combustíveis fósseis por combustíveis de fontes renováveis.

A utilização de combustíveis fósseis interfere no ciclo do carbono, pois provoca', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 6 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000007', 'ENEM-2009-007', 5, 404, 'enem', 3, 2, 2009, 'multiple_choice', 'Fisiologia humana', 'Um novo método para produzir insulina artificial que utiliza tecnologia de DNA recombinante foi desenvolvido por pesquisadores do Departamento de Biologia Celular da Universidade de Brasília (UnB) em parceria com a iniciativa privada. Os pesquisadores modificaram geneticamente a bactéria Escherichia coli para torná-la capaz de sintetizar o hormônio. O processo permitiu fabricar insulina em maior quantidade e em apenas 30 dias, um terço do tempo necessário para obtê-la pelo método tradicional, que consiste na extração do hormônio a partir do pâncreas de animais abatidos.

Ciência Hoje, 24 abr. 2001. Disponível em: http://cienciahoje.uol.com.br (adaptado).

A produção de insulina pela técnica do DNA recombinante tem, como consequência,', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 7 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000008', 'ENEM-2009-008', 6, 405, 'enem', 3, 2, 2009, 'multiple_choice', 'Trabalho, energia e potência', 'A economia moderna depende da disponibilidade de muita energia em diferentes formas, para funcionar e crescer. No Brasil, o consumo total de energia pelas indústrias cresceu mais de quatro vezes no período entre 1970 e 2005. Enquanto os investimentos em energias limpas e renováveis, como solar e eólica, ainda são incipientes, ao se avaliar a possibilidade de instalação de usinas geradoras de energia elétrica, diversos fatores devem ser levados em consideração, tais como os impactos causados ao ambiente e às populações locais.

RICARDO, B.; CAMPANILI, M. **Almanaque Brasil Socioambiental.** São Paulo: Instituto Socioambiental, 2007 (adaptado).

Em uma situação hipotética, optou-se por construir uma usina hidrelétrica em região que abrange diversas quedas d’água em rios cercados por mata, alegando-se que causaria impacto ambiental muito menor que uma usina termelétrica. Entre os possíveis impactos da instalação de uma usina hidrelétrica nessa região, inclui-se', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 8 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000009', 'ENEM-2009-009', 5, 402, 'enem', 3, 2, 2009, 'multiple_choice', 'Plantas e fotossíntese', 'As mudanças climáticas e da vegetação ocorridas nos trópicos da América do Sul têm sido bem documentadas por diversos autores, existindo um grande acúmulo de evidências geológicas ou paleoclimatológicas que evidenciam essas mudanças ocorridas durante o Quaternário nessa região. Essas mudanças resultaram em restrição da distribuição das florestas pluviais, com expansões concomitantes de habitats não-florestais durante períodos áridos (glaciais), seguido da expansão das florestas pluviais e restrição das áreas não-florestais durante períodos úmidos (interglaciais).

Disponível em: http://zoo.bio.ufpr.br. Acesso em: 1 maio 2009.

Durante os períodos glaciais,', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 9 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000000a', 'ENEM-2009-010', 5, 402, 'enem', 3, 2, 2009, 'multiple_choice', 'Plantas e fotossíntese', 'A fotossíntese é importante para a vida na Terra. Nos cloroplastos dos organismos fotossintetizantes, a energia solar é convertida em energia química que, juntamente com água e gás carbônico (CO2), é utilizada para a síntese de compostos orgânicos (carboidratos). A fotossíntese é o único processo de importância biológica capaz de realizar essa conversão. Todos os organismos, incluindo os produtores, aproveitam a energia armazenada nos carboidratos para impulsionar os processos celulares, liberando CO2 para a atmosfera e água para a célula por meio da respiração celular. Além disso, grande fração dos recursos energéticos do planeta, produzidos tanto no presente (biomassa) como em tempos remotos (combustível fóssil), é resultante da atividade fotossintética.

As informações sobre obtenção e transformação dos recursos naturais por meio dos processos vitais de fotossíntese e respiração, descritas no texto, permitem concluir que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 10 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000000b', 'ENEM-2009-011', 6, 400, 'enem', 3, 2, 2009, 'multiple_choice', 'Calor e termodinâmica', 'Para que todos os órgãos do corpo humano funcionem em boas condições, é necessário que a temperatura do corpo fique sempre entre 36ºC e 37ºC. Para manter-se dentro dessa faixa, em dias de muito calor ou durante intensos exercícios físicos, uma série de mecanismos fisiológicos é acionada.

Pode-se citar como o principal responsável pela manutenção da temperatura corporal humana o sistema', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 11 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000000c', 'ENEM-2009-012', 7, 26, 'enem', 3, 2, 2009, 'multiple_choice', 'pH e acidez', '![](conteudo/enem/2009/12-233eafdb.webp)

Em solução, os ânions do sabão podem hidrolisar a água e, desse modo, formar o ácido carboxílico correspondente. Por exemplo, para o estearato de sódio, é estabelecido o seguinte equilíbrio:

![](conteudo/enem/2009/12-63593c90.webp)

Uma vez que o ácido carboxílico formado é pouco solúvel em água e menos eficiente na remoção de gorduras, o pH do meio deve ser controlado de maneira a evitar que o equilíbrio acima seja deslocado para a direita.

Com base nas informações do texto, é correto concluir que os sabões atuam de maneira:', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 12 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000000d', 'ENEM-2009-013', 5, 406, 'enem', 3, 2, 2009, 'multiple_choice', 'Ecossistemas e relações ecológicas', 'A abertura e a pavimentação de rodovias em zonas rurais e regiões afastadas dos centros urbanos, por um lado, possibilita melhor acesso e maior integração entre as comunidades, contribuindo com o desenvolvimento social e urbano de populações isoladas. Por outro lado, a construção de rodovias pode trazer impactos indesejáveis ao meio ambiente, visto que a abertura de estradas pode resultar na fragmentação de habitats, comprometendo o fluxo gênico e as interações entre espécies silvestres, além de prejudicar o fluxo natural de rios e riachos, possibilitar o ingresso de espécies exóticas em ambientes naturais e aumentar a pressão antrópica sobre os ecossistemas nativos.

BARBOSA, N. P. U.; FERNANDES, G. W. A destruição do jardim. **Scientific American** **Brasil.** Ano 7, número 80, dez. 2008 (adaptado).

Nesse contexto, para conciliar os interesses aparentemente contraditórios entre o progresso social e urbano e a conservação do meio ambiente, seria razoável', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 13 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000000e', 'ENEM-2009-014', 6, 407, 'enem', 3, 2, 2009, 'multiple_choice', 'Circuitos e energia elétrica', '![](conteudo/enem/2009/14-524ed514.webp)

Aumentar a eficiência dos processos de conversão de energia implica economizar recursos e combustíveis. Das propostas seguintes, qual resultará em maior aumento da eficiência geral do processo?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 14 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000000f', 'ENEM-2009-015', 7, 408, 'enem', 3, 2, 2009, 'multiple_choice', 'Eletroquímica', '![](conteudo/enem/2009/15-a4e6a5bb.webp)

Entre as impurezas metálicas que constam na série apresentada, as que se sedimentam abaixo do ânodo de cobre são', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 15 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000010', 'ENEM-2009-016', 5, 403, 'enem', 3, 2, 2009, 'multiple_choice', 'DNA, genes e hereditariedade', 'A figura seguinte representa um modelo de transmissão da informação genética nos sistemas biológicos. No fim do processo, que inclui a replicação, a transcrição e a tradução, há três formas proteicas diferentes denominadas a, b e c.

![](conteudo/enem/2009/16-2c67a1f7.webp)

Depreende-se do modelo que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 16 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000011', 'ENEM-2009-017', 6, 409, 'enem', 3, 2, 2009, 'multiple_choice', 'Movimento', 'O Brasil pode se transformar no primeiro país das Américas a entrar no seleto grupo das nações que dispõem de trens-bala. O Ministério dos Transportes prevê o lançamento do edital de licitação internacional para a construção da ferrovia de alta velocidade Rio-São Paulo. A viagem ligará os 403 quilômetros entre a Central do Brasil, no Rio, e a Estação da Luz, no centro da capital paulista, em uma hora e 25 minutos.

Disponível em: http://oglobo.globo.com. Acesso em: 14 jul. 2009

Devido à alta velocidade, um dos problemas a ser enfrentado na escolha do trajeto que será percorrido pelo trem é o dimensionamento das curvas. Considerando-se que uma aceleração lateral confortável para os passageiros e segura para o trem seja de 0,1 g, em que g é a aceleração da gravidade (considerada igual a 10 m/s²), e que a velocidade do trem se mantenha constante em todo o percurso, seria correto prever que as curvas existentes no trajeto deveriam ter raio de curvatura mínimo de, aproximadamente,', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 17 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000012', 'ENEM-2009-018', 6, 407, 'enem', 3, 2, 2009, 'multiple_choice', 'Circuitos e energia elétrica', '![](conteudo/enem/2009/18-984c1d41.webp)

Considere-se que um auditório possua capacidade para 40 pessoas, cada uma produzindo uma quantidade média
de calor, e que praticamente todo o calor que flui para fora do auditório o faz por meio dos aparelhos de ar condicionado. Nessa situação, entre as informações listadas, aquelas essenciais para se determinar quantos e/ou quais aparelhos de ar-condicionado são precisos para manter, com lotação máxima, a temperatura interna do auditório agradável e constante, bem como determinar a espessura da fiação do circuito elétrico para a ligação desses aparelhos, são', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 18 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000013', 'ENEM-2009-019', 6, 407, 'enem', 3, 2, 2009, 'multiple_choice', 'Circuitos e energia elétrica', '![](conteudo/enem/2009/19-ce14eccd.webp)

A escolha das lâmpadas é essencial para obtenção de uma boa iluminação. A potência da lâmpada deverá estar de acordo com o tamanho do cômodo a ser iluminado. O quadro a seguir mostra a relação entre as áreas dos cômodos (em m²) e as potências das lâmpadas (em W), e foi utilizado como referência para o primeiro pavimento de uma residência.

![](conteudo/enem/2009/19-9747c953.webp)

Considerando a planta baixa fornecida, com todos os aparelhos em funcionamento, a potência total, em watts, será de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 19 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000014', 'ENEM-2009-020', 6, 405, 'enem', 3, 2, 2009, 'multiple_choice', 'Trabalho, energia e potência', '![](conteudo/enem/2009/20-a5b76cbb.webp)

Se fosse necessário melhorar o rendimento dessa usina, que forneceria eletricidade para abastecer uma cidade, qual das seguintes ações poderia resultar em alguma economia de energia, sem afetar a capacidade de geração da usina?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 20 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000015', 'ENEM-2009-021', 5, 406, 'enem', 3, 2, 2009, 'multiple_choice', 'Ecossistemas e relações ecológicas', 'Os seres vivos apresentam diferentes ciclos de vida, caracterizados pelas fases nas quais gametas são produzidos e pelos processos reprodutivos que resultam na geração de novos indivíduos.

Considerando-se um modelo simplificado padrão para geração de indivíduos viáveis, a alternativa que corresponde ao observado em seres humanos é:', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 21 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000016', 'ENEM-2009-022', 6, 407, 'enem', 3, 2, 2009, 'multiple_choice', 'Circuitos e energia elétrica', 'Um medicamento, após ser ingerido, atinge a corrente sanguínea e espalha-se pelo organismo, mas, como suas moléculas “não sabem” onde é que está o problema, podem atuar em locais diferentes do local “alvo” e desencadear efeitos além daqueles desejados. Não seria perfeito se as moléculas dos medicamentos soubessem exatamente onde está o problema e fossem apenas até aquele local exercer sua ação? A técnica conhecida como iontoforese, indolor e não invasiva, promete isso. Como mostram as figuras, essa nova técnica baseia-se na aplicação de uma corrente elétrica de baixa intensidade sobre a pele do paciente, permitindo que fármacos permeiem membranas biológicas e alcancem a corrente sanguínea, sem passar pelo estômago. Muitos pacientes relatam apenas um formigamento no local de aplicação. O objetivo da corrente elétrica é formar poros que permitam a passagem do fármaco de interesse. A corrente elétrica é distribuída por eletrodos, positivo e negativo, por meio de uma solução aplicada sobre a pele. Se a molécula do medicamento tiver carga elétrica positiva ou negativa, ao entrar em contato com o eletrodo de carga de mesmo sinal, ela será repelida e forçada a entrar na pele (eletrorrepulsão – A). Se for neutra, a molécula será forçada a entrar na pele juntamente com o fluxo de solvente fisiológico que se forma entre os eletrodos (eletrosmose – B).

![](conteudo/enem/2009/22-5109eb3c.webp)

De acordo com as informações contidas no texto e nas figuras, o uso da iontoforese', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 22 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000017', 'ENEM-2009-023', 7, 408, 'enem', 3, 2, 2009, 'multiple_choice', 'Eletroquímica', 'Cerca de 1% do lixo urbano é constituído por resíduos sólidos contendo elementos tóxicos. Entre esses elementos estão metais pesados como o cádmio, o chumbo e o mercúrio, componentes de pilhas e baterias, que são perigosos à saúde humana e ao meio ambiente. Quando descartadas em lixos comuns, pilhas e baterias vão para aterros sanitários ou lixões a céu aberto, e o vazamento de seus componentes contamina o solo, os rios e o lençol freático, atingindo a flora e a fauna. Por serem bioacumulativos e não biodegradáveis, esses metais chegam de forma acumulada aos seres humanos, por meio da cadeia alimentar. A legislação vigente (Resolução CONAMA no 257/1999) regulamenta o destino de pilhas e baterias após seu esgotamento energético e determina aos fabricantes e/ou importadores a quantidade máxima permitida desses metais em cada tipo de pilha/bateria, porém o problema ainda persiste.

Disponível em: http://www.mma.gov.br.  
Acesso em: 11 jul. 2009 (adaptado).

Uma medida que poderia contribuir para acabar definitivamente com o problema da poluição ambiental por metais pesados relatado no texto seria', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 23 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000018', 'ENEM-2009-024', 6, 400, 'enem', 3, 2, 2009, 'multiple_choice', 'Calor e termodinâmica', 'Umidade relativa do ar é o termo usado para descrever a quantidade de vapor de água contido na atmosfera. Ela é definida pela razão entre o conteúdo real de umidade de uma parcela de ar e a quantidade de umidade que a mesma parcela de ar pode armazenar na mesma temperatura e pressão quando está saturada de vapor, isto é, com 100% de umidade relativa. O gráfico representa a relação entre a umidade relativa do ar e sua temperatura ao longo de um período de 24 horas em um determinado local.

![](conteudo/enem/2009/24-53ebbcea.webp)

Considerando-se as informações do texto e do gráfico, conclui-se que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 24 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000019', 'ENEM-2009-025', 5, 411, 'enem', 3, 2, 2009, 'multiple_choice', 'Animais', 'Os planos de controle e erradicação de doenças em animais envolvem ações de profilaxia e dependem em grande medida da correta utilização e interpretação de testes diagnósticos. O quadro mostra um exemplo hipotético de aplicação de um teste diagnóstico.

![](conteudo/enem/2009/25-404c9597.webp)

Considerando que, no teste diagnóstico, a sensibilidade é a probabilidade de um animal infectado ser classificado como positivo e a especificidade é a probabilidade de um animal não infectado ter resultado negativo, a interpretação do quadro permite inferir que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 25 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000001a', 'ENEM-2009-026', 7, 26, 'enem', 3, 2, 2009, 'multiple_choice', 'pH e acidez', 'O processo de industrialização tem gerado sérios problemas de ordem ambiental, econômica e social, entre os quais se pode citar a chuva ácida. Os ácidos usualmente presentes em maiores proporções na água da chuva são o H2CO3, formado pela reação do CO2 atmosférico com a água, o HNO3 , o HNO2 , o H2SO4 e o H2SO3 . Esses quatro últimos são formados principalmente a partir da reação da água com os óxidos de nitrogênio e de enxofre gerados pela queima de combustíveis fósseis.

A formação de chuva mais ou menos ácida depende não só da concentração do ácido formado, como também do tipo de ácido. Essa pode ser uma informação útil na elaboração de estratégias para minimizar esse problema ambiental. Se consideradas concentrações idênticas, quais dos ácidos citados no texto conferem maior acidez às águas das chuvas?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 26 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000001b', 'ENEM-2009-027', 6, 412, 'enem', 3, 2, 2009, 'multiple_choice', 'Forças e leis de Newton', '![](conteudo/enem/2009/27-8a0ca647.webp)

Considerando o texto e as leis de Kepler, pode-se afirmar que a frase dita pelo astronauta', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 27 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000001c', 'ENEM-2009-028', 5, 402, 'enem', 3, 2, 2009, 'multiple_choice', 'Plantas e fotossíntese', 'Uma pesquisadora deseja reflorestar uma área de mata ciliar quase que totalmente desmatada. Essa formação vegetal é um tipo de floresta muito comum nas margens de rios dos cerrados no Brasil central e, em seu clímax, possui vegetação arbórea perene e apresenta dossel fechado, com pouca incidência luminosa no solo e nas plântulas. Sabe-se que a incidência de luz, a disponibilidade de nutrientes e a umidade do solo são os principais fatores do meio ambiente físico que influenciam no desenvolvimento da planta. Para testar unicamente os efeitos da variação de luz, a pesquisadora analisou, em casas de vegetação com condições controladas, o desenvolvimento de plantas de 10 espécies nativas da região desmatada sob quatro condições de luminosidade: uma sob sol pleno e as demais em diferentes níveis de sombreamento. Para cada tratamento experimental, a pesquisadora relatou se o desenvolvimento da planta foi bom, razoável ou ruim, de acordo com critérios específicos. Os resultados obtidos foram os seguintes:

![](conteudo/enem/2009/28-d003c721.webp)

Para o reflorestamento da região desmatada,', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 28 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000001d', 'ENEM-2009-029', 7, 413, 'enem', 3, 2, 2009, 'multiple_choice', 'Átomo, tabela periódica e ligações', '![](conteudo/enem/2009/29-8b64e737.webp)

O antimônio é um elemento químico que possui 50 prótons e possui vários isótopos ― átomos que só se diferem pelo número de nêutrons. De acordo com o gráfico, os isótopos estáveis do antimônio possuem', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 29 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000001e', 'ENEM-2009-030', 7, 414, 'enem', 3, 2, 2009, 'multiple_choice', 'Química e ambiente', 'É possível, com 1 litro de gasolina, usando todo o calor produzido por sua combustão direta, aquecer 200 litros de água de 20 °C a 55 °C. Pode-se efetuar esse mesmo aquecimento por um gerador de eletricidade, que consome 1 litro de gasolina por hora e fornece 110 V a um resistor de 11 Ω, imerso na água, durante um certo intervalo de tempo. Todo o calor liberado pelo resistor é transferido à água.

Considerando que o calor específico da água é igual a 4,19 J g-1 °C-1, aproximadamente qual a quantidade de gasolina consumida para o aquecimento de água obtido pelo gerador, quando comparado ao obtido a partir da combustão?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 30 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000001f', 'ENEM-2009-031', 6, 415, 'enem', 3, 2, 2009, 'multiple_choice', 'Ondas, som e luz', 'O progresso da tecnologia introduziu diversos artefatos geradores de campos eletromagnéticos. Uma das mais empregadas invenções nessa área são os telefones celulares e smartphones. As tecnologias de transmissão de celular atualmente em uso no Brasil contemplam dois sistemas. O primeiro deles é operado entre as frequências de 800 MHz e 900 MHz e constitui os chamados sistemas TDMA/CDMA. Já a tecnologia GSM, ocupa a frequência de 1.800 MHz.

Considerando que a intensidade de transmissão e o nível de recepção “celular” sejam os mesmos para as tecnologias de transmissão TDMA/CDMA ou GSM, se um engenheiro tiver de escolher entre as duas tecnologias para obter a mesma cobertura, levando em consideração apenas o número de antenas em uma região, ele deverá escolher:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 31 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000020', 'ENEM-2009-032', 7, 413, 'enem', 3, 2, 2009, 'multiple_choice', 'Átomo, tabela periódica e ligações', '![](conteudo/enem/2009/32-2f78c8cf.webp)

Dentre os fenômenos decorrentes da interação entre a radiação e os átomos do indivíduo que permitem a obtenção desta imagem inclui-se a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 32 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000021', 'ENEM-2009-033', 5, 406, 'enem', 3, 2, 2009, 'multiple_choice', 'Ecossistemas e relações ecológicas', 'Os ratos _Peromyscus polionotus_ encontram-se distribuídos em ampla região na América do Norte. A pelagem de ratos dessa espécie varia do marrom claro até o escuro, sendo que os ratos de uma mesma população têm coloração muito semelhante. Em geral, a coloração da pelagem também é muito parecida à cor do solo da região em que se encontram, que também apresenta a mesma variação de cor, distribuída ao longo de um gradiente sul-norte. Na figura, encontram-se representadas sete diferentes populações de _P. polionotus_. Cada população é representada pela pelagem do rato, por uma amostra de solo e por sua posição geográfica no mapa.

![](conteudo/enem/2009/33-a2e94298.webp)

O mecanismo evolutivo envolvido na associação entre cores de pelagem e de substrato é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 33 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000022', 'ENEM-2009-034', 7, 401, 'enem', 3, 2, 2009, 'multiple_choice', 'Funções e reações orgânicas', 'O lixo orgânico de casa – constituído de restos de verduras, frutas, legumes, cascas de ovo, aparas de grama, entre outros –, se for depositado nos lixões, pode contribuir para o aparecimento de animais e de odores indesejáveis. Entretanto, sua reciclagem gera um excelente adubo orgânico, que pode ser usado no cultivo de hortaliças, frutíferas e plantas ornamentais. A produção do adubo ou composto orgânico se dá por meio da compostagem, um processo simples que requer alguns cuidados especiais. O material que é acumulado diariamente em recipientes próprios deve ser revirado com auxílio de ferramentas adequadas, semanalmente, de forma a homogeneizá-lo. É preciso também umedecê-lo periodicamente. O material de restos de capina pode ser intercalado entre uma camada e outra de lixo da cozinha. Por meio desse método, o adubo orgânico estará pronto em aproximadamente dois a três meses.

Como usar o lixo orgânico em casa? Ciência Hoje, v. 42, jun. 2008 (adaptado).

Suponha que uma pessoa, desejosa de fazer seu próprio adubo orgânico, tenha seguido o procedimento descrito no texto exceto no que se refere ao umedecimento periódico do composto. Nessa situação,', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 34 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000023', 'ENEM-2009-035', 6, 400, 'enem', 3, 2, 2009, 'multiple_choice', 'Calor e termodinâmica', '![](conteudo/enem/2009/35-9d8b484b.webp)

Considerando que a distância entre a borda inferior e a borda superior da superfície refletora tenha 6 m de largura e que focaliza no receptor os 800 watts/m² de radiação provenientes do Sol, e que o calor específico da água é 1 cal g-1 ºC-1 = 4.200 J kg-1 ºC-1, então o comprimento linear do refletor parabólico necessário para elevar a temperatura de 1 m³ (equivalente a 1 t) de água de 20 °C para 100 °C, em uma hora, estará entre', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 35 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000024', 'ENEM-2009-036', 6, 405, 'enem', 3, 2, 2009, 'multiple_choice', 'Trabalho, energia e potência', 'O uso de protetores solares em situações de grande exposição aos raios solares como, por exemplo, nas praias, é de grande importância para a saúde. As moléculas ativas de um protetor apresentam, usualmente, anéis aromáticos conjugados com grupos carbonila, pois esses sistemas são capazes de absorver a radiação ultravioleta mais nociva aos seres humanos. A conjugação é definida como a ocorrência de alternância entre ligações simples e duplas em uma molécula. Outra propriedade das moléculas em questão é apresentar, em uma de suas extremidades, uma parte apolar responsável por reduzir a solubilidade do composto em água, o que impede sua rápida remoção quando do contato com a água.

De acordo com as considerações do texto, qual das moléculas apresentadas a seguir é a mais adequada para funcionar como molécula ativa de protetores solares?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 36 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000025', 'ENEM-2009-037', 6, 416, 'enem', 3, 2, 2009, 'multiple_choice', 'Lentes, espelhos e luz', 'Sabe-se que o olho humano não consegue diferenciar componentes de cores e vê apenas a cor resultante, diferentemente do ouvido, que consegue distinguir, por exemplo, dois instrumentos diferentes tocados simultaneamente. Os raios luminosos do espectro visível, que têm comprimento de onda entre 380 nm e 780 nm, incidem na córnea, passam pelo cristalino e são projetados na retina. Na retina, encontram-se dois tipos de fotorreceptores, os cones e os bastonetes, que convertem a cor e a intensidade da luz recebida em impulsos nervosos. Os cones distinguem as cores primárias: vermelho, verde e azul, e os bastonetes diferenciam apenas níveis de intensidade, sem separar comprimentos de onda. Os impulsos nervosos produzidos são enviados ao cérebro por meio do nervo óptico, para que se dê a percepção da imagem.

Um indivíduo que, por alguma deficiência, não consegue captar as informações transmitidas pelos cones, perceberá um objeto branco, iluminado apenas por luz vermelha, como', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 37 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000026', 'ENEM-2009-038', 7, 401, 'enem', 3, 2, 2009, 'multiple_choice', 'Funções e reações orgânicas', 'Durante uma ação de fiscalização em postos de combustíveis, foi encontrado um mecanismo inusitado para enganar o consumidor. Durante o inverno, o responsável por um posto de combustível compra álcool por R$ 0,50/litro, a uma temperatura de 5 °C. Para revender o líquido aos motoristas, instalou um mecanismo na bomba de combustível para aquecê-lo, para que atinja a temperatura de 35 °C, sendo o litro de álcool revendido a R$ 1,60. Diariamente o posto compra 20 mil litros de álcool a 5 ºC e os revende.

Com relação à situação hipotética descrita no texto e dado que o coeficiente de dilatação volumétrica do álcool é de 1×10-3 ºC-1, desprezando-se o custo da energia gasta no aquecimento do combustível, o ganho financeiro que o dono do posto teria obtido devido ao aquecimento do álcool após uma semana de vendas estaria entre', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 38 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000027', 'ENEM-2009-039', 6, 400, 'enem', 3, 2, 2009, 'multiple_choice', 'Calor e termodinâmica', 'A invenção da geladeira proporcionou uma revolução no aproveitamento dos alimentos, ao permitir que fossem armazenados e transportados por longos períodos. A figura apresentada ilustra o processo cíclico de funcionamento de uma geladeira, em que um gás no interior de uma tubulação é forçado a circular entre o congelador e a parte externa da geladeira. É por meio dos processos de compressão, que ocorre na parte externa, e de expansão, que ocorre na parte interna, que o gás proporciona a troca de calor entre o interior e o exterior da geladeira.

Disponível em: http://home.howstuffworks.com. Acesso em: 19 out. 2008 (adaptado).

![](conteudo/enem/2009/39-6991cb0b.webp)

Nos processos de transformação de energia envolvidos no funcionamento da geladeira,', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 39 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000028', 'ENEM-2009-040', 5, 261, 'enem', 3, 2, 2009, 'multiple_choice', 'Doenças e prevenção', 'Na manipulação em escala nanométrica, os átomos revelam características peculiares, podendo apresentar tolerância à temperatura, reatividade química, condutividade elétrica, ou mesmo exibir força de intensidade extraordinária. Essas características explicam o interesse industrial pelos nanomateriais que estão sendo muito pesquisados em diversas áreas, desde o desenvolvimento de cosméticos, tintas e tecidos, até o de terapias contra o câncer.

LACAVA, Z. G. M; MORAIS, P. C. Nanobiotecnologia e Saúde. Disponível em: http://www.comciencia.br (adaptado).

A utilização de nanopartículas na indústria e na medicina requer estudos mais detalhados, pois', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 40 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000029', 'ENEM-2009-041', 5, 403, 'enem', 3, 2, 2009, 'multiple_choice', 'DNA, genes e hereditariedade', 'Uma vítima de acidente de carro foi encontrada carbonizada devido a uma explosão. Indícios, como certos adereços de metal usados pela vítima, sugerem que a mesma seja filha de um determinado casal. Uma equipe policial de perícia teve acesso ao material biológico carbonizado da vítima, reduzido, praticamente, a fragmentos de ossos. Sabe-se que é possível obter DNA em condições para análise genética de parte do tecido interno de ossos. Os peritos necessitam escolher, entre cromossomos autossômicos, cromossomos sexuais (X e Y) ou DNAmt (DNA mitocondrial), a melhor opção para identificação do parentesco da vítima com o referido casal. Sabe-se que, entre outros aspectos, o número de cópias de um mesmo cromossomo por célula maximiza a chance de se obter moléculas não degradadas pelo calor da explosão.

Com base nessas informações e tendo em vista os diferentes padrões de herança de cada fonte de DNA citada, a melhor opção para a perícia seria a utilização', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 41 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000002a', 'ENEM-2009-042', 5, 402, 'enem', 3, 2, 2009, 'multiple_choice', 'Plantas e fotossíntese', 'O cultivo de camarões de água salgada vem se desenvolvendo muito nos últimos anos na região Nordeste do Brasil e, em algumas localidades, passou a ser a principal atividade econômica. Uma das grandes preocupações dos impactos negativos dessa atividade está relacionada à descarga, sem nenhum tipo de tratamento, dos efluentes dos viveiros diretamente no ambiente marinho, em estuários ou em manguezais. Esses efluentes possuem matéria orgânica particulada e dissolvida, amônia, nitrito, nitrato, fosfatos, partículas de sólidos em suspensão e outras substâncias que podem ser consideradas contaminantes potenciais.

CASTRO, C. B.; ARAGÃO, J. S.; COSTA-LOTUFO, L. V. Monitoramento da toxicidade de efluentes de uma fazenda de cultivo de camarão marinho. Anais do IX Congresso Brasileiro de Ecotoxicologia, 2006 (adaptado).

Suponha que tenha sido construída uma fazenda de carcinicultura próximo a um manguezal. Entre as perturbações ambientais causadas pela fazenda, espera-se que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 42 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000002b', 'ENEM-2009-043', 7, 197, 'enem', 3, 2, 2009, 'multiple_choice', 'Cálculo estequiométrico', '![](conteudo/enem/2009/43-fc15f9d3.webp)

À medida que aumenta a consciência sobre os impactos ambientais relacionados ao uso da energia, cresce a importância de se criar políticas de incentivo ao uso de combustíveis mais eficientes. Nesse sentido, considerando-se que o metano, o butano e o octano sejam representativos do gás natural, do gás liquefeito de petróleo (GLP) e da gasolina, respectivamente, então, a partir dos dados fornecidos, é possível concluir que, do ponto de vista da quantidade de calor obtido por mol de CO2 gerado, a ordem crescente desses três combustíveis é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 43 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000002c', 'ENEM-2009-044', 7, 401, 'enem', 3, 2, 2009, 'multiple_choice', 'Funções e reações orgânicas', 'O álcool hidratado utilizado como combustível veicular é obtido por meio da destilação fracionada de soluções aquosas geradas a partir da fermentação de biomassa. Durante a destilação, o teor de etanol da mistura é aumentado, até o limite de 96% em massa.

Considere que, em uma usina de produção de etanol, 800 kg de uma mistura etanol/água com concentração 20% em massa de etanol foram destilados, sendo obtidos 100 kg de álcool hidratado 96% em massa de etanol. A partir desses dados, é correto concluir que a destilação em questão gerou um resíduo com uma concentração de etanol em massa', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 44 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000002d', 'ENEM-2009-045', 6, 407, 'enem', 3, 2, 2009, 'multiple_choice', 'Circuitos e energia elétrica', '![](conteudo/enem/2009/45-391df735.webp)

Nessa situação, quais são as três lâmpadas que acendem com o mesmo brilho por apresentarem igual valor de corrente fluindo nelas, sob as quais devem se posicionar os três atores?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 45 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000002e', 'ENEM-2009-046', 8, 417, 'enem', 3, 2, 2009, 'multiple_choice', 'Antiguidade', 'O Egito é visitado anualmente por milhões de turistas de todos os quadrantes do planeta, desejosos de ver com os próprios olhos a grandiosidade do poder esculpida em pedra há milênios: as pirâmides de Gizeh, as tumbas do Vale dos Reis e os numerosos templos construídos ao longo do Nilo.

O que hoje se transformou em atração turística era, no passado, interpretado de forma muito diferente, pois', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 46 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000002f', 'ENEM-2009-047', 8, 418, 'enem', 3, 2, 2009, 'multiple_choice', 'Idade Moderna', 'O que se entende por Corte do antigo regime é, em primeiro lugar, a casa de habitação dos reis de França, de suas famílias, de todas as pessoas que, de perto ou de longe, dela fazem parte. As despesas da Corte, da imensa casa dos reis, são consignadas no registro das despesas do reino da França sob a rubrica significativa de Casas Reais.

ELIAS, N. A sociedade de corte. Lisboa: Estampa, 1987

Algumas casas de habitação dos reis tiveram grande efetividade política e terminaram por se transformar em patrimônio artístico e cultural, cujo exemplo é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 47 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000030', 'ENEM-2009-048', 8, 419, 'enem', 3, 2, 2009, 'multiple_choice', 'Processos históricos', 'Hoje em dia, nas grandes cidades, enterrar os mortos é uma prática quase íntima, que diz respeito apenas à família. A menos, é claro, que se trate de uma personalidade conhecida. Entretanto, isso nem sempre foi assim. Para um historiador, os sepultamentos são uma fonte de informações importantes para que se compreenda, por exemplo, a vida política das sociedades.

No que se refere às práticas sociais ligadas aos sepultamentos,', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 48 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000031', 'ENEM-2009-049', 8, 420, 'enem', 3, 2, 2009, 'multiple_choice', 'Idade Média', 'A Idade Média é um extenso período da História do Ocidente cuja memória é construída e reconstruída segundo as circunstâncias das épocas posteriores. Assim, desde o Renascimento, esse período vem sendo alvo de diversas interpretações que dizem mais sobre o contexto histórico em que são produzidas do que propriamente sobre o Medievo.

Um exemplo acerca do que está exposto no texto acima é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 49 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000032', 'ENEM-2009-050', 8, 419, 'enem', 3, 2, 2009, 'multiple_choice', 'Processos históricos', 'A primeira metade do século XX foi marcada por conflitos e processos que a inscreveram como um dos mais violentos períodos da história humana.

Entre os principais fatores que estiveram na origem dos conflitos ocorridos durante a primeira metade do século XX estão', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 50 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000033', 'ENEM-2009-051', 8, 421, 'enem', 3, 2, 2009, 'multiple_choice', 'Mundo contemporâneo', 'Os regimes totalitários da primeira metade do século XX apoiaram-se fortemente na mobilização da juventude em torno da defesa de ideias grandiosas para o futuro da nação. Nesses projetos, os jovens deveriam entender que só havia uma pessoa digna de ser amada e obedecida, que era o líder. Tais movimentos sociais juvenis contribuíram para a implantação e a sustentação do nazismo, na Alemanha, e do fascismo, na Itália, Espanha e Portugal.

A atuação desses movimentos juvenis caracterizava-se:', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 51 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000034', 'ENEM-2009-052', 9, 423, 'enem', 3, 2, 2009, 'multiple_choice', 'Globalização e mundo atual', 'Do ponto de vista geopolítico, a Guerra Fria dividiu a Europa em dois blocos. Essa divisão propiciou a formação de alianças antagônicas de caráter militar, como a OTAN, que aglutinava os países do bloco ocidental, e o Pacto de Varsóvia, que concentrava os do bloco oriental. É importante destacar que, na formação da OTAN, estão presentes, além dos países do oeste europeu, os EUA e o Canadá. Essa divisão histórica atingiu igualmente os âmbitos político e econômico que se refletia pela opção entre os modelos capitalista e socialista.

Essa divisão europeia ficou conhecida como', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 52 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000035', 'ENEM-2009-053', 12, 425, 'enem', 3, 2, 2009, 'multiple_choice', 'Cultura, trabalho e cidadania', 'O ano de 1968 ficou conhecido pela efervescência social, tal como se pode comprovar pelo seguinte trecho, retirado de texto sobre propostas preliminares para uma revolução cultural: “É preciso discutir em todos os lugares e com todos. O dever de ser responsável e pensar politicamente diz respeito a todos, não é privilégio de uma minoria de iniciados. Não devemos nos surpreender com o caos das ideias, pois essa é a condição para a emergência de novas ideias. Os pais do regime devem compreender que autonomia não é uma palavra vã; ela supõe a partilha do poder, ou seja, a mudança de sua natureza. Que ninguém tente rotular o movimento atual; ele não tem etiquetas e não precisa delas”.

Journal de la comune étudiante. Textes et documents. Paris: Seuil, 1969 (adaptado)

Os movimentos sociais, que marcaram o ano de 1968,', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 53 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000036', 'ENEM-2009-054', 9, 426, 'enem', 3, 2, 2009, 'multiple_choice', 'Questões ambientais', 'Os Yanomami constituem uma sociedade indígena do norte da Amazônia e formam um amplo conjunto linguístico e cultural. Para os Yanomami, urihi, a “terrafloresta”, não é um mero cenário inerte, objeto de exploração econômica, e sim uma entidade viva, animada por uma dinâmica de trocas entre os diversos seres que a povoam. A floresta possui um sopro vital, wixia, que é muito longo. Se não a desmatarmos, ela não morrerá. Ela não se decompõe, isto é, não se desfaz. É graças ao seu sopro úmido que as plantas crescem. A floresta não está morta pois, se fosse assim, as florestas não teriam folhas. Tampouco se veria água. Segundo os Yanomami, se os brancos os fizerem desaparecer para desmatá-la e morar no seu lugar, ficarão pobres e acabarão tendo fome e sede.

ALBERT, B. Yanomami, o espírito da floresta. **Almanaque Brasil Socioambiental.** São Paulo: ISA, 2007 (adaptado).

De acordo com o texto, os Yanomami acreditam que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 54 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000037', 'ENEM-2009-055', 9, 423, 'enem', 3, 2, 2009, 'multiple_choice', 'Globalização e mundo atual', 'O fim da Guerra Fria e da bipolaridade, entre as décadas de 1980 e 1990, gerou expectativas de que seria instaurada uma ordem internacional marcada pela redução de conflitos e pela multipolaridade. O panorama estratégico do mundo pós-Guerra Fria apresenta', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 55 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000038', 'ENEM-2009-056', 8, 419, 'enem', 3, 2, 2009, 'multiple_choice', 'Processos históricos', 'Na democracia estado-unidense, os cidadãos são incluídos na sociedade pelo exercício pleno dos direitos políticos e também pela ideia geral de direito de propriedade. Compete ao governo garantir que esse direito não seja violado. Como consequência, mesmo aqueles que possuem uma pequena propriedade sentem-se cidadãos de pleno direito.

Na tradição política dos EUA, uma forma de incluir socialmente os cidadãos é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 56 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000039', 'ENEM-2009-057', 13, 428, 'enem', 3, 2, 2009, 'multiple_choice', 'Ética, moral e conhecimento', 'Na década de 30 do século XIX, Tocqueville escreveu as seguintes linhas a respeito da moralidade nos EUA: “A opinião pública norte-americana é particularmente dura com a falta de moral, pois esta desvia a atenção frente à busca do bem-estar e prejudica a harmonia doméstica, que é tão essencial ao sucesso dos negócios. Nesse sentido, pode-se dizer que ser casto é uma questão de honra”.

TOCQUEVILLE, A. Democracy in America. Chicago: Encyclopædia Britannica, Inc., Great Books 44, 1990 (adaptado).

Do trecho, infere-se que, para Tocqueville, os norte- americanos do seu tempo', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 57 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000003a', 'ENEM-2009-058', 9, 255, 'enem', 3, 2, 2009, 'multiple_choice', 'Urbanização', 'Segundo Aristóteles, “na cidade com o melhor conjunto de normas e naquela dotada de homens absolutamente justos, os cidadãos não devem viver uma vida de trabalho trivial ou de negócios — esses tipos de vida são desprezíveis e incompatíveis com as qualidades morais —, tampouco devem ser agricultores os aspirantes à cidadania, pois o lazer é indispensável ao desenvolvimento das qualidades morais e à prática das atividades políticas”.

VAN ACKER, T. _Grécia. A vida cotidiana na cidade-Estado_. São Paulo: Atual, 1994.

O trecho, retirado da obra Política, de Aristóteles, permite compreender que a cidadania:', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 58 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000003b', 'ENEM-2009-059', 8, 429, 'enem', 3, 2, 2009, 'multiple_choice', 'Brasil Colônia', 'Para Caio Prado Jr., a formação brasileira se completaria no momento em que fosse superada a nossa herança de inorganicidade social ― o oposto da interligação com objetivos internos ― trazida da colônia. Este momento alto estaria, ou esteve, no futuro. Se passarmos a Sérgio Buarque de Holanda, encontraremos algo análogo. O país será moderno e estará formado quando superar a sua herança portuguesa, rural e autoritária, quando então teríamos um país democrático. Também aqui o ponto de chegada está mais adiante, na dependência das decisões do presente. Celso Furtado, por seu turno, dirá que a nação não se completa enquanto as alavancas do comando, principalmente do econômico, não passarem para dentro do país. Como para os outros dois, a conclusão do processo encontra-se no futuro, que agora parece remoto.

SCHWARZ, R. Os sete fôlegos de um livro. Sequências brasileiras. São Paulo: Cia. das Letras,1999 (adaptado).

Acerca das expectativas quanto à formação do Brasil, a sentença que sintetiza os pontos de vista apresentados no texto é:', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 59 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000003c', 'ENEM-2009-060', 8, 419, 'enem', 3, 2, 2009, 'multiple_choice', 'Processos históricos', 'A definição de eleitor foi tema de artigos nas Constituições brasileiras de 1891 e de 1934. Diz a Constituição da República dos Estados Unidos do Brasil de 1891:

Art. 70. São eleitores os cidadãos maiores de 21 anos que se alistarem na forma da lei.

A Constituição da República dos Estados Unidos do Brasil de 1934, por sua vez, estabelece que:

Art. 180. São eleitores os brasileiros de um e de outro sexo, maiores de 18 anos, que se alistarem na forma da lei.

Ao se comparar os dois artigos, no que diz respeito ao gênero dos eleitores, depreende-se que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 60 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000003d', 'ENEM-2009-061', 8, 430, 'enem', 3, 2, 2009, 'multiple_choice', 'República Velha e Era Vargas', 'O autor da constituição de 1937, Francisco Campos, afirma no seu livro, O Estado Nacional, que o eleitor seria apático; a democracia de partidos conduziria à desordem; a independência do Poder Judiciário acabaria em injustiça e ineficiência; e que apenas o Poder Executivo, centralizado em Getúlio Vargas, seria capaz de dar racionalidade imparcial ao Estado, pois Vargas teria providencial intuição do bem e da verdade, além de ser um gênio político.

CAMPOS, F. O Estado nacional. Rio de Janeiro: José Olympio, 1940 (adaptado).

Segundo as ideias de Francisco Campos,', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 61 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000003e', 'ENEM-2009-062', 8, 430, 'enem', 3, 2, 2009, 'multiple_choice', 'República Velha e Era Vargas', 'A partir de 1942 e estendendo-se até o final do Estado Novo, o Ministro do Trabalho, Indústria e Comércio de Getúlio Vargas falou aos ouvintes da Rádio Nacional semanalmente, por dez minutos, no programa “Hora do Brasil”. O objetivo declarado do governo era esclarecer os trabalhadores acerca das inovações na legislação de proteção ao trabalho.

GOMES, A. C. A invenção do trabalhismo. Rio de Janeiro: IUPERJ / Vértice. São Paulo: Revista dos Tribunais, 1988 (adaptado).

Os programas “Hora do Brasil” contribuíram para', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 62 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000003f', 'ENEM-2009-063', 12, 425, 'enem', 3, 2, 2009, 'multiple_choice', 'Cultura, trabalho e cidadania', 'No final do século XVI, na Bahia, Guiomar de Oliveira denunciou Antônia Nóbrega à Inquisição. Segundo o depoimento, esta lhe dava “uns pós não sabe de quê, e outros pós de osso de finado, os quais pós ela confessante deu a beber em vinho ao dito seu marido para ser seu amigo e serem bem-casados, e que todas estas coisas fez tendo-lhe dito a dita Antônia e ensinado que eram coisas diabólicas e que os diabos lha ensinaram”.

ARAÚJO, E. O teatro dos vícios. Transgressão e transigência na sociedade urbana colonial. Brasília: UnB/José Olympio, 1997.

Do ponto de vista da Inquisição,', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 63 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000040', 'ENEM-2009-064', 8, 419, 'enem', 3, 2, 2009, 'multiple_choice', 'Processos históricos', 'A formação dos Estados foi certamente distinta na Europa, na América Latina, na África e na Ásia. Os Estados atuais, em especial na América Latina — onde as instituições das populações locais existentes à época da conquista ou foram eliminadas, como no caso do México e do Peru, ou eram frágeis, como no caso do Brasil —, são o resultado, em geral, da evolução do transplante de instituições europeias feito pelas metrópoles para suas colônias. Na África, as colônias tiveram fronteiras arbitrariamente traçadas, separando etnias, idiomas e tradições, que, mais tarde, sobreviveram ao processo de descolonização, dando razão para conflitos que, muitas vezes, têm sua verdadeira origem em disputas pela exploração de recursos naturais. Na Ásia, a colonização europeia se fez de forma mais indireta e encontrou sistemas políticos e administrativos mais sofisticados, aos quais se superpôs. Hoje, aquelas formas anteriores de organização, ou pelo menos seu espírito, sobrevivem nas organizações políticas do Estado asiático.

GUIMARÃES, S. P. Nação, nacionalismo, Estado. **Estudos Avançados.** São Paulo: EdUSP,  
v. 22, n.º 62, jan.- abr. 2008 (adaptado).

Relacionando as informações ao contexto histórico e geográfico por elas evocado, assinale a opção correta acerca do processo de formação socioeconômica dos continentes mencionados no texto.', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 64 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000041', 'ENEM-2009-065', 8, 419, 'enem', 3, 2, 2009, 'multiple_choice', 'Processos históricos', 'No tempo da independência do Brasil, circulavam nas classes populares do Recife trovas que faziam alusão à revolta escrava do Haiti:

Marinheiros e caiados

Todos devem se acabar,

Porque só pardos e pretos

O país hão de habitar.

AMARAL, F. P. do. Apud CARVALHO, A. Estudos pernambucanos. Recife: Cultura Acadêmica, 1907.

O período da independência do Brasil registra conflitos raciais, como se depreende', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 65 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000042', 'ENEM-2009-066', 8, 419, 'enem', 3, 2, 2009, 'multiple_choice', 'Processos históricos', 'Colhe o Brasil, após esforço contínuo dilatado no tempo, o que plantou no esforço da construção de sua inserção internacional. Há dois séculos formularam-se os pilares da política externa. Teve o país inteligência de longo prazo e cálculo de oportunidade no mundo difuso da transição da hegemonia britânica para o século americano. Engendrou concepções, conceitos e teoria própria no século XIX, de José Bonifácio ao Visconde do Rio Branco. Buscou autonomia decisória no século XX. As elites se interessaram, por meio de calorosos debates, pelo destino do Brasil. O país emergiu, de Vargas aos militares, como ator responsável e previsível nas ações externas do Estado. A mudança de regime político para a democracia não alterou o pragmatismo externo, mas o aperfeiçoou.

SARAIVA, J. F. S. O lugar do Brasil e o silêncio do parlamento. **Correio Braziliense**, Brasília,  
28 maio 2009 (adaptado).

Sob o ponto de vista da política externa brasileira no século XX, conclui-se que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 66 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000043', 'ENEM-2009-067', 9, 431, 'enem', 3, 2, 2009, 'multiple_choice', 'Migrações e demografia', 'A prosperidade induzida pela emergência das máquinas de tear escondia uma acentuada perda de prestígio. Foi nessa idade de ouro que os artesãos, ou os tecelões temporários, passaram a ser denominados, de modo genérico, tecelões de teares manuais. Exceto em alguns ramos especializados, os velhos artesãos foram colocados lado a lado com novos imigrantes, enquanto pequenos fazendeiros-tecelões abandonaram suas pequenas propriedades para se concentrar na atividade de tecer. Reduzidos à completa dependência dos teares mecanizados ou dos fornecedores de matéria-prima, os tecelões ficaram expostos a sucessivas reduções dos rendimentos.

THOMPSON, E. P. **The making of the english working class.** Harmondsworth: Penguin Books, 1979 (adaptado).

Com a mudança tecnológica ocorrida durante a Revolução Industrial, a forma de trabalhar alterou-se porque', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 67 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000044', 'ENEM-2009-068', 9, 433, 'enem', 3, 2, 2009, 'multiple_choice', 'Agropecuária, indústria e energia', 'Até o século XVII, as paisagens rurais eram marcadas por atividades rudimentares e de baixa produtividade. A partir da Revolução Industrial, porém, sobretudo com o advento da revolução tecnológica, houve um desenvolvimento contínuo do setor agropecuário.

São, portanto, observadas consequências econômicas, sociais e ambientais inter-relacionadas no período posterior à Revolução Industrial, as quais incluem', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 68 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000045', 'ENEM-2009-069', 8, 419, 'enem', 3, 2, 2009, 'multiple_choice', 'Processos históricos', 'Como se assistisse à demonstração de um espetáculo mágico, ia revendo aquele ambiente tão característico de família, com seus pesados móveis de vinhático ou de jacarandá, de qualidade antiga, e que denunciavam um passado ilustre, gerações de Meneses talvez mais singelos e mais calmos; agora, uma espécie de desordem, de relaxamento, abastardava aquelas qualidades primaciais. Mesmo assim era fácil perceber o que haviam sido, esses nobres da roça, com seus cristais que brilhavam mansamente na sombra, suas pratas semi- empoeiradas que atestavam o esplendor esvanecido, seus marfins e suas opalinas – ah, respirava-se ali conforto, não havia dúvida, mas era apenas uma sobrevivência de coisas idas. Dir-se-ia, ante esse mundo que se ia desagregando, que um mal oculto o roía, como um tumor latente em suas entranhas.

CARDOSO, L. Crônica da casa assassinada. Rio de Janeiro: Civilização Brasileira, 2002 (adaptado).

O mundo narrado nesse trecho do romance de Lúcio Cardoso, acerca da vida dos Meneses, família da aristocracia rural de Minas Gerais, apresenta não apenas a história da decadência dessa família, mas é, ainda, a representação literária de uma fase de desagregação política, social e econômica do país. O recurso expressivo que formula literariamente essa desagregação histórica é o de descrever a casa dos Meneses como', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 69 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000046', 'ENEM-2009-070', 8, 434, 'enem', 3, 2, 2009, 'multiple_choice', 'Império e Regências', 'O suíço Thomas Davatz chegou a São Paulo em 1855 para trabalhar como colono na fazenda de café Ibicaba, em Campinas. A perspectiva de prosperidade que o atraiu para o Brasil deu lugar a insatisfação e revolta, que ele registrou em livro. Sobre o percurso entre o porto de Santos e o planalto paulista, escreveu Davatz: “As estradas do Brasil, salvo em alguns trechos, são péssimas. Em quase toda parte, falta qualquer espécie de calçamento ou mesmo de saibro. Constam apenas de terra simples, sem nenhum benefício. É fácil prever que nessas estradas não se encontram estalagens e hospedarias como as da Europa. Nas cidades maiores, o viajante pode naturalmente encontrar aposento sofrível; nunca, porém, qualquer coisa de comparável à comodidade que proporciona na Europa qualquer estalagem rural. Tais cidades são, porém, muito poucas na distância que vai de Santos a Ibicaba e que se percorre em cinquenta horas no mínimo”. Em 1867 foi inaugurada a ferrovia ligando Santos a Jundiaí, o que abreviou o tempo de viagem entre o litoral e o planalto para menos de um dia. Nos anos seguintes, foram construídos outros ramais ferroviários que articularam o interior cafeeiro ao porto de exportação, Santos.

DAVATZ, T. **Memórias de um colono no Brasil.** São Paulo: Livraria Martins, 1941 (adaptado).

O impacto das ferrovias na promoção de projetos de colonização com base em imigrantes europeus foi importante, porque', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 70 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000047', 'ENEM-2009-071', 9, 255, 'enem', 3, 2, 2009, 'multiple_choice', 'Urbanização', 'Além dos inúmeros eletrodomésticos e bens eletrônicos, o automóvel produzido pela indústria fordista promoveu, a partir dos anos 50, mudanças significativas no modo de vida dos consumidores e também na habitação e nas cidades. Com a massificação do consumo dos bens modernos, dos eletroeletrônicos e também do automóvel, mudaram radicalmente o modo de vida, os valores, a cultura e o conjunto do ambiente construído. Da ocupação do solo urbano até o interior da moradia, a transformação foi profunda.

MARICATO, E. **Urbanismo na periferia do mundo globalizado: metrópoles brasileiras.** Disponível em: http://www.scielo.br.  
Acesso em: 12 ago. 2009 (adaptado).

Uma das consequências das inovações tecnológicas das últimas décadas, que determinaram diferentes formas de uso e ocupação do espaço geográfico, é a instituição das chamadas cidades globais, que se caracterizam por', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 71 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000048', 'ENEM-2009-072', 9, 423, 'enem', 3, 2, 2009, 'multiple_choice', 'Globalização e mundo atual', 'Populações inteiras, nas cidades e na zona rural, dispõem da parafernália digital global como fonte de educação e de formação cultural. Essa simultaneidade de cultura e informação eletrônica com as formas tradicionais e orais é um desafio que necessita ser discutido. A exposição, via mídia eletrônica, com estilos e valores culturais de outras sociedades, pode inspirar apreço, mas também distorções e ressentimentos. Tanto quanto há necessidade de uma cultura tradicional de posse da educação letrada, também é necessário criar estratégias de alfabetização eletrônica, que passam a ser o grande canal de informação das culturas segmentadas no interior dos grandes centros urbanos e das zonas rurais. Um novo modelo de educação.

BRIGAGÃO, C. E.; RODRIGUES, G. **A globalização a olho nu: o mundo conectado.** São Paulo: Moderna, 1998 (adaptado).

Com base no texto e considerando os impactos culturais da difusão das tecnologias de informação no marco da globalização, depreende-se que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 72 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000049', 'ENEM-2009-073', 9, 423, 'enem', 3, 2, 2009, 'multiple_choice', 'Globalização e mundo atual', '![](conteudo/enem/2009/73-c8b4cebd.webp)

A partir do mapa apresentado, é possível inferir que nas últimas décadas do século XX, registraram-se processos que resultaram em transformações na distribuição das atividades econômicas e da população sobre o território brasileiro, com reflexos no PIB por habitante. Assim,', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 73 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000004a', 'ENEM-2009-074', 9, 255, 'enem', 3, 2, 2009, 'multiple_choice', 'Urbanização', 'No período 750-338 a. C., a Grécia antiga era composta por cidades-Estado, como por exemplo Atenas, Esparta, Tebas, que eram independentes umas das outras, mas partilhavam algumas características culturais, como a língua grega. No centro da Grécia, Delfos era um lugar de culto religioso frequentado por habitantes de todas as cidades-Estado.

No período 1200-1600 d. C., na parte da Amazônia brasileira onde hoje está o Parque Nacional do Xingu, há vestígios de quinze cidades que eram cercadas por muros de madeira e que tinham até dois mil e quinhentos habitantes cada uma. Essas cidades eram ligadas por estradas a centros cerimoniais com grandes praças. Em torno delas havia roças, pomares e tanques para a criação de tartarugas. Aparentemente, epidemias dizimaram grande parte da população que lá vivia.

Folha de S. Paulo, ago. 2008 (adaptado).

Apesar das diferenças históricas e geográficas existentes entre as duas civilizações elas são semelhantes pois', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 74 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000004b', 'ENEM-2009-075', 9, 431, 'enem', 3, 2, 2009, 'multiple_choice', 'Migrações e demografia', 'O movimento migratório no Brasil é significativo, principalmente em função do volume de pessoas que saem de uma região com destino a outras regiões. Um desses movimentos ficou famoso nos anos 80, quando muitos nordestinos deixaram a região Nordeste em direção ao Sudeste do Brasil. Segundo os dados do IBGE de 2000, este processo continuou crescente no período seguinte, os anos 90, com um acréscimo de 7,6% nas migrações deste mesmo fluxo. A Pesquisa de Padrão de Vida, feita pelo IBGE, em 1996, aponta que, entre os nordestinos que chegam ao Sudeste, 48,6% exercem trabalhos manuais não qualificados, 18,5% são trabalhadores manuais qualificados, enquanto 13,5%, embora não sejam trabalhadores manuais, se encontram em áreas que não exigem formação profissional. O mesmo estudo indica também que esses migrantes possuem, em média, condição de vida e nível educacional acima dos de seus conterrâneos e abaixo dos de cidadãos estáveis do Sudeste.

Disponível em: http://www.ibge.gov.br. Acesso em: 30 jul. 2009 (adaptado).

Com base nas informações contidas no texto, depreende-se que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 75 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000004c', 'ENEM-2009-076', 9, 433, 'enem', 3, 2, 2009, 'multiple_choice', 'Agropecuária, indústria e energia', 'Apesar do aumento da produção no campo e da integração entre a indústria e a agricultura, parte da população da América do Sul ainda sofre com a subalimentação, o que gera conflitos pela posse de terra que podem ser verificados em várias áreas e que frequentemente chegam a provocar mortes

Um dos fatores que explica a subalimentação na América do Sul é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 76 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000004d', 'ENEM-2009-077', 9, 433, 'enem', 3, 2, 2009, 'multiple_choice', 'Agropecuária, indústria e energia', 'A luta pela terra no Brasil é marcada por diversos aspectos que chamam a atenção. Entre os aspectos positivos, destaca-se a perseverança dos movimentos do campesinato e, entre os aspectos negativos, a violência que manchou de sangue essa história. Os movimentos pela reforma agrária articularam-se por todo o território nacional, principalmente entre 1985 e 1996, e conseguiram de maneira expressiva a inserção desse tema nas discussões pelo acesso à terra.O mapa seguinte apresenta a distribuição dos conflitos agrários em todas as regiões do Brasil nesse período, e o número de mortes ocorridas nessas lutas.

![](conteudo/enem/2009/77-0148040b.webp)

OLIVEIRA, A. U. A longa marcha do campesinato brasileiro: movimentos sociais, conflitos e reforma agrária.  **Revista Estudos Avançados.** Vol. 15 n. 43, São Paulo, set./dez. 2001.

Com base nas informações do mapa acerca dos conflitos pela posse de terra no Brasil, a região', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 77 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000004e', 'ENEM-2009-078', 13, 428, 'enem', 3, 2, 2009, 'multiple_choice', 'Ética, moral e conhecimento', 'O gráfico mostra o percentual de áreas ocupadas, segundo o tipo de propriedade rural no Brasil, no ano de 2006.

![](conteudo/enem/2009/78-85294de7.webp)

MDA/INCRA (DIEESE, 2006)  
Disponível em: http://www.sober.org.br. Acesso em: 6 ago. 2009.

De acordo com o gráfico e com referência à distribuição das áreas rurais no Brasil, conclui-se que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 78 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000004f', 'ENEM-2009-079', 12, 425, 'enem', 3, 2, 2009, 'multiple_choice', 'Cultura, trabalho e cidadania', 'Entre 2004 e 2008, pelo menos 8 mil brasileiros foram libertados de fazendas onde trabalhavam como se fossem escravos. O governo criou uma lista em que ficaram expostos os nomes dos fazendeiros flagrados pela fiscalização. No Norte, Nordeste e Centro-Oeste, regiões que mais sofrem com a fraqueza do poder público, o bloqueio dos canais de financiamento agrícola para tais fazendeiros tem sido a principal arma de combate a esse problema, mas os governos ainda sofrem com a falta de informações, provocada pelas distâncias e pelo poder intimidador dos proprietários. Organizações não governamentais e grupos como a Pastoral da Terra têm agido corajosamente, acionando as autoridades públicas e ministrando aulas sobre direitos sociais e trabalhistas.

Plano Nacional para Erradicação do Trabalho Escravo”. Disponível em:  
http://www.mte.gov.br. Acesso em: 17 mar. 2009 (adaptado).

Nos lugares mencionados no texto, o papel dos grupos de defesa dos direitos humanos tem sido fundamental, porque eles', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 79 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000050', 'ENEM-2009-080', 9, 426, 'enem', 3, 2, 2009, 'multiple_choice', 'Questões ambientais', 'O homem construiu sua história por meio do constante processo de ocupação e transformação do espaço natural. Na verdade, o que variou, nos diversos momentos da experiência humana, foi a intensidade dessa exploração.

Disponível em: http://www.simposioreformaagraria.propp.ufu.br.  
Acesso em: 09 jul. 2009 (adaptado).

Uma das consequências que pode ser atribuída à crescente intensificação da exploração de recursos naturais, facilitada pelo desenvolvimento tecnológico ao longo da história, é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 80 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000051', 'ENEM-2009-081', 9, 426, 'enem', 3, 2, 2009, 'multiple_choice', 'Questões ambientais', 'No presente, observa-se crescente atenção aos efeitos da atividade humana, em diferentes áreas, sobre o meio ambiente, sendo constante, nos fóruns internacionais e nas instâncias nacionais, a referência à sustentabilidade como princípio orientador de ações e propostas que deles emanam. A sustentabilidade explica-se pela', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 81 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000052', 'ENEM-2009-082', 9, 433, 'enem', 3, 2, 2009, 'multiple_choice', 'Agropecuária, indústria e energia', 'Com a perspectiva do desaparecimento das geleiras no Polo Norte, grandes reservas de petróleo e minérios, hoje inacessíveis, poderão ser exploradas. E já atiçam a cobiça das potências.

KOPP, D. Guerra Fria sobre o Ártico. **Le monde diplomatique Brasil.**  
Setembro, n. 2, 2007 (adaptado).

No cenário de que trata o texto, a exploração de jazidas de petróleo, bem como de minérios – diamante, ouro, prata, cobre, chumbo, zinco – torna-se atraente não só em função de seu formidável potencial, mas também por', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 1º dia · Questão 82 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000053', 'ENEM-2009-083', 9, 433, 'enem', 3, 2, 2009, 'multiple_choice', 'Agropecuária, indústria e energia', 'No mundo contemporâneo, as reservas energéticas tornam-se estratégicas para muitos países no cenário internacional. Os gráficos apresentados mostram os dez países com as maiores reservas de petróleo e gás natural em reservas comprovadas até janeiro de 2008.

![](conteudo/enem/2009/83-ad2f947f.webp)

Disponível em: http://indexmundi.com. Acesso em: 12 ago. 2009 (adaptado).

As reservas venezuelanas figuram em ambas as classificações porque', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 83 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000054', 'ENEM-2009-084', 9, 251, 'enem', 3, 2, 2009, 'multiple_choice', 'Bacias hidrográficas do Brasil', '![](conteudo/enem/2009/84-15a16039.webp)

BETHEL, L. História da América. V. I. São Paulo. (Foto: EDUSP)

As terras brasileiras foram divididas por meio de tratados entre Portugal e Espanha. De acordo com esses tratados, identificados no mapa, conclui-se que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 1º dia · Questão 84 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000055', 'ENEM-2009-085', 9, 249, 'enem', 3, 2, 2009, 'multiple_choice', 'Climas do Brasil', 'O clima é um dos elementos fundamentais não só na caracterização das paisagens naturais, mas também no histórico de ocupação do espaço geográfico.

Tendo em vista determinada restrição climática, a figura que representa o uso de tecnologia voltada para a produção é:', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 85 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000056', 'ENEM-2009-086', 9, 249, 'enem', 3, 2, 2009, 'multiple_choice', 'Climas do Brasil', '![](conteudo/enem/2009/86-04d790cc.webp)

![](conteudo/enem/2009/86-1dec6a28.webp)

Reunindo-se as informações contidas nas duas charges, infere-se que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 86 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000057', 'ENEM-2009-087', 9, 249, 'enem', 3, 2, 2009, 'multiple_choice', 'Climas do Brasil', 'Na figura, observa-se uma classificação de regiões da América do Sul segundo o grau de aridez verificado.

![](conteudo/enem/2009/87-951db800.webp)

Disponível em: http:// www.mutirao.com.br.  
Acesso em: 5 ago. 2009.

Em relação às regiões marcadas na figura, observa-se que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 1º dia · Questão 87 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000058', 'ENEM-2009-088', 9, 249, 'enem', 3, 2, 2009, 'multiple_choice', 'Climas do Brasil', 'À medida que a demanda por água aumenta, as reservas desse recurso vão se tornando imprevisíveis. Modelos matemáticos que analisam os efeitos das mudanças climáticas sobre a disponibilidade de água no futuro indicam que haverá escassez em muitas regiões do planeta. São esperadas mudanças nos padrões de precipitação, pois', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 88 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000059', 'ENEM-2009-089', 9, 255, 'enem', 3, 2, 2009, 'multiple_choice', 'Urbanização', 'A mais profunda objeção que se faz à ideia da criação de uma cidade, como Brasília, é que o seu desenvolvimento não poderá jamais ser natural. É uma objeção muito séria, pois provém de uma concepção de vida fundamental: a de que a atividade social e cultural não pode ser uma construção. Esquecem-se, porém, aqueles que fazem tal crítica, que o Brasil, como praticamente toda a América, é criação do homem ocidental.

PEDROSA, M. Utopia: obra de arte. **Vis – Revista do Programa de**  
**Pós-graduação em Arte (UnB)**, Vol. 5, n. 1, 2006 (adaptado).

As ideias apontadas no texto estão em oposição, porque', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 1º dia · Questão 89 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000005a', 'ENEM-2009-090', 9, 436, 'enem', 3, 2, 2009, 'multiple_choice', 'Relevo, solos e geologia', 'As áreas do planalto do cerrado – como a chapada dos Guimarães, a serra de Tapirapuã e a serra dos Parecis, no Mato Grosso, com altitudes que variam de 400 m a 800 m – são importantes para a planície pantaneira mato-grossense (com altitude média inferior a 200 m), no que se refere à manutenção do nível de água, sobretudo durante a estiagem. Nas cheias, a inundação ocorre em função da alta pluviosidade nas cabeceiras dos rios, do afloramento de lençóis freáticos e da baixa declividade do relevo, entre outros fatores. Durante a estiagem, a grande biodiversidade é assegurada pelas águas da calha dos principais rios, cujo volume tem diminuído, principalmente nas cabeceiras.

Cabeceiras ameaçadas. **Ciência Hoje**. Rio de Janeiro:  
SBPC. Vol. 42, jun. 2008 (adaptado).

A medida mais eficaz a ser tomada, visando à conservação da planície pantaneira e à preservação de sua grande biodiversidade, é a conscientização da sociedade e a organização de movimentos sociais que exijam', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 1º dia · Questão 90 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000005b', 'ENEM-2009-091', 15, 438, 'enem', 3, 2, 2009, 'multiple_choice', 'Arte e cultura', 'Os melhores críticos da cultura brasileira trataram-na sempre no plural, isto é, enfatizando a coexistência no Brasil de diversas culturas. Arthur Ramos distingue as culturas não europeias (indígenas, negras) das europeias (portuguesa, italiana, alemã etc.), e Darcy Ribeiro fala de diversos Brasis: crioulo, caboclo, sertanejo, caipira e de Brasis sulinos, a cada um deles correspondendo uma cultura específica.

MORAIS, F. **O Brasil na visão do artista: o país e sua cultura.**  
São Paulo: Sudameris, 2003.

Considerando a hipótese de Darcy Ribeiro de que há vários Brasis, a opção em que a obra mostrada representa a arte brasileira de origem negro-africana é:', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 91 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000005c', 'ENEM-2009-092', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', 'Gerente – Boa tarde. Em que eu posso ajudá-lo?  
Cliente – Estou interessado em financiamento para compra  
de veículo.  
Gerente – Nós dispomos de várias modalidades de crédito.  
O senhor é nosso cliente?  
Cliente – Sou Júlio César Fontoura, também sou  
funcionário do banco.  
Gerente – Julinho, é você, cara? Aqui é a Helena! Cê tá  
em Brasília? Pensei que você inda tivesse na agência de  
Uberlândia! Passa aqui pra gente conversar com calma.

BORTONI-RICARDO, S. M. **Educação em língua materna.**  
São Paulo: Parábola, 2004 (adaptado).

Na representação escrita da conversa telefônica entre a gerente do banco e o cliente, observa-se que a maneira de falar da gerente foi alterada de repente devido', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 92 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000005d', 'ENEM-2009-093', 1, 441, 'enem', 3, 2, 2009, 'multiple_choice', 'Tecnologias da comunicação', 'Analise as seguintes avaliações de possíveis resultados de  
um teste na Internet.

![](conteudo/enem/2009/93-78a6b697.webp)

Depreende-se, a partir desse conjunto de informações, que o teste que deu origem a esses resultados, além de estabelecer um perfil para o usuário de sites de relacionamento, apresenta preocupação com hábitos e propõe mudanças de comportamento direcionadas', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 93 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000005e', 'ENEM-2009-094', 15, 438, 'enem', 3, 2, 2009, 'multiple_choice', 'Arte e cultura', 'A música pode ser definida como a combinação de sons ao longo do tempo. Cada produto final oriundo da infinidade de combinações possíveis será diferente, dependendo da escolha das notas, de suas durações, dos instrumentos utilizados, do estilo de música, da nacionalidade do compositor e do período em que as obras foram compostas.

![](conteudo/enem/2009/94-282c49bb.webp)

![](conteudo/enem/2009/94-c2791052.webp)

Figura 1 – http://images.quebarato.com.br/photos/big/2/D/15A12D\_2.jpg.  
Figura 2 – http://ourinhos.prefeituramunicipal.net/dados/fotos/2009/07/07/normal.  
Figura 3 – http://www.edmontonculturalcapital.com/gallery/edjazzfestival/JazzQuartet.jpg  
Figura 4 – http://www.filmica.com/jacintaescudos/archivos/Led-Zeppelin.jpg.

Das figuras que apresentam grupos musicais em ação, pode-se concluir que o(os) grupo(s) mostrado(s) na(s) figura(s)', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 94 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000005f', 'ENEM-2009-095', 15, 438, 'enem', 3, 2, 2009, 'multiple_choice', 'Arte e cultura', 'No programa do balé Parade, apresentado em 18 de maio de 1917, foi empregada publicamente, pela primeira vez, a palavra _sur-realisme_. Pablo Picasso desenhou o cenário e a indumentária, cujo efeito foi tão surpreendente que se sobrepôs à coreografia. A música de Erik Satie era uma mistura de _jazz_, música popular e sons reais tais como tiros de pistola, combinados com as imagens do balé de Charlie Chaplin, caubóis e vilões, mágica chinesa e _Ragtime_. Os tempos não eram propícios para receber a nova mensagem cênica demasiado provocativa devido ao repicar da máquina de escrever, aos zumbidos de sirene e dínamo e aos rumores de aeroplano previstos por Cocteau para a partitura de Satie. Já a ação coreográfica confirmava a tendência marcadamente teatral da gestualidade cênica, dada pela justaposição, colagem de ações isoladas seguindo um estímulo musical.

SILVA, S. M. **O surrealismo e a dança**. GUINSBURG, J.; LEIRNER (Org.). O surrealismo. São Paulo: Perspectiva, 2008 (adaptado).

As manifestações corporais na história das artes da cena muitas vezes demonstram as condições cotidianas de um determinado grupo social, como se pode observar na descrição acima do balé Parade, o qual reflete', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 95 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000060', 'ENEM-2009-096', 1, 224, 'enem', 3, 2, 2009, 'multiple_choice', 'Gêneros textuais', '![](conteudo/enem/2009/96-05bce341.webp)

Os principais recursos utilizados para envolvimento e adesão do leitor à campanha institucional incluem', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 96 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000061', 'ENEM-2009-097', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2009/97-21bc16d2.webp)

O texto tem o objetivo de solucionar um problema social,', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 97 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000062', 'ENEM-2009-098', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Para o Mano Caetano**

O que fazer do ouro de tolo  
Quando um doce bardo brada a toda brida,  
Em velas pandas, suas esquisitas rimas?  
Geografia de verdades, Guanabaras postiças  
Saudades banguelas, tropicais preguiças?

A boca cheia de dentes  
De um implacável sorriso  
Morre a cada instante  
Que devora a voz do morto, e com isso,  
Ressuscita vampira, sem o menor aviso

\[…\]  
E eu _soy_ lobo-bolo? lobo-bolo  
Tipo pra rimar com ouro de tolo?  
Oh, Narciso Peixe Ornamental!  
_Tease me_, _tease me_ outra vez¹  
Ou em banto baiano  
Ou em português de Portugal  
Se quiser, até mesmo em americano  
De Natal  
\[…\]

_¹Tease me_ (caçoe de mim, importune-me).

LOBÃO. Disponível em: http://vagalume.uol.com.br.  
Acesso em: 14 ago. 2009 (adaptado).

Na letra da canção apresentada, o compositor Lobão explora vários recursos da língua portuguesa, a fim de conseguir efeitos estéticos ou de sentido. Nessa letra, o autor explora o extrato sonoro do idioma e o uso de termos coloquiais na seguinte passagem:', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 98 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000063', 'ENEM-2009-099', 11, 442, 'enem', 3, 2, 2009, 'multiple_choice', 'Escolas e textos literários', '**Cárcere das almas**

Ah! Toda a alma num cárcere anda presa,  
Soluçando nas trevas, entre as grades  
Do calabouço olhando imensidades,  
Mares, estrelas, tardes, natureza.

Tudo se veste de uma igual grandeza  
Quando a alma entre grilhões as liberdades  
Sonha e, sonhando, as imortalidades  
Rasga no etéreo o Espaço da Pureza.

Ó almas presas, mudas e fechadas  
Nas prisões colossais e abandonadas,  
Da Dor no calabouço, atroz, funéreo!

Nesses silêncios solitários, graves,  
que chaveiro do Céu possui as chaves  
para abrir-vos as portas do Mistério?!

CRUZ E SOUSA, J. **Poesia completa.** Florianópolis: Fundação Catarinense de Cultura /  
Fundação Banco do Brasil, 1993.

Os elementos formais e temáticos relacionados ao contexto cultural do Simbolismo encontrados no poema Cárcere das almas, de Cruz e Sousa, são', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 99 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000064', 'ENEM-2009-100', 11, 442, 'enem', 3, 2, 2009, 'multiple_choice', 'Escolas e textos literários', '![](conteudo/enem/2009/100-8d5cbf39.webp)

Tendo em vista a segunda fala do personagem entrevistado, constata-se que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 100 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000065', 'ENEM-2009-102', 11, 442, 'enem', 3, 2, 2009, 'multiple_choice', 'Escolas e textos literários', 'Gênero dramático é aquele em que o artista usa como intermediária entre si e o público a representação. A palavra vem do grego _drao_ (fazer) e quer dizer ação. A peça teatral é, pois, uma composição literária destinada à apresentação por atores em um palco, atuando e dialogando entre si. O texto dramático é complementado pela atuação dos atores no espetáculo teatral e possui uma estrutura específica, caracterizada: 1) pela presença de personagens que devem estar ligados com lógica uns aos outros e à ação; 2) pela ação dramática (trama, enredo), que é o conjunto de atos dramáticos, maneiras de ser e de agir das personagens encadeadas à unidade do efeito e segundo uma ordem composta de exposição, conflito, complicação, clímax e desfecho; 3) pela situação ou ambiente, que é o conjunto de circunstâncias físicas, sociais, espirituais em que se situa a ação; 4) pelo tema, ou seja, a ideia que o autor (dramaturgo) deseja expor, ou sua interpretação real por meio da representação.

COUTINHO, A. **Notas de teoria literária.** Rio de Janeiro:  
Civilização Brasileira, 1973 (adaptado).

Considerando o texto e analisando os elementos que constituem um espetáculo teatral, conclui-se que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 102 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000066', 'ENEM-2009-103', 16, 444, 'enem', 3, 2, 2009, 'multiple_choice', 'Corpo, esporte e saúde', 'Saúde, no modelo atual de qualidade de vida, é o resultado das condições de alimentação, habitação, educação, renda, trabalho, transporte, lazer, serviços médicos e acesso à atividade física regular. Quanto ao acesso à atividade física, um dos elementos essenciais é a aptidão física, entendida como a capacidade de a pessoa utilizar seu corpo — incluindo músculos, esqueleto, coração, enfim, todas as partes —, de forma eficiente em suas atividades cotidianas; logo, quando se avalia a saúde de uma pessoa, a aptidão física deve ser levada em conta.

A partir desse contexto, considera-se que uma pessoa tem boa aptidão física quando', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 103 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000067', 'ENEM-2009-104', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', 'Diferentemente do texto escrito, que em geral compele os leitores a lerem numa onda linear – da esquerda para a direita e de cima para baixo, na página  
impressa – hipertextos encorajam os leitores a moverem-se de um bloco de texto a outro, rapidamente e não sequencialmente. Considerando que o hipertexto oferece uma multiplicidade de caminhos a seguir, podendo ainda o leitor incorporar seus caminhos e suas decisões como novos caminhos, inserindo informações novas, o leitor-navegador passa a ter um papel mais ativo e uma oportunidade diferente da de um leitor de texto impresso. Dificilmente dois leitores de hipertextos farão os mesmos caminhos e tomarão as mesmas decisões.

MARCUSCHI, L. A. **Cognição, linguagem e práticas interacionais.**  
Rio: Lucerna, 2007.

No que diz respeito à relação entre o hipertexto e o conhecimento por ele produzido, o texto apresentado deixa claro que o hipertexto muda a noção tradicional de autoria, porque', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 104 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000068', 'ENEM-2009-105', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2009/105-d37499f0.webp)

Os quadrinhos exemplificam que as Histórias em Quadrinhos constituem um gênero textual', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 105 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000069', 'ENEM-2009-106', 1, 441, 'enem', 3, 2, 2009, 'multiple_choice', 'Tecnologias da comunicação', 'A partir da metade do século XX, ocorreu um conjunto de transformações econômicas e sociais cuja dimensão é difícil de ser mensurada: a chamada explosão da informação. Embora essa expressão tenha surgido no contexto da informação científica e tecnológica, seu significado, hoje, em um contexto mais geral, atinge proporções gigantescas.  
Por estabelecerem novas formas de pensamento e mesmo de lógica, a informática e a Internet vêm gerando impactos sociais e culturais importantes. A disseminação do microcomputador e a expansão da Internet vêm acelerando o processo de globalização tanto no sentido do mercado quanto no sentido das trocas simbólicas possíveis entre sociedades e culturas diferentes, o que tem provocado e acelerado o fenômeno de hibridização amplamente caracterizado como próprio da pós-modernidade.

FERNANDES, M. F.; PARÁ, T. **A contribuição das novas tecnologias da informação na geração de conhecimento.** Disponível em: http://www.coep.ufrj.br.  
Acesso em: 11 ago. 2009 (adaptado).

Considerando-se o novo contexto social e econômico aludido no texto apresentado, as novas tecnologias de informação e comunicação', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 106 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000006a', 'ENEM-2009-107', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Texto I**  
É praticamente impossível imaginarmos nossas vidas sem o plástico. Ele está presente em embalagens de alimentos, bebidas e remédios, além de eletrodomésticos, automóveis etc. Esse uso ocorre devido à sua atoxicidade e à inércia, isto é: quando em contato com outra substâncias, o plástico não as contamina; ao contrário, protege o produto embalado. Outras duas grandes vantagens garantem o uso dos plásticos em larga escala: são leves, quase não alteram o peso do material embalado, e são 100% recicláveis, fato que, infelizmente, não é aproveitado, visto que, em todo o mundo, a percentagem de plástico reciclado, quando comparado ao total produzido, ainda é irrelevante.

**Revista Mãe Terra**. Minuano, ano I, n. 6 (adaptado).

**Texto II**  
Sacolas plásticas são leves e voam ao vento. Por isso, elas entopem esgotos e bueiros, causando enchentes. São encontradas até no estômago de tartarugas marinhas, baleias, focas e golfinhos, mortos por sufocamento.  
Sacolas plásticas descartáveis são gratuitas para os consumidores, mas têm um custo incalculável para o meio ambiente.

**Veja**, 8 jul. 2009. Fragmentos de texto publicitário do  
Instituto Akatu pelo Consumo Consciente.

Em contraste com o texto I, no texto II são empregadas, predominantemente, estratégias argumentativas que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 107 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000006b', 'ENEM-2009-108', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Texto I**  
É praticamente impossível imaginarmos nossas vidas sem o plástico. Ele está presente em embalagens de alimentos, bebidas e remédios, além de eletrodomésticos, automóveis etc. Esse uso ocorre devido à sua atoxicidade e à inércia, isto é: quando em contato com outra substâncias, o plástico não as contamina; ao contrário, protege o produto embalado. Outras duas grandes vantagens garantem o uso dos plásticos em larga escala: são leves, quase não alteram o peso do material embalado, e são 100% recicláveis, fato que, infelizmente, não é aproveitado, visto que, em todo o mundo, a percentagem de plástico reciclado, quando comparado ao total produzido, ainda é irrelevante.

**Revista Mãe Terra**. Minuano, ano I, n. 6 (adaptado).

**Texto II**  
Sacolas plásticas são leves e voam ao vento. Por isso, elas entopem esgotos e bueiros, causando enchentes. São encontradas até no estômago de tartarugas marinhas, baleias, focas e golfinhos, mortos por sufocamento.  
Sacolas plásticas descartáveis são gratuitas para os consumidores, mas têm um custo incalculável para o meio ambiente.

**Veja**, 8 jul. 2009. Fragmentos de texto publicitário do  
Instituto Akatu pelo Consumo Consciente.

Na comparação dos textos, observa-se que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 108 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000006c', 'ENEM-2009-109', 1, 215, 'enem', 3, 2, 2009, 'multiple_choice', 'Variação linguística', '![](conteudo/enem/2009/109-1422ce0e.webp)

A linguagem da tirinha revela', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 109 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000006d', 'ENEM-2009-110', 1, 441, 'enem', 3, 2, 2009, 'multiple_choice', 'Tecnologias da comunicação', 'O “Portal Domínio Público”, lançado em novembro de 2004, propõe o compartilhamento de conhecimentos de forma equânime e gratuita, colocando à disposição de todos os usuários da Internet, uma biblioteca virtual que deverá constituir referência para professores, alunos, pesquisadores e para a população em geral.  
Esse portal constitui um ambiente virtual que permite a coleta, a integração, a preservação e o compartilhamento de conhecimentos, sendo seu principal objetivo o de promover o amplo acesso às obras literárias, artísticas e científicas (na forma de textos, sons, imagens e vídeos), já em domínio público ou que tenham a sua divulgação devidamente autorizada.

**BRASIL.** Ministério da Educação. Disponível em: http://www.dominiopublico.gov.br.  
Acesso em: 29 jul. 2009 (adaptado).

Considerando a função social das informações geradas nos sistemas de comunicação e informação, o ambiente virtual descrito no texto exemplifica', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 110 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000006e', 'ENEM-2009-111', 15, 438, 'enem', 3, 2, 2009, 'multiple_choice', 'Arte e cultura', '**Cuitelinho**

Cheguei na bera do porto  
Onde as onda se espaia.  
As garça dá meia volta,  
Senta na bera da praia.  
E o cuitelinho não gosta  
Que o botão da rosa caia.

Quando eu vim da minha terra,  
Despedi da parentaia.  
Eu entrei em Mato Grosso,  
Dei em terras paraguaia.  
Lá tinha revolução,  
Enfrentei fortes bataia.

A tua saudade corta  
Como o aço de navaia.  
O coração fica aflito,  
Bate uma e outra faia.  
E os oio se enche d´água  
Que até a vista se atrapaia.

Folclore recolhido por Paulo Vanzolini e Antônio Xandó.  
BORTONI-RICARDO, S. M. **Educação em língua materna.** São Paulo: Parábola, 2004.

Transmitida por gerações, a canção Cuitelinho manifesta aspectos culturais de um povo, nos quais se inclui sua forma de falar, além de registrar um momento histórico. Depreende-se disso que a importância em preservar a produção cultural de uma nação consiste no fato de que produções como a canção Cuitelinho evidenciam a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 111 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000006f', 'ENEM-2009-112', 15, 438, 'enem', 3, 2, 2009, 'multiple_choice', 'Arte e cultura', '![](conteudo/enem/2009/112-4d3d4611.webp)

A feição deles é serem pardos, maneira d’avermelhados, de bons rostos e bons narizes, bem feitos. Andam nus, sem nenhuma cobertura, nem estimam nenhuma cousa cobrir, nem mostrar suas vergonhas. E estão acerca disso com tanta inocência como têm em mostrar o rosto.

CAMINHA, P. V. **A carta.** Disponível em: www.dominiopublico.gov.br.  
Acesso em: 12 ago. 2009.

Ao se estabelecer uma relação entre a obra de Eckhout e o trecho do texto de Caminha, conclui-se que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 112 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000070', 'ENEM-2009-113', 1, 441, 'enem', 3, 2, 2009, 'multiple_choice', 'Tecnologias da comunicação', 'As tecnologias de informação e comunicação (TIC) vieram aprimorar ou substituir meios tradicionais de comunicação e armazenamento de informações, tais como o rádio e a TV analógicos, os livros, os telégrafos, o fax etc. As novas bases tecnológicas são mais poderosas e versáteis, introduziram fortemente a possibilidade de comunicação interativa e estão presentes em todos os meios produtivos da atualidade. As novas TIC vieram acompanhadas da chamada Digital Divide, Digital Gap ou Digital Exclusion, traduzidas para o português como Divisão Digital ou Exclusão Digital, sendo, às vezes, também usados os termos Brecha Digital ou Abismo Digital. Nesse contexto, a expressão Divisão Digital refere-se a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 113 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000071', 'ENEM-2009-114', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2009/114-210b6d6d.webp)

Você sabia que as metrópoles são as grandes consumidoras dos produtos feitos com recursos naturais da Amazônia? Você pode diminuir os impactos à floresta adquirindo produtos com selos de certificação. Eles são encontrados em itens que vão desde lápis e embalagens de papelão até móveis, cosméticos e materiais de construção. Para receber os selos esses produtos devem ser fabricados sob 10 princípios éticos, entre eles o respeito à legislação ambiental e aos direitos de povos indígenas e populações que vivem em nossas matas nativas.

**Vida simples**. Ed. 74, dez. 2008.

O texto e a imagem têm por finalidade induzir o leitor a uma mudança de comportamento a partir do(a)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 114 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000072', 'ENEM-2009-115', 15, 438, 'enem', 3, 2, 2009, 'multiple_choice', 'Arte e cultura', 'A dança é importante para o índio preparar o corpo e a garganta e significa energia para o corpo, que fica robusto. Na aldeia, para preparo físico, dançamos desde cinco horas da manhã até seis horas da tarde, passa-se o dia inteiro dançando quando os padrinhos planejam a dança dos adolescentes. O padrinho é como um professor, um preparador físico dos adolescentes. Por exemplo, o padrinho sonha com um determinado canto e planeja para todos entoarem. Todos os tipos de dança vêm dos primeiros xavantes: Wamarĩdzadadzeiwawẽ, Butséwawẽ, Tseretomodzatsewawẽ, que foram descobrindo através da sabedoria como iria ser a cultura Xavante. Até hoje existe essa cultura, essa celebração. Quando o adolescente fura a orelha é obrigatório ele dançar toda a noite, tem de acordar meia-noite para dançar e cantar, é obrigatório, eles vão chamando um ao outro com um grito especial.

WÉRÉ’ É TSI’RÓBÓ, E. A dança e o canto-celebração da existência xavante. **VIS-Revista do** **Programa de Pós-Graduação em Arte da UnB.** V. 5, n. 2, dez. 2006.

A partir das informações sobre a dança Xavante, conclui-se que o valor da diversidade artística e da tradição cultural apresentados originam-se da', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 115 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000073', 'ENEM-2009-116', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Canção do vento e da minha vida**

O vento varria as folhas,  
O vento varria os frutos,  
O vento varria as flores…  
 E a minha vida ficava  
 Cada vez mais cheia  
 De frutos, de flores, de folhas.  
\[…\]  
O vento varria os sonhos  
E varria as amizades…  
O vento varria as mulheres…  
 E a minha vida ficava  
 Cada vez mais cheia  
 De afetos e de mulheres.

O vento varria os meses  
E varria os teus sorrisos…  
O vento varria tudo!  
 E a minha vida ficava  
 Cada vez mais cheia  
 De tudo.

BANDEIRA, M. **Poesia completa e prosa.** Rio de Janeiro: José Aguilar, 1967.

Predomina no texto a função da linguagem', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 116 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000074', 'ENEM-2009-117', 1, 445, 'enem', 3, 2, 2009, 'multiple_choice', 'Gramática e sentido', '**Canção do vento e da minha vida**

O vento varria as folhas,  
O vento varria os frutos,  
O vento varria as flores…  
 E a minha vida ficava  
 Cada vez mais cheia  
 De frutos, de flores, de folhas.  
\[…\]  
O vento varria os sonhos  
E varria as amizades…  
O vento varria as mulheres…  
 E a minha vida ficava  
 Cada vez mais cheia  
 De afetos e de mulheres.

O vento varria os meses  
E varria os teus sorrisos…  
O vento varria tudo!  
 E a minha vida ficava  
 Cada vez mais cheia  
 De tudo.

BANDEIRA, M. **Poesia completa e prosa.** Rio de Janeiro: José Aguilar, 1967.

Na estruturação do texto, destaca-se', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 117 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000075', 'ENEM-2009-118', 15, 438, 'enem', 3, 2, 2009, 'multiple_choice', 'Arte e cultura', 'Teatro do Oprimido é um método teatral que sistematiza exercícios, jogos e técnicas teatrais elaboradas pelo teatrólogo brasileiro Augusto Boal, recentemente falecido, que visa à desmecanização física e intelectual de seus praticantes. Partindo do princípio de que a linguagem teatral não deve ser diferenciada da que é usada cotidianamente pelo cidadão comum (oprimido), ele propõe condições práticas para que o oprimido se aproprie dos meios do fazer teatral e, assim, amplie suas possibilidades de expressão. Nesse sentido, todos podem desenvolver essa linguagem e, consequentemente, fazer teatro. Trata-se de um teatro em que o espectador é convidado a substituir o protagonista e mudar a condução ou mesmo o fim da história, conforme o olhar interpretativo e contextualizado do receptor.

**Companhia Teatro do Oprimido**. Disponível em: www.ctorio.org.br.  
Acesso em: 1 jul. 2009 (adaptado).

Considerando-se as características do Teatro do Oprimido apresentadas, conclui-se que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 118 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000076', 'ENEM-2009-119', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Texto I**  
O professor deve ser um guia seguro, muito senhor de sua língua; se outra for a orientação, vamos cair na “língua brasileira”, refúgio nefasto e confissão nojenta de ignorância do idioma pátrio, recurso vergonhoso de homens de cultura falsa e de falso patriotismo. Como havemos de querer que respeitem a nossa nacionalidade se somos os primeiros a descuidar daquilo que exprime e representa o idioma pátrio?

ALMEIDA, N. M. **Gramática metódica da língua portuguesa.**  
**Prefácio.** São Paulo: Saraiva, 1999 (adaptado).

**Texto II**  
Alguns leitores poderão achar que a linguagem desta Gramática se afasta do padrão estrito usual neste tipo de livro. Assim, o autor escreve _tenho que reformular_, e não _tenho de reformular_; _pode-se colocar dois constituintes_, e não _podem-se colocar dois constituintes_; e assim por diante. Isso foi feito de caso pensado, com a preocupação de aproximar a linguagem da gramática do padrão atual brasileiro presente nos textos técnicos jornalísticos de nossa época.

REIS, N. Nota do editor. PERINI, M. A. **Gramática descritiva**  
**do português.** São Paulo: Ática, 1996.

Confrontando-se as opiniões defendidas nos dois textos, conclui-se que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 119 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000077', 'ENEM-2009-120', 11, 442, 'enem', 3, 2, 2009, 'multiple_choice', 'Escolas e textos literários', 'No decênio de 1870, Franklin Távora defendeu a tese de que no Brasil havia duas literaturas independentes dentro da mesma língua: uma do Norte e outra do Sul, regiões segundo ele muito diferentes por formação histórica, composição étnica, costumes, modismos linguísticos etc. Por isso, deu aos romances regionais que  
publicou o título geral de **Literatura do Norte**. Em nossos dias, um escritor gaúcho, Viana Moog, procurou mostrar com bastante engenho que no Brasil há, em verdade, literaturas setoriais diversas, refletindo as características locais.

CANDIDO, A. A nova narrativa. **A educação pela noite e**  
**outros ensaios.** São Paulo: Ática, 2003

Com relação à valorização, no romance regionalista brasileiro, do homem e da paisagem de determinadas regiões nacionais, sabe-se que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 120 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000078', 'ENEM-2009-121', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', 'Quando eu falo com vocês, procuro usar o código de vocês. A figura do índio no Brasil de hoje não pode ser aquela de 500 anos atrás, do passado, que representa aquele primeiro contato. Da mesma forma que o Brasil de hoje não é o Brasil de ontem, tem 160 milhões de pessoas com diferentes sobrenomes. Vieram para cá asiáticos, europeus, africanos, e todo mundo quer ser brasileiro. A importante pergunta que nós fazemos é: qual é o pedaço de índio que vocês têm? O seu cabelo? São seus olhos? Ou é o nome da sua rua? O nome da sua praça? Enfim, vocês devem ter um pedaço de índio dentro de vocês. Para nós, o importante é que vocês olhem para a gente como seres humanos, como pessoas que nem precisam de paternalismos, nem precisam ser tratadas com privilégios. Nós não queremos tomar o Brasil de vocês, nós queremos compartilhar esse Brasil com vocês.

TERENA, M. Debate. MORIN, E. **Saberes globais e saberes locais.**  
Rio de Janeiro: Garamond, 2000 (adaptado).

Os procedimentos argumentativos utilizados no texto permitem inferir que o ouvinte/leitor, no qual o emissor foca o seu discurso, pertence', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 121 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000079', 'ENEM-2009-122', 1, 215, 'enem', 3, 2, 2009, 'multiple_choice', 'Variação linguística', 'Quando eu falo com vocês, procuro usar o código de vocês. A figura do índio no Brasil de hoje não pode ser aquela de 500 anos atrás, do passado, que representa aquele primeiro contato. Da mesma forma que o Brasil de hoje não é o Brasil de ontem, tem 160 milhões de pessoas com diferentes sobrenomes. Vieram para cá asiáticos, europeus, africanos, e todo mundo quer ser brasileiro. A importante pergunta que nós fazemos é: qual é o pedaço de índio que vocês têm? O seu cabelo? São seus olhos? Ou é o nome da sua rua? O nome da sua praça? Enfim, vocês devem ter um pedaço de índio dentro de vocês. Para nós, o importante é que vocês olhem para a gente como seres humanos, como pessoas que nem precisam de paternalismos, nem precisam ser tratadas com privilégios. Nós não queremos tomar o Brasil de vocês, nós queremos compartilhar esse Brasil com vocês.

TERENA, M. Debate. MORIN, E. **Saberes globais e saberes locais.**  
Rio de Janeiro: Garamond, 2000 (adaptado).

Na situação de comunicação da qual o texto foi retirado, a norma padrão da língua portuguesa é empregada com a finalidade de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 122 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000007a', 'ENEM-2009-123', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Se os tubarões fossem homens**

Se os tubarões fossem homens, eles seriam mais gentis com os peixes pequenos?  
Certamente, se os tubarões fossem homens, fariam construir resistentes gaiolas no mar para os peixes pequenos, com todo o tipo de alimento, tanto animal como vegetal. Cuidariam para que as gaiolas tivessem sempre água fresca e adotariam todas as providências sanitárias.  
Naturalmente haveria também escolas nas gaiolas. Nas aulas, os peixinhos aprenderiam como nadar para a goela dos tubarões. Eles aprenderiam, por exemplo, a usar a geografia para localizar os grandes tubarões deitados preguiçosamente por aí. A aula principal seria, naturalmente, a formação moral dos peixinhos. A eles seria ensinado que o ato mais grandioso e mais sublime é o sacrifício alegre de um peixinho e que todos deveriam acreditar nos tubarões, sobretudo quando estes dissessem que cuidavam de sua felicidade futura. Os peixinhos saberiam que este futuro só estaria garantido se aprendessem a obediência.  
Cada peixinho que na guerra matasse alguns peixinhos inimigos seria condecorado com uma pequena Ordem das Algas e receberia o título de herói.

BRECHT, B. **Histórias do Sr. Keuner**. São Paulo: Ed. 34, 2006 (adaptado)

Como produção humana, a literatura veicula valores que nem sempre estão representados diretamente no texto, mas são transfigurados pela linguagem literária e podem até entrar em contradição com as convenções sociais e revelar o quanto a sociedade perverteu os valores humanos que ela própria criou. É o que ocorre na narrativa do dramaturgo alemão Bertolt Brecht mostrada. Por meio da hipótese apresentada, o autor', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 123 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000007b', 'ENEM-2009-124', 11, 442, 'enem', 3, 2, 2009, 'multiple_choice', 'Escolas e textos literários', 'Oximoro, ou paradoxismo, é uma figura de retórica em que se combinam palavras de sentido oposto que parecem excluir-se mutuamente, mas que, no contexto, reforçam a expressão.

**Dicionário Eletrônico Houaiss da Língua Portuguesa.**

Considerando a definição apresentada, o fragmento poético da obra Cantares, de Hilda Hilst, publicada em 2004, em que pode ser encontrada a referida figura de retórica é:', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 124 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000007c', 'ENEM-2009-125', 1, 215, 'enem', 3, 2, 2009, 'multiple_choice', 'Variação linguística', '![](conteudo/enem/2009/125-5a4ecb2b.webp)

Na parte superior do anúncio, há um comentário escrito à mão que aborda a questão das atividades linguísticas e sua relação com as modalidades oral e escrita da língua. Esse comentário deixa evidente uma posição crítica quanto a usos que se fazem da linguagem, enfatizando ser necessário', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 125 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000007d', 'ENEM-2009-126', 1, 224, 'enem', 3, 2, 2009, 'multiple_choice', 'Gêneros textuais', '![](conteudo/enem/2009/126-b72a01dc.webp)

O texto exemplifica um gênero textual híbrido entre carta e publicidade oficial. Em seu conteúdo, é possível perceber aspectos relacionados a gêneros digitais. Considerando-se a função social das informações geradas nos sistemas de comunicação e informação presentes no texto, infere-se que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 126 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000007e', 'ENEM-2009-127', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2009/127-798e9623.webp)

Diante dos recursos argumentativos utilizados, depreende-se que o texto apresentado', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 127 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000007f', 'ENEM-2009-128', 11, 442, 'enem', 3, 2, 2009, 'multiple_choice', 'Escolas e textos literários', '**A partida**

Acordei pela madrugada. A princípio com tranquilidade, e logo com obstinação, quis novamente dormir. Inútil, o sono esgotara-se. Com precaução, acendi um fósforo: passava das três. Restava-me, portanto, menos de duas horas, pois o trem chegaria às cinco. Veio-me então o desejo de não passar mais nem uma hora naquela casa. Partir, sem dizer nada, deixar quanto antes minhas cadeias de disciplina e de amor.  
Com receio de fazer barulho, dirigi-me à cozinha, lavei o rosto, os dentes, penteei-me e, voltando ao meu quarto, vesti-me. Calcei os sapatos, sentei-me um instante à beira da cama. Minha avó continuava dormindo. Deveria fugir ou falar com ela? Ora, algumas palavras… Que me custava acordá-la, dizer-lhe adeus?

LINS, O. A partida. **Melhores contos.** Seleção e prefácio de  
Sandra Nitrini. São Paulo: Global, 2003.

No texto, o personagem narrador, na iminência da partida, descreve a sua hesitação em separar-se da avó. Esse sentimento contraditório fica claramente expresso no trecho:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 128 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000080', 'ENEM-2009-129', 1, 215, 'enem', 3, 2, 2009, 'multiple_choice', 'Variação linguística', 'Serafim da Silva Neto defendia a tese da unidade da língua portuguesa no Brasil, entrevendo que no Brasil as delimitações dialetais espaciais não eram tão marcadas como as isoglossas¹ da România Antiga. Mas Paul Teyssier, na sua **História da Língua Portuguesa**, reconhece que na diversidade socioletal essa pretensa unidade se desfaz. Diz Teyssier: “A realidade, porém, é que as divisões ‘dialetais’ no Brasil são menos geográficas que socioculturais. As diferenças na maneira de falar são maiores, num determinado lugar, entre um homem culto e o vizinho analfabeto que entre dois brasileiros do mesmo nível cultural originários de duas regiões distantes uma da outra.”

SILVA, R. V. M. **O português brasileiro e o português europeu**  
**contemporâneo: alguns aspectos da diferença.** Disponível em:  
www.uniroma.it. Acesso em: 23 jun. 2008.

¹ isoglossa – linha imaginária que, em um mapa, une os pontos de ocorrência de traços e fenômenos linguísticos idênticos.

FERREIRA, A. B. H. **Novo dicionário Aurélio da língua portuguesa.**  
Rio de Janeiro: Nova Fronteira, 1986.

De acordo com as informações presentes no texto, os pontos de vista de Serafim da Silva Neto e de Paul Teyssier convergem em relação', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 129 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000081', 'ENEM-2009-130', 11, 442, 'enem', 3, 2, 2009, 'multiple_choice', 'Escolas e textos literários', 'Nestes últimos anos, a situação mudou bastante e o Brasil, normalizado, já não nos parece tão mítico, no bem e no mal. Houve um mútuo reconhecimento entre os dois países de expressão portuguesa de um lado e do outro do Atlântico: o Brasil descobriu Portugal e Portugal, em um retorno das caravelas, voltou a descobrir o Brasil e a ser, por seu lado, colonizado por expressões linguísticas, as telenovelas, os romances, a poesia, a comida e as formas de tratamento brasileiros. O mesmo, embora em nível superficial, dele excluído o plano da língua, aconteceu com a Europa, que, depois da diáspora dos anos 70, depois da inserção na cultura da bossa-nova e da música popular brasileira, da problemática ecológica centrada na Amazônia, ou da problemática social emergente do fenômeno dos meninos de rua, e até do álibi ocultista dos romances de Paulo Coelho, continua todos os dias a descobrir, no bem e no mal, o novo Brasil. Se, no fim do século XIX, Sílvio Romero definia a literatura brasileira como manifestação de um país mestiço, será fácil para nós defini-la como expressão de um país polifônico: em que já não é determinante o eixo Rio-São Paulo, mas que, em cada região, desenvolve originalmente a sua unitária e particular tradição cultural. É esse, para nós, no início do século XXI, o novo estilo brasileiro.

STEGAGNO-PICCHIO, L. **História da literatura brasileira.**  
Rio de Janeiro: Nova Aguilar, 2004 (adaptado).

No texto, a autora mostra como o Brasil, ao longo de sua história, foi, aos poucos, construindo uma identidade cultural e literária relativamente autônoma frente à identidade europeia, em geral, e à portuguesa em particular. Sua análise pressupõe, de modo especial, o papel do patrimônio literário e linguístico, que favoreceu o surgimento daquilo que ela chama de “estilo brasileiro”. Diante desse pressuposto, e levando em consideração o texto e as diferentes etapas de consolidação da cultura brasileira, constata-se que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 130 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000082', 'ENEM-2009-131', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Texto I**  
Acompanhando os navegadores, colonizadores e comerciantes portugueses em todas as suas incríveis viagens, a partir do século XV, o português se transformou na língua de um império. Nesse processo, entrou em contato — forçado, o mais das vezes; amigável, em alguns casos — com as mais diversas línguas, passando por processos de variação e de mudança linguística. Assim, contar a história do português do Brasil é mergulhar na sua história colonial e de país independente, já que as línguas não são mecanismos desgarrados dos povos que as utilizam. Nesse cenário, são muitos os aspectos da estrutura linguística que não só expressam a diferença entre Portugal e Brasil como também definem, no Brasil, diferenças regionais e sociais.

PAGOTTO, E. P. **Línguas do Brasil.** Disponível em: http://cienciaecultura.bvs.br.  
Acesso em: 5 jul. 2009 (adaptado).

**Texto II**  
Barbarismo é vício que se comete na escritura de cada uma das partes da construção ou na pronunciação. E em nenhuma parte da Terra se comete mais essa figura da pronunciação que nestes reinos, por causa das muitas nações que trouxemos ao jugo do nosso serviço. Porque bem como os Gregos e Romanos haviam por _bárbaras_ todas as outras nações estranhas a eles, por não poderem formar sua linguagem, assim nós podemos dizer que as nações de África, Guiné, Ásia, Brasil barbarizam quando querem imitar a nossa.

BARROS, J. **Gramática da língua portuguesa.** Porto: Porto Editora, 1957 (adaptado).

Os textos abordam o contato da língua portuguesa com outras línguas e processos de variação e de mudança decorridos desse contato. Da comparação entre os textos, conclui-se que a posição de João de Barros (Texto II), em relação aos usos sociais da linguagem, revela', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 131 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000083', 'ENEM-2009-132', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Texto I**  
\[…\] já foi o tempo em que via a convivência como viável, só exigindo deste bem comum, piedosamente, o meu quinhão, já foi o tempo em que consentia num contrato, deixando muitas coisas de fora sem ceder contudo no que me era vital, já foi o tempo em que reconhecia a existência escandalosa de imaginados valores, coluna vertebral de toda ‘ordem’; mas não tive sequer o sopro necessário, e, negado o respiro, me foi imposto o sufoco; é esta consciência que me libera, é ela hoje que me empurra, são outras agora minhas preocupações, é hoje outro o meu universo de problemas; num mundo estapafúrdio — definitivamente fora de foco — cedo ou tarde tudo acaba se reduzindo a um ponto de vista, e você que vive paparicando as ciências humanas, nem suspeita que paparica uma piada: impossível ordenar o mundo dos valores, ninguém arruma a casa do capeta; me recuso pois a pensar naquilo em que não mais acredito, seja o amor, a amizade, a família, a igreja, a humanidade; me lixo com tudo isso! me apavora ainda a existência, mas não tenho medo de ficar sozinho, foi conscientemente que escolhi o exílio, me bastando hoje o cinismo dos grandes indiferentes \[…\].

NASSAR, R. **Um copo de cólera**. São Paulo:  
Companhia das Letras, 1992.

**Texto II**  
Raduan Nassar lançou a novela Um Copo de Cólera em 1978, fervilhante narrativa de um confronto verbal entre amantes, em que a fúria das palavras cortantes se estilhaçava no ar. O embate conjugal ecoava o autoritário discurso do poder e da submissão de um Brasil que vivia sob o jugo da ditadura militar.

COMODO, R. Um silêncio inquietante. **IstoÉ.** Disponível em:  
http://www.terra.com.br. Acesso em: 15 jul. 2009.

Na novela Um Copo de Cólera, o autor lança mão de recursos estilísticos e expressivos típicos da literatura produzida na década de 70 do século passado no Brasil, que, nas palavras do crítico Antonio Candido, aliam “vanguarda estética e amargura política”. Com relação à temática abordada e à concepção narrativa da novela, o texto I', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 132 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000084', 'ENEM-2009-133', 1, 439, 'enem', 3, 2, 2009, 'multiple_choice', 'Compreensão e interpretação', '**Texto I**  
\[…\] já foi o tempo em que via a convivência como viável, só exigindo deste bem comum, piedosamente, o meu quinhão, já foi o tempo em que consentia num contrato, deixando muitas coisas de fora sem ceder contudo no que me era vital, já foi o tempo em que reconhecia a existência escandalosa de imaginados valores, coluna vertebral de toda ‘ordem’; mas não tive sequer o sopro necessário, e, negado o respiro, me foi imposto o sufoco; é esta consciência que me libera, é ela hoje que me empurra, são outras agora minhas preocupações, é hoje outro o meu universo de problemas; num mundo estapafúrdio — definitivamente fora de foco — cedo ou tarde tudo acaba se reduzindo a um ponto de vista, e você que vive paparicando as ciências humanas, nem suspeita que paparica uma piada: impossível ordenar o mundo dos valores, ninguém arruma a casa do capeta; me recuso pois a pensar naquilo em que não mais acredito, seja o amor, a amizade, a família, a igreja, a humanidade; me lixo com tudo isso! me apavora ainda a existência, mas não tenho medo de ficar sozinho, foi conscientemente que escolhi o exílio, me bastando hoje o cinismo dos grandes indiferentes \[…\].

NASSAR, R. **Um copo de cólera**. São Paulo:  
Companhia das Letras, 1992.

**Texto II**  
Raduan Nassar lançou a novela Um Copo de Cólera em 1978, fervilhante narrativa de um confronto verbal entre amantes, em que a fúria das palavras cortantes se estilhaçava no ar. O embate conjugal ecoava o autoritário discurso do poder e da submissão de um Brasil que vivia sob o jugo da ditadura militar.

COMODO, R. Um silêncio inquietante. **IstoÉ.** Disponível em:  
http://www.terra.com.br. Acesso em: 15 jul. 2009.

Considerando-se os textos apresentados e o contexto político e social no qual foi produzida a obra Um Copo de Cólera, verifica-se que o narrador, ao dirigir-se à sua parceira, nessa novela, tece um discurso', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 133 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000085', 'ENEM-2009-134', 16, 444, 'enem', 3, 2, 2009, 'multiple_choice', 'Corpo, esporte e saúde', 'Nunca se falou e se preocupou tanto com o corpo como nos dias atuais. É comum ouvirmos anúncios de uma nova academia de ginástica, de uma nova forma de dieta, de uma nova técnica de autoconhecimento e outras práticas de saúde alternativa, em síntese, vivemos nos últimos anos a redescoberta do prazer, voltando nossas atenções ao nosso próprio corpo. Essa valorização do prazer individualizante se estrutura em um verdadeiro culto ao corpo, em analogia a uma religião, assistimos hoje ao surgimento de novo universo: a corpolatria.

CODO, W.; SENNE, W. **O que é corpo(latria)**. Coleção  
Primeiros Passos. Brasiliense, 1985 (adaptado).

Sobre esse fenômeno do homem contemporâneo presente nas classes sociais brasileiras, principalmente, na classe média, a corpolatria', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 134 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000086', 'ENEM-2009-135', 11, 442, 'enem', 3, 2, 2009, 'multiple_choice', 'Escolas e textos literários', '**Confidência do Itabirano**

Alguns anos vivi em Itabira.  
Principalmente nasci em Itabira.  
Por isso sou triste, orgulhoso: de ferro.  
Noventa por cento de ferro nas calçadas.  
Oitenta por cento de ferro nas almas.  
E esse alheamento do que na vida é porosidade e  
  \[comunicação.

A vontade de amar, que me paralisa o trabalho,  
vem de Itabira, de suas noites brancas, sem mulheres e  
  \[sem horizontes.  
E o hábito de sofrer, que tanto me diverte,  
é doce herança itabirana.

De Itabira trouxe prendas diversas que ora te ofereço:  
esta pedra de ferro, futuro aço do Brasil,  
este São Benedito do velho santeiro Alfredo Duval;  
este couro de anta, estendido no sofá da sala de visitas;  
este orgulho, esta cabeça baixa…

Tive ouro, tive gado, tive fazendas.  
Hoje sou funcionário público.  
Itabira é apenas uma fotografia na parede.  
Mas como dói!

ANDRADE, C. D. **Poesia completa.**  
Rio de Janeiro: Nova Aguilar, 2003.

Carlos Drummond de Andrade é um dos expoentes do movimento modernista brasileiro. Com seus poemas, penetrou fundo na alma do Brasil e trabalhou poeticamente as inquietudes e os dilemas humanos. Sua poesia é feita de uma relação tensa entre o universal e o particular, como se percebe claramente na construção do poema Confidência do Itabirano. Tendo em vista os procedimentos de construção do texto literário e as concepções artísticas modernistas, conclui-se que o poema acima', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 135 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000087', 'ENEM-2009-136', 3, 446, 'enem', 3, 2, 2009, 'multiple_choice', 'Escalas, unidades e proporção', 'Dados da Associação Nacional de Empresas de Transportes Urbanos (ANTU) mostram que o número de passageiros transportados mensalmente nas principais regiões metropolitanas do país vem caindo sistematicamente. Eram 476,7 milhões de passageiros em 1995, e esse número caiu para 321,9 milhões em abril de 2001. Nesse período, o tamanho da frota de veículos mudou pouco, tendo no final de 2008 praticamente o mesmo tamanho que tinha em 2001.  
O gráfico a seguir mostra um índice de produtividade utilizado pelas empresas do setor, que é a razão entre o total de passageiros transportados por dia e o tamanho da frota de veículos.

![](conteudo/enem/2009/136-dcd1ac1c.webp)

Supondo que as frotas totais de veículos naquelas regiões metropolitanas em abril de 2001 e em outubro de 2008 eram do mesmo tamanho, os dados do gráfico permitem inferir que o total de passageiros transportados no mês de outubro de 2008 foi aproximadamente igual a', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 136 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000088', 'ENEM-2009-137', 3, 446, 'enem', 3, 2, 2009, 'multiple_choice', 'Escalas, unidades e proporção', 'O mapa ao lado representa um bairro de determinada cidade, no qual as flechas indicam o sentido das mãos do tráfego. Sabe-se que esse bairro foi planejado e que cada quadra representada na figura é um terreno quadrado, de lado igual a 200 metros.

![](conteudo/enem/2009/137-d56b6567.webp)

Desconsiderando-se a largura das ruas, qual seria o tempo, em minutos, que um ônibus, em velocidade constante e igual a 40 km/h, partindo do ponto X, demoraria para chegar até o ponto Y?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 137 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000089', 'ENEM-2009-138', 3, 447, 'enem', 3, 2, 2009, 'multiple_choice', 'Porcentagem e juros', 'A população mundial está ficando mais velha, os índices de natalidade diminuíram e a expectativa de vida aumentou. No gráfico seguinte, são apresentados dados obtidos por pesquisa realizada pela Organização das Nações Unidas (ONU), a respeito da quantidade de pessoas com 60 anos ou mais em todo o mundo. Os números da coluna da direita representam as faixas percentuais. Por exemplo, em 1950 havia 95 milhões de pessoas com 60 anos ou mais nos países desenvolvidos, número entre 10% e 15% da população total nos países desenvolvidos.

![](conteudo/enem/2009/138-2f19ef3b.webp)

Suponha que o modelo exponencial y = 363e0,03x, em que x = 0 corresponde ao ano 2000, x = 1 corresponde ao ano 2001, e assim sucessivamente, e que y é a população em milhões de habitantes no ano x, seja usado para estimar essa população com 60 anos ou mais de idade nos países em desenvolvimento entre 2010 e 2050.

Desse modo, considerando e0,3 = 1,35, estima-se que a população com 60 anos ou mais estará, em 2030, entre', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 138 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000008a', 'ENEM-2009-139', 3, 447, 'enem', 3, 2, 2009, 'multiple_choice', 'Porcentagem e juros', 'A população mundial está ficando mais velha, os índices de natalidade diminuíram e a expectativa de vida aumentou. No gráfico seguinte, são apresentados dados obtidos por pesquisa realizada pela Organização das Nações Unidas (ONU), a respeito da quantidade de pessoas com 60 anos ou mais em todo o mundo. Os números da coluna da direita representam as faixas percentuais. Por exemplo, em 1950 havia 95 milhões de pessoas com 60 anos ou mais nos países desenvolvidos, número entre 10% e 15% da população total nos países desenvolvidos.

![](conteudo/enem/2009/139-ce6a3e69.webp)

Em 2050, a probabilidade de se escolher, aleatoriamente, uma pessoa com 60 anos ou mais de idade, na população dos países desenvolvidos, será um número mais próximo de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 139 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000008b', 'ENEM-2009-140', 3, 448, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria plana e áreas', 'O governo cedeu terrenos para que famílias construíssem suas residências com a condição de que no mínimo 94% da área do terreno fosse mantida como área de preservação ambiental. Ao receber o terreno retangular ABCD, em que AB= BC/2 , Antônio demarcou uma área quadrada no vértice A, para a construção de sua residência, de acordo com o desenho, no qual AE = AB/5 é lado do quadrado.

![](conteudo/enem/2009/140-ef5fc6bc.webp)

Nesse caso, a área definida por Antônio atingiria exatamente o limite determinado pela condição se ele', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 140 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000008c', 'ENEM-2009-141', 3, 449, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria espacial e volumes', 'Uma resolução do Conselho Nacional de Política Energética (CNPE) estabeleceu a obrigatoriedade de adição de biodiesel ao óleo diesel comercializado nos postos. A exigência é que, a partir de 1.º de julho de 2009, 4% do volume da mistura final seja formada por biodiesel. Até junho de 2009, esse percentual era de 3%. Essa medida estimula a demanda de biodiesel, bem como possibilita a redução da importação de dísel de petróleo.

Disponível em: http://www1.folha.uol.com.br.  
Acesso em: 12 jul. 2009 (adaptado).

Estimativas indicam que, com a adição de 4% de biodiesel ao dísel, serão consumidos 925 milhões de litros de biodiesel no segundo semestre de 2009. Considerando-se essa estimativa, para o mesmo volume da mistura final dísel/biodiesel consumida no segundo semestre de 2009, qual seria o consumo de biodiesel com a adição de 3%?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 141 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000008d', 'ENEM-2009-142', 3, 446, 'enem', 3, 2, 2009, 'multiple_choice', 'Escalas, unidades e proporção', 'A suspeita de que haveria uma relação causal entre tabagismo e câncer de pulmão foi levantada pela primeira vez a partir de observações clínicas. Para testar essa possível associação, foram conduzidos inúmeros estudos epidemiológicos. Dentre esses, houve o estudo do número de casos de câncer em relação ao número de cigarros consumidos por dia, cujos resultados são mostrados no gráfico a seguir.

![](conteudo/enem/2009/142-c56fbd08.webp)

De acordo com as informações do gráfico,', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 142 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000008e', 'ENEM-2009-143', 3, 447, 'enem', 3, 2, 2009, 'multiple_choice', 'Porcentagem e juros', 'O gráfico a seguir mostra a evolução, de abril de 2008 a maio de 2009, da população economicamente ativa para seis Regiões Metropolitanas pesquisadas.

![](conteudo/enem/2009/143-d9c2ead9.webp)

Disponível em: www.ibge.gov.br.

Considerando que a taxa de crescimento da população economicamente ativa, entre 05/09 e 06/09, seja de 4%, então o número de pessoas economicamente ativas em 06/09 será igual a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 143 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000008f', 'ENEM-2009-144', 3, 450, 'enem', 3, 2, 2009, 'multiple_choice', 'Contagem', 'A música e a matemática se encontram na representação dos tempos das notas musicais, conforme a figura seguinte.

![](conteudo/enem/2009/144-e592d2d8.webp)

Um compasso é uma unidade musical composta por determinada quantidade de notas musicais em que a soma das durações coincide com a fração indicada como fórmula do compasso. Por exemplo, se a fórmula de compasso for 1/2 , poderia ter um compasso ou com duas semínimas ou uma mínima ou quatro colcheias, sendo possível a combinação de diferentes figuras.

Um trecho musical de oito compassos, cuja fórmula é 3/4 , poderia ser preenchido com', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 144 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000090', 'ENEM-2009-145', 3, 447, 'enem', 3, 2, 2009, 'multiple_choice', 'Porcentagem e juros', 'O controle de qualidade de uma empresa fabricante de telefones celulares aponta que a probabilidade de um aparelho de determinado modelo apresentar defeito de fabricação é de 0,2%. Se uma loja acaba de vender 4 aparelhos desse modelo para um cliente, qual é a probabilidade de esse cliente sair da loja com exatamente dois aparelhos defeituosos?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 145 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000091', 'ENEM-2009-146', 3, 105, 'enem', 3, 2, 2009, 'multiple_choice', 'Média, moda e mediana', 'Uma pousada oferece pacotes promocionais para atrair casais a se hospedarem por até oito dias. A hospedagem seria em apartamento de luxo e, nos três primeiros dias, a diária custaria R$ 150,00, preço da diária fora da promoção. Nos três dias seguintes, seria aplicada uma redução no valor da diária, cuja taxa média de variação, a cada dia, seria de R$ 20,00. Nos dois dias restantes, seria mantido o preço do sexto dia. Nessas condições, um modelo para a promoção idealizada é apresentado no gráfico a seguir, no qual o valor da diária é função do tempo medido em número de dias.

![](conteudo/enem/2009/146-6e823a1c.webp)

De acordo com os dados e com o modelo, comparando o preço que um casal pagaria pela hospedagem por sete dias fora da promoção, um casal que adquirir o pacote promocional por oito dias fará uma economia de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 146 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000092', 'ENEM-2009-147', 3, 451, 'enem', 3, 2, 2009, 'multiple_choice', 'Números e operações', 'As figuras a seguir exibem um trecho de um quebra-cabeças que está sendo montado. Observe que as peças são quadradas e há 8 peças no tabuleiro da figura A e 8 peças no tabuleiro da figura B. As peças são retiradas do tabuleiro da figura B e colocadas no tabuleiro da figura A na posição correta, isto é, de modo a completar os desenhos.

![](conteudo/enem/2009/147-2540b2c3.webp)

![](conteudo/enem/2009/147-ce96a139.webp)

É possível preencher corretamente o espaço indicado pela seta no tabuleiro da figura A colocando a peça', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 147 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000093', 'ENEM-2009-148', 3, 105, 'enem', 3, 2, 2009, 'multiple_choice', 'Média, moda e mediana', 'A tabela mostra alguns dados da emissão de dióxido de carbono de uma fábrica, em função do número de toneladas produzidas.

![](conteudo/enem/2009/148-052af6e6.webp)

Os dados na tabela indicam que a taxa média de variação entre a emissão de dióxido de carbono (em ppm) e a produção (em toneladas) é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 148 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000094', 'ENEM-2009-149', 3, 448, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria plana e áreas', 'Em Florença, Itália, na Igreja de Santa Croce, é possível encontrar um portão em que aparecem os anéis de Borromeo. Alguns historiadores acreditavam que os círculos representavam as três artes: escultura, pintura e arquitetura, pois elas eram tão próximas quanto inseparáveis.

![](conteudo/enem/2009/149-87fc20be.webp)

Qual dos esboços a seguir melhor representa os anéis de Borromeo?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 149 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000095', 'ENEM-2009-150', 3, 105, 'enem', 3, 2, 2009, 'multiple_choice', 'Média, moda e mediana', 'Brasil e França têm relações comerciais há mais de 200 anos. Enquanto a França é a 5ª nação mais rica do planeta, o Brasil é a 10ª, e ambas se destacam na economia mundial. No entanto, devido a uma série de restrições, o comércio entre esses dois países ainda não é adequadamente explorado, como mostra a tabela seguinte, referente ao período 2003-2007.

![](conteudo/enem/2009/150-345210ee.webp)

Os dados da tabela mostram que, no período considerado, os valores médios dos investimentos da França no Brasil foram maiores que os investimentos do Brasil na França em um valor', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 150 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000096', 'ENEM-2009-151', 3, 451, 'enem', 3, 2, 2009, 'multiple_choice', 'Números e operações', 'Um grupo de 50 pessoas fez um orçamento inicial para organizar uma festa, que seria dividido entre elas em cotas iguais. Verificou-se ao final que, para arcar com todas as despesas, faltavam R$ 510,00, e que 5 novas pessoas haviam ingressado no grupo. No acerto foi decidido que a despesa total seria dividida em partes iguais pelas 55 pessoas. Quem não havia ainda contribuído pagaria a sua parte, e cada uma das 50 pessoas do grupo inicial deveria contribuir com mais R$ 7,00.

De acordo com essas informações, qual foi o valor da cota calculada no acerto final para cada uma das 55 pessoas?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 151 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000097', 'ENEM-2009-152', 3, 449, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria espacial e volumes', '**Técnicos concluem mapeamento do aquífero Guarani**

O aquífero Guarani localiza-se no subterrâneo dos territórios da Argentina, Brasil, Paraguai e Uruguai, com extensão total de 1.200.000 quilômetros quadrados, dos quais 840.000 quilômetros quadrados estão no Brasil. O aquífero armazena cerca de 30 mil quilômetros cúbicos de água e é considerado um dos maiores do mundo.  
Na maioria das vezes em que são feitas referências à água, são usadas as unidades metro cúbico e litro, e não as unidades já descritas. A Companhia de Saneamento Básico do Estado de São Paulo (SABESP) divulgou, por exemplo, um novo reservatório cuja capacidade de armazenagem é de 20 milhões de litros.

Disponível em: http://noticias.terra.com.br. Acesso em: 10 jul. 2009 (adaptado).

Comparando as capacidades do aquífero Guarani e desse novo reservatório da SABESP, a capacidade do aquífero Guarani é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 152 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000098', 'ENEM-2009-153', 3, 449, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria espacial e volumes', 'Suponha que, na escultura do artista Emanoel Araújo, mostrada na figura a seguir, todos os prismas numerados em algarismos romanos são retos, com bases triangulares, e que as faces laterais do poliedro II são perpendiculares à sua própria face superior, que, por sua vez, é um triângulo congruente ao triângulo base dos prismas. Além disso, considere que os prismas I e III são perpendiculares ao prisma IV e ao poliedro II.

![](conteudo/enem/2009/153-0aaaf8f3.webp)

Imagine um plano paralelo à face α do prisma I, mas que passe pelo ponto P pertencente à aresta do poliedro II, indicado na figura. A interseção desse plano imaginário com a escultura contém', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 153 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000099', 'ENEM-2009-154', 3, 446, 'enem', 3, 2, 2009, 'multiple_choice', 'Escalas, unidades e proporção', 'A rampa de um hospital tem na sua parte mais elevada uma altura de 2,2 metros. Um paciente ao caminhar sobre a rampa percebe que se deslocou 3,2 metros e alcançou uma altura de 0,8 metro.

A distância em metros que o paciente ainda deve caminhar para atingir o ponto mais alto da rampa é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 154 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000009a', 'ENEM-2009-155', 3, 449, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria espacial e volumes', 'Um posto de combustível vende 10.000 litros de álcool por dia a R$ 1,50 cada litro. Seu proprietário percebeu que, para cada centavo de desconto que  concedia por litro, eram vendidos 100 litros a mais por dia. Por exemplo, no dia em que o preço do álcool foi R$ 1,48, foram vendidos 10.200 litros.

Considerando x o valor, em centavos, do desconto dado no preço de cada litro, e V o valor, em R$, arrecadado por dia com a venda do álcool, então a expressão que relaciona V e x é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 155 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000009b', 'ENEM-2009-156', 3, 451, 'enem', 3, 2, 2009, 'multiple_choice', 'Números e operações', 'Para cada indivíduo, a sua inscrição no Cadastro de Pessoas Físicas (CPF) é composto por um número de 9 algarismos e outro número de 2 algarismos, na forma _d1_ e _d2_, em que os dígitos _d1_ e _d2_ são denominados dígitos verificadores. Os dígitos verificadores são calculados, a partir da esquerda, da seguinte maneira: os 9 primeiros algarismos são multiplicados pela sequência 10, 9, 8, 7, 6, 5, 4, 3, 2 (o primeiro por 10, o segundo por 9, e assim sucessivamente); em seguida, calcula-se o resto _r_ da divisão da soma dos resultados das multiplicações por 11, e se esse resto _r_ for 0 ou 1, _d1_ é zero, caso contrário _d1_ = (11 – r). O dígito _d2_ é calculado pela mesma regra, na qual os números a serem multiplicados pela sequência dada são contados a partir do segundo algarismo, sendo _d1_ o último algarismo, isto é, _d2_ é zero se o resto _s_ da divisão por 11 das somas das multiplicações for 0 ou 1, caso contrário, _d2_ = (11 – _s_).

Suponha que João tenha perdido seus documentos, inclusive o cartão de CPF e, ao dar queixa da perda na delegacia, não conseguisse lembrar quais eram os dígitos verificadores, recordando-se apenas que os nove primeiros algarismos eram 123.456.789. Neste caso, os dígitos verificadores d1 e d2 esquecidos são, respectivamente,', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 156 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000009c', 'ENEM-2009-157', 3, 449, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria espacial e volumes', 'Uma empresa que fabrica esferas de aço, de 6 cm de raio, utiliza caixas de madeira, na forma de um cubo, para transportá-las.

Sabendo que a capacidade da caixa é de 13.824 cm³, então o número máximo de esferas que podem ser transportadas em uma caixa é igual a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 157 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000009d', 'ENEM-2009-158', 3, 446, 'enem', 3, 2, 2009, 'multiple_choice', 'Escalas, unidades e proporção', 'A figura a seguir mostra as medidas reais de uma aeronave que será fabricada para utilização por companhias de transporte aéreo. Um engenheiro precisa fazer o desenho desse avião em escala de 1:150.

![](conteudo/enem/2009/158-ee2af503.webp)

Para o engenheiro fazer esse desenho em uma folha de papel, deixando uma margem de 1 cm em relação às bordas da folha, quais as dimensões mínimas, em centímetros, que essa folha deverá ter?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 158 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000009e', 'ENEM-2009-159', 3, 452, 'enem', 3, 2, 2009, 'multiple_choice', 'Funções e gráficos', 'Um experimento consiste em colocar certa quantidade de bolas de vidro idênticas em um copo com água até certo nível e medir o nível da água, conforme ilustrado na figura a seguir. Como resultado do experimento, concluiu-se que o nível da água é função do número de bolas de vidro que são colocadas dentro do copo.

![](conteudo/enem/2009/159-c49b9a82.webp)

O quadro a seguir mostra alguns resultados do experimento realizado.

![](conteudo/enem/2009/159-09fc439a.webp)

Qual a expressão algébrica que permite calcular o nível da água (y) em função do número de bolas (x)?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 159 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000009f', 'ENEM-2009-160', 3, 451, 'enem', 3, 2, 2009, 'multiple_choice', 'Números e operações', 'Uma cooperativa de colheita propôs a um fazendeiro um contrato de trabalho nos seguintes termos: a cooperativa forneceria 12 trabalhadores e 4 máquinas, em um regime de trabalho de 6 horas diárias, capazes de colher 20 hectares de milho por dia, ao custo de R$ 10,00 por trabalhador por dia de trabalho, e R$ 1.000,00 pelo aluguel diário de cada máquina. O fazendeiro argumentou que fecharia contrato se a cooperativa colhesse 180 hectares de milho em 6 dias, com gasto inferior a R$ 25.000,00.

Para atender às exigências do fazendeiro e supondo que o ritmo dos trabalhadores e das máquinas seja constante, a cooperativa deveria', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 160 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a0', 'ENEM-2009-161', 3, 105, 'enem', 3, 2, 2009, 'multiple_choice', 'Média, moda e mediana', 'Suponha que a etapa final de uma gincana escolar consista em um desafio de conhecimentos. Cada equipe escolheria 10 alunos para realizar uma prova objetiva, e a pontuação da equipe seria dada pela mediana das notas obtidas pelos alunos. As provas valiam, no máximo, 10 pontos cada. Ao final, a vencedora foi a equipe Ômega, com 7,8 pontos, seguida pela equipe Delta, com 7,6 pontos. Um dos alunos da equipe Gama, a qual ficou na terceira e última colocação, não pôde comparecer, tendo recebido nota zero na prova. As notas obtidas pelos 10 alunos da equipe Gama foram 10; 6,5; 8; 10; 7; 6,5; 7; 8; 6; 0.

Se o aluno da equipe Gama que faltou tivesse comparecido, essa equipe', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 161 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a1', 'ENEM-2009-162', 3, 451, 'enem', 3, 2, 2009, 'multiple_choice', 'Números e operações', 'Uma escola lançou uma campanha para seus alunos arrecadarem, durante 30 dias, alimentos não perecíveis para doar a uma comunidade carente da região. Vinte alunos aceitaram a tarefa e nos primeiros 10 dias trabalharam 3 horas diárias, arrecadando 12 kg de alimentos por dia. Animados com os resultados, 30 novos alunos somaram-se ao grupo, e passaram a trabalhar 4 horas por dia nos dias seguintes até o término da campanha.

Admitindo-se que o ritmo de coleta tenha se mantido constante, a quantidade de alimentos arrecadados ao final do prazo estipulado seria de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 162 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a2', 'ENEM-2009-163', 3, 446, 'enem', 3, 2, 2009, 'multiple_choice', 'Escalas, unidades e proporção', 'Segundo as regras da Fórmula 1, o peso mínimo do carro, de tanque vazio, com o piloto, é de 605 kg, e a gasolina deve ter densidade entre 725 e 780 gramas por litro. Entre os circuitos nos quais ocorrem competições dessa categoria, o mais longo é _Spa-Francorchamps_, na Bélgica, cujo traçado tem 7 km de extensão. O consumo médio de um carro da Fórmula 1 é de 75 litros para cada 100 km.

Suponha que um piloto de uma equipe específica, que utiliza um tipo de gasolina com densidade de 750 g/L, esteja no circuito de Spa-Francorchamps, parado no box para reabastecimento. Caso ele pretenda dar mais 16 voltas, ao ser liberado para retornar à pista, seu carro deverá pesar, no mínimo,', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 163 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a3', 'ENEM-2009-164', 3, 448, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria plana e áreas', 'Ao morrer, o pai de João, Pedro e José deixou como herança um terreno retangular de 3 km x 2 km que contém uma área de extração de ouro delimitada por um quarto de círculo de raio 1 km a partir do canto inferior esquerdo da propriedade. Dado o maior valor da área de extração de ouro, os irmãos acordaram em repartir a propriedade de modo que cada um ficasse com a terça parte da área de extração, conforme mostra a figura.

![](conteudo/enem/2009/164-fbf84d66.webp)

Em relação à partilha proposta, constata-se que a porcentagem da área do terreno que coube a João corresponde, aproximadamente, a
(considere  √3/3 = 0,58)', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 164 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a4', 'ENEM-2009-165', 3, 450, 'enem', 3, 2, 2009, 'multiple_choice', 'Contagem', 'Doze times se inscreveram em um torneio de futebol amador. O jogo de abertura do torneio foi escolhido da seguinte forma: primeiro foram sorteados 4 times para compor o Grupo A. Em seguida, entre os times do Grupo A, foram sorteados 2 times para realizar o jogo de abertura do torneio, sendo que o primeiro deles jogaria em seu próprio campo, e o segundo seria o time visitante.

A quantidade total de escolhas possíveis para o Grupo A e a quantidade total de escolhas dos times do jogo de abertura podem ser calculadas através de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2009 · 2º dia · Questão 165 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a5', 'ENEM-2009-166', 3, 449, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria espacial e volumes', 'Rotas aéreas são como pontes que ligam cidades, estados ou países. O mapa a seguir mostra os estados brasileiros e a localização de algumas capitais identificadas pelos números. Considere que a direção seguida por um avião AI que partiu de Brasília – DF, sem escalas, para Belém, no Pará, seja um segmento de reta com extremidades em DF e em 4.

![](conteudo/enem/2009/166-f22c3fd9.webp)

Suponha que um passageiro de nome Carlos pegou um avião AII, que seguiu a direção que forma um ângulo de 135º graus no sentido horário com a rota Brasília – Belém e pousou em alguma das capitais brasileiras. Ao desembarcar, Carlos fez uma conexão e embarcou em um avião AIII, que seguiu a direção que forma um ângulo reto, no sentido anti-horário, com a direção seguida pelo avião AII ao partir de Brasília-DF. Considerando que a direção seguida por um avião é sempre dada pela semirreta com origem na cidade de partida e que passa pela cidade destino do avião, pela descrição dada, o passageiro Carlos fez uma conexão em', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 166 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a6', 'ENEM-2009-167', 3, 448, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria plana e áreas', 'O quadro apresenta informações da área aproximada de cada bioma brasileiro.

![](conteudo/enem/2009/167-2e45ce65.webp)

É comum em conversas informais, ou mesmo em noticiários, o uso de múltiplos da área de um campo de futebol (com as medidas de 120 m x 90 m) para auxiliar a visualização de áreas consideradas extensas

Nesse caso, qual é o número de campos de futebol correspondente à área aproximada do bioma Pantanal?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 167 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a7', 'ENEM-2009-168', 3, 105, 'enem', 3, 2, 2009, 'multiple_choice', 'Média, moda e mediana', 'Na tabela, são apresentados dados da cotação mensal do ovo extra branco vendido no atacado, em Brasília, em reais, por caixa de 30 dúzias de ovos, em alguns meses dos anos 2007 e 2008.

![](conteudo/enem/2009/168-f683544b.webp)

De acordo com esses dados, o valor da mediana das cotações mensais do ovo extra branco nesse período era igual a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 168 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a8', 'ENEM-2009-169', 3, 448, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria plana e áreas', 'A vazão do rio Tietê, em São Paulo, constitui preocupação constante nos períodos chuvosos. Em alguns trechos, são construídas canaletas para controlar o fluxo de água. Uma dessas canaletas, cujo corte vertical determina a forma de um trapézio isósceles, tem as medidas especificadas na figura I. Neste caso, a vazão da água é de 1.050 m³/s. O cálculo da vazão, Q em m³/s, envolve o produto da área A do setor transversal (por onde passa a água), em m², pela velocidade da água no local, v, em m/s, ou seja, Q = Av.  
Planeja-se uma reforma na canaleta, com as dimensões especificadas na figura II, para evitar a ocorrência de enchentes.

![](conteudo/enem/2009/169-ff2b8876.webp)

Na suposição de que a velocidade da água não se alterará, qual a vazão esperada para depois da reforma na canaleta?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2009 · 2º dia · Questão 169 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000a9', 'ENEM-2009-170', 3, 447, 'enem', 3, 2, 2009, 'multiple_choice', 'Porcentagem e juros', 'A resolução das câmeras digitais modernas é dada em _megapixels_, unidade de medida que representa um milhão de pontos. As informações sobre cada um desses pontos são armazenadas, em geral, em 3 _bytes_. Porém, para evitar que as imagens ocupem muito espaço, elas são submetidas a algoritmos de compressão, que reduzem em até 95% a quantidade de _bytes_ necessários  
para armazená-las. Considere 1 KB = 1.000 bytes, 1 MB = 1.000 KB, 1 GB = 1.000 MB.

Utilizando uma câmera de 2.0 megapixels cujo algoritmo de compressão é de 95%, João fotografou 150 imagens para seu trabalho escolar. Se ele deseja armazená-las de modo que o espaço restante no dispositivo seja o menor espaço possível, ele deve utilizar', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 170 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000aa', 'ENEM-2009-171', 3, 453, 'enem', 3, 2, 2009, 'multiple_choice', 'Probabilidade', 'A população brasileira sabe, pelo menos intuitivamente, que a probabilidade de acertar as seis dezenas da mega sena não é zero, mas é quase. Mesmo assim, milhões de pessoas são atraídas por essa loteria, especialmente quando o prêmio se acumula em valores altos. Até junho de 2009, cada aposta de seis dezenas, pertencentes ao conjunto {01, 02, 03, …, 59, 60}, custava R$ 1,50.

Disponível em: www.caixa.gov.br. Acesso em: 7 jul. 2009.

Considere que uma pessoa decida apostar exatamente R$ 126,00 e que esteja mais interessada em acertar apenas cinco das seis dezenas da mega sena, justamente pela dificuldade desta última.

Nesse caso, é melhor que essa pessoa faça 84 apostas de seis dezenas diferentes, que não tenham cinco números em comum, do que uma única aposta com nove dezenas, porque a probabilidade de acertar a quina no segundo caso em relação ao primeiro é, aproximadamente,', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 171 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ab', 'ENEM-2009-172', 3, 446, 'enem', 3, 2, 2009, 'multiple_choice', 'Escalas, unidades e proporção', 'Nos últimos anos, o volume de petróleo exportado pelo Brasil tem mostrado expressiva tendência de crescimento, ultrapassando as importações em 2008. Entretanto, apesar de as importações terem se mantido praticamente no mesmo patamar desde 2001, os recursos gerados com as exportações ainda são inferiores àqueles despendidos com as importações, uma vez que o preço médio por metro cúbico do petróleo importado é superior ao do petróleo nacional. Nos primeiros cinco meses de 2009, foram gastos 2,84 bilhões de dólares com importações e gerada uma receita de 2,24 bilhões de dólares com as exportações. O preço médio por metro cúbico em maio de 2009 foi de 340 dólares para o petróleo importado e de 230 dólares para o petróleo exportado. O quadro a seguir mostra os dados consolidados de 2001 a 2008 e dos primeiros cinco meses de 2009.

![](conteudo/enem/2009/172-5f549378.webp)

Considere que as importações e exportações de petróleo de junho a dezembro de 2009 sejam iguais a 7/5 das  
importações e exportações, respectivamente, ocorridas de janeiro a maio de 2009.

Nesse caso, supondo que os preços para importação e exportação não sofram alterações, qual seria o valor mais aproximado da diferença entre os recursos despendidos com as importações e os recursos gerados com as exportações em 2009?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 172 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ac', 'ENEM-2009-173', 3, 449, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria espacial e volumes', 'Uma fábrica produz velas de parafina em forma de pirâmide quadrangular regular com 19 cm de altura e 6 cm de aresta da base. Essas velas são formadas por 4 blocos de mesma altura — 3 troncos de pirâmide de bases paralelas e 1 pirâmide na parte superior —, espaçados de 1 cm entre eles, sendo que a base superior de cada bloco é igual à base inferior do bloco sobreposto, com uma haste de ferro passando pelo centro de cada bloco, unindo-os, conforme a figura.

![](conteudo/enem/2009/173-e9b7219c.webp)

Se o dono da fábrica resolver diversificar o modelo, retirando a pirâmide da parte superior, que tem 1,5 cm de aresta na base, mas mantendo o mesmo molde, quanto ele passará a gastar com parafina para fabricar uma vela?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 173 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ad', 'ENEM-2009-174', 3, 448, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria plana e áreas', 'Considere um ponto P em uma circunferência de raio r no plano cartesiano. Seja Q a projeção ortogonal de P sobre o eixo x, como mostra a figura, e suponha que o ponto P percorra, no sentido anti-horário, uma distância d ≤ r sobre a circunferência.

![](conteudo/enem/2009/174-29dd5a77.webp)

Então, o ponto Q percorrerá, no eixo x, uma distância dada por', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 174 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ae', 'ENEM-2009-175', 3, 451, 'enem', 3, 2, 2009, 'multiple_choice', 'Números e operações', 'O Indicador do CadÚnico (ICadÚnico), que compõe o cálculo do Índice de Gestão Descentralizada do Programa Bolsa Família (IGD), é obtido por meio da **média aritmética** entre a taxa de cobertura qualificada de cadastros (TC) e a taxa de atualização de cadastros (TA), em que, _TC= NV/NF, TA= NA/NV, NV_ é o número de cadastros domiciliares válidos no perfil do CadÚnico, _NF_ é o número de famílias estimadas como público alvo do CadÚnico e _NA_ é o número de cadastros domiciliares atualizados no perfil do CadÚnico.

**Portaria n° 148 de 27 de abril de 2006** (adaptado).

Suponha que o IcadÚnico de um município específico é 0,6. Porém, dobrando NF o IcadÚnico cairá para 0,5. Se NA + NV = 3.600, então NF é igual a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 175 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000af', 'ENEM-2009-176', 3, 451, 'enem', 3, 2, 2009, 'multiple_choice', 'Números e operações', 'Joana frequenta uma academia de ginástica onde faz exercícios de musculação. O programa de Joana requer que ela faça 3 séries de exercícios em 6 aparelhos diferentes, gastando 30 segundos em cada série. No aquecimento, ela caminha durante 10 minutos na esteira e descansa durante 60 segundos para começar o primeiro exercício no primeiro aparelho. Entre uma série e outra, assim como ao mudar de aparelho, Joana descansa por 60 segundos.

Suponha que, em determinado dia, Joana tenha iniciado seus exercícios às 10h30min e finalizado às 11h7min. Nesse dia e nesse tempo, Joana', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 176 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b0', 'ENEM-2009-177', 3, 449, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria espacial e volumes', 'Um artesão construiu peças de artesanato interceptando uma pirâmide de base quadrada com um plano. Após fazer um estudo das diferentes peças que poderia obter, ele concluiu que uma delas poderia ter uma das faces pentagonal.

Qual dos argumentos a seguir justifica a conclusão do artesão?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2009 · 2º dia · Questão 177 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b1', 'ENEM-2009-178', 3, 447, 'enem', 3, 2, 2009, 'multiple_choice', 'Porcentagem e juros', 'João deve 12 parcelas de R$ 150,00 referentes ao cheque especial de seu banco e cinco parcelas de R$ 80,00 referentes ao cartão de crédito. O gerente do banco lhe ofereceu duas parcelas de desconto no cheque especial, caso João quitasse esta dívida imediatamente ou, na mesma condição, isto é, quitação imediata, com 25% de desconto na dívida do cartão. João também poderia renegociar suas dívidas em 18 parcelas mensais de R$ 125,00. Sabendo desses termos, José, amigo de João, ofereceu-lhe emprestar o dinheiro que julgasse necessário pelo tempo de 18 meses, com juros de 25% sobre o total emprestado.

A opção que dá a João o menor gasto seria', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2009 · 2º dia · Questão 178 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b2', 'ENEM-2009-179', 3, 448, 'enem', 3, 2, 2009, 'multiple_choice', 'Geometria plana e áreas', 'A cisterna é um recipiente utilizado para armazenar água da chuva. Os principais critérios a serem observados para captação e armazenagem de água da chuva são: a demanda diária de água na propriedade; o índice médio de precipitação (chuva), por região, em cada período do ano; o tempo necessário para armazenagem; e a área de telhado necessária ou disponível para captação. Para fazer o cálculo do volume de uma cisterna, deve-se acrescentar um adicional relativo ao coeficiente de evaporação. Na dificuldade em se estabelecer um coeficiente confiável, a Empresa Brasileira de Pesquisa Agropecuária (EMBRAPA) sugere que sejam adicionados 10% ao volume calculado de água.

Desse modo, o volume, em m³, de uma cisterna é calculado por Vc = Vd × Ndia, em que Vd = volume de demanda da água diária (m³), Ndia = número de dias de armazenagem, e este resultado deve ser acrescido de 10%.

Para melhorar a qualidade da água, recomenda-se que a captação seja feita somente nos telhados das edificações.  
Considerando que a precipitação de chuva de 1 mm sobre uma área de 1 m²  
produz 1 litro de água, pode-se calcular a área de um telhado a fim de atender a  
necessidade de armazenagem da seguinte maneira: área do telhado (em m²) = volume da cisterna (em litros)/precipitação.

Disponível em: www.cnpsa.embrapa.br.  
Acesso em: 8 jun. 2009 (adaptado).

Para atender a uma demanda diária de 2.000 litros de água, com período de armazenagem de 15 dias e precipitação média de 110 mm, o telhado, retangular, deverá ter as dimensões mínimas de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 179 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b3', 'ENEM-2009-180', 3, 453, 'enem', 3, 2, 2009, 'multiple_choice', 'Probabilidade', 'Um médico está estudando um novo medicamento que combate um tipo de câncer em estágios avançados. Porém, devido ao forte efeito dos seus componentes, a cada dose administrada há uma chance de 10% de que o paciente sofra algum dos efeitos colaterais observados no estudo, tais como dores de cabeça, vômitos ou mesmo agravamento dos sintomas da doença. O médico oferece tratamentos compostos por 3, 4, 6, 8 ou 10 doses do medicamento, de acordo com o risco que o paciente pretende assumir.

Se um paciente considera aceitável um risco de até 35% de chances de que ocorra algum dos efeitos colaterais durante o tratamento, qual é o maior número admissível de doses para esse paciente?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2009 · 2º dia · Questão 180 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b4', 'ENEM-2010-001', 9, 433, 'enem', 3, 2, 2010, 'multiple_choice', 'Agropecuária, indústria e energia', '![](conteudo/enem/2010/1-ac150e2b.webp)

O gráfico representa a relação entre o tamanho e a totalidade dos imóveis rurais no Brasil. Que característica da estrutura fundiária brasileira está evidenciada no gráfico apresentado?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 1 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b5', 'ENEM-2010-002', 13, 454, 'enem', 3, 2, 2010, 'multiple_choice', 'Filosofia antiga', 'Antes, eram apenas as grandes cidades que se apresentavam como o império da técnica, objeto de modificações, suspensões, acréscimos, cada vez mais sofisticadas e carregadas de artifício. Esse mundo artificial inclui, hoje, o mundo rural.

SANTOS, M. **A Natureza do Espaço.** São Paulo: Hucitec, 1996.

Considerando a transformação mencionada no texto, uma consequência socioespacial que caracteriza o atual mundo rural brasileiro é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 2 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b6', 'ENEM-2010-003', 9, 433, 'enem', 3, 2, 2010, 'multiple_choice', 'Agropecuária, indústria e energia', 'A maioria das pessoas daqui era do campo. Vila Maria é hoje exportadora de trabalhadores. Empresários de Primavera do Leste, Estado de Mato Grosso, procuram o bairro de Vila Maria para conseguir mão de obra. É gente indo distante daqui 300, 400 quilômetros para ir trabalhar, para ganhar sete conto por dia. (Carlito, 43 anos, maranhense, entrevistado em 22/03/98).

Ribeiro, H. S. **O migrante e a cidade: dilemas e conflitos**. Araraquara: Wunderlich, 2001 (adaptado).

O texto retrata um fenômeno vivenciado pela agricultura brasileira nas últimas décadas do século XX, consequência', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 3 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b7', 'ENEM-2010-004', 9, 436, 'enem', 3, 2, 2010, 'multiple_choice', 'Relevo, solos e geologia', 'Os lixões são o pior tipo de disposição final dos resíduos sólidos de uma cidade, representando um grave problema ambiental e de saúde pública. Nesses locais, o lixo é jogado diretamente no solo e a céu aberto, sem nenhuma norma de controle, o que causa, entre outros problemas, a contaminação do solo e das águas pelo chorume (líquido escuro com alta carga poluidora, proveniente da decomposição da matéria orgânica presente no lixo).

RICARDO, B.; CANPANILLI, M. **Almanaque Brasil**  
**Socioambiental 2008.**  
São Paulo, Instituto Socioambiental, 2007.

Considere um município que deposita os resíduos sólidos produzidos por sua população em um lixão. Esse procedimento é considerado um problema de saúde pública porque os lixões', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 4 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b8', 'ENEM-2010-005', 9, 436, 'enem', 3, 2, 2010, 'multiple_choice', 'Relevo, solos e geologia', '![](conteudo/enem/2010/5-0507e0cd.webp)

TEIXEIRA. W. et al. (Orgs). **Decifrando a Terra.** São Paulo: Companhia Editora Nacional, 2009.

O esquema representa um processo de erosão em encosta. Que prática realizada por um agricultor pode resultar em aceleração desse processo?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 5 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000b9', 'ENEM-2010-006', 9, 251, 'enem', 3, 2, 2010, 'multiple_choice', 'Bacias hidrográficas do Brasil', '![](conteudo/enem/2010/6-aa83a948.webp)

TEIXEIRA. W. et al. (Orgs). **Decifrando a Terra.** São Paulo: Companhia Editora Nacional, 2009.

Muitos processos erosivos se concentram nas encostas, principalmente aqueles motivados pela água e pelo vento. No entanto, os reflexos também são sentidos nas áreas de baixada, onde geralmente há ocupação urbana. Um exemplo desses reflexos na vida cotidiana de muitas cidades brasileiras é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 6 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ba', 'ENEM-2010-007', 9, 455, 'enem', 3, 2, 2010, 'multiple_choice', 'Escalas, mapas e projeções', 'Pensando nas correntes e prestes a entrar no braço que deriva da Corrente do Golfo para o norte, lembrei-me de um vidro de café solúvel vazio. Coloquei no vidro uma nota cheia de zeros, uma bola cor rosa-choque. Anotei a posição e data: Latitude 49º49′ N, Longitude 23º49′ W. Tampei e joguei na água. Nunca imaginei que receberia uma carta com a foto de um menino norueguês, segurando a bolinha e a estranha nota.

KLINK, A. **Parati: entre dois pólos.** São Paulo: Companhia das Letras, 1998 (adaptado).

No texto, o autor anota sua coordenada geográfica, que é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 7 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000bb', 'ENEM-2010-008', 9, 436, 'enem', 3, 2, 2010, 'multiple_choice', 'Relevo, solos e geologia', '![](conteudo/enem/2010/8-a4c1596f.webp)

O esquema mostra depósitos em que aparecem fósseis de animais do Período Jurássico. As rochas em que se encontram esses fósseis são', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 8 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000bc', 'ENEM-2010-009', 9, 426, 'enem', 3, 2, 2010, 'multiple_choice', 'Questões ambientais', 'O G-20 é o grupo que reúne os países do G-7, os mais industrializados do mundo (EUA, Japão, Alemanha, França, Reino Unido, Itália e Canadá), a União Europeia e os principais emergentes (Brasil, Rússia, Índia, China, África do Sul, Arábia Saudita, Argentina, Austrália, Coreia do Sul, Indonésia, México e Turquia). Esse grupo de países vem ganhando força nos fóruns internacionais de decisão e consulta.

ALLAN. R. **Crise global**. Dísponivel em: http://conteudoclippingmp.planejamento.gov.br. Acesso em: 31 jul. 2010.

Entre os países emergentes que formam o G-20, estão os chamados BRIC (Brasil, Rússia, Índia e China), termo criado em 2001 para referir-se aos países que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 9 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000bd', 'ENEM-2010-010', 9, 255, 'enem', 3, 2, 2010, 'multiple_choice', 'Urbanização', 'A Inglaterra pedia lucros e recebia lucros. Tudo se transformava em lucro. As cidades tinham sua sujeira lucrativa, suas favelas lucrativas, sua fumaça lucrativa, sua desordem lucrativa, sua ignorância lucrativa, seu desespero lucrativo. As novas fábricas e os novos altos-fornos eram como as Pirâmides, mostrando mais a escravização do homem que seu poder.

DEANE, P. **A Revolução Industrial.** Rio de Janeiro: Zahar, 1979 (adaptado).

Qual relação é estabelecida no texto entre os avanços tecnológicos ocorridos no contexto da Revolução Industrial Inglesa e as características das cidades industriais no início do século XIX?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 10 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000be', 'ENEM-2010-011', 9, 433, 'enem', 3, 2, 2010, 'multiple_choice', 'Agropecuária, indústria e energia', 'A evolução do processo de transformação de matérias-primas em produtos acabados ocorreu em três estágios: artesanato, manufatura e maquinofatura.

Um desses estágios foi o artesanato, em que se', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 11 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000bf', 'ENEM-2010-012', 8, 430, 'enem', 3, 2, 2010, 'multiple_choice', 'República Velha e Era Vargas', 'A serraria construía ramais ferroviários que adentravam as grandes matas, onde grandes locomotivas com guindastes e correntes gigantescas de mais de 100 metros arrastavam, para as composições de trem, as toras que jaziam abatidas por equipes de trabalhadores que anteriormente passavam pelo local. Quando o guindaste arrastava as grandes toras em direção à composição de trem, os ervais nativos que existiam em meio às matas eram destruídos por este deslocamento.

MACHADO P. P. **Lideranças do Contestado**. Campinas: Unicamp, 2004 (adaptado).

No início do século XX, uma série de empreendimentos capitalistas chegou à região do meio-oeste de Santa Catarina – ferrovias, serrarias e projetos de colonização. Os impactos sociais gerados por esse processo estão na origem da chamada Guerra do Contestado. Entre tais impactos, encontrava-se', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 12 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c0', 'ENEM-2010-013', 9, 431, 'enem', 3, 2, 2010, 'multiple_choice', 'Migrações e demografia', 'As secas e o apelo econômico da borracha — produto que no final do século XIX alcançava preços altos nos mercados internacionais — motivaram a movimentação de massas humanas oriundas do Nordeste do Brasil para o Acre. Entretanto, até o início do século XX, essa região pertencia à Bolívia, embora a maioria da sua população fosse brasileira e não obedecesse à autoridade boliviana.

Para reagir à presença de brasileiros, o governo de La Paz negociou o arrendamento da região a uma entidade internacional, o Bolivian Syndicate, iniciando violentas disputas dos dois lados da fronteira. O conflito só terminou em 1903, com a assinatura do Tratado de Petrópolis, pelo qual o Brasil comprou o território por 2 milhões de libras esterlinas.

DISPONÍVEL em: www.mre.gov.br.  Acesso em: 03 nov. 2008 (adaptado)

Compreendendo o contexto em que ocorreram os fatos apresentados, o Acre tornou-se parte do território nacional brasileiro', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 13 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c1', 'ENEM-2010-014', 9, 433, 'enem', 3, 2, 2010, 'multiple_choice', 'Agropecuária, indústria e energia', 'No dia 28 de fevereiro de 1985, era inaugurada a Estrada de Ferro Carajás, pertencente e diretamente operada pela Companhia Vale do Rio Doce (CVRD), na região Norte do país, ligando o interior ao principal porto da região, em São Luís. Por seus, aproximadamente, 900 quilômetros de linha, passam, hoje, 5353 vagões e 100 locomotivas.

Dísponivel em: http://www.transportes.gov.br. Acesso em 27 jul. 2010 (adaptado).

A ferrovia em questão é de extrema importância para a logística do setor primário da economia brasileira, em especial para porções dos estados do Pará e Maranhão. Um argumento que destaca a importância estratégica dessa porção do território é a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 14 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c2', 'ENEM-2010-015', 9, 251, 'enem', 3, 2, 2010, 'multiple_choice', 'Bacias hidrográficas do Brasil', 'A usina hidrelétrica de Belo Monte será construída no rio Xingu, no município de Vitória de Xingu, no Pará. A usina será a terceira maior do mundo e a maior totalmente brasileira, com capacidade de 11,2 mil megawatts. Os índios do Xingu tomam a paisagem com seus cocares, arcos e flechas. Em Altamira, no Pará, agricultores fecharam estradas de uma região que será inundada pelas águas da usina.

BACOCCINA, D. QUEIROZ, G.: BORGES, R. Fim do leilão, começo da confusão.  
**Istoé Dinheiro.** Ano 13, n.o 655, 28 abri 2010 (adaptado).

Os impasses, resistências e desafios associados à construção da Usina Hidrelétrica de Belo Monte estão relacionados', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 15 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c3', 'ENEM-2010-016', 8, 434, 'enem', 3, 2, 2010, 'multiple_choice', 'Império e Regências', 'O Império Inca, que corresponde principalmente aos territórios da Bolívia e do Peru, chegou a englobar enorme contingente populacional. Cuzco, a cidade sagrada, era o centro administrativo, com uma sociedade fortemente estratificada e composta por imperadores, nobres, sacerdotes, funcionários do governo, artesãos, camponeses, escravos e soldados. A religião contava com vários deuses, e a base da economia era a agricultura. principalmente o cultivo da batata e do milho.

A principal característica da sociedade inca era a', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 16 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c4', 'ENEM-2010-017', 8, 429, 'enem', 3, 2, 2010, 'multiple_choice', 'Brasil Colônia', 'Coube aos Xavante e aos Timbira, povos indígenas do Cerrado, um recente e marcante gesto simbólico: a realização de sua tradicional corrida de toras (de buriti) em plena Avenida Paulista (SP), para denunciar o cerco de suas terras e a degradação de seus entornos pelo avanço do agronegócio.

RICARDO, B.; RICARDO, F. **Povos indígenas do Brasil: 2001-**  
**2005.** São Paulo: Instituto Socioambiental, 2006 (adaptado).

A questão indígena contemporânea no Brasil evidencia a relação dos usos socioculturais da terra com os atuais problemas socioambientais, caracterizados pelas tensões entre', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 17 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c5', 'ENEM-2010-018', 9, 251, 'enem', 3, 2, 2010, 'multiple_choice', 'Bacias hidrográficas do Brasil', 'Os vestígios dos povos Tupi-guarani encontram-se desde as Missões e o rio da Prata, ao sul, até o Nordeste, com algumas ocorrências ainda mal conhecidas no sul da Amazônia. A leste, ocupavam toda a faixa litorânea, desde o Rio Grande do Sul até o Maranhão. A oeste, aparece (no rio da Prata) no Paraguai e nas terras baixas da Bolívia. Evitam as terras inundáveis do Pantanal e marcam sua presença discretamente nos cerrados do Brasil central. De fato, ocuparam, de preferência, as regiões de floresta tropical e subtropical.

PROUS. A. O Brasil antes dos brasileiros. Rio de Janeiro: Jorge  
Zahar. Editor, 2005.

Os povos indígenas citados possuíam tradições culturais específicas que os distinguiam de outras sociedades indígenas e dos colonizadores europeus. Entre as tradições tupi-guarani, destacava-se', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 18 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c6', 'ENEM-2010-019', 8, 429, 'enem', 3, 2, 2010, 'multiple_choice', 'Brasil Colônia', 'Os tropeiros foram figuras decisivas na formação de vilarejos e cidades do Brasil colonial. A palavra tropeiro vem de “tropa” que, no passado, se referia ao conjunto de homens que transportava gado e mercadoria. Por volta do século XVIII, muita coisa era levada de um lugar a outro no lombo de mulas. O tropeirismo acabou associado à atividade mineradora, cujo auge foi a exploração de ouro em Minas Gerais e, mais tarde, em Goiás. A extração de pedras preciosas também atraiu grandes contingentes populacionais para as novas áreas e, por isso, era cada vez mais necessário dispor de alimentos e produtos básicos. A alimentação dos tropeiros era constituída por toucinho, feijão preto, farinha, pimenta-do-reino, café, fubá e coité (um molho de vinagre com fruto cáustico espremido). Nos pousos, os tropeiros comiam feijão quase sem molho com pedaços de carne de sol e toucinho, que era servido com farofa e couve picada. O feijão tropeiro é um dos pratos típicos da cozinha mineira e recebe esse nome porque era preparado pelos cozinheiros das tropas que conduziam o gado.

Disponível em http://www.tribunadoplanalto.com.br.  
Acesso em: 27 nov. 2008.

A criação do feijão tropeiro na culinária brasileira está relacionada à', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 19 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c7', 'ENEM-2010-020', 8, 419, 'enem', 3, 2, 2010, 'multiple_choice', 'Processos históricos', 'Quem construiu a Tebas de sete portas?  
Nos livros estão nomes de reis.  
Arrastaram eles os blocos de pedra?  
E a Babilônia várias vezes destruída. Quem a reconstruiu tantas vezes?  
Em que casas da Lima dourada moravam os construtores?  
Para onde foram os pedreiros, na noite em que a Muralha  
da China ficou pronta?  
A grande Roma está cheia de arcos do triunfo.  
Quem os ergueu? Sobre quem triunfaram os césares?

BRECHT, B. Perguntas de um trabalhador que lê.  
Disponível em: http://recantodasletras.uol.com.br. Acesso em:  
28 abr. 2010.

Partindo das reflexões de um trabalhador que lê um livro de História, o autor censura a memória construída sobre determinados monumentos e acontecimentos históricos. A crítica refere-se ao fato de que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 20 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c8', 'ENEM-2010-021', 8, 430, 'enem', 3, 2, 2010, 'multiple_choice', 'República Velha e Era Vargas', 'As ruínas do povoado de Canudos, no sertão norte da Bahia, além de significativas para a identidade cultural, dessa região, são úteis às investigações sobre a Guerra de Canudos e o modo de vida dos antigos revoltosos.

Essas ruínas foram reconhecidas como patrimônio cultural material pelo Iphan (Instituto do Patrimônio Histórico e Artístico Nacional) porque reúnem um conjunto de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 21 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000c9', 'ENEM-2010-022', 8, 419, 'enem', 3, 2, 2010, 'multiple_choice', 'Processos históricos', 'Substitui-se então uma história crítica, profunda, por uma crônica de detalhes onde o patriotismo e a bravura dos nossos soldados encobrem a vilania dos motivos que levaram a Inglaterra a armar brasileiros e argentinos para a destruição da mais gloriosa república que já se viu na América Latina, a do Paraguai.

CHIAVENATTO, J. J. Genocídio americano: A Guerra do  
Paraguai. São Paulo: Brasiliense, 1979 (adaptado).

O imperialismo inglês, “destruindo o Paraguai, mantém o status quo na América Meridional, impedindo a ascensão do seu único Estado economicamente livre”. Essa teoria conspiratória vai contra a realidade dos fatos e não tem provas documentais. Contudo essa teoria tem alguma repercussão.

(DORATIOTO. F. Maldita guerra: nova história da  
Guerra do Paraguai. São Paulo: Cia. das Letras, 2002  
(adaptado).

Uma leitura dessas narrativas divergentes demonstra que ambas estão refletindo sobre', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 22 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ca', 'ENEM-2010-023', 8, 419, 'enem', 3, 2, 2010, 'multiple_choice', 'Processos históricos', 'Negro, filho de escrava e fidalgo português, o baiano Luiz Gama fez da lei e das letras suas armas na luta pela liberdade. Foi vendido ilegalmente como escravo pelo seu pai para cobrir dívidas de jogo. Sabendo ler e escrever, aos 18 anos de idade conseguiu provas de que havia nascido livre. Autodidata, advogado sem diploma, fez do direito o seu ofício e transformou-se, em pouco tempo, em proeminente advogado da causa abolicionista.

AZEVEDO, E. O Orfeu de carapinha. In: Revista de  
História.Ano 1, n.o 3. Rio de Janeiro:  
Biblioteca Nacional, jan. 2004 (adaptado).

A conquista da liberdade pelos afro-brasileiros na segunda metade do séc. XIX foi resultado de importantes lutas sociais condicionadas historicamente. A biografia de Luiz Gama exemplifica a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 23 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000cb', 'ENEM-2010-024', 9, 433, 'enem', 3, 2, 2010, 'multiple_choice', 'Agropecuária, indústria e energia', 'Eu, o Príncipe Regente, faço saber aos que o presente Alvará virem: que desejando promover e adiantar a riqueza nacional, e sendo um dos mananciais dela as manufaturas e a indústria, sou servido abolir e revogar toda e qualquer proibição que haja a este respeito no Estado do Brasil.

Alvará de liberdade para as indústrias (1.o de Abril de 1808).  
In Bonavides, P.; Amaral, R. Textos políticos da História do  
Brasil. Vol. 1. Brasília: Senado Federal, 2002 (adaptado).

O projeto industrializante de D. João, conforme expresso no alvará, não se concretizou. Que características desse período explicam esse fato?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 24 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000cc', 'ENEM-2010-025', 9, 251, 'enem', 3, 2, 2010, 'multiple_choice', 'Bacias hidrográficas do Brasil', 'Em 2008 foram comemorados os 200 anos da mudança da família real portuguesa para o Brasil, onde foi instalada a sede do reino. Uma sequência de eventos importantes ocorreu no período 1808-1821, durante os 13 anos em que D. João VI e a família real portuguesa permaneceram no Brasil.

Entre esses eventos, destacam-se os seguintes:

• Bahia – 1808: Parada do navio que trazia a família real  
portuguesa para o Brasil, sob a proteção da marinha  
britânica, fugindo de um possível ataque de Napoleão.  
• Rio de Janeiro – 1808: desembarque da família real  
portuguesa na cidade onde residiriam durante sua  
permanência no Brasil.  
• Salvador – 1810: D. João VI assina a carta régia de  
abertura dos portos ao comércio de todas as nações  
amigas, ato antecipadamente negociado com a Inglaterra  
em troca da escolta dada à esquadra portuguesa.  
• Rio de Janeiro – 1816: D. João VI torna-se rei do Brasil  
e de Portugal, devido à morte de sua mãe, D. Maria I.  
• Pernambuco – 1817: As tropas de D. João VI sufocam  
a revolução republicana.

GOMES. L. 1808: como uma rainha louca, um príncipe  
medroso e uma corte corrupta enganaram Napoleão e  
mudaram a história de Portugal e do Brasil. São Paulo:  
Editora Planeta, 2007 (adaptado)

Uma das consequências desses eventos foi', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 25 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000cd', 'ENEM-2010-026', 8, 419, 'enem', 3, 2, 2010, 'multiple_choice', 'Processos históricos', 'I — Para consolidar-se como governo, a República precisava eliminar as arestas, conciliar-se com o passado monarquista, incorporar distintas vertentes do republicanismo. Tiradentes não deveria ser visto como herói republicano radical, mas sim como herói cívico-religioso, como mártir, integrador, portador da imagem do povo inteiro.

CARVALHO, J. M. C. A formação das almas: O imaginário da República no Brasil.  
São Paulo: Companhia das Letras, 1990

I — Ei-lo, o gigante da praça, / O Cristo da multidão!

É Tiradentes quem passa / Deixem passar o Titão.

ALVES, C. Gonzaga ou a revolução de Minas. In: CARVALHO, J. M. C. A formação das almas.  
O imaginário da República no Brasil. São Paulo: Companhia das Letras, 1990.

A 1ª República brasileira, nos seus primórdios, precisava constituir uma figura heroica capaz de congregar diferenças e sustentar simbolicamente o novo regime. Optando pela figura de Tiradentes, deixou de lado figuras como Frei Caneca ou Bento Gonçalves. A transformação do inconfidente em herói nacional evidencia que o esforço de construção de um simbolismo por parte da República estava relacionado', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 26 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ce', 'ENEM-2010-027', 9, 251, 'enem', 3, 2, 2010, 'multiple_choice', 'Bacias hidrográficas do Brasil', 'O artigo 402 do Código penal Brasileiro de 1890 dizia: Fazer nas ruas e praças públicas exercícios de agilidade e destreza corporal, conhecidos pela denominação de capoeiragem: andar em correrias, com armas ou instrumentos capazes de produzir uma lesão corporal, provocando tumulto ou desordens.

Pena: Prisão de dois a seis meses.

SOARES, C. E. L. A Negregada instituição: os capoeiras  
no Rio de Janeiro: 1850-1890. Rio de Janeiro: Secretaria  
Municipal de Cultura, 1994 (adaptado).

O artigo do primeiro Código Penal Republicano naturaliza medidas socialmente excludentes. Nesse contexto, tal regulamento expressava', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 27 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000cf', 'ENEM-2010-028', 8, 418, 'enem', 3, 2, 2010, 'multiple_choice', 'Idade Moderna', 'Em nosso país queremos substituir o egoísmo pela moral, a honra pela probidade, os usos pelos princípios, as conveniências pelos deveres, a tirania da moda pelo império da razão, o desprezo à desgraça pelo desprezo ao vício, a insolência pelo orgulho, a vaidade pela grandeza de alma, o amor ao dinheiro pelo amor à glória, a boa companhia pelas boas pessoas, a intriga pelo mérito, o espirituoso pelo gênio, o brilho pela verdade, o tédio da volúpia pelo encanto da felicidade, a mesquinharia dos grandes pela grandeza do homem.

HUNT, L. Revolução Francesa e Vida Privada. In: PERROT,  
M. (Org.) História da Vida Privada: da Revolução Francesa à  
Primeira Guerra. Vol. 4. São Paulo: Companhia das Letras,  
1991 (adaptado).

O discurso de Robespierre, de 5 de fevereiro de 1794, do qual o trecho transcrito é parte, relaciona-se a qual dos grupos político-sociais envolvidos na Revolução Francesa?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 28 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d0', 'ENEM-2010-029', 8, 419, 'enem', 3, 2, 2010, 'multiple_choice', 'Processos históricos', 'A política foi, inicialmente, a arte de impedir as pessoas de se ocuparem do que lhes diz respeito. Posteriormente, passou a ser a arte de compelir as pessoas a decidirem sobre aquilo de que nada entendem.

VALÉRY, P. Cadernos. Apud BENEVIDES, M. V. M.  
A cidadania ativa. São Paulo: Ática, 1996.

Nessa definição, o autor entende que a história da política está dividida em dois momentos principais: um primeiro, marcado pelo autoritarismo excludente, e um segundo, caracterizado por uma democracia incompleta. Considerando o texto, qual é o elemento comum a esses dois momentos da história política?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 29 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d1', 'ENEM-2010-030', 13, 457, 'enem', 3, 2, 2010, 'multiple_choice', 'Contratualismo e poder', 'O príncipe, portanto, não deve se incomodar com a reputação de cruel, se seu propósito é manter o povo unido e leal. De fato, com uns poucos exemplos duros poderá ser mais clemente do que outros que, por muita piedade, permitem os distúrbios que levem ao assassínio e ao roubo.

MAQUIAVEL, N. O Príncipe, São Paulo: Martin Claret, 2009.

No século XVI, Maquiavel escreveu O Príncipe, reflexão sobre a Monarquia e a função do governante. A manutenção da ordem social, segundo esse autor, baseava-se na', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 30 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d2', 'ENEM-2010-031', 8, 434, 'enem', 3, 2, 2010, 'multiple_choice', 'Império e Regências', 'Após a abdicação de D. Pedro I, o Brasil atravessou um período marcado por inúmeras crises: as diversas forças políticas lutavam pelo poder e as reivindicações populares eram por melhores condições de vida e pelo direito de participação na vida política do país. Os conflitos representavam também o protesto contra a centralização do governo. Nesse período, ocorreu também a expansão da cultura cafeeira e o surgimento do poderoso grupo dos “barões do café”, para o qual era fundamental a manutenção da escravidão e do tráfico negreiro.

O contexto do Período Regencial foi marcado', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 31 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d3', 'ENEM-2010-032', 8, 430, 'enem', 3, 2, 2010, 'multiple_choice', 'República Velha e Era Vargas', 'De março de 1931 a fevereiro de 1940, foram decretadas mais de 150 leis novas de proteção social e de regulamentação do trabalho em todos os seus setores. Todas elas têm sido simplesmente uma dádiva do governo. Desde aí, o trabalhador brasileiro encontra nos quadros gerais do regime o seu verdadeiro lugar.

DANTAS, M. A força nacionalizadora do Estado Novo. Rio  
de Janeiro: DIP, 1942. Apud BERCITO, S. R. Nos Tempos  
de Getúlio: da revolução de 30 ao fim do Estado Novo. São  
Paulo: Atual, 1990.

A adoção de novas políticas públicas e as mudanças jurídico-institucionais ocorridas no Brasil, com a ascensão de Getúlio Vargas ao poder, evidenciam o papel histórico de certas lideranças e a importância das lutas sociais na conquista da cidadania. Desse processo resultou a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 32 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d4', 'ENEM-2010-033', 9, 433, 'enem', 3, 2, 2010, 'multiple_choice', 'Agropecuária, indústria e energia', 'Não é difícil entender o que ocorreu no Brasil nos anos imediatamente anteriores ao golpe militar de 1964. A diminuição da oferta de empregos e a desvalorização dos salários, provocadas pela inflação, levaram a uma intensa mobilização política popular, marcada por sucessivas ondas grevistas de várias categorias profissionais, o que aprofundou as tensões sociais. Dessa vez, as classes trabalhadoras se recusaram a pagar o pato pelas sobras” do modelo econômico juscelinista.

MENDONÇA, S. R. A industrialização Brasileira. São  
Paulo: Moderna, 2002 (adaptado)

Segundo o texto, os conflitos sociais ocorridos no início dos anos 1960 decorreram principalmente', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 33 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d5', 'ENEM-2010-034', 12, 425, 'enem', 3, 2, 2010, 'multiple_choice', 'Cultura, trabalho e cidadania', 'A lei não nasce da natureza, junto das fontes frequentadas pelos primeiros pastores: a lei nasce das batalhas reais, das vitórias, dos massacres, das conquistas que têm sua data e seus heróis de horror: a lei nasce das cidades incendiadas, das terras devastadas; ela nasce com os famosos inocentes que agonizam no dia que está amanhecendo.

FOUCAULT. M. Aula de 14 de janeiro de 1976. In. Em defesa da  
sociedade. São Paulo: Martins Fontes. 1999

O filósofo Michel Foucault (séc. XX) inova ao pensar a política e a lei em relação ao poder e à organização social. Com base na reflexão de Foucault, a finalidade das leis na organização das sociedades modernas é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 34 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d6', 'ENEM-2010-035', 9, 251, 'enem', 3, 2, 2010, 'multiple_choice', 'Bacias hidrográficas do Brasil', '**Opinião**

Podem me prender  
Podem me bater  
Podem até deixar-me sem comer  
Que eu não mudo de opinião.  
Aqui do morro eu não saio não  
Aqui do morro eu não saio não.

Se não tem água  
Eu furo um poço

Se não tem carne  
Eu compro um osso e ponho na sopa  
E deixa andar, deixa andar…

Falem de mim  
Quem quiser falar  
Aqui eu não pago aluguel  
Se eu morrer amanhã seu doutor,  
Estou pertinho do céu

Zé Ketti. Opinião. Disponível em: http:/www.mpbnet.com.br.  
Acesso em: 28 abr. 2010.

Essa música fez parte de um importante espetáculo teatral que estreou no ano de 1964, no Rio de Janeiro. O papel exercido pela Música Popular Brasileira (MPB) nesse contexto, evidenciado pela letra de música citada, foi o de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 35 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d7', 'ENEM-2010-036', 8, 419, 'enem', 3, 2, 2010, 'multiple_choice', 'Processos históricos', 'A caixa de pandora tecnológica penetra nos lares e libera suas cabeças falantes, astros, novelas, noticiários e as fabulosas, irresistíveis garotas-propaganda, versões modernizadas do tradicional homem-sanduíche.

SEVCENKO, N. (Org). História da Vida Privada no Brasil 3.  
República: da Belle Époque à Era do Rádio.  
São Paulo: Cia das Letras, 1998.

A TV, a partir da década de 1950, entrou nos lares brasileiros provocando mudanças consideráveis nos hábitos da população. Certos episódios da história brasileira revelaram que a TV, especialmente como espaço de ação da imprensa, tornou-se também veículo de utilidade pública, a favor da democracia, na medida em que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 36 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d8', 'ENEM-2010-037', 8, 419, 'enem', 3, 2, 2010, 'multiple_choice', 'Processos históricos', 'Os meios de comunicação funcionam como um elo entre os diferentes segmentos de uma sociedade. Nas últimas décadas, acompanhamos a inserção de um novo meio de comunicação que supera em muito outros já existentes, visto que pode contribuir para a democratização da vida social e política da sociedade à medida que possibilita a instituição de mecanismos eletrônicos para a efetiva participação política e disseminação de informações.

Constitui o exemplo mais expressivo desse novo conjunto de redes informacionais a', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 37 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000d9', 'ENEM-2010-038', 9, 255, 'enem', 3, 2, 2010, 'multiple_choice', 'Urbanização', 'A poluição e outras ofensas ambientais ainda não tinham esse nome, mas já eram largamente notadas no século XIX, nas grandes cidades inglesas e continentais. E a própria chegada ao campo das estradas de ferro suscitou protestos. A reação antimaquinista, protagonizada pelos diversos luddismos, antecipa a batalha atual dos ambientalistas. Esse era, então, o combate social contra os miasmas urbanos.

SANTOS M. A natureza do espaço: técnica e tempo, razão e emoção. São Paulo: EDUSP, 2002 (adaptado).

O crescente desenvolvimento técnico-produtivo impõe modificações na paisagem e nos objetos culturais vivenciados pelas sociedades. De acordo com o texto, pode-se dizer que tais movimentos sociais emergiram e se expressaram por meio', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 38 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000da', 'ENEM-2010-039', 13, 428, 'enem', 3, 2, 2010, 'multiple_choice', 'Ética, moral e conhecimento', 'A ética precisa ser compreendida como um empreendimento coletivo a ser constantemente retomado e rediscutido, porque é produto da relação interpessoal e social. A ética supõe ainda que cada grupo social se organize sentindo-se responsável por todos e que crie condições para o exercício de um pensar e agir autônomos. A relação entre ética e política é também uma questão de educação e luta pela soberania dos povos. É necessária uma ética renovada, que se construa a partir da natureza dos valores sociais para organizar também uma nova prática política.

CORDI et al. Para filosofar. São Paulo: Scipione, 2007 (adaptado).

O Século XX teve de repensar a ética para enfrentar novos problemas oriundos de diferentes crises sociais, conflitos ideológicos e contradições da realidade. Sob esse enfoque e a partir do texto, a ética pode ser compreendida como', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 39 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000db', 'ENEM-2010-040', 9, 433, 'enem', 3, 2, 2010, 'multiple_choice', 'Agropecuária, indústria e energia', 'Homens da Inglaterra, por que arar para os senhores que  
vos mantêm na miséria?

Por que tecer com esforços e cuidado as ricas roupas que  
vossos tiranos vestem?

Por que alimentar, vestir e poupar do berço até o túmulo  
esses parasitas ingratos que exploram vosso suor — ah,  
que bebem vosso sangue?

SHELLEY. Os homens da Inglaterra. Apud HUBERMAN, L.  
História da Riqueza do Homem. Rio de Janeiro: Zahar, 1982.

A análise do trecho permite identificar que o poeta romântico Shelley (1792-1822) registrou uma contradição nas condições socioeconômicas da nascente classe trabalhadora inglesa durante a Revolução Industrial. Tal contradição está identificada', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 40 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000dc', 'ENEM-2010-041', 8, 419, 'enem', 3, 2, 2010, 'multiple_choice', 'Processos históricos', '“Pecado nefando” era expressão correntemente utilizada pelos inquisidores para a sodomia. Nefandus: o que não pode ser dito. A Assembleia de clérigos reunida em Salvador, em 1707, considerou a sodomia “tão péssimo e horrendo crime”, tao contrário à lei da natureza, que “era indigno de ser nomeado” e, por isso mesmo, nefando.

NOVAIS, F.; MELLO E SOUZA L. História da vida privada no  
Brasil. V. 1. São Paulo: Companhia das Letras. 1997 (adaptado).

TEXTO II

O número de homossexuais assassinados no Brasil bateu o recorde histórico em 2009. De acordo com o Relatório Anual de Assassinato de Homossexuais (LGBT – Lés – bicas, Gays, Bissexuais e Travestis), nesse ano foram registrados 195 mortos por motivação homofóbica no País.

Disponível em: www.alemdanoticia.com.br/utimas\_noticias.php?codnoticia=3871. Acesso em: 29 abr. 2010 (adaptado).

A homofobia é a rejeição e menosprezo à orientação sexual do outro e, muitas vezes, expressa-se sob a forma de comportamentos violentos. Os textos indicam que as condenações públicas, perseguições e assassinatos de homossexuais no país estão associadas', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 41 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000dd', 'ENEM-2010-042', 8, 458, 'enem', 3, 2, 2010, 'multiple_choice', 'Ditadura e redemocratização', 'As cortes de apelação rejeitaram mais de 10 mil habeas corpus nos casos das pessoas desaparecidas. Nos tribunais militares, todas as causas foram concluídas com suspensões temporárias ou definitivas, e os desaparecimentos políticos tiveram apenas trâmite formal na Justiça. Assim, o Poder Judiciário contribuiu para que os agentes estatais ficassem impunes.

Disponível em: http://www.cartamaior.com.br.  
Acesso em: 20 jul. 2010 (adaptado).

Segundo o texto, durante a ditadura chilena na década de 1970, a relação entre os poderes Executivo e Judiciário caracterizava-se pela', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 42 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000de', 'ENEM-2010-043', 13, 428, 'enem', 3, 2, 2010, 'multiple_choice', 'Ética, moral e conhecimento', 'Um banco inglês decidiu cobrar de seus clientes cinco libras toda vez que recorressem aos funcionários de suas agências. E o motivo disso é que, na verdade, não querem clientes em suas agências; o que querem é reduzir o número de agências, fazendo com que os clientes usem as máquinas automáticas em todo o tipo de transações. Em suma, eles querem se livrar de seus funcionários.

HOBSBAWM, E. O novo século. São Paulo: Companhia das Letras,  
2000 (adaptado).

O exemplo mencionado permite identificar um aspecto da adoção de novas tecnologias na economia capitalista contemporânea. Um argumento utilizado pelas empresas e uma consequência social de tal aspecto estão em', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 43 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000df', 'ENEM-2010-044', 13, 428, 'enem', 3, 2, 2010, 'multiple_choice', 'Ética, moral e conhecimento', 'Na ética contemporânea, o sujeito não é mais um sujeito substancial, soberano e absolutamente livre, nem um sujeito empírico puramente natural. Ele é simultaneamente os dois, na medida em que é um sujeito histórico-social. Assim, a ética adquire um dimensionamento político, uma vez que a ação do sujeito não pode mais ser vista e avaliada fora da relação social coletiva. Desse modo, a ética se entrelaça, necessariamente, com a política, entendida esta como a área de avaliação dos valores que atravessam as relações sociais e que interliga os indivíduos entre si.

SEVERINO. A. J. Filosofia. São Paulo: Cortez, 1992 (adaptado)

O texto, ao evocar a dimensão histórica do processo de formação da ética na sociedade contemporânea, ressalta', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 44 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e0', 'ENEM-2010-045', 13, 428, 'enem', 3, 2, 2010, 'multiple_choice', 'Ética, moral e conhecimento', '![](conteudo/enem/2010/45-a703a5c4.webp)

Democracia: “regime político no qual a soberania é  
exercida pelo povo, pertence ao conjunto dos cidadãos.”

JAPIASSÚ, H.; MARCONDES, D. Dicionário Básico de Filosofia. Rio de Janeiro: Zahar, 2006.

Uma suposta “vacina” contra o despotismo, em um contexto democrático, tem por objetivo', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 45 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e1', 'ENEM-2010-046', 5, 261, 'enem', 3, 2, 2010, 'multiple_choice', 'Doenças e prevenção', 'A vacina, o soro e os antibióticos submetem os organismos a processos biológicos diferentes. Pessoas que viajam para regiões em que ocorrem altas incidências de febre amarela, de picadas de cobras peçonhentas e de leptospirose e querem evitar ou tratar problemas de saúde relacionados a essas ocorrências devem seguir determinadas orientações.

Ao procurar um posto de saúde, um viajante deveria ser orientado por um médico a tomar preventivamente ou como medida de tratamento', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 46 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e2', 'ENEM-2010-047', 6, 415, 'enem', 3, 2, 2010, 'multiple_choice', 'Ondas, som e luz', 'As ondas eletromagnéticas, como a luz visível e as ondas de rádio, viajam em linha reta em um meio homogêneo. Então, as ondas de rádio emitidas na região litorânea do Brasil não alcançariam a região amazônica do Brasil por causa da curvatura da Terra. Entretanto sabemos que é possível transmitir ondas de rádio entre essas localidades devido à ionosfera.

Com ajuda da ionosfera, a transmissão de ondas planas entre o litoral do Brasil e a região amazônica é possível por meio da', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 47 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e3', 'ENEM-2010-048', 6, 407, 'enem', 3, 2, 2010, 'multiple_choice', 'Circuitos e energia elétrica', '![](conteudo/enem/2010/48-b750cefc.webp)

Um farol usa uma lâmpada de gás halogênio de 55 W de potência que opera com 36 V. Os dois faróis são ligados separadamente, com um fusível para cada um, mas, após um mau funcionamento, o motorista passou a conectá-los em paralelo, usando apenas um fusível. Dessa forma, admitindo-se que a fiação suporte a carga dos dois faróis, o menor valor de fusível adequado para proteção desse novo circuito é o', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 48 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e4', 'ENEM-2010-049', 5, 261, 'enem', 3, 2, 2010, 'multiple_choice', 'Doenças e prevenção', 'A cárie dental resulta da atividade de bactérias que degradam os açúcares e os transformam em ácidos que corroem a porção mineralizada dos dentes. O flúor, juntamente com o cálcio e um açúcar chamado xilitol, agem inibindo esse processo. Quando não se escovam os dentes corretamente e neles acumulam-se restos de alimentos, as bactérias que vivem na boca aderem aos dentes, formando a placa bacteriana ou biofilme. Na placa, elas transformam o açúcar dos restos de alimentos em ácidos, que corroem o esmalte do dente formando uma cavidade, que é a cárie. Vale lembrar que a placa bacteriana se forma mesmo na ausência de ingestão de carboidratos fermentáveis, pois as bactérias possuem polissacarídeos intracelulares de reserva.

Disponível em: http://www.diariodasaude.com.br. Acesso em: 11 ago. 2010 (adaptado).

**cárie 1.** destruição de um osso por corrosão progressiva.  
\* cárie dentária: efeito da destruição da estrutura dentária por bactérias.

HOUAISS, Antônio. Dicionário eletrônico. Versão 1.0. Editora  
Objetiva, 2001 (adaptado).

A partir da leitura do texto, que discute as causas do aparecimento de cáries, e da sua relação com as informações do dicionário, conclui-se que a cárie dental resulta, principalmente, de', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 49 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e5', 'ENEM-2010-050', 6, 400, 'enem', 3, 2, 2010, 'multiple_choice', 'Calor e termodinâmica', 'Em nosso cotidiano, utilizamos as palavras “calor” e “temperatura” de forma diferente de como elas são usadas no meio científico. Na linguagem corrente, calor é identificado como “algo quente” e temperatura mede a “quantidade de calor de um corpo”. Esses significados, no entanto, não conseguem explicar diversas situações que podem ser verificadas na prática.

Do ponto de vista científico, que situação prática mostra a limitação dos conceitos corriqueiros de calor e temperatura?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 50 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e6', 'ENEM-2010-051', 5, 402, 'enem', 3, 2, 2010, 'multiple_choice', 'Plantas e fotossíntese', 'O texto “O vôo das Folhas” traz uma visão dos índios  
Ticunas para um fenômeno usualmente observado na  
natureza:

**O vôo das Folhas**  
Com o vento  
as folhas se movimentam.  
E quando caem no chão  
ficam paradas em silêncio.  
Assim se forma o ngaura. O ngaura cobre o chão da  
floresta, enriquece a terra e alimenta as árvores.\]  
As folhas velhas morrem para ajudar o crescimento das  
folhas novas.\]  
Dentro do ngaura vivem aranhas, formigas, escorpiões,  
centopeias, minhocas, cogumelos e vários tipos de outros  
seres muito pequenos.\]  
As folhas também caem nos lagos, nos igarapés e igapós.

A natureza segundo os Ticunas/Livro das Árvores.  
Organização Geral dos Professores Bilíngues Ticunas, 2000

Na visão dos índios Ticunas, a descrição sobre o ngaura permite classificá-lo como um produto diretamente relacionado ao ciclo', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 51 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e7', 'ENEM-2010-052', 6, 412, 'enem', 3, 2, 2010, 'multiple_choice', 'Forças e leis de Newton', 'Com o objetivo de se testar a eficiência de fornos de micro-ondas, planejou-se o aquecimento em 10°C de amostras de diferentes substâncias, cada uma com determinada massa, em cinco fornos de marcas distintas. Nesse teste, cada forno operou à potência máxima.

O forno mais eficiente foi aquele que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 52 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e8', 'ENEM-2010-053', 5, 459, 'enem', 3, 2, 2010, 'multiple_choice', 'Célula e metabolismo', 'O fósforo, geralmente representado pelo íon de fosfato (PO4−3), é um ingrediente insubstituível da vida, já que é parte constituinte das membranas celulares e das moléculas do DNA e do trifosfato de adenosina (ATP), principal forma de armazenamento de energia das células. O fósforo utilizado nos fertilizantes agrícolas é extraído de minas, cujas reservas estão cada vez mais escassas. Certas práticas agrícolas aceleram a erosão do solo, provocando o transporte de fósforo para sistemas aquáticos, que fica imobilizado nas rochas. Ainda, a colheita das lavouras e o transporte dos restos alimentares para os lixões diminuem a disponibilidade dos íons no solo. Tais fatores têm ameaçado a sustentabilidade desse íon.

Uma medida que amenizaria esse problema seria:', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 53 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000e9', 'ENEM-2010-054', 6, 409, 'enem', 3, 2, 2010, 'multiple_choice', 'Movimento', '![](conteudo/enem/2010/54-c147e274.webp)

A aparência de Júpiter é tipicamente marcada por duas faixas escuras em sua atmosfera – uma no hemisfério norte e outra no hemisfério sul. Como o gás está constantemente em movimento, o desaparecimento da faixa no planeta relaciona-se ao movimento das diversas camadas de nuvens em sua atmosfera. A luz do Sol, refletida nessas nuvens, gera a imagem que é captada pelos telescópios, no espaço ou na Terra.

O desaparecimento da faixa sul pode ter sido determinado por uma alteração', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 54 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ea', 'ENEM-2010-055', 7, 460, 'enem', 3, 2, 2010, 'multiple_choice', 'Substâncias, misturas e separação', 'Em visita a uma usina sucroalcooleira, um grupo de alunos pôde observar a série de processos de beneficiamento da cana-de-açúcar, entre os quais se destacam:  
1\. A cana chega cortada da lavoura por meio de caminhões e é despejada em mesas alimentadoras que a conduzem para as moendas. Antes de ser esmagada  
para a retirada do caldo açucarado, toda a cana é transportada por esteiras e passada por um eletroímã para a retirada de materiais metálicos.  
2\. Após se esmagar a cana, o bagaço segue para as caldeiras, que geram vapor e energia para toda a usina.  
3\. O caldo primário, resultante do esmagamento, é passado por filtros e sofre tratamento para transformar-se em açúcar refinado e etanol.

Com base nos destaques da observação dos alunos, quais operações físicas de separação de materiais foram realizadas nas etapas de beneficiamento da cana-de-açúcar?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 55 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000eb', 'ENEM-2010-056', 6, 415, 'enem', 3, 2, 2010, 'multiple_choice', 'Ondas, som e luz', '![](conteudo/enem/2010/56-85dc7933.webp)

A fonte de energia representada na figura, considerada uma das mais limpas e sustentáveis do mundo, é extraída do calor gerado', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 56 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ec', 'ENEM-2010-057', 5, 261, 'enem', 3, 2, 2010, 'multiple_choice', 'Doenças e prevenção', 'O despejo de dejetos de esgotos domésticos e industriais vem causando sérios problemas aos rios brasileiros. Esses poluentes são ricos em substâncias que contribuem para a eutrofização de ecossistemas, que é um enriquecimento da água por nutrientes, o que provoca um grande crescimento bacteriano e, por fim, pode promover escassez de oxigênio.

Uma maneira de evitar a diminuição da concentração de oxigênio no ambiente é:', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 57 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ed', 'ENEM-2010-058', 6, 461, 'enem', 3, 2, 2010, 'multiple_choice', 'Pressão e empuxo', 'Sob pressão normal (ao nível do mar), a água entra em ebulição à temperatura de 100 °C. Tendo por base essa afirmação, um garoto residente em uma cidade litorânea fez a seguinte experiência:

*   – Colocou uma caneca metálica contendo água no fogareiro do fogão de sua casa.
*   – Quando a água começou a ferver, encostou, cuidadosamente, a extremidade mais estreita de uma seringa de injeção, desprovida de agulha, na superfície do líquido e, erguendo o êmbolo da seringa, aspirou certa quantidade de água para seu interior, tampando-a em seguida.
*   – Verificando após alguns instantes que a água da seringa havia parado de ferver, ele ergueu o êmbolo da seringa, constatando, intrigado, que a água voltou a ferver após um pequeno deslocamento do êmbolo.

Considerando o procedimento anterior, a água volta a ferver porque esse deslocamento', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 58 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ee', 'ENEM-2010-059', 6, 400, 'enem', 3, 2, 2010, 'multiple_choice', 'Calor e termodinâmica', 'As cidades industrializadas produzem grandes proporções de gases como o CO2. o principal gás causador de efeito estufa. Isso ocorre por causa da quantidade de combustíveis fósseis queimados, principalmente no transporte, mas também em caldeiras industriais. Além disso, nessas cidades concentram-se as maiores áreas com solos asfaltados e concretados, o que aumenta a retenção de calor, formando o que se conhece por “ilhas de calor”. Tal fenômeno ocorre porque esses materiais absorvem o calor e o devolvem para o ar sob a forma de radiação térmica.

Em áreas urbanas, devido à atuação conjunta do efeito estufa e das “ilhas de calor”, espera-se que o consumo de energia elétrica', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 59 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ef', 'ENEM-2010-060', 5, 402, 'enem', 3, 2, 2010, 'multiple_choice', 'Plantas e fotossíntese', 'A lavoura arrozeira na planície costeira da região sul do Brasil comumente sofre perdas elevadas devido a salinização da água de irrigação, que ocasiona prejuízos diretos, como a redução de produção da lavoura. Solos com processo de salinização avançado não são indicados, por exemplo, para o cultivo de arroz. As plantas retiram a água do solo quando as forças de embebição dos tecidos das raízes são superiores às forças com que a água é retida no solo.

WINKEL, H.L.; TSCHIEDEL, M. Cultura do arroz: salinização de solos em cultivo do arroz.  
Disponível em: http://agropage.tripod.com/saliniza.hml. Acesso em: 25 jun. 2010 (adaptado).

A presença de sais na solução do solo faz com que seja dificultada a absorção de água pelas plantas, o que provoca o fenômeno conhecido por seca fisiológica, caracterizado pelo(a)', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 60 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f0', 'ENEM-2010-061', 5, 402, 'enem', 3, 2, 2010, 'multiple_choice', 'Plantas e fotossíntese', 'No ano de 2000, um vazamento em um duto de óleo na baía de Guanabara (RJ) causou um dos maiores acidentes ambientais do Brasil. Além de afetar a fauna e a flora, o acidente abalou o equilíbrio da cadeia alimentar de toda a baía. O petróleo forma uma película na superfície da água, o que prejudica as trocas gasosas da atmosfera com a água e desfavorece a realização de fotossíntese pelas algas, que estão na base da cadeia alimentar hídrica. Além disso, o derramamento de óleo contribuiu para o envenenamento das árvores e, consequentemente, para a intoxicação da fauna e flora aquáticas, bem como conduziu à morte diversas espécies de animais, entre outras formas de vida, afetando também a atividade pesqueira.

LAUBIER, L. Diversidade da Maré Negra. In: Scientific American Brasil. 4(39), ago. 2005 (adaptado).

A situação exposta no texto e suas implicações', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 61 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f1', 'ENEM-2010-062', 5, 459, 'enem', 3, 2, 2010, 'multiple_choice', 'Célula e metabolismo', 'Para explicar a absorção de nutrientes, bem como a função das microvilosidades das membranas das células que revestem as paredes internas do intestino delgado, um estudante realizou o seguinte experimento:

Colocou 200 ml de água em dois recipientes. No primeiro recipiente, mergulhou, por 5 segundos, um pedaço de papel liso, como na FIGURA 1; no segundo recipiente, fez o mesmo com um pedaço de papel com dobras simulando as microvilosidades, conforme FIGURA 2. Os dados obtidos foram: a quantidade de água absorvida pelo papel liso foi de 8 ml, enquanto pelo papel dobrado foi de 12 ml.

![](conteudo/enem/2010/62-f2824040.webp)

Com base nos dados obtidos, infere-se que a função das microvilosidades intestinais com relação à absorção de nutrientes pelas células das paredes internas do intestino é a de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 62 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f2', 'ENEM-2010-063', 7, 414, 'enem', 3, 2, 2010, 'multiple_choice', 'Química e ambiente', '![](conteudo/enem/2010/63-4f40bc17.webp)

Com base no texto e na figura, a produção de energia elétrica por meio da célula a combustível hidrogênio/oxigênio diferencia-se dos processos convencionais porque', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 63 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f3', 'ENEM-2010-064', 5, 463, 'enem', 3, 2, 2010, 'multiple_choice', 'Evolução e seleção natural', 'Alguns anfíbios e répteis são adaptados à vida subterrânea. Nessa situação, apresentam algumas características corporais como, por exemplo, ausência de patas, corpo anelado que facilita o deslocamento no subsolo e, em alguns casos, ausência de olhos.

Suponha que um biólogo tentasse explicar a origem das adaptações mencionadas no texto utilizando conceitos da teoria evolutiva de Lamark. Ao adotar esse ponto de vista, ele diria que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 64 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f4', 'ENEM-2010-065', 7, 26, 'enem', 3, 2, 2010, 'multiple_choice', 'pH e acidez', 'As misturas efervescentes, em pó ou comprimidos, são comuns para a administração de vitamina C ou de medicamentos para azia. Essa forma farmacêutica sólida foi desenvolvida para facilitar o transporte, aumentar a estabilidade de substâncias e, quando em solução, acelerar a absorção do fármaco pelo organismo.  
As matérias primas que atuam na efervescência são, em geral, o ácido tartárico ou ácido cítrico que reagem como um sal de caráter básico, como o bicarbonato de sódio (NaHCO3), quando em contato com a água. A partir do contato da mistura efervescente com a água, ocorre uma série de reações químicas simultâneas: liberação de íons, formação de ácido e liberação de gás carbônico – gerando a efervescência.  
As equações a seguir representam as etapas da reação da mistura efervescente na água, em que foram omitidos os estados de agregação dos reagentes, e H3A representa o ácido cítrico.  
I – NaHCO3 → NA+ + HCO3  
II – H2CO3 ↔H2O + CO2  
III – HCO3 + H+ ↔ H2CO3  
IV – H3A ↔ 3H+ + A−

A ionização, a dissociação iônica, a formação do ácido e a liberação do gás ocorrem, respectivamente, nas seguintes etapas:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 65 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f5', 'ENEM-2010-066', 5, 411, 'enem', 3, 2, 2010, 'multiple_choice', 'Animais', 'Um ambiente capaz de asfixiar todos os animais conhecidos do planeta foi colonizado por pelo menos três espécies diferentes de invertebrados marinhos. Descobertos a mais de 3.000 m de profundidade no Mediterrâneo, eles são os primeiros membros do reino animal a prosperar mesmo diante da ausência total de oxigênio. Até agora, achava-se que só bactérias pudessem ter esse estilo de vida. Não admira que os bichos pertençam a um grupo pouco conhecido, o dos loriciferos, que mal chegam a 1,0 mm. Apesar do tamanho, possuem cabeça, boca, sistema digestivo e carapaça. A adaptação dos bichos à vida no sufoco é tão profunda que suas células dispensaram as chamadas mitocôndrias.

LOPES, R. J. Italianos descobrem animal que vive em água sem oxigênio. Disponível em: http://www1.folha.uol.com.br. Acesso em: 10 abr. 2010 (adaptado).

Que substâncias poderiam ter a mesma função do O<sub>2</sub> na respiração celular realizada pelos loricíferos?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 66 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f6', 'ENEM-2010-067', 6, 405, 'enem', 3, 2, 2010, 'multiple_choice', 'Trabalho, energia e potência', 'O abastecimento de nossas necessidades energéticas futuras dependerá certamente do desenvolvimento de tecnologias para aproveitar a energia solar com maior eficiência. A energia solar é a maior fonte de energia mundial. Num dia ensolarado, por exemplo, aproximadamente 1 kJ de energia solar atinge cada metro quadrado de superfície terrestre por segundo. No entanto, o aproveitamento dessa energia é difícil porque ela é diluída (distribuída por uma área muito extensa) e oscila com o horário e as condições climáticas. O uso efetivo da energia solar depende de formas de estocar a energia coletada para o uso posterior.

BROWN, T. **Química e Ciência Central**. São Paulo: Pearson Prentice Hall, 2005.

Atualmente, uma das formas de se utilizar a energia solar tem sido armazená-la por meio de processos químicos endotérmicos que mais tarde podem ser revertidos para liberar calor. Considerando a reação: CH4(g)+ H2O(v) + calor ↔CO(g) + 3H2(g) e analisando-a como potencial mecanismo para aproveitamento posterior da energia solar, conclui-se que se trata de uma estratégia', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 67 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f7', 'ENEM-2010-068', 6, 407, 'enem', 3, 2, 2010, 'multiple_choice', 'Circuitos e energia elétrica', '![](conteudo/enem/2010/68-a0bb7b9d.webp)

O valor a ser pago pelo consumo de energia elétrica registrado seria de', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 68 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f8', 'ENEM-2010-069', 7, 414, 'enem', 3, 2, 2010, 'multiple_choice', 'Química e ambiente', '![](conteudo/enem/2010/69-41751926.webp)

Considere que, em pequenos volumes, o custo de produção de ambos os alcoóis seja o mesmo. Dessa forma, do ponto de vista econômico, é mais vantajoso utilizar', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 69 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000f9', 'ENEM-2010-070', 6, 405, 'enem', 3, 2, 2010, 'multiple_choice', 'Trabalho, energia e potência', '![](conteudo/enem/2010/70-30a85d80.webp)

Considerando que o modelo de maior potência da versão 220 V da torneira suprema foi inadvertidamente conectada a uma rede com tensão nominal de 127 V, e que o aparelho está configurado para trabalhar em sua máxima potência. Qual o valor aproximado da potência ao ligar a torneira?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 70 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000fa', 'ENEM-2010-071', 5, 261, 'enem', 3, 2, 2010, 'multiple_choice', 'Doenças e prevenção', 'O uso prolongado de lentes de contato, sobretudo durante a noite, aliado a condições precárias de higiene representam fatores de risco para o aparecimento de uma infecção denominada ceratite microbiana, que causa ulceração inflamatória na córnea. Para interromper o processo da doença, é necessário tratamento antibiótico. De modo geral, os fatores de risco provocam a diminuição da oxigenação corneana e determinam mudanças no seu metabolismo, de um estado aeróbico para anaeróbico. Como decorrência, observa-se a diminuição no número e na velocidade de mitoses do epitélio, o que predispõe ao aparecimento de defeitos epiteliais e à invasão bacteriana.

CRESTA, F. Lente de contato e infecção ocular. Revista Sinopse de Oftalmologia. São Paulo: Moreira Jr., v.04, n.04, 2002 (adaptado).

A instalação das bactérias e o avanço do processo infeccioso na córnea estão relacionados a algumas características gerais desses micro-organismos, tais como:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 71 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000fb', 'ENEM-2010-072', 6, 412, 'enem', 3, 2, 2010, 'multiple_choice', 'Forças e leis de Newton', 'Todos os organismos necessitam de água e grande parte deles vive em rios, lagos e oceanos. Os processos biológicos, como respiração e fotossíntese, exercem profunda influência na química das águas naturais em todo o planeta. O oxigênio é ator dominante na química e na bioquímica da hidrosfera. Devido a sua baixa solubilidade em água (9,0 mg/l a 20 °C) a disponibilidade de oxigênio nos ecossistemas aquáticos estabelece o limite entre a vida aeróbica e anaeróbica. Nesse contexto, um parâmetro chamado Demanda Bioquímica de Oxigênio (DBO) foi definido para medir a quantidade de matéria orgânica presente em um sistema hídrico. A DBO corresponde à massa de O2 em miligramas necessárias para realizar a oxidação total do carbono orgânico em um litro de água.  
**BAIRD, C. **Química Ambiental**. Ed. Bookmam, 2005 (adaptado).**

Dados: Massas molares em g/mol: C = 12; H = 1; O = 16.

Suponha que 10 mg de açúcar (fórmula mínima CH2O e massa molar a 30 g/mol) são dissolvidos em um litro de água; em quanto a DBO será aumentada?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 72 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000fc', 'ENEM-2010-073', 7, 408, 'enem', 3, 2, 2010, 'multiple_choice', 'Eletroquímica', '![](conteudo/enem/2010/73-77d2c218.webp)

Segundo as condições do processo apresentado para a obtenção de carbonato de chumbo (II) por meio da lixiviação por carbonato de sódio e considerando uma massa de pasta residual de uma bateria de 6 kg, qual quantidade aproximada, em quilogramas, de PbCO3 é obtida?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 73 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000fd', 'ENEM-2010-074', 7, 197, 'enem', 3, 2, 2010, 'multiple_choice', 'Cálculo estequiométrico', 'A eletrólise é muito empregada na indústria com o objetivo de reaproveitar parte dos metais sucateados. O cobre, por exemplo, é um dos metais com maior rendimento no processo de eletrólise, com uma recuperação de aproximadamente 99,9%. Por ser um metal de alto valor comercial e de múltiplas aplicações, sua recuperação torna-se viável economicamente.

Suponha que, em um processo de recuperação de cobre puro, tenha-se eletrolisado uma solução de sulfato de cobre (II) (CuSO4) durante 3h, empregando-se uma corrente elétrica de intensidade igual a 10A. A massa de cobre puro recuperada é de aproximadamente
Dados: Constante de Faraday F = 96500C/mol; Massa molar em g/mol: Cu = 63,5', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 74 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000fe', 'ENEM-2010-075', 5, 406, 'enem', 3, 2, 2010, 'multiple_choice', 'Ecossistemas e relações ecológicas', '![](conteudo/enem/2010/75-4cf500ff.webp)

Dois pesquisadores percorreram os trajetos marcados no mapa. A tarefa deles foi analisar os ecossistemas e, encontrando problemas, relatar e propor medidas de recuperação. A seguir, são reproduzidos trechos aleatórios extraídos dos relatórios desses dois pesquisadores.

Trechos aleatórios extraídos do relatório do pesquisador P1:

I. “Por causa da diminuição drástica das espécies vegetais deste ecossistema, como os pinheiros, a gralha azul também está em processo de extinção”.  
II. “As árvores de troncos tortuosos e cascas grossas que predominam nesse ecossistema estão sendo utilizadas em carvoarias”.  
Trechos aleatórios extraídos do relatório do pesquisador P2:  
III. “Das palmeiras que predominam nesta região podem ser extraídas substâncias importantes para a economia regional”,  
IV. “Apesar da aridez desta região, em que encontramos muitas plantas espinhosas, não se pode desprezar a sua biodiversidade”. Ecossistemas brasileiros: mapa de distribuição de ecossistemas.

Disponível em: http://educacao.uol.com.br/ciencias/ult1686u52.jhtm. Acesso em: 20 abr. 2010 (adaptado).

Os trechos I, II, III e IV referem-se, pela ordem, aos seguintes ecossistemas:', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 75 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000000ff', 'ENEM-2010-076', 5, 403, 'enem', 3, 2, 2010, 'multiple_choice', 'DNA, genes e hereditariedade', 'Investigadores das Universidades de Oxford e da Califórnia desenvolveram uma variedade de Aedes aegypti geneticamente modificada que é candidata para uso na busca de redução na transmissão do vírus da dengue. Nessa nova variedade de mosquito, as fêmeas não conseguem voar devido à interrupção do desenvolvimento do músculo das asas. A modificação genética introduzida é um gene dominante condicional, isso é, o gene tem  
expressão dominante (basta apenas uma cópia do alelo) e este só atua nas fêmeas.

FU, G. et al. Female-specific flightless phenotype for mosquito control.  
PNAS 107 (10): 4550-4554, 2010.

Prevê-se, porém, que a utilização dessa variedade de Aedes aegypti demore ainda anos para ser implementada, pois há demanda de muitos estudos com relação ao impacto ambiental. A liberação de machos de Aedes aegypti dessa variedade geneticamente modificada reduziria o número de casos de dengue em uma determinada região porque', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 76 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000100', 'ENEM-2010-077', 7, 26, 'enem', 3, 2, 2010, 'multiple_choice', 'pH e acidez', '![](conteudo/enem/2010/77-ccb7182d.webp)

O monofluoracetato de sódio pode ser obtido pela', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 77 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000101', 'ENEM-2010-078', 5, 459, 'enem', 3, 2, 2010, 'multiple_choice', 'Célula e metabolismo', 'Duas irmãs que dividem o mesmo quarto de estudos combinaram de comprar duas caixas com tampas para guardarem seus pertences dentro de suas caixas, evitando, assim, a bagunça sobre a mesa de estudos. Uma delas comprou uma metálica, e a outra, uma caixa de madeira de área e espessura lateral diferentes, para facilitar a identificação. Um dia as meninas foram estudar para a prova de Física e, ao se acomodarem na mesa de estudos, guardarem seus celulares ligados dentro de suas caixas. Ao longo desse dia, uma delas recebeu ligações telefônicas, enquanto os amigos da outra tentavam ligar e recebiam a mensagem de que o celular estava fora da área de cobertura ou desligado.

Para explicar essa situação, um físico deveria afirmar que o material da caixa, cujo telefone celular não recebeu as ligações é de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 78 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000102', 'ENEM-2010-079', 7, 197, 'enem', 3, 2, 2010, 'multiple_choice', 'Cálculo estequiométrico', 'As mobilizações para promover um planeta melhor para as futuras gerações são cada vez frequentes. A maior parte dos meios de transporte de massa é atualmente movida pela queima de um combustível fóssil. A título de exemplificação do ônus causado por essa prática, basta saber que um carro produz, em média, cerca de 200g de dióxido de carbono por km percorrido.

Revista Aquecimento Global. Ano 2, no 8. Publicação do Instituto Brasileiro de Cultura Ltda.

Um dos principais constituintes da gasolina é o octano (C8H18). Por meio da combustão do octano é possível a liberação de energia, permitindo que o carro entre em movimento. A equação que representa a reação química desse processo demonstra que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 79 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000103', 'ENEM-2010-080', 7, 413, 'enem', 3, 2, 2010, 'multiple_choice', 'Átomo, tabela periódica e ligações', 'Os pesticidas modernos são divididos em várias classes, entre as quais se destacam os organofosforados, materiais que apresentam efeito tóxico agudo para os seres humanos. Esses pesticidas contêm um átomo central de fósforo ao qual estão ligados outros átomos ou grupo de átomos como oxigênio, enxofre, grupos metoxi ou etoxi ou um radical orgânico de cadeia longa. Os organofosforados são divididos em três subclasses: Tipo A, na qual o enxofre não se incorpora na molácula; Tipo B, na qual o oxigênio, que faz dupla ligação com fósforo, é substituído pelo enxofre; e Tipo C, no qual dois oxigênios são substituídos por enxofre.

BAIRD, C. Química Ambiental. Bookmam. 2005.

Um exemplo de pesticida organofosforado Tipo B, que apresenta grupo etoxi em sua fórmula estrutural, está representado em:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 80 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000104', 'ENEM-2010-081', 6, 412, 'enem', 3, 2, 2010, 'multiple_choice', 'Forças e leis de Newton', 'Durante uma obra em um clube, um grupo de trabalhadores teve de remover uma escultura de ferro maciço colocada no fundo de uma piscina vazia. Cinco trabalhadores amarraram cordas à escultura e tentaram puxá-la para cima, sem sucesso.

Se a piscina for preenchida com água, ficará mais fácil para os trabalhadores removerem a escultura, pois a', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 81 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000105', 'ENEM-2010-082', 7, 408, 'enem', 3, 2, 2010, 'multiple_choice', 'Eletroquímica', 'As baterias de Ni-Cd muito utilizadas no nosso cotidiano não devem ser descartadas em lixos comuns uma vez que uma considerável quantidade de cádmio é volatilizada e emitida para o meio ambiente quando as baterias gastas são incineradas como componente do lixo. Com o objetivo de evitar a emissão de cádmio para a atmosfera durante a combustão é indicada que seja feita a reciclagem dos materiais dessas baterias.

Uma maneira de separar o cádmio dos demais compostos presentes na bateria é realizar o processo de lixiviação ácida.Nela, tanto os metais (Cd, Ni e, eventualmente, Co) como os hidróxidos de ions metálicos Cd(OH)2(s), Ni(OH)2(s), Co(OH)2(s) presentes na bateria, reagem com uma mistura ácida e são solubilizados. Em função da baixa seletividade (todos os ions metálicos são solubilizados), após a digestão ácida, é realizada uma etapa de extração dos metais com solventes orgânicos de acordo com a reação:

![](conteudo/enem/2010/82-4176d2dd.webp)

Onde:  
M2+ = Cd2+ , Ni2+ ou Co2+  
HR = C16H34\-PO2H : identificado no gráfico por X  
HR = C12H12\-PO2H : identificado no gráfico por Y  
O gráfico mostra resultado de extração utilizando os solventes orgânicos X e Y em diferentes pH.

![](conteudo/enem/2010/82-8560bd4b.webp)

A reação descrita no texto mostra o processo de extração dos metais por meio da reação com moléculas orgânicas, X e Y. Considerando-se as estruturas de X e Y e o processo de separação descrito, pode-se afirmar que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 82 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000106', 'ENEM-2010-083', 7, 464, 'enem', 3, 2, 2010, 'multiple_choice', 'Concentração e diluição', 'Ao colocar um pouco de açúcar ma água e mexer até a obtenção de uma só fase, prepara-se uma solução. O mesmo acontece ao se adicionar um pouquinho de sal à água e misturar bem. Uma substância capaz de dissolver o soluto é denominada solvente; por exemplo, a água é um solvente para o açúcar, para o sal e para várias outras substâncias. A figura a seguir ilustra essa citação.

![](conteudo/enem/2010/83-8b75906e.webp)

Suponha que uma pessoa, para adoçar seu cafezinho, tenha utilizado 3,42 g de sacarose (massa molar igual a 342 g/mol) para uma xícara de 50 mℓ do líquido. Qual é a concentração final em mol/ℓ de sacarose nesse cafezinho?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 1º dia · Questão 83 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000107', 'ENEM-2010-084', 6, 416, 'enem', 3, 2, 2010, 'multiple_choice', 'Lentes, espelhos e luz', 'Um grupo de cientistas liderado por pesquisadores do instituto de Tecnologia da Califórnia (Caltech), nos Estados Unidos, construiu o primeiro metamaterial que apresenta valor negativo do índice de refração relativo para a luz visível. Denomina-se metamaterial um material óptico artificial, tridimensional, formado por pequenas estruturas menores do que o comprimento de onda da luz, o que lhe dá propriedades e comportamentos que não são encontrados em materiais naturais. Esse material tem sido chamado de “canhoto”.

Disponível em: http://www.invocaçãotecnologica.com.br. Acesso em: 28 abr. (adaptado).

Considerando o comportamento atípico desse metamaterial, qual é a figura que representa a refração da luz ao passar do ar para esse meio?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 84 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000108', 'ENEM-2010-085', 7, 26, 'enem', 3, 2, 2010, 'multiple_choice', 'pH e acidez', 'Decisão de asfaltamento da rodovia MG-010, acompanha da introdução de espécies exóticas, e a prática de incêndios criminosos, ameaçam o sofisticado ecossistema do campo rupestre da reserva da Serra do Espinhaço. As plantas nativas desta região, altamente adaptadas a uma alta concentração de alumínio, que inibe o crescimento das raízes e dificultam a absorção de nutrientes e água, estão sendo substituídas por espécies invasoras que não teriam naturalmente adaptação para este ambiente, no entanto elas estão dominando as margens da rodovia, equivocadamente chamada de “estrada ecológica”. Possivelmente a entrada de espécies de plantas exóticas neste ambiente foi provocada pelo uso, neste empreendimento, de um tipo de asfalto (cimento-solo), que possui uma mistura rica em cálcio, que causou modificações químicas aos solos adjacentes à rodovia MG-010.

Scientific American. Brasil. Ano 7, nº 79. 2008 (adaptado).

Essa afirmação baseia-se no uso de cimento-solo, mistura rica em cálcio que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 1º dia · Questão 85 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000109', 'ENEM-2010-086', 5, 411, 'enem', 3, 2, 2010, 'multiple_choice', 'Animais', '![](conteudo/enem/2010/86-ca1e9c9f.webp)

Três dos quatro tipos de testes atualmente empregados para a detecção de príons patogênicos, em tecidos cerebrais do gado morto, são mostrados nas figuras a seguir. Uma vez identificados um animal morto infectado, funcionários das agências de saúde pública e fazendeiros podem removê-lo do suprimento alimentar ou rastrear os alimentos infectados que o animal possa ter consumido.

Analisando os testes I, II e III, para a detecção de príons patogênicos, identifique as condições em que os resultados foram positivos para a presença de príons nos três testes:', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 86 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000010a', 'ENEM-2010-087', 5, 402, 'enem', 3, 2, 2010, 'multiple_choice', 'Plantas e fotossíntese', 'De 15% a 20% da área de um canavial precisa ser renovada anualmente. Entre o período de corte e o de plantação de novas canas, os produtores estão optando por plantar leguminosas, pois elas fixam nitrogênio no solo, um adubo natural para a cana. Essa opção de rotação é agronomicamente favorável, de forma que municípios canavieiros são hoje grandes produtores de soja, amendoim e feijão.

As encruzilhadas da fome. Planeta. São Paulo, ano 36, no 430, jul. 2008 (adaptado).

A rotação de culturas citada no texto pode beneficiar economicamente os produtores de cana porque', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 1º dia · Questão 87 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000010b', 'ENEM-2010-088', 6, 416, 'enem', 3, 2, 2010, 'multiple_choice', 'Lentes, espelhos e luz', 'Diversos comportamentos e funções fisiológicas do nosso corpo são periódicos, sendo assim, são classificados como ritmo biológico. Quando o ritmo biológico responde a um período aproximado de 24 horas, ele é denominado ritmo circadiano. Esse ritmo diário é mantido pelas pistas ambientais de claro-escuro e determina comportamentos como o ciclo do sono-vigília e o da alimentação. Uma pessoa, em condições normais, acorda às 8 h e vai dormir às 21 h, mantendo seu ciclo de sono dentro do ritmo dia e noite. Imagine que essa mesma pessoa tenha sido mantida numa sala totalmente escura por mais de quinze dias. Ao sair de lá, ela dormia às 18 h e acordava às 3 h da manhã. Além disso, dormia mais vezes durante o dia, por curtos períodos de tempo, e havia perdido a noção da contagem dos dias, pois, quando saiu, achou que havia passado muito mais tempo no escuro.

Brandão, M. L. Psicofisiologia. São Paulo: Atheneu, 2000 (adaptado).

Em função das características observadas, conclui-se que a pessoa', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 88 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000010c', 'ENEM-2010-089', 6, 405, 'enem', 3, 2, 2010, 'multiple_choice', 'Trabalho, energia e potência', 'Deseja-se instalar uma estação de geração de energia elétrica em um município localizado no interior de um pequeno vale cercado de altas montanhas de difícil acesso. A cidade é cruzada por um rio, que é fonte de água para consumo, irrigação das lavouras de subsistência e pesca. Na região, que possui pequena extensão territorial, a incidência solar é alta o ano todo. A estação em questão irá abastecer apenas o município apresentado.

Qual forma de obtenção de energia, entre as apresentadas, é a mais indicada para ser implantada nesse município de modo a causar o menor impacto ambiental?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 1º dia · Questão 89 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000010d', 'ENEM-2010-090', 7, 401, 'enem', 3, 2, 2010, 'multiple_choice', 'Funções e reações orgânicas', 'O lixão que recebia 130 toneladas de lixo e contaminava a região com seu chorume (líquido derivado da decomposição de compostos orgânicos) foi recuperado, transformando-se em um aterro sanitário controlado, mudando a qualidade de vida e a paisagem e proporcionando condições dignas de trabalho para os que dele subsistiam.

Revista Promoção da Saúde da Secretaria de Políticas da Saúde. Ano 1, nº 4, dez. 2000 (adaptado).

Quais procedimentos técnicos tornam o aterro sanitário mais vantajoso que o lixão, em relação às problemáticas abordadas no texto?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 1º dia · Questão 90 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000010e', 'ENEM-2010-091-ESP', 14, 466, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua espanhola', '**Los animales**

En la Unión Europea desde el 1o de octubre de 2004 el uso de un pasaporte es obligatorio para los animales que viajan con su dueño en cualquier compañía.  
AVISO ESPECIAL: en España los animales deben haber sido vacunados contra la rabia antes de su dueño solicitar la documentación. Consultar a un veterinario.

Disponível em: http://www.agencedelattre.com. Acesso em: 2 maio 2009 (adaptado).

De acordo com as informações sobre aeroportos e estações ferroviárias na Europa, uma pessoa que more na Espanha e queira viajar para a Alemanha com o seu cachorro deve', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 91 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000010f', 'ENEM-2010-091-ING', 2, 467, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua inglesa', '![](conteudo/enem/2010/91-ingles-ce7cb3d4.webp)

Disponível em: http://www.fool.com. Acesso em: 21 jul. 2010.

Ao optar por ler a reportagem completa sobre o assunto anunciado, tem-se acesso a duas palavras que Bill Gates não quer que o leitor conheça e que se referem', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 91 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000110', 'ENEM-2010-092-ESP', 14, 466, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua espanhola', '**Bilingüismo en la Educación Media Continuidad, no continuismo**

Aun sin escuela e incluso a pesar de la escuela, paraguayos y paraguayas se están comunicando en guaraní. La comunidad paraguaya ha encontrado en la lengua guaraní una funcionalidad real que asegura su reproducción y continuidad. Esto, sin embargo, no basta. La inclusión de la lengua guaraní en el proceso de educación escolar fue sin duda un avance de la Reforma Educativa.

Gracias precisamente a los programas escolares, aun en contextos urbanos, el bilingüismo ha sido potenciado. Los guaraníhablantes se han acercado con mayor fuerza a la adquisición del castellano, y algunos castellanohablantes perdieron el miedo al guaraní y superaron los prejuicios en contra de él. Dejar fuera de la Educación Media al guaraní sería echar por la borda tanto trabajo realizado, tanta esperanza acumulada.

Cualquier intento de marginación del guaraní en la educación paraguaya merece la más viva y decidida protesta, pero esta postura ética no puede encubrir el continuismo de una forma de enseñanza del guaraní que ya ha causado demasiados estragos contra la lengua, contra la cultura y aun contra la lealtad que las paraguayas y paraguayos sienten por su querida lengua. El guaraní, lengua de comunicación sí y mil veces sí; lengua de imposición, no.

MELIÀ. B. Disponível em: http://www.staff.uni-mainz.de. Acesso em: 27 abr. 2010 (adaptado).

No último parágrafo do fragmento sobre o bilinguismo no Paraguai, o autor afirma que a língua guarani, nas escolas, deve ser tratada como língua de comunicação e não de imposição. Qual dos argumentos abaixo foi usado pelo autor para defender essa ideia?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 92 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000111', 'ENEM-2010-092-ING', 2, 467, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua inglesa', '**Viva la Vida**

I used to rule the world  
Seas would rise when I gave the word  
Now in the morning and I sleep alone  
Sweep the streets I used to own

I used to roll the dice  
Feel the fear in my enemy’s eyes  
Listen as the crowd would sing  
“Now the old king is dead! Long live the king!”

One minute I held the key  
Next the walls were closed on me  
And I discovered that my castles stand  
Upon pillars of salt and pillars of sand  
\[…\]

MARTIN, C. Viva la vida, Coldplay. In: **Viva la vida or Death and all his friends**. Parlophone, 2008.

Letras de músicas abordam temas que, de certa forma, podem ser reforçados pela repetição de trechos ou palavras. O fragmento da canção Viva la vida, por exemplo, permite conhecer o relato de alguém que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 92 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000112', 'ENEM-2010-093-ESP', 14, 466, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua espanhola', '**Bilingüismo en la Educación Media Continuidad, no continuismo**

Aun sin escuela e incluso a pesar de la escuela, paraguayos y paraguayas se están comunicando en guaraní. La comunidad paraguaya ha encontrado en la lengua guaraní una funcionalidad real que asegura su reproducción y continuidad. Esto, sin embargo, no basta. La inclusión de la lengua guaraní en el proceso de educación escolar fue sin duda un avance de la Reforma Educativa.

Gracias precisamente a los programas escolares, aun en contextos urbanos, el bilingüismo ha sido potenciado. Los guaraníhablantes se han acercado con mayor fuerza a la adquisición del castellano, y algunos castellanohablantes perdieron el miedo al guaraní y superaron los prejuicios en contra de él. Dejar fuera de la Educación Media al guaraní sería echar por la borda tanto trabajo realizado, tanta esperanza acumulada.

Cualquier intento de marginación del guaraní en la educación paraguaya merece la más viva y decidida protesta, pero esta postura ética no puede encubrir el continuismo de una forma de enseñanza del guaraní que ya ha causado demasiados estragos contra la lengua, contra la cultura y aun contra la lealtad que las paraguayas y paraguayos sienten por su querida lengua. El guaraní, lengua de comunicación sí y mil veces sí; lengua de imposición, no.

MELIÀ. B. Disponível em: http://www.staff.uni-mainz.de. Acesso em: 27 abr. 2010 (adaptado).

Em alguns países bilíngues, o uso de uma língua pode se sobrepor à outra, gerando uma mobilização social em prol da valorização da menos proeminente. De acordo com o texto, no caso do Paraguai, esse processo se deu pelo (a)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 93 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000113', 'ENEM-2010-093-ING', 2, 467, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua inglesa', '**THE WEATHER MAN**

They say that the British love talking about the weather. For other nationalities this can be a banal and boring subject of conversation, something that people talk about when they have nothing else to say to each other. And yet the weather is a very important part of our lives. That at least is the opinion of Barry Gromett, press officer for The Met Office. This is located in Exeter, a pretty cathedral city in the southwest of England. Here employees — and computers — supply weather forecasts for much of the world.

**Speak Up**. Ano XXIII, n° 275.

Ao conversar sobre a previsão do tempo, o texto mostra', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 93 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000114', 'ENEM-2010-094-ESP', 14, 466, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua espanhola', 'Dejar de fumar engorda, pero seguir haciéndolo, también. Esa es la conclusión a la que han llegado investigadores de la Universidad de Navarra que han hecho un seguimiento de 7.565 personas durante 50 meses. Los datos “se han ajustado por edad, sexo, índice de masa corporal inicial y estilo de vida”, ha explicado el director del ensayo, Javier Basterra-Gortari, por lo que “el único factor que queda es el tabaquismo”. El estudio se ha publicado en la Revista Española de Cardiología.

“El tabaco es un anorexígeno \[quita el apetito\], y por eso las personas que dejan de fumar engordan”, añade Basterra-Gortari. Eso hace mucho más relevante el hallazgo del estudio. Puesto en orden, los que más peso ganan son los que dejan de fumar, luego, los que siguen haciéndolo, y, por último, los que nunca han fumado, indica el investigador. “Por eso lo mejor para mantener una vida saludable es no fumar nunca”, añade.

BENITO, E. Disponível em: http://www.elpais.com/articulo/sociedad. Acesso em: 23 abr. 2010 (fragmento).

O texto jornalístico caracteriza-se basicamente por apresentar informações a respeito dos mais variados assuntos, e seu título antecipa o tema que será tratado. Tomando como base o fragmento, qual proposição identifica o tema central e poderia ser usada como título?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 94 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000115', 'ENEM-2010-094-ING', 2, 467, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua inglesa', '**MILLENIUM GOALS**

![](conteudo/enem/2010/94-ingles-90e233c7.webp)

Disponível em: http://www.chris-alexander.co.uk/1191. Acesso em: 28 jul. 2010 (adaptado).

Definidas pelos países membros da Organização das Nações Unidas e por organizações internacionais, as metas de desenvolvimento do milênio envolvem oito objetivos a serem alcançados até 2015. Apesar da diversidade cultural, esses objetivos, mostrados na imagem, são comuns ao mundo todo, sendo dois deles:', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 94 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000116', 'ENEM-2010-095-ESP', 14, 466, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua espanhola', '![](conteudo/enem/2010/95-espanhol-fbbc0a02.webp)

**Revista Glamour Latinoamérica**. México, mar. 2010.

O texto publicitário utiliza diversas estratégias para enfatizar as características do produto que pretende vender. Assim, no texto, o uso de vários termos de outras línguas, que não a espanhola, tem a intenção de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 95 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000117', 'ENEM-2010-095-ING', 2, 467, 'enem', 3, 2, 2010, 'multiple_choice', 'Leitura em língua inglesa', '![](conteudo/enem/2010/95-ingles-3584c66e.webp)

Disponível em: http://www.meganbergdesigns.com/andrill/iceberg07/postcards/index.html. Acesso em: 29 jul. 2010 (adaptado).

Os cartões-postais costumam ser utilizados por viajantes que desejam enviar notícias dos lugares que visitam a parentes e amigos. Publicado no site do projeto ANDRILL, o texto em formato de cartão-postal tem o propósito de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 95 (Inglês) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000118', 'ENEM-2010-096', 1, 445, 'enem', 3, 2, 2010, 'multiple_choice', 'Gramática e sentido', '![](conteudo/enem/2010/96-64ed268e.webp)

As diferentes esferas sociais de uso da língua obrigam o falante a adaptá-la às variadas situações de comunicação. Uma das marcas linguísticas que configuram a linguagem oral informal usada entre avô e neto neste texto é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 96 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000119', 'ENEM-2010-097', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', 'A biosfera, que reúne todos os ambientes onde se desenvolvem os seres vivos, se divide em unidades menores chamadas ecossistemas, que podem ser uma tem múltiplos mecanismos que regulam o número de organismos dentro dele, controlando sua reprodução, crescimento e migrações.

DUARTE, M. **O guia dos curiosos.** São Paulo: Companhia das Letras, 1995.

Predomina no texto a função da linguagem', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 97 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000011a', 'ENEM-2010-098', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**Câncer 21/06 a 21/07**

O eclipse em seu signo vai desencadear mudanças na sua autoestima e no seu modo de agir. O corpo indicará onde você falha – se anda engolindo sapos, a área gástrica se ressentirá. este novo ciclo exige uma “desintoxicação”. Seja comedida em suas ações, já que precisará de energia para se recompor. Há preocupação com a família, e a comunicação entre os irmãos trava. Lembre-se: palavra preciosa é palavra dita na hora certa. Isso ajuda também na vida amorosa, que será testada. Melhor conter as expectativas e ter calma, avaliando as próprias carências de modo maduro. Sentirá vontade de intimidade com os assuntos da alma.

**Revista Cláudia.** No 7, ano 48, jul. 2009.

O reconhecimento dos diferentes gêneros textuais, seu contexto de uso, sua função social específica, seu objetivo comunicativo e seu formato mais comum relacionam-se aos conhecimentos construídos socioculturalmente. A análise dos elementos constitutivos desse texto demonstra que sua função é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 98 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000011b', 'ENEM-2010-099', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**S.O.S Português**

Por que pronunciamos muitas palavras de um jeito diferente da escrita? Pode-se refletir sobre esse aspecto da língua com base em duas perspectivas. Na primeira delas, fala e escrita são dicotômicas, o que restringe o ensino da língua ao código. Daí vem o entendimento de que a escrita é mais complexa que a fala, e seu ensino restringe-se ao conhecimento das regras gramaticais, sem a preocupação com situações de uso. Outra abordagem permite encarar as diferenças como um produto distinto de duas modalidades da língua: a oral e a escrita. A questão é que nem sempre nos damos conta disso.

S.O.S Português. **Nova Escola.** São Paulo: Abril, Ano XXV, nº- 231, abr. 2010 (fragmento adaptado).

O assunto tratado no fragmento é relativo à língua portuguesa e foi publicado em uma revista destinada a professores. Entre as características próprias desse tipo de texto, identificam-se marcas linguísticas próprias do uso', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 99 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000011c', 'ENEM-2010-100', 15, 438, 'enem', 3, 2, 2010, 'multiple_choice', 'Arte e cultura', 'Na busca constante pela sua evolução, o ser humano vem alternando a sua maneira de pensar, de sentir e de criar. Nas últimas décadas do século XVIII e no início do século XIX, os artistas criaram obras em que predominam o equilíbrio e a simetria de formas e cores, imprimindo um estilo caracterizado pela imagem da respeitabilidade, da sobriedade, do concreto e do civismo. Esses artistas misturaram o passado ao presente, retratando os personagens da nobreza e da burguesia, além de cenas míticas e histórias cheias de vigor.

RAZOUK, J. J. (Org.). **Histórias reais e belas nas telas.** Posigraf: 2003.

Atualmente, os artistas apropriam-se de desenhos, charges, grafismo e até de ilustrações de livros para compor obras em que se misturam personagens de diferentes épocas, como na seguinte imagem:', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 100 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000011d', 'ENEM-2010-101', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2010/101-28db87e9.webp)

Ao circularem socialmente, os textos realizam-se como práticas de linguagem, assumindo configurações específicas, formais e de conteúdo. Considerando o contexto em que circula o texto publicitário, seu objetivo básico é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 101 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000011e', 'ENEM-2010-102', 1, 441, 'enem', 3, 2, 2010, 'multiple_choice', 'Tecnologias da comunicação', '**Testes**

Dia desses resolvi fazer um teste proposto por um _site_ da internet. O nome do teste era tentador: “O que Freud diria de você”. Uau. Respondi a todas as perguntas e o resultado foi o seguinte: “Os acontecimentos da sua infância a marcaram até os doze anos, depois disso você buscou conhecimento intelectual para seu amadurecimento”. Perfeito! Foi exatamente o que aconteceu comigo. Fiquei radiante: eu havia realizado uma consulta paranormal com o pai da psicanálise, e ele acertou na mosca.

Estava com tempo sobrando, e curiosidade é algo que não me falta, então resolvi voltar ao teste e responder tudo diferente do que havia respondido antes. Marquei umas alternativas esdrúxulas, que nada tinham a ver com minha personalidade. E fui conferir o resultado, que dizia o seguinte: “Os acontecimentos da sua infância a marcaram até os 12 anos, depois disso você buscou conhecimento intelectual para seu amadurecimento”.

MEDEIROS, M. **Doidas e santas.** Porto Alegre, 2008 (adaptado).

Quanto às influências que a internet pode exercer sobre os usuários, a autora expressa uma reação irônica no trecho:', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 102 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000011f', 'ENEM-2010-103', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**Transtorno do comer compulsivo**

O transtorno do comer compulsivo vem sendo reconhecido, nos últimos anos, como uma síndrome caracterizada por episódios de ingestão exagerada e compulsiva de alimentos, porém, diferentemente da bulimia nervosa, essas pessoas não tentam evitar ganho de peso com os métodos compensatórios. Os episódios vêm acompanhados de uma sensação de falta de controle sobre o ato de comer, sentimentos de culpa e de vergonha.

Muitas pessoas com essa síndrome são obesas, apresentando uma história de variação de peso, pois a comida é usada para lidar com problemas psicológicos. O transtorno do comer compulsivo é encontrado em cerca de 2% da população em geral, mais frequentemente acometendo mulheres entre 20 e 30 anos de idade. Pesquisas demonstram que 30% das pessoas que procuram tratamento para obesidade ou para perda de peso são portadoras de transtorno do comer compulsivo.

Disponível em: http://www.abcdasaude.com.br. Acesso em: 1 maio 2009 (adaptado).

Considerando as ideias desenvolvidas pelo autor, conclui-se que o texto tem a finalidade de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 103 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000120', 'ENEM-2010-104', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', 'A gentileza é algo difícil de ser ensinado e vai muito além da palavra educação. Ela é difícil de ser encontrada, generosas e desprendidas, que se interessam em contribuir para o bem do outro e da sociedade. É uma atitude desobrigada, que se manifesta nas situações cotidianas e das maneiras mais prosaicas.

SIMURRO, S. A. B. **Ser gentil é ser saudável.** Disponível em: http://www.abqv.org.br. Acesso em: 22 jun. 2006 (adaptado).

No texto, menciona-se que a gentileza extrapola as regras de boa educação. A argumentação construída', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 104 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000121', 'ENEM-2010-105', 15, 438, 'enem', 3, 2, 2010, 'multiple_choice', 'Arte e cultura', '![](conteudo/enem/2010/105-465a663a.webp)

Em busca de maior naturalismo em suas obras e fundamentando-se em novo conceito estético, Monet, Degas, Renoir e outros artistas passaram a explorar novas formas de composição artística, que resultaram no estilo denominado Impressionismo. Observadores atentos da natureza, esses artistas passaram a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 105 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000122', 'ENEM-2010-106', 15, 438, 'enem', 3, 2, 2010, 'multiple_choice', 'Arte e cultura', 'O folclore é o retrato da cultura de um povo. A dança popular e folclórica é uma forma de representar a cultura regional, pois retrata seus valores, crenças, trabalho conhecê-la, é de alguma forma se apropriar dela, é enriquecer a própria cultura.

BREGOLATO, R. A. **Cultura Corporal da Dança**. São Paulo: Ícone, 2007.

As manifestações folclóricas perpetuam uma tradição cultural, é obra de um povo que a cria, recria e a perpetua. Sob essa abordagem deixa-se de identificar como dança folclórica brasileira', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 106 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000123', 'ENEM-2010-107', 1, 215, 'enem', 3, 2, 2010, 'multiple_choice', 'Variação linguística', '**Carnavália**

Repique tocou  
O surdo escutou  
E o meu corasamborim  
Cuíca gemeu, será que era meu, quando ela passou por mim?  
\[…\]

ANTUNES, A.; BROWN, C.; MONTE, M. **Tribalistas**, 2002 (fragmento).

No terceiro verso, o vocábulo “_corasamborim_”, que é a junção coração + samba + tamborim, refere-se, ao mesmo tempo, a elementos que compõem uma escola de samba e à situação emocional em que se encontra o autor da mensagem, com o coração no ritmo da percussão.

Essa palavra corresponde a um(a)', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 107 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000124', 'ENEM-2010-108', 1, 441, 'enem', 3, 2, 2010, 'multiple_choice', 'Tecnologias da comunicação', '![](conteudo/enem/2010/108-ecaceb52.webp)

![](conteudo/enem/2010/108-a42bfa42.webp)

A capa da revista Época de 12 de outubro de 2009 traz um anúncio sobre o lançamento do livro digital no Brasil. Já o texto II traz informações referentes à abrangência de acessibilidade das tecnologias de comunicação e informação nas diferentes regiões do país. A partir da leitura dos dois textos, infere-se que o advento do livro digital no Brasil', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 108 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000125', 'ENEM-2010-109', 1, 441, 'enem', 3, 2, 2010, 'multiple_choice', 'Tecnologias da comunicação', '**O _Chat_ e sua linguagem virtual**

O significado da palavra _chat_ vem do inglês e quer dizer “conversa”. Essa conversa acontece em tempo real, e, para isso, é necessário que duas ou mais pessoas estejam conectadas ao mesmo tempo, o que chamamos de comunicação síncrona. São muitos os _sites_ que oferecem a opção de bate-papo na internet, basta escolher a sala que deseja “entrar”, identificar-se e iniciar a conversa. Geralmente, as salas são divididas por assuntos, como educação, cinema, esporte, música, sexo, entre outros. Para entrar, é necessário escolher um _nick_, uma espécie de apelido que identificará o participante durante a conversa. Algumas salas restringem a idade, mas não existe nenhum controle para verificar se a idade informada é realmente a idade de quem está acessando, facilitando que crianças e adolescentes acessem salas com conteúdos inadequados para sua faixa etária.

AMARAL, S. F. Internet: novos valores e novos comportamentos. In: SILVA, E.T. (Coord.). **A leitura nos oceanos da internet.** São Paulo: Cortez, 2003. (adaptado).

Segundo o texto, o chat proporciona a ocorrência de diálogos instantâneos com linguagem específica, uma vez que nesses ambientes interativos faz-se uso de protocolos diferenciados de interação. O chat, nessa perspectiva, cria uma nova forma de comunicação porque', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 109 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000126', 'ENEM-2010-110', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2010/110-7859a216.webp)

O desenvolvimento das capacidades físicas (qualidades motoras passíveis de treinamento) ajuda na tomada de decisões em relação à melhor execução do movimento. A capacidade física predominante no movimento representado na imagem é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 110 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000127', 'ENEM-2010-111', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**Texto I**

**Sob o olhar do _Twitter_**

Vivemos a era da exposição e do compartilhamento. Público e privado começam a se confundir. A ideia de privacidade vai mudar ou desaparecer. O trecho acima tem 140 caracteres exatos. É uma mensagem curta que tenta encapsular uma ideia complexa. Não é fácil esse tipo de síntese, mas dezenas de milhões de pessoas o praticam diariamente. No mundo todo, são disparados 2,4 trilhões de SMS por mês, e neles cabem 140 toques, ou pouco mais. Também é comum enviar e-mails, deixar recados no Orkut, falar com as pessoas pelo MSN, tagarelar no celular, receber chamados em qualquer parte, a qualquer hora. Estamos conectados. Superconectados, na verdade, de várias formas.

\[…\] O mais recente exemplo de demanda por total conexão e de uma nova sintaxe social é o Twitter, o novo serviço de troca de mensagens pela internet. O Twitter pode ser entendido como uma mistura de blog e celular. As mensagens são de 140 toques, como os torpedos dos celulares, mas circulam pela internet, como os textos de blogs. Em vez de seguir para apenas uma pessoa, como no celular ou no MSN, a mensagem do Twitter vai para todos os “seguidores” – gente que acompanha o emissor. Podem ser 30, 300 ou 409 mil seguidores.

MARTINS, I.; LEAL, R. **Época.** 16 mar. 2009 (fragmento adaptado).

![](conteudo/enem/2010/111-e7286ec1.webp)

Da comparação entre os textos, depreende-se que o texto II constitui um passo a passo para interferir no comportamento dos usuários, dirigindo-se diretamente aos leitores, e o texto I', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 111 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000128', 'ENEM-2010-112', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**O dia em que o peixe saiu de graça**

Uma operação do Ibama para combater a pesca ilegal na divisa entre os Estados do Pará, Maranhão e Tocantins incinerou 110 quilômetros de redes usadas por pescadores durante o período em que os peixes se reproduzem. Embora tenha um impacto temporário na atividade econômica da região, a medida visa preservá-la ao longo prazo, evitando o risco de extinção dos animais. Cerca de 15 toneladas de peixes foram apreendidas e doadas para instituições de caridade.

**Época,** 23 mar. 2009 (adaptado).

A notícia, do ponto de vista de seus elementos constitutivos,', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 112 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000129', 'ENEM-2010-113', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', 'Os filhos de Anna eram bons, uma coisa verdadeira e sumarenta. Cresciam, tomavam banho, exigiam para si, malcriados, instantes cada vez mais completos. A estouros. O calor era forte no apartamento que estavam aos poucos pagando. **Mas** o vento batendo nas cortinas que ela mesma cortara lembrava-lhe que se quisesse podia parar e enxugar a testa, olhando o calmo horizonte. Como um lavrador. Ela plantara as sementes que tinha na mão, não outras, **mas** essas apenas.

LISPECTOR, C. Laços de família. Rio de Janeiro: Rocco, 1998.

A autora emprega por duas vezes o conectivo mas no fragmento apresentado. Observando aspectos da organização, estruturação e funcionalidade dos elementos que articulam o texto, o conectivo mas', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 113 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000012a', 'ENEM-2010-114', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**A Herança Cultural da Inquisição**

A Inquisição gerou uma série de comportamentos humanos defensivos na população da época, especialmente por ter perdurado na Espanha e em Portugal durante quase 300 anos, ou no mínimo quinze gerações.

Embora a Inquisição tenha terminado há mais de um e psicólogos era se alguns desses comportamentos culturais não poderiam ter-se perpetuado entre nós.

Na maioria, as respostas foram negativas, ou seja, embora alterasse sem dúvida o comportamento da época, nenhum comportamento permanece tanto tempo depois, sem reforço ou estímulo continuado.

Não sou psicólogo nem sociólogo para discordar, mas tenho a impressão de que existem alguns comportamentos estranhos na sociedade brasileira, e que fazem sentido se você os considerar resquícios da era da Inquisição.

\[…\] KANITZ, S. A Herança Cultural da Inquisição. In: **Revista Veja**. Ano 38, no 5, 2 fev. 2005 (fragmento).

Considerando-se o posicionamento do autor do fragmento a respeito de comportamentos humanos, o texto', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 114 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000012b', 'ENEM-2010-115', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', 'Resta saber o que ficou nas línguas indígenas no Português do Brasil. Serafim da Silva Neto afirma: “No Brasil não há, positivamente, influência das línguas africanas ou ameríndias”. Todavia, é difícil de aceitar que um longo período de bilinguismo de dois séculos não deixasse marcas no português do Brasil.

ELIA, S. **Fundamentos Histórico-Linguísticos do Português do Brasil.**Rio de Janeiro: Lucerna, 2003 (adaptado).

No final do século XVIII, no norte do Egito, foi descoberta a Pedra de Roseta, que continha um texto escrito em egípcio antigo, uma versão desse texto chamada “demótico”, e o mesmo texto escrito em grego. Até então, a antiga escrita egípcia não estava decifrada. O inglês Thomas Young estudou o objeto e fez algumas descobertas como, por exemplo, a direção em que a leitura deveria ser feita. Mais tarde, o francês Jean-François Champollion voltou a estudá-la e conseguiu decifrar a antiga escrita egípcia a partir do grego, provando que, na verdade, o grego era a língua original do texto e que o egípcio era uma tradução.

Com base na leitura dos textos conclui-se, sobre as línguas, que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 115 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000012c', 'ENEM-2010-116', 11, 442, 'enem', 3, 2, 2010, 'multiple_choice', 'Escolas e textos literários', '![](conteudo/enem/2010/116-7ce286ed.webp)

Joaquim Maria **Machado de Assis**, cronista, contista, dramaturgo, jornalista, poeta, novelista, romancista, crítico e ensaísta, nasceu na cidade do Rio de Janeiro em 21 de junho de 1839. Filho de um operário mestiço de negro e português, Francisco José de Assis, e de D. Maria Leopoldina Machado de Assis, aquele que viria a tornar-se o maior escritor do país e um mestre da língua, perde a mãe muito cedo e é criado pela madrasta, Maria Inês, também mulata, que se dedica ao menino e o matricula na escola pública, única que frequentou o autodidata Machado de Assis.

Disponível em: http://www.passeiweb.com. Acesso em: 1 maio 2009.

Considerando os seus conhecimentos sobre os gêneros textuais, o texto citado constitui-se de', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 116 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000012d', 'ENEM-2010-117', 11, 442, 'enem', 3, 2, 2010, 'multiple_choice', 'Escolas e textos literários', '**Soneto**

Já da morte o palor me cobre o rosto,  
Nos lábios meus o alento desfalece,  
Surda agonia o coração fenece,  
E devora meu ser mortal desgosto!

Do leito embalde no macio encosto  
Tento o sono reter!… já esmorece  
O corpo exausto que o repouso esquece…  
Eis o estado em que a mágoa me tem posto!

O adeus, o teu adeus, minha saudade,  
Fazem que insano do viver me prive  
E tenha os olhos meus na escuridade.

Dá-me a esperança com que o ser mantive!  
Volve ao amante os olhos por piedade,  
Olhos por quem viveu quem já não vive!

AZEVEDO, A. **Obra completa**. Rio de Janeiro: Nova Aguilar, 2000.

O núcleo temático do soneto citado é típico da segunda geração romântica, porém configura um lirismo que o projeta para além desse momento específico. O fundamento desse lirismo é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 117 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000012e', 'ENEM-2010-118', 11, 442, 'enem', 3, 2, 2010, 'multiple_choice', 'Escolas e textos literários', '**Texto I**  
Logo depois transferiram para o trapiche o depósito dos objetos que o trabalho do dia lhes proporcionava. Estranhas coisas entraram então para o trapiche. Não mais estranhas, porém, que aqueles meninos, moleques de todas as cores e de idades as mais variadas, desde os nove aos dezesseis anos, que à noite se estendiam pelo assoalho e por debaixo da ponte e dormiam, indiferentes ao vento que circundava o casarão uivando, indiferentes à chuva que muitas vezes os lavava, mas com os olhos puxados para as luzes dos navios, com os ouvidos  
presos às canções que vinham das embarcações…

AMADO, J. **Capitães da Areia**. São Paulo: Companhia das Letras, 2008 (fragmento).

**Texto II**  
À margem esquerda do rio Belém, nos fundos do mercado de peixe, ergue-se o velho ingazeiro – ali os bêbados são felizes. Curitiba os considera animais sagrados, provê as suas necessidades de cachaça e pirão. No trivial contentavam-se com as sobras do mercado.

TREVISAN, D. **35 noites de paixão: contos escolhidos.** Rio de Janeiro: BestBolso, 2009 (fragmento).

Sob diferentes perspectivas, os fragmentos citados são exemplos de uma abordagem literária recorrente na literatura brasileira do século XX. Em ambos os textos,', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 118 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000012f', 'ENEM-2010-119', 1, 441, 'enem', 3, 2, 2010, 'multiple_choice', 'Tecnologias da comunicação', '**A Internet que você faz**

Uma pequena invenção, a _Wikipédia_, mudou o jeito de lidarmos com informações na rede. Trata-se de uma enciclopédia virtual colaborativa, que é feita e atualizada por qualquer internauta que tenha algo a contribuir. Em resumo: é como se você imprimisse uma nova página para a publicação desatualizada que encontrou na biblioteca.

Antigamente, quando precisávamos de alguma informação confiável, tínhamos a enciclopédia como fonte segura de pesquisa para trabalhos, estudos e pesquisa em geral. Contudo, a novidade trazida pela _Wikipédia_nos coloca em uma nova circunstância, em que não podemos confiar integralmente no que lemos.

Por ter como lema principal a escritura coletiva, seus textos trazem informações que podem ser editadas e reeditadas por pessoas do mundo inteiro. Ou seja, a relevância da informação não é determinada pela tradição cultural, como nas antigas enciclopédias, mas pela dinâmica da mídia.

Assim, questiona-se a possibilidade de serem encontradas informações corretas entre sabotagens deliberadas e contribuições erradas.

NÉO, A. et al. A Internet que você faz. In: **Revista PENSE!** Secretaria de Educação do Estado do Ceará. Ano 2, n°. 3, mar.-abr. 2010 (adaptado).

As novas Tecnologias de Informação e Comunicação, como a Wikipédia, têm trazido inovações que impactaram significativamente a sociedade. A respeito desse assunto, o texto apresentado mostra que a falta de confiança na veracidade dos conteúdos registrados na Wikipédia', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 119 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000130', 'ENEM-2010-120', 16, 444, 'enem', 3, 2, 2010, 'multiple_choice', 'Corpo, esporte e saúde', '![](conteudo/enem/2010/120-905db2b8.webp)

O voleibol é um dos esportes mais praticados na atualidade. Está presente nas competições esportivas, nos jogos escolares e na recreação. Nesse esporte, os praticantes utilizam alguns movimentos específicos como: saque, manchete, bloqueio, levantamento, toque, entre outros. Na sequência de imagens, identificam-se os movimentos de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 120 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000131', 'ENEM-2010-121', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', 'O presidente Lula assinou, em 29 de setembro de 2008, decreto sobre o Novo Acordo Ortográfico da Língua Portuguesa. As novas regras afetam principalmente o uso dos acentos agudos e circunflexo, do trema e do hífen.

Longe de um consenso, muita polêmica tem-se levantado em Macau e nos oito países de língua portuguesa: Brasil, Angola, Cabo Verde, Guiné-Bissau, Moçambique, Portugal, São Tomé e Príncipe e Timor Leste.

Comparando as diferentes opiniões sobre a validade de se estabelecer o acordo para fins de unificação o argumento que, em grande parte, foge a essa discussão é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 121 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000132', 'ENEM-2010-122', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**Texto I**

O chamado “fumante passivo” é aquele indivíduo que não fuma, mas acaba respirando a fumaça dos cigarros fumados ao seu redor. Até hoje, discutem-se muito os efeitos do fumo passivo, mas uma coisa é certa: quem não fuma não é obrigado a respirar a fumaça dos outros.

O fumo passivo é um problema de saúde pública em todos os países do mundo. Na Europa, estima-se que 79% das pessoas estão expostas à fumaça “de segunda mão”, enquanto, nos Estados Unidos, 88% dos não fumantes acabam fumando passivamente. A Sociedade do Câncer da Nova Zelândia informa que o fumo passivo é a terceira entre as principais causas de morte no país, depois do fumo ativo e do uso de álcool.

Disponível em: www.terra.com.br. Acesso em: 27 abr. 2010 (fragmento).

![](conteudo/enem/2010/122-2df0da41.webp)

Ao abordar a questão do tabagismo, os textos I e II procuram demonstrar que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 122 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000133', 'ENEM-2010-123', 15, 438, 'enem', 3, 2, 2010, 'multiple_choice', 'Arte e cultura', '“Todas as manhãs quando acordo, experimento um prazer supremo: o de ser Salvador Dalí.”

NÉRET, G. **Salvador Dalí.** Taschen, 1996.

Assim escreveu o pintor dos “relógios moles” e das “girafas em chamas” em 1931. Esse artista excêntrico deu apoio ao general Franco durante a Guerra Civil Espanhola e, por esse motivo, foi afastado do movimento surrealista por seu líder, André Breton. Dessa forma, Dalí criou seu próprio estilo, baseado na interpretação dos sonhos e nos estudos de Sigmund Freud, denominado “método de interpretação paranoico”. Esse método era constituído por textos visuais que demonstram imagens', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 123 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000134', 'ENEM-2010-124', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**Choque a 36 000 km/h**

A faixa que vai de 160 quilômetros de altitude em volta da terra assemelha-se a uma avenida congestionada  onde orbitam 3 000 satélites ativos. Eles disputam espaço com 17 000 fragmentos de artefatos lançados pela  Terra e que se desmancharam – foguetes, satélites desativados e até ferramentas perdidas por astronautas. Com um tráfego celeste tão intenso, era questão de tempo para que acontecesse um acidente de grandes proporções, como o da semana passada. Na terça-feira, dois satélites em órbita desde os anos 90 colidiram em um ponto 790 quilômetros acima da Sibéria. A trombada dos satélites chama a atenção para os riscos que oferece a montanha de lixo espacial em órbita. Como os objetos viajam a grande velocidade, mesmo um  pequeno fragmento de 10 centímetros poderia causar estragos consideráveis no telescópio Hubble ou na estação espacial Internacional — nesse caso pondo em risco a vida dos astronautas que lá trabalham.

**Revista Veja.** 18 set. 2009 (adaptado).

Levando-se em consideração os elementos constitutivos de um texto jornalístico, infere-se que o autor teve como objetivo', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 124 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000135', 'ENEM-2010-125', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**A carreira do crime**

Estudo feito por pesquisadores da Fundação Oswaldo Cruz sobre adolescentes recrutados pelo tráfico de drogas nas favelas cariocas expõe as bases sociais dessas quadrilhas, contribuindo para explicar as dificuldades que o Estado enfrenta no combate ao crime organizado.

O tráfico oferece ao jovem de escolaridade precária (nenhum dos entrevistados havia completado o ensino fundamental) um plano de carreira bem estruturado, com salários que variam de R$ 400,00 a R$ 12.000 mensais. Para uma base de comparação, convém notar que, segundo dados do IBGE de 2001, 59% da população brasileira com mais de dez anos que declara ter uma atividade remunerada ganha no máximo o ‘piso salarial’ oferecido pelo crime. Dos traficantes ouvidos pela pesquisa, 25% recebiam mais de R$ 2.000 mensais; já na população brasileira essa taxa não ultrapassa 6%.

Tais rendimentos mostram que as políticas sociais compensatórias, como o Bolsa-Escola (que paga R$ 15 mensais por aluno matriculado), são por si só incapazes de impedir que o narcotráfico continue aliciando crianças provenientes de estratos de baixa renda: tais políticas aliviam um pouco o orçamento familiar e incentivam os pais a manterem os filhos estudando, o que de modo algum impossibilita a opção pela deliquência. No mesmo sentido, os programas voltados aos jovens vulneráveis ao crime organizado (circo-escola, oficinas de cultura, escolinhas de futebol) são importantes, mas não resolvem o problema.

A única maneira de reduzir a atração exercida pelo tráfico é a repressão, que aumenta os riscos para os que escolhem esse caminho. Os rendimentos pagos aos adolescentes provam isso: eles são elevados precisamente porque a possibilidade de ser preso não é desprezível. É preciso que o Executivo federal e os estaduais desmontem as organizações paralelas erguidas pelas quadrilhas, para que a certeza de punição elimine o fascínio dos salários do crime.

Editorial. **Folha de São Paulo.** 15 jan. 2003.

Com base nos argumentos do autor, o texto aponta para', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 125 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000136', 'ENEM-2010-126', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**A carreira do crime**

Estudo feito por pesquisadores da Fundação Oswaldo Cruz sobre adolescentes recrutados pelo tráfico de drogas nas favelas cariocas expõe as bases sociais dessas quadrilhas, contribuindo para explicar as dificuldades que o Estado enfrenta no combate ao crime organizado.

O tráfico oferece ao jovem de escolaridade precária (nenhum dos entrevistados havia completado o ensino fundamental) um plano de carreira bem estruturado, com salários que variam de R$ 400,00 a R$ 12.000 mensais. Para uma base de comparação, convém notar que, segundo dados do IBGE de 2001, 59% da população brasileira com mais de dez anos que declara ter uma atividade remunerada ganha no máximo o ‘piso salarial’ oferecido pelo crime. Dos traficantes ouvidos pela pesquisa, 25% recebiam mais de R$ 2.000 mensais; já na população brasileira essa taxa não ultrapassa 6%.

Tais rendimentos mostram que as políticas sociais compensatórias, como o Bolsa-Escola (que paga R$ 15 mensais por aluno matriculado), são por si só incapazes de impedir que o narcotráfico continue aliciando crianças provenientes de estratos de baixa renda: tais políticas aliviam um pouco o orçamento familiar e incentivam os pais a manterem os filhos estudando, o que de modo algum impossibilita a opção pela deliquência. No mesmo sentido, os programas voltados aos jovens vulneráveis ao crime organizado (circo-escola, oficinas de cultura, escolinhas de futebol) são importantes, mas não resolvem o problema.

A única maneira de reduzir a atração exercida pelo tráfico é a repressão, que aumenta os riscos para os que escolhem esse caminho. Os rendimentos pagos aos adolescentes provam isso: eles são elevados precisamente porque a possibilidade de ser preso não é desprezível. É preciso que o Executivo federal e os estaduais desmontem as organizações paralelas erguidas pelas quadrilhas, para que a certeza de punição elimine o fascínio dos salários do crime.

Editorial. **Folha de São Paulo.** 15 jan. 2003.

No Editorial, o autor defende a tese de que “as políticas sociais que procuram evitar a entrada dos jovens compensatória que aquela oferecida pelos programas do governo”. Para comprovar sua tese, o autor apresenta', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 126 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000137', 'ENEM-2010-127', 16, 444, 'enem', 3, 2, 2010, 'multiple_choice', 'Corpo, esporte e saúde', 'Venho solicitar a clarividente atenção de Vossa Excelência para que seja conjurada uma calamidade que está  prestes a desabar em cima da juventude feminina do Brasil. Refiro-me, senhor presidente, ao movimento entusiasta que está empolgando centenas de moças, atraindo-as para se transformarem em jogadoras de futebol, sem se levar em conta que a mulher não poderá praticar este esporte violento sem afetar, seriamente, o equilíbrio fisiológicos de suas funções orgânicas, devido à natureza que dispôs a ser mãe, Ao que dizem os jornais, no Rio de Janeiro, já estão formados nada menos de dez quadros femininos. Em São Paulo e Belo Horizonte também já estão se constituindo outros. E, neste crescendo, dentro de um ano, é provável que em  todo o Brasil estejam organizados uns 200 clubes femininos de futebol: ou seja: 200 núcleos destroçados da  saúde de 2,2 mil futuras mães, que, além do mais, ficarão presas a uma mentalidade depressiva e propensa aos exibicionismos rudes e extravagantes.

Coluna Pênalti. **Carta Capital.** 28 abr. 2010.

O trecho é parte de uma carta de um cidadão brasileiro, José Fuzeira, encaminhada, em abril de 1940, ao então presidente da República Getúlio Vargas. As opções linguísticas de Fuzueira mostram que seu texto foi elaborado em linguagem', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 127 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000138', 'ENEM-2010-128', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**Capítulo III**

Um criado trouxe o café. Rubião pegou na xícara e, enquanto lhe deitava açúcar, ia disfarçadamente mirando  a bandeja, que era de prata lavrada. Prata, ouro, eram os metais que amava de coração; não gostava de  bronze, mas o amigo Palha disse-lhe que era matéria de preço, e assim se explica este par de figuras que esta aqui na sala: um Mefistófeles e um Fausto. Tivesse, porém, de escolher, escolheria a bandeja – primor de argentaria, execução fina  e acabada. O criado esperava teso e sério. Era espanhol; e não foi sem resistência  que Rubião o aceitou das mãos de Cristiano; por mais que lhe dissesse que estava acostumado aos seus crioulos de Minas, e não queria línguas estrangeiras em casa, o amigo Palha insistiu, demonstrando-lhe a  necessidade de ter criados brancos. Rubião cedeu com pena. O seu bom pajem, que ele queria pôr na sala, como um pedaço da província, nem pôde deixar na cozinha, onde reinava um francês, Jean; foi degradado a outros serviços.

ASSIS, M. Quincas Borba. In: **Obra completa**. V.1. Rio de Janeiro: Nova Aguilar, 1993 (fragmento).

Quincas Borba situa-se entre as obras-primas do autor e da literatura brasileira. No fragmento apresentado, a peculiaridade do texto que garante a universalização de sua abordagem reside', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 128 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000139', 'ENEM-2010-129', 11, 442, 'enem', 3, 2, 2010, 'multiple_choice', 'Escolas e textos literários', '**Negrinha  
**

Negrinha era uma pobre órfã de sete anos. Preta? Não; fusca, mulatinha escura, de cabelos ruços e olhos assustados.  
Nascera na senzala, de mãe escrava, e seus primeiros anos vivera-os pelos cantos escuros da cozinha, sobre velha esteira e trapos imundos. Sempre escondida, que a patroa não gostava de crianças.  
Excelente senhora, a patroa. Gorda, rica, dona do mundo, amimada dos padres, com lugar certo na igreja e  camarote de luxo reservado no céu. Entaladas as banhas no trono (uma cadeira de balanço na sala de jantar),  ali bordava, recebia as amigas e o vigário, dando audiências, discutindo o tempo. Uma virtuosa senhora em  suma – “dama de grandes virtudes apostólicas, esteio da religião e da moral”, dizia o reverendo.  
Ótima, a dona Inácia.  
Mas não admitia choro de criança. Ai! Punha-lhe os nervos em carne viva.  
\[…\]  
A excelente dona Inácia era mestra na arte de judiar de crianças. Vinha da escravidão, fora senhora de escravos – e daquelas ferozes, amigas de ouvir cantar o bolo e zera ao regime novo – essa indecência de negro igual.

LOBATO, M. Negrinha. In: MORICONE, I. **Os cem melhores contos brasileiros do século.** Rio de Janeiro: Objetiva, 2000 (fragmento).

A narrativa focaliza um momento histórico-social de valores contraditórios. Essa contradição infere-se, no contexto, pela', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 129 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000013a', 'ENEM-2010-130', 16, 444, 'enem', 3, 2, 2010, 'multiple_choice', 'Corpo, esporte e saúde', 'O Flamengo começou a partida no ataque, **enquanto** o Botafogo procurava fazer uma forte marcação no meio campo e tentar lançamentos para Victor Simões, isolado entre os zagueiros rubro-negros. **Mesmo** com mais posse de bola, o time dirigido por Cuca tinha grande dificuldade de chegar à área alvinegra **por causa do** bloqueio montado pelo Botafogo na frente da sua área.

**No entanto**, na primeira chance rubro-negra, saiu o gol. **Após** cruzamento da direita de Ibson, a zaga alvinegra rebateu a bola de cabeça para o meio da área. Kléberson apareceu na jogada e cabeceou por cima do goleiro Renan. Ronaldo Angelim apareceu nas costas da defesa e empurrou para o fundo da rede quase que em cima da linha: Flamengo 1 a 0.

Disponível em: http://momentodofutebol.blogspot.com (adaptado).

O texto, que narra uma parte do jogo final do Campeonato Carioca de futebol, realizado em 2009, contém vários conectivos, sendo que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 130 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000013b', 'ENEM-2010-131', 15, 438, 'enem', 3, 2, 2010, 'multiple_choice', 'Arte e cultura', 'Após estudar na Europa, Anita Malfatti retornou ao Brasil com uma mostra que abalou a cultura nacional do início do século XX. Elogiada por seus mestres na Europa, Anita se considerava pronta para mostrar seu trabalho no Brasil, mas enfrentou as duras críticas de Monteiro Lobato. Com a intenção de criar uma arte que valorizasse a cultura brasileira, Anita Malfatti e outros artistas modernistas', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 131 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000013c', 'ENEM-2010-132', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2010/132-994f2dab.webp)

Segundo pesquisas recentes, é irrelevante a diferença entre sexos para se avaliar a inteligência. Com relação às tendências para áreas do conhecimento, por sexo, levando em conta a matrícula em cursos universitários brasileiros,', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 132 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000013d', 'ENEM-2010-133', 15, 438, 'enem', 3, 2, 2010, 'multiple_choice', 'Arte e cultura', 'É muito raro que um novo modo de comunicação ou de expressão suplante completamente os anteriores. Fala- se menos desde que a escrita foi inventada? Claro que não. Contudo, a função da palavra viva mudou, uma parte de suas missões nas culturas puramente orais tendo sido preenchida pela escrita: transmissão dos conhecimentos e das narrativas, estabelecimento de contratos, realização dos principais atos rituais ou sociais etc. Novos estilos de conhecimento (o conhecimento “teórico”, por exemplo) e novos gêneros (o código de leis, o romance etc.) surgiram. A escrita não fez com que a o sistema da comunicação e da memória social.

A fotografia substituiu a pintura? Não, ainda há pintores ativos. As pessoas continuam, mais do que nunca, a visitar museus, exposições e galerias, compram as obras dos artistas para pendurá-las em casa. Em contrapartida, é verdade que os pintores, os desenhistas, os gravadores, os escultores não são mais – como foram até o século XIX – os únicos produtores de imagens.

LÉVY, P. **Cibercultura**. São Paulo: Ed. 34, 1999 (fragmento).

A substituição pura e simples do antigo pelo novo ou do natural pelo técnico tem sido motivo de preocupação de muita gente. O texto encaminha uma discussão em torno desse temor ao', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 133 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000013e', 'ENEM-2010-134', 11, 442, 'enem', 3, 2, 2010, 'multiple_choice', 'Escolas e textos literários', '**Texto I  
**  
Eu amo a rua. Esse sentimento de natureza toda íntima não vos seria revelado por mim se não julgasse, e  razões não tivesse para julgar, que este amor assim absoluto e assim exagerado é partilhado por todos vós.  Nós somos irmãos, nós nos sentimos parecidos e iguais; nas cidades, nas aldeias, nos povoados, não porque  soframos, com a dor e os desprazeres, a lei e a polícia, mas porque nos une, nivela e agremia o amor da rua.  É este mesmo o sentimento imperturbável e indissolúvel, o único que, como a própria vida, resiste às idades e  às épocas.

RIO, J. A rua. In: **A alma encantadora das ruas.** São Paulo: Companhia das Letras, 2008 (fragmento).

**Texto II**

A rua dava-lhe uma força de fisionomia, mais consciência dela. Como se sentia estar no seu reino, na região  em que era rainha e imperatriz. O olhar cobiçoso dos homens e o de inveja das mulheres acabavam o  sentimento de sua personalidade, exaltavam-no até. Dirigiu-se para a rua do Catete com o seu passo miúdo e  sólido. \[…\] No caminho trocou cumprimento com as raparigas pobres de uma casa de cômodos da vizinhaça.  
\[…\] E debaixo dos olhares maravilhados das pobres raparigas, ela continuou o seu caminho, arrepanhando a saia, satisfeita que nem uma duquesa atravessando os seus domínios.

BARRETO, L. Um e outro. In: **Clara dos anjos.** Rio de Janeiro: Editora Mérito (fragmento).

A experiência urbana é um tema recorrente em crônicas, contos e romances do final do século XIX  e início do XX, muitos dos quais elegem a rua para explorar essa experiência. Nos fragmentos I e II, a rua é vista, respectivamente, como lugar que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 134 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000013f', 'ENEM-2010-135', 1, 439, 'enem', 3, 2, 2010, 'multiple_choice', 'Compreensão e interpretação', '**Fora da ordem  
**

Em 1588, o engenheiro militar italiano Agostinho Romelli publicou Le Diverse et Artificiose Machine, no qual descrevia uma máquina de ler livros. Montada para girar verticalmente, como uma roda de hamster, a  invenção permitia que o leitor fosse de um texto ao outro sem se levantar de sua cadeira.

Hoje podemos alternar entre documentos com muito mais facilidade – um clique no mouse é suficiente para acessarmos imagens, textos, vídeos e sons instantaneamente. Para isso, usamos o computador, e  principalmente a internet – tecnologias que não estavam disponíveis no Renascimento, época em que Romelli viveu.

BERCITTO, D. **Revista Língua Portuguesa**. Ano II. N°14.

O inventor italiano antecipou, no século XVI, um dos princípios definidores do hipertexto: a quebra de linearidade na leitura e a possibilidade de acesso ao texto conforme o interesse do leitor. Além de ser característica essencial da internet, do ponto de vista da produção do texto, a hipertextualidade se manifesta  também em textos impressos, como', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 135 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000140', 'ENEM-2010-136', 3, 447, 'enem', 3, 2, 2010, 'multiple_choice', 'Porcentagem e juros', '![](conteudo/enem/2010/136-47193c33.webp)

Algum tempo depois, o professor apagou a lousa por completo e, adotando um procedimento semelhante ao anterior, voltou a preenchê-la, mas, dessa vez, utilizando 40% do espaço dela.

Uma representação possível para essa segunda situação é', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 136 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000141', 'ENEM-2010-137', 3, 446, 'enem', 3, 2, 2010, 'multiple_choice', 'Escalas, unidades e proporção', 'No monte de Cerro Armazones, no deserto de Atacama, no Chile, ficará o maior telescópio da superfície terrestre, o Telescópio Europeu Extremamente Grande (E-ELT). O E-ELT terá um espelho primário de 42 m de diâmetro, “o maior olho do mundo voltado para o céu”.

Disponível em: http://www.estadao.com.br. Acesso em: 27 abr. 2010 (adaptado).

Ao ler esse texto em uma sala de aula, uma professora fez uma suposição de que o diâmetro do olho humano mede aproximadamente 2,1 cm.

Qual a razão entre o diâmetro aproximado do olho humano, suposto pela professora, e o diâmetro do espelho primário do telescópio citado?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 137 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000142', 'ENEM-2010-138', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', '![](conteudo/enem/2010/138-45398e2b.webp)

Considerando que nenhum dos recipientes tenha tampa, qual das figuras a seguir representa uma planificação para o bebedouro 3?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 138 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000143', 'ENEM-2010-139', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', 'Uma fábrica produz barras de chocolates no formato de paralelepípedos e de cubos, com o mesmo volume. As arestas da barra de chocolate no formato de paralelepípedo medem 3 cm de largura, 18 cm de comprimento e 4 cm de espessura.

Analisando as características das figuras geométricas descritas, a medida das arestas dos chocolates que têm o formato de cubo é igual a', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 139 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000144', 'ENEM-2010-140', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', '![](conteudo/enem/2010/140-1976055e.webp)

Se o Brasil tivesse obtido mais 4 medalhas de ouro, 4 de prata e 10 de bronze, sem alteração no número de medalhas dos demais países mostrados no quadro, qual teria sido a classificação brasileira no quadro de medalhas das Olimpíadas de 2004?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 140 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000145', 'ENEM-2010-141', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', '![](conteudo/enem/2010/141-97f889c7.webp)

Supondo-se que, no Sudeste, 14 900 estudantes foram entrevistados nessa pesquisa, quantos deles possuíam telefone móvel celular?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 141 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000146', 'ENEM-2010-142', 3, 105, 'enem', 3, 2, 2010, 'multiple_choice', 'Média, moda e mediana', 'Acompanhando o crescimento do filho, um casal constatou que, de 0 a 10 anos, a variação da sua altura se dava de forma mais rápida do que dos 10 aos 17 anos e, a partir de 17 anos, essa variação passava a ser cada vez menor, até se tornar imperceptível. Para ilustrar essa situação, esse casal fez um gráfico relacionando as alturas do filho nas idades consideradas.

Qual gráfico melhor representa a altura do filho desse casal em função da idade?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 142 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000147', 'ENEM-2010-143', 3, 447, 'enem', 3, 2, 2010, 'multiple_choice', 'Porcentagem e juros', '![](conteudo/enem/2010/143-2d869c09.webp)

Considerando-se que até 2009 o desmatamento cresceu 10,5% em relação aos dados de 2004, o desmatamento médio por estado em 2009 está entre', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 143 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000148', 'ENEM-2010-144', 3, 448, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria plana e áreas', '![](conteudo/enem/2010/144-e6f27641.webp)

As figuras mostram que as proporcionalidades existentes entre resistência (R) e comprimento (ℓ), resistência (R) e área da secção transversal (A), e entre comprimento (ℓ) e área da secção transversal (A) são, respectivamente,', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 144 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000149', 'ENEM-2010-145', 3, 446, 'enem', 3, 2, 2010, 'multiple_choice', 'Escalas, unidades e proporção', '![](conteudo/enem/2010/145-d6f3efc6.webp)

Supondo que o total de pessoas pesquisadas na região metropolitana de Porto Alegre equivale a 250 000, o número de desempregados em março de 2010, nessa região, foi de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 145 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000014a', 'ENEM-2010-146', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', '![](conteudo/enem/2010/146-217b7bc8.webp)

O produto das três dimensões indicadas na peça resultaria na medida da grandeza', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 146 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000014b', 'ENEM-2010-147', 3, 453, 'enem', 3, 2, 2010, 'multiple_choice', 'Probabilidade', '![](conteudo/enem/2010/147-2db13f00.webp)

Paula deseja se deslocar da cidade A para a cidade B usando exatamente duas das vias indicadas, percorrendo um trajeto com a menor probabilidade de engarrafamento possível. O melhor trajeto para Paula é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 147 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000014c', 'ENEM-2010-148', 3, 105, 'enem', 3, 2, 2010, 'multiple_choice', 'Média, moda e mediana', '![](conteudo/enem/2010/148-210f09db.webp)

Com base no gráfico, o gasto militar no ínicio da guerra no Iraque foi de', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 148 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000014d', 'ENEM-2010-149', 3, 448, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria plana e áreas', '![](conteudo/enem/2010/149-fce5e898.webp)

Que expressão fornece a quantidade de quadrados de cada figura?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 149 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000014e', 'ENEM-2010-150', 3, 448, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria plana e áreas', 'A loja Telas & Molduras cobra 20 reais por metro quadrado de tela, 15 reais por metro linear de moldura, mais uma taxa fixa de entrega de 10 reais. Uma artista plástica precisa encomendar telas e molduras a essa loja, suficientes para 8 quadros retangulares (25 cm × 50 cm). Em seguida, fez uma segunda encomenda, mas agora para 8 quadros retangulares (50 cm × 100 cm).

O valor da segunda encomenda será', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 150 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000014f', 'ENEM-2010-151', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', '![](conteudo/enem/2010/151-87ef13a2.webp)

Com o objetivo de não desperdiçar café, a diarista deseja colocar a quantidade mínima de água na leiteira para encher os vinte copinhos pela metade.

Para que isso ocorra, Dona Maria deverá', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 151 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000150', 'ENEM-2010-152', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', '![](conteudo/enem/2010/152-3b16b42f.webp)

Um cientista monitora o movimento desse satélite para controlar o seu afastamento do centro da Terra. Para isso, ele precisa calcular a soma dos valores de r, no apogeu e no perigeu, representada por S.

O cientista deveria concluir que, periodicamente, S atinge o valor de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 152 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000151', 'ENEM-2010-153', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', '![](conteudo/enem/2010/153-7db49675.webp)

Qual dos tanques deverá ser escolhido pelo dono do posto? (Considere p π ≅ 3)', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 153 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000152', 'ENEM-2010-154', 3, 447, 'enem', 3, 2, 2010, 'multiple_choice', 'Porcentagem e juros', 'Uma empresa possui um sistema de controle de qualidade que classifica o seu desempenho financeiro anual, tendo como base o do ano anterior. Os conceitos são: insuficiente, quando o crescimento é menor que 1%; regular, quando o crescimento é maior ou igual a 1% e menor que 5%; bom, quando o crescimento é maior ou igual a 5% e menor que 10%; ótimo, quando é maior ou igual a 10% e menor que 20%; e excelente, quando é maior ou igual a 20%. Essa empresa apresentou lucro de R$132000,00 em 2008 e de R$145000,00 em 2009.

De acordo com esse sistema de controle de qualidade, o desempenho financeiro dessa empresa no ano de 2009 deve ser considerado', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 154 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000153', 'ENEM-2010-155', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', 'Uma escola recebeu do governo uma verba de R$ 1000,00 para enviar dois tipos de folhetos pelo correio. O diretor da escola pesquisou que tipos de selos deveriam ser utilizados. Concluiu que, para o primeiro tipo de folheto, bastava um selo de R$ 0,65 enquanto para folhetos do segundo tipo seriam necessários três selos, um de R$ 0,65, um de R$ 0,60 e um de R$ 0,20. O diretor solicitou que se comprassem selos de modo que fossem postados exatamente 500 folhetos do segundo tipo e uma quantidade restante de selos que permitisse o envio do máximo possível de folhetos do primeiro tipo.

Quantos selos de R$ 0,65 foram comprados?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 155 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000154', 'ENEM-2010-156', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', '![](conteudo/enem/2010/156-52ff9fbe.webp)

Um pequeno helicóptero usado para reconhecimento sobrevoa a região a partir do ponto X = (20; 60). O helicóptero segue o percurso:

0,8°L→0,5°N→0,2°O→0,1°S→0,4°N→0,3°L

Ao final, desce verticalmente até pousar no solo.

De acordo com as orientações, o helicóptero pousou em um local cuja altitude é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 156 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000155', 'ENEM-2010-157', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', 'Para construir uma manilha de esgoto, um cilindro com 2 m de diâmetro e 4 m de altura (de espessura desprezível), foi envolvido homogeneamente por uma camada de concreto, contendo 20 cm de espessura.

Supondo que cada metro cúbico de concreto custe R$ 10,00 e tomando 3,1 como valor aproximado de π, então o preço dessa manilha é igual a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 157 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000156', 'ENEM-2010-158', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', '![](conteudo/enem/2010/158-20a4e763.webp)

Um técnico em manejo florestal recebeu a missão de cubar, abater e transportar cinco toras de madeira, de  
duas espécies diferentes, sendo

• 3 toras da espécie I, com 3 m de rodo, 12 m de comprimento e densidade 0,77 toneladas/m³;  
• 2 toras da espécie II, com 4 m de rodo, 10 m de comprimento e densidade 0,78 toneladas/m³.

Após realizar seus cálculos, o técnico solicitou que enviassem caminhões para transportar uma carga de, aproximadamente,', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2010 · 2º dia · Questão 158 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000157', 'ENEM-2010-159', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', '![](conteudo/enem/2010/159-d9f06afe.webp)

Se uma menina, com 64 kg de massa, apresenta IMC igual a 25 kg/m2, então ela possui RIP igual a', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 159 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000158', 'ENEM-2010-160', 3, 448, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria plana e áreas', 'Um balão atmosférico, lançado em Bauru (343 quilômetros a Noroeste de São Paulo), na noite do último domingo, caiu nesta segunda-feira em Cuiabá Paulista, na região de Presidente Prudente, assustando agricultores da região. O artefato faz parte do programa Projeto Hibiscus, desenvolvido por Brasil, França, Argentina, Inglaterra e Itália, para a medição do comportamento da camada de ozônio, e sua descida se deu após o cumprimento do tempo previsto de medição.

Disponível em: http://www.correiodobrasil.com.br. Acesso em: 02 maio 2010.

![](conteudo/enem/2010/160-1f3ac874.webp)

Na data do acontecido, duas pessoas avistaram o balão. Uma estava a 1,8 km da posição vertical do balão e o avistou sob um ângulo de 60º; a outra estava a 5,5 km da posição vertical do balão, alinhada com a primeira, e no mesmo sentido, conforme se vê na figura, e o avistou sob um ângulo de 30º.

Qual a altura aproximada em que se encontrava o balão?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 160 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000159', 'ENEM-2010-161', 3, 448, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria plana e áreas', 'Em canteiros de obras de construção civil é comum perceber trabalhadores realizando medidas de comprimento e de ângulos e fazendo demarcações por onde a obra deve começar ou se erguer. Em um desses canteiros foram feitas algumas marcas no chão plano. Foi possível perceber que, das seis estacas colocadas, três eram vértices de um triângulo retângulo e as outras três eram os pontos médios dos lados desse triângulo, foram indicadas por letras.

![](conteudo/enem/2010/161-93aaf9bb.webp)

A região demarcada pelas estacas A, B, M e N deveria ser calçada com concreto.

Nessas condições, a área a ser calçada corresponde', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 161 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000015a', 'ENEM-2010-162', 3, 448, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria plana e áreas', 'O jornal de certa cidade publicou em uma página inteira a seguinte divulgação de seu caderno de classificados

![](conteudo/enem/2010/162-3a48f3aa.webp)

Para que a propaganda seja fidedigna à porcentagem da área que aparece na divulgação, a medida do lado do retângulo que representa os 4%, deve ser de aproximadamente', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 162 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000015b', 'ENEM-2010-163', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', 'A ideia de usar rolos circulares para deslocar objetos pesados provavelmente surgiu com os antigos egípcios ao construírem as pirâmides.

![](conteudo/enem/2010/163-ad5073a3.webp)

Representando por R o raio da base dos rolos cilíndricos, em metros, a expressão do deslocamento horizontal y do bloco de pedra em função de R, após o rolo ter dado uma volta completa sem deslizar, é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 163 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000015c', 'ENEM-2010-164', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', 'Uma metalúrgica recebeu uma encomenda para fabricar, em grande quantidade, uma peça com o formato de um prisma reto com base triangular, cujas dimensões da base são 6 cm, 8 cm e 10 cm e cuja altura é 10 cm. Tal peça deve ser vazada de tal maneira que a perfuração na forma de um cilindro circular reto seja tangente às suas faces laterais, conforme mostra a figura.

![](conteudo/enem/2010/164-d7f10275.webp)

O raio da perfuração da peça é igual a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 164 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000015d', 'ENEM-2010-165', 3, 452, 'enem', 3, 2, 2010, 'multiple_choice', 'Funções e gráficos', 'Nos processos industriais, como na indústria de cerâmica, é necessário o uso de fornos capazes de produzir elevadas temperaturas e, em muitas situações, o tempo de elevação dessa temperatura deve ser controlado, para garantir a qualidade do produto final e a economia no processo. Em uma indústria de cerâmica, o forno é programado para elevar a temperatura ao longo do tempo de acordo com a função

![](conteudo/enem/2010/165-fc2955c9.webp)

em que T é o valor da temperatura atingida pelo forno, em graus Celsius, e t é o tempo, em minutos, decorrido desde o instante em que o forno é ligado.  
Uma peça deve ser colocada nesse forno quando a temperatura for 48°C e retirada quando a temperatura for  
200°C.

O tempo de permanência dessa peça no forno é, em minutos, igual a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 165 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000015e', 'ENEM-2010-166', 3, 451, 'enem', 3, 2, 2010, 'multiple_choice', 'Números e operações', 'O gráfico mostra o número de favelas no município do Rio de Janeiro entre 1980 e 2004, considerando que a variação nesse número entre os anos considerados é linear.

![](conteudo/enem/2010/166-37362de0.webp)

Se o padrão na variação do período 2004/2010 se mantiver nos próximos 6 anos, e sabendo que o número de favelas em 2010 é 968, então o número de favelas em 2016 será', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 166 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000015f', 'ENEM-2010-167', 3, 105, 'enem', 3, 2, 2010, 'multiple_choice', 'Média, moda e mediana', 'O gráfico apresenta a quantidade de gols marcados pelos artilheiros das Copas do Mundo desde a Copa de 1930 até a de 2006.

![](conteudo/enem/2010/167-62dd2345.webp)

A partir dos dados apresentados, qual a mediana das quantidades de gols marcados pelos artilheiros das Copas do Mundo?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 167 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000160', 'ENEM-2010-168', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', 'Em um casamento, os donos da festa serviam champanhe aos seus convidados em taças com formato de um hemisfério (Figura 1), porém um acidente na cozinha culminou na quebra de grande parte desses recipientes. Para substituir as taças quebradas, utilizou-se um outro tipo com formato de cone (Figura 2). No entanto, os noivos solicitaram que o volume de champanhe nos dois tipos de taças fosse igual.

![](conteudo/enem/2010/168-ee7ccd75.webp)

Considere:

![imagem (Foto: Reprodução/Enem)](https://enem.dev/2010/questions/168/60c7f391-a434-4c90-8ae8-21a21edec1f1.png "imagem (Foto: Reprodução/Enem)")

Sabendo que a taça com o formato de hemisfério é servida completamente cheia, a altura do volume de champanhe que deve ser colocado na outra taça, em centímetros, é de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 168 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000161', 'ENEM-2010-169', 3, 105, 'enem', 3, 2, 2010, 'multiple_choice', 'Média, moda e mediana', 'O Salto Triplo é uma modalidade do atletismo em que o atleta dá um salto em um só pé, uma passada e um salto, nessa ordem. Sendo que o salto com impulsão em um só pé será feito de modo que o atleta caia primeiro sobre o mesmo pé que deu a implusão; na passada ele cairá com o outro pé, do qual o salto é realizado.

Disponível em: www.cbat.org.br (adaptado).

Um atleta da modalidade Salto Triplo, depois de estudar seus movimentos, percebeu que, do segundo para o primeiro salto, o alcance diminuía em 1,2 m, e, do terceiro para o segundo salto, o alcance diminuía 1,5 m.
Querendo atingir a meta de 17,4 m nessa prova e considerando os seus estudos, a distância alcançada no primeiro salto teria de estar entre', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 169 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000162', 'ENEM-2010-170', 3, 105, 'enem', 3, 2, 2010, 'multiple_choice', 'Média, moda e mediana', 'Marco e Paulo foram classificados em um concurso. Para classificação no concurso o candidato deveria obter média aritmética na pontuação igual ou superior a 14. Em caso de empate na média, o desempate seria em favor da pontuação mais regular. No quadro a seguir são apresentados os pontos obtidos nas provas de Matemática, Português e Conhecimentos Gerais, a média, a mediana e o desvio padrão dos dois candidatos.  
Dados dos candidatos no concurso

![](conteudo/enem/2010/170-b91052ca.webp)

O candidato com pontuação mais regular, portanto mais bem classificado no concurso, é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 170 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000163', 'ENEM-2010-171', 3, 447, 'enem', 3, 2, 2010, 'multiple_choice', 'Porcentagem e juros', 'Um grupo de pacientes com Hepatite C foi submetido a um tratamento tradicional em que 40% desses pacientes foram completamente curados. Os pacientes que não obtiveram cura foram distribuídos em dois grupos de mesma quantidade e submetidos a dois tratamentos inovadores. No primeiro tratamento inovador, 35% dos pacientes foram curados e, no segundo, 45%.

Em relação aos pacientes submetidos inicialmente, os tratamentos inovadores proporcionaram cura de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 171 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000164', 'ENEM-2010-172', 3, 447, 'enem', 3, 2, 2010, 'multiple_choice', 'Porcentagem e juros', 'Em 2006, a produção mundial de etanol foi de 40 bilhões de litros e a de biodiesel, de 6,5 bilhões. Neste mesmo ano, a produção brasileira de etanol correspondeu a 43% da produção mundial, ao passo que a produção dos Estados Unidos da América, usando milho, foi de 45%.

Disponível em: planetasustentavel.abril.com.br.Acesso em: 02 maio 2009.

Considerando que, em 2009, a produção mundial de etanol seja a mesma de 2006 e que os Estados Unidos produzirão somente a metade de sua produção de 2006, para que o total produzido pelo Brasil e pelos Estados Unidos continue correspondendo a 88% da produção mundial, o Brasil deve aumentar sua produção em, aproximadamente,', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2010 · 2º dia · Questão 172 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000165', 'ENEM-2010-173', 3, 468, 'enem', 3, 2, 2010, 'multiple_choice', 'Progressões', 'João mora na cidade A e precisa visitar cinco clientes, localizados em cidades diferentes da sua. Cada trajeto possível pode ser representado por uma sequência de 7 letras. Por exemplo, o trajeto ABCDEFA, informa que ele sairá da cidade A, visitando as cidades B, C, D, E e F nesta ordem, voltando para a cidade A. Além disso, o número indicado entre as letras informa o custo do deslocamento entre as cidades. A figura mostra o custo de deslocamento entre cada uma das cidades.

![](conteudo/enem/2010/173-32cafe03.webp)

Como João quer economizar, ele precisa determinar qual o trajeto de menor custo para visitar os cinco clientes. somente parte das sequências, pois os trajetos ABCDEFA e AFEDCBA têm o mesmo custo. Ele gasta 1min30s para examinar uma sequência e descartar sua simétrica, conforme apresentado.

O tempo mínimo necessário para João verificar todas as sequências possíveis no problema é de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 173 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000166', 'ENEM-2010-174', 3, 105, 'enem', 3, 2, 2010, 'multiple_choice', 'Média, moda e mediana', 'O diretor de um colégio leu numa revista que os pés das mulheres estavam aumentando. Há alguns anos, a média do tamanho dos calçados das mulheres era de 35,5 e, hoje, é de 37,0. Embora não fosse uma informação científica, ele ficou curioso e fez uma pesquisa com as funcionárias do seu colégio, obtendo o quadro a seguir:

![](conteudo/enem/2010/174-9b2b5d30.webp)

Escolhendo uma funcionária ao acaso e sabendo que ela tem calçado maior que 36,0 a probabilidade de ela calçar 38,0 é', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 174 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000167', 'ENEM-2010-175', 3, 105, 'enem', 3, 2, 2010, 'multiple_choice', 'Média, moda e mediana', 'O quadro seguinte mostra o desempenho de um time de futebol no último campeonato. A coluna da esquerda mostra o número de gols marcados e a coluna da direita informa em quantos jogos o time marcou aquele número de gols.

![](conteudo/enem/2010/175-47a384a9.webp)

Se X, Y e Z são, respectivamente, a média, a mediana e a moda desta distribuição, então', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 175 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000168', 'ENEM-2010-176', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', 'A disparidade de volume entre os planetas é tão grande que seria possível colocá-los uns dentro dos outros. O planeta Mercúrio é o menor de todos. Marte é o segundo menor: dentro dele cabem três Mercúrios. Terra é o único com vida: dentro dela cabem sete Martes. Netuno é o quarto maior: dentro dele cabem 58 Terras. Júpiter é o maior dos planetas: dentro dele cabem 23 Netunos.

**Revista Veja.** Ano 41, no 25, 25 jun. 2008 (adaptado).

Seguindo o raciocínio proposto, quantas Terras cabem dentro de Júpiter?', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2010 · 2º dia · Questão 176 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000169', 'ENEM-2010-177', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', 'Um dos grandes problemas da poluição dos mananciais (rios, córregos e outros) ocorre pelo hábito de jogar óleo utilizado em frituras nos encanamentos que estão interligados com o sistema de esgoto. Se isso ocorrer, cada 10 litros de óleo poderão contaminar 10 milhões (107) de litros de água potável.

Manual de etiqueta. Parte integrante das revistas Veja (ed. 2055), Cláudia (ed. 555), _National Geographic_ (ed. 93) e _Nova Escola_ (ed. 208) (adaptado).

Suponha que todas as famílias de uma cidade descartem os óleos de frituras através dos encanamentos e consomem 1 000 litros de óleo em frituras por semana.

Qual seria, em litros, a quantidade de água potável contaminada por semana nessa cidade?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 177 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000016a', 'ENEM-2010-178', 3, 449, 'enem', 3, 2, 2010, 'multiple_choice', 'Geometria espacial e volumes', 'Um porta-lápis de madeira foi construído no formato cúbico, seguindo o modelo ilustrado a seguir. O cubo de dentro é vazio. A aresta do cubo maior mede 12 cm e a do cubo menor, que é interno, mede 8 cm.

![](conteudo/enem/2010/178-f167ae80.webp)

O volume de madeira utilizado na confecção desse objeto foi de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 178 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000016b', 'ENEM-2010-179', 3, 468, 'enem', 3, 2, 2010, 'multiple_choice', 'Progressões', 'Ronaldo é um garoto que adora brincar com números. Numa dessas brincadeiras, empilhou caixas numeradas de acordo com a sequência conforme mostrada no esquema a seguir.

![](conteudo/enem/2010/179-0fc82f4a.webp)

Ele percebeu que a soma dos números em cada linha tinha uma propriedade e que, por meio dessa propriedade, era possível prever a soma de qualquer linha posterior às já construídas.

A partir dessa propriedade, qual será a soma da 9a linha da sequência de caixas empilhadas por Ronaldo?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2010 · 2º dia · Questão 179 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000016c', 'ENEM-2010-180', 3, 105, 'enem', 3, 2, 2010, 'multiple_choice', 'Média, moda e mediana', 'Para conseguir chegar a um número recorde de produção de ovos de Páscoa, as empresas brasileiras começam a se planejar para esse período com um ano de ovos de Páscoa produzidos no Brasil no período de 2005 a 2009.

![](conteudo/enem/2010/180-b3a08efa.webp)

De acordo com o gráfico, o biênio que apresentou maior produção acumulada foi', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2010 · 2º dia · Questão 180 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000016d', 'ENEM-2011-001', 9, 431, 'enem', 3, 2, 2011, 'multiple_choice', 'Migrações e demografia', 'No mundo árabe, países governados há décadas por regimes políticos centralizadores contabilizam metade da população com menos de 30 anos; desses, 56% têm acesso à internet. Sentindo-se sem perspectivas de futuro e diante da estagnação da economia, esses jovens incubam vírus sedentos por modernidade e democracia. Em meados de dezembro, um tunisiano  
de 26 anos, vendedor de frutas, põe fogo no próprio corpo em protesto por trabalho, justiça e liberdade. Uma série de manifestações eclode na Tunísia e, como uma epidemia, o vírus libertário começa a se espalhar pelos países vizinhos, derrubando em seguida o presidente do Egito, Hosni Mubarak. Sites e redes sociais – como o Facebook e o Twitter – ajudaram a mobilizar manifestantes do norte da África a ilhas do Golfo Pérsico.

SEQUEIRA, C. D.; VILLAMÉA, L. A epidemia da Liberdade. Istoé Internacional. 2 mar. 2011 (adaptado).

Considerando os movimentos políticos mencionados no texto, o acesso à internet permitiu aos jovens árabes', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 1 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000016e', 'ENEM-2011-002', 13, 428, 'enem', 3, 2, 2011, 'multiple_choice', 'Ética, moral e conhecimento', 'O brasileiro tem noção clara dos comportamentos éticos e morais adequados, mas vive sob o espectro da corrupção, revela pesquisa. Se o país fosse resultado dos padrões morais que as pessoas dizem aprovar, pareceria mais com a Escandinávia do que com Bruzundanga (corrompida nação fictícia de Lima Barreto).

FRAGA, P. **Ninguém é inocente.** Folha de S. Paulo, 4 out. 2009 (adaptado).

O distanciamento entre “reconhecer” e “cumprir” efetivamente o que é moral constitui uma ambiguidade inerente ao humano, porque as normas morais são', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 2 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000016f', 'ENEM-2011-003', 8, 458, 'enem', 3, 2, 2011, 'multiple_choice', 'Ditadura e redemocratização', '![](conteudo/enem/2011/3-4f4821ed.webp)

Disponível em: http://www1.folha.uol.com.br. Acesso em: 17 abr. 2010 (adaptado). (Foto: Reprodução/Enem)

O movimento representado na imagem, do início dos anos de 1990, arrebatou milhares de jovens no Brasil.

Nesse contexto, a juventude, movida por um forte sentimento cívico,', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 3 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000170', 'ENEM-2011-004', 9, 426, 'enem', 3, 2, 2011, 'multiple_choice', 'Questões ambientais', 'A Floresta Amazônica, com toda a sua imensidão, não vai estar aí para sempre. Foi preciso alcançar toda essa taxa de desmatamento de quase 20 mil quilômetros quadrados ao ano, na última década do século XX, para que uma pequena parcela de brasileiros se desse conta de que o maior patrimônio natural do país está sendo torrado.

AB’SABER, A. Amazônia: do discurso à práxis. São Paulo: EdUSP, 1996.

Um processo econômico que tem contribuído na atualidade para acelerar o problema ambiental descrito é:', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 4 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000171', 'ENEM-2011-005', 9, 426, 'enem', 3, 2, 2011, 'multiple_choice', 'Questões ambientais', 'O Centro-Oeste apresentou-se como extremamente receptivo aos novos fenômenos da urbanização, já que era praticamente virgem, não possuindo infraestrutura de monta, nem outros investimentos fixos vindos do passado. Pôde, assim, receber uma infraestrutura nova, totalmente a serviço de uma economia moderna.

SANTOS, M. **A Urbanização Brasileira**. São Paulo: EdUSP, 2005 (adaptado).

O texto trata da ocupação de uma parcela do território brasileiro. O processo econômico diretamente associado a essa ocupação foi o avanço da', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 5 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000172', 'ENEM-2011-006', 9, 436, 'enem', 3, 2, 2011, 'multiple_choice', 'Relevo, solos e geologia', '![](conteudo/enem/2011/6-01d48357.webp)

TEIXEIRA, W. et al. **Decifrando a Terra.** São Paulo: Nacional, 2009 (adaptado).

O gráfico relaciona diversas variáveis ao processo de formação do solo. A interpretação dos dados mostra que a água é um dos importantes fatores de pedogênese, pois nas áreas', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 6 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000173', 'ENEM-2011-007', 9, 249, 'enem', 3, 2, 2011, 'multiple_choice', 'Climas do Brasil', 'Uma empresa norte-americana de bioenergia está expandindo suas operações para o Brasil para explorar o mercado de pinhão manso. Com sede na Califórnia, a empresa desenvolveu sementes híbridas de pinhão manso, oleaginosa utilizada hoje na produção de biodiesel e de querosene de aviação.

MAGOSSI, E. **O Estado de São Paulo.** 19 maio 2011 (adaptado).

A partir do texto, a melhoria agronômica das sementes de pinhão manso abre para o Brasil a oportunidade econômica de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 7 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000174', 'ENEM-2011-008', 9, 436, 'enem', 3, 2, 2011, 'multiple_choice', 'Relevo, solos e geologia', 'Um dos principais objetivos de se dar continuidade às pesquisas em erosão dos solos é o de procurar resolver os problemas oriundos desse processo, que, em última análise, geram uma série de impactos ambientais. Além disso, para a adoção de técnicas de conservação dos solos, é preciso conhecer como a água executa seu trabalho de remoção, transporte e deposição de sedimentos. A erosão causa, quase sempre, uma série de problemas ambientais, em nível local ou até mesmo em grandes áreas.

GUERRA, A. J. T. Processos erosivos nas encostas. In: GUERRA, A. J. T.; CUNHA, S. B.  
**Geomorfologia:** uma atualização de bases e conceitos.  
Rio de Janeiro: Bertrand Brasil, 2007 (adaptado).

A preservação do solo, principalmente em áreas de encostas, pode ser uma solução para evitar catástrofes em função da intensidade de fluxo hídrico. A prática humana que segue no caminho contrário a essa solução é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 8 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000175', 'ENEM-2011-009', 9, 255, 'enem', 3, 2, 2011, 'multiple_choice', 'Urbanização', 'O fenômeno de ilha de calor é o exemplo mais marcante da modificação das condições iniciais do clima pelo processo de urbanização, caracterizado pela modificação do solo e pelo calor antropogênico, o qual inclui todas as atividades humanas inerentes à sua vida na cidade.

BARBOSA, R. V. R. **Áreas verdes e qualidade térmica em ambientes urbanos**:  
estudo em microclimas em Maceió. São Paulo: EdUSP, 2005.

O texto exemplifica uma importante alteração socioambiental, comum aos centros urbanos. A maximização desse fenômeno ocorre', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 9 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000176', 'ENEM-2011-010', 9, 426, 'enem', 3, 2, 2011, 'multiple_choice', 'Questões ambientais', 'O professor Paulo Saldiva pedala 6 km em 22 minutos de casa para o trabalho, todos os dias. Nunca foi atingido por um carro. Mesmo assim, é vítima diária do trânsito de São Paulo: a cada minuto sobre a bicicleta, seus pulmões são envenenados com 3,3 microgramas de poluição particulada – poeira, fumaça, fuligem, partículas de metal em suspensão, sulfatos, nitratos, carbono, compostos orgânicos e outras substâncias nocivas.

ESCOBAR, H. Sem Ar. **O Estado de São Paulo.** Ago. 2008.

A população de uma metrópole brasileira que vive nas mesmas condições socioambientais das do professor citado no texto apresentará uma tendência de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 10 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000177', 'ENEM-2011-011', 9, 426, 'enem', 3, 2, 2011, 'multiple_choice', 'Questões ambientais', '![](conteudo/enem/2011/11-bcc2c6b7.webp)

Disponível em: http://www.ra-bugio.org.br. Acesso em: 28 jul. 2010.

A imagem retrata a araucária, árvore que faz parte de um importante bioma brasileiro que, no entanto, já foi bastante degradado pela ocupação humana. Uma das formas de intervenção humana relacionada à degradação desse bioma foi', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 11 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000178', 'ENEM-2011-012', 9, 251, 'enem', 3, 2, 2011, 'multiple_choice', 'Bacias hidrográficas do Brasil', 'SOBRADINHO  
O homem chega, já desfaz a natureza  
Tira gente, põe represa, diz que tudo vai mudar  
O São Francisco lá pra cima da Bahia  
Diz que dia menos dia vai subir bem devagar  
E passo a passo vai cumprindo a profecia do beato que  
dizia que o Sertão ia alagar.

SÁ E GUARABYRA. **Disco Pirão de peixe com pimenta.** Som Livre, 1977 (adaptado).

O trecho da música faz referência a uma importante obra na região do rio São Francisco. Uma consequência socioespacial dessa construção foi', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 12 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000179', 'ENEM-2011-013', 9, 436, 'enem', 3, 2, 2011, 'multiple_choice', 'Relevo, solos e geologia', 'Como os combustíveis energéticos, as tecnologias da informação são, hoje em dia, indispensáveis em todos os setores econômicos. Através delas, um maior número de produtores é capaz de inovar e a obsolescência de bens e serviços se acelera. Longe de estender a vida útil dos equipamentos e a sua capacidade de reparação, o ciclo de vida desses produtos diminui, resultando em maior necessidade de matéria-prima para a fabricação de novos.

GROSSARD, C. **Le Monde Diplomatique Brasil.** Ano 3, nº 36, 2010 (adaptado)

A postura consumista de nossa sociedade indica a crescente produção de lixo, principalmente nas áreas urbanas, o que, associado a modos incorretos de deposição,', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 13 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000017a', 'ENEM-2011-014', 8, 421, 'enem', 3, 2, 2011, 'multiple_choice', 'Mundo contemporâneo', '![](conteudo/enem/2011/14-0ffc7161.webp)

O espaço mundial sob a “nova des-ordem” é um emaranhado de zonas, redes e “aglomerados”, espaços hegemônicos e contra-hegemônicos que se cruzam de forma complexa na face da Terra. Fica clara, de saída, a polêmica que envolve uma nova regionalização mundial. Como regionalizar um espaço tão heterogêneo e, em parte, fluído, como é o espaço mundial contemporâneo?

HAESBAERT, R.; PORTO-GONÇALVES, C.W. **A nova des-ordem mundial.**  
São Paulo: UNESP, 2006

O mapa procura representar a lógica espacial do mundo contemporâneo pós-União Soviética, no contexto de avanço da globalização e do neoliberalismo, quando a divisão entre países socialistas e capitalistas se desfez e as categorias de “primeiro” e “terceiro” mundo perderam sua validade explicativa. Considerando esse objetivo interpretativo, tal distribuição espacial aponta para', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 14 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000017b', 'ENEM-2011-015', 9, 249, 'enem', 3, 2, 2011, 'multiple_choice', 'Climas do Brasil', 'Em 1872, Robert Angus Smith criou o termo “chuva ácida”, descrevendo precipitações ácidas em Manchester após a Revolução Industrial. Trata-se do acúmulo demasiado de dióxido de carbono e enxofre na atmosfera que, ao reagirem com compostos dessa camada, formam gotículas de chuva ácida e partículas de aerossóis. A chuva ácida não necessariamente ocorre no local poluidor, pois tais poluentes, ao serem lançados na atmosfera, são levados pelos ventos, podendo provocar a reação em regiões distantes. A água de forma pura apresenta pH 7, e, ao contatar agentes poluidores, reage modificando seu pH para 5,6 e até menos que isso, o que provoca reações, deixando consequências.

Disponível em: http://www.brasilescola.com. Acesso em: 18 maio 2010 (adaptado).

O texto aponta para um fenômeno atmosférico causador de graves problemas ao meio ambiente: a chuva ácida (pluviosidade com pH baixo). Esse fenômeno tem como consequência', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 15 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000017c', 'ENEM-2011-016', 9, 433, 'enem', 3, 2, 2011, 'multiple_choice', 'Agropecuária, indústria e energia', 'Estamos testemunhando o reverso da tendência histórica da assalariação do trabalho e socialização da produção, que foi característica predominante na era industrial. A nova organização social e econômica baseada nas tecnologias da informação visa à administração descentralizadora, ao trabalho individualizante e aos mercados personalizados. As novas tecnologias da informação possibilitam, ao mesmo tempo, a descentralização das tarefas e sua coordenação em uma rede interativa de comunicação em tempo real, seja entre continentes, seja entre os andares de um mesmo edifício.

CASTELLS, M. **A sociedade em rede.** São Paulo: Paz e Terra, 2006 (adaptado).

No contexto descrito, as sociedades vivenciam mudanças constantes nas ferramentas de comunicação que afetam os processos produtivos nas empresas. Na esfera do trabalho, tais mudanças têm provocado', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 16 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000017d', 'ENEM-2011-017', 8, 430, 'enem', 3, 2, 2011, 'multiple_choice', 'República Velha e Era Vargas', 'Completamente analfabeto, ou quase, sem assistência médica, não lendo jornais, nem revistas, nas quais se limita a ver as figuras, o trabalhador rural, a não ser em casos esporádicos, tem o patrão na conta de benfeitor. No plano político, ele luta com o “coronel” e pelo “coronel”. Aí estão os votos de cabresto, que resultam, em grande parte, da nossa organização econômica rural.

LEAL, V. N. **Coronelismo, enxada e voto**. São Paulo: Alfa-Ômega, 1978 (adaptado).

O coronelismo, fenômeno político da Primeira República (1889-1930), tinha como uma de suas principais características o controle do voto, o que limitava, portanto, o exercício da cidadania. Nesse período, esta prática estava vinculada a uma estrutura social', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 17 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000017e', 'ENEM-2011-018', 12, 425, 'enem', 3, 2, 2011, 'multiple_choice', 'Cultura, trabalho e cidadania', 'Na década de 1990, os movimentos sociais camponeses e as ONGs tiveram destaque, ao lado de outros sujeitos coletivos. Na sociedade brasileira, a ação dos movimentos sociais vem construindo lentamente um conjunto de práticas democráticas no interior das escolas, das comunidades, dos grupos organizados e na interface da sociedade civil com o Estado. O diálogo, o confronto e o conflito têm sido os motores no processo de construção democrática.

SOUZA, M. A. **Movimentos sociais no Brasil contemporâneo**: participação e possibilidades das práticas democráticas. Disponível em: http://www.ces.uc.pt. Acesso em: 30 abr. 2010 (adaptado).

Segundo o texto, os movimentos sociais contribuem para o processo de construção democrática, porque', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 18 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000017f', 'ENEM-2011-019', 8, 434, 'enem', 3, 2, 2011, 'multiple_choice', 'Império e Regências', 'Art. 92. São excluídos de votar nas Assembleias Paroquiais:

I. Os menores de vinte e cinco anos, nos quais não se compreendam os casados, e Oficiais Militares, que forem maiores de vinte e um anos, os Bacharéis Formados e Clérigos de Ordens Sacras.

IV. Os Religiosos, e quaisquer que vivam em Comunidade claustral.

V. Os que não tiverem de renda líquida anual cem mil réis por bens de raiz, indústria, comércio ou empregos.

Constituição Política do Império do Brasil (1824). Disponível em: https://legislação.planalto.gov.br. Acesso em: 27 abr. 2010 (adaptado).

A legislação espelha os conflitos políticos e sociais do contexto histórico de sua formulação. A Constituição de 1824 regulamentou o direito de voto dos “cidadãos brasileiros“ com o objetivo de garantir', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 19 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000180', 'ENEM-2011-020', 13, 428, 'enem', 3, 2, 2011, 'multiple_choice', 'Ética, moral e conhecimento', 'Embora o Brasil seja signatário das convenções e tratados internacionais contra a tortura e tenha incorporado em seu ordenamento jurídico uma lei tipificando o crime, ele continua a ocorrer em larga escala. Mesmo que a lei que tipifica a tortura esteja vigente desde 1997, até o ano 2000 não se conhece nenhum caso de condenação de torturadores julgado em última instância, embora tenham sido registrados nesse período centenas de casos, além de numerosos outros presumíveis mas não registrados.

Disponível em: http://www.dhnet.org.br. Acesso em: 16 jun 2010 (adaptado).

O texto destaca a questão da tortura no país, apontando que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 20 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000181', 'ENEM-2011-021', 13, 428, 'enem', 3, 2, 2011, 'multiple_choice', 'Ética, moral e conhecimento', 'A ação democrática consiste em todos tomarem parte do processo decisório sobre aquilo que terá consequência na vida de toda coletividade.

GALLO, S. etal. Ética e Cidadania. Caminhos da Filosofia. Campinas: Papirus, 1997 (adaptado).

TEXTO II

É necessário que haja liberdade de expressão, fiscalização sobre órgãos governamentais e acesso por parte da população às informações trazidas a público pela imprensa.

Disponível em: http://www.observatoriodaimprensa.com.br. Acesso em: 24 abr. 2010.

Partindo da perspectiva de democracia apresentada no Texto I, os meios de comunicação, de acordo com o Texto II, assumem um papel relevante na sociedade por', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 21 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000182', 'ENEM-2011-022', 8, 419, 'enem', 3, 2, 2011, 'multiple_choice', 'Processos históricos', 'Até que ponto, a partir de posturas e interesses diversos, as oligarquias paulista e mineira dominaram a cena política nacional na Primeira República? A união de ambas foi um traço fundamental, mas que não conta toda a história do período. A união foi feita com a preponderância de uma ou de outra das duas frações. Com o tempo, surgiram as discussões e um grande desacerto final.

FAUSTO, B. História do Brasil. São Paulo: EdUSP, 2004 (adaptado).

Para a caracterização do processo político durante a Primeira República, utiliza-se com frequência a expressão Política do Café com Leite. No entanto, os textos apresentam a seguinte ressalva a sua utilização:', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 22 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000183', 'ENEM-2011-023', 8, 419, 'enem', 3, 2, 2011, 'multiple_choice', 'Processos históricos', 'O acidente nuclear de Chernobyl revela brutalmente os limites dos poderes técnico-científicos da humanidade e as “marchas-à-ré” que a “natureza” nos pode reservar. É evidente que uma gestão mais coletiva se impõe para orientar as ciências e as técnicas em direção a finalidades mais humanas.

GUATTARI, F. **As três ecologias.** São Paulo: Papirus, 1995 (adaptado).

O texto trata do aparato técnico-científico e as suas consequências para a humanidade, propondo que esse desenvolvimento', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 23 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000184', 'ENEM-2011-024', 9, 433, 'enem', 3, 2, 2011, 'multiple_choice', 'Agropecuária, indústria e energia', 'A introdução de novas tecnologias desencadeou uma série de efeitos sociais que afetaram os trabalhadores e sua organização. O uso de novas tecnologias trouxe a diminuição do trabalho necessário que se traduz na economia líquida do tempo de trabalho, uma vez que, com a presença da automação microeletrônica, começou a ocorrer a diminuição dos coletivos operários e uma mudança na organização dos processos de trabalho.

**Revista Eletrônica de Geografia Y Ciências Sociales.**  
Universidad de Barcelona. Nº 170(9), 1 ago. 2004.

A utilização de novas tecnologias tem causado inúmeras alterações no mundo do trabalho. Essas mudanças são observadas em um modelo de produção caracterizado', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 24 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000185', 'ENEM-2011-025', 8, 419, 'enem', 3, 2, 2011, 'multiple_choice', 'Processos históricos', '![](conteudo/enem/2011/25-6dffcf26.webp)

GOMES, A. et al. A República no Brasil. Rio de Janeiro: Nova Fronteira, 2002.

A análise da tabela permite identificar um intervalo de tempo no qual uma alteração na proporção de eleitores inscritos resultou de uma luta histórica de setores da sociedade brasileira. O intervalo de tempo e a conquista estão associados, respectivamente, em', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 25 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000186', 'ENEM-2011-026', 8, 419, 'enem', 3, 2, 2011, 'multiple_choice', 'Processos históricos', 'É difícil encontrar um texto sobre a Proclamação da República no Brasil que não cite a afirmação de Aristides Lobo, no Diário Popular de São Paulo, de que “o povo assistiu àquilo bestializado”. Essa versão foi relida pelos enaltecedores da Revolução de 1930, que não descuidaram da forma republicana, mas realçaram a exclusão social, o militarismo e o estrangeirismo da fórmula implantada em 1889. Isto porque o Brasil brasileiro teria nascido em 1930

MELLO, M. T. C. A república consentida: cultura democrática e científica no final do Império.  
Rio de Janeiro: FGV, 2007 (adaptado).

O texto defende que a consolidação de uma determinada memória sobre a Proclamação da República no Brasil teve, na Revolução de 1930, um de seus momentos mais importantes. Os defensores da Revolução de 1930 procuraram construir uma visão negativa para os eventos de 1889, porque esta era uma maneira de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 26 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000187', 'ENEM-2011-027', 12, 469, 'enem', 3, 2, 2011, 'multiple_choice', 'Clássicos da sociologia', 'Um volume imenso de pesquisas tem sido produzido para tentar avaliar os efeitos dos programas de televisão. A maioria desses estudos diz respeito às crianças — o que é bastante compreensível pela quantidade de tempo que elas passam em frente ao aparelho e pelas possíveis implicações desse comportamento para a socialização. Dois dos tópicos mais pesquisados são o impacto da televisão no âmbito do crime e da violência e a natureza das notícias exibidas na televisão.

GIDDENS, A. Sociologia. Porto Alegre: Artmed, 2005.

O texto indica que existe uma significativa produção científica sobre os impactos socioculturais da televisão na vida do ser humano. E as crianças, em particular, são as mais vulneráveis a essas influências, porque', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 27 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000188', 'ENEM-2011-028', 9, 255, 'enem', 3, 2, 2011, 'multiple_choice', 'Urbanização', 'Subindo morros, margeando córregos ou penduradas em palafitas, as favelas fazem parte da paisagem de um terço dos municípios do país, abrigando mais de 10 milhões de pessoas, segundo dados do Instituto Brasileiro de Geografia e Estatística (IBGE).

MARTINS, A. R. **A favela como um espaço da cidade.** Disponível em: http://www.revistaescola.abril.com.br. Acesso em: 31 jul. 2010.

A situação das favelas no país reporta a graves problemas de desordenamento territorial. Nesse sentido, uma característica comum a esses espaços tem sido', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 28 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000189', 'ENEM-2011-029', 8, 419, 'enem', 3, 2, 2011, 'multiple_choice', 'Processos históricos', '![](conteudo/enem/2011/29-9c6575c2.webp)

Foto de Militão, São Paulo, 1879. ALENCASTRO, L. F. (org). História da vida privada no Brasil. Império: a corte e a modernidade nacional. São Paulo: Cia. das Letras, 1997. (Foto: Reprodução/Enem)

Que aspecto histórico da escravidão no Brasil do séc. XIX pode ser identificado a partir da análise do vestuário do casal retratado acima?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 29 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000018a', 'ENEM-2011-030', 8, 419, 'enem', 3, 2, 2011, 'multiple_choice', 'Processos históricos', 'Os três tipos de poder representam três diversos tipos de motivações: no poder tradicional, o motivo da obediência é a crença na sacralidade da pessoa do soberano; no poder racional, o motivo da obediência deriva da crença na racionalidade do comportamento conforme a lei; no poder carismático, deriva da crença nos dotes extraordinários do chefe.

BOBBIO, N. Estado, Governo, Sociedade: para uma teoria geral da política.  
São Paulo: Paz e Terra, 1999 (adaptado).

Os três tipos de poder representam três diversos tipos de motivações: no poder tradicional, o motivo da obediência', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 30 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000018b', 'ENEM-2011-031', 8, 429, 'enem', 3, 2, 2011, 'multiple_choice', 'Brasil Colônia', 'Em geral, os nossos tupinambás ficam bem admirados ao ver os franceses e os outros dos países longínquos terem tanto trabalho para buscar o seu arabotã, isto é, pau-brasil. Houve uma vez um ancião da tribo que me fez esta pergunta: “Por que vindes vós outros, mairs e perós (franceses e portugueses), buscar lenha de tão longe para vos aquecer? Não tendes madeira em vossa terra?”

LÉRY, J. Viagem à Terra do Brasil. In: FERNANDES, F. Mudanças Sociais no Brasil. São Paulo: Difel, 1974.

O viajante francês Jean de Léry (1534-1611) reproduz um diálogo travado, em 1557, com um ancião tupinambá, o qual demonstra uma diferença entre a sociedade europeia e a indígena no sentido', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 31 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000018c', 'ENEM-2011-032', 8, 419, 'enem', 3, 2, 2011, 'multiple_choice', 'Processos históricos', 'A Lei 10.639, de 9 de janeiro de 2003, inclui no currículo dos estabelecimentos de ensino fundamental e médio, oficiais e particulares, a obrigatoriedade do ensino sobre História e Cultura Afro-Brasileira e determina que o conteúdo programático incluirá o estudo da História da África e dos africanos, a luta dos negros no Brasil, a cultura negra brasileira e o negro na formação da sociedade nacional, resgatando a contribuição do povo negro nas áreas social, econômica e política pertinentes à História do Brasil, além de instituir, no calendário escolar, o dia 20 de novembro como data comemorativa do “Dia da Consciência Negra”.

Disponível em: http://www.planalto.gov.br. Acesso em: 27 jul. 2010 (adaptado).

A referida lei representa um avanço não só para a educação nacional, mas também para a sociedade brasileira, porque', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 32 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000018d', 'ENEM-2011-033', 8, 429, 'enem', 3, 2, 2011, 'multiple_choice', 'Brasil Colônia', 'O açúcar e suas técnicas de produção foram levados à Europa pelos árabes no século VIII, durante a Idade Média, mas foi principalmente a partir das Cruzadas (séculos XI e XIII) que a sua procura foi aumentando. Nessa época passou a ser importado do Oriente Médio e produzido em pequena escala no sul da Itália, mas continuou a ser um produto de luxo, extremamente caro, chegando a figurar nos dotes de princesas casadoiras.

CAMPOS, R. Grandeza do Brasil no tempo de Antonil (1681-1716). São Paulo: Atual, 1996.

Considerando o conceito do Antigo Sistema Colonial, o açúcar foi o produto escolhido por Portugal para dar início à colonização brasileira, em virtude de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 33 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000018e', 'ENEM-2011-034', 8, 434, 'enem', 3, 2, 2011, 'multiple_choice', 'Império e Regências', 'No clima das ideias que se seguiram à revolta de São Domingos, o descobrimento de planos para um levante armado dos artífices mulatos na Bahia, no ano de 1798, teve impacto muito especial; esses planos demonstravam aquilo que os brancos conscientes tinham já começado a compreender: as ideias de igualdade social estavam a propagar-se numa sociedade em que só um terço da população era de brancos e iriam inevitavelmente ser interpretados em termos raciais.

MAXWELL, K. Condicionalismos da Independência do Brasil. In: SILVA, M. N. (coord.) O Império luso-brasileiro, 1750-1822. Lisboa: Estampa, 1966.

O temor do radicalismo da luta negra no Haiti e das propostas das lideranças populares da Conjuração Baiana (1798) levaram setores da elite colonial brasileira a novas posturas diante das reivindicações populares. No período da Independência, parte da elite participou', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 34 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000018f', 'ENEM-2011-035', 8, 420, 'enem', 3, 2, 2011, 'multiple_choice', 'Idade Média', 'Se a mania de fechar, verdadeiro habitus da mentalidade medieval nascido talvez de um profundo sentimento de insegurança, estava difundida no mundo rural, estava do mesmo modo no meio urbano, pois que uma das características da cidade era de ser limitada por portas e por uma muralha.

DUBY, G. et al. “Séculos XIV-XV”. In: ARIÈS, P.; DUBY, G. História da vida privada da  
Europa Feudal à Renascença. São Paulo: Cia. das Letras, 1990 (adaptado).

As práticas e os usos das muralhas sofreram importantes mudanças no final da Idade Média, quando elas assumiram a função de pontos de passagem ou pórticos. Este processo está diretamente relacionado com', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 35 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000190', 'ENEM-2011-036', 8, 429, 'enem', 3, 2, 2011, 'multiple_choice', 'Brasil Colônia', '![](conteudo/enem/2011/36-fa0373ec.webp)

SMITH, D. Atlas da Situação Mundial. São Paulo: Cia. Editora Nacional, 2007 (adaptado). (Foto: Reprodução/Enem)

Uma explicação de caráter histórico para o percentual da religião com maior número de adeptos declarados no Brasil foi a existência, no passado colonial e monárquico, da', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 36 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000191', 'ENEM-2011-037', 9, 426, 'enem', 3, 2, 2011, 'multiple_choice', 'Questões ambientais', 'No Estado de São Paulo, a mecanização da colheita da cana-de-açúcar tem sido induzida também pela legislação ambiental, que proíbe a realização de queimadas em áreas próximas aos centros urbanos. Na região de Ribeirão Preto, principal polo sucroalcooleiro do país, a mecanização da colheita já é realizada em 516 mil dos 1,3 milhão de hectares cultivados com cana-de-açúcar.

BALSADI, O. et al. Transformações Tecnológicas e a força de trabalho na agricultura brasileira no período de 1990-2000. **Revista de economia agrícola.** V. 49 (1), 2002.

O texto aborda duas questões, uma ambiental e outra socioeconômica, que integram o processo de modernização da produção canavieira. Em torno da associação entre elas, uma mudança decorrente desse processo é a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 37 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000192', 'ENEM-2011-038', 8, 418, 'enem', 3, 2, 2011, 'multiple_choice', 'Idade Moderna', 'Acompanhando a intenção da burguesia renascentista de ampliar seu domínio sobre a natureza e sobre o espaço geográfico, através da pesquisa científica e da invenção tecnológica, os cientistas também iriam se atirar nessa aventura, tentando conquistar a forma, o movimento, o espaço, a luz, a cor e mesmo a expressão e o sentimento.

(SEVCENKO, N. ****O Renascimento****, Campinas, Unicamp, 1984).

O texto apresenta um espírito de época que afetou também a produção artística, marcada pela constante relação entre', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 38 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000193', 'ENEM-2011-039', 8, 421, 'enem', 3, 2, 2011, 'multiple_choice', 'Mundo contemporâneo', 'Os chineses não atrelam nenhuma condição para efetuar investimentos nos países africanos. Outro ponto interessante é a venda e compra de grandes somas de áreas, posteriormente cercadas. Por se tratar de países instáveis e com governos ainda não consolidados, teme-se que algumas nações da África tornem-se literalmente protetorados.

BRANCOLI, F. **China e os novos investimentos na África**:  
neocolonialismo ou mudanças na arquitetura global  
Disponível em: http://opiniaoenoticia.com.br. Acesso em: 29 abr. 2010 (adaptado).

A presença econômica da China em vastas áreas do globo é uma realidade do século XXI. A partir do texto, como é possível caracterizar a relação econômica da China com o continente africano?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 39 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000194', 'ENEM-2011-040', 8, 434, 'enem', 3, 2, 2011, 'multiple_choice', 'Império e Regências', 'O café tem origem na região onde hoje se encontra a Etiópia, mas seu cultivo e consumo se disseminaram a partir da Península Árabe. Aportou à Europa por Constantinopla e, finalmente, em 1615, ganhou a cidade de Veneza. Quando o café chegou à região europeia, alguns clérigos sugeriram que o produto deveria ser excomungado, por ser obra do diabo. O papa Clemente VIII (1592-1605), contudo, resolveu provar a bebida. Tendo gostado do sabor, decidiu que ela deveria ser batizada para que se tornasse uma “bebida verdadeiramente cristã”.

THORN, J. Guia do café. Lisboa: Livros e livros, 1998 (adaptado).

A postura dos clérigos e do papa Clemente VIII diante da introdução do café na Europa Ocidental pode ser explicada pela associação dessa bebida ao', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 40 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000195', 'ENEM-2011-041', 9, 433, 'enem', 3, 2, 2011, 'multiple_choice', 'Agropecuária, indústria e energia', 'A consolidação do regime democrático no Brasil contra os extremismos da esquerda e da direita exige ação enérgica e permanente no sentido do aprimoramento das instituições políticas e da realização de reformas corajosas no terreno econômico, financeiro e social.

 Mensagem programática da União Democrática Nacional (UDN) — 1957.

Os trabalhadores deverão exigir a constituição de um governo nacionalista e democrático, com participação dos trabalhadores para a realização das seguintes medidas: a) Reforma bancária progressista; b)Reforma agrária que extinga o latifúndio; c) Regulamentação da Lei de Remessas de Lucros.

Manifesto do Comando Geral dos Trabalhadores (CGT) — 1962. BONAVIDES, P; AMARAL, R. Textos políticos da história do Brasil. Brasília: Senado Federal, 2002.

Nos anos 1960 eram comuns as disputas pelo significado de termos usados no debate político, como democracia e reforma. Se, para os setores aglutinados em torno da UDN, as reformas deveriam assegurar o livre mercado, para aqueles organizados no CGT, elas deveriam resultar em', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 41 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000196', 'ENEM-2011-042', 8, 421, 'enem', 3, 2, 2011, 'multiple_choice', 'Mundo contemporâneo', 'Em meio às turbulências vividas na primeira metade dos anos 1960, tinha-se a impressão de que as tendências de esquerda estavam se fortalecendo na área cultural. O Centro Popular de Cultura (CPC) da União Nacional dos Estudantes (UNE) encenava peças de teatro que faziam agitação e propaganda em favor da luta pelas reformas de base e satirizavam o “imperialismo” e seus “aliados internos”.

KONDER, L. História das Ideias Socialistas no Brasil. São Paulo: Expressão Popular, 2003

No início da década de 1960, enquanto vários setores da esquerda brasileira consideravam que o CPC da UNE era uma importante forma de conscientização das classes trabalhadoras, os setores conservadores e de direita (políticos vinculados à União Democrática Nacional – UDN -, Igreja Católica, grandes empresários etc.) entendiam que esta organização', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 42 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000197', 'ENEM-2011-043', 8, 419, 'enem', 3, 2, 2011, 'multiple_choice', 'Processos históricos', '![](conteudo/enem/2011/43-51607de2.webp)

Charge capa da revista “O Malho”, de 1904. Disponível em: http://1.bp.blogspot.com. (Foto: Reprodução/Enem)

A imagem representa as manifestações nas ruas da cidade do Rio de Janeiro, na primeira década do século XX, que integraram a Revolta da Vacina. Considerando o contexto político-social da época, essa revolta revela', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 43 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000198', 'ENEM-2011-044', 9, 255, 'enem', 3, 2, 2011, 'multiple_choice', 'Urbanização', '![](conteudo/enem/2011/44-05efa7d4.webp)

SILVA, E. S. O. Circuito espacial de produção e comercialização da produção familiar de tomate no município de São José de Ubá (RJ). In: RIBEIRO, M. A.; MARAFON, G. J. (orgs.).  
**A metrópole e o interior fluminense**: simetrias e assimetrias geométricas.  
Foto: Rio de Janeiro: Gramma, 2009 (adaptado).

O organograma apresenta os diversos atores que integram uma cadeia agroindustrial e a intensa relação entre os setores primário, secundário e terciário. Nesse sentido, a disposição dos atores na cadeia agroindustrial demonstra', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 44 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-000000000199', 'ENEM-2011-045', 9, 431, 'enem', 3, 2, 2011, 'multiple_choice', 'Migrações e demografia', 'As migrações transnacionais, intensificadas e generalizadas nas últimas décadas do século XX, expressam aspectos particularmente importantes da problemática racial, visto como dilema também mundial. Deslocam-se indivíduos, famílias e coletividades para lugares próximos e distantes, envolvendo mudanças mais ou menos drásticas nas condições de vida e trabalho, em padrões e valores socioculturais. Deslocam-se para sociedades semelhantes ou radicalmente distintas, algumas vezes compreendendo culturas ou mesmo civilizações totalmente diversas.

IANNI, O. **A era do globalismo.** Rio de Janeiro: Civilização Brasileira, 1996.

A mobilidade populacional da segunda metade do século XX teve um papel importante na formação social e econômica de diversos estados nacionais. Uma razão para os movimentos migratórios nas últimas décadas e uma política migratória atual dos países desenvolvidos são', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 45 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000019a', 'ENEM-2011-046', 6, 409, 'enem', 3, 2, 2011, 'multiple_choice', 'Movimento', '![](conteudo/enem/2011/46-47ffbebd.webp)

A explicação para a necessidade do uso da engrenagem com trava é:', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 46 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000019b', 'ENEM-2011-047', 5, 406, 'enem', 3, 2, 2011, 'multiple_choice', 'Ecossistemas e relações ecológicas', 'Os personagens da figura estão representando uma situação hipotética de cadeia alimentar.

![](conteudo/enem/2011/47-c2d2193d.webp)

Suponha que, em cena anterior à apresentada, o homem tenha se alimentado de frutas e grãos que conseguiu coletar. Na hipótese de, nas próximas cenas, o tigre ser bem-sucedido e, posteriormente, servir de alimento aos abutres, tigre e abutres ocuparão, respectivamente, os níveis tróficos de', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 47 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000019c', 'ENEM-2011-048', 5, 261, 'enem', 3, 2, 2011, 'multiple_choice', 'Doenças e prevenção', 'A produção de soro antiofídico é feita por meio da extração da peçonha de serpentes que, após tratamento é introduzida em um cavalo. Em seguida são feitas sangrias para avaliar a concentração de anticorpos produzidos pelo cavalo. Quando essa concentração atinge o valor desejado, é realizada a sangria final para obtenção do soro. As hemácias são devolvidas ao animal, por meio de uma técnica denominada plasmaferese, a fim de reduzir os efeitos colaterais provocados pela sangria.

Disponível em: http://www.infobibos.com. Acesso em: 28 abr. 2010 (adaptado).

A plasmaferese é importante, pois, se o animal ficar com uma baixa quantidade de hemácias, poderá apresentar', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 48 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000019d', 'ENEM-2011-049', 5, 404, 'enem', 3, 2, 2011, 'multiple_choice', 'Fisiologia humana', 'Um paciente deu entrada em um pronto-socorro apresentando os seguintes sintomas: cansaço, dificuldade em respirar e sangramento nasal. O médico solicitou um hemograma ao paciente para definir um diagnóstico. Os resultados estão dispostos na tabela:

![](conteudo/enem/2011/49-f89f293e.webp)

Relacionando os sintomas apresentados pelo paciente com os resultados de seu hemograma, constata-se que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 49 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000019e', 'ENEM-2011-050', 7, 401, 'enem', 3, 2, 2011, 'multiple_choice', 'Funções e reações orgânicas', '![](conteudo/enem/2011/50-eaf14b98.webp)

Neste contexto, qual dos combustíveis, quando queimado completamente, libera mais dióxido de carbono no ambiente pela mesma quantidade de energia produzida?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 50 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-00000000019f', 'ENEM-2011-051', 5, 402, 'enem', 3, 2, 2011, 'multiple_choice', 'Plantas e fotossíntese', 'Para evitar o desmatamento da Mata Atlântica nos arredores da cidade de Amargosa, no Recôncavo da Bahia, o Ibama tem atuado no sentido de fiscalizar, entre outras, as pequenas propriedades rurais que dependem da lenha proveniente das matas para a produção da farinha de mandioca, produto típico da região. Com isso, pequenos produtores procuram alternativas como o gás de cozinha, o que encarece a farinha.

Uma alternativa viável, em curto prazo, para os produtores de farinha em Amargosa, que não cause danos à Mata Atlântica nem encareça o produto é a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 51 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a0', 'ENEM-2011-052', 5, 406, 'enem', 3, 2, 2011, 'multiple_choice', 'Ecossistemas e relações ecológicas', 'Belém é cercada por 39 ilhas, e suas populações convivem com ameaças de doenças. O motivo, apontado por especialistas, é a poluição da água do rio, principal fonte de sobrevivência dos ribeirinhos. A diarreia é frequente nas crianças e ocorre como consequência da falta de saneamento básico, já que a população não tem acesso à água de boa qualidade. Como não há água potável, a alternativa é consumir a do rio.

O procedimento adequado para tratar a água dos rios, afim de atenuar os problemas de saúde causados por microrganismos a essas populações ribeirinhas é a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 52 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a1', 'ENEM-2011-053', 5, 261, 'enem', 3, 2, 2011, 'multiple_choice', 'Doenças e prevenção', 'O vírus do papiloma humano (HPV, na sigla em inglês) causa o aparecimento de verrugas e infecção persistente, sendo o principal fator ambiental do câncer de colo de útero nas mulheres. O vírus pode entrar pela pele ou por mucosas do corpo, o qual desenvolve anticorpos contra a ameaça, embora em alguns casos a defesa natural do organismo não seja suficiente. Foi desenvolvida uma vacina contra o HPV, que reduz em até 90% as verrugas e 85,6% dos casos de infecção persistente em comparação com pessoas não vacinadas.

Disponível em: http://g1.globo.com. Acesso em: 12 jun. 2011.

O benefício da utilização dessa vacina é que pessoas vacinadas, em comparação com as não vacinadas, apresentam diferentes respostas ao vírus HPV em decorrência da', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 53 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a2', 'ENEM-2011-054', 7, 460, 'enem', 3, 2, 2011, 'multiple_choice', 'Substâncias, misturas e separação', 'Certas ligas estanho-chumbo com composição específica formam um estético simples, o que significa que uma liga com essas características se comporta como uma substância pura, com um ponto de fusão definido, no caso 183 ºC. Essa é uma temperatura inferior mesmo ao ponto de fusão dos metais que compõem esta liga (o estanho puro funde a 232 ºC e o chumbo puro a 320 ºC), o que justifica sua ampla utilização na soldagem de componentes eletrônicos, em que o excesso de aquecimento deve sempre ser evitado. De acordo com as normas internacionais, os valores mínimo e máximo das densidades para essas ligas são de 8,74 g/mL e 8,82 g/mL, respectivamente. As densidades do estanho e do chumbo são 7,3 g/mL e 11,3 g/mL, respectivamente.

Um lote contendo 5 amostras de solda estanho-chumbo foi analisado por um técnico, por meio da determinação de sua composição percentual em massa, cujos resultados estão mostrados no quadro a seguir.

![](conteudo/enem/2011/54-64333d1a.webp)

Com base no texto e na análise realizada pelo técnico, as amostras que atendem às normas internacionais são', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 54 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a3', 'ENEM-2011-055', 5, 411, 'enem', 3, 2, 2011, 'multiple_choice', 'Animais', 'No processo de industrialização da mamona, além do óleo que contém vários ácidos graxos, é obtida uma massa orgânica, conhecida como torta de mamona. Esta massa tem potencial para ser utilizada como fertilizante para o solo e como complemento em rações animais devido a seu elevado valor proteico. No entanto, a torta apresenta compostos tóxicos e alergênicos diferentemente do óleo da mamona. Para que a torta possa ser utilizada na alimentação animal, é necessário um processo de descontaminação.  
Revista Química Nova na Escola. V. 32, no1, 2010 (adaptado)

A característica presente nas substâncias tóxicas e alergênicas, que inviabiliza sua solubilização no óleo de mamona, é a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 55 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a4', 'ENEM-2011-056', 6, 471, 'enem', 3, 2, 2011, 'multiple_choice', 'Campo magnético e indução', 'O manual de funcionamento de um captador de guitarra elétrica apresenta o seguinte texto:

Esse captador comum consiste de uma bobina, fios condutores enrolados em torno de um ímã permanente. O campo magnético do ímã induz o ordenamento dos polos magnéticos na corda da guitarra, que está próxima a ele. Assim, quando a corda é tocada, as oscilações produzem variações, com o mesmo padrão, no fluxo magnético que atravessa a bobina. Isso induz uma corrente elétrica na bobina, que é transmitida até o amplificador e, dai, para o alto-falante.

Um guitarrista trocou as cordas originais de sua guitarra, que eram feitas de aço, por outras feitas de náilon. Com o uso dessas cordas, o amplificador ligado ao instrumento não emitia mais som, porque a corda de náilon', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 56 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a5', 'ENEM-2011-057', 5, 406, 'enem', 3, 2, 2011, 'multiple_choice', 'Ecossistemas e relações ecológicas', 'O controle biológico, técnica empregada no combate a espécies que causam danos e prejuízos aos seres humanos, é utilizado no combate à lagarta que se alimenta de folhas de algodoeiro. Algumas espécies de borboleta depositam seus ovos nessa cultura. A microvespa Trichogramma sp. introduz seus ovos nos ovos de outros insetos, incluindo os das borboletas em questão. Os embriões da vespa se alimentam do conteúdo desses ovos e impedem que as larvas de borboleta se desenvolvam. Assim, é possível reduzir a densidade populacional das borboletas até níveis que não prejudiquem a cultura.

A técnica de controle biológico realizado pela microvespa Trichogramma sp. consiste na', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 57 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a6', 'ENEM-2011-058', 7, 413, 'enem', 3, 2, 2011, 'multiple_choice', 'Átomo, tabela periódica e ligações', '![](conteudo/enem/2011/58-d80676e3.webp)

A retenção de água na superfície da pele promovida pelos hidratantes é consequência da interação dos grupos hidroxila dos agentes umectantes com a umidade contida no ambiente por meio de', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 58 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a7', 'ENEM-2011-059', 6, 416, 'enem', 3, 2, 2011, 'multiple_choice', 'Lentes, espelhos e luz', 'A cal (óxido de cálcio, CaO), cuja suspensão em água é muito usada como uma tinta de baixo custo, dá uma tonalidade branca aos troncos de árvores. Essa é uma prática muito comum em praças públicas e locais privados, geralmente usada para combater a proliferação de parasitas. Essa aplicação, também chamada de caiação, gera um problema: elimina microrganismos benéficos para a árvore.

Disponível em: http://super.abril.com.br. Acesso em: 1 abr. 2010 (adaptado).

A destruição do microambiente, no tronco de árvores pintadas com cal, é devida ao processo de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 59 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a8', 'ENEM-2011-060', 6, 407, 'enem', 3, 2, 2011, 'multiple_choice', 'Circuitos e energia elétrica', '![](conteudo/enem/2011/60-4d540a4d.webp)

Uma pessoa adquiriu um chuveiro do modelo A e, ao ler o manual, verificou que precisava ligá-lo a um disjuntor de 50 amperes. No entanto, intrigou-se com o fato de que o disjuntor a ser utilizado para uma correte instalação de um chuveiro do modelo B devia possuir amperagem 40% menor.

Considerando-se os chuveiros de modelos A e B, funcionando à mesma potência de 4 400 W, a razão entre as suas respectivas resistências elétricas, RA e RB, que justifica a diferença de dimensionamento dos disjuntores, é mais próxima de:', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 60 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001a9', 'ENEM-2011-061', 5, 403, 'enem', 3, 2, 2011, 'multiple_choice', 'DNA, genes e hereditariedade', 'Nos dias de hoje, podemos dizer que praticamente todos os seres humanos já ouviram em algum momento falar sobre o DNA e seu papel na hereditariedade da maioria dos organismos. Porém, foi apenas em 1952, um ano antes da descrição do modelo do DNA em dupla hélice por Watson e Crick, que foi confirmado sem sombra de dúvidas que o DNA é material genético. No artigo em que Watson e Crick descreveram a molécula de DNA, eles sugeriram um modelo de como essa molécula deveria se replicar. Em 1958, Meselson e Stahl realizaram experimentos utilizando isótopos pesados de nitrogênio que foram incorporados às bases nitrogenadas para avaliar como se daria a replicação da molécula. A partir dos resultados, confirmaram o modelo sugerido por Watson e Crick, que tinha como premissa básica o rompimento das pontes de hidrogênio entre as bases nitrogenadas.

GRIFFITHS, A. J. F. et al. Introdução à Genética. Rio de Janeiro: Guanabara Koogan, 2002.

Considerando a estrutura da molécula de DNA e a posição das pontes de hidrogênio na mesma, os experimentos realizados por Meselson e Stahl a respeito da replicação dessa molécula levaram à conclusão de que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 61 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001aa', 'ENEM-2011-062', 7, 464, 'enem', 3, 2, 2011, 'multiple_choice', 'Concentração e diluição', '![](conteudo/enem/2011/62-64a9d484.webp)

A análise da água de um lago que recebe a descarga de águas residuais provenientes de lavouras adubadas revelou as concentrações dos elementos carbono (21,2 mol/L), nitrogênio (1,2 mol/L) e fósforo (0,2 mol/L). Nessas condições, o nutriente limítrofe é o', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 62 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ab', 'ENEM-2011-063', 6, 415, 'enem', 3, 2, 2011, 'multiple_choice', 'Ondas, som e luz', '![](conteudo/enem/2011/63-b1d6b8a8.webp)

![](conteudo/enem/2011/63-6abf1b0d.webp)

Qual a cor da substância que deu origem ao espectro da Figura 1?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 63 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ac', 'ENEM-2011-064', 5, 261, 'enem', 3, 2, 2011, 'multiple_choice', 'Doenças e prevenção', '![](conteudo/enem/2011/64-9d597bbb.webp)

O mapa mostra a área de ocorrência da malária no mundo. Considerando-se sua distribuição na América do Sul, a malária pode ser classificada como', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 64 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ad', 'ENEM-2011-065', 5, 403, 'enem', 3, 2, 2011, 'multiple_choice', 'DNA, genes e hereditariedade', 'Em 1999, a geneticista Emma Whitelaw desenvolveu um experimento no qual ratas prenhes foram submetidas a uma dieta rica em vitamina B12, ácido fólico e soja. Os filhotes dessas ratas, apesar de possuírem o gene para obesidade, não expressaram essa doença na fase adulta. A autora concluiu que a alimentação da mãe, durante a gestação, silenciou o gene da obesidade. Dez anos depois, as geneticistas Eva Jablonka e Gal Raz listaram 100 casos comprovados de traços adquiridos e transmitidos entre gerações de organismos, sustentando, assim, epigenética, que estuda as mudanças na atividade dos genes que não envolvem alterações na sequência do DNA.

A reabilitação do herege. Época. no 610, 2010 (adaptado).

Alguns cânceres esporádicos representam exemplos de alteração epigenética, pois são ocasionados por', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 65 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ae', 'ENEM-2011-066', 6, 405, 'enem', 3, 2, 2011, 'multiple_choice', 'Trabalho, energia e potência', 'Um motor só poderá realizar trabalho se receber uma quantidade de energia de outro sistema. No caso, a energia armazenada no combustível é, em parte, liberada durante a combustão para que o aparelho possa funcionar. Quando o motor funciona, parte da energia convertida ou transformada na combustão não pode ser utilizado para a realização de trabalho. Isso significa dizer que há vazamento da energia em outra forma.

CARVALHO, A. X. Z. Física Térmica. Belo Horizonte: Pax, 2009 (adaptado).

De acordo com o texto, as transformações de energia que ocorrem durante o funcionamento do motor são decorrentes de a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 66 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001af', 'ENEM-2011-067', 6, 415, 'enem', 3, 2, 2011, 'multiple_choice', 'Ondas, som e luz', '![](conteudo/enem/2011/67-d4a36c5d.webp)

De acordo com as curvas de assinatura espectral apresenta na figura, para que se obtenha a melhor discriminação dos alvos mostrados, convém selecionar a banda correspondente a que comprimento de onda em micrômetros (µm)?', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 67 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b0', 'ENEM-2011-068', 5, 261, 'enem', 3, 2, 2011, 'multiple_choice', 'Doenças e prevenção', 'Um instituto de pesquisa norte-americano divulgou recentemente ter criado uma “célula sintética”, uma bactéria chamada de _Mycoplasma mycoides_. Os pesquisadores montaram uma sequência de nucleotídeos, que formam o único cromossomo dessa bactéria, o qual foi introduzido em outra espécie de bactéria, a _Mycoplasma capricolum._ Após a introdução, o cromossomo da _M. capricolum_ foi neutralizado e o e o cromossomo artificial da _M. mycoides_ começou a gerenciar a célula, produzindo suas proteínas.

GILBSON et al. Creation of a Bacterial Cell Controlled by a Chemically synthesized Genome.  
Science v. 329, 2010 (adaptado).

A importância dessa inovação tecnológica para a comunidade científica se deve à', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 68 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b1', 'ENEM-2011-069', 5, 261, 'enem', 3, 2, 2011, 'multiple_choice', 'Doenças e prevenção', 'Os sintomas mais sérios da Gripe A, causada pelo vírus H1N1, foram apresentados por pessoas mais idosas e por gestantes. O motivo aparente é a menor imunidade desses grupos contra o vírus. Para aumentar a imunidade populacional relativa ao vírus da gripe A, o governo brasileiro distribuiu vacinas para os grupos mais suscetíveis.

A vacina contra o H1N1, assim como qualquer outra vacina contra agentes causadores de doenças infecto-contagiosas aumenta a imunidade das pessoas porque', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 69 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b2', 'ENEM-2011-070', 6, 407, 'enem', 3, 2, 2011, 'multiple_choice', 'Circuitos e energia elétrica', '![](conteudo/enem/2011/70-5c44faae.webp)

Tendo por base os esquemas mostrados, em quais casos a lâmpada acendeu?', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 70 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b3', 'ENEM-2011-072', 7, 26, 'enem', 3, 2, 2011, 'multiple_choice', 'pH e acidez', '![](conteudo/enem/2011/72-a3993cf9.webp)

A combinação entre o ácido cólico e a glicina ou taurina origina a função amida, formada pela reação entre o grupo amina desses aminoácidos e o grupo', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 72 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b4', 'ENEM-2011-073', 6, 412, 'enem', 3, 2, 2011, 'multiple_choice', 'Forças e leis de Newton', '![](conteudo/enem/2011/73-7a672448.webp)

Considerando que a aceleração da gravidade local é de 10 m/s², a densidade da água do lago, em g/cm³, é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 73 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b5', 'ENEM-2011-074', 6, 416, 'enem', 3, 2, 2011, 'multiple_choice', 'Lentes, espelhos e luz', 'Uma equipe de cientistas lançará uma expedição ao Titanic para criar um detalhado mapa 3D que “vai tirar, virtualmente, o Titanic do fundo do mar para o público”. A expedição ao local, a 4 quilômetros de profundidade no Oceano Atlântico, está sendo apresentada como a mais sofisticada expedição científica ao Titanic. Ela utilizará tecnologias de imagem e sonar que nunca tinham sido aplicadas ao navio, para obter o mais completo inventário de seu conteúdo. Esta complementação é necessária em razão das condições do navio, naufragado há um século.

O Estado de São Paulo. Disponível em: http://www.estadao.com.br. Acesso em: 27 jul. 2010 (adaptado)

No problema apresentado para gerar imagens através de camadas de sedimentos depositados no navio, o sonar é mais adequado, pois a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 74 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b6', 'ENEM-2011-075', 7, 464, 'enem', 3, 2, 2011, 'multiple_choice', 'Concentração e diluição', '![](conteudo/enem/2011/75-a7c29aaa.webp)

Considerando que uma pessoa consuma refrigerantes diariamente, poderá ocorrer um processo de desmineralização dentária, devido ao aumento da concentração de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 75 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b7', 'ENEM-2011-076', 5, 402, 'enem', 3, 2, 2011, 'multiple_choice', 'Plantas e fotossíntese', 'Diferente do que o senso comum acredita, as lagartas de borboletas não possuem voracidade generalizada. Um estudo mostrou que as borboletas de asas transparentes da família Ithomiinae, comuns na Floresta Amazônica e na Mata Atlântica, consomem, sobretudo, plantas da família Solanaceae, a mesma do tomate. Contudo, os ancestrais dessas borboletas consumiam espécies vegetais da família Apocinaceae, mas a quantidade dessas plantas parece não ter sido suficiente para garantir o suprimento alimentar dessas borboletas. Dessa forma, as solanáceas tornaram-se uma opção de alimento, pois são abundantes na Mata Atlântica e na Floresta Amazônica.

Nesse texto, a ideia do senso comum é confrontada com os conhecimentos científicos, ao se entender que as larvas das borboletas Ithomiinae encontradas atualmente na Mata Atlântica e na Floresta Amazônica, apresentam', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 1º dia · Questão 76 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b8', 'ENEM-2011-077', 6, 409, 'enem', 3, 2, 2011, 'multiple_choice', 'Movimento', '![](conteudo/enem/2011/77-66d5c063.webp)

A distância percorrida pela régua aumenta mais rapidamente que o tempo de reação porque a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 77 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001b9', 'ENEM-2011-078', 5, 406, 'enem', 3, 2, 2011, 'multiple_choice', 'Ecossistemas e relações ecológicas', '![](conteudo/enem/2011/78-321e751e.webp)

A característica de funcionamento que garante essa economia é devida', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 78 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ba', 'ENEM-2011-079', 5, 261, 'enem', 3, 2, 2011, 'multiple_choice', 'Doenças e prevenção', 'Moradores sobreviventes da tragédia que destruiu aproximadamente 60 casas no Morro do Bumba, na Zona Norte de Niterói (RJ), ainda defendem a hipótese de o deslizamento ter sido causado por uma explosão provocada por gás metano, visto que esse local foi um lixão entre os anos 1960 e 1980.

**Jornal Web. Disponível em: http://www.ojornalweb.com. Acesso em: 12 abr. 2010 (adaptado).**

O gás mencionado no texto é produzido', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 79 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001bb', 'ENEM-2011-080', 7, 414, 'enem', 3, 2, 2011, 'multiple_choice', 'Química e ambiente', 'Segundo dados do Balanço Energético Nacional de 2008, do Ministério das Minas e Energia, a matriz energética brasileira é composta por hidrelétrica (80%), termelétrica (19,9%) e eólica (0,1%). Nas termelétricas, esse percentual é dividido conforme o combustível usado, sendo: gás natural (6,6%), biomassa (5,3%), derivados de petróleo (3,3%), energia nuclear (3,1%) e carvão mineral (1,6%). Com a geração de eletricidade da biomassa, pode-se considerar que ocorre uma compensação do carbono liberado na queima do material vegetal pela absorção desse elemento no crescimento das plantas. Entretanto, estudos indicam que as emissões de metano (CH4) das hidrelétricas podem ser comparáveis às emissões de CO2 das termelétricas.

**MORET, A. S.; FERREIRA, I. A. As hidrelétricas do Rio Madeira e os impactos socioambientais. Revista Ciência Hoje. V. 45, n° 265, 2009 (adaptado).**

No Brasil, em termos do impacto das fontes de energia no crescimento do efeito estufa, quanto à emissão de gases, as hidrelétricas seriam consideradas como uma fonte', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 80 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001bc', 'ENEM-2011-081', 7, 197, 'enem', 3, 2, 2011, 'multiple_choice', 'Cálculo estequiométrico', '![](conteudo/enem/2011/81-821b4e4b.webp)

De acordo com a estequiometria da reação descrita, a quantidade de permanganato de potássio necessária para reagir completamente com 20,0 mL de uma solução 0,1 mol/L de peróxido de hidrogênio é igual a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 81 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001bd', 'ENEM-2011-082', 5, 403, 'enem', 3, 2, 2011, 'multiple_choice', 'DNA, genes e hereditariedade', 'Os vaga-lumes machos e fêmeas emitem sinais luminosos para se atraírem para o acasalamento. O macho reconhece a fêmea de sua espécie e, atraído por ela, vai ao seu encontro. Porém, existe um tipo de vaga-lume, o _Photuris_, cuja fêmea engana e atrai os machos de outro tipo, o _Photinus_, fingindo ser deste gênero. Quando o macho _Photinus_ se aproxima da fêmea _Photuris_, muito maior que ele, é atacado e devorado por ela.

BERTOLDI, O. G.; VASCONCELLOS, J. R. **Ciência & sociedade**: a aventura da vida,  
a aventura da tecnologia. São Paulo: Scipione, 2000 (adaptado).

A relação descrita no texto, entre a fêmea do gênero Photuris e o macho do gênero Photinus, é um exemplo de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 82 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001be', 'ENEM-2011-083', 7, 401, 'enem', 3, 2, 2011, 'multiple_choice', 'Funções e reações orgânicas', 'O etanol é considerado um biocombustível promissor, pois, sob o ponto de vista do balanço de carbono, possui uma taxa de emissão praticamente igual a zero. Entretanto, esse não é o único ciclo biogeoquímico associado à produção de etanol. O plantio da cana-de-açúcar, matéria-prima para a produção de etanol, envolve a adição de macronutrientes como enxofre, nitrogênio, fósforo e potássio, principais elementos envolvidos no crescimento de um vegetal.  
Revista Química Nova na Escola. no 28, 2008.

O nitrogênio incorporado ao solo, como consequência da atividade descrita anteriormente, é transformado em nitrogênio ativo e afetará o meio ambiente, causando', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 83 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001bf', 'ENEM-2011-084', 6, 415, 'enem', 3, 2, 2011, 'multiple_choice', 'Ondas, som e luz', '![](conteudo/enem/2011/84-743d09d0.webp)

Em qual das situações a seguir está representado o fenômeno descrito no texto?', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 84 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c0', 'ENEM-2011-085', 6, 407, 'enem', 3, 2, 2011, 'multiple_choice', 'Circuitos e energia elétrica', 'Um dos processos usados no tratamento do lixo é a incineração, que apresenta vantagens e desvantagens. Em São Paulo, por exemplo, o lixo é queimado a altas temperaturas e parte da energia liberada é transformada em energia elétrica. No entanto, a incineração provoca a  
emissão de poluentes na atmosfera.

Uma forma de minimizar a desvantagem da incineração, destacada no texto, é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 85 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c1', 'ENEM-2011-086', 6, 405, 'enem', 3, 2, 2011, 'multiple_choice', 'Trabalho, energia e potência', '![](conteudo/enem/2011/86-6df25b83.webp)

Desprezando-se as forças dissipativas (resistência do ar e atrito), para que o salto atinja a maior altura possível, ou seja, o máximo de energia seja conservada, é necessário que', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 86 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c2', 'ENEM-2011-087', 5, 411, 'enem', 3, 2, 2011, 'multiple_choice', 'Animais', '**Os Bichinhos e O Homem**

Arca de Noé  
Toquinho & Vinicius de Moraes  
Nossa irmã, a mosca  
É feia e tosca  
Enquanto que o mosquito  
É mais bonito  
Nosso irmão besouro  
Que é feito de couro  
Mal sabe voar  
Nossa irmã, a barata  
Bichinha mais chata  
É prima da borboleta  
Que é uma careta  
Nosso irmão, o grilo  
Que vive dando estrilo  
Só pra chatear

**MORAES, V. A arca de Noé: poemas infantis. São Paulo: Companhia das Letrinhas, 1991.**

O poema acima sugere a existência de relações de afinidade entre os animais citados e nós, seres humanos. Respeitando a liberdade poética dos autores, a unidade taxonômica que expressa a afinidade existente entre nós e estes animais é', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 1º dia · Questão 87 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c3', 'ENEM-2011-088', 5, 411, 'enem', 3, 2, 2011, 'multiple_choice', 'Animais', 'Certas espécies de algas são capazes de absorver rapidamente compostos inorgânicos presentes na água, acumulando-os durante seu crescimento. Essa capacidade fez com que se pensasse em usá-las como biofiltros para a limpeza de ambientes aquáticos contaminados, removendo, por exemplo, nitrogênio e fósforo de resíduos orgânicos e metais pesados provenientes de rejeitos industriais lançados nas águas. Na técnica do cultivo integrado, animais e algas crescem de forma associada, promovendo um maior equilíbrio ecológico.

SORIANO, E. M. Filtros vivos para limpar a água. Revista Ciência Hoje. V. 37, nº- 219, 2005 (adaptado).

A utilização da técnica do cultivo integrado de animais e algas representa uma proposta favorável a um ecossistema mais equilibrado porque', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 1º dia · Questão 88 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c4', 'ENEM-2011-089', 5, 261, 'enem', 3, 2, 2011, 'multiple_choice', 'Doenças e prevenção', 'Durante as estações chuvosas, aumentam no Brasil as campanhas de prevenção à dengue, que têm como objetivo a redução da proliferação do mosquito Aedes aegypti, transmissor do vírus da dengue.

Que proposta preventiva poderia ser efetivada para diminuir a reprodução desse mosquito?', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 1º dia · Questão 89 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c5', 'ENEM-2011-090', 5, 404, 'enem', 3, 2, 2011, 'multiple_choice', 'Fisiologia humana', '![](conteudo/enem/2011/90-7ae35329.webp)

De acordo com o relatório “A grande sombra da pecuária” (Livestock’s Long Shadow), feito pela Organização das Nações Unidas para a Agricultura e a Alimentação, o gado é responsável por cerca de 18% do aquecimento global, uma contribuição maior que a do setor de transportes.

**Disponível em: www.conpet.gov.br. Acesso em: 22 jun. 2010. (Foto: Reprodução/Enem)**

A criação de gado em larga escala contribui para o aquecimento global por meio da emissão de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 1º dia · Questão 90 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c6', 'ENEM-2011-091-ESP', 14, 466, 'enem', 3, 2, 2011, 'multiple_choice', 'Leitura em língua espanhola', '**‘Desmachupizar’ el turismo**

Es ya un lugar común escuchar aquello de que hay que desmachupizar el turismo en Perú y buscar visitantes en las demás atracciones (y son muchas) que tiene el país, naturales y arqueológicas, pero la ciudadela inca tiene un imán innegable. La Cámara Nacional de Turismo considera que Machu Picchu significa el 70% de los ingresos por turismo en Perú, ya que cada turista que tiene como primer destino la ciudadela inca visita entre tres y cinco lugares más (la ciudad de Cuzco, la de Arequipa, las líneas de Nazca, el Lago Titicaca y la selva) y deja en el país un promedio de 2 200 dólares (unos 1 538 euros).

Carlos Canales, presidente de Canatur, señaló que la ciudadela tiene capacidad para recibir más visitantes que en la actualidad (un máximo de 3 000) con un sistema planificado de horarios y rutas, pero no quiso avanzar una cifra. Sin embargo, la Unesco ha advertido en varias ocasiones que el monumento se encuentra cercano al punto de saturación y el Gobierno no debe emprender ninguna política de captación de nuevos visitantes, algo con lo que coincide el viceministro Roca Rey.

Disponivel em: http://www.elpais.com. Acesso em: 21 jun. 2011.

A reportagem do jornal espanhol mostra a preocupação diante de um problema no Peru, que pode ser resumido pelo vocábulo “desmachupizar”, referindo-se', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 91 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c7', 'ENEM-2011-091', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', 'Going to university seems to reduce the risk of dying from coronary heart disease. An American study that involved 10 000 patients from around the world has found that people who leave school before the age of 16 are five times more likely to suffer a heart attack and die than university graduates.

World Report News. **Magazine Speak Up**. Ano XIV, n° 170. Editora Camelot, 2001.

Em relação às pesquisas, a utilização da expressão university graduates evidencia a intenção de informar que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 91 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c8', 'ENEM-2011-092-ESP', 14, 466, 'enem', 3, 2, 2011, 'multiple_choice', 'Leitura em língua espanhola', 'Los fallos de _software_ en aparatos médicos, como marcapasos, van a ser una creciente amenaza para la salud pública, según el informe de _Software Freedom Law Center_ (SFLC) que ha sido presentado hoy en Portland (EEUU), en la _Open Source Convention_ (OSCON).

La ponencia “Muerto por el código: transparencia de _software_ en los dispositivos médicos implantables” aborda el riesgo potencialmente mortal de los defectos informáticos en los aparatos médicos implantados en las personas.

Según SFLC, millones de personas con condiciones crónicas del corazón, epilepsia, diabetes, obesidad e, incluso, la depresión dependen de implantes, pero el _software_ permanece oculto a los pacientesy sus médicos.

La SFLC recuerda graves fallos informáticos ocurridos en otros campos, como en elecciones, en la fabricación de coches, en las líneas aéreas comerciales o en los mercados financieros.

Disponível em: http://www.elpais.com. Acesso em: 24 jul. 2010 (adaptado).

O título da palestra, citado no texto, antecipa o tema que será tratado e mostra que o autor tem a intenção de', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 92 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001c9', 'ENEM-2011-092', 1, 224, 'enem', 3, 2, 2011, 'multiple_choice', 'Gêneros textuais', '![](conteudo/enem/2011/92-cf4e6e0a.webp)

GLASBERGEN, R. **Today’s cartoon**. Disponível em: http://www.glasbergen.com. Acesso em: 23 jul. 2010.

Na fase escolar, é prática comum que os professores passem atividades extraclasse e marquem uma data para que as mesmas sejam entregues para correção. No caso da cena da charge, a professora ouve uma estudante apresentando argumentos para', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 92 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ca', 'ENEM-2011-093-ESP', 14, 466, 'enem', 3, 2, 2011, 'multiple_choice', 'Leitura em língua espanhola', '**Bienvenido a Brasília**

El Gobierno de Brasil, por medio del Ministerio de la Cultura y del Instituto del Patrimonio Histórico y Artístico Nacional (IPHAN), da la bienvenida a los participantes de la 34a Sesión del Comité del Patrimonio Mundial, encuentro realizado poria Organización de las Naciones Unidas para la Educación, la Ciencia y la Cultura (UNESCO).

Respaldado por la Convención del Patrimonio Mundial, de 1972, el Comité reúne en su 34a sesión más de 180 delegaciones nacionales para deliberar sobre las nuevas candidaturas y el estado de conservación y de riesgo de los bienes ya declarados Patrimonio Mundial, con base en los análisis del Consejo Internacional de Monumentos y Sitios (Icomos), del Centro Internacional para el Estudio de la Preservación y la Restauración del Patrimonio Cultural (ICCROM) y de la Union Internacional para la Conservación de la Naturaleza (IUCN).

Disponivel em: http://www.34whc.brasilia2010.oig.br. Acesso em: 28 jul. 2010.

O Comitê do Patrimônio Mundial reúne-se regularmente para deliberar sobre ações que visem à conservação e à preservação do patrimônio mundial. Entre as tarefas atribuídas às delegações nacionais que participaram da 34a Sessão do Comitê do Patrimônio Mundial, destaca-se a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 93 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001cb', 'ENEM-2011-093', 1, 441, 'enem', 3, 2, 2011, 'multiple_choice', 'Tecnologias da comunicação', '**How’s your mood?**

![](conteudo/enem/2011/93-148fb6fd.webp)

For an interesting attempt to measure cause and effect try Mappiness, a project run by the London School of Economics, which offers a phone app that prompts you to record your mood and situation.

The Mappiness website says: “We’re particularly interested in how people’s happiness is affected by their local environment — air pollution, noise, green spaces, and so on — which the data from Mappiness will be absolutely great for investigating.”

Will it work? With enough people, it might. But there are other problems. We’ve been using happiness and well-being interchangeably. Is that ok? The difference comes out in a sentiment like: “We were happier during the war.” But was our well-being also greater then?

Disponível em: http://www.bbc.co.uk. Acesso em: 27 jun. 2011 (adaptado).

O projeto Mappiness, idealizado pela London School of Economics, ocupa-se do tema relacionado', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 93 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001cc', 'ENEM-2011-094-ESP', 14, 466, 'enem', 3, 2, 2011, 'multiple_choice', 'Leitura em língua espanhola', '**El tango**

Ya sea como danza, música, poesía o cabal expresión de una filosofía de vida, el tango posee una larga y valiosa trayectoria, jalonada de encuentros y desencuentros, amores y odios, nacida desde lo más hondo de la historia argentina.

El nuevo ambiente es el cabaret, su nuevo cultor la clase media porteña, que ameniza sus momentos de diversión con nuevas composiciones, sustituyendo el carácter malevo del tango primitivo por una nueva poesía más acorde con las concepciones estéticas provenientes de Londres y París.

Ya en la década del ‘20 el tango se anima incluso a traspasar las fronteras del país, recalando en lujosos salones parisinos donde es aclamado por públicos selectos que adhieren entusiastas a la sensualidad del nuevo baile. Ya no es privativo de los bajos fondos porteños; ahora se escucha y se baila en salones elegantes, clubs y casas particulares.

El tango revive con juveniles fuerzas en ajironadas versiones de grupos rockeros, presentaciones en elegantes reductos de San Telmo, Barracas y La Boca y películas foráneas que lo divulgan por el mundo entero.

Disponivel em: http://vww.elpdwrin.over-blog.es. Acesso em: 22 jun. 2011 (adaptado).

Sabendo-se que a produção cultural de um país pode influenciar, retratar ou, inclusive, ser reflexo de acontecimentos de sua história, o tango, dentro do contexto histórico argentino, é reconhecido por', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 94 (Espanhol) · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001cd', 'ENEM-2011-094', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', '**War**

Until the philosophy which holds one race superior  
And another inferior  
Is finally and permanently discredited and abandoned,  
Everywhere is war — Me say war.

That until there is no longer  
First class and second class citizens of any nation,  
Until the color of a man’s skin  
Is of no more significance than the color of his eyes —  
Me say war.  
\[…\]

And until the ignoble and unhappy regimes  
that hold our brothers in Angola, in Mozambique,  
South Africa, sub-human bondage have been toppled,  
Utterly destroyed —  
Well, everywhere is war — Me say war.

War in the east, war in the west,  
War up north, war down south —  
War — war — Rumors of war.  
And until that day, the African continent will not know peace.  
We, Africans, will fight — we find it necessary —  
And we know we shall win  
As we are confident in the victory.  
\[…\]

MARLEY, B. Disponível em: http://www.sing365.com. Acesso em: 30 jun. 2011 (fragmento).

Bob Marley foi um artista popular e atraiu muitos fãs com suas canções. Ciente de sua influência social, na música War, o cantor se utiliza de sua arte para alertar sobre', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 94 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ce', 'ENEM-2011-095', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '**Es posible reducir la basura**

En México se producen más de 10 millones de m3 de basura mensualmente, depositados en más de 50 mil tiraderos de basura legales y clandestinos, que afectan de manera directa nuestra calidad de vida, pues nuestros recursos naturales son utilizados desproporcionalmente, como materias primas que luego desechamos y tiramos convirtiéndolos en materiales inútiles y focos de infección.

Todo aquello que compramos y consumimos tiene una relación directa con lo que tiramos. Consumiendo racionalmente, evitando el derroche y usando sólo lo indispensable, directamente colaboramos con el cuidado del ambiente.

Si la basura se compone de varios desperdicios y si como desperdicios no fueron basura, si los separamos adecuadamente, podremos controlarlos y evitar posteriores problemas. Reciclar se traduce en importantes ahorros de energía, ahorro de agua potable, ahorro de materias primas, menor impacto en los ecosistemas y sus recursos naturales y ahorro de tiempo, dinero y esfuerzo.

Es necesario saber para empezar a actuar…

Disponível em: http://www.tododecarton.com. Acesso em: 27 abr. 2010 (adaptado).

A partir do que se afirma no último parágrafo: “Es necesario saber para empezar a actuar…”, pode-se constatar que o texto foi escrito com a intenção de', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 95 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001cf', 'ENEM-2011-096', 16, 444, 'enem', 3, 2, 2011, 'multiple_choice', 'Corpo, esporte e saúde', 'Na modernidade, o corpo foi descoberto, despido e modelado pelos exercícios físicos da moda. Novos espaços e práticas esportivas e de ginástica passaram a convocar as pessoas a modelarem seus corpos. Multiplicaram-se as academias de ginástica, as salas de musculação e o número de pessoas correndo pelas ruas.

SECRETARIA DA EDUCAÇÃO. **Caderno do professor**: educação física. São Paulo, 2008.

Diante do exposto, é possível perceber que houve um aumento da procura por', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 96 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d0', 'ENEM-2011-097', 1, 441, 'enem', 3, 2, 2011, 'multiple_choice', 'Tecnologias da comunicação', '![](conteudo/enem/2011/97-bd1b0936.webp)

COSTA, C. **Superinteressante**. Fev. 2011 (adaptado).

Os amigos são um dos principais indicadores de bem-estar na vida social das pessoas. Da mesma forma que em outras áreas, a internet também inovou as maneiras de vivenciar a amizade. Da leitura do infográfico, depreendem-se dois tipos de amizade virtual, a simétrica e a assimétrica, ambas com seus prós e contras. Enquanto a primeira se baseia na relação de reciprocidade, a segunda', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 97 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d1', 'ENEM-2011-098', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', 'O hipertexto refere-se à escritura eletrônica não sequencial e não linear, que se bifurca e permite ao leitor o acesso a um número praticamente ilimitado de outros textos a partir de escolhas locais e sucessivas, em tempo real. Assim, o leitor tem condições de definir interativamente o fluxo de sua leitura a partir de assuntos tratados no texto sem se prender a uma sequência fixa ou a tópicos estabelecidos por um autor. Trata-se de uma forma de estruturação textual que faz do leitor simultaneamente coautor do texto final. O hipertexto se caracteriza, pois, como um processo de escritura/leitura eletrônica multilinearizado, multisequencial e indeterminado, realizado em um novo espaço de escrita. Assim, ao permitir vários níveis de tratamento de um tema, o hipertexto oferece a possibilidade de múltiplos graus de profundidade simultaneamente, já que não tem sequência definida, mas liga textos não necessariamente correlacionados.

MARCUSCHI, L. A. Disponível em: http://www.pucsp.br. Acesso em: 29 jun. 2011.

O computador mudou nossa maneira de ler e escrever, e o hipertexto pode ser considerado como um novo espaço de escrita e leitura. Definido como um conjunto de blocos autônomos de texto, apresentado em meio eletrônico computadorizado e no qual há remissões associando entre si diversos elementos, o hipertexto', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 98 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d2', 'ENEM-2011-099', 11, 442, 'enem', 3, 2, 2011, 'multiple_choice', 'Escolas e textos literários', '**TEXTO I**

O meu nome é Severino,  
não tenho outro de pia.  
Como há muitos Severinos,  
que é santo de romaria,  
deram então de me chamar  
Severino de Maria;  
como há muitos Severinos  
com mães chamadas Maria,  
fiquei sendo o da Maria  
do finado Zacarias,  
mas isso ainda diz pouco:  
há muitos na freguesia,  
por causa de um coronel  
que se chamou Zacarias  
e que foi o mais antigo  
senhor desta sesmaria.  
Como então dizer quem fala  
ora a Vossas Senhorias?

MELO NETO, J. C. **Obra completa**. Rio de Janeiro: Aguilar, 1994 (fragmento).

**TEXTO II**

João Cabral, que já emprestara sua voz ao rio, transfere-a, aqui, ao retirante Severino, que, como o Capibaribe, também segue no caminho do Recife. A autoapresentação do personagem, na fala inicial do texto, nos mostra um Severino que, quanto mais se define, menos se individualiza, pois seus traços biográficos são sempre partilhados por outros homens.

SECCHIN, A. C. **João Cabral**: a poesia do menos. Rio de Janeiro: Topbooks, 1999 (fragmento).

Com base no trecho de Morte e Vida Severina (Texto I) e na análise crítica (Texto II), observa-se que a relação entre o texto poético e o contexto social a que ele faz referência aponta para um problema social expresso literariamente pela pergunta “Como então dizer quem fala / ora a Vossas Senhorias?”. A resposta à pergunta expressa no poema é dada por meio da', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 99 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d3', 'ENEM-2011-100', 1, 224, 'enem', 3, 2, 2011, 'multiple_choice', 'Gêneros textuais', '![](conteudo/enem/2011/100-c13c970e.webp)

Disponível em: www.ccsp.com.br. Acesso em: 26 jul. 2010 (adaptado).

O anúncio publicitário está intimamente ligado ao ideário de consumo quando sua função é vender um produto. No texto apresentado, utilizam-se elementos linguísticos e extralinguísticos para divulgar a atração “Noites do Terror”, de um parque de diversões. O entendimento da propaganda requer do leitor', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 100 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d4', 'ENEM-2011-101', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '**TEXTO I**  
**Onde está a honestidade?**

Você tem palacete reluzente  
Tem joias e criados à vontade  
Sem ter nenhuma herança ou parente  
Só anda de automóvel na cidade…

E o povo pergunta com maldade:  
Onde está a honestidade?  
Onde está a honestidade?

O seu dinheiro nasce de repente  
E embora não se saiba se é verdade  
Você acha nas ruas diariamente  
Anéis, dinheiro e felicidade…

Vassoura dos salões da sociedade  
Que varre o que encontrar em sua frente  
Promove festivais de caridade  
Em nome de qualquer defunto ausente…

ROSA, N. Disponível em: http://www.mpbnet.com.br. Acesso em: abr. 2010.

**TEXTO II**

Um vulto da história da música popular brasileira, reconhecido nacionalmente, é Noel Rosa. Ele nasceu em 1910, no Rio de Janeiro; portanto, se estivesse vivo, estaria completando 100 anos. Mas faleceu aos 26 anos de idade, vítima de tuberculose, deixando um acervo de grande valor para o patrimônio cultural brasileiro. Muitas de suas letras representam a sociedade contemporânea, como se tivessem sido escritas no século XXI.

Disponível em: http://www.mpbnet.com.br. Acesso em: abr. 2010.

Um texto pertencente ao patrimônio literário-cultural brasileiro é atualizável, na medida em que ele se refere a valores e situações de um povo. A atualidade da canção Onde está a honestidade?, de Noel Rosa, evidencia-se por meio', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 101 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d5', 'ENEM-2011-102', 11, 442, 'enem', 3, 2, 2011, 'multiple_choice', 'Escolas e textos literários', 'Quem é pobre, pouco se apega, é um giro-o-giro no vago dos gerais, que nem os pássaros de rios e lagoas. O senhor vê: o Zé-Zim, o melhor meeiro meu aqui, risonho e habilidoso. Pergunto: — Zé-Zim, por que é que você não cria galinhas-d’angola, como todo o mundo faz? — Quero criar nada não… — me deu resposta: — Eu gosto muito de mudar… \[…\] Belo um dia, ele tora. Ninguém discrepa. Eu, tantas, mesmo digo. Eu dou proteção. \[…\] Essa não faltou também à minha mãe, quando eu era menino, no sertãozinho de minha terra. \[…\] Gente melhor do lugar eram todos dessa família Guedes, Jidião Guedes; quando saíram de lá, nos trouxeram junto, minha mãe e eu. Ficamos existindo em território baixio da Sirga, da outra banda, ali onde o de-Janeiro vai no São Francisco, o senhor sabe.

ROSA, J. G. **Grande Sertão**: Veredas. Rio de Janeiro: José Olympio (fragmento).

Na passagem citada, Riobaldo expõe uma situação decorrente de uma desigualdade social típica das áreas rurais brasileiras marcadas pela concentração de terras e pela relação de dependência entre agregados e fazendeiros. No texto, destaca-se essa relação porque o personagem-narrador', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 102 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d6', 'ENEM-2011-103', 11, 442, 'enem', 3, 2, 2011, 'multiple_choice', 'Escolas e textos literários', 'A discussão sobre “o fim do livro de papel” com a chegada da mídia eletrônica me lembra a discussão idêntica sobre a obsolescência do folheto de cordel. Os folhetos talvez não existam mais daqui a 100 ou 200 anos, mas, mesmo que isso aconteça, os poemas de Leandro Gomes de Barros ou Manuel Camilo dos Santos continuarão sendo publicados e lidos — em CD-ROM, em livro eletrônico, em “chips quânticos”, sei lá o quê. O texto é uma espécie de alma imortal, capaz de reencarnar em corpos variados: página impressa, livro em Braille, folheto, “_coffee-table book_”, cópia manuscrita, arquivo PDF… Qualquer texto pode se reencarnar nesses (e em outros) formatos, não importa se é _Moby Dick_ ou _Viagem a São Saruê_, se é _Macbeth_ ou _O livro de piadas de Casseta & Planeta_.

TAVARES, B. Disponível em: http://jornaldaparaiba.globo.com.

Ao refletir sobre a possível extinção do livro impresso e o surgimento de outros suportes em via eletrônica, o cronista manifesta seu ponto de vista, defendendo que', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 103 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d7', 'ENEM-2011-104', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', '**Não tem tradução**

\[…\]  
Lá no morro, se eu fizer uma falseta  
A Risoleta desiste logo do francês e do inglês  
A gíria que o nosso morro criou  
Bem cedo a cidade aceitou e usou  
\[…\]  
Essa gente hoje em dia que tem mania de exibição  
Não entende que o samba não tem tradução no idioma francês  
Tudo aquilo que o malandro pronuncia  
Com voz macia é brasileiro, já passou de português  
Amor lá no morro é amor pra chuchu  
As rimas do samba não são _I love you_  
E esse negócio de _alô, alô boy e alô Johnny_  
Só pode ser conversa de telefone

ROSA, N. In: SOBRAL, João J. V. A tradução dos bambas. **Revista Língua Portuguesa**. Ano 4, n° 54. São Paulo: Segmento, abr. 2010 (fragmento).

As canções de Noel Rosa, compositor brasileiro de Vila Isabel, apesar de revelarem uma aguçada preocupação do artista com seu tempo e com as mudanças político-culturais no Brasil, no início dos anos 1920, ainda são modernas. Nesse fragmento do samba Não tem tradução, por meio do recurso da metalinguagem, o poeta propõe', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 104 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d8', 'ENEM-2011-105', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', 'A dança é um importante componente cultural da humanidade. O folclore brasileiro é rico em danças que representam as tradições e a cultura de várias regiões do país. Estão ligadas aos aspectos religiosos, festas, lendas, fatos históricos, acontecimentos do cotidiano e brincadeiras e caracterizam-se pelas músicas animadas (com letras simples e populares), figurinos e cenários representativos.

SECRETARIA DA EDUCAÇÃO. **Proposta Curricular do Estado de São Paulo**: Educação Física. São Paulo: 2009 (adaptado).

A dança, como manifestação e representação da cultura rítmica, envolve a expressão corporal própria de um povo. Considerando-a como elemento folclórico, a dança revela', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 105 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001d9', 'ENEM-2011-106', 1, 445, 'enem', 3, 2, 2011, 'multiple_choice', 'Gramática e sentido', 'Cultivar um estilo de vida saudável é extremamente importante para diminuir o risco de infarto, mas também de problemas como morte súbita e derrame. Significa que manter uma alimentação saudável e praticar atividade física regularmente já reduz, por si só, as chances de desenvolver vários problemas. Além disso, é importante para o controle da pressão arterial, dos níveis de colesterol e de glicose no sangue. Também ajuda a diminuir o estresse e aumentar a capacidade física, fatores que, somados, reduzem as chances de infarto. Exercitar-se, nesses casos, com acompanhamento médico e moderação, é altamente recomendável.

ATALIA, M. Nossa vida. **Época**. 23 mar. 2009.

As idéias veiculadas no texto se organizam estabelecendo relações que atuam na construção do sentido. A esse respeito, identifica-se, no fragmento, que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 106 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001da', 'ENEM-2011-107', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2011/107-4d2319f1.webp)

**Brasília 50 anos**. **Veja**. N° 2 138, nov. 2009.

Utilizadas desde a Antiguidade, as colunas, elementos verticais de sustentação, foram sofrendo modificações e incorporando novos materiais com ampliação de possibilidades. Ainda que as clássicas colunas gregas sejam retomadas, notáveis inovações são percebidas, por exemplo, nas obras de Oscar Niemeyer, arquiteto brasileiro nascido no Rio de Janeiro em 1907. No desenho de Niemeyer, das colunas do Palácio da Alvorada, observa-se', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 107 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001db', 'ENEM-2011-108', 16, 444, 'enem', 3, 2, 2011, 'multiple_choice', 'Corpo, esporte e saúde', '**Conceitos e importância das lutas**

Antes de se tornarem esporte, as lutas ou as artes marciais tiveram duas conotações principais: eram praticadas com o objetivo guerreiro ou tinham um apelo filosófico como concepção de vida bastante significativo.

Atualmente, nos deparamos com a grande expansão das artes marciais em nível mundial. As raízes orientais foram se disseminando, ora pela necessidade de luta pela sobrevivência ou para a “defesa pessoal”, ora pela possibilidade de ter as artes marciais como própria filosofia de vida.

CARREIRO, E. A. **Educação Física na escola**: Implicações para a prática pedagógica. Rio de Janeiro: Guanabara Koogan, 2008 (fragmento).

Um dos problemas da violência que está presente principalmente nos grandes centros urbanos são as brigas e os enfrentamentos de torcidas organizadas, além da formação de gangues, que se apropriam de gestos das lutas, resultando, muitas vezes, em fatalidades. Portanto, o verdadeiro objetivo da aprendizagem desses movimentos foi mal compreendido, afinal as lutas', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 108 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001dc', 'ENEM-2011-109', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', 'O tema da velhice foi objeto de estudo de brilhantes filósofos ao longo dos tempos. Um dos melhores livros sobre o assunto foi escrito pelo pensador e orador romano Cícero: _A Arte do Envelhecimento_. Cícero nota, primeiramente, que todas as idades têm seus encantos e suas dificuldades. E depois aponta para um paradoxo da humanidade. Todos sonhamos ter uma vida longa, o que significa viver muitos anos. Quando realizamos a meta, em vez de celebrar o feito, nos atiramos a um estado de melancolia e amargura. Ler as palavras de Cícero sobre envelhecimento pode ajudar a aceitar melhor a passagem do tempo.

NOGUEIRA, P. Saúde & Bem-Estar Antienvelhecimento. **Época**. 28 abr. 2008.

O autor discute problemas relacionados ao envelhecimento, apresentando argumentos que levam a inferir que seu objetivo é', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 109 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001dd', 'ENEM-2011-110', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', '![](conteudo/enem/2011/110-1fa1d245.webp)

LEIRNER, N. Tronco com cadeira (detalhe), 1964.  
Disponível em: http://www.itaucultural.org.br. Acesso em: 27 jul. 2010.

Nessa estranha dignidade e nesse abandono, o objeto foi exaltado de maneira ilimitada e ganhou um significado que se pode considerar mágico. Daí sua “vida inquietante e absurda”. Tornou-se ídolo e, ao mesmo tempo, objeto de zombaria. Sua realidade intrínseca foi anulada.

JAFFÉ, A. O simbolismo nas artes plásticas. In: JUNG, C.G. (org.). **O homem e os seus símbolos**. Rio de Janeiro: Nova Fronteira, 2008.

A relação observada entre a imagem e o texto apresentados permite o entendimento da intenção de um artista contemporâneo. Neste caso, a obra apresenta características', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 110 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001de', 'ENEM-2011-111', 11, 442, 'enem', 3, 2, 2011, 'multiple_choice', 'Escolas e textos literários', '**No capricho**

O Adãozinho, meu cumpade, enquanto esperava pelo delegado, olhava para um quadro, a pintura de uma senhora. Ao entrar a autoridade e percebendo que o cabôco admirava tal figura, perguntou: “Que tal? Gosta desse quadro?”

E o Adãozinho, com toda a sinceridade que Deus dá ao cabôco da roça: “Mas pelo amor de Deus, hein, dotô! Que muié feia! Parece fiote de cruis-credo, parente do deus-me-livre, mais horríver que briga de cego no escuro.”

Ao que o delegado não teve como deixar de confessar, um pouco secamente: “É a minha mãe.” E o cabôco, em cima da bucha, não perde a linha: “Mais dotô, inté que é uma feiura caprichada.”

BOLDRIN, R. **Almanaque Brasil de Cultura Popular**. São Paulo: Andreato Comunicação e Cultura, n° 62, 2004 (adaptado).

Por suas características formais, por sua função e uso, o texto pertence ao gênero', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 111 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001df', 'ENEM-2011-112', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', '**TEXTO I**

![](conteudo/enem/2011/112-0c0d18b7.webp)

Toca do Salitre – Piauí  
Disponível em: http://www.fumdham.org.br. Acesso em: 27 jul. 2010.

**TEXTO II**

![](conteudo/enem/2011/112-afb1243e.webp)

Arte Urbana. Foto: Diego Singh  
Disponível em: http://www.diaadia.pr.gov.br. Acesso em: 27 jul. 2010.

O grafite contemporâneo, considerado em alguns momentos como uma arte marginal, tem sido comparado às pinturas murais de várias épocas e às escritas pré-históricas. Observando as imagens apresentadas, é possível reconhecer elementos comuns entre os tipos de pinturas murais, tais como', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 112 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e0', 'ENEM-2011-113', 11, 442, 'enem', 3, 2, 2011, 'multiple_choice', 'Escolas e textos literários', '**Estrada**

Esta estrada onde moro, entre duas voltas do caminho,  
Interessa mais que uma avenida urbana.  
Nas cidades todas as pessoas se parecem.  
Todo mundo é igual. Todo mundo é toda a gente.  
Aqui, não: sente-se bem que cada um traz a sua alma.  
Cada criatura é única.  
Até os cães.  
Estes cães da roça parecem homens de negócios:  
Andam sempre preocupados.  
E quanta gente vem e vai!  
E tudo tem aquele caráter impressivo que faz meditar:  
Enterro a pé ou a carrocinha de leite puxada por um bodezinho manhoso.  
Nem falta o murmúrio da água, para sugerir, pela voz dos símbolos,  
Que a vida passa! que a vida passa!  
E que a mocidade vai acabar.

BANDEIRA, M. **O ritmo dissoluto**. Rio de Janeiro: Aguilar, 1967.

A lírica de Manuel Bandeira é pautada na apreensão de significados profundos a partir de elementos do cotidiano. No poema Estrada, o lirismo presente no contraste entre campo e cidade aponta para', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 113 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e1', 'ENEM-2011-114', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', '![](conteudo/enem/2011/114-f1377ead.webp)

PICASSO, P. **Guernica**. Óleo sobre tela. 349 X 777 cm. Museu Reina Sofia, Espanha, 1937.  
Disponível em: http://www.fddreis.files.wordpress.com. Acesso em: 26 jul. 2010.

O pintor espanhol Pablo Picasso (1881-1973), um dos mais valorizados no mundo artístico, tanto em termos financeiros quanto históricos, criou a obra Guernica em protesto ao ataque aéreo à pequena cidade basca de mesmo nome. A obra, feita para integrar o Salão Internacional de Artes Plásticas de Paris, percorreu toda a Europa, chegando aos EUA e instalando-se no MoMA, de onde sairia apenas em 1981. Essa obra cubista apresenta elementos plásticos identificados pelo', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 114 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e2', 'ENEM-2011-115', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', 'No Brasil, a condição cidadã, embora dependa da leitura e da escrita, não se basta pela enunciação do direito, nem pelo domínio desses instrumentos, o que, sem dúvida, viabiliza melhor participação social. A condição cidadã depende, seguramente, da ruptura com o ciclo da pobreza, que penaliza um largo contingente populacional.

**Formação de leitores e construção da cidadania, memória e presença do PROLER**. Rio de Janeiro: FBN, 2008.

Ao argumentar que a aquisição das habilidades de leitura e escrita não são suficientes para garantir o exercício da cidadania, o autor', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 115 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e3', 'ENEM-2011-116', 11, 442, 'enem', 3, 2, 2011, 'multiple_choice', 'Escolas e textos literários', '**Lépida e leve**

Língua do meu Amor velosa e doce,  
que me convences de que sou frase,  
que me contornas, que me vestes quase,  
como se o corpo meu de ti vindo me fosse.  
Língua que me cativas, que me enleias  
os surtos de ave estranha,  
em linhas longas de invisíveis teias,  
de que és, há tanto, habilidosa aranha…  
\[…\]  
Amo-te as sugestões gloriosas e funestas,  
amo-te como todas as mulheres  
te amam, ó língua-lama, ó língua-resplendor,  
pela carne de som que à ideia emprestas  
e pelas frases mudas que proferes  
nos silêncios de Amor!…

MACHADO, G. In: MORICONI, I. (org.). **Os cem melhores poemas brasileiros do século**. Rio de Janeiro: Objetiva, 2001 (fragmento).

A poesia de Gilka Machado identifica-se com as concepções artísticas simbolistas. Entretanto, o texto selecionado incorpora referências temáticas e formais modernistas, já que, nele, a poeta', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 116 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e4', 'ENEM-2011-117', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', 'Abatidos pelo fadinho harmonioso e nostálgico dos desterrados, iam todos, até mesmo os brasileiros, se concentrando e caindo em tristeza; mas, de repente, o cavaquinho de Porfiro, acompanhado pelo violão do Firmo, romperam vibrantemente com um chorado baiano. Nada mais que os primeiros acordes da música crioula para que o sangue de toda aquela gente despertasse logo, como se alguém lhe fustigasse o corpo com urtigas bravas. E seguiram-se outras notas, e outras, cada vez mais ardentes e mais delirantes. Já não eram dois instrumentos que soavam, eram lúbricos gemidos e suspiros soltos em torrente, a correrem serpenteando, como cobras numa floresta incendiada; eram ais convulsos, chorados em frenesi de amor: música feita de beijos e soluços gostosos; carícia de fera, carícia de doer, fazendo estalar de gozo.

AZEVEDO, A. **O Cortiço**. São Paulo: Ática, 1983 (fragmento).

No romance O Cortiço (1890), de Aluízio Azevedo, as personagens são observadas como elementos coletivos caracterizados por condicionantes de origem social, sexo e etnia. Na passagem transcrita, o confronto entre brasileiros e portugueses revela prevalência do elemento brasileiro, pois', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 117 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e5', 'ENEM-2011-118', 11, 442, 'enem', 3, 2, 2011, 'multiple_choice', 'Escolas e textos literários', '**Guardar**

Guardar uma coisa não é escondê-la ou trancá-la.  
Em cofre não se guarda coisa alguma.  
Em cofre perde-se a coisa à vista.  
Guardar uma coisa é olhá-la, fitá-la, mirá-la por  
admirá-la, isto é, iluminá-la ou ser por ela iluminado.  
Guardar uma coisa é vigiá-la, isto é, fazer vigília por  
ela, isto é, velar por ela, isto é, estar acordado por ela,  
isto é, estar por ela ou ser por ela.  
Por isso melhor se guarda o voo de um pássaro  
Do que um pássaro sem voos.  
Por isso se escreve, por isso se diz, por isso se publica,  
por isso se declara e declama um poema:  
Para guardá-lo:  
Para que ele, por sua vez, guarde o que guarda:  
Guarde o que quer que guarda um poema:  
Por isso o lance do poema:  
Por guardar-se o que se quer guardar.

MACHADO, G. In: MORICONI, I. (org.). **Os cem melhores poemas brasileiros do século**. Rio de Janeiro: Objetiva, 2001.

A memória é um importante recurso do patrimônio cultural de uma nação. Ela está presente nas lembranças do passado e no acervo cultural de um povo. Ao tratar o fazer poético como uma das maneiras de se guardar o que se quer, o texto', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 118 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e6', 'ENEM-2011-119', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', 'Quando os portugueses se instalaram no Brasil, o país era povoado de índios. Importaram, depois, da África, grande número de escravos. O Português, o Índio e o Negro constituem, durante o período colonial, as três bases da população brasileira. Mas no que se refere à cultura, a contribuição do Português foi de longe a mais notada.

Durante muito tempo o português e o tupi viveram lado a lado como línguas de comunicação. Era o tupi que utilizavam os bandeirantes nas suas expedições. Em 1694, dizia o Padre Antônio Vieira que “as famílias dos portugueses e índios em São Paulo estão tão ligadas hoje umas com as outras, que as mulheres e os filhos se criam mística e domesticamente, e a língua que nas ditas famílias se fala é a dos Índios, e a portuguesa a vão os meninos aprender à escola.”

TEYSSIER, P. **História da língua portuguesa**. Lisboa: Livraria Sá da Costa, 1984 (adaptado).

A identidade de uma nação está diretamente ligada à cultura de seu povo. O texto mostra que, no período colonial brasileiro, o Português, o Índio e o Negro formaram a base da população e que o patrimônio linguístico brasileiro é resultado da', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 119 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e7', 'ENEM-2011-120', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', '**Pequeno concerto que virou canção**

Não, não há por que mentir ou esconder  
A dor que foi maior do que é capaz meu coração  
Não, nem há por que seguir cantando só para explicar  
Não vai nunca entender de amor quem nunca soube amar  
Ah, eu vou voltar pra mim  
Seguir sozinho assim  
Até me consumir ou consumir toda essa dor  
Até sentir de novo o coração capaz de amor

VANDRÉ, G. Disponível em: http://www.letras.terra.com.br. Acesso em: 29 jun. 2011.

Na canção de Geraldo Vandré, tem-se a manifestação da função poética da linguagem, que é percebida na elaboração artística e criativa da mensagem, por meio de combinações sonoras e rítmicas. Pela análise do texto, entretanto, percebe-se, também, a presença marcante da função emotiva ou expressiva, por meio da qual o emissor', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 120 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e8', 'ENEM-2011-121', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '**É água que não acaba mais**

Dados preliminares divulgados por pesquisadores da Universidade Federal do Pará (UFPA) apontaram o Aquífero Alter do Chão como o maior depósito de água potável do planeta. Com volume estimado em 86 000 quilômetros cúbicos de água doce, a reserva subterrânea está localizada sob os estados do Amazonas, Pará e Amapá. “Essa quantidade de água seria suficiente para abastecer a população mundial durante 500 anos”, diz Milton Matta, geólogo da UFPA. Em termos comparativos, Alter do Chão tem quase o dobro do volume de água do Aquífero Guarani (com 45 000 quilômetros cúbicos). Até então, Guarani era a maior reserva subterrânea do mundo, distribuída por Brasil, Argentina, Paraguai e Uruguai.

**Época**. N° 623, 26 abr. 2010.

Essa notícia, publicada em uma revista de grande circulação, apresenta resultados de uma pesquisa científica realizada por uma universidade brasileira. Nessa situação específica de comunicação, a função referencial da linguagem predomina, porque o autor do texto prioriza', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 121 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001e9', 'ENEM-2011-122', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2011/122-d8295ea3.webp)

Nós adoraríamos dizer que somos perfeitos. Que somos infalíveis. Que não cometemos nem mesmo o menor deslize. E só não falamos isso por um pequeno detalhe: seria uma mentira. Aliás, em vez de usar a palavra “mentira”, como acabamos de fazer, poderíamos optar por um eufemismo. “Meia-verdade”, por exemplo, seria um termo muito menos agressivo. Mas nós não usamos esta palavra simplesmente porque não acreditamos que exista uma “Meia-verdade”. Para o Conar, Conselho Nacional de Autorregulamentação Publicitária, existem a verdade e a mentira. Existem a honestidade e a desonestidade. Absolutamente nada no meio. O Conar nasceu há 29 anos (viu só? não arredondamos para 30) com a missão de zelar pela ética na publicidade. Não fazemos isso porque somos bonzinhos (gostaríamos de dizer isso, mas, mais uma vez, seria mentira). Fazemos isso porque é a única forma da propaganda ter o máximo de credibilidade. E, cá entre nós, para que serviria a propaganda se o consumidor não acreditasse nela?  
Qualquer pessoa que se sinta enganada por uma peça publicitária pode fazer uma reclamação ao Conar. Ele analisa cuidadosamente todas as denúncias e, quando é o caso, aplica a punição.

Anúncio veiculado na Revista **Veja**. São Paulo: Abril. Ed. 2120, ano 42, n° 27, 8 jul. 2009.

O recurso gráfico utilizado no anúncio publicitário — de destacar a potencial supressão de trecho do texto — reforça a eficácia pretendida, revelada na estratégia de', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 122 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ea', 'ENEM-2011-123', 1, 224, 'enem', 3, 2, 2011, 'multiple_choice', 'Gêneros textuais', '![](conteudo/enem/2011/123-d8350fd2.webp)

Nós adoraríamos dizer que somos perfeitos. Que somos infalíveis. Que não cometemos nem mesmo o menor deslize. E só não falamos isso por um pequeno detalhe: seria uma mentira. Aliás, em vez de usar a palavra “mentira”, como acabamos de fazer, poderíamos optar por um eufemismo. “Meia-verdade”, por exemplo, seria um termo muito menos agressivo. Mas nós não usamos esta palavra simplesmente porque não acreditamos que exista uma “Meia-verdade”. Para o Conar, Conselho Nacional de Autorregulamentação Publicitária, existem a verdade e a mentira. Existem a honestidade e a desonestidade. Absolutamente nada no meio. O Conar nasceu há 29 anos (viu só? não arredondamos para 30) com a missão de zelar pela ética na publicidade. Não fazemos isso porque somos bonzinhos (gostaríamos de dizer isso, mas, mais uma vez, seria mentira). Fazemos isso porque é a única forma da propaganda ter o máximo de credibilidade. E, cá entre nós, para que serviria a propaganda se o consumidor não acreditasse nela?  
Qualquer pessoa que se sinta enganada por uma peça publicitária pode fazer uma reclamação ao Conar. Ele analisa cuidadosamente todas as denúncias e, quando é o caso, aplica a punição.

Anúncio veiculado na Revista **Veja**. São Paulo: Abril. Ed. 2120, ano 42, n° 27, 8 jul. 2009.

Considerando a autoria e a seleção lexical desse texto, bem como os argumentos nele mobilizados, constata-se que o objetivo do autor do texto é', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 123 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001eb', 'ENEM-2011-124', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2011/124-d9afe727.webp)

**Veja**. 05 set. 1999 (adaptado).

O produtor de anúncios publicitários utiliza-se de estratégias persuasivas para influenciar o comportamento de seu leitor. Entre os recursos argumentativos mobilizados pelo autor para obter a adesão do público à campanha, destaca-se nesse texto', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 124 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ec', 'ENEM-2011-125', 15, 438, 'enem', 3, 2, 2011, 'multiple_choice', 'Arte e cultura', '**Entre ideia e tecnologia**

O grande conceito por trás do Museu da Língua é apresentar o idioma como algo vivo e fundamental para o entendimento do que é ser brasileiro. Se nada nos define com clareza, a forma como falamos o português nas mais diversas situações cotidianas é talvez a melhor expressão da brasilidade.

SCARDOVELI, E. **Revista Língua Portuguesa**. São Paulo: Segmento, Ano II, n° 6, 2006.

O texto propõe uma reflexão acerca da língua portuguesa, ressaltando para o leitor a', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 125 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ed', 'ENEM-2011-126', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '**TEXTO I**

O Brasil sempre deu respostas rápidas através da solidariedade do seu povo. Mas a mesma força que nos motiva a ajudar o próximo deveria também nos motivar a ter atitudes cidadãs. Não podemos mais transferir a culpa para quem é vítima ou até mesmo para a própria natureza, como se essa seguisse a lógica humana. Sobram desculpas esfarrapadas e falta competência da classe política.

Cartas. **Istoé**. 28 abr. 2010.

**TEXTO II**

Não podemos negar ao povo sofrido todas as hipóteses de previsão dos desastres. Demagogos culpam os moradores; o governo e a prefeitura apelam para as pessoas saírem das áreas de risco e agora dizem que será compulsória a realocação. Então temos a realocar o Brasil inteiro! Criemos um serviço, similar ao SUS, com alocação obrigatória de recursos orçamentários com rede de atendimento preventivo, onde participariam arquitetos, engenheiros, geólogos. Bem ou mal, esse “SUS” organizaria brigadas nos locais. Nos casos da dengue, por exemplo, poderia verificar as condições de acontecer epidemias. Seriam boas ações preventivas.

Carta do Leitor. **Carta Capital**. 28 abr. 2010 (adaptado).

Os textos apresentados expressam opiniões de leitores acerca de relevante assunto para a sociedade brasileira. Os autores dos dois textos apontam para a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 126 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ee', 'ENEM-2011-127', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '![](conteudo/enem/2011/127-093a87ad.webp)

Disponível em: http://www.ccsp.com.br. Acesso em: 27 jul. 2010 (adaptado).

O texto é uma propaganda de um adoçante que tem o seguinte mote: “Mude sua embalagem”. A estratégia que o autor utiliza para o convencimento do leitor baseia-se no emprego de recursos expressivos, verbais e não verbais, com vistas a', 'Gabarito oficial do INEP: alternativa D.', null, 'ENEM 2011 · 2º dia · Questão 127 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001ef', 'ENEM-2011-128', 1, 215, 'enem', 3, 2, 2011, 'multiple_choice', 'Variação linguística', 'Motivadas ou não historicamente, normas prestigiadas ou estigmatizadas pela comunidade sobrepõem-se ao longo do território, seja numa relação de oposição, seja de complementaridade, sem, contudo, anular a interseção de usos que configuram uma norma nacional distinta da do português europeu. Ao focalizar essa questão, que opõe não só as normas do português de Portugal às normas do português brasileiro, mas também as chamadas normas cultas locais às populares ou vernáculas, deve-se insistir na ideia de que essas normas se consolidaram em diferentes momentos da nossa história e que só a partir do século XVIII se pode começar a pensar na bifurcação das variantes continentais, ora em consequência de mudanças ocorridas no Brasil, ora em Portugal, ora, ainda, em ambos os territórios.

CALLOU, D. Gramática, variação e normas. In: VIEIRA, S. R.; BRANDÃO, S. (orgs). **Ensino de gramática**: descrição e uso. São Paulo: Contexto, 2007 (adaptado).

O português do Brasil não é uma língua uniforme. A variação linguística é um fenômeno natural, ao qual todas as línguas estão sujeitas. Ao considerar as variedades linguísticas, o texto mostra que as normas podem ser aprovadas ou condenadas socialmente, chamando a atenção do leitor para a', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 128 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001f0', 'ENEM-2011-129', 1, 445, 'enem', 3, 2, 2011, 'multiple_choice', 'Gramática e sentido', '![](conteudo/enem/2011/129-5e1eed51.webp)

VERÍSSIMO, L. F. **As cobras em: Se Deus existe que eu seja atingido por um raio**. Porto Alegre: L&PM, 1997.

O humor da tira decorre da reação de uma das cobras com relação ao uso de pronome pessoal reto, em vez de pronome oblíquo. De acordo com a norma padrão da língua, esse uso é inadequado, pois', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 129 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001f1', 'ENEM-2011-130', 1, 439, 'enem', 3, 2, 2011, 'multiple_choice', 'Compreensão e interpretação', '**MANDIOCA — mais um presente da Amazônia**

_Aipim_, _castelinha_, _macaxeira_, _maniva_, _maniveira_. As designações da _Manihot utilissima_ podem variar de região, no Brasil, mas uma delas deve ser levada em conta em todo o território nacional: pão-de-pobre — e por motivos óbvios.

Rica em fécula, a mandioca — uma planta rústica e nativa da Amazônia disseminada no mundo inteiro, especialmente pelos colonizadores portugueses — é a base de sustento de muitos brasileiros e o único alimento disponível para mais de 600 milhões de pessoas em vários pontos do planeta, e em particular em algumas regiões da África.

**O melhor do Globo Rural**. Fev. 2005 (fragmento).

De acordo com o texto, há no Brasil uma variedade de nomes para a Manihot utilissima, nome científico da mandioca. Esse fenômeno revela que', 'Gabarito oficial do INEP: alternativa A.', null, 'ENEM 2011 · 2º dia · Questão 130 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001f2', 'ENEM-2011-131', 1, 445, 'enem', 3, 2, 2011, 'multiple_choice', 'Gramática e sentido', 'Há certos usos consagrados na fala, e até mesmo na escrita, que, a depender do estrato social e do nível de escolaridade do falante, são, sem dúvida, previsíveis. Ocorrem até mesmo em falantes que dominam a variedade padrão, pois, na verdade, revelam tendências existentes na língua em seu processo de mudança que não podem ser bloqueadas em nome de um “ideal linguístico” que estaria representado pelas regras da gramática normativa. Usos como _ter_ por _haver_ em construções existenciais (_tem_ muitos livros na estante), o do pronome objeto na posição de sujeito (para _mim_ fazer o trabalho), a não-concordância das passivas com _se_ (_aluga-se_ casas) são indícios da existência, não de uma norma única, mas de uma pluralidade de normas, entendida, mais uma vez, norma como conjunto de hábitos linguísticos, sem implicar juízo de valor.

CALLOU, D. Gramática, variação e normas. In: VIEIRA, S. R.; BRANDÃO, S. (orgs). **Ensino de gramática**: descrição e uso. São Paulo: Contexto, 2007 (fragmento).

Considerando a reflexão trazida no texto a respeito da multiplicidade do discurso, verifica-se que', 'Gabarito oficial do INEP: alternativa B.', null, 'ENEM 2011 · 2º dia · Questão 131 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001f3', 'ENEM-2011-132', 1, 441, 'enem', 3, 2, 2011, 'multiple_choice', 'Tecnologias da comunicação', '**Palavra indígena**

_A história da tribo Sapucaí, que traduziu para o idioma guarani os artefatos da era da computação que ganharam importância em sua vida, como mouse (que eles chamam de angojhá) e windows (oventã)_

Quando a internet chegou àquela comunidade, que abriga em torno de 400 guaranis, há quatro anos, por meio de um projeto do Comitê para Democratização da Informática (CDI), em parceria com a ONG Rede Povos da Floresta e com antena cedida pela _Star One_ (da Embratel), Potty e sua aldeia logo vislumbraram as possibilidades de comunicação que a _web_ traz.

Ele conta que usam a rede, por enquanto, somente para preparação e envio de documentos, mas perceberam que ela pode ajudar na preservação da cultura indígena.

A apropriação da rede se deu de forma gradual, mas os guaranis já incorporaram a novidade tecnológica ao seu estilo de vida. A importância da internet e da computação para eles está expressa num caso de rara incorporação: a do vocabulário.

— Um dia, o cacique da aldeia Sapucaí me ligou. “A gente não está querendo chamar computador de “computador”. Sugeri a eles que criassem uma palavra em guarani. E criaram _aiú irú rive_, “caixa pra acumular a língua”. Nós, brancos, usamos _mouse_, w_indows_ e outros termos, que eles começaram a adaptar para o idioma deles, como _angojhá_ (rato) e _oventã_ (janela) — conta Rodrigo Baggio, diretor do CDI.

Disponível em: http://www.revistalingua.uol.com.br. Acesso em: 22 jul. 2010.

O uso das novas tecnologias de informação e comunicação fez surgir uma série de novos termos que foram acolhidos na sociedade brasileira em sua forma original, como: mouse, windows, download, site, homepage, entre outros. O texto trata da adaptação de termos da informática à língua indígena como uma reação da tribo Sapucaí, o que revela', 'Gabarito oficial do INEP: alternativa C.', null, 'ENEM 2011 · 2º dia · Questão 132 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z'),
  ('e2000000-0000-4000-a000-0000000001f4', 'ENEM-2011-133', 1, 441, 'enem', 3, 2, 2011, 'multiple_choice', 'Tecnologias da comunicação', '![](conteudo/enem/2011/133-168ef904.webp)

Disponível em: http://www.wordinfo.info. Acesso em: 27 abr. 2010.

O homem evoluiu. Independentemente de teoria, essa evolução ocorreu de várias formas. No que concerne à evolução digital, o homem percorreu longo trajeto da pedra lascada ao mundo virtual. Tal fato culminou em um problema físico habitual, ilustrado na imagem, que propicia uma piora na qualidade de vida do usuário, uma vez que', 'Gabarito oficial do INEP: alternativa E.', null, 'ENEM 2011 · 2º dia · Questão 133 · Prova oficial aplicada pelo INEP.', 'published', '2026-11-28T00:00:00.000Z')
on conflict (id) do nothing;
insert into public.question_options (id, question_id, position, body, is_correct) values
  ('e2000000-0000-4000-b000-00000000000a', 'e2000000-0000-4000-a000-000000000001', 0, 'Reduzir o calor irradiado pela Terra mediante a substituição da produção primária pela industrialização refrigerada.', false),
  ('e2000000-0000-4000-b000-00000000000b', 'e2000000-0000-4000-a000-000000000001', 1, 'Promover a queima da biomassa vegetal, responsável pelo aumento do efeito estufa devido à produção de CH4.', false),
  ('e2000000-0000-4000-b000-00000000000c', 'e2000000-0000-4000-a000-000000000001', 2, 'Reduzir o desmatamento, mantendo-se, assim, o potencial da vegetação em absorver o CO2 da atmosfera.', true),
  ('e2000000-0000-4000-b000-00000000000d', 'e2000000-0000-4000-a000-000000000001', 3, 'Aumentar a concentração atmosférica de H2O, molécula capaz de absorver grande quantidade de calor.', false),
  ('e2000000-0000-4000-b000-00000000000e', 'e2000000-0000-4000-a000-000000000001', 4, 'Remover moléculas orgânicas polares da atmosfera, diminuindo a capacidade delas de reter calor.', false),
  ('e2000000-0000-4000-b000-000000000014', 'e2000000-0000-4000-a000-000000000002', 0, 'Concentração média de álcool no sangue ao longo do dia.', false),
  ('e2000000-0000-4000-b000-000000000015', 'e2000000-0000-4000-a000-000000000002', 1, 'Variação da frequência da ingestão de álcool ao longo das horas.', false),
  ('e2000000-0000-4000-b000-000000000016', 'e2000000-0000-4000-a000-000000000002', 2, 'Concentração mínima de álcool no sangue a partir de diferentes dosagens.', false),
  ('e2000000-0000-4000-b000-000000000017', 'e2000000-0000-4000-a000-000000000002', 3, 'Estimativa de tempo necessário para metabolizar diferentes quantidades de álcool.', true),
  ('e2000000-0000-4000-b000-000000000018', 'e2000000-0000-4000-a000-000000000002', 4, 'Representação gráfica da distribuição de frequência de álcool em determinada hora do dia.', false),
  ('e2000000-0000-4000-b000-00000000001e', 'e2000000-0000-4000-a000-000000000003', 0, 'Induzir a imunidade, para proteger o organismo da contaminação viral.', true),
  ('e2000000-0000-4000-b000-00000000001f', 'e2000000-0000-4000-a000-000000000003', 1, 'Ser capaz de alterar o genoma do organismo portador, induzindo a síntese de enzimas protetoras.', false),
  ('e2000000-0000-4000-b000-000000000020', 'e2000000-0000-4000-a000-000000000003', 2, 'Produzir antígenos capazes de se ligarem ao vírus, impedindo que este entre nas células do organismo humano.', false),
  ('e2000000-0000-4000-b000-000000000021', 'e2000000-0000-4000-a000-000000000003', 3, 'Ser amplamente aplicada em animais, visto que esses são os principais transmissores do vírus para os seres humanos.', false),
  ('e2000000-0000-4000-b000-000000000022', 'e2000000-0000-4000-a000-000000000003', 4, 'Estimular a imunidade, minimizando a transmissão do vírus por gotículas de saliva.', false),
  ('e2000000-0000-4000-b000-000000000028', 'e2000000-0000-4000-a000-000000000004', 0, 'Os genótipos e os fenótipos idênticos.', false),
  ('e2000000-0000-4000-b000-000000000029', 'e2000000-0000-4000-a000-000000000004', 1, 'Os genótipos idênticos e os fenótipos diferentes.', true),
  ('e2000000-0000-4000-b000-00000000002a', 'e2000000-0000-4000-a000-000000000004', 2, 'Diferenças nos genótipos e fenótipos.', false),
  ('e2000000-0000-4000-b000-00000000002b', 'e2000000-0000-4000-a000-000000000004', 3, 'O mesmo fenótipo e apenas dois genótipos diferentes.', false),
  ('e2000000-0000-4000-b000-00000000002c', 'e2000000-0000-4000-a000-000000000004', 4, 'O mesmo fenótipo e grande variedade de genótipos.', false),
  ('e2000000-0000-4000-b000-000000000032', 'e2000000-0000-4000-a000-000000000005', 0, 'Ptolomeu apresentou as ideias mais valiosas, por serem mais antigas e tradicionais.', false),
  ('e2000000-0000-4000-b000-000000000033', 'e2000000-0000-4000-a000-000000000005', 1, 'Copérnico desenvolveu a teoria do heliocentrismo inspirado no contexto político do Rei Sol.', false),
  ('e2000000-0000-4000-b000-000000000034', 'e2000000-0000-4000-a000-000000000005', 2, 'Copérnico viveu em uma época em que a pesquisa científica era livre e amplamente incentivada pelas autoridades.', false),
  ('e2000000-0000-4000-b000-000000000035', 'e2000000-0000-4000-a000-000000000005', 3, 'Kepler estudou o planeta Marte para atender às necessidades de expansão econômica e científica da Alemanha.', false),
  ('e2000000-0000-4000-b000-000000000036', 'e2000000-0000-4000-a000-000000000005', 4, 'Kepler apresentou uma teoria científica que, graças aos métodos aplicados, pôde ser testada e generalizada.', true),
  ('e2000000-0000-4000-b000-00000000003c', 'e2000000-0000-4000-a000-000000000006', 0, 'Aumento da porcentagem de carbono contido na Terra.', false),
  ('e2000000-0000-4000-b000-00000000003d', 'e2000000-0000-4000-a000-000000000006', 1, 'Redução na taxa de fotossíntese dos vegetais superiores.', false),
  ('e2000000-0000-4000-b000-00000000003e', 'e2000000-0000-4000-a000-000000000006', 2, 'Aumento da produção de carboidratos de origem vegetal.', false),
  ('e2000000-0000-4000-b000-00000000003f', 'e2000000-0000-4000-a000-000000000006', 3, 'Aumento na quantidade de carbono presente na atmosfera.', true),
  ('e2000000-0000-4000-b000-000000000040', 'e2000000-0000-4000-a000-000000000006', 4, 'Redução da quantidade global de carbono armazenado nos oceanos.', false),
  ('e2000000-0000-4000-b000-000000000046', 'e2000000-0000-4000-a000-000000000007', 0, 'O aperfeiçoamento do processo de extração de insulina a partir do pâncreas suíno.', false),
  ('e2000000-0000-4000-b000-000000000047', 'e2000000-0000-4000-a000-000000000007', 1, 'A seleção de microrganismos resistentes a antibióticos.', false),
  ('e2000000-0000-4000-b000-000000000048', 'e2000000-0000-4000-a000-000000000007', 2, 'O progresso na técnica da síntese química de hormônios.', false),
  ('e2000000-0000-4000-b000-000000000049', 'e2000000-0000-4000-a000-000000000007', 3, 'Impacto favorável na saúde de indivíduos diabéticos.', true),
  ('e2000000-0000-4000-b000-00000000004a', 'e2000000-0000-4000-a000-000000000007', 4, 'A criação de animais transgênicos.', false),
  ('e2000000-0000-4000-b000-000000000050', 'e2000000-0000-4000-a000-000000000008', 0, 'A poluição da água por metais da usina.', false),
  ('e2000000-0000-4000-b000-000000000051', 'e2000000-0000-4000-a000-000000000008', 1, 'A destruição do habitat de animais terrestres.', true),
  ('e2000000-0000-4000-b000-000000000052', 'e2000000-0000-4000-a000-000000000008', 2, 'O aumento expressivo na liberação de CO2 para a atmosfera.', false),
  ('e2000000-0000-4000-b000-000000000053', 'e2000000-0000-4000-a000-000000000008', 3, 'O consumo não renovável de toda água que passa pelas turbinas.', false),
  ('e2000000-0000-4000-b000-000000000054', 'e2000000-0000-4000-a000-000000000008', 4, 'O aprofundamento no leito do rio, com a menor deposição de resíduos no trecho de rio anterior à represa.', false),
  ('e2000000-0000-4000-b000-00000000005a', 'e2000000-0000-4000-a000-000000000009', 0, 'As áreas não-florestais ficam restritas a refúgios ecológicos devido à baixa adaptabilidade de espécies não-florestais a ambientes áridos.', false),
  ('e2000000-0000-4000-b000-00000000005b', 'e2000000-0000-4000-a000-000000000009', 1, 'Grande parte da diversidade de espécies vegetais é reduzida, uma vez que necessitam de condições semelhantes a dos períodos interglaciais.', false),
  ('e2000000-0000-4000-b000-00000000005c', 'e2000000-0000-4000-a000-000000000009', 2, 'A vegetação comum ao cerrado deve ter se limitado a uma pequena região do centro do Brasil, da qual se expandiu até atingir a atual distribuição.', false),
  ('e2000000-0000-4000-b000-00000000005d', 'e2000000-0000-4000-a000-000000000009', 3, 'Plantas com adaptações ao clima árido, como o desenvolvimento de estruturas que reduzem a perda de água, devem apresentar maior área de distribuição.', true),
  ('e2000000-0000-4000-b000-00000000005e', 'e2000000-0000-4000-a000-000000000009', 4, 'Florestas tropicais como a amazônica apresentam distribuição geográfica mais ampla, uma vez que são densas e diminuem a ação da radiação solar sobre o solo e reduzem os efeitos da aridez.', false),
  ('e2000000-0000-4000-b000-000000000064', 'e2000000-0000-4000-a000-00000000000a', 0, 'O CO2 e a água são moléculas de alto teor energético.', false),
  ('e2000000-0000-4000-b000-000000000065', 'e2000000-0000-4000-a000-00000000000a', 1, 'Os carboidratos convertem energia solar em energia química.', false),
  ('e2000000-0000-4000-b000-000000000066', 'e2000000-0000-4000-a000-00000000000a', 2, 'A vida na Terra depende, em última análise, da energia proveniente do Sol.', true),
  ('e2000000-0000-4000-b000-000000000067', 'e2000000-0000-4000-a000-00000000000a', 3, 'O processo respiratório é responsável pela retirada de carbono da atmosfera.', false),
  ('e2000000-0000-4000-b000-000000000068', 'e2000000-0000-4000-a000-00000000000a', 4, 'A produção de biomassa e de combustível fóssil, por si, é responsável pelo aumento de CO2 atmosférico.', false),
  ('e2000000-0000-4000-b000-00000000006e', 'e2000000-0000-4000-a000-00000000000b', 0, 'Digestório, pois produz enzimas que atuam na quebra de alimentos calóricos.', false),
  ('e2000000-0000-4000-b000-00000000006f', 'e2000000-0000-4000-a000-00000000000b', 1, 'Imunológico, pois suas células agem no sangue, diminuindo a condução do calor.', false),
  ('e2000000-0000-4000-b000-000000000070', 'e2000000-0000-4000-a000-00000000000b', 2, 'Nervoso, pois promove a sudorese, que permite perda de calor por meio da evaporação da água.', true),
  ('e2000000-0000-4000-b000-000000000071', 'e2000000-0000-4000-a000-00000000000b', 3, 'Reprodutor, pois secreta hormônios que alteram a temperatura, principalmente durante a menopausa.', false),
  ('e2000000-0000-4000-b000-000000000072', 'e2000000-0000-4000-a000-00000000000b', 4, 'Endócrino, pois fabrica anticorpos que, por sua vez, atuam na variação do diâmetro dos vasos periféricos.', false),
  ('e2000000-0000-4000-b000-000000000078', 'e2000000-0000-4000-a000-00000000000c', 0, 'Mais eficiente em pH básico.', true),
  ('e2000000-0000-4000-b000-000000000079', 'e2000000-0000-4000-a000-00000000000c', 1, 'Mais eficiente em pH ácido.', false),
  ('e2000000-0000-4000-b000-00000000007a', 'e2000000-0000-4000-a000-00000000000c', 2, 'Mais eficiente em pH neutro.', false),
  ('e2000000-0000-4000-b000-00000000007b', 'e2000000-0000-4000-a000-00000000000c', 3, 'Eficiente em qualquer faixa de pH.', false),
  ('e2000000-0000-4000-b000-00000000007c', 'e2000000-0000-4000-a000-00000000000c', 4, 'Mais eficiente em pH ácido ou neutro.', false),
  ('e2000000-0000-4000-b000-000000000082', 'e2000000-0000-4000-a000-00000000000d', 0, 'Impedir a abertura e a pavimentação de rodovias em áreas rurais e em regiões preservadas, pois a qualidade de vida e as tecnologias encontradas nos centros urbanos são prescindíveis às populações rurais.', false),
  ('e2000000-0000-4000-b000-000000000083', 'e2000000-0000-4000-a000-00000000000d', 1, 'Impedir a abertura e a pavimentação de rodovias em áreas rurais e em regiões preservadas, promovendo a migração das populações rurais para os centros urbanos, onde a qualidade de vida é melhor.', false),
  ('e2000000-0000-4000-b000-000000000084', 'e2000000-0000-4000-a000-00000000000d', 2, 'Permitir a abertura e a pavimentação de rodovias apenas em áreas rurais produtivas, haja vista que nas demais áreas o retorno financeiro necessário para produzir uma melhoria na qualidade de vida da região não é garantido.', false),
  ('e2000000-0000-4000-b000-000000000085', 'e2000000-0000-4000-a000-00000000000d', 3, 'Permitir a abertura e a pavimentação de rodovias, desde que comprovada a sua real necessidade e após a realização de estudos que demonstrem ser possível contornar ou compensar seus impactos ambientais.', true),
  ('e2000000-0000-4000-b000-000000000086', 'e2000000-0000-4000-a000-00000000000d', 4, 'Permitir a abertura e a pavimentação de rodovias, haja vista que os impactos ao meio ambiente são temporários e podem ser facilmente revertidos com as tecnologias existentes para recuperação de áreas degradadas.', false),
  ('e2000000-0000-4000-b000-00000000008c', 'e2000000-0000-4000-a000-00000000000e', 0, 'Aumentar a quantidade de combustível para queima na usina de força.', false),
  ('e2000000-0000-4000-b000-00000000008d', 'e2000000-0000-4000-a000-00000000000e', 1, 'Utilizar lâmpadas incandescentes, que geram pouco calor e muita luminosidade.', false),
  ('e2000000-0000-4000-b000-00000000008e', 'e2000000-0000-4000-a000-00000000000e', 2, 'Manter o menor número possível de aparelhos elétricos em funcionamento nas moradias.', false),
  ('e2000000-0000-4000-b000-00000000008f', 'e2000000-0000-4000-a000-00000000000e', 3, 'Utilizar cabos com menor diâmetro nas linhas de transmissão a fim de economizar o material condutor.', false),
  ('e2000000-0000-4000-b000-000000000090', 'e2000000-0000-4000-a000-00000000000e', 4, 'Utilizar materiais com melhores propriedades condutoras nas linhas de transmissão e lâmpadas fluorescentes nas moradias.', true),
  ('e2000000-0000-4000-b000-000000000096', 'e2000000-0000-4000-a000-00000000000f', 0, 'Au, Pt, Ag, Zn, Ni e Pb.', false),
  ('e2000000-0000-4000-b000-000000000097', 'e2000000-0000-4000-a000-00000000000f', 1, 'Au, Pt e Ag.', true),
  ('e2000000-0000-4000-b000-000000000098', 'e2000000-0000-4000-a000-00000000000f', 2, 'Zn, Ni e Pb.', false),
  ('e2000000-0000-4000-b000-000000000099', 'e2000000-0000-4000-a000-00000000000f', 3, 'Au e Zn.', false),
  ('e2000000-0000-4000-b000-00000000009a', 'e2000000-0000-4000-a000-00000000000f', 4, 'Ag e Pb.', false),
  ('e2000000-0000-4000-b000-0000000000a0', 'e2000000-0000-4000-a000-000000000010', 0, 'A única molécula que participa da produção de proteínas é o DNA.', false),
  ('e2000000-0000-4000-b000-0000000000a1', 'e2000000-0000-4000-a000-000000000010', 1, 'O fluxo de informação genética, nos sistemas biológicos, é unidirecional.', false),
  ('e2000000-0000-4000-b000-0000000000a2', 'e2000000-0000-4000-a000-000000000010', 2, 'As fontes de informação ativas durante o processo de transcrição são as proteínas.', false),
  ('e2000000-0000-4000-b000-0000000000a3', 'e2000000-0000-4000-a000-000000000010', 3, 'É possível obter diferentes variantes proteicas a partir de um mesmo produto de transcrição.', true),
  ('e2000000-0000-4000-b000-0000000000a4', 'e2000000-0000-4000-a000-000000000010', 4, 'A molécula de DNA possui forma circular e as demais moléculas possuem forma de fita simples linearizadas.', false),
  ('e2000000-0000-4000-b000-0000000000aa', 'e2000000-0000-4000-a000-000000000011', 0, '80 m.', false),
  ('e2000000-0000-4000-b000-0000000000ab', 'e2000000-0000-4000-a000-000000000011', 1, '430 m.', false),
  ('e2000000-0000-4000-b000-0000000000ac', 'e2000000-0000-4000-a000-000000000011', 2, '800 m.', false),
  ('e2000000-0000-4000-b000-0000000000ad', 'e2000000-0000-4000-a000-000000000011', 3, '1.600 m.', false),
  ('e2000000-0000-4000-b000-0000000000ae', 'e2000000-0000-4000-a000-000000000011', 4, '6.400 m.', true),
  ('e2000000-0000-4000-b000-0000000000b4', 'e2000000-0000-4000-a000-000000000012', 0, 'Vazão de ar e potência.', false),
  ('e2000000-0000-4000-b000-0000000000b5', 'e2000000-0000-4000-a000-000000000012', 1, 'Vazão de ar e corrente elétrica - ciclo frio.', false),
  ('e2000000-0000-4000-b000-0000000000b6', 'e2000000-0000-4000-a000-000000000012', 2, 'Eficiência energética e potência.', false),
  ('e2000000-0000-4000-b000-0000000000b7', 'e2000000-0000-4000-a000-000000000012', 3, 'Capacidade de refrigeração e frequência.', false),
  ('e2000000-0000-4000-b000-0000000000b8', 'e2000000-0000-4000-a000-000000000012', 4, 'Capacidade de refrigeração e corrente elétrica - ciclo frio.', true),
  ('e2000000-0000-4000-b000-0000000000be', 'e2000000-0000-4000-a000-000000000013', 0, '4.070.', false),
  ('e2000000-0000-4000-b000-0000000000bf', 'e2000000-0000-4000-a000-000000000013', 1, '4.270.', false),
  ('e2000000-0000-4000-b000-0000000000c0', 'e2000000-0000-4000-a000-000000000013', 2, '4.320.', false),
  ('e2000000-0000-4000-b000-0000000000c1', 'e2000000-0000-4000-a000-000000000013', 3, '4.390.', true),
  ('e2000000-0000-4000-b000-0000000000c2', 'e2000000-0000-4000-a000-000000000013', 4, '4.470.', false),
  ('e2000000-0000-4000-b000-0000000000c8', 'e2000000-0000-4000-a000-000000000014', 0, 'Reduzir a quantidade de combustível fornecido à usina para ser queimado.', false),
  ('e2000000-0000-4000-b000-0000000000c9', 'e2000000-0000-4000-a000-000000000014', 1, 'Reduzir o volume de água do lago que circula no condensador de vapor.', false),
  ('e2000000-0000-4000-b000-0000000000ca', 'e2000000-0000-4000-a000-000000000014', 2, 'Reduzir o tamanho da bomba usada para devolver a água líquida à caldeira.', false),
  ('e2000000-0000-4000-b000-0000000000cb', 'e2000000-0000-4000-a000-000000000014', 3, 'Melhorar a capacidade dos dutos com vapor conduzirem calor para o ambiente.', false),
  ('e2000000-0000-4000-b000-0000000000cc', 'e2000000-0000-4000-a000-000000000014', 4, 'Usar o calor liberado com os gases pela chaminé para mover um outro gerador.', true),
  ('e2000000-0000-4000-b000-0000000000d2', 'e2000000-0000-4000-a000-000000000015', 0, '![](conteudo/enem/2009/21-a-9d7cdc06.webp)', false),
  ('e2000000-0000-4000-b000-0000000000d3', 'e2000000-0000-4000-a000-000000000015', 1, '![](conteudo/enem/2009/21-b-7a052a7f.webp)', false),
  ('e2000000-0000-4000-b000-0000000000d4', 'e2000000-0000-4000-a000-000000000015', 2, '![](conteudo/enem/2009/21-c-6a5e3a17.webp)', true),
  ('e2000000-0000-4000-b000-0000000000d5', 'e2000000-0000-4000-a000-000000000015', 3, '![](conteudo/enem/2009/21-d-482b95e7.webp)', false),
  ('e2000000-0000-4000-b000-0000000000d6', 'e2000000-0000-4000-a000-000000000015', 4, '![](conteudo/enem/2009/21-e-a7fa1fd3.webp)', false),
  ('e2000000-0000-4000-b000-0000000000dc', 'e2000000-0000-4000-a000-000000000016', 0, 'Provoca ferimento na pele do paciente ao serem introduzidos os eletrodos, rompendo o epitélio.', false),
  ('e2000000-0000-4000-b000-0000000000dd', 'e2000000-0000-4000-a000-000000000016', 1, 'Aumenta o risco de estresse nos pacientes, causado pela aplicação da corrente elétrica.', false),
  ('e2000000-0000-4000-b000-0000000000de', 'e2000000-0000-4000-a000-000000000016', 2, 'Inibe o mecanismo de ação dos medicamentos no tecido-alvo, pois estes passam a entrar por meio da pele.', false),
  ('e2000000-0000-4000-b000-0000000000df', 'e2000000-0000-4000-a000-000000000016', 3, 'Diminui o efeito colateral dos medicamentos, se comparados com aqueles em que a ingestão se faz por via oral.', true),
  ('e2000000-0000-4000-b000-0000000000e0', 'e2000000-0000-4000-a000-000000000016', 4, 'Deve ser eficaz para medicamentos constituídos de moléculas polares e ineficaz, se essas forem apolares.', false),
  ('e2000000-0000-4000-b000-0000000000e6', 'e2000000-0000-4000-a000-000000000017', 0, 'Deixar de consumir aparelhos elétricos que utilizem pilha ou bateria como fonte de energia.', false),
  ('e2000000-0000-4000-b000-0000000000e7', 'e2000000-0000-4000-a000-000000000017', 1, 'Usar apenas pilhas ou baterias recarregáveis e de vida útil longa e evitar ingerir alimentos contaminados, especialmente peixes.', false),
  ('e2000000-0000-4000-b000-0000000000e8', 'e2000000-0000-4000-a000-000000000017', 2, 'Devolver pilhas e baterias, após o esgotamento da energia armazenada, à rede de assistência técnica especializada para repasse a fabricantes e/ou importadores.', false),
  ('e2000000-0000-4000-b000-0000000000e9', 'e2000000-0000-4000-a000-000000000017', 3, 'Criar nas cidades, especialmente naquelas com mais de 100 mil habitantes, pontos estratégicos de coleta de baterias e pilhas, para posterior repasse a fabricantes e/ou importadores.', false),
  ('e2000000-0000-4000-b000-0000000000ea', 'e2000000-0000-4000-a000-000000000017', 4, 'Exigir que fabricantes invistam em pesquisa para a substituição desses metais tóxicos por substâncias menos nocivas ao homem e ao ambiente, e que não sejam bioacumulativas.', true),
  ('e2000000-0000-4000-b000-0000000000f0', 'e2000000-0000-4000-a000-000000000018', 0, 'A insolação é um fator que provoca variação da umidade relativa do ar.', true),
  ('e2000000-0000-4000-b000-0000000000f1', 'e2000000-0000-4000-a000-000000000018', 1, 'O ar vai adquirindo maior quantidade de vapor de água à medida que se aquece.', false),
  ('e2000000-0000-4000-b000-0000000000f2', 'e2000000-0000-4000-a000-000000000018', 2, 'A presença de umidade relativa do ar é diretamente proporcional à temperatura do ar.', false),
  ('e2000000-0000-4000-b000-0000000000f3', 'e2000000-0000-4000-a000-000000000018', 3, 'A umidade relativa do ar indica, em termos absolutos, a quantidade de vapor de água existente na atmosfera.', false),
  ('e2000000-0000-4000-b000-0000000000f4', 'e2000000-0000-4000-a000-000000000018', 4, 'A variação da umidade do ar se verifica no verão, e não no inverno, quando as temperaturas permanecem baixas.', false),
  ('e2000000-0000-4000-b000-0000000000fa', 'e2000000-0000-4000-a000-000000000019', 0, 'A especificidade aponta um número de 5 falsos positivos.', false),
  ('e2000000-0000-4000-b000-0000000000fb', 'e2000000-0000-4000-a000-000000000019', 1, 'O teste, a cada 100 indivíduos infectados, classificaria 90 como positivos.', true),
  ('e2000000-0000-4000-b000-0000000000fc', 'e2000000-0000-4000-a000-000000000019', 2, 'O teste classificaria 96 como positivos em cada 100 indivíduos não infectados.', false),
  ('e2000000-0000-4000-b000-0000000000fd', 'e2000000-0000-4000-a000-000000000019', 3, 'Ações de profilaxia são medidas adotadas para o tratamento de falsos positivos.', false),
  ('e2000000-0000-4000-b000-0000000000fe', 'e2000000-0000-4000-a000-000000000019', 4, 'Testes de alta sensibilidade resultam em maior número de animais falsos negativos comparado a um teste de baixa sensibilidade.', false),
  ('e2000000-0000-4000-b000-000000000104', 'e2000000-0000-4000-a000-00000000001a', 0, 'HNO3 e HNO2.', false),
  ('e2000000-0000-4000-b000-000000000105', 'e2000000-0000-4000-a000-00000000001a', 1, 'H2SO4 e H2SO3.', false),
  ('e2000000-0000-4000-b000-000000000106', 'e2000000-0000-4000-a000-00000000001a', 2, 'H2SO3 e HNO2.', false),
  ('e2000000-0000-4000-b000-000000000107', 'e2000000-0000-4000-a000-00000000001a', 3, 'H2SO4 e HNO3.', true),
  ('e2000000-0000-4000-b000-000000000108', 'e2000000-0000-4000-a000-00000000001a', 4, 'H2CO3 e H2SO3.', false),
  ('e2000000-0000-4000-b000-00000000010e', 'e2000000-0000-4000-a000-00000000001b', 0, 'Se justifica porque o tamanho do telescópio determina a sua massa, enquanto seu pequeno peso decorre da falta de ação da aceleração da gravidade.', false),
  ('e2000000-0000-4000-b000-00000000010f', 'e2000000-0000-4000-a000-00000000001b', 1, 'Se justifica ao verificar que a inércia do telescópio é grande comparada à dele próprio, e que o peso do telescópio é pequeno porque a atração gravitacional criada por sua massa era pequena.', false),
  ('e2000000-0000-4000-b000-000000000110', 'e2000000-0000-4000-a000-00000000001b', 2, 'Não se justifica, porque a avaliação da massa e do peso de objetos em órbita tem por base as leis de Kepler, que não se aplicam a satélites artificiais.', false),
  ('e2000000-0000-4000-b000-000000000111', 'e2000000-0000-4000-a000-00000000001b', 3, 'Não se justifica, porque a força-peso é a força exercida pela gravidade terrestre, neste caso, sobre o telescópio e é a responsável por manter o próprio telescópio em órbita.', true),
  ('e2000000-0000-4000-b000-000000000112', 'e2000000-0000-4000-a000-00000000001b', 4, 'Não se justifica, pois a ação da força-peso implica a ação de uma força de reação contrária, que não existe naquele ambiente. A massa do telescópio poderia ser avaliada simplesmente pelo seu volume.', false),
  ('e2000000-0000-4000-b000-000000000118', 'e2000000-0000-4000-a000-00000000001c', 0, 'A espécie 8 é mais indicada que a 1, uma vez que aquela possui melhor adaptação a regiões com maior incidência de luz.', false),
  ('e2000000-0000-4000-b000-000000000119', 'e2000000-0000-4000-a000-00000000001c', 1, 'Recomenda-se a utilização de espécies pioneiras, isto é, aquelas que suportam alta incidência de luz, como as espécies 2, 3 e 5.', true),
  ('e2000000-0000-4000-b000-00000000011a', 'e2000000-0000-4000-a000-00000000001c', 2, 'Sugere-se o uso de espécies exóticas, pois somente essas podem suportar a alta incidência luminosa característica de regiões desmatadas.', false),
  ('e2000000-0000-4000-b000-00000000011b', 'e2000000-0000-4000-a000-00000000001c', 3, 'Espécies de comunidade clímax, como as 4 e 7, são as mais indicadas, uma vez que possuem boa capacidade de aclimatação a diferentes ambientes.', false),
  ('e2000000-0000-4000-b000-00000000011c', 'e2000000-0000-4000-a000-00000000001c', 4, 'É recomendado o uso de espécies com melhor desenvolvimento à sombra, como as plantas das espécies 4, 6, 7, 9 e 10, pois essa floresta, mesmo no estágio de degradação referido, possui dossel fechado, o que impede a entrada de luz.', false),
  ('e2000000-0000-4000-b000-000000000122', 'e2000000-0000-4000-a000-00000000001d', 0, 'Entre 12 e 24 nêutrons a menos que o número de prótons.', false),
  ('e2000000-0000-4000-b000-000000000123', 'e2000000-0000-4000-a000-00000000001d', 1, 'Exatamente o mesmo número de prótons e nêutrons.', false),
  ('e2000000-0000-4000-b000-000000000124', 'e2000000-0000-4000-a000-00000000001d', 2, 'Entre 0 e 12 nêutrons a mais que o número de prótons.', false),
  ('e2000000-0000-4000-b000-000000000125', 'e2000000-0000-4000-a000-00000000001d', 3, 'Entre 12 e 24 nêutrons a mais que o número de prótons.', true),
  ('e2000000-0000-4000-b000-000000000126', 'e2000000-0000-4000-a000-00000000001d', 4, 'Entre 0 e 12 nêutrons a menos que o número de prótons.', false),
  ('e2000000-0000-4000-b000-00000000012c', 'e2000000-0000-4000-a000-00000000001e', 0, 'A quantidade de gasolina consumida é igual para os dois casos.', false),
  ('e2000000-0000-4000-b000-00000000012d', 'e2000000-0000-4000-a000-00000000001e', 1, 'A quantidade de gasolina consumida pelo gerador é duas vezes maior que a consumida na combustão.', false),
  ('e2000000-0000-4000-b000-00000000012e', 'e2000000-0000-4000-a000-00000000001e', 2, 'A quantidade de gasolina consumida pelo gerador é duas vezes menor que a consumida na combustão.', false),
  ('e2000000-0000-4000-b000-00000000012f', 'e2000000-0000-4000-a000-00000000001e', 3, 'A quantidade de gasolina consumida pelo gerador é sete vezes maior que a consumida na combustão.', true),
  ('e2000000-0000-4000-b000-000000000130', 'e2000000-0000-4000-a000-00000000001e', 4, 'A quantidade de gasolina consumida pelo gerador é sete vezes menor que a consumida na combustão.', false),
  ('e2000000-0000-4000-b000-000000000136', 'e2000000-0000-4000-a000-00000000001f', 0, 'A tecnologia GSM, pois é a que opera com ondas de maior comprimento de onda.', false),
  ('e2000000-0000-4000-b000-000000000137', 'e2000000-0000-4000-a000-00000000001f', 1, 'A tecnologia TDMA/CDMA, pois é a que apresenta Efeito Doppler mais pronunciado.', false),
  ('e2000000-0000-4000-b000-000000000138', 'e2000000-0000-4000-a000-00000000001f', 2, 'A tecnologia GSM, pois é a que utiliza ondas que se propagam com maior velocidade.', false),
  ('e2000000-0000-4000-b000-000000000139', 'e2000000-0000-4000-a000-00000000001f', 3, 'Qualquer uma das duas, pois as diferenças nas frequências são compensadas pelas diferenças nos comprimentos de onda.', false),
  ('e2000000-0000-4000-b000-00000000013a', 'e2000000-0000-4000-a000-00000000001f', 4, 'Qualquer uma das duas, pois nesse caso as intensidades decaem igualmente da mesma forma, independentemente da frequência.', true),
  ('e2000000-0000-4000-b000-000000000140', 'e2000000-0000-4000-a000-000000000020', 0, 'Absorção da radiação eletromagnética e a consequente ionização dos átomos de cálcio, que se transformam em átomos de fósforo.', false),
  ('e2000000-0000-4000-b000-000000000141', 'e2000000-0000-4000-a000-000000000020', 1, 'Maior absorção da radiação eletromagnética pelos átomos de cálcio que por outros tipos de átomos.', true),
  ('e2000000-0000-4000-b000-000000000142', 'e2000000-0000-4000-a000-000000000020', 2, 'Maior absorção da radiação eletromagnética pelos átomos de carbono que por átomos de cálcio.', false),
  ('e2000000-0000-4000-b000-000000000143', 'e2000000-0000-4000-a000-000000000020', 3, 'Maior refração ao atravessar os átomos de carbono que os átomos de cálcio.', false),
  ('e2000000-0000-4000-b000-000000000144', 'e2000000-0000-4000-a000-000000000020', 4, 'Maior ionização de moléculas de água que de átomos de carbono.', false),
  ('e2000000-0000-4000-b000-00000000014a', 'e2000000-0000-4000-a000-000000000021', 0, 'A alimentação, pois pigmentos de terra são absorvidos e alteram a cor da pelagem dos roedores.', false),
  ('e2000000-0000-4000-b000-00000000014b', 'e2000000-0000-4000-a000-000000000021', 1, 'O fluxo gênico entre as diferentes populações, que mantém constante a grande diversidade interpopulacional.', false),
  ('e2000000-0000-4000-b000-00000000014c', 'e2000000-0000-4000-a000-000000000021', 2, 'A seleção natural, que, nesse caso, poderia ser entendida como a sobrevivência diferenciada de indivíduos com características distintas.', true),
  ('e2000000-0000-4000-b000-00000000014d', 'e2000000-0000-4000-a000-000000000021', 3, 'A mutação genética, que, em certos ambientes, como os de solo mais escuro, têm maior ocorrência e capacidade de alterar significativamente a cor da pelagem dos animais.', false),
  ('e2000000-0000-4000-b000-00000000014e', 'e2000000-0000-4000-a000-000000000021', 4, 'A herança de caracteres adquiridos, capacidade de organismos se adaptarem a diferentes ambientes e transmitirem suas características genéticas aos descendentes.', false),
  ('e2000000-0000-4000-b000-000000000154', 'e2000000-0000-4000-a000-000000000022', 0, 'O processo de compostagem iria produzir intenso mau cheiro.', false),
  ('e2000000-0000-4000-b000-000000000155', 'e2000000-0000-4000-a000-000000000022', 1, 'O adubo formado seria pobre em matéria orgânica que não foi transformada em composto.', false),
  ('e2000000-0000-4000-b000-000000000156', 'e2000000-0000-4000-a000-000000000022', 2, 'A falta de água no composto vai impedir que microrganismos decomponham a matéria orgânica.', true),
  ('e2000000-0000-4000-b000-000000000157', 'e2000000-0000-4000-a000-000000000022', 3, 'A falta de água no composto iria elevar a temperatura da mistura, o que resultaria na perda de nutrientes essenciais.', false),
  ('e2000000-0000-4000-b000-000000000158', 'e2000000-0000-4000-a000-000000000022', 4, 'Apenas microrganismos que independem de oxigênio poderiam agir sobre a matéria orgânica e transformá-la em adubo.', false),
  ('e2000000-0000-4000-b000-00000000015e', 'e2000000-0000-4000-a000-000000000023', 0, '15 m e 21 m.', true),
  ('e2000000-0000-4000-b000-00000000015f', 'e2000000-0000-4000-a000-000000000023', 1, '22 m e 30 m.', false),
  ('e2000000-0000-4000-b000-000000000160', 'e2000000-0000-4000-a000-000000000023', 2, '105 m e 125 m.', false),
  ('e2000000-0000-4000-b000-000000000161', 'e2000000-0000-4000-a000-000000000023', 3, '680 m e 710 m.', false),
  ('e2000000-0000-4000-b000-000000000162', 'e2000000-0000-4000-a000-000000000023', 4, '6.700 m e 7.150 m.', false),
  ('e2000000-0000-4000-b000-000000000168', 'e2000000-0000-4000-a000-000000000024', 0, '![](conteudo/enem/2009/36-a-d5883437.webp)', false),
  ('e2000000-0000-4000-b000-000000000169', 'e2000000-0000-4000-a000-000000000024', 1, '![](conteudo/enem/2009/36-b-7eaa6df0.webp)', false),
  ('e2000000-0000-4000-b000-00000000016a', 'e2000000-0000-4000-a000-000000000024', 2, '![](conteudo/enem/2009/36-c-14126a76.webp)', false),
  ('e2000000-0000-4000-b000-00000000016b', 'e2000000-0000-4000-a000-000000000024', 3, '![](conteudo/enem/2009/36-d-7a0856d3.webp)', false),
  ('e2000000-0000-4000-b000-00000000016c', 'e2000000-0000-4000-a000-000000000024', 4, '![](conteudo/enem/2009/36-e-a17be85c.webp)', true),
  ('e2000000-0000-4000-b000-000000000172', 'e2000000-0000-4000-a000-000000000025', 0, 'Um objeto indefinido, pois as células que captam a luz estão inativas.', false),
  ('e2000000-0000-4000-b000-000000000173', 'e2000000-0000-4000-a000-000000000025', 1, 'Um objeto rosa, pois haverá mistura da luz vermelha com o branco do objeto.', false),
  ('e2000000-0000-4000-b000-000000000174', 'e2000000-0000-4000-a000-000000000025', 2, 'Um objeto verde, pois o olho não consegue diferenciar componentes de cores.', false),
  ('e2000000-0000-4000-b000-000000000175', 'e2000000-0000-4000-a000-000000000025', 3, 'Um objeto cinza, pois os bastonetes captam luminosidade, porém não diferenciam cor.', true),
  ('e2000000-0000-4000-b000-000000000176', 'e2000000-0000-4000-a000-000000000025', 4, 'Um objeto vermelho, pois a retina capta a luz refletida pelo objeto, transformando-a em vermelho.', false),
  ('e2000000-0000-4000-b000-00000000017c', 'e2000000-0000-4000-a000-000000000026', 0, 'R$ 500,00 e R$ 1.000,00.', false),
  ('e2000000-0000-4000-b000-00000000017d', 'e2000000-0000-4000-a000-000000000026', 1, 'R$ 1.050,00 e R$ 1.250,00.', false),
  ('e2000000-0000-4000-b000-00000000017e', 'e2000000-0000-4000-a000-000000000026', 2, 'R$ 4.000,00 e R$ 5.000,00.', false),
  ('e2000000-0000-4000-b000-00000000017f', 'e2000000-0000-4000-a000-000000000026', 3, 'R$ 6.000,00 e R$ 6.900,00.', true),
  ('e2000000-0000-4000-b000-000000000180', 'e2000000-0000-4000-a000-000000000026', 4, 'R$ 7.000,00 e R$ 7.950,00.', false),
  ('e2000000-0000-4000-b000-000000000186', 'e2000000-0000-4000-a000-000000000027', 0, 'A expansão do gás é um processo que cede a energia necessária ao resfriamento da parte interna da geladeira.', false),
  ('e2000000-0000-4000-b000-000000000187', 'e2000000-0000-4000-a000-000000000027', 1, 'O calor flui de forma não-espontânea da parte mais fria, no interior, para a mais quente, no exterior da geladeira.', true),
  ('e2000000-0000-4000-b000-000000000188', 'e2000000-0000-4000-a000-000000000027', 2, 'A quantidade de calor cedida ao meio externo é igual ao calor retirado da geladeira.', false),
  ('e2000000-0000-4000-b000-000000000189', 'e2000000-0000-4000-a000-000000000027', 3, 'A eficiência é tanto maior quanto menos isolado termicamente do ambiente externo for o seu compartimento interno.', false),
  ('e2000000-0000-4000-b000-00000000018a', 'e2000000-0000-4000-a000-000000000027', 4, 'A energia retirada do interior pode ser devolvida à geladeira abrindo-se a sua porta, o que reduz seu consumo de energia.', false),
  ('e2000000-0000-4000-b000-000000000190', 'e2000000-0000-4000-a000-000000000028', 0, 'As partículas, quanto menores, mais potentes e radiativas se tornam.', false),
  ('e2000000-0000-4000-b000-000000000191', 'e2000000-0000-4000-a000-000000000028', 1, 'As partículas podem ser manipuladas, mas não caracterizadas com a atual tecnologia.', false),
  ('e2000000-0000-4000-b000-000000000192', 'e2000000-0000-4000-a000-000000000028', 2, 'As propriedades biológicas das partículas somente podem ser testadas em microrganismos.', false),
  ('e2000000-0000-4000-b000-000000000193', 'e2000000-0000-4000-a000-000000000028', 3, 'As partículas podem atravessar poros e canais celulares, o que poderia causar impactos desconhecidos aos seres vivos e, até mesmo, aos ecossistemas.', true),
  ('e2000000-0000-4000-b000-000000000194', 'e2000000-0000-4000-a000-000000000028', 4, 'O organismo humano apresenta imunidade contra partículas tão pequenas, já que apresentam a mesma dimensão das bactérias (um bilionésimo de metro).', false),
  ('e2000000-0000-4000-b000-00000000019a', 'e2000000-0000-4000-a000-000000000029', 0, 'Do DNAmt, transmitido ao longo da linhagem materna, pois, em cada célula humana, há várias cópias dessa molécula.', true),
  ('e2000000-0000-4000-b000-00000000019b', 'e2000000-0000-4000-a000-000000000029', 1, 'Do cromossomo X, pois a vítima herdou duas cópias desse cromossomo, estando assim em número superior aos demais.', false),
  ('e2000000-0000-4000-b000-00000000019c', 'e2000000-0000-4000-a000-000000000029', 2, 'Do cromossomo autossômico, pois esse cromossomo apresenta maior quantidade de material genético quando comparado aos nucleares, como, por exemplo, o DNAmt.', false),
  ('e2000000-0000-4000-b000-00000000019d', 'e2000000-0000-4000-a000-000000000029', 3, 'Do cromossomo Y, pois, em condições normais, este é transmitido integralmente do pai para toda a prole e está presente em duas cópias em células de indivíduos do sexo feminino.', false),
  ('e2000000-0000-4000-b000-00000000019e', 'e2000000-0000-4000-a000-000000000029', 4, 'De marcadores genéticos em cromossomos autossômicos, pois estes, além de serem transmitidos pelo pai e pela mãe, estão presentes em 44 cópias por célula, e os demais, em apenas uma.', false),
  ('e2000000-0000-4000-b000-0000000001a4', 'e2000000-0000-4000-a000-00000000002a', 0, 'A atividade microbiana se torne responsável pela reciclagem do fósforo orgânico excedente no ambiente marinho.', false),
  ('e2000000-0000-4000-b000-0000000001a5', 'e2000000-0000-4000-a000-00000000002a', 1, 'A relativa instabilidade das condições marinhas torne as alterações de fatores físico-químicos pouco críticas à vida no mar.', false),
  ('e2000000-0000-4000-b000-0000000001a6', 'e2000000-0000-4000-a000-00000000002a', 2, 'A amônia excedente seja convertida em nitrito, por meio do processo de nitrificação, e em nitrato, formado como produto intermediário desse processo.', false),
  ('e2000000-0000-4000-b000-0000000001a7', 'e2000000-0000-4000-a000-00000000002a', 3, 'Os efluentes promovam o crescimento excessivo de plantas aquáticas devido à alta diversidade de espécies vegetais permanentes no manguezal.', false),
  ('e2000000-0000-4000-b000-0000000001a8', 'e2000000-0000-4000-a000-00000000002a', 4, 'O impedimento da penetração da luz pelas partículas em suspensão venha a comprometer a produtividade primária do ambiente marinho, que resulta da atividade metabólica do fitoplâncton.', true),
  ('e2000000-0000-4000-b000-0000000001ae', 'e2000000-0000-4000-a000-00000000002b', 0, 'Gasolina, GLP e gás natural.', true),
  ('e2000000-0000-4000-b000-0000000001af', 'e2000000-0000-4000-a000-00000000002b', 1, 'Gás natural, gasolina e GLP.', false),
  ('e2000000-0000-4000-b000-0000000001b0', 'e2000000-0000-4000-a000-00000000002b', 2, 'Gasolina, gás natural e GLP.', false),
  ('e2000000-0000-4000-b000-0000000001b1', 'e2000000-0000-4000-a000-00000000002b', 3, 'Gás natural, GLP e gasolina.', false),
  ('e2000000-0000-4000-b000-0000000001b2', 'e2000000-0000-4000-a000-00000000002b', 4, 'GLP, gás natural e gasolina.', false),
  ('e2000000-0000-4000-b000-0000000001b8', 'e2000000-0000-4000-a000-00000000002c', 0, 'De 0%.', false),
  ('e2000000-0000-4000-b000-0000000001b9', 'e2000000-0000-4000-a000-00000000002c', 1, 'De 8,0%.', false),
  ('e2000000-0000-4000-b000-0000000001ba', 'e2000000-0000-4000-a000-00000000002c', 2, 'Entre 8,4% e 8,6%.', false),
  ('e2000000-0000-4000-b000-0000000001bb', 'e2000000-0000-4000-a000-00000000002c', 3, 'Entre 9,0% e 9,2%.', true),
  ('e2000000-0000-4000-b000-0000000001bc', 'e2000000-0000-4000-a000-00000000002c', 4, 'Entre 13% e 14%.', false),
  ('e2000000-0000-4000-b000-0000000001c2', 'e2000000-0000-4000-a000-00000000002d', 0, 'L1, L2 e L3.', false),
  ('e2000000-0000-4000-b000-0000000001c3', 'e2000000-0000-4000-a000-00000000002d', 1, 'L2, L3 e L4.', true),
  ('e2000000-0000-4000-b000-0000000001c4', 'e2000000-0000-4000-a000-00000000002d', 2, 'L2, L5 e L7.', false),
  ('e2000000-0000-4000-b000-0000000001c5', 'e2000000-0000-4000-a000-00000000002d', 3, 'L4, L5 e L6.', false),
  ('e2000000-0000-4000-b000-0000000001c6', 'e2000000-0000-4000-a000-00000000002d', 4, 'L4, L7 e L8.', false),
  ('e2000000-0000-4000-b000-0000000001cc', 'e2000000-0000-4000-a000-00000000002e', 0, 'Significava, entre outros aspectos, o poder que os faraós tinham para escravizar grandes contingentes populacionais que trabalhavam nesses monumentos.', true),
  ('e2000000-0000-4000-b000-0000000001cd', 'e2000000-0000-4000-a000-00000000002e', 1, 'Representava para as populações do alto Egito a possibilidade de migrar para o sul e encontrar trabalho nos canteiros faraônicos.', false),
  ('e2000000-0000-4000-b000-0000000001ce', 'e2000000-0000-4000-a000-00000000002e', 2, 'Significava a solução para os problemas econômicos, uma vez que os faraós sacrificavam aos deuses suas riquezas, construindo templos.', false),
  ('e2000000-0000-4000-b000-0000000001cf', 'e2000000-0000-4000-a000-00000000002e', 3, 'Representava a possibilidade de o faraó ordenar a sociedade, obrigando os desocupados a trabalharem em obras públicas, que engrandeceram o próprio Egito.', false),
  ('e2000000-0000-4000-b000-0000000001d0', 'e2000000-0000-4000-a000-00000000002e', 4, 'Significava um peso para a população egípcia, que condenava o luxo faraônico e a religião baseada em crenças e superstições.', false),
  ('e2000000-0000-4000-b000-0000000001d6', 'e2000000-0000-4000-a000-00000000002f', 0, 'O palácio de Versalhes.', true),
  ('e2000000-0000-4000-b000-0000000001d7', 'e2000000-0000-4000-a000-00000000002f', 1, 'O Museu Britânico.', false),
  ('e2000000-0000-4000-b000-0000000001d8', 'e2000000-0000-4000-a000-00000000002f', 2, 'A catedral de Colônia.', false),
  ('e2000000-0000-4000-b000-0000000001d9', 'e2000000-0000-4000-a000-00000000002f', 3, 'A Casa Branca.', false),
  ('e2000000-0000-4000-b000-0000000001da', 'e2000000-0000-4000-a000-00000000002f', 4, 'A pirâmide do faraó Quéops.', false),
  ('e2000000-0000-4000-b000-0000000001e0', 'e2000000-0000-4000-a000-000000000030', 0, 'Na Grécia Antiga, as cerimônias fúnebres eram desvalorizadas, porque o mais importante era a democracia experimentada pelos vivos.', false),
  ('e2000000-0000-4000-b000-0000000001e1', 'e2000000-0000-4000-a000-000000000030', 1, 'Na Idade Média, a Igreja tinha pouca influência sobre os rituais fúnebres, preocupando-se mais com a salvação da alma.', false),
  ('e2000000-0000-4000-b000-0000000001e2', 'e2000000-0000-4000-a000-000000000030', 2, 'No Brasil colônia, o sepultamento dos mortos nas igrejas era regido pela observância da hierarquia social.', true),
  ('e2000000-0000-4000-b000-0000000001e3', 'e2000000-0000-4000-a000-000000000030', 3, 'Na época da Reforma, o catolicismo condenou os excessos de gastos que a burguesia fazia para sepultar seus mortos.', false),
  ('e2000000-0000-4000-b000-0000000001e4', 'e2000000-0000-4000-a000-000000000030', 4, 'No período posterior à Revolução Francesa, devido as grandes perturbações sociais, abandona-se a prática do luto.', false),
  ('e2000000-0000-4000-b000-0000000001ea', 'e2000000-0000-4000-a000-000000000031', 0, 'A associação que Hitler estabeleceu entre o III Reich e o Sacro Império Romano Germânico.', true),
  ('e2000000-0000-4000-b000-0000000001eb', 'e2000000-0000-4000-a000-000000000031', 1, 'O retorno dos valores cristãos medievais, presentes nos documentos do Concílio Vaticano II.', false),
  ('e2000000-0000-4000-b000-0000000001ec', 'e2000000-0000-4000-a000-000000000031', 2, 'A luta dos negros sul-africanos contra o apartheid inspirada por valores dos primeiros cristãos.', false),
  ('e2000000-0000-4000-b000-0000000001ed', 'e2000000-0000-4000-a000-000000000031', 3, 'O fortalecimento político de Napoleão Bonaparte, que se justificava na amplitude de poderes que tivera Carlos Magno.', false),
  ('e2000000-0000-4000-b000-0000000001ee', 'e2000000-0000-4000-a000-000000000031', 4, 'A tradição heroica da cavalaria medieval, que foi afetada negativamente pelas produções cinematográficas de Hollywood.', false),
  ('e2000000-0000-4000-b000-0000000001f4', 'e2000000-0000-4000-a000-000000000032', 0, 'A crise do colonialismo, a ascensão do nacionalismo e do totalitarismo.', true),
  ('e2000000-0000-4000-b000-0000000001f5', 'e2000000-0000-4000-a000-000000000032', 1, 'O enfraquecimento do império britânico, a Grande Depressão e a corrida nuclear.', false),
  ('e2000000-0000-4000-b000-0000000001f6', 'e2000000-0000-4000-a000-000000000032', 2, 'O declínio britânico, o fracasso da Liga das Nações e a Revolução Cubana.', false),
  ('e2000000-0000-4000-b000-0000000001f7', 'e2000000-0000-4000-a000-000000000032', 3, 'A corrida armamentista, o terceiro-mundismo e o expansionismo soviético.', false),
  ('e2000000-0000-4000-b000-0000000001f8', 'e2000000-0000-4000-a000-000000000032', 4, 'A Revolução Bolchevique, o imperialismo e a unificação da Alemanha.', false),
  ('e2000000-0000-4000-b000-0000000001fe', 'e2000000-0000-4000-a000-000000000033', 0, 'Pelo sectarismo e pela forma violenta e radical com que enfrentavam os opositores ao regime.', true),
  ('e2000000-0000-4000-b000-0000000001ff', 'e2000000-0000-4000-a000-000000000033', 1, 'Pelas propostas de conscientização da população acerca dos seus direitos como cidadãos.', false),
  ('e2000000-0000-4000-b000-000000000200', 'e2000000-0000-4000-a000-000000000033', 2, 'Pela promoção de um modo de vida saudável, que mostrava os jovens como exemplos a seguir.', false),
  ('e2000000-0000-4000-b000-000000000201', 'e2000000-0000-4000-a000-000000000033', 3, 'Pelo diálogo, ao organizar debates que opunham jovens idealistas e velhas lideranças conservadoras.', false),
  ('e2000000-0000-4000-b000-000000000202', 'e2000000-0000-4000-a000-000000000033', 4, 'Pelos métodos políticos populistas e pela organização de comícios multitudinários.', false),
  ('e2000000-0000-4000-b000-000000000208', 'e2000000-0000-4000-a000-000000000034', 0, 'Cortina de Ferro.', true),
  ('e2000000-0000-4000-b000-000000000209', 'e2000000-0000-4000-a000-000000000034', 1, 'Muro de Berlim.', false),
  ('e2000000-0000-4000-b000-00000000020a', 'e2000000-0000-4000-a000-000000000034', 2, 'União Europeia.', false),
  ('e2000000-0000-4000-b000-00000000020b', 'e2000000-0000-4000-a000-000000000034', 3, 'Convenção de Ramsar.', false),
  ('e2000000-0000-4000-b000-00000000020c', 'e2000000-0000-4000-a000-000000000034', 4, 'Conferência de Estocolmo.', false),
  ('e2000000-0000-4000-b000-000000000212', 'e2000000-0000-4000-a000-000000000035', 0, 'Foram manifestações desprovidas de conotação política, que tinham o objetivo de questionar a rigidez dos padrões de comportamento social fundados em valores tradicionais da moral religiosa.', false),
  ('e2000000-0000-4000-b000-000000000213', 'e2000000-0000-4000-a000-000000000035', 1, 'Restringiram-se às sociedades de países desenvolvidos, onde a industrialização avançada, a penetração dos meios de comunicação de massa e a alienação cultural que deles resultava eram mais evidentes.', false),
  ('e2000000-0000-4000-b000-000000000214', 'e2000000-0000-4000-a000-000000000035', 2, 'Resultaram no fortalecimento do conservadorismo político, social e religioso que prevaleceu nos países ocidentais durante as décadas de 70 e 80.', false),
  ('e2000000-0000-4000-b000-000000000215', 'e2000000-0000-4000-a000-000000000035', 3, 'Tiveram baixa repercussão no plano político, apesar de seus fortes desdobramentos nos planos social e cultural, expressos na mudança de costumes e na contracultura.', false),
  ('e2000000-0000-4000-b000-000000000216', 'e2000000-0000-4000-a000-000000000035', 4, 'Inspiraram futuras mobilizações, como o pacifismo, o ambientalismo, a promoção da equidade de gêneros e a defesa dos direitos das minorias.', true),
  ('e2000000-0000-4000-b000-00000000021c', 'e2000000-0000-4000-a000-000000000036', 0, 'A floresta não possui organismos decompositores.', false),
  ('e2000000-0000-4000-b000-00000000021d', 'e2000000-0000-4000-a000-000000000036', 1, 'O potencial econômico da floresta deve ser explorado.', false),
  ('e2000000-0000-4000-b000-00000000021e', 'e2000000-0000-4000-a000-000000000036', 2, 'O homem branco convive harmonicamente com urihi.', false),
  ('e2000000-0000-4000-b000-00000000021f', 'e2000000-0000-4000-a000-000000000036', 3, 'As folhas e a água são menos importantes para a floresta que seu sopro vital.', false),
  ('e2000000-0000-4000-b000-000000000220', 'e2000000-0000-4000-a000-000000000036', 4, 'Wixia é a capacidade que tem a floresta de se sustentar por meio de processos vitais.', true),
  ('e2000000-0000-4000-b000-000000000226', 'e2000000-0000-4000-a000-000000000037', 0, 'O aumento de conflitos internos associados ao nacionalismo, às disputas étnicas, ao extremismo religioso e ao fortalecimento de ameaças como o terrorismo, o tráfico de drogas e o crime organizado.', true),
  ('e2000000-0000-4000-b000-000000000227', 'e2000000-0000-4000-a000-000000000037', 1, 'O fim da corrida armamentista e a redução dos gastos militares das grandes potências, o que se traduziu em maior estabilidade nos continentes europeu e asiático, que tinham sido palco da Guerra Fria.', false),
  ('e2000000-0000-4000-b000-000000000228', 'e2000000-0000-4000-a000-000000000037', 2, 'O desengajamento das grandes potências, pois as intervenções militares em regiões assoladas por conflitos passaram a ser realizadas pela Organização das Nações Unidas (ONU), com maior envolvimento de países emergentes.', false),
  ('e2000000-0000-4000-b000-000000000229', 'e2000000-0000-4000-a000-000000000037', 3, 'A plena vigência do Tratado de Não Proliferação, que afastou a possibilidade de um conflito nuclear como ameaça global, devido à crescente consciência política internacional acerca desse perigo.', false),
  ('e2000000-0000-4000-b000-00000000022a', 'e2000000-0000-4000-a000-000000000037', 4, 'A condição dos EUA como única superpotência, mas que se submetem às decisões da ONU no que concerne às ações militares.', false),
  ('e2000000-0000-4000-b000-000000000230', 'e2000000-0000-4000-a000-000000000038', 0, 'Submeter o indivíduo à proteção do governo.', false),
  ('e2000000-0000-4000-b000-000000000231', 'e2000000-0000-4000-a000-000000000038', 1, 'Hierarquizar os indivíduos segundo suas posses.', false),
  ('e2000000-0000-4000-b000-000000000232', 'e2000000-0000-4000-a000-000000000038', 2, 'Estimular a formação de propriedades comunais.', false),
  ('e2000000-0000-4000-b000-000000000233', 'e2000000-0000-4000-a000-000000000038', 3, 'Vincular democracia e possibilidades econômicas individuais.', true),
  ('e2000000-0000-4000-b000-000000000234', 'e2000000-0000-4000-a000-000000000038', 4, 'Defender a obrigação de que todos os indivíduos tenham propriedades.', false),
  ('e2000000-0000-4000-b000-00000000023a', 'e2000000-0000-4000-a000-000000000039', 0, 'Buscavam o êxito, descurando as virtudes cívicas.', false),
  ('e2000000-0000-4000-b000-00000000023b', 'e2000000-0000-4000-a000-000000000039', 1, 'Tinham na vida moral uma garantia de enriquecimento rápido.', false),
  ('e2000000-0000-4000-b000-00000000023c', 'e2000000-0000-4000-a000-000000000039', 2, 'Valorizavam um conceito de honra dissociado do comportamento ético.', false),
  ('e2000000-0000-4000-b000-00000000023d', 'e2000000-0000-4000-a000-000000000039', 3, 'Relacionavam a conduta moral dos indivíduos com o progresso econômico.', true),
  ('e2000000-0000-4000-b000-00000000023e', 'e2000000-0000-4000-a000-000000000039', 4, 'Acreditavam que o comportamento casto perturbava a harmonia doméstica.', false),
  ('e2000000-0000-4000-b000-000000000244', 'e2000000-0000-4000-a000-00000000003a', 0, 'Possui uma dimensão histórica que deve ser criticada, pois é condenável que os políticos de qualquer época fiquem entregues à ociosidade, enquanto o resto dos cidadãos tem de trabalhar.', false),
  ('e2000000-0000-4000-b000-000000000245', 'e2000000-0000-4000-a000-00000000003a', 1, 'Era entendida como uma dignidade própria dos grupos sociais superiores, fruto de uma concepção política profundamente hierarquizada da sociedade.', true),
  ('e2000000-0000-4000-b000-000000000246', 'e2000000-0000-4000-a000-00000000003a', 2, 'Estava vinculada, na Grécia Antiga, a uma percepção política democrática, que levava todos os habitantes da pólis a participarem da vida cívica.', false),
  ('e2000000-0000-4000-b000-000000000247', 'e2000000-0000-4000-a000-00000000003a', 3, 'Tinha profundas conexões com a justiça, razão pela qual o tempo livre dos cidadãos deveria ser dedicado às atividades vinculadas aos tribunais.', false),
  ('e2000000-0000-4000-b000-000000000248', 'e2000000-0000-4000-a000-00000000003a', 4, 'Vivida pelos atenienses era, de fato, restrita àqueles que se dedicavam à política e que tinham tempo para resolver os problemas da cidade.', false),
  ('e2000000-0000-4000-b000-00000000024e', 'e2000000-0000-4000-a000-00000000003b', 0, 'Brasil, um país que vai pra frente.', false),
  ('e2000000-0000-4000-b000-00000000024f', 'e2000000-0000-4000-a000-00000000003b', 1, 'Brasil, a eterna esperança.', true),
  ('e2000000-0000-4000-b000-000000000250', 'e2000000-0000-4000-a000-00000000003b', 2, 'Brasil, glória no passado, grandeza no presente.', false),
  ('e2000000-0000-4000-b000-000000000251', 'e2000000-0000-4000-a000-00000000003b', 3, 'Brasil, terra bela, pátria grande.', false),
  ('e2000000-0000-4000-b000-000000000252', 'e2000000-0000-4000-a000-00000000003b', 4, 'Brasil, gigante pela própria natureza.', false),
  ('e2000000-0000-4000-b000-000000000258', 'e2000000-0000-4000-a000-00000000003c', 0, 'A Constituição de 1934 avançou ao reduzir a idade mínima para votar.', false),
  ('e2000000-0000-4000-b000-000000000259', 'e2000000-0000-4000-a000-00000000003c', 1, 'A Constituição de 1891, ao se referir a cidadãos, referia-se também às mulheres.', false),
  ('e2000000-0000-4000-b000-00000000025a', 'e2000000-0000-4000-a000-00000000003c', 2, 'Os textos de ambas as Cartas permitiam que qualquer cidadão fosse eleitor.', false),
  ('e2000000-0000-4000-b000-00000000025b', 'e2000000-0000-4000-a000-00000000003c', 3, 'O texto da carta de 1891 já permitia o voto feminino.', false),
  ('e2000000-0000-4000-b000-00000000025c', 'e2000000-0000-4000-a000-00000000003c', 4, 'A Constituição de 1891 considerava eleitores apenas indivíduos do sexo masculino.', true),
  ('e2000000-0000-4000-b000-000000000262', 'e2000000-0000-4000-a000-00000000003d', 0, 'Os eleitores, políticos e juízes seriam mal-intencionados.', false),
  ('e2000000-0000-4000-b000-000000000263', 'e2000000-0000-4000-a000-00000000003d', 1, 'O governo Vargas seria um mal necessário, mas transitório.', false),
  ('e2000000-0000-4000-b000-000000000264', 'e2000000-0000-4000-a000-00000000003d', 2, 'Vargas seria o homem adequado para implantar a democracia de partidos.', false),
  ('e2000000-0000-4000-b000-000000000265', 'e2000000-0000-4000-a000-00000000003d', 3, 'A Constituição de 1937 seria a preparação para uma futura democracia liberal.', false),
  ('e2000000-0000-4000-b000-000000000266', 'e2000000-0000-4000-a000-00000000003d', 4, 'Vargas seria o homem capaz de exercer o poder de modo inteligente e correto.', true),
  ('e2000000-0000-4000-b000-00000000026c', 'e2000000-0000-4000-a000-00000000003e', 0, 'Conscientizar os trabalhadores de que os direitos sociais foram conquistados por seu esforço, após anos de lutas sindicais.', false),
  ('e2000000-0000-4000-b000-00000000026d', 'e2000000-0000-4000-a000-00000000003e', 1, 'Promover a autonomia dos grupos sociais, por meio de uma linguagem simples e de fácil entendimento.', false),
  ('e2000000-0000-4000-b000-00000000026e', 'e2000000-0000-4000-a000-00000000003e', 2, 'Estimular os movimentos grevistas, que reivindicavam um aprofundamento dos direitos trabalhistas.', false),
  ('e2000000-0000-4000-b000-00000000026f', 'e2000000-0000-4000-a000-00000000003e', 3, 'Consolidar a imagem de Vargas como um governante protetor das massas.', true),
  ('e2000000-0000-4000-b000-000000000270', 'e2000000-0000-4000-a000-00000000003e', 4, 'Aumentar os grupos de discussão política dos trabalhadores, estimulados pelas palavras do ministro.', false),
  ('e2000000-0000-4000-b000-000000000276', 'e2000000-0000-4000-a000-00000000003f', 0, 'O problema dos métodos citados no trecho residia na dissimulação, que acabava por enganar o enfeitiçado.', false),
  ('e2000000-0000-4000-b000-000000000277', 'e2000000-0000-4000-a000-00000000003f', 1, 'O diabo era um concorrente poderoso da autoridade da Igreja e somente a justiça do fogo poderia eliminá-lo.', false),
  ('e2000000-0000-4000-b000-000000000278', 'e2000000-0000-4000-a000-00000000003f', 2, 'Os ingredientes em decomposição das poções mágicas eram condenados porque afetavam a saúde da população.', false),
  ('e2000000-0000-4000-b000-000000000279', 'e2000000-0000-4000-a000-00000000003f', 3, 'As feiticeiras representavam séria ameaça à sociedade, pois eram perceptíveis suas tendências feministas.', false),
  ('e2000000-0000-4000-b000-00000000027a', 'e2000000-0000-4000-a000-00000000003f', 4, 'Os cristãos deviam preservar a instituição do casamento recorrendo exclusivamente aos ensinamentos da Igreja.', true),
  ('e2000000-0000-4000-b000-000000000280', 'e2000000-0000-4000-a000-000000000040', 0, 'Devido à falta de recursos naturais a serem explorados no Brasil, conflitos étnicos e culturais como os ocorridos na África estiveram ausentes no período da independência e formação do Estado brasileiro.', false),
  ('e2000000-0000-4000-b000-000000000281', 'e2000000-0000-4000-a000-000000000040', 1, 'A maior distinção entre os processos histórico formativos dos continentes citados é a que se estabelece entre colonizador e colonizado, ou seja, entre a Europa e os demais.', true),
  ('e2000000-0000-4000-b000-000000000282', 'e2000000-0000-4000-a000-000000000040', 2, 'À época das conquistas, a América Latina, a África e a Ásia tinham sistemas políticos e administrativos muito mais sofisticados que aqueles que lhes foram impostos pelo colonizador.', false),
  ('e2000000-0000-4000-b000-000000000283', 'e2000000-0000-4000-a000-000000000040', 3, 'Comparadas ao México e ao Peru, as instituições brasileiras, por terem sido eliminadas à época da conquista, sofreram mais influência dos modelos institucionais europeus.', false),
  ('e2000000-0000-4000-b000-000000000284', 'e2000000-0000-4000-a000-000000000040', 4, 'O modelo histórico da formação do Estado asiático equipara-se ao brasileiro, pois em ambos se manteve o espírito das formas de organização anteriores à conquista.', false),
  ('e2000000-0000-4000-b000-00000000028a', 'e2000000-0000-4000-a000-000000000041', 0, 'Dos rumores acerca da revolta escrava do Haiti, que circulavam entre a população escrava e entre os mestiços pobres, alimentando seu desejo por mudanças.', true),
  ('e2000000-0000-4000-b000-00000000028b', 'e2000000-0000-4000-a000-000000000041', 1, 'Da rejeição aos portugueses, brancos, que significava a rejeição à opressão da Metrópole, como ocorreu na Noite das Garrafadas.', false),
  ('e2000000-0000-4000-b000-00000000028c', 'e2000000-0000-4000-a000-000000000041', 2, 'Do apoio que escravos e negros forros deram à monarquia, com a perspectiva de receber sua proteção contra as injustiças do sistema escravista.', false),
  ('e2000000-0000-4000-b000-00000000028d', 'e2000000-0000-4000-a000-000000000041', 3, 'Do repúdio que os escravos trabalhadores dos portos demonstravam contra os marinheiros, porque estes representavam a elite branca opressora.', false),
  ('e2000000-0000-4000-b000-00000000028e', 'e2000000-0000-4000-a000-000000000041', 4, 'Da expulsão de vários líderes negros independentistas, que defendiam a implantação de uma república negra, a exemplo do Haiti.', false),
  ('e2000000-0000-4000-b000-000000000294', 'e2000000-0000-4000-a000-000000000042', 0, 'O Brasil é um país periférico na ordem mundial, devido às diferentes conjunturas de inserção internacional.', false),
  ('e2000000-0000-4000-b000-000000000295', 'e2000000-0000-4000-a000-000000000042', 1, 'As possibilidades de fazer prevalecer ideias e conceitos próprios, no que tange aos temas do comércio internacional e dos países em desenvolvimento, são mínimas.', false),
  ('e2000000-0000-4000-b000-000000000296', 'e2000000-0000-4000-a000-000000000042', 2, 'As brechas do sistema internacional não foram bem aproveitadas para avançar posições voltadas para a criação de uma área de cooperação e associação integrada a seu entorno geográfico.', false),
  ('e2000000-0000-4000-b000-000000000297', 'e2000000-0000-4000-a000-000000000042', 3, 'Os grandes debates nacionais acerca da inserção internacional do Brasil foram embasados pelas elites do Império e da República por meio de consultas aos diversos setores da população.', false),
  ('e2000000-0000-4000-b000-000000000298', 'e2000000-0000-4000-a000-000000000042', 4, 'A atuação do Brasil em termos de política externa evidencia que o país tem capacidade decisória própria, mesmo diante dos constrangimentos internacionais.', true),
  ('e2000000-0000-4000-b000-00000000029e', 'e2000000-0000-4000-a000-000000000043', 0, 'A invenção do tear propiciou o surgimento de novas relações sociais.', false),
  ('e2000000-0000-4000-b000-00000000029f', 'e2000000-0000-4000-a000-000000000043', 1, 'Os tecelões mais hábeis prevaleceram sobre os inexperientes.', false),
  ('e2000000-0000-4000-b000-0000000002a0', 'e2000000-0000-4000-a000-000000000043', 2, 'Os novos teares exigiam treinamento especializado para serem operados.', false),
  ('e2000000-0000-4000-b000-0000000002a1', 'e2000000-0000-4000-a000-000000000043', 3, 'Os artesãos, no período anterior, combinavam a tecelagem com o cultivo de subsistência.', true),
  ('e2000000-0000-4000-b000-0000000002a2', 'e2000000-0000-4000-a000-000000000043', 4, 'Os trabalhadores não especializados se apropriaram dos lugares dos antigos artesãos nas fábricas.', false),
  ('e2000000-0000-4000-b000-0000000002a8', 'e2000000-0000-4000-a000-000000000044', 0, 'A erradicação da fome no mundo.', false),
  ('e2000000-0000-4000-b000-0000000002a9', 'e2000000-0000-4000-a000-000000000044', 1, 'O aumento das áreas rurais e a diminuição das áreas urbanas.', false),
  ('e2000000-0000-4000-b000-0000000002aa', 'e2000000-0000-4000-a000-000000000044', 2, 'A maior demanda por recursos naturais, entre os quais os recursos energéticos.', true),
  ('e2000000-0000-4000-b000-0000000002ab', 'e2000000-0000-4000-a000-000000000044', 3, 'A menor necessidade de utilização de adubos e corretivos na agricultura.', false),
  ('e2000000-0000-4000-b000-0000000002ac', 'e2000000-0000-4000-a000-000000000044', 4, 'O contínuo aumento da oferta de emprego no setor primário da economia, em face da mecanização.', false),
  ('e2000000-0000-4000-b000-0000000002b2', 'e2000000-0000-4000-a000-000000000045', 0, 'Ambiente de pobreza e privação, que carece de conforto mínimo para a sobrevivência da família.', false),
  ('e2000000-0000-4000-b000-0000000002b3', 'e2000000-0000-4000-a000-000000000045', 1, 'Mundo mágico, capaz de recuperar o encantamento perdido durante o período de decadência da aristocracia rural mineira.', false),
  ('e2000000-0000-4000-b000-0000000002b4', 'e2000000-0000-4000-a000-000000000045', 2, 'Cena familiar, na qual o calor humano dos habitantes da casa ocupa o primeiro plano, compensando a frieza e austeridade dos objetos antigos.', false),
  ('e2000000-0000-4000-b000-0000000002b5', 'e2000000-0000-4000-a000-000000000045', 3, 'Símbolo de um passado ilustre que, apesar de superado, ainda resiste à sua total dissolução graças ao cuidado e asseio que a família dispensa à conservação da casa.', false),
  ('e2000000-0000-4000-b000-0000000002b6', 'e2000000-0000-4000-a000-000000000045', 4, 'Espaço arruinado, onde os objetos perderam seu esplendor e sobre os quais a vida repousa como lembrança de um passado que está em vias de desaparecer completamente.', true),
  ('e2000000-0000-4000-b000-0000000002bc', 'e2000000-0000-4000-a000-000000000046', 0, 'O percurso dos imigrantes até o interior, antes das ferrovias, era feito a pé ou em muares; no entanto, o tempo de viagem era aceitável, uma vez que o café era plantado nas proximidades da capital, São Paulo.', false),
  ('e2000000-0000-4000-b000-0000000002bd', 'e2000000-0000-4000-a000-000000000046', 1, 'A expansão da malha ferroviária pelo interior de São Paulo permitiu que mão-de-obra estrangeira fosse contratada para trabalhar em cafezais de regiões cada vez mais distantes do porto de Santos.', true),
  ('e2000000-0000-4000-b000-0000000002be', 'e2000000-0000-4000-a000-000000000046', 2, 'O escoamento da produção de café se viu beneficiado pelos aportes de capital, principalmente de colonos italianos, que desejavam melhorar sua situação econômica.', false),
  ('e2000000-0000-4000-b000-0000000002bf', 'e2000000-0000-4000-a000-000000000046', 3, 'Os fazendeiros puderam prescindir da mão-de-obra europeia e contrataram trabalhadores brasileiros provenientes de outras regiões para trabalhar em suas plantações.', false),
  ('e2000000-0000-4000-b000-0000000002c0', 'e2000000-0000-4000-a000-000000000046', 4, 'As notícias de terras acessíveis atraíram para São Paulo grande quantidade de imigrantes, que adquiriram vastas propriedades produtivas.', false),
  ('e2000000-0000-4000-b000-0000000002c6', 'e2000000-0000-4000-a000-000000000047', 0, 'Possuírem o mesmo nível de influência no cenário mundial.', false),
  ('e2000000-0000-4000-b000-0000000002c7', 'e2000000-0000-4000-a000-000000000047', 1, 'Fortalecerem os laços de cidadania e solidariedade entre os membros das diversas comunidades.', false),
  ('e2000000-0000-4000-b000-0000000002c8', 'e2000000-0000-4000-a000-000000000047', 2, 'Constituírem um passo importante para a diminuição das desigualdades sociais causadas pela polarização social e pela segregação urbana.', false),
  ('e2000000-0000-4000-b000-0000000002c9', 'e2000000-0000-4000-a000-000000000047', 3, 'Terem sido diretamente impactadas pelo processo de internacionalização da economia, desencadeado a partir do final dos anos 1970.', true),
  ('e2000000-0000-4000-b000-0000000002ca', 'e2000000-0000-4000-a000-000000000047', 4, 'Terem sua origem diretamente relacionadas ao processo de colonização ocidental do século XIX.', false),
  ('e2000000-0000-4000-b000-0000000002d0', 'e2000000-0000-4000-a000-000000000048', 0, 'A ampla difusão das tecnologias de informação nos centros urbanos e no meio rural suscita o contato entre diferentes culturas e, ao mesmo tempo, traz a necessidade de reformular as concepções tradicionais de educação.', true),
  ('e2000000-0000-4000-b000-0000000002d1', 'e2000000-0000-4000-a000-000000000048', 1, 'A apropriação, por parte de um grupo social, de valores e ideias de outras culturas para benefício próprio é fonte de conflitos e ressentimentos.', false),
  ('e2000000-0000-4000-b000-0000000002d2', 'e2000000-0000-4000-a000-000000000048', 2, 'As mudanças sociais e culturais que acompanham o processo de globalização, ao mesmo tempo em que refletem a preponderância da cultura urbana, tornam obsoletas as formas de educação tradicionais próprias do meio rural.', false),
  ('e2000000-0000-4000-b000-0000000002d3', 'e2000000-0000-4000-a000-000000000048', 3, 'As populações nos grandes centros urbanos e no meio rural recorrem aos instrumentos e tecnologias de informação basicamente como meio de comunicação mútua, e não os veem como fontes de educação e cultura.', false),
  ('e2000000-0000-4000-b000-0000000002d4', 'e2000000-0000-4000-a000-000000000048', 4, 'A intensificação do fluxo de comunicação por meios eletrônicos, característica do processo de globalização, está dissociada do desenvolvimento social e cultural que ocorre no meio rural.', false),
  ('e2000000-0000-4000-b000-0000000002da', 'e2000000-0000-4000-a000-000000000049', 0, 'As desigualdades econômicas existentes entre regiões brasileiras desapareceram, tendo em vista a modernização tecnológica e o crescimento vivido pelo país.', false),
  ('e2000000-0000-4000-b000-0000000002db', 'e2000000-0000-4000-a000-000000000049', 1, 'Os novos fluxos migratórios instaurados em direção ao Norte e ao Centro-Oeste do país prejudicaram o desenvolvimento socioeconômico dessas regiões, incapazes de atender ao crescimento da demanda por postos de trabalho.', false),
  ('e2000000-0000-4000-b000-0000000002dc', 'e2000000-0000-4000-a000-000000000049', 2, 'O Sudeste brasileiro deixou de ser a região com o maior PIB industrial a partir do processo de desconcentração espacial do setor, em direção a outras regiões do país.', false),
  ('e2000000-0000-4000-b000-0000000002dd', 'e2000000-0000-4000-a000-000000000049', 3, 'O avanço da fronteira econômica sobre os estados da região Norte e do Centro-Oeste resultou no desenvolvimento e na introdução de novas atividades econômicas, tanto nos setores primário e secundário, como no terciário.', true),
  ('e2000000-0000-4000-b000-0000000002de', 'e2000000-0000-4000-a000-000000000049', 4, 'O Nordeste tem vivido, ao contrário do restante do país, um período de retração econômica, como consequência da falta de investimentos no setor industrial com base na moderna tecnologia.', false),
  ('e2000000-0000-4000-b000-0000000002e4', 'e2000000-0000-4000-a000-00000000004a', 0, 'As ruínas das cidades mencionadas atestam que grandes epidemias dizimaram suas populações.', false),
  ('e2000000-0000-4000-b000-0000000002e5', 'e2000000-0000-4000-a000-00000000004a', 1, 'As cidades do Xingu desenvolveram a democracia, tal como foi concebida em Tebas.', false),
  ('e2000000-0000-4000-b000-0000000002e6', 'e2000000-0000-4000-a000-00000000004a', 2, 'As duas civilizações tinham cidades autônomas e independentes entre si.', true),
  ('e2000000-0000-4000-b000-0000000002e7', 'e2000000-0000-4000-a000-00000000004a', 3, 'Os povos do Xingu falavam uma mesma língua, tal como nas cidades-Estado da Grécia.', false),
  ('e2000000-0000-4000-b000-0000000002e8', 'e2000000-0000-4000-a000-00000000004a', 4, 'As cidades do Xingu dedicavam-se à arte e à filosofia tal como na Grécia.', false),
  ('e2000000-0000-4000-b000-0000000002ee', 'e2000000-0000-4000-a000-00000000004b', 0, 'O processo migratório foi desencadeado por ações de governo para viabilizar a produção industrial no Sudeste.', false),
  ('e2000000-0000-4000-b000-0000000002ef', 'e2000000-0000-4000-a000-00000000004b', 1, 'Os governos estaduais do Sudeste priorizaram a qualificação da mão-de-obra migrante.', false),
  ('e2000000-0000-4000-b000-0000000002f0', 'e2000000-0000-4000-a000-00000000004b', 2, 'O processo de migração para o Sudeste contribui para o fenômeno conhecido como inchaço urbano.', true),
  ('e2000000-0000-4000-b000-0000000002f1', 'e2000000-0000-4000-a000-00000000004b', 3, 'As migrações para o sudeste desencadearam a valorização do trabalho manual, sobretudo na década de 80.', false),
  ('e2000000-0000-4000-b000-0000000002f2', 'e2000000-0000-4000-a000-00000000004b', 4, 'A falta de especialização dos migrantes é positiva para os empregadores, pois significa maior versatilidade profissional.', false),
  ('e2000000-0000-4000-b000-0000000002f8', 'e2000000-0000-4000-a000-00000000004c', 0, 'A baixa inserção de sua agricultura no comércio mundial.', false),
  ('e2000000-0000-4000-b000-0000000002f9', 'e2000000-0000-4000-a000-00000000004c', 1, 'A quantidade insuficiente de mão-de-obra para o trabalho agrícola.', false),
  ('e2000000-0000-4000-b000-0000000002fa', 'e2000000-0000-4000-a000-00000000004c', 2, 'A presença de estruturas agrárias arcaicas formadas por latifúndios improdutivos.', true),
  ('e2000000-0000-4000-b000-0000000002fb', 'e2000000-0000-4000-a000-00000000004c', 3, 'A situação conflituosa vivida no campo, que impede o crescimento da produção agrícola.', false),
  ('e2000000-0000-4000-b000-0000000002fc', 'e2000000-0000-4000-a000-00000000004c', 4, 'Os sistemas de cultivo mecanizado voltados para o abastecimento do mercado interno.', false),
  ('e2000000-0000-4000-b000-000000000302', 'e2000000-0000-4000-a000-00000000004d', 0, 'Conhecida historicamente como das Missões Jesuíticas é a de maior violência.', false),
  ('e2000000-0000-4000-b000-000000000303', 'e2000000-0000-4000-a000-00000000004d', 1, 'Do Bico do Papagaio apresenta os números mais expressivos.', true),
  ('e2000000-0000-4000-b000-000000000304', 'e2000000-0000-4000-a000-00000000004d', 2, 'Conhecida como oeste baiano tem o maior número de mortes.', false),
  ('e2000000-0000-4000-b000-000000000305', 'e2000000-0000-4000-a000-00000000004d', 3, 'Do norte do Mato Grosso, área de expansão da agricultura mecanizada, é a mais violenta do país.', false),
  ('e2000000-0000-4000-b000-000000000306', 'e2000000-0000-4000-a000-00000000004d', 4, 'Da Zona da Mata mineira teve o maior registro de mortes.', false),
  ('e2000000-0000-4000-b000-00000000030c', 'e2000000-0000-4000-a000-00000000004e', 0, 'Imóveis improdutivos são predominantes em relação às demais formas de ocupação da terra no âmbito nacional e na maioria das regiões.', true),
  ('e2000000-0000-4000-b000-00000000030d', 'e2000000-0000-4000-a000-00000000004e', 1, 'O índice de 63,8% de imóveis improdutivos demonstra que grande parte do solo brasileiro é de baixa fertilidade, impróprio para a atividade agrícola.', false),
  ('e2000000-0000-4000-b000-00000000030e', 'e2000000-0000-4000-a000-00000000004e', 2, 'O percentual de imóveis improdutivos iguala-se ao de imóveis produtivos somados aos minifúndios, o que justifica a existência de conflitos por terra.', false),
  ('e2000000-0000-4000-b000-00000000030f', 'e2000000-0000-4000-a000-00000000004e', 3, 'A região Norte apresenta o segundo menor percentual de imóveis produtivos, possivelmente em razão da presença de densa cobertura florestal, protegida por legislação ambiental.', false),
  ('e2000000-0000-4000-b000-000000000310', 'e2000000-0000-4000-a000-00000000004e', 4, 'A região Centro-Oeste apresenta o menor percentual de área ocupada por minifúndios, o que inviabiliza políticas de reforma agrária nesta região.', false),
  ('e2000000-0000-4000-b000-000000000316', 'e2000000-0000-4000-a000-00000000004f', 0, 'Negociam com os fazendeiros o reajuste dos honorários e a redução da carga horária de trabalho.', false),
  ('e2000000-0000-4000-b000-000000000317', 'e2000000-0000-4000-a000-00000000004f', 1, 'Defendem os direitos dos consumidores junto aos armazéns e mercados das fazendas e carvoarias.', false),
  ('e2000000-0000-4000-b000-000000000318', 'e2000000-0000-4000-a000-00000000004f', 2, 'Substituem as autoridades policiais e jurídicas na resolução dos conflitos entre patrões e empregados.', false),
  ('e2000000-0000-4000-b000-000000000319', 'e2000000-0000-4000-a000-00000000004f', 3, 'Encaminham denúncias ao Ministério Público e promovem ações de conscientização dos trabalhadores.', true),
  ('e2000000-0000-4000-b000-00000000031a', 'e2000000-0000-4000-a000-00000000004f', 4, 'Fortalecem a administração pública ao ministrarem aulas aos seus servidores.', false),
  ('e2000000-0000-4000-b000-000000000320', 'e2000000-0000-4000-a000-000000000050', 0, 'A diminuição do comércio entre países e regiões, que se tornaram autossuficientes na produção de bens e serviços.', false),
  ('e2000000-0000-4000-b000-000000000321', 'e2000000-0000-4000-a000-000000000050', 1, 'A ocorrência de desastres ambientais de grandes proporções, como no caso de derramamento de óleo por navios petroleiros.', true),
  ('e2000000-0000-4000-b000-000000000322', 'e2000000-0000-4000-a000-000000000050', 2, 'A melhora generalizada das condições de vida da população mundial, a partir da eliminação das desigualdades econômicas na atualidade.', false),
  ('e2000000-0000-4000-b000-000000000323', 'e2000000-0000-4000-a000-000000000050', 3, 'O desmatamento, que eliminou grandes extensões de diversos biomas improdutivos, cujas áreas passaram a ser ocupadas por centros industriais modernos.', false),
  ('e2000000-0000-4000-b000-000000000324', 'e2000000-0000-4000-a000-000000000050', 4, 'O aumento demográfico mundial, sobretudo nos países mais desenvolvidos, que apresentam altas taxas de crescimento vegetativo.', false),
  ('e2000000-0000-4000-b000-00000000032a', 'e2000000-0000-4000-a000-000000000051', 0, 'Incapacidade de se manter uma atividade econômica ao longo do tempo sem causar danos ao meio ambiente.', false),
  ('e2000000-0000-4000-b000-00000000032b', 'e2000000-0000-4000-a000-000000000051', 1, 'Incompatibilidade entre crescimento econômico acelerado e preservação de recursos naturais e de fontes não renováveis de energia.', false),
  ('e2000000-0000-4000-b000-00000000032c', 'e2000000-0000-4000-a000-000000000051', 2, 'Interação de todas as dimensões do bem-estar humano com o crescimento econômico, sem a preocupação com a conservação dos recursos naturais que estivera presente desde a Antiguidade.', false),
  ('e2000000-0000-4000-b000-00000000032d', 'e2000000-0000-4000-a000-000000000051', 3, 'Proteção da biodiversidade em face das ameaças de destruição que sofrem as florestas tropicais devido ao avanço de atividades como a mineração, a monocultura, o tráfico de madeira e de espécies selvagens.', false),
  ('e2000000-0000-4000-b000-00000000032e', 'e2000000-0000-4000-a000-000000000051', 4, 'Necessidade de se satisfazer as demandas atuais colocadas pelo desenvolvimento sem comprometer a capacidade de as gerações futuras atenderem suas próprias necessidades nos campos econômico, social e ambiental.', true),
  ('e2000000-0000-4000-b000-000000000334', 'e2000000-0000-4000-a000-000000000052', 0, 'Situar-se em uma zona geopolítica mais estável que o Oriente Médio.', true),
  ('e2000000-0000-4000-b000-000000000335', 'e2000000-0000-4000-a000-000000000052', 1, 'Possibilitar o povoamento de uma região pouco habitada, além de promover seu desenvolvimento econômico.', false),
  ('e2000000-0000-4000-b000-000000000336', 'e2000000-0000-4000-a000-000000000052', 2, 'Garantir, aos países em desenvolvimento, acesso a matérias-primas e energia, necessárias ao crescimento econômico.', false),
  ('e2000000-0000-4000-b000-000000000337', 'e2000000-0000-4000-a000-000000000052', 3, 'Contribuir para a redução da poluição em áreas ambientalmente já degradadas devido ao grande volume da produção industrial, como ocorreu na Europa.', false),
  ('e2000000-0000-4000-b000-000000000338', 'e2000000-0000-4000-a000-000000000052', 4, 'Promover a participação dos combustíveis fósseis na matriz energética mundial, dominada, majoritariamente, pelas fontes renováveis, de maior custo.', false),
  ('e2000000-0000-4000-b000-00000000033e', 'e2000000-0000-4000-a000-000000000053', 0, 'A Venezuela já está integrada ao MERCOSUL.', false),
  ('e2000000-0000-4000-b000-00000000033f', 'e2000000-0000-4000-a000-000000000053', 1, 'São reservas comprovadas, mas ainda inexploradas.', false),
  ('e2000000-0000-4000-b000-000000000340', 'e2000000-0000-4000-a000-000000000053', 2, 'Podem ser exploradas sem causarem alterações ambientais.', false),
  ('e2000000-0000-4000-b000-000000000341', 'e2000000-0000-4000-a000-000000000053', 3, 'Já estão comprometidas com o setor industrial interno daquele país.', false),
  ('e2000000-0000-4000-b000-000000000342', 'e2000000-0000-4000-a000-000000000053', 4, 'A Venezuela é uma grande potência energética mundial.', true),
  ('e2000000-0000-4000-b000-000000000348', 'e2000000-0000-4000-a000-000000000054', 0, 'Portugal, pelo Tratado de Tordesilhas, detinha o controle da foz do rio Amazonas.', false),
  ('e2000000-0000-4000-b000-000000000349', 'e2000000-0000-4000-a000-000000000054', 1, 'O Tratado de Tordesilhas utilizava os rios como limite físico da América portuguesa.', false),
  ('e2000000-0000-4000-b000-00000000034a', 'e2000000-0000-4000-a000-000000000054', 2, 'O Tratado de Madri reconheceu a expansão portuguesa além da linha de Tordesilhas.', true),
  ('e2000000-0000-4000-b000-00000000034b', 'e2000000-0000-4000-a000-000000000054', 3, 'Portugal, pelo Tratado de San Ildefonso, perdia territórios na América em relação ao de Tordesilhas.', false),
  ('e2000000-0000-4000-b000-00000000034c', 'e2000000-0000-4000-a000-000000000054', 4, 'O Tratado de Madri criou a divisão administrativa da América Portuguesa em Vice-Reinos Oriental e Ocidental.', false),
  ('e2000000-0000-4000-b000-000000000352', 'e2000000-0000-4000-a000-000000000055', 0, '![](conteudo/enem/2009/85-a-9cb975ad.webp)', false),
  ('e2000000-0000-4000-b000-000000000353', 'e2000000-0000-4000-a000-000000000055', 1, '![](conteudo/enem/2009/85-b-b7e91166.webp)', false),
  ('e2000000-0000-4000-b000-000000000354', 'e2000000-0000-4000-a000-000000000055', 2, '![](conteudo/enem/2009/85-c-6d794016.webp)', false),
  ('e2000000-0000-4000-b000-000000000355', 'e2000000-0000-4000-a000-000000000055', 3, '![](conteudo/enem/2009/85-d-305b509e.webp)', true),
  ('e2000000-0000-4000-b000-000000000356', 'e2000000-0000-4000-a000-000000000055', 4, '![](conteudo/enem/2009/85-e-fc415de4.webp)', false),
  ('e2000000-0000-4000-b000-00000000035c', 'e2000000-0000-4000-a000-000000000056', 0, 'Os regimes climáticos da Terra são desprovidos de padrões que os caracterizem.', false),
  ('e2000000-0000-4000-b000-00000000035d', 'e2000000-0000-4000-a000-000000000056', 1, 'As intervenções humanas nas regiões polares são mais intensas que em outras partes do globo.', false),
  ('e2000000-0000-4000-b000-00000000035e', 'e2000000-0000-4000-a000-000000000056', 2, 'O processo de aquecimento global será detido com a eliminação das queimadas.', false),
  ('e2000000-0000-4000-b000-00000000035f', 'e2000000-0000-4000-a000-000000000056', 3, 'A destruição das florestas tropicais é uma das causas do aumento da temperatura em locais distantes como os polos.', true),
  ('e2000000-0000-4000-b000-000000000360', 'e2000000-0000-4000-a000-000000000056', 4, 'Os parâmetros climáticos modificados pelo homem afetam todo o planeta, mas os processos naturais têm alcance regional.', false),
  ('e2000000-0000-4000-b000-000000000366', 'e2000000-0000-4000-a000-000000000057', 0, 'A existência de áreas superáridas, áridas e semiáridas é resultado do processo de desertificação, de intensidade variável, causado pela ação humana.', false),
  ('e2000000-0000-4000-b000-000000000367', 'e2000000-0000-4000-a000-000000000057', 1, 'O emprego de modernas técnicas de irrigação possibilitou a expansão da agricultura em determinadas áreas do semiárido, integrando-as ao comércio internacional.', true),
  ('e2000000-0000-4000-b000-000000000368', 'e2000000-0000-4000-a000-000000000057', 2, 'O semiárido, por apresentar déficit de precipitação, passou a ser habitado a partir da Idade Moderna, graças ao avanço científico e tecnológico.', false),
  ('e2000000-0000-4000-b000-000000000369', 'e2000000-0000-4000-a000-000000000057', 3, 'As áreas com escassez hídrica na América do Sul se restringem às regiões tropicais, onde as médias de temperatura anual são mais altas, justificando a falta de desenvolvimento e os piores indicadores sociais.', false),
  ('e2000000-0000-4000-b000-00000000036a', 'e2000000-0000-4000-a000-000000000057', 4, 'O mesmo tipo de cobertura vegetal é encontrado nas áreas superáridas, áridas e semiáridas, mas essa cobertura, embora adaptada às condições climáticas, é desprovida de valor econômico.', false),
  ('e2000000-0000-4000-b000-000000000370', 'e2000000-0000-4000-a000-000000000058', 0, 'O maior aquecimento implica menor formação de nuvens e, consequentemente, a eliminação de áreas úmidas e sub úmidas do globo.', false),
  ('e2000000-0000-4000-b000-000000000371', 'e2000000-0000-4000-a000-000000000058', 1, 'As chuvas frontais ficarão restritas ao tempo de permanência da frente em uma determinada localidade, o que limitará a produtividade das atividades agrícolas.', false),
  ('e2000000-0000-4000-b000-000000000372', 'e2000000-0000-4000-a000-000000000058', 2, 'As modificações decorrentes do aumento da temperatura do ar diminuirão a umidade e, portanto, aumentarão a aridez em todo o planeta.', false),
  ('e2000000-0000-4000-b000-000000000373', 'e2000000-0000-4000-a000-000000000058', 3, 'A elevação do nível dos mares pelo derretimento das geleiras acarretará redução na ocorrência de chuvas nos continentes, o que implicará a escassez de água para abastecimento.', false),
  ('e2000000-0000-4000-b000-000000000374', 'e2000000-0000-4000-a000-000000000058', 4, 'A origem da chuva está diretamente relacionada com a temperatura do ar, sendo que atividades antropogênicas são capazes de provocar interferências em escala local e global.', true),
  ('e2000000-0000-4000-b000-00000000037a', 'e2000000-0000-4000-a000-000000000059', 0, 'A cultura dos povos é reduzida a exemplos esquemáticos que não encontram respaldo na história do Brasil ou da América.', false),
  ('e2000000-0000-4000-b000-00000000037b', 'e2000000-0000-4000-a000-000000000059', 1, 'As cidades, na primeira afirmação, têm um papel mais fraco na vida social, enquanto a América é mostrada como um exemplo a ser evitado.', false),
  ('e2000000-0000-4000-b000-00000000037c', 'e2000000-0000-4000-a000-000000000059', 2, 'A objeção inicial, de que as cidades não podem ser inventadas, é negada logo em seguida pelo exemplo utópico da colonização da América.', false),
  ('e2000000-0000-4000-b000-00000000037d', 'e2000000-0000-4000-a000-000000000059', 3, 'A concepção fundamental da primeira afirmação defende a construção de cidades e a segunda mostra, historicamente, que essa estratégia acarretou sérios problemas.', false),
  ('e2000000-0000-4000-b000-00000000037e', 'e2000000-0000-4000-a000-000000000059', 4, 'A primeira entende que as cidades devem ser organismos vivos, que nascem de forma espontânea, e a segunda mostra que há exemplos históricos que demonstram o contrário.', true),
  ('e2000000-0000-4000-b000-000000000384', 'e2000000-0000-4000-a000-00000000005a', 0, 'A criação de parques ecológicos na área do pantanal mato-grossense.', false),
  ('e2000000-0000-4000-b000-000000000385', 'e2000000-0000-4000-a000-00000000005a', 1, 'A proibição da pesca e da caça, que tanto ameaçam a biodiversidade.', false),
  ('e2000000-0000-4000-b000-000000000386', 'e2000000-0000-4000-a000-00000000005a', 2, 'O aumento das pastagens na área da planície, para que a cobertura vegetal, composta de gramíneas, evite a erosão do solo.', false),
  ('e2000000-0000-4000-b000-000000000387', 'e2000000-0000-4000-a000-00000000005a', 3, 'O controle do desmatamento e da erosão, principalmente nas nascentes dos rios responsáveis pelo nível das águas durante o período de cheias.', true),
  ('e2000000-0000-4000-b000-000000000388', 'e2000000-0000-4000-a000-00000000005a', 4, 'A construção de barragens, para que o nível das águas dos rios seja mantido, sobretudo na estiagem, sem prejudicar os ecossistemas.', false),
  ('e2000000-0000-4000-b000-00000000038e', 'e2000000-0000-4000-a000-00000000005b', 0, '![](conteudo/enem/2009/91-a-408d83bd.webp)', true),
  ('e2000000-0000-4000-b000-00000000038f', 'e2000000-0000-4000-a000-00000000005b', 1, '![](conteudo/enem/2009/91-b-621bd155.webp)', false),
  ('e2000000-0000-4000-b000-000000000390', 'e2000000-0000-4000-a000-00000000005b', 2, '![](conteudo/enem/2009/91-c-078717dc.webp)', false),
  ('e2000000-0000-4000-b000-000000000391', 'e2000000-0000-4000-a000-00000000005b', 3, '![](conteudo/enem/2009/91-d-e9829610.webp)', false),
  ('e2000000-0000-4000-b000-000000000392', 'e2000000-0000-4000-a000-00000000005b', 4, '![](conteudo/enem/2009/91-e-151cb81f.webp)', false),
  ('e2000000-0000-4000-b000-000000000398', 'e2000000-0000-4000-a000-00000000005c', 0, 'À adequação de sua fala à conversa com um amigo, caracterizada pela informalidade', true),
  ('e2000000-0000-4000-b000-000000000399', 'e2000000-0000-4000-a000-00000000005c', 1, 'À iniciativa do cliente em se apresentar como funcionário do banco.', false),
  ('e2000000-0000-4000-b000-00000000039a', 'e2000000-0000-4000-a000-00000000005c', 2, 'Ao fato de ambos terem nascido em Uberlândia (Minas Gerais).', false),
  ('e2000000-0000-4000-b000-00000000039b', 'e2000000-0000-4000-a000-00000000005c', 3, 'À intimidade forçada pelo cliente ao fornecer seu nome completo.', false),
  ('e2000000-0000-4000-b000-00000000039c', 'e2000000-0000-4000-a000-00000000005c', 4, 'Ao seu interesse profissional em financiar o veículo de Júlio.', false),
  ('e2000000-0000-4000-b000-0000000003a2', 'e2000000-0000-4000-a000-00000000005d', 0, 'Ao adolescente que acessa sites de entretenimento.', false),
  ('e2000000-0000-4000-b000-0000000003a3', 'e2000000-0000-4000-a000-00000000005d', 1, 'Ao profissional interessado em aperfeiçoamento tecnológico.', false),
  ('e2000000-0000-4000-b000-0000000003a4', 'e2000000-0000-4000-a000-00000000005d', 2, 'À pessoa que usa os sites de relacionamento para complementar seu círculo de amizades.', false),
  ('e2000000-0000-4000-b000-0000000003a5', 'e2000000-0000-4000-a000-00000000005d', 3, 'Ao usuário que reserva mais tempo aos sites de relacionamento do que ao convívio pessoal com os amigos.', true),
  ('e2000000-0000-4000-b000-0000000003a6', 'e2000000-0000-4000-a000-00000000005d', 4, 'Ao leitor que se interessa em aprender sobre o funcionamento de diversos tipos de sites de relacionamento.', false),
  ('e2000000-0000-4000-b000-0000000003ac', 'e2000000-0000-4000-a000-00000000005e', 0, '1 executa um gênero característico da música brasileira, conhecido como chorinho.', true),
  ('e2000000-0000-4000-b000-0000000003ad', 'e2000000-0000-4000-a000-00000000005e', 1, '2 executa um gênero característico da música clássica, cujo compositor mais conhecido é Tom Jobim.', false),
  ('e2000000-0000-4000-b000-0000000003ae', 'e2000000-0000-4000-a000-00000000005e', 2, '3 executa um gênero característico da música europeia, que tem como representantes Beethoven e Mozart.', false),
  ('e2000000-0000-4000-b000-0000000003af', 'e2000000-0000-4000-a000-00000000005e', 3, '4 executa um tipo de música caracterizada pelos instrumentos acústicos, cuja intensidade e nível de ruído permanecem na faixa dos 30 aos 40 decibéis.', false),
  ('e2000000-0000-4000-b000-0000000003b0', 'e2000000-0000-4000-a000-00000000005e', 4, '1 a 4 apresentam um produto final bastante semelhante, uma vez que as possibilidades de combinações sonoras ao longo do tempo são limitadas.', false),
  ('e2000000-0000-4000-b000-0000000003b6', 'e2000000-0000-4000-a000-00000000005f', 0, 'A falta de diversidade cultural na sua proposta estética.', false),
  ('e2000000-0000-4000-b000-0000000003b7', 'e2000000-0000-4000-a000-00000000005f', 1, 'A alienação dos artistas em relação às tensões da Segunda Guerra Mundial.', false),
  ('e2000000-0000-4000-b000-0000000003b8', 'e2000000-0000-4000-a000-00000000005f', 2, 'Uma disputa cênica entre as linguagens das artes visuais, do figurino e da música.', false),
  ('e2000000-0000-4000-b000-0000000003b9', 'e2000000-0000-4000-a000-00000000005f', 3, 'As inovações tecnológicas nas partes cênicas, musicais, coreográficas e de figurino.', true),
  ('e2000000-0000-4000-b000-0000000003ba', 'e2000000-0000-4000-a000-00000000005f', 4, 'Uma narrativa com encadeamentos claramente lógicos e lineares.', false),
  ('e2000000-0000-4000-b000-0000000003c0', 'e2000000-0000-4000-a000-000000000060', 0, 'O emprego de enumeração de itens e apresentação de títulos expressivos.', false),
  ('e2000000-0000-4000-b000-0000000003c1', 'e2000000-0000-4000-a000-000000000060', 1, 'O uso de orações subordinadas condicionais e temporais.', false),
  ('e2000000-0000-4000-b000-0000000003c2', 'e2000000-0000-4000-a000-000000000060', 2, 'O emprego de pronomes como “você” e “sua” e o uso do imperativo.', true),
  ('e2000000-0000-4000-b000-0000000003c3', 'e2000000-0000-4000-a000-000000000060', 3, 'A construção de figuras metafóricas e o uso de repetição.', false),
  ('e2000000-0000-4000-b000-0000000003c4', 'e2000000-0000-4000-a000-000000000060', 4, 'O fornecimento de número de telefone gratuito para contato.', false),
  ('e2000000-0000-4000-b000-0000000003ca', 'e2000000-0000-4000-a000-000000000061', 0, 'Descrevendo a situação do país em relação à gripe suína.', false),
  ('e2000000-0000-4000-b000-0000000003cb', 'e2000000-0000-4000-a000-000000000061', 1, 'Alertando a população para o risco de morte pela Influenza A.', false),
  ('e2000000-0000-4000-b000-0000000003cc', 'e2000000-0000-4000-a000-000000000061', 2, 'Informando a população sobre a iminência de uma pandemia de Influenza A.', false),
  ('e2000000-0000-4000-b000-0000000003cd', 'e2000000-0000-4000-a000-000000000061', 3, 'Orientando a população sobre os sintomas da gripe suína e procedimentos para evitar a contaminação.', true),
  ('e2000000-0000-4000-b000-0000000003ce', 'e2000000-0000-4000-a000-000000000061', 4, 'Convocando toda a população para se submeter a exames de detecção da gripe suína.', false),
  ('e2000000-0000-4000-b000-0000000003d4', 'e2000000-0000-4000-a000-000000000062', 0, '“Quando um doce bardo brada a toda brida” (v. 2).', false),
  ('e2000000-0000-4000-b000-0000000003d5', 'e2000000-0000-4000-a000-000000000062', 1, '“Em velas pandas, suas esquisitas rimas?” (v. 3).', false),
  ('e2000000-0000-4000-b000-0000000003d6', 'e2000000-0000-4000-a000-000000000062', 2, '“Que devora a voz do morto” (v. 9).', false),
  ('e2000000-0000-4000-b000-0000000003d7', 'e2000000-0000-4000-a000-000000000062', 3, '“lobo-bolo//Tipo pra rimar com ouro de tolo? (v. 11-12)', true),
  ('e2000000-0000-4000-b000-0000000003d8', 'e2000000-0000-4000-a000-000000000062', 4, '“Tease me, tease me outra vez” (v. 14)', false),
  ('e2000000-0000-4000-b000-0000000003de', 'e2000000-0000-4000-a000-000000000063', 0, 'A opção pela abordagem, em linguagem simples e direta, de temas filosóficos.', false),
  ('e2000000-0000-4000-b000-0000000003df', 'e2000000-0000-4000-a000-000000000063', 1, 'A prevalência do lirismo amoroso e intimista em relação à temática nacionalista.', false),
  ('e2000000-0000-4000-b000-0000000003e0', 'e2000000-0000-4000-a000-000000000063', 2, 'O refinamento estético da forma poética e o tratamento metafísico de temas universais.', true),
  ('e2000000-0000-4000-b000-0000000003e1', 'e2000000-0000-4000-a000-000000000063', 3, 'A evidente preocupação do eu lírico com a realidade social expressa em imagens poéticas inovadoras.', false),
  ('e2000000-0000-4000-b000-0000000003e2', 'e2000000-0000-4000-a000-000000000063', 4, 'A liberdade formal da estrutura poética que dispensa a rima e a métrica tradicionais em favor de temas do cotidiano.', false),
  ('e2000000-0000-4000-b000-0000000003e8', 'e2000000-0000-4000-a000-000000000064', 0, 'O entrevistado deseja convencer o jornalista a não publicar um livro.', false),
  ('e2000000-0000-4000-b000-0000000003e9', 'e2000000-0000-4000-a000-000000000064', 1, 'O principal objetivo do entrevistado é explicar o significado da palavra motivação.', false),
  ('e2000000-0000-4000-b000-0000000003ea', 'e2000000-0000-4000-a000-000000000064', 2, 'São utilizados diversos recursos da linguagem literária, tais como a metáfora e a metonímia.', false),
  ('e2000000-0000-4000-b000-0000000003eb', 'e2000000-0000-4000-a000-000000000064', 3, 'O entrevistado deseja informar de modo objetivo o jornalista sobre as etapas de produção de um livro.', false),
  ('e2000000-0000-4000-b000-0000000003ec', 'e2000000-0000-4000-a000-000000000064', 4, 'O principal objetivo do entrevistado é evidenciar seu sentimento com relação ao processo de produção de um livro.', true),
  ('e2000000-0000-4000-b000-0000000003f2', 'e2000000-0000-4000-a000-000000000065', 0, 'A criação do espetáculo teatral apresenta-se como um fenômeno de ordem individual, pois não é possível sua concepção de forma coletiva.', false),
  ('e2000000-0000-4000-b000-0000000003f3', 'e2000000-0000-4000-a000-000000000065', 1, 'O cenário onde se desenrola a ação cênica é concebido e construído pelo cenógrafo de modo autônomo e independente do tema da peça e do trabalho interpretativo dos atores.', false),
  ('e2000000-0000-4000-b000-0000000003f4', 'e2000000-0000-4000-a000-000000000065', 2, 'O texto cênico pode originar-se dos mais variados gêneros textuais, como contos, lendas, romances, poesias, crônicas, notícias, imagens e fragmentos textuais, entre outros.', true),
  ('e2000000-0000-4000-b000-0000000003f5', 'e2000000-0000-4000-a000-000000000065', 3, 'O corpo do ator na cena tem pouca importância na comunicação teatral, visto que o mais importante é a expressão verbal, base da comunicação cênica em toda a trajetória do teatro até os dias atuais.', false),
  ('e2000000-0000-4000-b000-0000000003f6', 'e2000000-0000-4000-a000-000000000065', 4, 'A iluminação e o som de um espetáculo cênico independem do processo de produção/recepção do espetáculo teatral, já que se trata de linguagens artísticas diferentes, agregadas posteriormente à cena teatral.', false),
  ('e2000000-0000-4000-b000-0000000003fc', 'e2000000-0000-4000-a000-000000000066', 0, 'Apresenta uma postura regular.', false),
  ('e2000000-0000-4000-b000-0000000003fd', 'e2000000-0000-4000-a000-000000000066', 1, 'Pode se exercitar por períodos curtos de tempo.', false),
  ('e2000000-0000-4000-b000-0000000003fe', 'e2000000-0000-4000-a000-000000000066', 2, 'Pode desenvolver as atividades físicas do dia-a-dia, independentemente de sua idade.', true),
  ('e2000000-0000-4000-b000-0000000003ff', 'e2000000-0000-4000-a000-000000000066', 3, 'Pode executar suas atividades do dia a dia com vigor, atenção e uma fadiga de moderada a intensa.', false),
  ('e2000000-0000-4000-b000-000000000400', 'e2000000-0000-4000-a000-000000000066', 4, 'Pode exercer atividades físicas no final do dia, mas suas reservas de energia são insuficientes para atividades intelectuais.', false),
  ('e2000000-0000-4000-b000-000000000406', 'e2000000-0000-4000-a000-000000000067', 0, 'É o leitor que constrói a versão final do texto.', true),
  ('e2000000-0000-4000-b000-000000000407', 'e2000000-0000-4000-a000-000000000067', 1, 'O autor detém o controle absoluto do que escreve.', false),
  ('e2000000-0000-4000-b000-000000000408', 'e2000000-0000-4000-a000-000000000067', 2, 'Aclara os limites entre o leitor e o autor.', false),
  ('e2000000-0000-4000-b000-000000000409', 'e2000000-0000-4000-a000-000000000067', 3, 'Propicia um evento textual-interativo em que apenas o autor é ativo.', false),
  ('e2000000-0000-4000-b000-00000000040a', 'e2000000-0000-4000-a000-000000000067', 4, 'Só o autor conhece o que eletronicamente se dispõe para o leitor.', false),
  ('e2000000-0000-4000-b000-000000000410', 'e2000000-0000-4000-a000-000000000068', 0, 'Em que a imagem pouco contribui para facilitar a interpretação da mensagem contida no texto, como pode ser constatado no primeiro quadrinho.', false),
  ('e2000000-0000-4000-b000-000000000411', 'e2000000-0000-4000-a000-000000000068', 1, 'Cuja linguagem se caracteriza por ser rápida e clara, que facilita a compreensão, como se percebe na fala do segundo quadrinho: “</DIV> </SPAN> <BR CLEAR = ALL> < BR> <BR> <SCRIPT>”.', false),
  ('e2000000-0000-4000-b000-000000000412', 'e2000000-0000-4000-a000-000000000068', 2, 'Em que o uso de letras com espessuras diversas está ligado a sentimentos expressos pelos personagens, como pode ser percebido no último quadrinho.', false),
  ('e2000000-0000-4000-b000-000000000413', 'e2000000-0000-4000-a000-000000000068', 3, 'Que possui em seu texto escrito características próximas a uma conversação face a face, como pode ser percebido no segundo quadrinho.', true),
  ('e2000000-0000-4000-b000-000000000414', 'e2000000-0000-4000-a000-000000000068', 4, 'Que a localização casual dos balões nos quadrinhos expressa com clareza a sucessão cronológica da história, como pode ser percebido no segundo quadrinho.', false),
  ('e2000000-0000-4000-b000-00000000041a', 'e2000000-0000-4000-a000-000000000069', 0, 'Desempenham importante papel, porque sem elas não seria possível registrar os acontecimentos históricos.', false),
  ('e2000000-0000-4000-b000-00000000041b', 'e2000000-0000-4000-a000-000000000069', 1, 'Facilitam os processos educacionais para ensino de tecnologia, mas não exercem influência nas ciências humanas.', false),
  ('e2000000-0000-4000-b000-00000000041c', 'e2000000-0000-4000-a000-000000000069', 2, 'Limitam-se a dar suporte aos meios de comunicação, facilitando sobretudo os trabalhos jornalísticos.', false),
  ('e2000000-0000-4000-b000-00000000041d', 'e2000000-0000-4000-a000-000000000069', 3, 'Contribuem para o desenvolvimento social, pois permitem o registro e a disseminação do conhecimento de forma mais democrática e interativa.', true),
  ('e2000000-0000-4000-b000-00000000041e', 'e2000000-0000-4000-a000-000000000069', 4, 'Estão em estágio experimental, particularmente na educação, área em que ainda não demonstraram potencial produtivo.', false),
  ('e2000000-0000-4000-b000-000000000424', 'e2000000-0000-4000-a000-00000000006a', 0, 'Atraem o leitor por meio de previsões para o futuro.', false),
  ('e2000000-0000-4000-b000-000000000425', 'e2000000-0000-4000-a000-00000000006a', 1, 'Apelam à emoção do leitor, mencionando a morte de animais.', false),
  ('e2000000-0000-4000-b000-000000000426', 'e2000000-0000-4000-a000-00000000006a', 2, 'Orientam o leitor a respeito dos modos de usar conscientemente as sacolas plásticas.', false),
  ('e2000000-0000-4000-b000-000000000427', 'e2000000-0000-4000-a000-00000000006a', 3, 'Intimidam o leitor com as nocivas consequências do uso indiscriminado de sacolas plásticas.', false),
  ('e2000000-0000-4000-b000-000000000428', 'e2000000-0000-4000-a000-00000000006a', 4, 'Recorrem à informação, por meio de constatações, para convencer o leitor a evitar o uso de sacolas plásticas.', true),
  ('e2000000-0000-4000-b000-00000000042e', 'e2000000-0000-4000-a000-00000000006b', 0, 'O texto I apresenta um alerta a respeito do efeito da reciclagem de materiais plásticos; o texto II justifica o uso desse material reciclado.', false),
  ('e2000000-0000-4000-b000-00000000042f', 'e2000000-0000-4000-a000-00000000006b', 1, 'O texto I tem como objetivo precípuo apresentar a versatilidade e as vantagens do uso do plástico na contemporaneidade; o texto II objetiva alertar os consumidores sobre os problemas ambientais decorrentes de embalagens plásticas não recicladas.', true),
  ('e2000000-0000-4000-b000-000000000430', 'e2000000-0000-4000-a000-00000000006b', 2, 'O texto I expõe vantagens, sem qualquer ressalva, do uso do plástico; o texto II busca convencer o leitor a evitar o uso de embalagens plásticas.', false),
  ('e2000000-0000-4000-b000-000000000431', 'e2000000-0000-4000-a000-00000000006b', 3, 'O texto I ilustra o posicionamento de fabricantes de embalagens plásticas, mostrando por que elas devem ser usadas; o texto II ilustra o posicionamento de consumidores comuns, que buscam praticidade e conforto.', false),
  ('e2000000-0000-4000-b000-000000000432', 'e2000000-0000-4000-a000-00000000006b', 4, 'O texto I apresenta um alerta a respeito da possibilidade de contaminação de produtos orgânicos e industrializados decorrente do uso de plástico em suas embalagens; o texto II apresenta vantagens do consumo de sacolas plásticas: leves, descartáveis e gratuitas.', false),
  ('e2000000-0000-4000-b000-000000000438', 'e2000000-0000-4000-a000-00000000006c', 0, 'O uso de expressões linguísticas e vocabulário próprios de épocas antigas.', false),
  ('e2000000-0000-4000-b000-000000000439', 'e2000000-0000-4000-a000-00000000006c', 1, 'O uso de expressões linguísticas inseridas no registro mais formal da língua.', false),
  ('e2000000-0000-4000-b000-00000000043a', 'e2000000-0000-4000-a000-00000000006c', 2, 'O caráter coloquial expresso pelo uso do tempo verbal no segundo quadrinho.', true),
  ('e2000000-0000-4000-b000-00000000043b', 'e2000000-0000-4000-a000-00000000006c', 3, 'O uso de um vocabulário específico para situações comunicativas de emergência.', false),
  ('e2000000-0000-4000-b000-00000000043c', 'e2000000-0000-4000-a000-00000000006c', 4, 'A intenção comunicativa dos personagens: a de estabelecer a hierarquia entre eles.', false),
  ('e2000000-0000-4000-b000-000000000442', 'e2000000-0000-4000-a000-00000000006d', 0, 'A dependência das escolas públicas quanto ao uso de sistemas de informação.', false),
  ('e2000000-0000-4000-b000-000000000443', 'e2000000-0000-4000-a000-00000000006d', 1, 'A ampliação do grau de interação entre as pessoas, a partir de tecnologia convencional.', false),
  ('e2000000-0000-4000-b000-000000000444', 'e2000000-0000-4000-a000-00000000006d', 2, 'A democratização da informação, por meio da disponibilização de conteúdo cultural e científico à sociedade.', true),
  ('e2000000-0000-4000-b000-000000000445', 'e2000000-0000-4000-a000-00000000006d', 3, 'A comercialização do acesso a diversas produções culturais nacionais e estrangeiras via tecnologia da informação e da comunicação.', false),
  ('e2000000-0000-4000-b000-000000000446', 'e2000000-0000-4000-a000-00000000006d', 4, 'A produção de repertório cultural direcionado a acadêmicos e educadores.', false),
  ('e2000000-0000-4000-b000-00000000044c', 'e2000000-0000-4000-a000-00000000006e', 0, 'Recriação da realidade brasileira de forma ficcional.', false),
  ('e2000000-0000-4000-b000-00000000044d', 'e2000000-0000-4000-a000-00000000006e', 1, 'Criação neológica na língua portuguesa.', false),
  ('e2000000-0000-4000-b000-00000000044e', 'e2000000-0000-4000-a000-00000000006e', 2, 'Formação da identidade nacional por meio da tradição oral.', true),
  ('e2000000-0000-4000-b000-00000000044f', 'e2000000-0000-4000-a000-00000000006e', 3, 'Incorreção da língua portuguesa que é falada por pessoas do interior do Brasil.', false),
  ('e2000000-0000-4000-b000-000000000450', 'e2000000-0000-4000-a000-00000000006e', 4, 'Padronização de palavras que variam regionalmente, mas possuem mesmo significado.', false),
  ('e2000000-0000-4000-b000-000000000456', 'e2000000-0000-4000-a000-00000000006f', 0, 'Ambos se identificam pelas características estéticas marcantes, como tristeza e melancolia, do movimento romântico das artes plásticas.', false),
  ('e2000000-0000-4000-b000-000000000457', 'e2000000-0000-4000-a000-00000000006f', 1, 'O artista, na pintura, foi fiel ao seu objeto, representando-o de maneira realista, ao passo que o texto é apenas fantasioso.', false),
  ('e2000000-0000-4000-b000-000000000458', 'e2000000-0000-4000-a000-00000000006f', 2, 'A pintura e o texto têm uma característica em comum, que é representar o habitante das terras que sofreriam processo colonizador.', true),
  ('e2000000-0000-4000-b000-000000000459', 'e2000000-0000-4000-a000-00000000006f', 3, 'O texto e a pintura são baseados no contraste entre a cultura europeia e a cultura indígena.', false),
  ('e2000000-0000-4000-b000-00000000045a', 'e2000000-0000-4000-a000-00000000006f', 4, 'Há forte direcionamento religioso no texto e na pintura, uma vez que o índio representado é objeto da catequização jesuítica.', false),
  ('e2000000-0000-4000-b000-000000000460', 'e2000000-0000-4000-a000-000000000070', 0, 'Uma classificação que caracteriza cada uma das áreas nas quais as novas TIC podem ser aplicadas, relacionando os padrões de utilização e exemplificando o uso dessas TIC no mundo moderno.', false),
  ('e2000000-0000-4000-b000-000000000461', 'e2000000-0000-4000-a000-000000000070', 1, 'Uma relação das áreas ou subáreas de conhecimento que ainda não foram contempladas com o uso das novas tecnologias digitais, o que caracteriza uma brecha tecnológica que precisa ser minimizada.', false),
  ('e2000000-0000-4000-b000-000000000462', 'e2000000-0000-4000-a000-000000000070', 2, 'Uma enorme diferença de desempenho entre os empreendimentos que utilizam as tecnologias digitais e aqueles que permaneceram usando métodos e técnicas analógicas.', false),
  ('e2000000-0000-4000-b000-000000000463', 'e2000000-0000-4000-a000-000000000070', 3, 'Um aprofundamento das diferenças sociais já existentes, uma vez que se torna difícil a aquisição de conhecimentos e habilidades fundamentais pelas populações menos favorecidas nos novos meios produtivos.', true),
  ('e2000000-0000-4000-b000-000000000464', 'e2000000-0000-4000-a000-000000000070', 4, 'Uma proposta de educação para o uso de novas pedagogias com a finalidade de acompanhar a evolução das mídias e orientar a produção de material pedagógico com apoio de computadores e outras técnicas digitais.', false),
  ('e2000000-0000-4000-b000-00000000046a', 'e2000000-0000-4000-a000-000000000071', 0, 'Consumo de produtos naturais provindos da Amazônia.', false),
  ('e2000000-0000-4000-b000-00000000046b', 'e2000000-0000-4000-a000-000000000071', 1, 'Cuidado na hora de comprar produtos alimentícios.', false),
  ('e2000000-0000-4000-b000-00000000046c', 'e2000000-0000-4000-a000-000000000071', 2, 'Verificação da existência do selo de padronização de produtos industriais.', false),
  ('e2000000-0000-4000-b000-00000000046d', 'e2000000-0000-4000-a000-000000000071', 3, 'Certificação de que o produto foi fabricado de acordo com os princípios éticos.', true),
  ('e2000000-0000-4000-b000-00000000046e', 'e2000000-0000-4000-a000-000000000071', 4, 'Verificação da garantia de tratamento dos recursos naturais utilizados em cada produto.', false),
  ('e2000000-0000-4000-b000-000000000474', 'e2000000-0000-4000-a000-000000000072', 0, 'Iniciativa individual do indígena para a prática da dança e do canto.', false),
  ('e2000000-0000-4000-b000-000000000475', 'e2000000-0000-4000-a000-000000000072', 1, 'Excelente forma física apresentada pelo povo Xavante.', false),
  ('e2000000-0000-4000-b000-000000000476', 'e2000000-0000-4000-a000-000000000072', 2, 'Multiculturalidade presente na sua manifestação cênica.', false),
  ('e2000000-0000-4000-b000-000000000477', 'e2000000-0000-4000-a000-000000000072', 3, 'Inexistência de um planejamento da estética da dança, caracterizada pelo ineditismo.', false),
  ('e2000000-0000-4000-b000-000000000478', 'e2000000-0000-4000-a000-000000000072', 4, 'Preservação de uma identidade entre a gestualidade ancestral e a novidade dos cantos a serem entoados.', true),
  ('e2000000-0000-4000-b000-00000000047e', 'e2000000-0000-4000-a000-000000000073', 0, 'Fática, porque o autor procura testar o canal de comunicação.', false),
  ('e2000000-0000-4000-b000-00000000047f', 'e2000000-0000-4000-a000-000000000073', 1, 'Metalinguística, porque há explicação do significado das expressões.', false),
  ('e2000000-0000-4000-b000-000000000480', 'e2000000-0000-4000-a000-000000000073', 2, 'Conativa, uma vez que o leitor é provocado a participar de uma ação.', false),
  ('e2000000-0000-4000-b000-000000000481', 'e2000000-0000-4000-a000-000000000073', 3, 'Referencial, já que são apresentadas informações sobre acontecimentos e fatos reais.', false),
  ('e2000000-0000-4000-b000-000000000482', 'e2000000-0000-4000-a000-000000000073', 4, 'Poética, pois chama-se a atenção para a elaboração especial e artística da estrutura do texto.', true),
  ('e2000000-0000-4000-b000-000000000488', 'e2000000-0000-4000-a000-000000000074', 0, 'A construção de oposições semânticas.', false),
  ('e2000000-0000-4000-b000-000000000489', 'e2000000-0000-4000-a000-000000000074', 1, 'A apresentação de ideias de forma objetiva.', false),
  ('e2000000-0000-4000-b000-00000000048a', 'e2000000-0000-4000-a000-000000000074', 2, 'O emprego recorrente de figuras de linguagem, como o eufemismo.', false),
  ('e2000000-0000-4000-b000-00000000048b', 'e2000000-0000-4000-a000-000000000074', 3, 'A repetição de sons e de construções sintáticas semelhantes.', true),
  ('e2000000-0000-4000-b000-00000000048c', 'e2000000-0000-4000-a000-000000000074', 4, 'A inversão da ordem sintática das palavras.', false),
  ('e2000000-0000-4000-b000-000000000492', 'e2000000-0000-4000-a000-000000000075', 0, 'Esse modelo teatral é um método tradicional de fazer teatro que usa, nas suas ações cênicas, a linguagem rebuscada e hermética falada normalmente pelo cidadão comum.', false),
  ('e2000000-0000-4000-b000-000000000493', 'e2000000-0000-4000-a000-000000000075', 1, 'A forma de recepção desse modelo teatral se destaca pela separação entre atores e público, na qual os atores representam seus personagens e a plateia assiste passivamente ao espetáculo.', false),
  ('e2000000-0000-4000-b000-000000000494', 'e2000000-0000-4000-a000-000000000075', 2, 'Sua linguagem teatral pode ser democratizada e apropriada pelo cidadão comum, no sentido de proporcionar-lhe autonomia crítica para compreensão e interpretação do mundo em que vive.', true),
  ('e2000000-0000-4000-b000-000000000495', 'e2000000-0000-4000-a000-000000000075', 3, 'O convite ao espectador para substituir o protagonista e mudar o fim da história evidencia que a proposta de Boal se aproxima das regras do teatro tradicional para a preparação de atores.', false),
  ('e2000000-0000-4000-b000-000000000496', 'e2000000-0000-4000-a000-000000000075', 4, 'A metodologia teatral do Teatro do Oprimido segue a concepção do teatro clássico aristotélico, que visa à desautomação física e intelectual de seus praticantes.', false),
  ('e2000000-0000-4000-b000-00000000049c', 'e2000000-0000-4000-a000-000000000076', 0, 'Ambos os textos tratam da questão do uso da língua com o objetivo de criticar a linguagem do brasileiro.', false),
  ('e2000000-0000-4000-b000-00000000049d', 'e2000000-0000-4000-a000-000000000076', 1, 'Os dois textos defendem a ideia de que o estudo da gramática deve ter o objetivo de ensinar as regras prescritivas da língua.', false),
  ('e2000000-0000-4000-b000-00000000049e', 'e2000000-0000-4000-a000-000000000076', 2, 'A questão do português falado no Brasil é abordada nos dois textos, que procuram justificar como é correto e aceitável o uso coloquial do idioma.', false),
  ('e2000000-0000-4000-b000-00000000049f', 'e2000000-0000-4000-a000-000000000076', 3, 'O primeiro texto enaltece o padrão estrito da língua, ao passo que o segundo defende que a linguagem jornalística deve criar suas próprias regras gramaticais.', false),
  ('e2000000-0000-4000-b000-0000000004a0', 'e2000000-0000-4000-a000-000000000076', 4, 'O primeiro texto prega a rigidez gramatical no uso da língua, enquanto o segundo defende uma adequação da língua escrita ao padrão atual brasileiro.', true),
  ('e2000000-0000-4000-b000-0000000004a6', 'e2000000-0000-4000-a000-000000000077', 0, 'O romance do Sul do Brasil se caracteriza pela temática essencialmente urbana, colocando em relevo a formação do homem por meio da mescla de características locais e dos aspectos culturais trazidos de fora pela imigração europeia.', false),
  ('e2000000-0000-4000-b000-0000000004a7', 'e2000000-0000-4000-a000-000000000077', 1, 'José de Alencar, representante, sobretudo, do romance urbano, retrata a temática da urbanização das cidades brasileiras e das relações conflituosas entre as raças.', false),
  ('e2000000-0000-4000-b000-0000000004a8', 'e2000000-0000-4000-a000-000000000077', 2, 'O romance do Nordeste caracteriza-se pelo acentuado realismo no uso do vocabulário, pelo temário local, expressando a vida do homem em face da natureza agreste, e assume frequentemente o ponto de vista dos menos favorecidos.', false),
  ('e2000000-0000-4000-b000-0000000004a9', 'e2000000-0000-4000-a000-000000000077', 3, 'A literatura urbana brasileira, da qual um dos expoentes é Machado de Assis, põe em relevo a formação do homem brasileiro, o sincretismo religioso, as raízes africanas e indígenas que caracterizam o nosso povo.', true),
  ('e2000000-0000-4000-b000-0000000004aa', 'e2000000-0000-4000-a000-000000000077', 4, 'Érico Veríssimo, Rachel de Queiroz, Simões Lopes Neto e Jorge Amado são romancistas das décadas de 30 e 40 do século XX, cuja obra retrata a problemática do homem urbano em confronto com a modernização do país promovida pelo Estado Novo.', false),
  ('e2000000-0000-4000-b000-0000000004b0', 'e2000000-0000-4000-a000-000000000078', 0, 'Ao mesmo grupo social do falante/autor.', false),
  ('e2000000-0000-4000-b000-0000000004b1', 'e2000000-0000-4000-a000-000000000078', 1, 'A um grupo de brasileiros considerados como não índios.', true),
  ('e2000000-0000-4000-b000-0000000004b2', 'e2000000-0000-4000-a000-000000000078', 2, 'A um grupo étnico que representa a maioria europeia que vive no país.', false),
  ('e2000000-0000-4000-b000-0000000004b3', 'e2000000-0000-4000-a000-000000000078', 3, 'A um grupo formado por estrangeiros que falam português.', false),
  ('e2000000-0000-4000-b000-0000000004b4', 'e2000000-0000-4000-a000-000000000078', 4, 'A um grupo sociocultural formado por brasileiros naturalizados e imigrantes.', false),
  ('e2000000-0000-4000-b000-0000000004ba', 'e2000000-0000-4000-a000-000000000079', 0, 'Demonstrar a clareza e a complexidade da nossa língua materna.', false),
  ('e2000000-0000-4000-b000-0000000004bb', 'e2000000-0000-4000-a000-000000000079', 1, 'Situar os dois lados da interlocução em posições simétricas.', true),
  ('e2000000-0000-4000-b000-0000000004bc', 'e2000000-0000-4000-a000-000000000079', 2, 'Comprovar a importância da correção gramatical nos diálogos cotidianos.', false),
  ('e2000000-0000-4000-b000-0000000004bd', 'e2000000-0000-4000-a000-000000000079', 3, 'Mostrar como as línguas indígenas foram incorporadas à língua portuguesa.', false),
  ('e2000000-0000-4000-b000-0000000004be', 'e2000000-0000-4000-a000-000000000079', 4, 'Ressaltar a importância do código linguístico que adotamos como língua nacional.', false),
  ('e2000000-0000-4000-b000-0000000004c4', 'e2000000-0000-4000-a000-00000000007a', 0, 'Demonstra o quanto a literatura pode ser alienadora ao retratar, de modo positivo, as relações de opressão existentes na sociedade.', false),
  ('e2000000-0000-4000-b000-0000000004c5', 'e2000000-0000-4000-a000-00000000007a', 1, 'Revela a ação predatória do homem no mar, questionando a utilização dos recursos naturais pelo homem ocidental.', false),
  ('e2000000-0000-4000-b000-0000000004c6', 'e2000000-0000-4000-a000-00000000007a', 2, 'Defende que a força colonizadora e civilizatória do homem ocidental valorizou a organização das sociedades africanas e asiáticas, elevando-as ao modo de organização cultural e social da sociedade moderna.', false),
  ('e2000000-0000-4000-b000-0000000004c7', 'e2000000-0000-4000-a000-00000000007a', 3, 'Questiona o modo de organização das sociedades ocidentais capitalistas, que se desenvolveram fundamentadas nas relações de opressão em que os mais fortes exploram os mais fracos.', true),
  ('e2000000-0000-4000-b000-0000000004c8', 'e2000000-0000-4000-a000-00000000007a', 4, 'Evidencia a dinâmica social do trabalho coletivo em que os mais fortes colaboram com os mais fracos, de modo a guiá-los na realização de tarefas.', false),
  ('e2000000-0000-4000-b000-0000000004ce', 'e2000000-0000-4000-a000-00000000007b', 0, '“Dos dois contemplo  rigor e fixidez.  Passado e sentimento  me contemplam” (p. 91).', false),
  ('e2000000-0000-4000-b000-0000000004cf', 'e2000000-0000-4000-a000-00000000007b', 1, '“De sol e lua  De fogo e vento  Te enlaço” (p. 101).', false),
  ('e2000000-0000-4000-b000-0000000004d0', 'e2000000-0000-4000-a000-00000000007b', 2, '“Areia, vou sorvendo  A água do teu rio” (p. 93).', false),
  ('e2000000-0000-4000-b000-0000000004d1', 'e2000000-0000-4000-a000-00000000007b', 3, '“Ritualiza a matança  de quem só te deu vida.  E me deixa viver  nessa que morre” (p. 62).', true),
  ('e2000000-0000-4000-b000-0000000004d2', 'e2000000-0000-4000-a000-00000000007b', 4, '“O bisturi e o verso.  Dois instrumentos  entre as minhas mãos” (p. 95).', false),
  ('e2000000-0000-4000-b000-0000000004d8', 'e2000000-0000-4000-a000-00000000007c', 0, 'Implementar a fala, tendo em vista maior desenvoltura, naturalidade e segurança no uso da língua .', false),
  ('e2000000-0000-4000-b000-0000000004d9', 'e2000000-0000-4000-a000-00000000007c', 1, 'Conhecer gêneros mais formais da modalidade oral para a obtenção de clareza na comunicação oral e escrita.', false),
  ('e2000000-0000-4000-b000-0000000004da', 'e2000000-0000-4000-a000-00000000007c', 2, 'Dominar as diferentes variedades do registro oral da língua portuguesa para escrever com adequação, eficiência e correção.', false),
  ('e2000000-0000-4000-b000-0000000004db', 'e2000000-0000-4000-a000-00000000007c', 3, 'Empregar vocabulário adequado e usar regras da norma padrão da língua em se tratando da modalidade escrita.', true),
  ('e2000000-0000-4000-b000-0000000004dc', 'e2000000-0000-4000-a000-00000000007c', 4, 'Utilizar recursos mais expressivos e menos desgastados da variedade padrão da língua para se expressar com alguma segurança e sucesso.', false),
  ('e2000000-0000-4000-b000-0000000004e2', 'e2000000-0000-4000-a000-00000000007d', 0, 'A utilização do termo download indica restrição de leitura de informações a respeito de formas de combate à dengue.', false),
  ('e2000000-0000-4000-b000-0000000004e3', 'e2000000-0000-4000-a000-00000000007d', 1, 'A diversidade dos sistemas de comunicação empregados e mencionados reduz a possibilidade de acesso às informações a respeito do combate à dengue.', false),
  ('e2000000-0000-4000-b000-0000000004e4', 'e2000000-0000-4000-a000-00000000007d', 2, 'A utilização do material disponibilizado para download no site www.combatadengue.com.br restringe-se ao receptor da publicidade.', false),
  ('e2000000-0000-4000-b000-0000000004e5', 'e2000000-0000-4000-a000-00000000007d', 3, 'A necessidade de atingir públicos distintos se revela por meio da estratégia de disponibilização de informações empregada pelo emissor.', true),
  ('e2000000-0000-4000-b000-0000000004e6', 'e2000000-0000-4000-a000-00000000007d', 4, 'A utilização desse gênero textual compreende, no próprio texto, o detalhamento de informações a respeito de formas de combate à dengue.', false),
  ('e2000000-0000-4000-b000-0000000004ec', 'e2000000-0000-4000-a000-00000000007e', 0, 'Se dirige aos líderes comunitários para tomarem a iniciativa de combater a dengue.', false),
  ('e2000000-0000-4000-b000-0000000004ed', 'e2000000-0000-4000-a000-00000000007e', 1, 'Conclama toda a população a participar das estratégias de combate ao mosquito da dengue.', false),
  ('e2000000-0000-4000-b000-0000000004ee', 'e2000000-0000-4000-a000-00000000007e', 2, 'Se dirige aos prefeitos, conclamando-os a organizarem iniciativas de combate à dengue.', true),
  ('e2000000-0000-4000-b000-0000000004ef', 'e2000000-0000-4000-a000-00000000007e', 3, 'Tem como objetivo ensinar os procedimentos técnicos necessários para o combate ao mosquito da dengue.', false),
  ('e2000000-0000-4000-b000-0000000004f0', 'e2000000-0000-4000-a000-00000000007e', 4, 'Apela ao governo federal, para que dê apoio aos governos estaduais e municipais no combate ao mosquito da dengue.', false),
  ('e2000000-0000-4000-b000-0000000004f6', 'e2000000-0000-4000-a000-00000000007f', 0, '“A princípio com tranquilidade, e logo com obstinação, quis novamente dormir” (ℓ. 1-3).', false),
  ('e2000000-0000-4000-b000-0000000004f7', 'e2000000-0000-4000-a000-00000000007f', 1, '“Restava-me, portanto, menos de duas horas, pois o trem chegaria às cinco” (ℓ. 4-6).', false),
  ('e2000000-0000-4000-b000-0000000004f8', 'e2000000-0000-4000-a000-00000000007f', 2, '“Calcei os sapatos, sentei-me um instante à beira da cama” (ℓ. 12-13).', false),
  ('e2000000-0000-4000-b000-0000000004f9', 'e2000000-0000-4000-a000-00000000007f', 3, '“Partir, sem dizer nada, deixar quanto antes minhas cadeias de disciplina e amor” (ℓ. 7-9).', false),
  ('e2000000-0000-4000-b000-0000000004fa', 'e2000000-0000-4000-a000-00000000007f', 4, '“Deveria fugir ou falar com ela? Ora, algumas palavras...” (ℓ. 14-15).', true),
  ('e2000000-0000-4000-b000-000000000500', 'e2000000-0000-4000-a000-000000000080', 0, 'À influência dos aspectos socioculturais nas diferenças dos falares entre indivíduos, pois ambos consideram que pessoas de mesmo nível sociocultural falam de forma semelhante.', false),
  ('e2000000-0000-4000-b000-000000000501', 'e2000000-0000-4000-a000-000000000080', 1, 'À delimitação dialetal no Brasil assemelhar-se ao que ocorria na România Antiga, pois ambos consideram a variação linguística no Brasil como decorrente de aspectos geográficos.', false),
  ('e2000000-0000-4000-b000-000000000502', 'e2000000-0000-4000-a000-000000000080', 2, 'À variação sociocultural entre brasileiros de diferentes regiões, pois ambos consideram o fator sociocultural de bastante peso na constituição das variedades linguísticas no Brasil.', false),
  ('e2000000-0000-4000-b000-000000000503', 'e2000000-0000-4000-a000-000000000080', 3, 'À diversidade da língua portuguesa na România Antiga, que até hoje continua a existir, manifestandose nas variantes linguísticas do português atual no Brasil.', false),
  ('e2000000-0000-4000-b000-000000000504', 'e2000000-0000-4000-a000-000000000080', 4, 'À existência de delimitações dialetais geográficas pouco marcadas no Brasil, embora cada um enfatize aspectos diferentes da questão.', true),
  ('e2000000-0000-4000-b000-00000000050a', 'e2000000-0000-4000-a000-000000000081', 0, 'O Brasil redescobriu a cultura portuguesa no século XIX, o que o fez assimilar novos gêneros artísticos e culturais, assim como usos originais do idioma, conforme ilustra o caso do escritor Machado de Assis.', false),
  ('e2000000-0000-4000-b000-00000000050b', 'e2000000-0000-4000-a000-000000000081', 1, 'A Europa reconheceu a importância da língua portuguesa no mundo, a partir da projeção que poetas brasileiros ganharam naqueles países, a partir do século XX.', false),
  ('e2000000-0000-4000-b000-00000000050c', 'e2000000-0000-4000-a000-000000000081', 2, 'Ocorre, no início do século XXI, promovido pela solidificação da cultura nacional, maior reconhecimento do Brasil por ele mesmo, tanto nos aspectos positivos quanto nos negativos.', true),
  ('e2000000-0000-4000-b000-00000000050d', 'e2000000-0000-4000-a000-000000000081', 3, 'O Brasil continua sendo, como no século XIX, uma nação culturalmente mestiça, embora a expressão dominante seja aquela produzida no eixo Rio-São Paulo, em especial aquela ligada às telenovelas.', false),
  ('e2000000-0000-4000-b000-00000000050e', 'e2000000-0000-4000-a000-000000000081', 4, 'O novo estilo cultural brasileiro se caracteriza por uma união bastante significativa entre as diversas matrizes culturais advindas das várias regiões do país, como se pode comprovar na obra de Paulo Coelho.', false),
  ('e2000000-0000-4000-b000-000000000514', 'e2000000-0000-4000-a000-000000000082', 0, 'Atitude crítica do autor quanto à gramática que as nações a serviço de Portugal possuíam e, ao mesmo tempo, de benevolência quanto ao conhecimento que os povos tinham de suas línguas.', false),
  ('e2000000-0000-4000-b000-000000000515', 'e2000000-0000-4000-a000-000000000082', 1, 'Atitude preconceituosa relativa a vícios culturais das nações sob domínio português, dado o interesse dos falantes dessa línguas em copiar a língua do império, o que implicou a falência do idioma falado em Portugal.', false),
  ('e2000000-0000-4000-b000-000000000516', 'e2000000-0000-4000-a000-000000000082', 2, 'O desejo de conservar, em Portugal, as estruturas da variante padrão da língua grega — em oposição às consideradas bárbaras —, em vista da necessidade de preservação do padrão de correção dessa língua à época.', false),
  ('e2000000-0000-4000-b000-000000000517', 'e2000000-0000-4000-a000-000000000082', 3, 'Adesão à concepção de língua como entidade homogênea e invariável, e negação da ideia de que a língua portuguesa pertence a outros povos.', true),
  ('e2000000-0000-4000-b000-000000000518', 'e2000000-0000-4000-a000-000000000082', 4, 'Atitude crítica, que se estende à própria língua portuguesa, por se tratar de sistema que não disporia de elementos necessários para a plena inserção sociocultural de falantes não nativos do português.', false),
  ('e2000000-0000-4000-b000-00000000051e', 'e2000000-0000-4000-a000-000000000083', 0, 'É escrito em terceira pessoa, com narrador onisciente, apresentando a disputa entre um homem e uma mulher em linguagem sóbria, condizente com a seriedade da temática político-social do período da ditadura militar.', false),
  ('e2000000-0000-4000-b000-00000000051f', 'e2000000-0000-4000-a000-000000000083', 1, 'Articula o discurso dos interlocutores em torno de uma luta verbal, veiculada por meio de linguagem simples e objetiva, que busca traduzir a situação de exclusão social do narrador.', false),
  ('e2000000-0000-4000-b000-000000000520', 'e2000000-0000-4000-a000-000000000083', 2, 'Representa a literatura dos anos 70 do século XX e aborda, por meio de expressão clara e objetiva e de ponto de vista distanciado, os problemas da urbanização das grandes metrópoles brasileiras.', false),
  ('e2000000-0000-4000-b000-000000000521', 'e2000000-0000-4000-a000-000000000083', 3, 'Evidencia uma crítica à sociedade em que vivem os personagens, por meio de fluxo verbal contínuo de tom agressivo.', true),
  ('e2000000-0000-4000-b000-000000000522', 'e2000000-0000-4000-a000-000000000083', 4, 'Traduz, em linguagem subjetiva e intimista, a partir do ponto de vista interno, os dramas psicológicos da mulher moderna, às voltas com a questão da priorização do trabalho em detrimento da vida familiar e amorosa.', false),
  ('e2000000-0000-4000-b000-000000000528', 'e2000000-0000-4000-a000-000000000084', 0, 'Conformista, que procura defender as instituições nas quais repousava a autoridade do regime militar no Brasil, a saber: a Igreja, a família e o Estado.', false),
  ('e2000000-0000-4000-b000-000000000529', 'e2000000-0000-4000-a000-000000000084', 1, 'Pacifista, que procura defender os ideais libertários representativos da intelectualidade brasileira opositora à ditadura militar na década de 70 do século passado.', false),
  ('e2000000-0000-4000-b000-00000000052a', 'e2000000-0000-4000-a000-000000000084', 2, 'Desmistificador, escrito em um discurso ágil e contundente, que critica os grandes princípios humanitários supostamente defendidos por sua interlocutora.', true),
  ('e2000000-0000-4000-b000-00000000052b', 'e2000000-0000-4000-a000-000000000084', 3, 'Politizado, pois apela para o engajamento nas causas sociais e para a defesa dos direitos humanos como uma única forma de salvamento para a humanidade.', false),
  ('e2000000-0000-4000-b000-00000000052c', 'e2000000-0000-4000-a000-000000000084', 4, 'Contraditório, ao acusar a sua interlocutora de compactuar com o regime repressor da ditadura militar, por meio da defesa de instituições como a família e a Igreja.', false),
  ('e2000000-0000-4000-b000-000000000532', 'e2000000-0000-4000-a000-000000000085', 0, 'É uma religião pelo avesso, por isso outra religião; inverteram-se os sinais, a busca da felicidade eterna antes carregava em si a destruição do prazer, hoje implica o seu culto.', true),
  ('e2000000-0000-4000-b000-000000000533', 'e2000000-0000-4000-a000-000000000085', 1, 'Criou outro ópio do povo, levando as pessoas a buscarem cada vez mais grupos igualitários de integração social.', false),
  ('e2000000-0000-4000-b000-000000000534', 'e2000000-0000-4000-a000-000000000085', 2, 'É uma tradução dos valores das sociedades subdesenvolvidas, mas em países considerados do primeiro mundo ela não consegue se manifestar porque a população tem melhor educação e senso crítico.', false),
  ('e2000000-0000-4000-b000-000000000535', 'e2000000-0000-4000-a000-000000000085', 3, 'Tem como um de seus dogmas o narcisismo, significando o “amar o próximo como se ama a si mesmo”.', false),
  ('e2000000-0000-4000-b000-000000000536', 'e2000000-0000-4000-a000-000000000085', 4, 'Existe desde a Idade Média, entretanto esse acontecimento se intensificou a partir da Revolução Industrial no século XIX e se estendeu até os nossos dias.', false),
  ('e2000000-0000-4000-b000-00000000053c', 'e2000000-0000-4000-a000-000000000086', 0, 'Representa a fase heroica do modernismo, devido ao tom contestatório e à utilização de expressões e usos linguísticos típicos da oralidade.', false),
  ('e2000000-0000-4000-b000-00000000053d', 'e2000000-0000-4000-a000-000000000086', 1, 'Apresenta uma característica importante do gênero lírico, que é a apresentação objetiva de fatos e dados históricos.', false),
  ('e2000000-0000-4000-b000-00000000053e', 'e2000000-0000-4000-a000-000000000086', 2, 'Evidencia uma tensão histórica entre o “eu” e a sua comunidade, por intermédio de imagens que representam a forma como a sociedade e o mundo colaboram para a constituição do indivíduo.', true),
  ('e2000000-0000-4000-b000-00000000053f', 'e2000000-0000-4000-a000-000000000086', 3, 'Critica, por meio de um discurso irônico, a posição de inutilidade do poeta e da poesia em comparação com as prendas resgatadas de Itabira.', false),
  ('e2000000-0000-4000-b000-000000000540', 'e2000000-0000-4000-a000-000000000086', 4, 'Apresenta influências românticas, uma vez que trata da individualidade, da saudade da infância e do amor pela terra natal, por meio de recursos retóricos pomposos.', false),
  ('e2000000-0000-4000-b000-000000000546', 'e2000000-0000-4000-a000-000000000087', 0, '355 milhões.', true),
  ('e2000000-0000-4000-b000-000000000547', 'e2000000-0000-4000-a000-000000000087', 1, '400 milhões.', false),
  ('e2000000-0000-4000-b000-000000000548', 'e2000000-0000-4000-a000-000000000087', 2, '426 milhões.', false),
  ('e2000000-0000-4000-b000-000000000549', 'e2000000-0000-4000-a000-000000000087', 3, '441 milhões.', false),
  ('e2000000-0000-4000-b000-00000000054a', 'e2000000-0000-4000-a000-000000000087', 4, '477 milhões.', false),
  ('e2000000-0000-4000-b000-000000000550', 'e2000000-0000-4000-a000-000000000088', 0, '25 min.', false),
  ('e2000000-0000-4000-b000-000000000551', 'e2000000-0000-4000-a000-000000000088', 1, '15 min.', false),
  ('e2000000-0000-4000-b000-000000000552', 'e2000000-0000-4000-a000-000000000088', 2, '2,5 min.', false),
  ('e2000000-0000-4000-b000-000000000553', 'e2000000-0000-4000-a000-000000000088', 3, '1,5 min.', true),
  ('e2000000-0000-4000-b000-000000000554', 'e2000000-0000-4000-a000-000000000088', 4, '0,15 min.', false),
  ('e2000000-0000-4000-b000-00000000055a', 'e2000000-0000-4000-a000-000000000089', 0, '490 e 510 milhões.', false),
  ('e2000000-0000-4000-b000-00000000055b', 'e2000000-0000-4000-a000-000000000089', 1, '550 e 620 milhões.', false),
  ('e2000000-0000-4000-b000-00000000055c', 'e2000000-0000-4000-a000-000000000089', 2, '780 e 800 milhões.', false),
  ('e2000000-0000-4000-b000-00000000055d', 'e2000000-0000-4000-a000-000000000089', 3, '810 e 860 milhões.', false),
  ('e2000000-0000-4000-b000-00000000055e', 'e2000000-0000-4000-a000-000000000089', 4, '870 e 910 milhões.', true),
  ('e2000000-0000-4000-b000-000000000564', 'e2000000-0000-4000-a000-00000000008a', 0, '1/2.', false),
  ('e2000000-0000-4000-b000-000000000565', 'e2000000-0000-4000-a000-00000000008a', 1, '7/20.', false),
  ('e2000000-0000-4000-b000-000000000566', 'e2000000-0000-4000-a000-00000000008a', 2, '8/25.', true),
  ('e2000000-0000-4000-b000-000000000567', 'e2000000-0000-4000-a000-00000000008a', 3, '1/5.', false),
  ('e2000000-0000-4000-b000-000000000568', 'e2000000-0000-4000-a000-00000000008a', 4, '3/25.', false),
  ('e2000000-0000-4000-b000-00000000056e', 'e2000000-0000-4000-a000-00000000008b', 0, 'Duplicasse a medida do lado do quadrado.', false),
  ('e2000000-0000-4000-b000-00000000056f', 'e2000000-0000-4000-a000-00000000008b', 1, 'Triplicasse a medida do lado do quadrado.', false),
  ('e2000000-0000-4000-b000-000000000570', 'e2000000-0000-4000-a000-00000000008b', 2, 'Triplicasse a área do quadrado.', true),
  ('e2000000-0000-4000-b000-000000000571', 'e2000000-0000-4000-a000-00000000008b', 3, 'Ampliasse a medida do lado do quadrado em 4%.', false),
  ('e2000000-0000-4000-b000-000000000572', 'e2000000-0000-4000-a000-00000000008b', 4, 'Ampliasse a área do quadrado em 4%.', false),
  ('e2000000-0000-4000-b000-000000000578', 'e2000000-0000-4000-a000-00000000008c', 0, '27,75 milhões de litros.', false),
  ('e2000000-0000-4000-b000-000000000579', 'e2000000-0000-4000-a000-00000000008c', 1, '37,00 milhões de litros.', false),
  ('e2000000-0000-4000-b000-00000000057a', 'e2000000-0000-4000-a000-00000000008c', 2, '231,25 milhões de litros.', false),
  ('e2000000-0000-4000-b000-00000000057b', 'e2000000-0000-4000-a000-00000000008c', 3, '693,75 milhões de litros.', true),
  ('e2000000-0000-4000-b000-00000000057c', 'e2000000-0000-4000-a000-00000000008c', 4, '888,00 milhões de litros.', false),
  ('e2000000-0000-4000-b000-000000000582', 'e2000000-0000-4000-a000-00000000008d', 0, 'O consumo diário de cigarros e o número de casos de câncer de pulmão são grandezas inversamente proporcionais.', false),
  ('e2000000-0000-4000-b000-000000000583', 'e2000000-0000-4000-a000-00000000008d', 1, 'O consumo diário de cigarros e o número de casos de câncer de pulmão são grandezas que não se relacionam.', false),
  ('e2000000-0000-4000-b000-000000000584', 'e2000000-0000-4000-a000-00000000008d', 2, 'O consumo diário de cigarros e o número de casos de câncer de pulmão são grandezas diretamente proporcionais.', false),
  ('e2000000-0000-4000-b000-000000000585', 'e2000000-0000-4000-a000-00000000008d', 3, 'Uma pessoa não fumante certamente nunca será diagnosticada com câncer de pulmão.', false),
  ('e2000000-0000-4000-b000-000000000586', 'e2000000-0000-4000-a000-00000000008d', 4, 'O consumo diário de cigarros e o número de casos de câncer de pulmão são grandezas que estão relacionadas, mas sem proporcionalidade.', true),
  ('e2000000-0000-4000-b000-00000000058c', 'e2000000-0000-4000-a000-00000000008e', 0, '23.940.', false),
  ('e2000000-0000-4000-b000-00000000058d', 'e2000000-0000-4000-a000-00000000008e', 1, '32.228.', false),
  ('e2000000-0000-4000-b000-00000000058e', 'e2000000-0000-4000-a000-00000000008e', 2, '920.800.', false),
  ('e2000000-0000-4000-b000-00000000058f', 'e2000000-0000-4000-a000-00000000008e', 3, '23.940.800.', true),
  ('e2000000-0000-4000-b000-000000000590', 'e2000000-0000-4000-a000-00000000008e', 4, '32.228.000.', false),
  ('e2000000-0000-4000-b000-000000000596', 'e2000000-0000-4000-a000-00000000008f', 0, '24 fusas.', false),
  ('e2000000-0000-4000-b000-000000000597', 'e2000000-0000-4000-a000-00000000008f', 1, '3 semínimas.', false),
  ('e2000000-0000-4000-b000-000000000598', 'e2000000-0000-4000-a000-00000000008f', 2, '8 semínimas.', false),
  ('e2000000-0000-4000-b000-000000000599', 'e2000000-0000-4000-a000-00000000008f', 3, '24 colcheias e 12 semínimas.', true),
  ('e2000000-0000-4000-b000-00000000059a', 'e2000000-0000-4000-a000-00000000008f', 4, '16 semínimas e 8 semicolcheias.', false),
  ('e2000000-0000-4000-b000-0000000005a0', 'e2000000-0000-4000-a000-000000000090', 0, '2 × (0,2%)4.', false),
  ('e2000000-0000-4000-b000-0000000005a1', 'e2000000-0000-4000-a000-000000000090', 1, '4 × (0,2%)2.', false),
  ('e2000000-0000-4000-b000-0000000005a2', 'e2000000-0000-4000-a000-000000000090', 2, '6 × (0,2%)2  × (99,8%)2.', true),
  ('e2000000-0000-4000-b000-0000000005a3', 'e2000000-0000-4000-a000-000000000090', 3, '4 × (0,2%).', false),
  ('e2000000-0000-4000-b000-0000000005a4', 'e2000000-0000-4000-a000-000000000090', 4, '6 × (0,2%) × (99,8%).', false),
  ('e2000000-0000-4000-b000-0000000005aa', 'e2000000-0000-4000-a000-000000000091', 0, 'R$ 90,00.', true),
  ('e2000000-0000-4000-b000-0000000005ab', 'e2000000-0000-4000-a000-000000000091', 1, 'R$ 110,00.', false),
  ('e2000000-0000-4000-b000-0000000005ac', 'e2000000-0000-4000-a000-000000000091', 2, 'R$ 130,00.', false),
  ('e2000000-0000-4000-b000-0000000005ad', 'e2000000-0000-4000-a000-000000000091', 3, 'R$ 150,00.', false),
  ('e2000000-0000-4000-b000-0000000005ae', 'e2000000-0000-4000-a000-000000000091', 4, 'R$ 170,00.', false),
  ('e2000000-0000-4000-b000-0000000005b4', 'e2000000-0000-4000-a000-000000000092', 0, '1 após girá-la 90° no sentido horário.', false),
  ('e2000000-0000-4000-b000-0000000005b5', 'e2000000-0000-4000-a000-000000000092', 1, '1 após girá-la 180° no sentido anti-horário.', false),
  ('e2000000-0000-4000-b000-0000000005b6', 'e2000000-0000-4000-a000-000000000092', 2, '2 após girá-la 90° no sentido anti-horário.', true),
  ('e2000000-0000-4000-b000-0000000005b7', 'e2000000-0000-4000-a000-000000000092', 3, '2 após girá-la 180° no sentido horário.', false),
  ('e2000000-0000-4000-b000-0000000005b8', 'e2000000-0000-4000-a000-000000000092', 4, '2 após girá-la 270° no sentido anti-horário.', false),
  ('e2000000-0000-4000-b000-0000000005be', 'e2000000-0000-4000-a000-000000000093', 0, 'Inferior a 0,18.', false),
  ('e2000000-0000-4000-b000-0000000005bf', 'e2000000-0000-4000-a000-000000000093', 1, 'Superior a 0,18 e inferior a 0,50.', false),
  ('e2000000-0000-4000-b000-0000000005c0', 'e2000000-0000-4000-a000-000000000093', 2, 'Superior a 0,50 e inferior a 1,50.', false),
  ('e2000000-0000-4000-b000-0000000005c1', 'e2000000-0000-4000-a000-000000000093', 3, 'Superior a 1,50 e inferior a 2,80.', true),
  ('e2000000-0000-4000-b000-0000000005c2', 'e2000000-0000-4000-a000-000000000093', 4, 'Superior a 2,80.', false),
  ('e2000000-0000-4000-b000-0000000005c8', 'e2000000-0000-4000-a000-000000000094', 0, '![](conteudo/enem/2009/149-a-34488218.webp)', false),
  ('e2000000-0000-4000-b000-0000000005c9', 'e2000000-0000-4000-a000-000000000094', 1, '![](conteudo/enem/2009/149-b-a2900f94.webp)', false),
  ('e2000000-0000-4000-b000-0000000005ca', 'e2000000-0000-4000-a000-000000000094', 2, '![](conteudo/enem/2009/149-c-704c275a.webp)', false),
  ('e2000000-0000-4000-b000-0000000005cb', 'e2000000-0000-4000-a000-000000000094', 3, '![](conteudo/enem/2009/149-d-a0f7ce1f.webp)', false),
  ('e2000000-0000-4000-b000-0000000005cc', 'e2000000-0000-4000-a000-000000000094', 4, '![](conteudo/enem/2009/149-e-b83410e7.webp)', true),
  ('e2000000-0000-4000-b000-0000000005d2', 'e2000000-0000-4000-a000-000000000095', 0, 'Inferior a 300 milhões de dólares.', false),
  ('e2000000-0000-4000-b000-0000000005d3', 'e2000000-0000-4000-a000-000000000095', 1, 'Superior a 300 milhões de dólares, mas inferior a 400 milhões de dólares.', false),
  ('e2000000-0000-4000-b000-0000000005d4', 'e2000000-0000-4000-a000-000000000095', 2, 'Superior a 400 milhões de dólares, mas inferior a 500 milhões de dólares.', false),
  ('e2000000-0000-4000-b000-0000000005d5', 'e2000000-0000-4000-a000-000000000095', 3, 'Superior a 500 milhões de dólares, mas inferior a 600 milhões de dólares.', true),
  ('e2000000-0000-4000-b000-0000000005d6', 'e2000000-0000-4000-a000-000000000095', 4, 'Superior a 600 milhões de dólares.', false),
  ('e2000000-0000-4000-b000-0000000005dc', 'e2000000-0000-4000-a000-000000000096', 0, 'R$ 14,00.', false),
  ('e2000000-0000-4000-b000-0000000005dd', 'e2000000-0000-4000-a000-000000000096', 1, 'R$ 17,00.', false),
  ('e2000000-0000-4000-b000-0000000005de', 'e2000000-0000-4000-a000-000000000096', 2, 'R$ 22,00.', false),
  ('e2000000-0000-4000-b000-0000000005df', 'e2000000-0000-4000-a000-000000000096', 3, 'R$ 32,00.', true),
  ('e2000000-0000-4000-b000-0000000005e0', 'e2000000-0000-4000-a000-000000000096', 4, 'R$ 57,00.', false),
  ('e2000000-0000-4000-b000-0000000005e6', 'e2000000-0000-4000-a000-000000000097', 0, '1,5 x 102 vezes a capacidade do reservatório novo.', false),
  ('e2000000-0000-4000-b000-0000000005e7', 'e2000000-0000-4000-a000-000000000097', 1, '1,5 x 103 vezes a capacidade do reservatório novo.', false),
  ('e2000000-0000-4000-b000-0000000005e8', 'e2000000-0000-4000-a000-000000000097', 2, '1,5 x 106 vezes a capacidade do reservatório novo.', false),
  ('e2000000-0000-4000-b000-0000000005e9', 'e2000000-0000-4000-a000-000000000097', 3, '1,5 x 108 vezes a capacidade do reservatório novo.', false),
  ('e2000000-0000-4000-b000-0000000005ea', 'e2000000-0000-4000-a000-000000000097', 4, '1,5 x 109 vezes a capacidade do reservatório novo.', true),
  ('e2000000-0000-4000-b000-0000000005f0', 'e2000000-0000-4000-a000-000000000098', 0, 'Dois triângulos congruentes com lados correspondentes paralelos.', true),
  ('e2000000-0000-4000-b000-0000000005f1', 'e2000000-0000-4000-a000-000000000098', 1, 'Dois retângulos congruentes e com lados correspondentes paralelos.', false),
  ('e2000000-0000-4000-b000-0000000005f2', 'e2000000-0000-4000-a000-000000000098', 2, 'Dois trapézios congruentes com lados correspondentes perpendiculares.', false),
  ('e2000000-0000-4000-b000-0000000005f3', 'e2000000-0000-4000-a000-000000000098', 3, 'Dois paralelogramos congruentes com lados correspondentes paralelos.', false),
  ('e2000000-0000-4000-b000-0000000005f4', 'e2000000-0000-4000-a000-000000000098', 4, 'Dois quadriláteros congruentes com lados correspondentes perpendiculares.', false),
  ('e2000000-0000-4000-b000-0000000005fa', 'e2000000-0000-4000-a000-000000000099', 0, '1,16 metros.', false),
  ('e2000000-0000-4000-b000-0000000005fb', 'e2000000-0000-4000-a000-000000000099', 1, '3,0 metros.', false),
  ('e2000000-0000-4000-b000-0000000005fc', 'e2000000-0000-4000-a000-000000000099', 2, '5,4 metros.', false),
  ('e2000000-0000-4000-b000-0000000005fd', 'e2000000-0000-4000-a000-000000000099', 3, '5,6 metros.', true),
  ('e2000000-0000-4000-b000-0000000005fe', 'e2000000-0000-4000-a000-000000000099', 4, '7,04 metros.', false),
  ('e2000000-0000-4000-b000-000000000604', 'e2000000-0000-4000-a000-00000000009a', 0, 'V = 10.000 + 50x – x².', false),
  ('e2000000-0000-4000-b000-000000000605', 'e2000000-0000-4000-a000-00000000009a', 1, 'V = 10.000 + 50x + x².', false),
  ('e2000000-0000-4000-b000-000000000606', 'e2000000-0000-4000-a000-00000000009a', 2, 'V = 15.000 – 50x – x².', false),
  ('e2000000-0000-4000-b000-000000000607', 'e2000000-0000-4000-a000-00000000009a', 3, 'V = 15.000 + 50x – x².', true),
  ('e2000000-0000-4000-b000-000000000608', 'e2000000-0000-4000-a000-00000000009a', 4, 'V = 15.000 – 50x + x².', false),
  ('e2000000-0000-4000-b000-00000000060e', 'e2000000-0000-4000-a000-00000000009b', 0, '0 e 9.', true),
  ('e2000000-0000-4000-b000-00000000060f', 'e2000000-0000-4000-a000-00000000009b', 1, '1 e 4.', false),
  ('e2000000-0000-4000-b000-000000000610', 'e2000000-0000-4000-a000-00000000009b', 2, '1 e 7.', false),
  ('e2000000-0000-4000-b000-000000000611', 'e2000000-0000-4000-a000-00000000009b', 3, '9 e 1.', false),
  ('e2000000-0000-4000-b000-000000000612', 'e2000000-0000-4000-a000-00000000009b', 4, '0 e 1.', false),
  ('e2000000-0000-4000-b000-000000000618', 'e2000000-0000-4000-a000-00000000009c', 0, '4.', false),
  ('e2000000-0000-4000-b000-000000000619', 'e2000000-0000-4000-a000-00000000009c', 1, '8.', true),
  ('e2000000-0000-4000-b000-00000000061a', 'e2000000-0000-4000-a000-00000000009c', 2, '16.', false),
  ('e2000000-0000-4000-b000-00000000061b', 'e2000000-0000-4000-a000-00000000009c', 3, '24.', false),
  ('e2000000-0000-4000-b000-00000000061c', 'e2000000-0000-4000-a000-00000000009c', 4, '32.', false),
  ('e2000000-0000-4000-b000-000000000622', 'e2000000-0000-4000-a000-00000000009d', 0, '2,9 cm × 3,4 cm.', false),
  ('e2000000-0000-4000-b000-000000000623', 'e2000000-0000-4000-a000-00000000009d', 1, '3,9 cm × 4,4 cm.', false),
  ('e2000000-0000-4000-b000-000000000624', 'e2000000-0000-4000-a000-00000000009d', 2, '20 cm × 25 cm.', false),
  ('e2000000-0000-4000-b000-000000000625', 'e2000000-0000-4000-a000-00000000009d', 3, '21 cm × 26 cm.', true),
  ('e2000000-0000-4000-b000-000000000626', 'e2000000-0000-4000-a000-00000000009d', 4, '192 cm × 242 cm.', false),
  ('e2000000-0000-4000-b000-00000000062c', 'e2000000-0000-4000-a000-00000000009e', 0, 'Y = 30x.', false),
  ('e2000000-0000-4000-b000-00000000062d', 'e2000000-0000-4000-a000-00000000009e', 1, 'Y = 25x + 20,2.', false),
  ('e2000000-0000-4000-b000-00000000062e', 'e2000000-0000-4000-a000-00000000009e', 2, 'Y = 1,27x.', false),
  ('e2000000-0000-4000-b000-00000000062f', 'e2000000-0000-4000-a000-00000000009e', 3, 'Y = 0,7x.', false),
  ('e2000000-0000-4000-b000-000000000630', 'e2000000-0000-4000-a000-00000000009e', 4, 'Y = 0,07x + 6.', true),
  ('e2000000-0000-4000-b000-000000000636', 'e2000000-0000-4000-a000-00000000009f', 0, 'Manter sua proposta.', false),
  ('e2000000-0000-4000-b000-000000000637', 'e2000000-0000-4000-a000-00000000009f', 1, 'Oferecer 4 máquinas a mais.', false),
  ('e2000000-0000-4000-b000-000000000638', 'e2000000-0000-4000-a000-00000000009f', 2, 'Oferecer 6 trabalhadores a mais.', false),
  ('e2000000-0000-4000-b000-000000000639', 'e2000000-0000-4000-a000-00000000009f', 3, 'Aumentar a jornada de trabalho para 9 horas diárias.', true),
  ('e2000000-0000-4000-b000-00000000063a', 'e2000000-0000-4000-a000-00000000009f', 4, 'Reduzir em R$ 400,00 o valor do aluguel diário de uma máquina.', false),
  ('e2000000-0000-4000-b000-000000000640', 'e2000000-0000-4000-a000-0000000000a0', 0, 'Teria a pontuação igual a 6,5 se ele obtivesse nota 0.', false),
  ('e2000000-0000-4000-b000-000000000641', 'e2000000-0000-4000-a000-0000000000a0', 1, 'Seria a vencedora se ele obtivesse nota 10.', false),
  ('e2000000-0000-4000-b000-000000000642', 'e2000000-0000-4000-a000-0000000000a0', 2, 'Seria a segunda colocada se ele obtivesse nota 8.', false),
  ('e2000000-0000-4000-b000-000000000643', 'e2000000-0000-4000-a000-0000000000a0', 3, 'Permaneceria na terceira posição, independentemente da nota obtida pelo aluno.', true),
  ('e2000000-0000-4000-b000-000000000644', 'e2000000-0000-4000-a000-0000000000a0', 4, 'Empataria com a equipe Ômega na primeira colocação se o aluno obtivesse nota 9.', false),
  ('e2000000-0000-4000-b000-00000000064a', 'e2000000-0000-4000-a000-0000000000a1', 0, '920 kg.', true),
  ('e2000000-0000-4000-b000-00000000064b', 'e2000000-0000-4000-a000-0000000000a1', 1, '800 kg.', false),
  ('e2000000-0000-4000-b000-00000000064c', 'e2000000-0000-4000-a000-0000000000a1', 2, '720 kg.', false),
  ('e2000000-0000-4000-b000-00000000064d', 'e2000000-0000-4000-a000-0000000000a1', 3, '600 kg.', false),
  ('e2000000-0000-4000-b000-00000000064e', 'e2000000-0000-4000-a000-0000000000a1', 4, '570 kg.', false),
  ('e2000000-0000-4000-b000-000000000654', 'e2000000-0000-4000-a000-0000000000a2', 0, '617 kg.', false),
  ('e2000000-0000-4000-b000-000000000655', 'e2000000-0000-4000-a000-0000000000a2', 1, '668 kg.', true),
  ('e2000000-0000-4000-b000-000000000656', 'e2000000-0000-4000-a000-0000000000a2', 2, '680 kg.', false),
  ('e2000000-0000-4000-b000-000000000657', 'e2000000-0000-4000-a000-0000000000a2', 3, '689 kg.', false),
  ('e2000000-0000-4000-b000-000000000658', 'e2000000-0000-4000-a000-0000000000a2', 4, '717 kg.', false),
  ('e2000000-0000-4000-b000-00000000065e', 'e2000000-0000-4000-a000-0000000000a3', 0, '50%.', false),
  ('e2000000-0000-4000-b000-00000000065f', 'e2000000-0000-4000-a000-0000000000a3', 1, '43%', false),
  ('e2000000-0000-4000-b000-000000000660', 'e2000000-0000-4000-a000-0000000000a3', 2, '37%', false),
  ('e2000000-0000-4000-b000-000000000661', 'e2000000-0000-4000-a000-0000000000a3', 3, '33%', false),
  ('e2000000-0000-4000-b000-000000000662', 'e2000000-0000-4000-a000-0000000000a3', 4, '19%', true),
  ('e2000000-0000-4000-b000-000000000668', 'e2000000-0000-4000-a000-0000000000a4', 0, 'Uma combinação e um arranjo, respectivamente.', true),
  ('e2000000-0000-4000-b000-000000000669', 'e2000000-0000-4000-a000-0000000000a4', 1, 'Um arranjo e uma combinação, respectivamente.', false),
  ('e2000000-0000-4000-b000-00000000066a', 'e2000000-0000-4000-a000-0000000000a4', 2, 'Um arranjo e uma permutação, respectivamente.', false),
  ('e2000000-0000-4000-b000-00000000066b', 'e2000000-0000-4000-a000-0000000000a4', 3, 'Duas combinações.', false),
  ('e2000000-0000-4000-b000-00000000066c', 'e2000000-0000-4000-a000-0000000000a4', 4, 'Dois arranjos.', false),
  ('e2000000-0000-4000-b000-000000000672', 'e2000000-0000-4000-a000-0000000000a5', 0, 'Belo Horizonte, e em seguida embarcou para Curitiba.', false),
  ('e2000000-0000-4000-b000-000000000673', 'e2000000-0000-4000-a000-0000000000a5', 1, 'Belo Horizonte, e em seguida embarcou para Salvador.', true),
  ('e2000000-0000-4000-b000-000000000674', 'e2000000-0000-4000-a000-0000000000a5', 2, 'Boa Vista, e em seguida embarcou para Porto Velho.', false),
  ('e2000000-0000-4000-b000-000000000675', 'e2000000-0000-4000-a000-0000000000a5', 3, 'Goiânia, e em seguida embarcou para o Rio de Janeiro.', false),
  ('e2000000-0000-4000-b000-000000000676', 'e2000000-0000-4000-a000-0000000000a5', 4, 'Goiânia, e em seguida embarcou para Manaus.', false),
  ('e2000000-0000-4000-b000-00000000067c', 'e2000000-0000-4000-a000-0000000000a6', 0, '1.400', false),
  ('e2000000-0000-4000-b000-00000000067d', 'e2000000-0000-4000-a000-0000000000a6', 1, '14.000', false),
  ('e2000000-0000-4000-b000-00000000067e', 'e2000000-0000-4000-a000-0000000000a6', 2, '140.000', false),
  ('e2000000-0000-4000-b000-00000000067f', 'e2000000-0000-4000-a000-0000000000a6', 3, '1.400.000', false),
  ('e2000000-0000-4000-b000-000000000680', 'e2000000-0000-4000-a000-0000000000a6', 4, '14.000.000', true),
  ('e2000000-0000-4000-b000-000000000686', 'e2000000-0000-4000-a000-0000000000a7', 0, 'R$ 73,10.', false),
  ('e2000000-0000-4000-b000-000000000687', 'e2000000-0000-4000-a000-0000000000a7', 1, 'R$ 81,50.', false),
  ('e2000000-0000-4000-b000-000000000688', 'e2000000-0000-4000-a000-0000000000a7', 2, 'R$ 82,00.', false),
  ('e2000000-0000-4000-b000-000000000689', 'e2000000-0000-4000-a000-0000000000a7', 3, 'R$ 83,00.', true),
  ('e2000000-0000-4000-b000-00000000068a', 'e2000000-0000-4000-a000-0000000000a7', 4, 'R$ 85,30.', false),
  ('e2000000-0000-4000-b000-000000000690', 'e2000000-0000-4000-a000-0000000000a8', 0, '90 m³/s.', false),
  ('e2000000-0000-4000-b000-000000000691', 'e2000000-0000-4000-a000-0000000000a8', 1, '750 m³/s.', false),
  ('e2000000-0000-4000-b000-000000000692', 'e2000000-0000-4000-a000-0000000000a8', 2, '1.050 m³/s.', false),
  ('e2000000-0000-4000-b000-000000000693', 'e2000000-0000-4000-a000-0000000000a8', 3, '1.512 m³/s.', true),
  ('e2000000-0000-4000-b000-000000000694', 'e2000000-0000-4000-a000-0000000000a8', 4, '2.009 m³/s.', false),
  ('e2000000-0000-4000-b000-00000000069a', 'e2000000-0000-4000-a000-0000000000a9', 0, 'Um CD de 700 MB.', false),
  ('e2000000-0000-4000-b000-00000000069b', 'e2000000-0000-4000-a000-0000000000a9', 1, 'Um pendrive de 1 GB.', false),
  ('e2000000-0000-4000-b000-00000000069c', 'e2000000-0000-4000-a000-0000000000a9', 2, 'Um HD externo de 16 GB.', false),
  ('e2000000-0000-4000-b000-00000000069d', 'e2000000-0000-4000-a000-0000000000a9', 3, 'Um memory stick de 16 MB.', false),
  ('e2000000-0000-4000-b000-00000000069e', 'e2000000-0000-4000-a000-0000000000a9', 4, 'Um cartão de memória de 64 MB.', true),
  ('e2000000-0000-4000-b000-0000000006a4', 'e2000000-0000-4000-a000-0000000000aa', 0, '1 1/2 vez menor.', false),
  ('e2000000-0000-4000-b000-0000000006a5', 'e2000000-0000-4000-a000-0000000000aa', 1, '2 1/2 vezes menor.', false),
  ('e2000000-0000-4000-b000-0000000006a6', 'e2000000-0000-4000-a000-0000000000aa', 2, '4 vezes menor.', true),
  ('e2000000-0000-4000-b000-0000000006a7', 'e2000000-0000-4000-a000-0000000000aa', 3, '9 vezes menor.', false),
  ('e2000000-0000-4000-b000-0000000006a8', 'e2000000-0000-4000-a000-0000000000aa', 4, '14 vezes menor.', false),
  ('e2000000-0000-4000-b000-0000000006ae', 'e2000000-0000-4000-a000-0000000000ab', 0, '600 milhões de dólares.', false),
  ('e2000000-0000-4000-b000-0000000006af', 'e2000000-0000-4000-a000-0000000000ab', 1, '840 milhões de dólares.', false),
  ('e2000000-0000-4000-b000-0000000006b0', 'e2000000-0000-4000-a000-0000000000ab', 2, '1,34 bilhão de dólares.', true),
  ('e2000000-0000-4000-b000-0000000006b1', 'e2000000-0000-4000-a000-0000000000ab', 3, '1,44 bilhão de dólares.', false),
  ('e2000000-0000-4000-b000-0000000006b2', 'e2000000-0000-4000-a000-0000000000ab', 4, '2,00 bilhões de dólares.', false),
  ('e2000000-0000-4000-b000-0000000006b8', 'e2000000-0000-4000-a000-0000000000ac', 0, '156 cm³.', false),
  ('e2000000-0000-4000-b000-0000000006b9', 'e2000000-0000-4000-a000-0000000000ac', 1, '189 cm³.', true),
  ('e2000000-0000-4000-b000-0000000006ba', 'e2000000-0000-4000-a000-0000000000ac', 2, '192 cm³.', false),
  ('e2000000-0000-4000-b000-0000000006bb', 'e2000000-0000-4000-a000-0000000000ac', 3, '216 cm³.', false),
  ('e2000000-0000-4000-b000-0000000006bc', 'e2000000-0000-4000-a000-0000000000ac', 4, '540 cm³.', false),
  ('e2000000-0000-4000-b000-0000000006c2', 'e2000000-0000-4000-a000-0000000000ad', 0, 'R( 1 - sen d/r ).', false),
  ('e2000000-0000-4000-b000-0000000006c3', 'e2000000-0000-4000-a000-0000000000ad', 1, 'R( 1 - cos d/r ).', true),
  ('e2000000-0000-4000-b000-0000000006c4', 'e2000000-0000-4000-a000-0000000000ad', 2, 'R( 1 - tag d/r ).', false),
  ('e2000000-0000-4000-b000-0000000006c5', 'e2000000-0000-4000-a000-0000000000ad', 3, 'Rsen (r/d).', false),
  ('e2000000-0000-4000-b000-0000000006c6', 'e2000000-0000-4000-a000-0000000000ad', 4, 'Rcos (r/d).', false),
  ('e2000000-0000-4000-b000-0000000006cc', 'e2000000-0000-4000-a000-0000000000ae', 0, '10.000.', false),
  ('e2000000-0000-4000-b000-0000000006cd', 'e2000000-0000-4000-a000-0000000000ae', 1, '7.500.', false),
  ('e2000000-0000-4000-b000-0000000006ce', 'e2000000-0000-4000-a000-0000000000ae', 2, '5.000.', true),
  ('e2000000-0000-4000-b000-0000000006cf', 'e2000000-0000-4000-a000-0000000000ae', 3, '4.500.', false),
  ('e2000000-0000-4000-b000-0000000006d0', 'e2000000-0000-4000-a000-0000000000ae', 4, '3.000.', false),
  ('e2000000-0000-4000-b000-0000000006d6', 'e2000000-0000-4000-a000-0000000000af', 0, 'Não poderia fazer sequer a metade dos exercícios e dispor dos períodos de descanso especificados em seu programa.', false),
  ('e2000000-0000-4000-b000-0000000006d7', 'e2000000-0000-4000-a000-0000000000af', 1, 'Poderia ter feito todos os exercícios e cumprido rigorosamente os períodos de descanso especificados em seu programa.', true),
  ('e2000000-0000-4000-b000-0000000006d8', 'e2000000-0000-4000-a000-0000000000af', 2, 'Poderia ter feito todos os exercícios, mas teria de ter deixado de cumprir um dos períodos de descanso especificados em seu programa.', false),
  ('e2000000-0000-4000-b000-0000000006d9', 'e2000000-0000-4000-a000-0000000000af', 3, 'Conseguiria fazer todos os exercícios e cumpriria todos os períodos de descanso especificados em seu programa, e ainda se permitiria uma pausa de 7 min.', false),
  ('e2000000-0000-4000-b000-0000000006da', 'e2000000-0000-4000-a000-0000000000af', 4, 'Não poderia fazer todas as 3 séries dos exercícios especificados em seu programa; em alguma dessas séries deveria ter feito uma série a menos e não deveria ter cumprido um dos períodos de descanso.', false),
  ('e2000000-0000-4000-b000-0000000006e0', 'e2000000-0000-4000-a000-0000000000b0', 0, 'Uma pirâmide de base quadrada tem 4 arestas laterais e a interseção de um plano com a pirâmide intercepta suas arestas laterais. Assim, esses pontos formam um polígono de 4 lados.', false),
  ('e2000000-0000-4000-b000-0000000006e1', 'e2000000-0000-4000-a000-0000000000b0', 1, 'Uma pirâmide de base quadrada tem 4 faces triangulares e, quando um plano intercepta essa pirâmide, divide cada face em um triângulo e um trapézio. Logo, um dos polígonos tem 4 lados.', false),
  ('e2000000-0000-4000-b000-0000000006e2', 'e2000000-0000-4000-a000-0000000000b0', 2, 'Uma pirâmide de base quadrada tem 5 faces e a interseção de uma face com um plano é um segmento de reta. Assim, se o plano interceptar todas as faces, o polígono obtido nessa interseção tem 5 lados.', true),
  ('e2000000-0000-4000-b000-0000000006e3', 'e2000000-0000-4000-a000-0000000000b0', 3, 'O número de lados de qualquer polígono obtido como interseção de uma pirâmide com um plano é igual ao número de faces da pirâmide. Como a pirâmide tem 5 faces, o polígono tem 5 lados.', false),
  ('e2000000-0000-4000-b000-0000000006e4', 'e2000000-0000-4000-a000-0000000000b0', 4, 'O número de lados de qualquer polígono obtido interceptando-se uma pirâmide por um plano é igual ao número de arestas laterais da pirâmide. Como a pirâmide tem 4 arestas laterais, o polígono tem 4 lados.', false),
  ('e2000000-0000-4000-b000-0000000006ea', 'e2000000-0000-4000-a000-0000000000b1', 0, 'Renegociar suas dívidas com o banco.', false),
  ('e2000000-0000-4000-b000-0000000006eb', 'e2000000-0000-4000-a000-0000000000b1', 1, 'Pegar emprestado de José o dinheiro referente à quitação das duas dívidas.', false),
  ('e2000000-0000-4000-b000-0000000006ec', 'e2000000-0000-4000-a000-0000000000b1', 2, 'Recusar o empréstimo de José e pagar todas as parcelas pendentes nos devidos prazos.', false),
  ('e2000000-0000-4000-b000-0000000006ed', 'e2000000-0000-4000-a000-0000000000b1', 3, 'Pegar emprestado de José o dinheiro referente à quitação do cheque especial e pagar as parcelas do cartão de crédito.', false),
  ('e2000000-0000-4000-b000-0000000006ee', 'e2000000-0000-4000-a000-0000000000b1', 4, 'Pegar emprestado de José o dinheiro referente à quitação do cartão de crédito e pagar as parcelas do cheque especial.', true),
  ('e2000000-0000-4000-b000-0000000006f4', 'e2000000-0000-4000-a000-0000000000b2', 0, '6 metros por 5 metros, pois assim teria uma área de 30 m² .', false),
  ('e2000000-0000-4000-b000-0000000006f5', 'e2000000-0000-4000-a000-0000000000b2', 1, '15 metros por 20 metros, pois assim teria uma área de 300 m² .', true),
  ('e2000000-0000-4000-b000-0000000006f6', 'e2000000-0000-4000-a000-0000000000b2', 2, '50 metros por 60 metros, pois assim teria uma área de 3.000 m² .', false),
  ('e2000000-0000-4000-b000-0000000006f7', 'e2000000-0000-4000-a000-0000000000b2', 3, '91 metros por 30 metros, pois assim teria uma área de 2.730 m² .', false),
  ('e2000000-0000-4000-b000-0000000006f8', 'e2000000-0000-4000-a000-0000000000b2', 4, '110 metros por 30 metros, pois assim teria uma área de 3.300 m² .', false),
  ('e2000000-0000-4000-b000-0000000006fe', 'e2000000-0000-4000-a000-0000000000b3', 0, '3 doses.', false),
  ('e2000000-0000-4000-b000-0000000006ff', 'e2000000-0000-4000-a000-0000000000b3', 1, '4 doses.', true),
  ('e2000000-0000-4000-b000-000000000700', 'e2000000-0000-4000-a000-0000000000b3', 2, '6 doses.', false),
  ('e2000000-0000-4000-b000-000000000701', 'e2000000-0000-4000-a000-0000000000b3', 3, '8 doses.', false),
  ('e2000000-0000-4000-b000-000000000702', 'e2000000-0000-4000-a000-0000000000b3', 4, '10 doses.', false),
  ('e2000000-0000-4000-b000-000000000708', 'e2000000-0000-4000-a000-0000000000b4', 0, 'A concentração de terras nas mãos de poucos.', true),
  ('e2000000-0000-4000-b000-000000000709', 'e2000000-0000-4000-a000-0000000000b4', 1, 'A existência de poucas terras agricultáveis.', false),
  ('e2000000-0000-4000-b000-00000000070a', 'e2000000-0000-4000-a000-0000000000b4', 2, 'O domínio territorial dos minifúndios.', false),
  ('e2000000-0000-4000-b000-00000000070b', 'e2000000-0000-4000-a000-0000000000b4', 3, 'A primazia da agricultura familiar.', false),
  ('e2000000-0000-4000-b000-00000000070c', 'e2000000-0000-4000-a000-0000000000b4', 4, 'A debilidade dos plantations modernos.', false),
  ('e2000000-0000-4000-b000-000000000712', 'e2000000-0000-4000-a000-0000000000b5', 0, 'A redução do processo de concentração de terras.', false),
  ('e2000000-0000-4000-b000-000000000713', 'e2000000-0000-4000-a000-0000000000b5', 1, 'O aumento do aproveitamento de solos menos férteis.', true),
  ('e2000000-0000-4000-b000-000000000714', 'e2000000-0000-4000-a000-0000000000b5', 2, 'A ampliação do isolamento do espaço rural.', false),
  ('e2000000-0000-4000-b000-000000000715', 'e2000000-0000-4000-a000-0000000000b5', 3, 'A estagnação da fronteira agrícola do país.', false),
  ('e2000000-0000-4000-b000-000000000716', 'e2000000-0000-4000-a000-0000000000b5', 4, 'A diminuição do nível de emprego formal.', false),
  ('e2000000-0000-4000-b000-00000000071c', 'e2000000-0000-4000-a000-0000000000b6', 0, 'Dos impactos sociais da modernização da agricultura.', true),
  ('e2000000-0000-4000-b000-00000000071d', 'e2000000-0000-4000-a000-0000000000b6', 1, 'Da recomposição dos salários do trabalhador rural.', false),
  ('e2000000-0000-4000-b000-00000000071e', 'e2000000-0000-4000-a000-0000000000b6', 2, 'Da exigência de qualificação do trabalhador rural.', false),
  ('e2000000-0000-4000-b000-00000000071f', 'e2000000-0000-4000-a000-0000000000b6', 3, 'Da diminuição da importância da agricultura.', false),
  ('e2000000-0000-4000-b000-000000000720', 'e2000000-0000-4000-a000-0000000000b6', 4, 'Dos processos de desvalorização de áreas rurais.', false),
  ('e2000000-0000-4000-b000-000000000726', 'e2000000-0000-4000-a000-0000000000b7', 0, 'Causam problemas respiratórios, devido ao mau cheiro que provém da decomposição.', false),
  ('e2000000-0000-4000-b000-000000000727', 'e2000000-0000-4000-a000-0000000000b7', 1, 'São locais propícios à proliferação de vetores de doenças, além de contaminarem o solo e as águas.', true),
  ('e2000000-0000-4000-b000-000000000728', 'e2000000-0000-4000-a000-0000000000b7', 2, 'Provocam o fenômeno da chuva ácida, devido aos gases oriundos da decomposição da matéria orgânica.', false),
  ('e2000000-0000-4000-b000-000000000729', 'e2000000-0000-4000-a000-0000000000b7', 3, 'São instalados próximos ao centro das cidades, afetando toda a população que circula diariamente na área.', false),
  ('e2000000-0000-4000-b000-00000000072a', 'e2000000-0000-4000-a000-0000000000b7', 4, 'São responsáveis pelo desaparecimento das nascentes na região onde são instalados, o que leva à escassez de água.', false),
  ('e2000000-0000-4000-b000-000000000730', 'e2000000-0000-4000-a000-0000000000b8', 0, 'Plantio direto.', false),
  ('e2000000-0000-4000-b000-000000000731', 'e2000000-0000-4000-a000-0000000000b8', 1, 'Associação de culturas.', false),
  ('e2000000-0000-4000-b000-000000000732', 'e2000000-0000-4000-a000-0000000000b8', 2, 'Implantação de curvas de nível.', false),
  ('e2000000-0000-4000-b000-000000000733', 'e2000000-0000-4000-a000-0000000000b8', 3, 'Aração do solo, do topo ao vale.', true),
  ('e2000000-0000-4000-b000-000000000734', 'e2000000-0000-4000-a000-0000000000b8', 4, 'Terraceamento na propriedade.', false),
  ('e2000000-0000-4000-b000-00000000073a', 'e2000000-0000-4000-a000-0000000000b9', 0, 'A maior ocorrência de enchentes, já que os rios assoreados comportam menos água em seus leitos.', true),
  ('e2000000-0000-4000-b000-00000000073b', 'e2000000-0000-4000-a000-0000000000b9', 1, 'A contaminação da população pelos sedimentos trazidos pelo rio e carregados de matéria orgânica.', false),
  ('e2000000-0000-4000-b000-00000000073c', 'e2000000-0000-4000-a000-0000000000b9', 2, 'O desgaste do solo nas áreas urbanas, causado pela redução do escoamento superficial pluvial na encosta.', false),
  ('e2000000-0000-4000-b000-00000000073d', 'e2000000-0000-4000-a000-0000000000b9', 3, 'A maior facilidade de captação de água potável para o abastecimento público, já que é maior o efeito do escoamento sobre a infiltração.', false),
  ('e2000000-0000-4000-b000-00000000073e', 'e2000000-0000-4000-a000-0000000000b9', 4, 'O aumento da incidência de doenças como a amebíase na população urbana, em decorrência do escoamento de água poluída do topo das encostas.', false),
  ('e2000000-0000-4000-b000-000000000744', 'e2000000-0000-4000-a000-0000000000ba', 0, 'A relação que se estabelece entre as distâncias representadas no mapa e as distâncias reais da superfície cartografada.', false),
  ('e2000000-0000-4000-b000-000000000745', 'e2000000-0000-4000-a000-0000000000ba', 1, 'O registro de que os paralelos são verticais e o convergem para os polos, e os meridianos são círculos imaginários, horizontais e equidistantes.', false),
  ('e2000000-0000-4000-b000-000000000746', 'e2000000-0000-4000-a000-0000000000ba', 2, 'A informação de um conjunto de linhas imaginárias que permitem localizar um ponto ou acidente geográfico na superfície terrestre.', true),
  ('e2000000-0000-4000-b000-000000000747', 'e2000000-0000-4000-a000-0000000000ba', 3, 'A latitude como distância em graus entre um ponto e o Meridiano de Greenwich, e a longitude como a distância em graus entre um ponto e o Equador.', false),
  ('e2000000-0000-4000-b000-000000000748', 'e2000000-0000-4000-a000-0000000000ba', 4, 'A forma de projeção cartográfica, usado para navegação, onde os meridianos e paralelos distorcem a superfície do planeta.', false),
  ('e2000000-0000-4000-b000-00000000074e', 'e2000000-0000-4000-a000-0000000000bb', 0, 'Magmáticas, pois a ação de vulcões causou as maiores extinções desses animais já conhecidas ao longo da história terrestre.', false),
  ('e2000000-0000-4000-b000-00000000074f', 'e2000000-0000-4000-a000-0000000000bb', 1, 'Sedimentares, pois os restos podem ter sido soterrados e litificados com o restante dos sedimentos.', true),
  ('e2000000-0000-4000-b000-000000000750', 'e2000000-0000-4000-a000-0000000000bb', 2, 'Magmáticas, pois são as rochas mais facilmente erodidas, possibilitando a formação de tocas que foram posteriormente lacradas.', false),
  ('e2000000-0000-4000-b000-000000000751', 'e2000000-0000-4000-a000-0000000000bb', 3, 'Sedimentares, já que cada uma das camadas encontradas na figura simboliza um evento de erosão dessa área representada.', false),
  ('e2000000-0000-4000-b000-000000000752', 'e2000000-0000-4000-a000-0000000000bb', 4, 'Metamórficas, pois os animais representados precisavam estar perto de locais quentes.', false),
  ('e2000000-0000-4000-b000-000000000758', 'e2000000-0000-4000-a000-0000000000bc', 0, 'Apresentam características econômicas promissoras para as próximas décadas.', true),
  ('e2000000-0000-4000-b000-000000000759', 'e2000000-0000-4000-a000-0000000000bc', 1, 'Possuem base tecnológica mais elevada.', false),
  ('e2000000-0000-4000-b000-00000000075a', 'e2000000-0000-4000-a000-0000000000bc', 2, 'Apresentam índices de igualdade social e econômica mais acentuados.', false),
  ('e2000000-0000-4000-b000-00000000075b', 'e2000000-0000-4000-a000-0000000000bc', 3, 'Apresentam diversidade ambiental suficiente para impulsionar a economia global.', false),
  ('e2000000-0000-4000-b000-00000000075c', 'e2000000-0000-4000-a000-0000000000bc', 4, 'Possuem similaridades culturais capazes de alavancar a economia mundial.', false),
  ('e2000000-0000-4000-b000-000000000762', 'e2000000-0000-4000-a000-0000000000bd', 0, 'A facilidade em se estabelecerem relações lucrativas transformava as cidades em espaços privilegiados para a livre iniciativa, característica da nova sociedade capitalista.', false),
  ('e2000000-0000-4000-b000-000000000763', 'e2000000-0000-4000-a000-0000000000bd', 1, 'O desenvolvimento de métodos de planejamento urbano aumentava a eficiência do trabalho industrial.', false),
  ('e2000000-0000-4000-b000-000000000764', 'e2000000-0000-4000-a000-0000000000bd', 2, 'A construção de núcleos urbanos integrados por meios de transporte facilitava o deslocamento dos trabalhadores das periferias até as fábricas.', false),
  ('e2000000-0000-4000-b000-000000000765', 'e2000000-0000-4000-a000-0000000000bd', 3, 'A grandiosidade dos prédios onde se localizavam as fábricas revelava os avanços da engenharia e da arquitetura do período, transformando as cidades em locais de experimentação estética e artística.', false),
  ('e2000000-0000-4000-b000-000000000766', 'e2000000-0000-4000-a000-0000000000bd', 4, 'O alto nível de exploração dos trabalhadores industriais ocasionava o surgimento de aglomerados urbanos marcados por péssimas condições de moradia, saúde e higiene.', true),
  ('e2000000-0000-4000-b000-00000000076c', 'e2000000-0000-4000-a000-0000000000be', 0, 'Trabalhava conforme o ritmo das máquinas e de maneira padronizada.', false),
  ('e2000000-0000-4000-b000-00000000076d', 'e2000000-0000-4000-a000-0000000000be', 1, 'Trabalhava geralmente sem o uso de máquinas e de modo diferente do modelo de produção em série.', true),
  ('e2000000-0000-4000-b000-00000000076e', 'e2000000-0000-4000-a000-0000000000be', 2, 'Empregavam fontes de energia abundantes para o funcionamento das máquinas.', false),
  ('e2000000-0000-4000-b000-00000000076f', 'e2000000-0000-4000-a000-0000000000be', 3, 'Realizava parte da produção por cada operário, com uso de máquinas e trabalho assalariado.', false),
  ('e2000000-0000-4000-b000-000000000770', 'e2000000-0000-4000-a000-0000000000be', 4, 'Faziam interferência do processo produtivo por técnicos e gerentes com vistas a determinar o ritmo de produção.', false),
  ('e2000000-0000-4000-b000-000000000776', 'e2000000-0000-4000-a000-0000000000bf', 0, 'A absorção dos trabalhadores rurais como trabalhadores da serraria, resultando em um processo de êxodo rural.', false),
  ('e2000000-0000-4000-b000-000000000777', 'e2000000-0000-4000-a000-0000000000bf', 1, 'O desemprego gerado pela introdução das novas máquinas, que diminuíam a necessidade de mão de obra.', false),
  ('e2000000-0000-4000-b000-000000000778', 'e2000000-0000-4000-a000-0000000000bf', 2, 'A desorganização da economia tradicional, que sustentava os posseiros e os trabalhadores rurais da região.', true),
  ('e2000000-0000-4000-b000-000000000779', 'e2000000-0000-4000-a000-0000000000bf', 3, 'A diminuição do poder dos grandes coronéis da região, que passavam disputar o poder político com os novos agentes.', false),
  ('e2000000-0000-4000-b000-00000000077a', 'e2000000-0000-4000-a000-0000000000bf', 4, 'O crescimento dos conflitos entre os operários empregados nesses empreendimentos e os seus proprietários, ligados ao capital internacional.', false),
  ('e2000000-0000-4000-b000-000000000780', 'e2000000-0000-4000-a000-0000000000c0', 0, 'Pela formalização do Tratado de Petrópolis, que indenizava o Brasil pela sua anexação.', false),
  ('e2000000-0000-4000-b000-000000000781', 'e2000000-0000-4000-a000-0000000000c0', 1, 'Por meio do auxílio do Bolivian Syndicate aos emigrantes brasileiros na região.', false),
  ('e2000000-0000-4000-b000-000000000782', 'e2000000-0000-4000-a000-0000000000c0', 2, 'Devido à crescente emigração de brasileiros que exploravam os seringais.', true),
  ('e2000000-0000-4000-b000-000000000783', 'e2000000-0000-4000-a000-0000000000c0', 3, 'Em função da presença de inúmeros imigrantes estrangeiros na região.', false),
  ('e2000000-0000-4000-b000-000000000784', 'e2000000-0000-4000-a000-0000000000c0', 4, 'Pela indenização que os emigrantes brasileiros pagaram à Bolívia.', false),
  ('e2000000-0000-4000-b000-00000000078a', 'e2000000-0000-4000-a000-0000000000c1', 0, 'Produção de energia para as principais áreas industriais do país.', false),
  ('e2000000-0000-4000-b000-00000000078b', 'e2000000-0000-4000-a000-0000000000c1', 1, 'Produção sustentável de recursos minerais não metálicos.', false),
  ('e2000000-0000-4000-b000-00000000078c', 'e2000000-0000-4000-a000-0000000000c1', 2, 'Capacidade de produção de minerais metálicos.', true),
  ('e2000000-0000-4000-b000-00000000078d', 'e2000000-0000-4000-a000-0000000000c1', 3, 'Logística de importação de matérias-primas industriais.', false),
  ('e2000000-0000-4000-b000-00000000078e', 'e2000000-0000-4000-a000-0000000000c1', 4, 'Produção de recursos minerais energéticos.', false),
  ('e2000000-0000-4000-b000-000000000794', 'e2000000-0000-4000-a000-0000000000c2', 0, 'Ao potencial hidrelétrico dos rios no norte e nordeste quando comparados às bacias hidrográficas das regiões Sul, Sudeste e Centro-Oeste do país.', false),
  ('e2000000-0000-4000-b000-000000000795', 'e2000000-0000-4000-a000-0000000000c2', 1, 'À necessidade de equilibrar e compatibilizar o investimento no crescimento do país com os esforços para a conservação ambiental.', true),
  ('e2000000-0000-4000-b000-000000000796', 'e2000000-0000-4000-a000-0000000000c2', 2, 'À grande quantidade de recursos disponíveis para as obras e à escassez dos recursos direcionados para o pagamento pela desapropriação das terras.', false),
  ('e2000000-0000-4000-b000-000000000797', 'e2000000-0000-4000-a000-0000000000c2', 3, 'Ao direito histórico dos indígenas à posse dessas terras e à ausência de reconhecimento desse direito por parte das empreiteiras.', false),
  ('e2000000-0000-4000-b000-000000000798', 'e2000000-0000-4000-a000-0000000000c2', 4, 'Ao aproveitamento da mão de obra especializada disponível na região Norte e o interesse das construtoras na vinda de profissionais do Sudeste do país.', false),
  ('e2000000-0000-4000-b000-00000000079e', 'e2000000-0000-4000-a000-0000000000c3', 0, 'Ditadura teocrática, que igualava a todos.', false),
  ('e2000000-0000-4000-b000-00000000079f', 'e2000000-0000-4000-a000-0000000000c3', 1, 'Existência da igualdade social e da coletivização da terra.', false),
  ('e2000000-0000-4000-b000-0000000007a0', 'e2000000-0000-4000-a000-0000000000c3', 2, 'Estrutura social desigual compensada pela coletivização de todos os bens.', false),
  ('e2000000-0000-4000-b000-0000000007a1', 'e2000000-0000-4000-a000-0000000000c3', 3, 'Existência de mobilidade social, o que levou à composição da elite pelo mérito.', false),
  ('e2000000-0000-4000-b000-0000000007a2', 'e2000000-0000-4000-a000-0000000000c3', 4, 'Impossibilidade de se mudar de extrato social e a existência de uma aristocracia hereditária.', true),
  ('e2000000-0000-4000-b000-0000000007a8', 'e2000000-0000-4000-a000-0000000000c4', 0, 'A expansão territorial do agronegócio, em especial nas regiões Centro-Oeste e Norte, e as leis de proteção indígena e ambiental.', true),
  ('e2000000-0000-4000-b000-0000000007a9', 'e2000000-0000-4000-a000-0000000000c4', 1, 'Os grileiros articuladores do agronegócio e os povos indígenas pouco organizados no Cerrado.', false),
  ('e2000000-0000-4000-b000-0000000007aa', 'e2000000-0000-4000-a000-0000000000c4', 2, 'As leis mais brandas sobre o uso tradicional do meio ambiente e as severas leis sobre o uso capitalista do meio ambiente.', false),
  ('e2000000-0000-4000-b000-0000000007ab', 'e2000000-0000-4000-a000-0000000000c4', 3, 'Os povos indígenas do Cerrado e os polos econômicos representados pelas elites industriais paulistas.', false),
  ('e2000000-0000-4000-b000-0000000007ac', 'e2000000-0000-4000-a000-0000000000c4', 4, 'O campo e a cidade no Cerrado, que faz com que as terras indígenas dali sejam alvo de invasões urbanas.', false),
  ('e2000000-0000-4000-b000-0000000007b2', 'e2000000-0000-4000-a000-0000000000c5', 0, 'A organização em aldeias politicamente independentes, dirigidas por um chefe, eleito pelos indivíduos mais velhos da tribo.', false),
  ('e2000000-0000-4000-b000-0000000007b3', 'e2000000-0000-4000-a000-0000000000c5', 1, 'A ritualização da guerra entre as tribos e o caráter semissedentário de sua organização social.', true),
  ('e2000000-0000-4000-b000-0000000007b4', 'e2000000-0000-4000-a000-0000000000c5', 2, 'A conquista de terras mediante operações militares, o que permitiu seu domínio sobre vasto território.', false),
  ('e2000000-0000-4000-b000-0000000007b5', 'e2000000-0000-4000-a000-0000000000c5', 3, 'O caráter pastoril de sua economia, que prescindia da agricultura para investir na criação de animais.', false),
  ('e2000000-0000-4000-b000-0000000007b6', 'e2000000-0000-4000-a000-0000000000c5', 4, 'O desprezo pelos rituais antropofágicos praticados em outras sociedades indígenas.', false),
  ('e2000000-0000-4000-b000-0000000007bc', 'e2000000-0000-4000-a000-0000000000c6', 0, 'Atividade comercial exercida pelos homens que trabalhavam nas minas.', false),
  ('e2000000-0000-4000-b000-0000000007bd', 'e2000000-0000-4000-a000-0000000000c6', 1, 'Atividade culinária exercida pelos moradores cozinheiros que viviam nas regiões das minas.', false),
  ('e2000000-0000-4000-b000-0000000007be', 'e2000000-0000-4000-a000-0000000000c6', 2, 'Atividade mercantil exercida pelos homens que transportavam gado e mercadoria.', true),
  ('e2000000-0000-4000-b000-0000000007bf', 'e2000000-0000-4000-a000-0000000000c6', 3, 'Atividade agropecuária exercida pelos tropeiros que necessitavam dispor de alimentos.', false),
  ('e2000000-0000-4000-b000-0000000007c0', 'e2000000-0000-4000-a000-0000000000c6', 4, 'Atividade mineradora exercida pelos tropeiros no auge da exploração do ouro.', false),
  ('e2000000-0000-4000-b000-0000000007c6', 'e2000000-0000-4000-a000-0000000000c7', 0, 'Os agentes históricos de uma determinada sociedade deveriam ser aqueles que realizaram feitos heroicos ou grandiosos e, por isso, ficaram na memória.', false),
  ('e2000000-0000-4000-b000-0000000007c7', 'e2000000-0000-4000-a000-0000000000c7', 1, 'A História deveria se preocupar em memorizar os nomes de reis ou dos governantes das civilizações que se desenvolveram ao longo do tempo.', false),
  ('e2000000-0000-4000-b000-0000000007c8', 'e2000000-0000-4000-a000-0000000000c7', 2, 'Grandes monumentos históricos foram construídos por trabalhadores, mas sua memória está vinculada aos governantes das sociedades que os construíram.', true),
  ('e2000000-0000-4000-b000-0000000007c9', 'e2000000-0000-4000-a000-0000000000c7', 3, 'Os trabalhadores consideram que a História é uma ciência de difícil compreensão, pois trata de sociedades antigas e distantes no tempo.', false),
  ('e2000000-0000-4000-b000-0000000007ca', 'e2000000-0000-4000-a000-0000000000c7', 4, 'As civilizações citadas no texto, embora muito importantes, permanecem sem terem sido alvos de pesquisas históricas.', false),
  ('e2000000-0000-4000-b000-0000000007d0', 'e2000000-0000-4000-a000-0000000000c8', 0, 'Objetos arqueológicos e paisagísticos.', true),
  ('e2000000-0000-4000-b000-0000000007d1', 'e2000000-0000-4000-a000-0000000000c8', 1, 'Acervos museológicos e bibliográficos.', false),
  ('e2000000-0000-4000-b000-0000000007d2', 'e2000000-0000-4000-a000-0000000000c8', 2, 'Núcleos urbanos e etnográficos', false),
  ('e2000000-0000-4000-b000-0000000007d3', 'e2000000-0000-4000-a000-0000000000c8', 3, 'Práticas e representações de uma sociedade.', false),
  ('e2000000-0000-4000-b000-0000000007d4', 'e2000000-0000-4000-a000-0000000000c8', 4, 'Expressões e técnicas de uma sociedade extinta.', false),
  ('e2000000-0000-4000-b000-0000000007da', 'e2000000-0000-4000-a000-0000000000c9', 0, 'A carência de fontes para a pesquisa sobre os reais motivos dessa Guerra.', false),
  ('e2000000-0000-4000-b000-0000000007db', 'e2000000-0000-4000-a000-0000000000c9', 1, 'O caráter positivista das diferentes versões sobre essa Guerra.', false),
  ('e2000000-0000-4000-b000-0000000007dc', 'e2000000-0000-4000-a000-0000000000c9', 2, 'O resultado das intervenções britânicas nos cenários de batalha.', false),
  ('e2000000-0000-4000-b000-0000000007dd', 'e2000000-0000-4000-a000-0000000000c9', 3, 'A dificuldade de elaborar explicações convincentes sobre os motivos dessa Guerra.', true),
  ('e2000000-0000-4000-b000-0000000007de', 'e2000000-0000-4000-a000-0000000000c9', 4, 'O nível de crueldade das ações do exército brasileiro e argentino durante o conflito.', false),
  ('e2000000-0000-4000-b000-0000000007e4', 'e2000000-0000-4000-a000-0000000000ca', 0, 'Impossibilidade de ascensão social do negro forro em uma sociedade escravocrata, mesmo sendo alfabetizado.', false),
  ('e2000000-0000-4000-b000-0000000007e5', 'e2000000-0000-4000-a000-0000000000ca', 1, 'Extrema dificuldade de projeção dos intelectuais negros nesse contexto e a utilização do Direito como canal de luta pela liberdade.', true),
  ('e2000000-0000-4000-b000-0000000007e6', 'e2000000-0000-4000-a000-0000000000ca', 2, 'Rigidez de uma sociedade, assentada na escravidão, que inviabilizava os mecanismos de ascensão social.', false),
  ('e2000000-0000-4000-b000-0000000007e7', 'e2000000-0000-4000-a000-0000000000ca', 3, 'Possibilidade de ascensão social, viabilizada pelo apoio das elites dominantes, a um mestiço filho de pai português.', false),
  ('e2000000-0000-4000-b000-0000000007e8', 'e2000000-0000-4000-a000-0000000000ca', 4, 'Troca de favores entre um representante negro e a elite agrária escravista que outorgara o direito advocatício ao mesmo.', false),
  ('e2000000-0000-4000-b000-0000000007ee', 'e2000000-0000-4000-a000-0000000000cb', 0, 'A ocupação de Portugal pelas tropas francesas e o fechamento das manufaturas portuguesas.', false),
  ('e2000000-0000-4000-b000-0000000007ef', 'e2000000-0000-4000-a000-0000000000cb', 1, 'A dependência portuguesa da Inglaterra e o predomínio industrial inglês sobre suas redes de comércio.', true),
  ('e2000000-0000-4000-b000-0000000007f0', 'e2000000-0000-4000-a000-0000000000cb', 2, 'A desconfiança da burguesia industrial colonial diante da chegada da família real portuguesa.', false),
  ('e2000000-0000-4000-b000-0000000007f1', 'e2000000-0000-4000-a000-0000000000cb', 3, 'O confronto entre a França e a Inglaterra e a posição dúbia assumida por Portugal no comércio internacional.', false),
  ('e2000000-0000-4000-b000-0000000007f2', 'e2000000-0000-4000-a000-0000000000cb', 4, 'O atraso industrial da colônia provocado pela perda de mercados para as indústrias portuguesas.', false),
  ('e2000000-0000-4000-b000-0000000007f8', 'e2000000-0000-4000-a000-0000000000cc', 0, 'A decadência do império britânico, em razão do contrabando de produtos ingleses através dos portos brasileiros,', false),
  ('e2000000-0000-4000-b000-0000000007f9', 'e2000000-0000-4000-a000-0000000000cc', 1, 'O fim do comércio de escravos no Brasil, porque a Inglaterra decretara, em 1806, a proibição do tráfico de escravos em seus domínios.', false),
  ('e2000000-0000-4000-b000-0000000007fa', 'e2000000-0000-4000-a000-0000000000cc', 2, 'A conquista da região do rio da Prata em represália à aliança entre a Espanha e a França de Napoleão.', true),
  ('e2000000-0000-4000-b000-0000000007fb', 'e2000000-0000-4000-a000-0000000000cc', 3, 'A abertura de estradas, que permitiu o rompimento do isolamento que vigorava entre as províncias do país, o que dificultava a comunicação antes de 1808.', false),
  ('e2000000-0000-4000-b000-0000000007fc', 'e2000000-0000-4000-a000-0000000000cc', 4, 'O grande desenvolvimento econômico de Portugal após a vinda de D. João VI para o Brasil, uma vez que cessaram as despesas de manutenção do rei e de sua família.', false),
  ('e2000000-0000-4000-b000-000000000802', 'e2000000-0000-4000-a000-0000000000cd', 0, 'Ao caráter nacionalista e republicano da Inconfidência, evidenciado nas ideias e na atuação de Tiradentes.', false),
  ('e2000000-0000-4000-b000-000000000803', 'e2000000-0000-4000-a000-0000000000cd', 1, 'À identificação da Conjuração Mineira como o movimento precursor do positivismo brasileiro.', false),
  ('e2000000-0000-4000-b000-000000000804', 'e2000000-0000-4000-a000-0000000000cd', 2, 'Ao fato de a proclamação da República ter sido um movimento de poucas raízes populares, que precisava de legitimação.', true),
  ('e2000000-0000-4000-b000-000000000805', 'e2000000-0000-4000-a000-0000000000cd', 3, 'À semelhança física entre Tiradentes e Jesus, que proporcionaria, a um povo católico como o brasileiro, uma fácil identificação.', false),
  ('e2000000-0000-4000-b000-000000000806', 'e2000000-0000-4000-a000-0000000000cd', 4, 'Ao fato de Frei Caneca e Bento Gonçalves terem liderado movimentos separatistas no Nordeste e no Sul do país.', false),
  ('e2000000-0000-4000-b000-00000000080c', 'e2000000-0000-4000-a000-0000000000ce', 0, 'A manutenção de parte da legislação do Império com vistas ao controle da criminalidade urbana.', false),
  ('e2000000-0000-4000-b000-00000000080d', 'e2000000-0000-4000-a000-0000000000ce', 1, 'A defesa do retorno do cativeiro e escravidão pelos primeiros governos do período republicano.', false),
  ('e2000000-0000-4000-b000-00000000080e', 'e2000000-0000-4000-a000-0000000000ce', 2, 'O caráter disciplinador de uma sociedade industrializada, desejosa de um equilíbrio entre progresso e civilização.', false),
  ('e2000000-0000-4000-b000-00000000080f', 'e2000000-0000-4000-a000-0000000000ce', 3, 'A criminalização de práticas culturais e a persistência de valores que vinculavam certos grupos ao passado de escravidão.', true),
  ('e2000000-0000-4000-b000-000000000810', 'e2000000-0000-4000-a000-0000000000ce', 4, 'O poder do regime escravista, que mantinha os negros como categoria social inferior, discriminada e segregada.', false),
  ('e2000000-0000-4000-b000-000000000816', 'e2000000-0000-4000-a000-0000000000cf', 0, 'À alta burguesia, que desejava participar do poder legislativo francês como força política dominante.', false),
  ('e2000000-0000-4000-b000-000000000817', 'e2000000-0000-4000-a000-0000000000cf', 1, 'Ao clero francês, que desejava justiça social e era ligado à alta burguesia.', false),
  ('e2000000-0000-4000-b000-000000000818', 'e2000000-0000-4000-a000-0000000000cf', 2, 'A militares oriundos da pequena e média burguesia, que derrotaram as potências rivais e queriam reorganizar a França internamente.', false),
  ('e2000000-0000-4000-b000-000000000819', 'e2000000-0000-4000-a000-0000000000cf', 3, 'À nobreza esclarecida, que, em função do seu contato, com os intelectuais iluministas, desejava extinguir o absolutismo francês.', false),
  ('e2000000-0000-4000-b000-00000000081a', 'e2000000-0000-4000-a000-0000000000cf', 4, 'Aos representantes da pequena e média burguesia e das camadas populares, que desejavam justiça social e direitos políticos.', true),
  ('e2000000-0000-4000-b000-000000000820', 'e2000000-0000-4000-a000-0000000000d0', 0, 'A distribuição equilibrada do poder.', false),
  ('e2000000-0000-4000-b000-000000000821', 'e2000000-0000-4000-a000-0000000000d0', 1, 'O impedimento da participação popular.', false),
  ('e2000000-0000-4000-b000-000000000822', 'e2000000-0000-4000-a000-0000000000d0', 2, 'O controle das decisões por uma minoria.', true),
  ('e2000000-0000-4000-b000-000000000823', 'e2000000-0000-4000-a000-0000000000d0', 3, 'A valorização das opiniões mais competentes.', false),
  ('e2000000-0000-4000-b000-000000000824', 'e2000000-0000-4000-a000-0000000000d0', 4, 'A sistematização dos processos decisórios.', false),
  ('e2000000-0000-4000-b000-00000000082a', 'e2000000-0000-4000-a000-0000000000d1', 0, 'Inércia do julgamento de crimes polêmicos.', false),
  ('e2000000-0000-4000-b000-00000000082b', 'e2000000-0000-4000-a000-0000000000d1', 1, 'Bondade em relação ao comportamento dos mercenários.', false),
  ('e2000000-0000-4000-b000-00000000082c', 'e2000000-0000-4000-a000-0000000000d1', 2, 'Compaixão quanto à condenação de transgressões religiosas.', false),
  ('e2000000-0000-4000-b000-00000000082d', 'e2000000-0000-4000-a000-0000000000d1', 3, 'Neutralidade diante da condenação dos servos.', false),
  ('e2000000-0000-4000-b000-00000000082e', 'e2000000-0000-4000-a000-0000000000d1', 4, 'Conveniência entre o poder tirânico e a moral do príncipe.', true),
  ('e2000000-0000-4000-b000-000000000834', 'e2000000-0000-4000-a000-0000000000d2', 0, 'Por revoltas populares que reclamavam a volta da monarquia.', false),
  ('e2000000-0000-4000-b000-000000000835', 'e2000000-0000-4000-a000-0000000000d2', 1, 'Por várias crises e pela submissão das forças políticas ao poder central.', false),
  ('e2000000-0000-4000-b000-000000000836', 'e2000000-0000-4000-a000-0000000000d2', 2, 'Pela luta entre os principais grupos políticos que reivindicavam melhores condições de vida.', false),
  ('e2000000-0000-4000-b000-000000000837', 'e2000000-0000-4000-a000-0000000000d2', 3, 'Pelo governo dos chamados regentes, que promoveram a ascensão social dos "barões do café".', false),
  ('e2000000-0000-4000-b000-000000000838', 'e2000000-0000-4000-a000-0000000000d2', 4, 'Pela convulsão política e por novas realidades econômicas que exigiam o reforço de velhas realidades sociais.', true),
  ('e2000000-0000-4000-b000-00000000083e', 'e2000000-0000-4000-a000-0000000000d3', 0, 'Criação do Ministério do Trabalho, Indústria e Comércio, que garantiu ao operariado autonomia para o exercício de atividades sindicais.', false),
  ('e2000000-0000-4000-b000-00000000083f', 'e2000000-0000-4000-a000-0000000000d3', 1, 'Legislação previdenciária, que proibiu migrantes de ocuparem cargos de direção nos sindicatos.', false),
  ('e2000000-0000-4000-b000-000000000840', 'e2000000-0000-4000-a000-0000000000d3', 2, 'Criação da Justiça do Trabalho, para coibir ideologias consideradas perturbadoras da "harmonia social".', false),
  ('e2000000-0000-4000-b000-000000000841', 'e2000000-0000-4000-a000-0000000000d3', 3, 'Legislação trabalhista que atendeu reivindicações dos operários, garantido-lhes vários direitos e formas de proteção.', true),
  ('e2000000-0000-4000-b000-000000000842', 'e2000000-0000-4000-a000-0000000000d3', 4, 'Decretação da Consolidação das Leis do Trabalho (CLT), que impediu o controle estatal sobre as atividades políticas da classe operária.', false),
  ('e2000000-0000-4000-b000-000000000848', 'e2000000-0000-4000-a000-0000000000d4', 0, 'Da manipulação política empreendida pelo governo Joao Goulart.', false),
  ('e2000000-0000-4000-b000-000000000849', 'e2000000-0000-4000-a000-0000000000d4', 1, 'Das contradições econômicas do modelo desenvolvimentista.', true),
  ('e2000000-0000-4000-b000-00000000084a', 'e2000000-0000-4000-a000-0000000000d4', 2, 'Do poder político adquirido pelos sindicatos populistas.', false),
  ('e2000000-0000-4000-b000-00000000084b', 'e2000000-0000-4000-a000-0000000000d4', 3, 'Da desmobilização das classes dominantes frente ao avanço das greves.', false),
  ('e2000000-0000-4000-b000-00000000084c', 'e2000000-0000-4000-a000-0000000000d4', 4, 'Da recusa dos sindicatos em aceitar mudanças na legislação trabalhista.', false),
  ('e2000000-0000-4000-b000-000000000852', 'e2000000-0000-4000-a000-0000000000d5', 0, 'Combater ações violentas na guerra entre as nações.', false),
  ('e2000000-0000-4000-b000-000000000853', 'e2000000-0000-4000-a000-0000000000d5', 1, 'Coagir e servir para refrear a agressividade humana.', false),
  ('e2000000-0000-4000-b000-000000000854', 'e2000000-0000-4000-a000-0000000000d5', 2, 'Criar limites entre a guerra e a paz praticadas entre os indivíduos de uma mesma nação.', false),
  ('e2000000-0000-4000-b000-000000000855', 'e2000000-0000-4000-a000-0000000000d5', 3, 'Estabelecer princípios éticos que regulamentam as ações bélicas entre países inimigos.', false),
  ('e2000000-0000-4000-b000-000000000856', 'e2000000-0000-4000-a000-0000000000d5', 4, 'Organizar as relações de poder na sociedade e entre os Estados.', true),
  ('e2000000-0000-4000-b000-00000000085c', 'e2000000-0000-4000-a000-0000000000d6', 0, 'Entretenimento para os grupos intelectuais.', false),
  ('e2000000-0000-4000-b000-00000000085d', 'e2000000-0000-4000-a000-0000000000d6', 1, 'Valorização do progresso econômico do país.', false),
  ('e2000000-0000-4000-b000-00000000085e', 'e2000000-0000-4000-a000-0000000000d6', 2, 'Crítica à passividade dos setores populares.', false),
  ('e2000000-0000-4000-b000-00000000085f', 'e2000000-0000-4000-a000-0000000000d6', 3, 'Denúncia da situação social e política do país.', true),
  ('e2000000-0000-4000-b000-000000000860', 'e2000000-0000-4000-a000-0000000000d6', 4, 'Mobilização dos setores que apoiavam a Ditadura Militar.', false),
  ('e2000000-0000-4000-b000-000000000866', 'e2000000-0000-4000-a000-0000000000d7', 0, 'Amplificou os discursos nacionalistas e autoritários durante o governo Vargas.', false),
  ('e2000000-0000-4000-b000-000000000867', 'e2000000-0000-4000-a000-0000000000d7', 1, 'Revelou para o país casos de corrupção na esfera política de vários governos.', true),
  ('e2000000-0000-4000-b000-000000000868', 'e2000000-0000-4000-a000-0000000000d7', 2, 'Maquiou indicadores sociais negativos durante as décadas de 1970 e 1980.', false),
  ('e2000000-0000-4000-b000-000000000869', 'e2000000-0000-4000-a000-0000000000d7', 3, 'Apoiou, no governo Castelo Branco, as iniciativas de fechamento do parlamento.', false),
  ('e2000000-0000-4000-b000-00000000086a', 'e2000000-0000-4000-a000-0000000000d7', 4, 'Corroborou a construção de obras faraônicas durante os governos militares.', false),
  ('e2000000-0000-4000-b000-000000000870', 'e2000000-0000-4000-a000-0000000000d8', 0, 'Internet.', true),
  ('e2000000-0000-4000-b000-000000000871', 'e2000000-0000-4000-a000-0000000000d8', 1, 'Fibra ótica.', false),
  ('e2000000-0000-4000-b000-000000000872', 'e2000000-0000-4000-a000-0000000000d8', 2, 'TV digital.', false),
  ('e2000000-0000-4000-b000-000000000873', 'e2000000-0000-4000-a000-0000000000d8', 3, 'Telefonia móvel.', false),
  ('e2000000-0000-4000-b000-000000000874', 'e2000000-0000-4000-a000-0000000000d8', 4, 'Portabilidade telefônica.', false),
  ('e2000000-0000-4000-b000-00000000087a', 'e2000000-0000-4000-a000-0000000000d9', 0, 'Das ideologias conservacionistas, com milhares de adeptos no meio urbano.', false),
  ('e2000000-0000-4000-b000-00000000087b', 'e2000000-0000-4000-a000-0000000000d9', 1, 'Das políticas governamentais de preservação dos objetos naturais e culturais.', false),
  ('e2000000-0000-4000-b000-00000000087c', 'e2000000-0000-4000-a000-0000000000d9', 2, 'Das teorias sobre a necessidade de harmonização entre técnica e natureza.', false),
  ('e2000000-0000-4000-b000-00000000087d', 'e2000000-0000-4000-a000-0000000000d9', 3, 'Dos boicotes aos produtos das empresas exploradoras e poluentes.', false),
  ('e2000000-0000-4000-b000-00000000087e', 'e2000000-0000-4000-a000-0000000000d9', 4, 'Da contestação à degradação do trabalho, das tradições e da natureza.', true),
  ('e2000000-0000-4000-b000-000000000884', 'e2000000-0000-4000-a000-0000000000da', 0, 'Instrumento de garantia da cidadania, porque através dela os cidadãos passam a pensar e agir de acordo com valores coletivos.', true),
  ('e2000000-0000-4000-b000-000000000885', 'e2000000-0000-4000-a000-0000000000da', 1, 'Mecanismo de criação de direitos humanos, porque é da natureza do homem ser ético e virtuoso.', false),
  ('e2000000-0000-4000-b000-000000000886', 'e2000000-0000-4000-a000-0000000000da', 2, 'Meio para resolver os conflitos sociais no cenário da globalização, pois a partir do entendimento do que é efetivamente a ética, a política internacional se realiza.', false),
  ('e2000000-0000-4000-b000-000000000887', 'e2000000-0000-4000-a000-0000000000da', 3, 'Parâmetro para assegurar o exercício político primando pelos interesses e ação privada dos cidadãos.', false),
  ('e2000000-0000-4000-b000-000000000888', 'e2000000-0000-4000-a000-0000000000da', 4, 'Aceitação de valores universais implícitos numa sociedade que busca dimensionar sua vinculação à outras sociedades.', false),
  ('e2000000-0000-4000-b000-00000000088e', 'e2000000-0000-4000-a000-0000000000db', 0, 'Na pobreza dos empregados, que estava dissociada da riqueza dos patrões.', false),
  ('e2000000-0000-4000-b000-00000000088f', 'e2000000-0000-4000-a000-0000000000db', 1, 'No salário dos operários, que era proporcional aos seus esforços nas indústrias.', false),
  ('e2000000-0000-4000-b000-000000000890', 'e2000000-0000-4000-a000-0000000000db', 2, 'Na burguesia, que tinha seus negócios financiados pelo proletariado.', false),
  ('e2000000-0000-4000-b000-000000000891', 'e2000000-0000-4000-a000-0000000000db', 3, 'No trabalho, que era considerado uma garantia de liberdade.', false),
  ('e2000000-0000-4000-b000-000000000892', 'e2000000-0000-4000-a000-0000000000db', 4, 'Na riqueza, que não era usufruída por aqueles que a produziam.', true),
  ('e2000000-0000-4000-b000-000000000898', 'e2000000-0000-4000-a000-0000000000dc', 0, 'À baixa representatividade polítíca de grupos organizados que defendem os direitos de cidadania dos homossexuais.', false),
  ('e2000000-0000-4000-b000-000000000899', 'e2000000-0000-4000-a000-0000000000dc', 1, 'À falência da democracia no país, que torna impeditiva a divulgação de estatísticas relacionadas à violência contra homossexuais.', false),
  ('e2000000-0000-4000-b000-00000000089a', 'e2000000-0000-4000-a000-0000000000dc', 2, 'À Constituição de 1988, que exclui do tecido social os homossexuais, além de impedi-los de exercer seus direitos políticos.', false),
  ('e2000000-0000-4000-b000-00000000089b', 'e2000000-0000-4000-a000-0000000000dc', 3, 'A um passado histórico marcado pela demonização do corpo e por formas recorrentes de tabus e intolerância.', true),
  ('e2000000-0000-4000-b000-00000000089c', 'e2000000-0000-4000-a000-0000000000dc', 4, 'A uma política eugênica desenvolvida pelo Estado, justificada a partir dos posicionamentos de correntes filosófico-científicas.', false),
  ('e2000000-0000-4000-b000-0000000008a2', 'e2000000-0000-4000-a000-0000000000dd', 0, 'Preservação da autonomia institucional entre os poderes.', false),
  ('e2000000-0000-4000-b000-0000000008a3', 'e2000000-0000-4000-a000-0000000000dd', 1, 'Valorização da atuação independente de alguns juízes.', false),
  ('e2000000-0000-4000-b000-0000000008a4', 'e2000000-0000-4000-a000-0000000000dd', 2, 'Manutenção da interferência jurídica nos atos executivos.', false),
  ('e2000000-0000-4000-b000-0000000008a5', 'e2000000-0000-4000-a000-0000000000dd', 3, 'Transferência das funções dos juízes para o chefe de Estado.', false),
  ('e2000000-0000-4000-b000-0000000008a6', 'e2000000-0000-4000-a000-0000000000dd', 4, 'Subordinação do poder judiciário aos interesses políticos dominantes.', true),
  ('e2000000-0000-4000-b000-0000000008ac', 'e2000000-0000-4000-a000-0000000000de', 0, 'Qualidade total e estabilidade no trabalho.', false),
  ('e2000000-0000-4000-b000-0000000008ad', 'e2000000-0000-4000-a000-0000000000de', 1, 'Pleno emprego e enfraquecimento dos sindicatos.', false),
  ('e2000000-0000-4000-b000-0000000008ae', 'e2000000-0000-4000-a000-0000000000de', 2, 'Diminuição dos custos e insegurança no emprego.', true),
  ('e2000000-0000-4000-b000-0000000008af', 'e2000000-0000-4000-a000-0000000000de', 3, 'Responsabilidade social e redução do desemprego.', false),
  ('e2000000-0000-4000-b000-0000000008b0', 'e2000000-0000-4000-a000-0000000000de', 4, 'Maximização dos lucros e aparecimento de empregos.', false),
  ('e2000000-0000-4000-b000-0000000008b6', 'e2000000-0000-4000-a000-0000000000df', 0, 'Os conteúdos éticos decorrentes das ideologias político-partidárias.', false),
  ('e2000000-0000-4000-b000-0000000008b7', 'e2000000-0000-4000-a000-0000000000df', 1, 'O valor da ação humana derivada de preceitos metafísicos.', false),
  ('e2000000-0000-4000-b000-0000000008b8', 'e2000000-0000-4000-a000-0000000000df', 2, 'A sistematização de valores desassociados da cultura.', false),
  ('e2000000-0000-4000-b000-0000000008b9', 'e2000000-0000-4000-a000-0000000000df', 3, 'O sentido coletivo e político das ações humanas individuais.', true),
  ('e2000000-0000-4000-b000-0000000008ba', 'e2000000-0000-4000-a000-0000000000df', 4, 'O julgamento da ação ética pelos políticos eleitos democraticamente.', false),
  ('e2000000-0000-4000-b000-0000000008c0', 'e2000000-0000-4000-a000-0000000000e0', 0, 'Impedir a contratação de familiares para o serviço público.', false),
  ('e2000000-0000-4000-b000-0000000008c1', 'e2000000-0000-4000-a000-0000000000e0', 1, 'Reduzir a ação das instituições constitucionais.', false),
  ('e2000000-0000-4000-b000-0000000008c2', 'e2000000-0000-4000-a000-0000000000e0', 2, 'Combater a distribuição equilibrada de poder.', false),
  ('e2000000-0000-4000-b000-0000000008c3', 'e2000000-0000-4000-a000-0000000000e0', 3, 'Evitar a escolha de governantes autoritários.', true),
  ('e2000000-0000-4000-b000-0000000008c4', 'e2000000-0000-4000-a000-0000000000e0', 4, 'Restringir a atuação do Parlamento.', false),
  ('e2000000-0000-4000-b000-0000000008ca', 'e2000000-0000-4000-a000-0000000000e1', 0, 'Antibiótico contra o vírus da febre amarela, soro antiofídico caso seja picado por uma cobra e vacina contra a leptospirose.', false),
  ('e2000000-0000-4000-b000-0000000008cb', 'e2000000-0000-4000-a000-0000000000e1', 1, 'Vacina contra o vírus da febre amarela, soro antiofídico caso seja picado por uma cobra e antibiótico caso entre em contato com a Leptospira sp.', true),
  ('e2000000-0000-4000-b000-0000000008cc', 'e2000000-0000-4000-a000-0000000000e1', 2, 'Soro contra o vírus da febre amarela, antibiótico caso seja picado por uma cobra e soro contra toxinas bacterianas.', false),
  ('e2000000-0000-4000-b000-0000000008cd', 'e2000000-0000-4000-a000-0000000000e1', 3, 'Antibiótico ou soro, tanto contra o vírus da febre amarela como para veneno de cobras, e vacina contra a leptospirose.', false),
  ('e2000000-0000-4000-b000-0000000008ce', 'e2000000-0000-4000-a000-0000000000e1', 4, 'Soro antiofídico e antibiótico contra a Leptospira sp e vacina contra a febre amarela caso entre em contato com o vírus causador da doença.', false),
  ('e2000000-0000-4000-b000-0000000008d4', 'e2000000-0000-4000-a000-0000000000e2', 0, 'Reflexão.', true),
  ('e2000000-0000-4000-b000-0000000008d5', 'e2000000-0000-4000-a000-0000000000e2', 1, 'Refração.', false),
  ('e2000000-0000-4000-b000-0000000008d6', 'e2000000-0000-4000-a000-0000000000e2', 2, 'Difração.', false),
  ('e2000000-0000-4000-b000-0000000008d7', 'e2000000-0000-4000-a000-0000000000e2', 3, 'Polarização.', false),
  ('e2000000-0000-4000-b000-0000000008d8', 'e2000000-0000-4000-a000-0000000000e2', 4, 'Interferência.', false),
  ('e2000000-0000-4000-b000-0000000008de', 'e2000000-0000-4000-a000-0000000000e3', 0, 'Azul.', false),
  ('e2000000-0000-4000-b000-0000000008df', 'e2000000-0000-4000-a000-0000000000e3', 1, 'Preto.', false),
  ('e2000000-0000-4000-b000-0000000008e0', 'e2000000-0000-4000-a000-0000000000e3', 2, 'Laranja.', true),
  ('e2000000-0000-4000-b000-0000000008e1', 'e2000000-0000-4000-a000-0000000000e3', 3, 'Amarelo.', false),
  ('e2000000-0000-4000-b000-0000000008e2', 'e2000000-0000-4000-a000-0000000000e3', 4, 'Vermelho.', false),
  ('e2000000-0000-4000-b000-0000000008e8', 'e2000000-0000-4000-a000-0000000000e4', 0, 'Falta de flúor e de cálcio na alimentação diária da população brasileira.', false),
  ('e2000000-0000-4000-b000-0000000008e9', 'e2000000-0000-4000-a000-0000000000e4', 1, 'Consumo exagerado do xilitol, um açúcar, na dieta alimentar diária do indivíduo.', false),
  ('e2000000-0000-4000-b000-0000000008ea', 'e2000000-0000-4000-a000-0000000000e4', 2, 'Redução na proliferação bacteriana quando a saliva é desbalanceada pela má alimentação.', false),
  ('e2000000-0000-4000-b000-0000000008eb', 'e2000000-0000-4000-a000-0000000000e4', 3, 'Uso exagerado do flúor, um agente que em alta quantidade torna-se tóxico à formação dos dentes.', false),
  ('e2000000-0000-4000-b000-0000000008ec', 'e2000000-0000-4000-a000-0000000000e4', 4, 'Consumo excessivo de açúcares na alimentação e má higienizaçao bucal, que contribuem para a proliferação de bactérias.', true),
  ('e2000000-0000-4000-b000-0000000008f2', 'e2000000-0000-4000-a000-0000000000e5', 0, 'A temperatura da água pode ficar constante durante o tempo em que estiver fervendo.', true),
  ('e2000000-0000-4000-b000-0000000008f3', 'e2000000-0000-4000-a000-0000000000e5', 1, 'Uma mãe coloca a mão na água da banheira do bebê para verificar a temperatura da água.', false),
  ('e2000000-0000-4000-b000-0000000008f4', 'e2000000-0000-4000-a000-0000000000e5', 2, 'A chama de um fogão pode ser usada para aumentar a temperatura da água em uma panela.', false),
  ('e2000000-0000-4000-b000-0000000008f5', 'e2000000-0000-4000-a000-0000000000e5', 3, 'A água quente que está em uma caneca é passada para outra caneca a fim de diminuir sua temperatura.', false),
  ('e2000000-0000-4000-b000-0000000008f6', 'e2000000-0000-4000-a000-0000000000e5', 4, 'Um forno pode fornecer calor para uma vasilha de água que está em seu interior com menor temperatura do que a dele.', false),
  ('e2000000-0000-4000-b000-0000000008fc', 'e2000000-0000-4000-a000-0000000000e6', 0, 'Da água.', false),
  ('e2000000-0000-4000-b000-0000000008fd', 'e2000000-0000-4000-a000-0000000000e6', 1, 'Do oxigênio.', false),
  ('e2000000-0000-4000-b000-0000000008fe', 'e2000000-0000-4000-a000-0000000000e6', 2, 'Do fósforo.', false),
  ('e2000000-0000-4000-b000-0000000008ff', 'e2000000-0000-4000-a000-0000000000e6', 3, 'Do carbono.', true),
  ('e2000000-0000-4000-b000-000000000900', 'e2000000-0000-4000-a000-0000000000e6', 4, 'Do nitrogênio.', false),
  ('e2000000-0000-4000-b000-000000000906', 'e2000000-0000-4000-a000-0000000000e7', 0, 'Forneceu a maior quantidade de energia às amostras.', false),
  ('e2000000-0000-4000-b000-000000000907', 'e2000000-0000-4000-a000-0000000000e7', 1, 'Cedeu energia à amostra de maior massa em mais tempo.', false),
  ('e2000000-0000-4000-b000-000000000908', 'e2000000-0000-4000-a000-0000000000e7', 2, 'Forneceu a maior quantidade de energia em menos tempo.', true),
  ('e2000000-0000-4000-b000-000000000909', 'e2000000-0000-4000-a000-0000000000e7', 3, 'Cedeu energia à amostra de menor calor específico mais lentamente.', false),
  ('e2000000-0000-4000-b000-00000000090a', 'e2000000-0000-4000-a000-0000000000e7', 4, 'Forneceu a menor quantidade de energia às amostras em menos tempo.', false),
  ('e2000000-0000-4000-b000-000000000910', 'e2000000-0000-4000-a000-0000000000e8', 0, 'Incentivar a reciclagem de resíduos biológicos, utilizando dejetos animais e restos de culturas para produção de adubo.', true),
  ('e2000000-0000-4000-b000-000000000911', 'e2000000-0000-4000-a000-0000000000e8', 1, 'Repor o estoque retirado das minas com um íon sintético de fósforo para garantir o abastecimento da indústria de fertilizantes.', false),
  ('e2000000-0000-4000-b000-000000000912', 'e2000000-0000-4000-a000-0000000000e8', 2, 'Aumentar a importação de íons fosfato dos países ricos para suprir as exigências das indústrias nacionais de fertilizantes.', false),
  ('e2000000-0000-4000-b000-000000000913', 'e2000000-0000-4000-a000-0000000000e8', 3, 'Substituir o fósforo dos fertilizantes por outro elemento com a mesma função para suprir as necessidades do uso de seus íons.', false),
  ('e2000000-0000-4000-b000-000000000914', 'e2000000-0000-4000-a000-0000000000e8', 4, 'Proibir, por meio de lei federal, o uso de fertilizantes com fósforo pelos agricultores, para diminuir sua extração das reservas naturais.', false),
  ('e2000000-0000-4000-b000-00000000091a', 'e2000000-0000-4000-a000-0000000000e9', 0, 'Na temperatura da superfície do planeta.', false),
  ('e2000000-0000-4000-b000-00000000091b', 'e2000000-0000-4000-a000-0000000000e9', 1, 'No formato da camada gasosa do planeta.', false),
  ('e2000000-0000-4000-b000-00000000091c', 'e2000000-0000-4000-a000-0000000000e9', 2, 'No campo gravitacional gerado pelo planeta.', false),
  ('e2000000-0000-4000-b000-00000000091d', 'e2000000-0000-4000-a000-0000000000e9', 3, 'Na composição química das nuvens do planeta.', false),
  ('e2000000-0000-4000-b000-00000000091e', 'e2000000-0000-4000-a000-0000000000e9', 4, 'Na densidade das nuvens que compõem o planeta.', true),
  ('e2000000-0000-4000-b000-000000000924', 'e2000000-0000-4000-a000-0000000000ea', 0, 'Separação mecânica, extração, decantação.', false),
  ('e2000000-0000-4000-b000-000000000925', 'e2000000-0000-4000-a000-0000000000ea', 1, 'Separação magnética, combustão, filtração.', false),
  ('e2000000-0000-4000-b000-000000000926', 'e2000000-0000-4000-a000-0000000000ea', 2, 'Separação magnética, extração, filtração.', true),
  ('e2000000-0000-4000-b000-000000000927', 'e2000000-0000-4000-a000-0000000000ea', 3, 'Imantação, combustão, peneiração.', false),
  ('e2000000-0000-4000-b000-000000000928', 'e2000000-0000-4000-a000-0000000000ea', 4, 'Imantação, destilação, filtração.', false),
  ('e2000000-0000-4000-b000-00000000092e', 'e2000000-0000-4000-a000-0000000000eb', 0, 'Pela circulação do magma no subsolo.', true),
  ('e2000000-0000-4000-b000-00000000092f', 'e2000000-0000-4000-a000-0000000000eb', 1, 'Pelas erupções constantes dos vulcões.', false),
  ('e2000000-0000-4000-b000-000000000930', 'e2000000-0000-4000-a000-0000000000eb', 2, 'Pelo sol que aquece as águas com radiação ultravioleta.', false),
  ('e2000000-0000-4000-b000-000000000931', 'e2000000-0000-4000-a000-0000000000eb', 3, 'Pela queima do carvão e combustível fósseis.', false),
  ('e2000000-0000-4000-b000-000000000932', 'e2000000-0000-4000-a000-0000000000eb', 4, 'Pelos detritos e cinzas vulcânicas.', false),
  ('e2000000-0000-4000-b000-000000000938', 'e2000000-0000-4000-a000-0000000000ec', 0, 'Aquecer as águas dos rios para aumentar a velocidade de decomposição dos dejetos.', false),
  ('e2000000-0000-4000-b000-000000000939', 'e2000000-0000-4000-a000-0000000000ec', 1, 'Retirar do esgoto os materiais ricos em nutrientes para diminuir a sua concentração nos rios.', true),
  ('e2000000-0000-4000-b000-00000000093a', 'e2000000-0000-4000-a000-0000000000ec', 2, 'Adicionar bactérias anaeróbicas às águas dos rios para que elas sobrevivam mesmo sem oxigênio.', false),
  ('e2000000-0000-4000-b000-00000000093b', 'e2000000-0000-4000-a000-0000000000ec', 3, 'Substituir produtos não degradáveis por biodegradáveis para que as bactérias possam utilizar os nutrientes.', false),
  ('e2000000-0000-4000-b000-00000000093c', 'e2000000-0000-4000-a000-0000000000ec', 4, 'Aumentar a solubilidade dos dejetos no esgoto para que os nutrientes fiquem mais acessíveis às bactérias.', false),
  ('e2000000-0000-4000-b000-000000000942', 'e2000000-0000-4000-a000-0000000000ed', 0, 'Permite a entrada de calor do ambiente externo para o interior da seringa.', false),
  ('e2000000-0000-4000-b000-000000000943', 'e2000000-0000-4000-a000-0000000000ed', 1, 'Provoca, por atrito, um aquecimento da água contida na seringa.', false),
  ('e2000000-0000-4000-b000-000000000944', 'e2000000-0000-4000-a000-0000000000ed', 2, 'Produz um aumento de volume que aumenta o ponto de ebulição da água.', false),
  ('e2000000-0000-4000-b000-000000000945', 'e2000000-0000-4000-a000-0000000000ed', 3, 'Proporciona uma queda de pressão no interior da seringa que diminui o ponto de ebulição da água.', true),
  ('e2000000-0000-4000-b000-000000000946', 'e2000000-0000-4000-a000-0000000000ed', 4, 'Possibilita uma diminuição da densidade da água que facilita sua ebulição.', false),
  ('e2000000-0000-4000-b000-00000000094c', 'e2000000-0000-4000-a000-0000000000ee', 0, 'Diminua devido a utilização de caldeiras por indústrias metalúrgicas.', false),
  ('e2000000-0000-4000-b000-00000000094d', 'e2000000-0000-4000-a000-0000000000ee', 1, 'Aumente devido ao bloqueio da luz do sol pelos gases do efeito estufa.', false),
  ('e2000000-0000-4000-b000-00000000094e', 'e2000000-0000-4000-a000-0000000000ee', 2, 'Diminua devido à não necessidade de aquecer a água utilizada em indústrias.', false),
  ('e2000000-0000-4000-b000-00000000094f', 'e2000000-0000-4000-a000-0000000000ee', 3, 'Aumente devido à necessidade de maior refrigeração de indústrias e residências.', true),
  ('e2000000-0000-4000-b000-000000000950', 'e2000000-0000-4000-a000-0000000000ee', 4, 'Diminua devido à grande quantidade de radiação térmica reutilizada.', false),
  ('e2000000-0000-4000-b000-000000000956', 'e2000000-0000-4000-a000-0000000000ef', 0, 'Aumento da salinidade, em que a água do solo atinge uma concentração de sais maior que a das células das raízes das plantas, impedindo, assim, que a água seja absorvida.', true),
  ('e2000000-0000-4000-b000-000000000957', 'e2000000-0000-4000-a000-0000000000ef', 1, 'Aumento da salinidade, em que o solo atinge um nível muito baixo de água, e as plantas não tem força de sucção para absorver a água.', false),
  ('e2000000-0000-4000-b000-000000000958', 'e2000000-0000-4000-a000-0000000000ef', 2, 'Diminuição da salinidade, que atinge um nível em que as plantas não têm força de sucção, fazendo com que a água não seja absorvida.', false),
  ('e2000000-0000-4000-b000-000000000959', 'e2000000-0000-4000-a000-0000000000ef', 3, 'Aumento da salinidade, que atinge um nível em que as plantas têm muita sudação, não tendo força de sucção para superá-la.', false),
  ('e2000000-0000-4000-b000-00000000095a', 'e2000000-0000-4000-a000-0000000000ef', 4, 'Diminuição da salinidade, que atinge um nível em que as plantas ficam túrgidas e não têm força de sudação para superá-la.', false),
  ('e2000000-0000-4000-b000-000000000960', 'e2000000-0000-4000-a000-0000000000f0', 0, 'Indicam a independência da espécie humana com relação ao ambiente marinho.', false),
  ('e2000000-0000-4000-b000-000000000961', 'e2000000-0000-4000-a000-0000000000f0', 1, 'Alertam para a necessidade do controle da poluição ambiental para a redução do efeito estufa.', false),
  ('e2000000-0000-4000-b000-000000000962', 'e2000000-0000-4000-a000-0000000000f0', 2, 'Ilustram a interdependência das diversas formas de vida (animal, vegetal e outras) e o seu habitat.', true),
  ('e2000000-0000-4000-b000-000000000963', 'e2000000-0000-4000-a000-0000000000f0', 3, 'Indicam a alta resistência do meio ambiente à ação do homem, além de evidenciar a sua sustentabilidade  mesmo em condições extremas de poluição.', false),
  ('e2000000-0000-4000-b000-000000000964', 'e2000000-0000-4000-a000-0000000000f0', 4, 'Evidenciam a grande capacidade animal de se adaptar às mudanças ambientais, em contraste com a baixa capacidade das espécies vegetais, que estão na base da cadeia alimentar hídrica.', false),
  ('e2000000-0000-4000-b000-00000000096a', 'e2000000-0000-4000-a000-0000000000f1', 0, 'Manter o volume de absorção.', false),
  ('e2000000-0000-4000-b000-00000000096b', 'e2000000-0000-4000-a000-0000000000f1', 1, 'Aumentar a superfície de absorção.', true),
  ('e2000000-0000-4000-b000-00000000096c', 'e2000000-0000-4000-a000-0000000000f1', 2, 'Diminuir a velocidade de absorção.', false),
  ('e2000000-0000-4000-b000-00000000096d', 'e2000000-0000-4000-a000-0000000000f1', 3, 'Aumentar o tempo da absorção.', false),
  ('e2000000-0000-4000-b000-00000000096e', 'e2000000-0000-4000-a000-0000000000f1', 4, 'Manter a seletividade na absorção.', false),
  ('e2000000-0000-4000-b000-000000000974', 'e2000000-0000-4000-a000-0000000000f2', 0, 'Transforma energia química em energia elétrica, sem causar danos ao meio ambiente, porque o principal subproduto formado é a água.', true),
  ('e2000000-0000-4000-b000-000000000975', 'e2000000-0000-4000-a000-0000000000f2', 1, 'Converte a energia química contida nas moléculas dos componentes em energia térmica, sem que ocorra a produção de gases poluentes nocivos ao meio ambiente.', false),
  ('e2000000-0000-4000-b000-000000000976', 'e2000000-0000-4000-a000-0000000000f2', 2, 'Transforma energia química em energia elétrica, porém emite gases poluentes da mesma forma que a produção de energia a partir dos combustíveis fósseis.', false),
  ('e2000000-0000-4000-b000-000000000977', 'e2000000-0000-4000-a000-0000000000f2', 3, 'Converte energia elétrica proveniente dos combustíveis fósseis em energia química, retendo os gases poluentes produzidos no processo sem alterar a qualidade do meio ambiente.', false),
  ('e2000000-0000-4000-b000-000000000978', 'e2000000-0000-4000-a000-0000000000f2', 4, 'Converte a energia potencial acumulada nas moléculas de água contidas no sistema em energia química, sem que ocorra a produção de gases poluentes nocivos ao meio ambiente.', false),
  ('e2000000-0000-4000-b000-00000000097e', 'e2000000-0000-4000-a000-0000000000f3', 0, 'As características citadas no texto foram originadas pela seleção natural.', false),
  ('e2000000-0000-4000-b000-00000000097f', 'e2000000-0000-4000-a000-0000000000f3', 1, 'A ausência de olhos teria sido causada pela falta de uso dos mesmos, segundo a lei do uso e desuso.', true),
  ('e2000000-0000-4000-b000-000000000980', 'e2000000-0000-4000-a000-0000000000f3', 2, 'O corpo anelado é uma característica fortemente adaptativa, mas transmitida apenas à primeira geração de descendentes.', false),
  ('e2000000-0000-4000-b000-000000000981', 'e2000000-0000-4000-a000-0000000000f3', 3, 'As patas teriam sido perdidas pela falta de uso e, em seguida, essa característica foi incorporada ao patrimônio genético e então transmitidas aos descendentes.', false),
  ('e2000000-0000-4000-b000-000000000982', 'e2000000-0000-4000-a000-0000000000f3', 4, 'As características citadas no texto foram adquiridas por meio de mutações e depois, ao longo do tempo, foram selecionadas por serem mais adaptadas ao ambiente em que os organismos se encontram.', false),
  ('e2000000-0000-4000-b000-000000000988', 'e2000000-0000-4000-a000-0000000000f4', 0, 'IV, I, II e III.', false),
  ('e2000000-0000-4000-b000-000000000989', 'e2000000-0000-4000-a000-0000000000f4', 1, 'I, IV, III e II.', false),
  ('e2000000-0000-4000-b000-00000000098a', 'e2000000-0000-4000-a000-0000000000f4', 2, 'IV, III, I e II.', false),
  ('e2000000-0000-4000-b000-00000000098b', 'e2000000-0000-4000-a000-0000000000f4', 3, 'I, IV, II e III.', false),
  ('e2000000-0000-4000-b000-00000000098c', 'e2000000-0000-4000-a000-0000000000f4', 4, 'IV, I, III e II.', true),
  ('e2000000-0000-4000-b000-000000000992', 'e2000000-0000-4000-a000-0000000000f5', 0, 'S e CH4', false),
  ('e2000000-0000-4000-b000-000000000993', 'e2000000-0000-4000-a000-0000000000f5', 1, 'S e NO3-', true),
  ('e2000000-0000-4000-b000-000000000994', 'e2000000-0000-4000-a000-0000000000f5', 2, 'H2 e NO3-', false),
  ('e2000000-0000-4000-b000-000000000995', 'e2000000-0000-4000-a000-0000000000f5', 3, 'CO2 e CH4', false),
  ('e2000000-0000-4000-b000-000000000996', 'e2000000-0000-4000-a000-0000000000f5', 4, 'H2 e CO2', false),
  ('e2000000-0000-4000-b000-00000000099c', 'e2000000-0000-4000-a000-0000000000f6', 0, 'Insatisfatória, pois a reação apresentada não permite que a energia presente no meio externo seja absorvida pelo sistema para ser utilizada posteriormente.', false),
  ('e2000000-0000-4000-b000-00000000099d', 'e2000000-0000-4000-a000-0000000000f6', 1, 'Insatisfatória, uma vez que há formação de gases poluentes e com potencial poder explosivo, tornando-a uma reação perigosa e de difícil controle.', false),
  ('e2000000-0000-4000-b000-00000000099e', 'e2000000-0000-4000-a000-0000000000f6', 2, 'Insatisfatória, uma vez que a a formação do gás CO que não possui conteúdo energético passível de ser aproveitado posteriormente e é considerado um gás poluente.', false),
  ('e2000000-0000-4000-b000-00000000099f', 'e2000000-0000-4000-a000-0000000000f6', 3, 'Satisfatória, uma vez que a reação direta ocorre com absorção de calor e promove a formação das substâncias combustíveis que poderão ser utilizadas posteriormente para a obtenção de energia e realização de trabalho útil.', true),
  ('e2000000-0000-4000-b000-0000000009a0', 'e2000000-0000-4000-a000-0000000000f6', 4, 'Satisfatória, uma vez que a reação direta ocorre com liberação de calor havendo ainda a formação das substâncias combustíveis que poderão ser utilizadas posteriormente para a obtenção de energia a realização de trabalho útil.', false),
  ('e2000000-0000-4000-b000-0000000009a6', 'e2000000-0000-4000-a000-0000000000f7', 0, 'R$ 42,80.', false),
  ('e2000000-0000-4000-b000-0000000009a7', 'e2000000-0000-4000-a000-0000000000f7', 1, 'R$ 42,00.', false),
  ('e2000000-0000-4000-b000-0000000009a8', 'e2000000-0000-4000-a000-0000000000f7', 2, 'R$ 43,00.', false),
  ('e2000000-0000-4000-b000-0000000009a9', 'e2000000-0000-4000-a000-0000000000f7', 3, 'R$ 43,80.', false),
  ('e2000000-0000-4000-b000-0000000009aa', 'e2000000-0000-4000-a000-0000000000f7', 4, 'R$ 44,00.', true),
  ('e2000000-0000-4000-b000-0000000009b0', 'e2000000-0000-4000-a000-0000000000f8', 0, 'Metanol, pois sua combustão completa fornece, aproximadamente, 22,7 kJ de energia por litro de combustível queimado.', false),
  ('e2000000-0000-4000-b000-0000000009b1', 'e2000000-0000-4000-a000-0000000000f8', 1, 'Etanol, pois sua combustão completa fornece, aproximadamente, 29,7 kJ de energia por litro de combustível queimado.', false),
  ('e2000000-0000-4000-b000-0000000009b2', 'e2000000-0000-4000-a000-0000000000f8', 2, 'Metanol, pois sua combustão completa fornece, aproximadamente, 17,9 MJ de energia por litro de combustível queimado.', false),
  ('e2000000-0000-4000-b000-0000000009b3', 'e2000000-0000-4000-a000-0000000000f8', 3, 'Etanol, pois sua combustão completa fornece, aproximadamente, 23,5 MJ de energia por litro de combustível queimado.', true),
  ('e2000000-0000-4000-b000-0000000009b4', 'e2000000-0000-4000-a000-0000000000f8', 4, 'Etanol, pois sua combustão completa fornece, aproximadamente, 33,7 MJ de energia por litro de combustível queimado.', false),
  ('e2000000-0000-4000-b000-0000000009ba', 'e2000000-0000-4000-a000-0000000000f9', 0, '1.830 W.', true),
  ('e2000000-0000-4000-b000-0000000009bb', 'e2000000-0000-4000-a000-0000000000f9', 1, '2.800 W.', false),
  ('e2000000-0000-4000-b000-0000000009bc', 'e2000000-0000-4000-a000-0000000000f9', 2, '3.200 W.', false),
  ('e2000000-0000-4000-b000-0000000009bd', 'e2000000-0000-4000-a000-0000000000f9', 3, '4.030 W.', false),
  ('e2000000-0000-4000-b000-0000000009be', 'e2000000-0000-4000-a000-0000000000f9', 4, '5.500 W.', false),
  ('e2000000-0000-4000-b000-0000000009c4', 'e2000000-0000-4000-a000-0000000000fa', 0, 'A grande capacidade de adaptação, considerando as constantes mudanças no ambiente em que se reproduzem e o processo aeróbico como a melhor opção desses micro-organismos para a obtenção de energia.', false),
  ('e2000000-0000-4000-b000-0000000009c5', 'e2000000-0000-4000-a000-0000000000fa', 1, 'A grande capacidade de sofrer mutações, aumentando a probabilidade do aparecimento de formas resistentes e o processo anaeróbico da fermentação como a principal via de obtenção de energia.', false),
  ('e2000000-0000-4000-b000-0000000009c6', 'e2000000-0000-4000-a000-0000000000fa', 2, 'A diversidade morfológica entre as bactérias, aumentando a variedade de tipos de agentes infecciosos e a nutrição heterotrófica, como forma de esses micro-organismos obterem matéria-prima e energia.', false),
  ('e2000000-0000-4000-b000-0000000009c7', 'e2000000-0000-4000-a000-0000000000fa', 3, 'O alto poder de reprodução, aumentando a variabilidade genética dos milhares de indivíduos e a nutrição heterotrófica, como única forma de obtenção de matéria-prima e energia desses micro-organismos.', false),
  ('e2000000-0000-4000-b000-0000000009c8', 'e2000000-0000-4000-a000-0000000000fa', 4, 'O alto poder de reprodução, originando milhares de descendentes geneticamente idênticos entre si e a diversidade metabólica, considerando processos aeróbicos e anaeróbicos para a obtenção de energia.', true),
  ('e2000000-0000-4000-b000-0000000009ce', 'e2000000-0000-4000-a000-0000000000fb', 0, '0,4 mg de O2/litro', false),
  ('e2000000-0000-4000-b000-0000000009cf', 'e2000000-0000-4000-a000-0000000000fb', 1, '1,7 mg de O2/litro', false),
  ('e2000000-0000-4000-b000-0000000009d0', 'e2000000-0000-4000-a000-0000000000fb', 2, '2,7 mg de O2/litro', false),
  ('e2000000-0000-4000-b000-0000000009d1', 'e2000000-0000-4000-a000-0000000000fb', 3, '9,4 mg de O2/litro', false),
  ('e2000000-0000-4000-b000-0000000009d2', 'e2000000-0000-4000-a000-0000000000fb', 4, '10,7 mg de O2/litro', true),
  ('e2000000-0000-4000-b000-0000000009d8', 'e2000000-0000-4000-a000-0000000000fc', 0, '1,7 kg.', false),
  ('e2000000-0000-4000-b000-0000000009d9', 'e2000000-0000-4000-a000-0000000000fc', 1, '1,9 Kg.', false),
  ('e2000000-0000-4000-b000-0000000009da', 'e2000000-0000-4000-a000-0000000000fc', 2, '2,9 Kg.', true),
  ('e2000000-0000-4000-b000-0000000009db', 'e2000000-0000-4000-a000-0000000000fc', 3, '3,3 Kg.', false),
  ('e2000000-0000-4000-b000-0000000009dc', 'e2000000-0000-4000-a000-0000000000fc', 4, '3,6 Kg.', false),
  ('e2000000-0000-4000-b000-0000000009e2', 'e2000000-0000-4000-a000-0000000000fd', 0, '0,02 g', false),
  ('e2000000-0000-4000-b000-0000000009e3', 'e2000000-0000-4000-a000-0000000000fd', 1, '0,04 g', false),
  ('e2000000-0000-4000-b000-0000000009e4', 'e2000000-0000-4000-a000-0000000000fd', 2, '2,40 g', false),
  ('e2000000-0000-4000-b000-0000000009e5', 'e2000000-0000-4000-a000-0000000000fd', 3, '35,5 g', true),
  ('e2000000-0000-4000-b000-0000000009e6', 'e2000000-0000-4000-a000-0000000000fd', 4, '71,0 g', false),
  ('e2000000-0000-4000-b000-0000000009ec', 'e2000000-0000-4000-a000-0000000000fe', 0, 'Caatinga, Cerrado, Zona dos Cocais e Floresta Amazônica.', false),
  ('e2000000-0000-4000-b000-0000000009ed', 'e2000000-0000-4000-a000-0000000000fe', 1, 'Mata de Araucárias, Cerrado, Zona dos Cocais e Caatinga.', true),
  ('e2000000-0000-4000-b000-0000000009ee', 'e2000000-0000-4000-a000-0000000000fe', 2, 'Manguezais, Zona dos Cocais, Cerrado e Mata Atlântica.', false),
  ('e2000000-0000-4000-b000-0000000009ef', 'e2000000-0000-4000-a000-0000000000fe', 3, 'Floresta Amazônica, Cerrado, Mata Atlântica e Pampas.', false),
  ('e2000000-0000-4000-b000-0000000009f0', 'e2000000-0000-4000-a000-0000000000fe', 4, 'Mata Atlântica, Cerrado, Zona dos Cocais e Pantanal.', false),
  ('e2000000-0000-4000-b000-0000000009f6', 'e2000000-0000-4000-a000-0000000000ff', 0, 'Diminuiria o sucesso reprodutivo desses machos transgênicos.', false),
  ('e2000000-0000-4000-b000-0000000009f7', 'e2000000-0000-4000-a000-0000000000ff', 1, 'Restringiria a área geográfica de voo dessa espécie de mosquito.', false),
  ('e2000000-0000-4000-b000-0000000009f8', 'e2000000-0000-4000-a000-0000000000ff', 2, 'Dificultaria a contaminação e reprodução do vetor natural da doença.', true),
  ('e2000000-0000-4000-b000-0000000009f9', 'e2000000-0000-4000-a000-0000000000ff', 3, 'Tornaria o mosquito menos resistente ao agente etiológico da doença.', false),
  ('e2000000-0000-4000-b000-0000000009fa', 'e2000000-0000-4000-a000-0000000000ff', 4, 'Dificultaria a obtenção de alimentos pelos machos geneticamente modificados.', false),
  ('e2000000-0000-4000-b000-000000000a00', 'e2000000-0000-4000-a000-000000000100', 0, 'Desidratação do ácido monofluoracético com liberação de água.', false),
  ('e2000000-0000-4000-b000-000000000a01', 'e2000000-0000-4000-a000-000000000100', 1, 'Hidrólise do ácido monofluoracético sem formação de água.', false),
  ('e2000000-0000-4000-b000-000000000a02', 'e2000000-0000-4000-a000-000000000100', 2, 'Perda de íons hidroxila do ácido monofluoracético, com liberação de hidróxido de sódio.', false),
  ('e2000000-0000-4000-b000-000000000a03', 'e2000000-0000-4000-a000-000000000100', 3, 'Neutralização do ácido monofluoracético usando hidróxido de sódio, com liberação de água.', true),
  ('e2000000-0000-4000-b000-000000000a04', 'e2000000-0000-4000-a000-000000000100', 4, 'Substituição dos íons hidrogênio por sódio na estrutura do ácido monofluoracético, sem formação de água.', false),
  ('e2000000-0000-4000-b000-000000000a0a', 'e2000000-0000-4000-a000-000000000101', 0, 'Madeira, e o telefone não funcionava porque a madeira não é um bom condutor de eletricidade.', false),
  ('e2000000-0000-4000-b000-000000000a0b', 'e2000000-0000-4000-a000-000000000101', 1, 'Metal, e o telefone não funcionava devido à blindagem eletrostática que o metal proporcionava.', true),
  ('e2000000-0000-4000-b000-000000000a0c', 'e2000000-0000-4000-a000-000000000101', 2, 'Metal, e o telefone não funcionava porque o metal refletia todo tipo de radiação que nele incidia.', false),
  ('e2000000-0000-4000-b000-000000000a0d', 'e2000000-0000-4000-a000-000000000101', 3, 'Metal, e o telefone não funcionava porque a área lateral da caixa de metal era maior.', false),
  ('e2000000-0000-4000-b000-000000000a0e', 'e2000000-0000-4000-a000-000000000101', 4, 'Madeira, e o telefone não funcionava porque a espessura desta caixa era maior que a espessura da caixa de metal.', false),
  ('e2000000-0000-4000-b000-000000000a14', 'e2000000-0000-4000-a000-000000000102', 0, 'No processo há liberação de oxigênio, sob a forma de O2', false),
  ('e2000000-0000-4000-b000-000000000a15', 'e2000000-0000-4000-a000-000000000102', 1, 'O coeficiente estequiométrico para a água é de 8 para 1 do octano.', false),
  ('e2000000-0000-4000-b000-000000000a16', 'e2000000-0000-4000-a000-000000000102', 2, 'No processo há consumo de água, para que haja liberação de energia.', false),
  ('e2000000-0000-4000-b000-000000000a17', 'e2000000-0000-4000-a000-000000000102', 3, 'O coeficiente estequiométrico para o oxigênio é de 12,5 para 1 do octano.', true),
  ('e2000000-0000-4000-b000-000000000a18', 'e2000000-0000-4000-a000-000000000102', 4, 'O coeficiente estequiométrico para o gás carbônico é de 9 para 1 do octano', false),
  ('e2000000-0000-4000-b000-000000000a1e', 'e2000000-0000-4000-a000-000000000103', 0, '![](conteudo/enem/2010/80-a-5e9669d9.webp)', false),
  ('e2000000-0000-4000-b000-000000000a1f', 'e2000000-0000-4000-a000-000000000103', 1, '![](conteudo/enem/2010/80-b-cde51055.webp)', false),
  ('e2000000-0000-4000-b000-000000000a20', 'e2000000-0000-4000-a000-000000000103', 2, '![](conteudo/enem/2010/80-c-94ed9a7e.webp)', false),
  ('e2000000-0000-4000-b000-000000000a21', 'e2000000-0000-4000-a000-000000000103', 3, '![](conteudo/enem/2010/80-d-e2099086.webp)', false),
  ('e2000000-0000-4000-b000-000000000a22', 'e2000000-0000-4000-a000-000000000103', 4, '![](conteudo/enem/2010/80-e-3f99d9ae.webp)', true),
  ('e2000000-0000-4000-b000-000000000a28', 'e2000000-0000-4000-a000-000000000104', 0, 'Escultura flutuará, desta forma, os homens não precisarão fazer força para remover a escultura do fundo.', false),
  ('e2000000-0000-4000-b000-000000000a29', 'e2000000-0000-4000-a000-000000000104', 1, 'Escultura ficará como peso menor. Desta forma, a intensidade da força necessária para elevar a escultura será menor.', false),
  ('e2000000-0000-4000-b000-000000000a2a', 'e2000000-0000-4000-a000-000000000104', 2, 'Água exercerá uma força na escultura proporcional a sua massa, e para cima. Esta força se somará à força que os trabalhadores fazem para anular a ação da força peso da escultura.', false),
  ('e2000000-0000-4000-b000-000000000a2b', 'e2000000-0000-4000-a000-000000000104', 3, 'Água exercerá uma força na escultura para baixo, e esta passará a receber uma força ascendente do piso da piscina. Esta força ajudará a anular a ação da força peso na escultura.', false),
  ('e2000000-0000-4000-b000-000000000a2c', 'e2000000-0000-4000-a000-000000000104', 4, 'Água exercerá uma força na escultura proporcional ao seu volume, e para cima. Esta força se somará à força que os trabalhadores fazem, podendo resultar em uma força ascendente maior que o peso da escultura.', true),
  ('e2000000-0000-4000-b000-000000000a32', 'e2000000-0000-4000-a000-000000000105', 0, 'As moléculas X e Y atuam como extratores catiônicos uma vez que a parte polar da molécula troca o íon H+ pelo cátion do metal.', true),
  ('e2000000-0000-4000-b000-000000000a33', 'e2000000-0000-4000-a000-000000000105', 1, 'As moléculas X e Y atuam como extratores aniônicos uma vez que a parte polar da molécula troca o íon H+ pelo cátion do metal.', false),
  ('e2000000-0000-4000-b000-000000000a34', 'e2000000-0000-4000-a000-000000000105', 2, 'As moléculas X e Y atuam como extratores catiônicos uma vez que a parte polar da molécula troca o íon PO2-2 pelo cátion do metal.', false),
  ('e2000000-0000-4000-b000-000000000a35', 'e2000000-0000-4000-a000-000000000105', 3, 'As moléculas X e Y atuam como extratores aniônicos uma vez que a parte polar da molécula troca o íon PO2-2 pelo cátion do metal.', false),
  ('e2000000-0000-4000-b000-000000000a36', 'e2000000-0000-4000-a000-000000000105', 4, 'As moléculas X e Y fazem ligações com os ions metálicos resultando em compostos com caráter apolar o que justifica a eficácia da extração.', false),
  ('e2000000-0000-4000-b000-000000000a3c', 'e2000000-0000-4000-a000-000000000106', 0, '0,02', false),
  ('e2000000-0000-4000-b000-000000000a3d', 'e2000000-0000-4000-a000-000000000106', 1, '0,2', true),
  ('e2000000-0000-4000-b000-000000000a3e', 'e2000000-0000-4000-a000-000000000106', 2, '2', false),
  ('e2000000-0000-4000-b000-000000000a3f', 'e2000000-0000-4000-a000-000000000106', 3, '200', false),
  ('e2000000-0000-4000-b000-000000000a40', 'e2000000-0000-4000-a000-000000000106', 4, '2000', false),
  ('e2000000-0000-4000-b000-000000000a46', 'e2000000-0000-4000-a000-000000000107', 0, '![](conteudo/enem/2010/84-a-c79b38d7.webp)', false),
  ('e2000000-0000-4000-b000-000000000a47', 'e2000000-0000-4000-a000-000000000107', 1, '![](conteudo/enem/2010/84-b-e9a2a50f.webp)', false),
  ('e2000000-0000-4000-b000-000000000a48', 'e2000000-0000-4000-a000-000000000107', 2, '![](conteudo/enem/2010/84-c-ae9996a3.webp)', false),
  ('e2000000-0000-4000-b000-000000000a49', 'e2000000-0000-4000-a000-000000000107', 3, '![](conteudo/enem/2010/84-d-6a342700.webp)', true),
  ('e2000000-0000-4000-b000-000000000a4a', 'e2000000-0000-4000-a000-000000000107', 4, '![](conteudo/enem/2010/84-e-3302afe8.webp)', false),
  ('e2000000-0000-4000-b000-000000000a50', 'e2000000-0000-4000-a000-000000000108', 0, 'Inibe a toxicidade do alumínio, elevando o pH dessas áreas.', true),
  ('e2000000-0000-4000-b000-000000000a51', 'e2000000-0000-4000-a000-000000000108', 1, 'Inibe a toxicidade do alumínio, reduzindo o pH dessas áreas.', false),
  ('e2000000-0000-4000-b000-000000000a52', 'e2000000-0000-4000-a000-000000000108', 2, 'Aumenta a toxicidade do alumínio, elevando o pH dessas áreas.', false),
  ('e2000000-0000-4000-b000-000000000a53', 'e2000000-0000-4000-a000-000000000108', 3, 'Aumenta a toxicidade do alumínio, reduzindo o pH dessas áreas.', false),
  ('e2000000-0000-4000-b000-000000000a54', 'e2000000-0000-4000-a000-000000000108', 4, 'Neutraliza a toxicidade do alumínio, reduzindo o pH dessas áreas.', false),
  ('e2000000-0000-4000-b000-000000000a5a', 'e2000000-0000-4000-a000-000000000109', 0, 'Animal A, lâmina B e gel A.', false),
  ('e2000000-0000-4000-b000-000000000a5b', 'e2000000-0000-4000-a000-000000000109', 1, 'Animal A, lâmina A e gel B.', false),
  ('e2000000-0000-4000-b000-000000000a5c', 'e2000000-0000-4000-a000-000000000109', 2, 'Animal B, lâmina A e gel B.', true),
  ('e2000000-0000-4000-b000-000000000a5d', 'e2000000-0000-4000-a000-000000000109', 3, 'Animal B, lâmina B e gel A.', false),
  ('e2000000-0000-4000-b000-000000000a5e', 'e2000000-0000-4000-a000-000000000109', 4, 'Animal A, lâmina B e gel B.', false),
  ('e2000000-0000-4000-b000-000000000a64', 'e2000000-0000-4000-a000-00000000010a', 0, 'A decomposição da cobertura morta dessas culturas resulta em economia na aquisição de adubos industrializados.', false),
  ('e2000000-0000-4000-b000-000000000a65', 'e2000000-0000-4000-a000-00000000010a', 1, 'O plantio de cana-de-açúcar propicia um solo mais adequado para o cultivo posterior da soja, do amendoim e do feijão.', false),
  ('e2000000-0000-4000-b000-000000000a66', 'e2000000-0000-4000-a000-00000000010a', 2, 'As leguminosas absorvem do solo elementos químicos diferentes dos absorvidos pela cana, restabelecendo o equilíbrio do solo.', false),
  ('e2000000-0000-4000-b000-000000000a67', 'e2000000-0000-4000-a000-00000000010a', 3, 'A queima dos restos de vegetais do cultivo da cana-de-açúcar transforma-se em cinzas, sendo reincorporadas ao solo, o que gera economia na aquisição de adubo.', false),
  ('e2000000-0000-4000-b000-000000000a68', 'e2000000-0000-4000-a000-00000000010a', 4, 'A soja, o amendoim e o feijão, além de possibilitarem a incorporação ao solo de determinadas moléculas disponíveis na atmosfera, são grãos comercializados no mercado produtivo.', true),
  ('e2000000-0000-4000-b000-000000000a6e', 'e2000000-0000-4000-a000-00000000010b', 0, 'Apresentou aumento do seu período de sono contínuo e passou a dormir durante o dia, pois seu ritmo biológico foi alterado apenas no período noturno.', false),
  ('e2000000-0000-4000-b000-000000000a6f', 'e2000000-0000-4000-a000-00000000010b', 1, 'Apresentou pouca alteração do seu ritmo circadiano, sendo que sua noção de tempo foi alterada somente pela sua falta de atenção à passagem do tempo.', false),
  ('e2000000-0000-4000-b000-000000000a70', 'e2000000-0000-4000-a000-00000000010b', 2, 'Estava com seu ritmo já alterado antes de entrar na sala, o que significa que apenas progrediu para um estado mais avançado de perda do ritmo biológico no escuro.', false),
  ('e2000000-0000-4000-b000-000000000a71', 'e2000000-0000-4000-a000-00000000010b', 3, 'Teve seu ritmo biológico alterado devido à ausência de luz e de contato com o mundo externo, no qual a noção de tempo de um dia é modulada pela presença ou ausência do sol.', true),
  ('e2000000-0000-4000-b000-000000000a72', 'e2000000-0000-4000-a000-00000000010b', 4, 'Deveria não ter apresentado nenhuma mudança do seu período de sono porque, na realidade, continua com seu ritmo normal, independentemente do ambiente em que seja colocada.', false),
  ('e2000000-0000-4000-b000-000000000a78', 'e2000000-0000-4000-a000-00000000010c', 0, 'Termoelétrica, pois é possível utilizar a água do rio no sistema de refrigeração.', false),
  ('e2000000-0000-4000-b000-000000000a79', 'e2000000-0000-4000-a000-00000000010c', 1, 'Eólica, pois a geografia do local é própria para a captação desse tipo de energia.', false),
  ('e2000000-0000-4000-b000-000000000a7a', 'e2000000-0000-4000-a000-00000000010c', 2, 'Nuclear, pois o modo de resfriamento de seus sistemas não afetariam a população.', false),
  ('e2000000-0000-4000-b000-000000000a7b', 'e2000000-0000-4000-a000-00000000010c', 3, 'Fotovoltaica, pois é possível aproveitar a energia solar que chega à superfície do local.', true),
  ('e2000000-0000-4000-b000-000000000a7c', 'e2000000-0000-4000-a000-00000000010c', 4, 'Hidrelétrica, pois o rio que corta o município é suficiente para abastecer a usina construída.', false),
  ('e2000000-0000-4000-b000-000000000a82', 'e2000000-0000-4000-a000-00000000010d', 0, 'O lixo é recolhido e incinerado pela combustão a altas temperaturas.', false),
  ('e2000000-0000-4000-b000-000000000a83', 'e2000000-0000-4000-a000-00000000010d', 1, 'O lixo hospitalar é separado para ser enterrado e sobre ele, colocada cal virgem.', false),
  ('e2000000-0000-4000-b000-000000000a84', 'e2000000-0000-4000-a000-00000000010d', 2, 'O lixo orgânico e inorgânico é encoberto, e o chorume canalizado para ser tratado e neutralizado.', true),
  ('e2000000-0000-4000-b000-000000000a85', 'e2000000-0000-4000-a000-00000000010d', 3, 'O lixo orgânico é completamente separado do lixo inorgânico, evitando a formação de chorume.', false),
  ('e2000000-0000-4000-b000-000000000a86', 'e2000000-0000-4000-a000-00000000010d', 4, 'O lixo industrial é separado e acondicionado de forma adequada, formando uma bolsa de resíduos.', false),
  ('e2000000-0000-4000-b000-000000000a8c', 'e2000000-0000-4000-a000-00000000010e', 0, 'O consultaras autoridades para verificar a possibilidade de viagem.', false),
  ('e2000000-0000-4000-b000-000000000a8d', 'e2000000-0000-4000-a000-00000000010e', 1, 'Ter um certificado especial tirado em outubro de 2004.', false),
  ('e2000000-0000-4000-b000-000000000a8e', 'e2000000-0000-4000-a000-00000000010e', 2, 'Tirar o passaporte do animal e logo vaciná-lo.', false),
  ('e2000000-0000-4000-b000-000000000a8f', 'e2000000-0000-4000-a000-00000000010e', 3, 'Vacinar o animal contra todas as doenças.', false),
  ('e2000000-0000-4000-b000-000000000a90', 'e2000000-0000-4000-a000-00000000010e', 4, 'Vacinar o animal e depois solicitar o passaporte dele.', true),
  ('e2000000-0000-4000-b000-000000000a96', 'e2000000-0000-4000-a000-00000000010f', 0, 'Aos responsáveis pela divulgação desta informação na internet.', false),
  ('e2000000-0000-4000-b000-000000000a97', 'e2000000-0000-4000-a000-00000000010f', 1, 'Às marcas mais importantes de microcomputadores do mercado.', false),
  ('e2000000-0000-4000-b000-000000000a98', 'e2000000-0000-4000-a000-00000000010f', 2, 'Aos nomes dos americanos que inventaram a suposta tecnologia.', false),
  ('e2000000-0000-4000-b000-000000000a99', 'e2000000-0000-4000-a000-00000000010f', 3, 'Aos sites da internet pelos quais o produto já pode ser conhecido.', false),
  ('e2000000-0000-4000-b000-000000000a9a', 'e2000000-0000-4000-a000-00000000010f', 4, 'Às empresas que levam vantagem para serem suas concorrentes.', true),
  ('e2000000-0000-4000-b000-000000000aa0', 'e2000000-0000-4000-a000-000000000110', 0, 'O guarani continua sendo usado pelos paraguaios, mesmo sem a escola e apesar dela.', false),
  ('e2000000-0000-4000-b000-000000000aa1', 'e2000000-0000-4000-a000-000000000110', 1, 'O ensino médio no Paraguai, sem o guarani, desmereceria todo o trabalho realizado e as esperanças acumuladas.', false),
  ('e2000000-0000-4000-b000-000000000aa2', 'e2000000-0000-4000-a000-000000000110', 2, 'A língua guarani encontrou uma funcionalidade real que assegura sua reprodução e continuidade, mas só isso não basta.', false),
  ('e2000000-0000-4000-b000-000000000aa3', 'e2000000-0000-4000-a000-000000000110', 3, 'A introdução do guarani nas escolas potencializou a difusão da língua, mas é necessário que haja uma postura ética em seu ensino.', true),
  ('e2000000-0000-4000-b000-000000000aa4', 'e2000000-0000-4000-a000-000000000110', 4, 'O bilinguismo na maneira de ensinar o guarani tem causado estragos contra a língua, a cultura e a lealdade dos paraguaios ao guarani.', false),
  ('e2000000-0000-4000-b000-000000000aaa', 'e2000000-0000-4000-a000-000000000111', 0, 'Costumava ter o mundo aos seus pés e, de repente, se viu sem nada.', true),
  ('e2000000-0000-4000-b000-000000000aab', 'e2000000-0000-4000-a000-000000000111', 1, 'Almeja o título de rei e, por ele, tem enfrentado inúmeros inimigos.', false),
  ('e2000000-0000-4000-b000-000000000aac', 'e2000000-0000-4000-a000-000000000111', 2, 'Causa pouco temor a seus inimigos, embora tenha muito poder.', false),
  ('e2000000-0000-4000-b000-000000000aad', 'e2000000-0000-4000-a000-000000000111', 3, 'Limpava as ruas e, com seu esforço, tornou-se rei de seu povo.', false),
  ('e2000000-0000-4000-b000-000000000aae', 'e2000000-0000-4000-a000-000000000111', 4, 'Tinha a chave para todos os castelos nos quais desejava morar.', false),
  ('e2000000-0000-4000-b000-000000000ab4', 'e2000000-0000-4000-a000-000000000112', 0, 'Falta de continuidade do ensino do guarani nos programas escolares.', false),
  ('e2000000-0000-4000-b000-000000000ab5', 'e2000000-0000-4000-a000-000000000112', 1, 'Preconceito existente contra o guarani principalmente nas escolas.', false),
  ('e2000000-0000-4000-b000-000000000ab6', 'e2000000-0000-4000-a000-000000000112', 2, 'Esperança acumulada na reforma educativa da educação média.', false),
  ('e2000000-0000-4000-b000-000000000ab7', 'e2000000-0000-4000-a000-000000000112', 3, 'Inclusão e permanência do ensino do guarani nas escolas.', true),
  ('e2000000-0000-4000-b000-000000000ab8', 'e2000000-0000-4000-a000-000000000112', 4, 'Continuísmo do ensino do castelhano nos centros urbanos.', false),
  ('e2000000-0000-4000-b000-000000000abe', 'e2000000-0000-4000-a000-000000000113', 0, 'O aborrecimento do cidadão britânico ao falar sobre banalidades.', false),
  ('e2000000-0000-4000-b000-000000000abf', 'e2000000-0000-4000-a000-000000000113', 1, 'A falta de ter o que falar em situações de avaliação de línguas.', false),
  ('e2000000-0000-4000-b000-000000000ac0', 'e2000000-0000-4000-a000-000000000113', 2, 'A importância de se entender sobre meteorologia para falar inglês.', false),
  ('e2000000-0000-4000-b000-000000000ac1', 'e2000000-0000-4000-a000-000000000113', 3, 'As diferenças e as particularidades culturais no uso de uma língua.', true),
  ('e2000000-0000-4000-b000-000000000ac2', 'e2000000-0000-4000-a000-000000000113', 4, 'O conflito entre diferentes ideias e opiniões ao se comunicar em inglês.', false),
  ('e2000000-0000-4000-b000-000000000ac8', 'e2000000-0000-4000-a000-000000000114', 0, 'Estilo de vida interfere no ganho de peso.', false),
  ('e2000000-0000-4000-b000-000000000ac9', 'e2000000-0000-4000-a000-000000000114', 1, 'Estudo mostra expectativa de vida dos fumantes.', false),
  ('e2000000-0000-4000-b000-000000000aca', 'e2000000-0000-4000-a000-000000000114', 2, 'Pessoas que fumam podem se tornar anoréxicas.', false),
  ('e2000000-0000-4000-b000-000000000acb', 'e2000000-0000-4000-a000-000000000114', 3, 'Fumantes engordam mais que não fumantes.', true),
  ('e2000000-0000-4000-b000-000000000acc', 'e2000000-0000-4000-a000-000000000114', 4, 'Tabagismo como fator de emagrecimento.', false),
  ('e2000000-0000-4000-b000-000000000ad2', 'e2000000-0000-4000-a000-000000000115', 0, 'O combate à AIDS e a melhoria do ensino universitário.', false),
  ('e2000000-0000-4000-b000-000000000ad3', 'e2000000-0000-4000-a000-000000000115', 1, 'A redução da mortalidade adulta e a criação de parcerias globais.', false),
  ('e2000000-0000-4000-b000-000000000ad4', 'e2000000-0000-4000-a000-000000000115', 2, 'A promoção da igualdade de gêneros e a erradicação da pobreza.', true),
  ('e2000000-0000-4000-b000-000000000ad5', 'e2000000-0000-4000-a000-000000000115', 3, 'A parceria global para o desenvolvimento e a valorização das crianças.', false),
  ('e2000000-0000-4000-b000-000000000ad6', 'e2000000-0000-4000-a000-000000000115', 4, 'A garantia da sustentabilidade ambiental e o combate ao trabalho infantil.', false),
  ('e2000000-0000-4000-b000-000000000adc', 'e2000000-0000-4000-a000-000000000116', 0, 'Atrair a atenção do público alvo dessa propaganda.', true),
  ('e2000000-0000-4000-b000-000000000add', 'e2000000-0000-4000-a000-000000000116', 1, 'Popularizar a prática de exercícios esportivos.', false),
  ('e2000000-0000-4000-b000-000000000ade', 'e2000000-0000-4000-a000-000000000116', 2, 'Agradar aos compradores ingleses desse tênis.', false),
  ('e2000000-0000-4000-b000-000000000adf', 'e2000000-0000-4000-a000-000000000116', 3, 'Incentivar os espanhóis a falarem outras línguas.', false),
  ('e2000000-0000-4000-b000-000000000ae0', 'e2000000-0000-4000-a000-000000000116', 4, 'Enfatizar o conhecimento de mundo do autor do texto.', false),
  ('e2000000-0000-4000-b000-000000000ae6', 'e2000000-0000-4000-a000-000000000117', 0, 'Comunicar o endereço da nova sede do projeto nos Estados Unidos.', false),
  ('e2000000-0000-4000-b000-000000000ae7', 'e2000000-0000-4000-a000-000000000117', 1, 'Convidar colecionadores de cartões-postais a se reunirem em um evento.', false),
  ('e2000000-0000-4000-b000-000000000ae8', 'e2000000-0000-4000-a000-000000000117', 2, 'Anunciar uma nova coleção de selos para angariar fundos para a Antártica.', false),
  ('e2000000-0000-4000-b000-000000000ae9', 'e2000000-0000-4000-a000-000000000117', 3, 'Divulgar às pessoas a possibilidade de receberem um cartão-postal da Antártica.', true),
  ('e2000000-0000-4000-b000-000000000aea', 'e2000000-0000-4000-a000-000000000117', 4, 'Solicitar que as pessoas visitem o site do mencionado projeto com maior frequência.', false),
  ('e2000000-0000-4000-b000-000000000af0', 'e2000000-0000-4000-a000-000000000118', 0, 'A opção pelo emprego da forma verbal “era” em lugar de “foi”.', false),
  ('e2000000-0000-4000-b000-000000000af1', 'e2000000-0000-4000-a000-000000000118', 1, 'A ausência de artigo antes da palavra “árvore”.', false),
  ('e2000000-0000-4000-b000-000000000af2', 'e2000000-0000-4000-a000-000000000118', 2, 'O emprego da redução “tá” em lugar da forma verbal “está”.', true),
  ('e2000000-0000-4000-b000-000000000af3', 'e2000000-0000-4000-a000-000000000118', 3, 'O uso da contração “desse” em lugar da expressão “de esse”.', false),
  ('e2000000-0000-4000-b000-000000000af4', 'e2000000-0000-4000-a000-000000000118', 4, 'A utilização do pronome “que” em início de frase exclamativa.', false),
  ('e2000000-0000-4000-b000-000000000afa', 'e2000000-0000-4000-a000-000000000119', 0, 'Emotiva, porque o autor expressa seu sentimento em relação à ecologia.', false),
  ('e2000000-0000-4000-b000-000000000afb', 'e2000000-0000-4000-a000-000000000119', 1, 'Fática, porque o texto testa o funcionamento do canal de comunicação.', false),
  ('e2000000-0000-4000-b000-000000000afc', 'e2000000-0000-4000-a000-000000000119', 2, 'Poética, porque o texto chama a atenção para os recursos de linguagem.', false),
  ('e2000000-0000-4000-b000-000000000afd', 'e2000000-0000-4000-a000-000000000119', 3, 'Conativa, porque o texto procura orientar comportamentos do leitor.', false),
  ('e2000000-0000-4000-b000-000000000afe', 'e2000000-0000-4000-a000-000000000119', 4, 'Referencial, porque o texto trata de noções e informações conceituais.', true),
  ('e2000000-0000-4000-b000-000000000b04', 'e2000000-0000-4000-a000-00000000011a', 0, 'Vender um produto anunciado.', false),
  ('e2000000-0000-4000-b000-000000000b05', 'e2000000-0000-4000-a000-00000000011a', 1, 'Informar sobre astronomia.', false),
  ('e2000000-0000-4000-b000-000000000b06', 'e2000000-0000-4000-a000-00000000011a', 2, 'Ensinar os cuidados com a saúde.', false),
  ('e2000000-0000-4000-b000-000000000b07', 'e2000000-0000-4000-a000-00000000011a', 3, 'Expor a opinião de leitores em um jornal.', false),
  ('e2000000-0000-4000-b000-000000000b08', 'e2000000-0000-4000-a000-00000000011a', 4, 'Aconselhar sobre amor, família, saúde, trabalho.', true),
  ('e2000000-0000-4000-b000-000000000b0e', 'e2000000-0000-4000-a000-00000000011b', 0, 'Regional, pela presença de léxico de determinada região do Brasil.', false),
  ('e2000000-0000-4000-b000-000000000b0f', 'e2000000-0000-4000-a000-00000000011b', 1, 'Literário, pela conformidade com as normas da gramática.', false),
  ('e2000000-0000-4000-b000-000000000b10', 'e2000000-0000-4000-a000-00000000011b', 2, 'Técnico, por meio de expressões próprias de textos científicos.', true),
  ('e2000000-0000-4000-b000-000000000b11', 'e2000000-0000-4000-a000-00000000011b', 3, 'Coloquial, por meio do registro de informalidade.', false),
  ('e2000000-0000-4000-b000-000000000b12', 'e2000000-0000-4000-a000-00000000011b', 4, 'Oral, por meio do uso de expressões típicas da oralidade.', false),
  ('e2000000-0000-4000-b000-000000000b18', 'e2000000-0000-4000-a000-00000000011c', 0, '![](conteudo/enem/2010/100-a-a1ca9a6c.webp)', false),
  ('e2000000-0000-4000-b000-000000000b19', 'e2000000-0000-4000-a000-00000000011c', 1, '![](conteudo/enem/2010/100-b-6cda2bf3.webp)', false),
  ('e2000000-0000-4000-b000-000000000b1a', 'e2000000-0000-4000-a000-00000000011c', 2, '![](conteudo/enem/2010/100-c-bf9cdbd5.webp)', true),
  ('e2000000-0000-4000-b000-000000000b1b', 'e2000000-0000-4000-a000-00000000011c', 3, '![](conteudo/enem/2010/100-d-a666d33f.webp)', false),
  ('e2000000-0000-4000-b000-000000000b1c', 'e2000000-0000-4000-a000-00000000011c', 4, '![](conteudo/enem/2010/100-e-3f6fed9e.webp)', false),
  ('e2000000-0000-4000-b000-000000000b22', 'e2000000-0000-4000-a000-00000000011d', 0, 'Influenciar o comportamento do leitor, por meio de apelos que visam à adesão ao consumo.', true),
  ('e2000000-0000-4000-b000-000000000b23', 'e2000000-0000-4000-a000-00000000011d', 1, 'Definir regras de comportamento social pautadas no combate ao consumismo exagerado.', false),
  ('e2000000-0000-4000-b000-000000000b24', 'e2000000-0000-4000-a000-00000000011d', 2, 'Defender a importância do conhecimento de informática pela população de baixo poder aquisitivo.', false),
  ('e2000000-0000-4000-b000-000000000b25', 'e2000000-0000-4000-a000-00000000011d', 3, 'Facilitar o uso de equipamentos de informática pelas classes sociais economicamente desfavorecidas', false),
  ('e2000000-0000-4000-b000-000000000b26', 'e2000000-0000-4000-a000-00000000011d', 4, 'Questionar o fato de o homem ser mais inteligente que a máquina, mesmo a mais moderna.', false),
  ('e2000000-0000-4000-b000-000000000b2c', 'e2000000-0000-4000-a000-00000000011e', 0, '“Marquei umas alternativas esdrúxulas, que nada tinham a ver”.', false),
  ('e2000000-0000-4000-b000-000000000b2d', 'e2000000-0000-4000-a000-00000000011e', 1, '“Os acontecimentos da sua infância a marcaram até os doze anos”.', false),
  ('e2000000-0000-4000-b000-000000000b2e', 'e2000000-0000-4000-a000-00000000011e', 2, '“Dia desses resolvi fazer um teste proposto por um site da internet”.', false),
  ('e2000000-0000-4000-b000-000000000b2f', 'e2000000-0000-4000-a000-00000000011e', 3, '“Respondi a todas as perguntas e o resultado foi o seguinte”.', false),
  ('e2000000-0000-4000-b000-000000000b30', 'e2000000-0000-4000-a000-00000000011e', 4, '“Fiquei radiante: eu havia realizado uma consulta paranormal com o pai da psicanálise”.', true),
  ('e2000000-0000-4000-b000-000000000b36', 'e2000000-0000-4000-a000-00000000011f', 0, 'Descrever e fornecer orientações sobre a síndrome da compulsão alimentícia.', false),
  ('e2000000-0000-4000-b000-000000000b37', 'e2000000-0000-4000-a000-00000000011f', 1, 'Narrar a vida das pessoas que têm o transtorno do comer compulsivo.', false),
  ('e2000000-0000-4000-b000-000000000b38', 'e2000000-0000-4000-a000-00000000011f', 2, 'Aconselhar as pessoas obesas a perder peso com métodos simples.', false),
  ('e2000000-0000-4000-b000-000000000b39', 'e2000000-0000-4000-a000-00000000011f', 3, 'Expor de forma geral o transtorno compulsivo por alimentação. E', true),
  ('e2000000-0000-4000-b000-000000000b3a', 'e2000000-0000-4000-a000-00000000011f', 4, 'Encaminhar as pessoas para a mudança de hábitos alimentícios.', false),
  ('e2000000-0000-4000-b000-000000000b40', 'e2000000-0000-4000-a000-000000000120', 0, 'Apresenta fatos que estabelecem entre si relações de causa e de consequência.', false),
  ('e2000000-0000-4000-b000-000000000b41', 'e2000000-0000-4000-a000-000000000120', 1, 'Descreve condições para a ocorrência de atitudes educadas.', false),
  ('e2000000-0000-4000-b000-000000000b42', 'e2000000-0000-4000-a000-000000000120', 2, 'Indica a finalidade pela qual a gentileza pode ser praticada.', false),
  ('e2000000-0000-4000-b000-000000000b43', 'e2000000-0000-4000-a000-000000000120', 3, 'Enumera fatos sucessivos em uma relação temporal.', false),
  ('e2000000-0000-4000-b000-000000000b44', 'e2000000-0000-4000-a000-000000000120', 4, 'Mostra oposição e acrescenta ideias.', true),
  ('e2000000-0000-4000-b000-000000000b4a', 'e2000000-0000-4000-a000-000000000121', 0, 'Retratar, em suas obras, as cores que idealizavam de acordo com o reflexo da luz solar nos objetos.', false),
  ('e2000000-0000-4000-b000-000000000b4b', 'e2000000-0000-4000-a000-000000000121', 1, 'Usar mais a cor preta, fazendo contornos nítidos, que melhor definiam as imagens e as cores do objeto representado.', false),
  ('e2000000-0000-4000-b000-000000000b4c', 'e2000000-0000-4000-a000-000000000121', 2, 'Retratar paisagens em diferentes horas do dia, recriando, em suas telas, as imagens por eles idealizadas.', false),
  ('e2000000-0000-4000-b000-000000000b4d', 'e2000000-0000-4000-a000-000000000121', 3, 'Usar pinceladas rápidas de cores puras e dissociadas diretamente na tela, sem misturá-las antes na paleta.', true),
  ('e2000000-0000-4000-b000-000000000b4e', 'e2000000-0000-4000-a000-000000000121', 4, 'Usar as sombras em tons de cinza e preto e com efeitos esfumaçados, tal como eram realizadas no Renascimento.', false),
  ('e2000000-0000-4000-b000-000000000b54', 'e2000000-0000-4000-a000-000000000122', 0, 'O Bumba-meu-boi, que é uma dança teatral onde personagens contam uma história envolvendo crítica social, morte e ressurreição.', false),
  ('e2000000-0000-4000-b000-000000000b55', 'e2000000-0000-4000-a000-000000000122', 1, 'A Quadrilha das festas juninas, que associam festejos religiosos a celebrações de origens pagãs envolvendo as colheitas e a fogueira.', false),
  ('e2000000-0000-4000-b000-000000000b56', 'e2000000-0000-4000-a000-000000000122', 2, 'O Congado, que é uma representação de um reinado africano onde se homenageia santos através de música, cantos e dança.', false),
  ('e2000000-0000-4000-b000-000000000b57', 'e2000000-0000-4000-a000-000000000122', 3, 'O Balé, em que se utilizam músicos, bailarinos e vários outros profissionais para contar uma história em forma de espetáculo.', true),
  ('e2000000-0000-4000-b000-000000000b58', 'e2000000-0000-4000-a000-000000000122', 4, 'O Carnaval, em que o samba derivado do batuque africano é utilizado com o objetivo de contar ou recriar uma história nos desfiles.', false),
  ('e2000000-0000-4000-b000-000000000b5e', 'e2000000-0000-4000-a000-000000000123', 0, 'Estrangeirismo, uso de elementos linguísticos originados em outras línguas e representativos de outras culturas.', false),
  ('e2000000-0000-4000-b000-000000000b5f', 'e2000000-0000-4000-a000-000000000123', 1, 'Neologismo, criação de novos itens linguísticos, pelos mecanismos que o sistema da língua disponibiliza.', true),
  ('e2000000-0000-4000-b000-000000000b60', 'e2000000-0000-4000-a000-000000000123', 2, 'Gíria, que compõe uma linguagem originada em determinado grupo social e que pode vir a se disseminar em uma comunidade mais ampla.', false),
  ('e2000000-0000-4000-b000-000000000b61', 'e2000000-0000-4000-a000-000000000123', 3, 'Regionalismo, por ser palavra característica de determinada área geográfica.', false),
  ('e2000000-0000-4000-b000-000000000b62', 'e2000000-0000-4000-a000-000000000123', 4, 'Termo técnico, dado que designa elemento de área a de atividade.', false),
  ('e2000000-0000-4000-b000-000000000b68', 'e2000000-0000-4000-a000-000000000124', 0, 'Possibilitará o acesso das diferentes regiões do país às informações antes restritas, uma vez que eliminará as distâncias, por meio da distribuição virtual.', false),
  ('e2000000-0000-4000-b000-000000000b69', 'e2000000-0000-4000-a000-000000000124', 1, 'Criará a expectativa de viabilizar a democratização da leitura, porém, esbarra na insuficiência do acesso à internet por meio da telefonia celular, ainda deficiente no país.', true),
  ('e2000000-0000-4000-b000-000000000b6a', 'e2000000-0000-4000-a000-000000000124', 2, 'Fará com que os livros impressos tornem-se obsoletos, em razão da diminuição dos gastos com os produtos digitais gratuitamente distribuídos pela internet.', false),
  ('e2000000-0000-4000-b000-000000000b6b', 'e2000000-0000-4000-a000-000000000124', 3, 'Garantirá a democratização dos usos da tecnologia no país, levando em consideração as características de cada região no que se refere aos hábitos de leitura e acesso à informação.', false),
  ('e2000000-0000-4000-b000-000000000b6c', 'e2000000-0000-4000-a000-000000000124', 4, 'Impulsionará o crescimento da qualidade da leitura dos brasileiros, uma vez que as características do produto permitem que a leitura aconteça a despeito das adversidades geopolíticas.', false),
  ('e2000000-0000-4000-b000-000000000b72', 'e2000000-0000-4000-a000-000000000125', 0, 'Possibilita que ocorra diálogo sem a exposição da identidade real dos indivíduos, que podem recorrer a apelidos fictícios sem comprometer o fluxo da comunicação em tempo real.', true),
  ('e2000000-0000-4000-b000-000000000b73', 'e2000000-0000-4000-a000-000000000125', 1, 'Disponibiliza salas de bate-papo sobre diferentes assuntos com pessoas pré-selecionadas por meio de um sistema de busca monitorado e atualizado por autoridades no assunto.', false),
  ('e2000000-0000-4000-b000-000000000b74', 'e2000000-0000-4000-a000-000000000125', 2, 'Seleciona previamente conteúdos adequados à faixa etária dos usuários que serão distribuídos nas faixas de idade organizadas pelo site que disponibiliza a ferramenta.', false),
  ('e2000000-0000-4000-b000-000000000b75', 'e2000000-0000-4000-a000-000000000125', 3, 'Garante a gravação das conversas, o que possibilita que um diálogo permaneça aberto, independente da disposição de cada participante.', false),
  ('e2000000-0000-4000-b000-000000000b76', 'e2000000-0000-4000-a000-000000000125', 4, 'Limita a quantidade de participantes conectados nas salas de bate-papo, a fim de garantir a qualidade e eficiência dos diálogos, evitando mal-entendidos.', false),
  ('e2000000-0000-4000-b000-000000000b7c', 'e2000000-0000-4000-a000-000000000126', 0, 'A velocidade, que permite ao músculo executar uma sucessão rápida de gestos em movimentação de intensidade máxima.', false),
  ('e2000000-0000-4000-b000-000000000b7d', 'e2000000-0000-4000-a000-000000000126', 1, 'A resistência, que admite a realização de movimentos durante considerável período de tempo, sem perda da qualidade da execução.', false),
  ('e2000000-0000-4000-b000-000000000b7e', 'e2000000-0000-4000-a000-000000000126', 2, 'A flexibilidade, que permite a amplitude máxima de um movimento, em uma ou mais articulações, sem causar lesões.', true),
  ('e2000000-0000-4000-b000-000000000b7f', 'e2000000-0000-4000-a000-000000000126', 3, 'A agilidade, que possibilita a execução de movimentos rápidos e ligeiros com mudanças de direção.', false),
  ('e2000000-0000-4000-b000-000000000b80', 'e2000000-0000-4000-a000-000000000126', 4, 'O equilíbrio, que permite a realização dos mais variados movimentos, com o objetivo de sustentar o corpo sobre uma base.', false),
  ('e2000000-0000-4000-b000-000000000b86', 'e2000000-0000-4000-a000-000000000127', 0, 'Adverte os leitores de que a internet pode transformar-se em um problema porque expõe a vida dos usuários e, por isso, precisa ser investigada.', false),
  ('e2000000-0000-4000-b000-000000000b87', 'e2000000-0000-4000-a000-000000000127', 1, 'Ensina aos leitores os procedimentos necessários para que as pessoas conheçam, em profundidade, os principais meios de comunicação da atualidade.', false),
  ('e2000000-0000-4000-b000-000000000b88', 'e2000000-0000-4000-a000-000000000127', 2, 'Exemplifica e explica o novo serviço global de mensagens rápidas que desafia os hábitos de comunicação e reinventa o conceito de privacidade.', true),
  ('e2000000-0000-4000-b000-000000000b89', 'e2000000-0000-4000-a000-000000000127', 3, 'Procura esclarecer os leitores a respeito dos perigos que o uso do Twitter pode representar nas relações de trabalho e também no plano pessoal.', false),
  ('e2000000-0000-4000-b000-000000000b8a', 'e2000000-0000-4000-a000-000000000127', 4, 'Apresenta uma enquete sobre as redes sociais mais usadas na atualidade e mostra que o Twitter é preferido entre a maioria dos internautas.', false),
  ('e2000000-0000-4000-b000-000000000b90', 'e2000000-0000-4000-a000-000000000128', 0, 'Apresenta argumentos contrários à pesca ilegal.', true),
  ('e2000000-0000-4000-b000-000000000b91', 'e2000000-0000-4000-a000-000000000128', 1, 'Tem um título que resume o conteúdo do texto.', false),
  ('e2000000-0000-4000-b000-000000000b92', 'e2000000-0000-4000-a000-000000000128', 2, 'Informa sobre uma ação, a finalidade que a motivou e o resultado dessa ação.', false),
  ('e2000000-0000-4000-b000-000000000b93', 'e2000000-0000-4000-a000-000000000128', 3, 'Dirige-se aos órgãos governamentais dos estados envolvidos na referida operação do Ibama.', false),
  ('e2000000-0000-4000-b000-000000000b94', 'e2000000-0000-4000-a000-000000000128', 4, 'Introduz um fato com a finalidade de incentivar movimentos sociais em defesa do meio ambiente.', false),
  ('e2000000-0000-4000-b000-000000000b9a', 'e2000000-0000-4000-a000-000000000129', 0, 'Expressa o mesmo conteúdo nas duas situações em que aparece no texto.', false),
  ('e2000000-0000-4000-b000-000000000b9b', 'e2000000-0000-4000-a000-000000000129', 1, 'Quebra a fluidez do texto e prejudica a compreensão, se usado no início da frase.', false),
  ('e2000000-0000-4000-b000-000000000b9c', 'e2000000-0000-4000-a000-000000000129', 2, 'Ocupa posição fixa, sendo inadequado seu uso na abertura da frase.', false),
  ('e2000000-0000-4000-b000-000000000b9d', 'e2000000-0000-4000-a000-000000000129', 3, 'Contém uma ideia de sequência temporal que direciona a conclusão do leitor.', false),
  ('e2000000-0000-4000-b000-000000000b9e', 'e2000000-0000-4000-a000-000000000129', 4, 'Assume funções discursivas distintas nos dois contextos de uso.', true),
  ('e2000000-0000-4000-b000-000000000ba4', 'e2000000-0000-4000-a000-00000000012a', 0, 'Enfatiza a herança da Inquisição em comportamentos culturais observados em Portugal e na Espanha.', false),
  ('e2000000-0000-4000-b000-000000000ba5', 'e2000000-0000-4000-a000-00000000012a', 1, 'Contesta sociólogos, psicólogos e historiadores sobre a manutenção de comportamentos gerados pela Inquisição.', true),
  ('e2000000-0000-4000-b000-000000000ba6', 'e2000000-0000-4000-a000-00000000012a', 2, 'Contrapõe argumentos de historiadores e sociólogos a respeito de comportamentos culturais inquisidores.', false),
  ('e2000000-0000-4000-b000-000000000ba7', 'e2000000-0000-4000-a000-00000000012a', 3, 'Relativiza comportamentos originados na Inquisição e observados na sociedade brasileira.', false),
  ('e2000000-0000-4000-b000-000000000ba8', 'e2000000-0000-4000-a000-00000000012a', 4, 'Questiona a existência de comportamentos culturais brasileiros marcados pela herança da Inquisição', false),
  ('e2000000-0000-4000-b000-000000000bae', 'e2000000-0000-4000-a000-00000000012b', 0, 'Cada língua é única e intraduzível.', false),
  ('e2000000-0000-4000-b000-000000000baf', 'e2000000-0000-4000-a000-00000000012b', 1, 'Elementos de uma língua são preservados, ainda que não haja mais falantes dessa língua.', true),
  ('e2000000-0000-4000-b000-000000000bb0', 'e2000000-0000-4000-a000-00000000012b', 2, 'A língua escrita de determinado grupo desaparece quando a sociedade que a produzia é extinta.', false),
  ('e2000000-0000-4000-b000-000000000bb1', 'e2000000-0000-4000-a000-00000000012b', 3, 'O egípcio antigo e o grego apresentam a mesma estrutura gramatical, assim como as línguas indígenas brasileiras e o português do Brasil.', false),
  ('e2000000-0000-4000-b000-000000000bb2', 'e2000000-0000-4000-a000-00000000012b', 4, 'O egípcio e o grego apresentavam letras e palavras similares, o que possibilitou a comparação linguística, o mesmo que aconteceu com as línguas indígenas brasileiras e o português do Brasil.', false),
  ('e2000000-0000-4000-b000-000000000bb8', 'e2000000-0000-4000-a000-00000000012c', 0, 'Fatos ficcionais, relacionados a outros de caráter realista, relativos à vida de um renomado escritor.', false),
  ('e2000000-0000-4000-b000-000000000bb9', 'e2000000-0000-4000-a000-00000000012c', 1, 'Representações generalizadas acerca da vida de membros da sociedade por seus trabalhos e vida cotidiana.', false),
  ('e2000000-0000-4000-b000-000000000bba', 'e2000000-0000-4000-a000-00000000012c', 2, 'Explicações da vida de um renomado escritor, com estrutura argumentativa, destacando como tema seus principais feitos.', false),
  ('e2000000-0000-4000-b000-000000000bbb', 'e2000000-0000-4000-a000-00000000012c', 3, 'Questões controversas e fatos diversos da vida de personalidade histórica, ressaltando sua intimidade familiar em detrimento de seus feitos públicos.', false),
  ('e2000000-0000-4000-b000-000000000bbc', 'e2000000-0000-4000-a000-00000000012c', 4, 'Apresentação da vida de uma personalidade, organizada sobretudo pela ordem tipológica da narração, com um estilo marcado por linguagem objetiva.', true),
  ('e2000000-0000-4000-b000-000000000bc2', 'e2000000-0000-4000-a000-00000000012d', 0, 'A angústia alimentada pela constatação da irreversibilidade da morte.', false),
  ('e2000000-0000-4000-b000-000000000bc3', 'e2000000-0000-4000-a000-00000000012d', 1, 'A melancolia que frustra a possibilidade de reação diante da perda.', true),
  ('e2000000-0000-4000-b000-000000000bc4', 'e2000000-0000-4000-a000-00000000012d', 2, 'O descontrole das emoções provocado pela autopiedade.', false),
  ('e2000000-0000-4000-b000-000000000bc5', 'e2000000-0000-4000-a000-00000000012d', 3, 'O desejo de morrer como alívio para a desilusão amorosa.', false),
  ('e2000000-0000-4000-b000-000000000bc6', 'e2000000-0000-4000-a000-00000000012d', 4, 'O gosto pela escuridão como solução para o sofrimento.', false),
  ('e2000000-0000-4000-b000-000000000bcc', 'e2000000-0000-4000-a000-00000000012e', 0, 'A linguagem afetiva aproxima os narradores dos personagens marginalizados.', false),
  ('e2000000-0000-4000-b000-000000000bcd', 'e2000000-0000-4000-a000-00000000012e', 1, 'A ironia marca o distanciamento dos narradores em relação aos personagens.', false),
  ('e2000000-0000-4000-b000-000000000bce', 'e2000000-0000-4000-a000-00000000012e', 2, 'O detalhamento do cotidiano dos personagens revela a sua origem social.', false),
  ('e2000000-0000-4000-b000-000000000bcf', 'e2000000-0000-4000-a000-00000000012e', 3, 'O espaço onde vivem os personagens é uma das marcas de sua exclusão.', true),
  ('e2000000-0000-4000-b000-000000000bd0', 'e2000000-0000-4000-a000-00000000012e', 4, 'A crítica à indiferença da sociedade pelos marginalizados é direta.', false),
  ('e2000000-0000-4000-b000-000000000bd6', 'e2000000-0000-4000-a000-00000000012f', 0, 'Acontece pelo fato de sua construção coletiva possibilitar a edição e reedição das informações por qualquer pessoa no mundo inteiro.', true),
  ('e2000000-0000-4000-b000-000000000bd7', 'e2000000-0000-4000-a000-00000000012f', 1, 'Imita a disseminação do saber, apesar do crescente número de acessos ao site que a abriga, por falta de legitimidade', false),
  ('e2000000-0000-4000-b000-000000000bd8', 'e2000000-0000-4000-a000-00000000012f', 2, 'Ocorre pela facilidade de acesso à página, o que torna a informação vulnerável, ou seja, pela dinâmica da mídia.', false),
  ('e2000000-0000-4000-b000-000000000bd9', 'e2000000-0000-4000-a000-00000000012f', 3, 'Ressalta a crescente busca das enciclopédias impressas para as pesquisas escolares.', false),
  ('e2000000-0000-4000-b000-000000000bda', 'e2000000-0000-4000-a000-00000000012f', 4, 'Revela o desconhecimento do usuário, impedindo-o de formar um juízo de valor sobre as informações.', false),
  ('e2000000-0000-4000-b000-000000000be0', 'e2000000-0000-4000-a000-000000000130', 0, 'Sacar e colocar a bola em jogo, defender a bola e realizar a cortada como forma de ataque.', true),
  ('e2000000-0000-4000-b000-000000000be1', 'e2000000-0000-4000-a000-000000000130', 1, 'Arremessar a bola, tocar para passar a bola ao levantador e bloquear como forma de ataque.', false),
  ('e2000000-0000-4000-b000-000000000be2', 'e2000000-0000-4000-a000-000000000130', 2, 'Tocar e colocar a bola em jogo, cortar para defender e levantar a bola para atacar.', false),
  ('e2000000-0000-4000-b000-000000000be3', 'e2000000-0000-4000-a000-000000000130', 3, 'Passar a bola e iniciar a partida, lançar a bola ao levantador e realizar a manchete para defender.', false),
  ('e2000000-0000-4000-b000-000000000be4', 'e2000000-0000-4000-a000-000000000130', 4, 'Cortar como forma de ataque, passar a bola para defender e bloquear como forma de ataque.', false),
  ('e2000000-0000-4000-b000-000000000bea', 'e2000000-0000-4000-a000-000000000131', 0, '"A academia (Brasileira de Letras) encara essa aprovação como um marco histórico. Inscreve-se, finalmente, a Língua Portuguesa no rol daquelas que conseguiram beneficiar-se há mais tempo da unificação de seu sistema de grafar, numa demonstração de consciência da política do idioma e de maturidade na defesa, difusão e ilustração da língua da Lusofonia.” SANDRONI, C. Presidente da ABL. Disponível em: http://www.academia.org.br. Acesso em: 10 nov. 2008.', false),
  ('e2000000-0000-4000-b000-000000000beb', 'e2000000-0000-4000-a000-000000000131', 1, '"Acordo Ortográfico? Não, obrigado. Sou contra. Visceralmente contra. Filosoficamente contra. Linguisticamente contra. Eu gosto do "c" do "actor" e o "p" de "cepticismo". Representam um patrimônio, uma pegada etimológica que faz parte de uma identidade cultural. A pluralidade é um valor que deve ser estudado e respeitado. Aceitar essa aberração significa apenas que a irmandade entre Portugal e Brasil continua a ser a irmandade do atraso. COUTINHO, J. P. Folha de São Paulo. Ilustrada. 28 set.2008, E1 (adaptado).', false),
  ('e2000000-0000-4000-b000-000000000bec', 'e2000000-0000-4000-a000-000000000131', 2, '"Há um conjunto de necessidades políticas  e econômicas que visa a internacionalização do português como identidade e marca econômica". "É possível que o Fernando (Pessoa), como produtor de exportação, valha mais do que a PT (Portugal Telecom). Tem um valor econômico único." RIBEIRO, J. A. P. Ministro da Cultura de Portugal. Disponível em: http://ultimahora.publico.clix.pt. Acesso em: 10 nov. 2008.', true),
  ('e2000000-0000-4000-b000-000000000bed', 'e2000000-0000-4000-a000-000000000131', 3, '"É um acto cívico batermo-nos contra o Acordo Ortográfico." "O Acordo não leva a unidade nenhuma." "Não se pode aplicar na ordem interna um instrumento que não está aceito internacionalmente” e nem assegura “a defesa da língua como património, como prevê a Constituição nos artigos 9º e 68º.” MOURA, V. G. Escritor e eurodeputado. Disponível em: www.mundoportugues.org. Acesso em: 10 nov. 2008.', false),
  ('e2000000-0000-4000-b000-000000000bee', 'e2000000-0000-4000-a000-000000000131', 4, '“Se é para ter uma lusofonia, o conceito [unificação da língua] deve ser mais abrangente e temos de estar em paridade. Unidade não significa que temos que andar todos ao mesmo passo. Não é necessário que nos tornemos homogéneos. Até porque o que enriquece a língua portuguesa são as diversas literaturas e formas de utilização.” RODRIGUES, M. H. Presidente do Instituto Português do Oriente, sediado em Macau. Disponível em: http://taichungpou.blogspot.com. Acesso em: 10 nov. 2008 (adaptado).', false),
  ('e2000000-0000-4000-b000-000000000bf4', 'e2000000-0000-4000-a000-000000000132', 0, 'A quantidade de cigarros consumidos por pessoa, diariamente, excede o máximo de nicotina recomendado para os indivíduos, inclusive para os não fumantes.', false),
  ('e2000000-0000-4000-b000-000000000bf5', 'e2000000-0000-4000-a000-000000000132', 1, 'Para garantir o prazer que o indivíduo tem ao fumar, será necessário aumentar as estatísticas de fumo passivo.', false),
  ('e2000000-0000-4000-b000-000000000bf6', 'e2000000-0000-4000-a000-000000000132', 2, 'A conscientização dos fumantes passivos é uma maneira de manter a privacidade de cada indivíduo e garantir a saúde de todos.', false),
  ('e2000000-0000-4000-b000-000000000bf7', 'e2000000-0000-4000-a000-000000000132', 3, 'Os não fumantes precisam ser respeitados e poupados, pois estes também estão sujeitos às doenças causadas pelo tabagismo.', true),
  ('e2000000-0000-4000-b000-000000000bf8', 'e2000000-0000-4000-a000-000000000132', 4, 'O fumante passivo não é obrigado a inalar as mesmas toxinas que um fumante, portanto depende dele evitar ou não a contaminação proveniente da exposição ao fumo.', false),
  ('e2000000-0000-4000-b000-000000000bfe', 'e2000000-0000-4000-a000-000000000133', 0, 'Do fantástico, impregnado de civismo pelo governo espanhol, em que a busca pela emoção e pela dramaticidade desenvolveram um estilo incomparável.', false),
  ('e2000000-0000-4000-b000-000000000bff', 'e2000000-0000-4000-a000-000000000133', 1, 'Do onírico, que misturava sonho com realidade e inconsciente como um universo único ou pessoal.', true),
  ('e2000000-0000-4000-b000-000000000c00', 'e2000000-0000-4000-a000-000000000133', 2, 'Da linha inflexível da razão, dando vazão a uma forma de produção despojada no traço, na temática e nas formas vinculadas ao real.', false),
  ('e2000000-0000-4000-b000-000000000c01', 'e2000000-0000-4000-a000-000000000133', 3, 'Do reflexo que, apesar do termo "paranoico", possui sobriedade e elegância advindas de uma técnica de cores discretas e desenhos precisos.', false),
  ('e2000000-0000-4000-b000-000000000c02', 'e2000000-0000-4000-a000-000000000133', 4, 'Da expressão e intensidade entre o consciente e a liberdade, declarando o amor pela forma de conduzir o enredo histórico dos personagens retratados.', false),
  ('e2000000-0000-4000-b000-000000000c08', 'e2000000-0000-4000-a000-000000000134', 0, 'Exaltar o emprego da língua figurada.', false),
  ('e2000000-0000-4000-b000-000000000c09', 'e2000000-0000-4000-a000-000000000134', 1, 'Criar suspense e despertar temor no leitor.', false),
  ('e2000000-0000-4000-b000-000000000c0a', 'e2000000-0000-4000-a000-000000000134', 2, 'Influenciar a opinião dos leitores sobre o tema, com as marcas argumentativas de seu posicionamento.', true),
  ('e2000000-0000-4000-b000-000000000c0b', 'e2000000-0000-4000-a000-000000000134', 3, 'Induzir o leitor a pensar que os satélites artificiais representam um grande perigo para toda a humanidade.', false),
  ('e2000000-0000-4000-b000-000000000c0c', 'e2000000-0000-4000-a000-000000000134', 4, 'Exercitar a ironia ao empregar “avenida congestionada”; “tráfego celeste tão intenso”; “montanha de lixo”.', false),
  ('e2000000-0000-4000-b000-000000000c12', 'e2000000-0000-4000-a000-000000000135', 0, 'Uma denúncia de quadrilhas que se organizam em torno do narcotráfico.', false),
  ('e2000000-0000-4000-b000-000000000c13', 'e2000000-0000-4000-a000-000000000135', 1, 'A constatação de que o narcotráfico restringe-se aos centros urbanos.', false),
  ('e2000000-0000-4000-b000-000000000c14', 'e2000000-0000-4000-a000-000000000135', 2, 'A informação de que as políticas sociais compensatórias eliminarão a atividade criminosa a longo prazo.', false),
  ('e2000000-0000-4000-b000-000000000c15', 'e2000000-0000-4000-a000-000000000135', 3, 'O convencimento do leitor de que para haver a superação do problema do narcotráfico é preciso aumentar a ação policial.', true),
  ('e2000000-0000-4000-b000-000000000c16', 'e2000000-0000-4000-a000-000000000135', 4, 'Uma exposição numérica realizada com o fim de mostrar que o negócio do narcotráfico é vantajoso e sem riscos.', false),
  ('e2000000-0000-4000-b000-000000000c1c', 'e2000000-0000-4000-a000-000000000136', 0, 'Instituições que divulgam o crescimento de jovens no crime organizado.', false),
  ('e2000000-0000-4000-b000-000000000c1d', 'e2000000-0000-4000-a000-000000000136', 1, 'Sugestões que ajudam a reduzir a atração exercida pelo crime organizado.', false),
  ('e2000000-0000-4000-b000-000000000c1e', 'e2000000-0000-4000-a000-000000000136', 2, 'Políticas sociais que impedem o aliciamento de crianças no crime organizado.', false),
  ('e2000000-0000-4000-b000-000000000c1f', 'e2000000-0000-4000-a000-000000000136', 3, 'Pesquisadores que se preocupam com os jovens envolvidos no crime organizado.', false),
  ('e2000000-0000-4000-b000-000000000c20', 'e2000000-0000-4000-a000-000000000136', 4, 'Números que comparam os valores pagos entre os programas de governo e o crime organizado.', true),
  ('e2000000-0000-4000-b000-000000000c26', 'e2000000-0000-4000-a000-000000000137', 0, 'Regional, adequada à troca de informações na situação apresentada.', false),
  ('e2000000-0000-4000-b000-000000000c27', 'e2000000-0000-4000-a000-000000000137', 1, 'Jurídica, exigida pelo tema relacionado ao domínio do futebol.', false),
  ('e2000000-0000-4000-b000-000000000c28', 'e2000000-0000-4000-a000-000000000137', 2, 'Coloquial, considerando-se que ele era um cidadão brasileiro comum.', false),
  ('e2000000-0000-4000-b000-000000000c29', 'e2000000-0000-4000-a000-000000000137', 3, 'Culta, adequando-se ao seu interlocutor e à situação de comunicação.', true),
  ('e2000000-0000-4000-b000-000000000c2a', 'e2000000-0000-4000-a000-000000000137', 4, 'Informal, pressupondo o grau de escolaridade de seu interlocutor.', false),
  ('e2000000-0000-4000-b000-000000000c30', 'e2000000-0000-4000-a000-000000000138', 0, 'No conflito entre o passado pobre e o presente rico, que simboliza o triunfo da aparência sobre a essência.', true),
  ('e2000000-0000-4000-b000-000000000c31', 'e2000000-0000-4000-a000-000000000138', 1, 'No sentimento de nostalgia do passado devido à substituição da mão de obra escrava pela dos imigrantes.', false),
  ('e2000000-0000-4000-b000-000000000c32', 'e2000000-0000-4000-a000-000000000138', 2, 'Na referência a Fausto e Mefistófeles, que representam o desejo de eternização de Rubião.', false),
  ('e2000000-0000-4000-b000-000000000c33', 'e2000000-0000-4000-a000-000000000138', 3, 'Na admiração dos metais por parte de Rubião, que metaforicamente representam a durabilidade dos bens produzidos pelo trabalho.', false),
  ('e2000000-0000-4000-b000-000000000c34', 'e2000000-0000-4000-a000-000000000138', 4, 'Na resistência de Rubião aos criados estrangeiros, que reproduz o sentimento de xenofobia.', false),
  ('e2000000-0000-4000-b000-000000000c3a', 'e2000000-0000-4000-a000-000000000139', 0, 'Falta de aproximação entre a menina e a senhora, preocupada com as amigas.', false),
  ('e2000000-0000-4000-b000-000000000c3b', 'e2000000-0000-4000-a000-000000000139', 1, 'Receptividade da senhora para com os padres, mas deselegante para com as beatas.', false),
  ('e2000000-0000-4000-b000-000000000c3c', 'e2000000-0000-4000-a000-000000000139', 2, 'Ironia do padre a respeito da senhora, que era perversa com as crianças.', false),
  ('e2000000-0000-4000-b000-000000000c3d', 'e2000000-0000-4000-a000-000000000139', 3, 'Resistência da senhora em aceitar a liberdade dos negros, evidenciada no final do texto.', true),
  ('e2000000-0000-4000-b000-000000000c3e', 'e2000000-0000-4000-a000-000000000139', 4, 'Rejeição aos criados por parte da senhora, que preferia tratá-los com castigos.', false),
  ('e2000000-0000-4000-b000-000000000c44', 'e2000000-0000-4000-a000-00000000013a', 0, 'Após é conectivo de causa, já que apresenta o motivo de a zaga alvinegra ter rebatido a bola de cabeça.', false),
  ('e2000000-0000-4000-b000-000000000c45', 'e2000000-0000-4000-a000-00000000013a', 1, 'Enquanto conecta duas opções possíveis para serem aplicadas no jogo.', false),
  ('e2000000-0000-4000-b000-000000000c46', 'e2000000-0000-4000-a000-00000000013a', 2, 'No entanto tem significado de tempo, porque ordena os fatos observados no jogo em ordem cronológica de ocorrência.', false),
  ('e2000000-0000-4000-b000-000000000c47', 'e2000000-0000-4000-a000-00000000013a', 3, 'Mesmo traz ideia de concessão, já que “com mais posse de bola", ter dificuldade não é algo naturalmente esperado.', true),
  ('e2000000-0000-4000-b000-000000000c48', 'e2000000-0000-4000-a000-00000000013a', 4, 'Por causa de indica consequência, porque as tentativas de ataque do Flamengo motivaram o Botafogo a fazer um bloqueio.', false),
  ('e2000000-0000-4000-b000-000000000c4e', 'e2000000-0000-4000-a000-00000000013b', 0, 'Buscaram libertar a arte brasileira das normas acadêmicas europeias, valorizando as cores, a originalidade e os temas nacionais.', true),
  ('e2000000-0000-4000-b000-000000000c4f', 'e2000000-0000-4000-a000-00000000013b', 1, 'Defenderam a liberdade limitada de uso da cor, até então utilizada de forma irrestrita, afetando a criação artística nacional.', false),
  ('e2000000-0000-4000-b000-000000000c50', 'e2000000-0000-4000-a000-00000000013b', 2, 'Representaram a ideia de que a arte deveria copiar fielmente a natureza, tendo como finalidade a prática educativa.', false),
  ('e2000000-0000-4000-b000-000000000c51', 'e2000000-0000-4000-a000-00000000013b', 3, 'Mantiveram de forma fiel a realidade nas figuras retratadas, defendendo uma liberdade artística ligada a tradição acadêmica.', false),
  ('e2000000-0000-4000-b000-000000000c52', 'e2000000-0000-4000-a000-00000000013b', 4, 'Buscaram a liberdade na composição de suas figuras, respeitando limites de temas abordados.', false),
  ('e2000000-0000-4000-b000-000000000c58', 'e2000000-0000-4000-a000-00000000013c', 0, 'Os homens estão matriculados em menor proporção em cursos de Matemática que em Medicina por lidarem melhor com pessoas.', false),
  ('e2000000-0000-4000-b000-000000000c59', 'e2000000-0000-4000-a000-00000000013c', 1, 'As mulheres estão matriculadas em maior percentual em cursos que exigem capacidade de compreensão dos seres humanos.', true),
  ('e2000000-0000-4000-b000-000000000c5a', 'e2000000-0000-4000-a000-00000000013c', 2, 'As mulheres estão matriculadas em percentual maior em Física que em Mineração por tenderem a trabalhar melhor com abstrações.', false),
  ('e2000000-0000-4000-b000-000000000c5b', 'e2000000-0000-4000-a000-00000000013c', 3, 'As homens e as mulheres estão matriculados na mesma proporção em cursos que exigem habilidades semelhantes na mesma área.', false),
  ('e2000000-0000-4000-b000-000000000c5c', 'e2000000-0000-4000-a000-00000000013c', 4, 'As mulheres estão matriculadas em menor número em Psicologia por sua habilidade de lidarem melhor com coisas que com sujeitos.', false),
  ('e2000000-0000-4000-b000-000000000c62', 'e2000000-0000-4000-a000-00000000013d', 0, 'Considerar as relações entre o conhecimento teórico e o conhecimento empírico e acrescenta que novos gêneros textuais surgiram com o progresso.', true),
  ('e2000000-0000-4000-b000-000000000c63', 'e2000000-0000-4000-a000-00000000013d', 1, 'Observar que a língua escrita não é uma transcrição fiel da língua oral e explica que as palavras antigas devem ser utilizadas para preservar a tradição.', false),
  ('e2000000-0000-4000-b000-000000000c64', 'e2000000-0000-4000-a000-00000000013d', 2, 'Perguntar sobre a razão das pessoas visitarem museus, exposições, etc., e reafirma que os fotógrafos são  os únicos responsáveis pela produção de obras de arte.', false),
  ('e2000000-0000-4000-b000-000000000c65', 'e2000000-0000-4000-a000-00000000013d', 3, 'Reconhecer que as pessoas temem que o avanço dos meios de comunicação, inclusive on-line, substitua o homem e leve alguns profissionais ao esquecimento.', false),
  ('e2000000-0000-4000-b000-000000000c66', 'e2000000-0000-4000-a000-00000000013d', 4, 'Revelar o receio das pessoas em experimentar novos meios de comunicação, com medo de sentirem retrógradas.', false),
  ('e2000000-0000-4000-b000-000000000c6c', 'e2000000-0000-4000-a000-00000000013e', 0, 'Desperta sensações contraditórias e desejo de reconhecimento.', false),
  ('e2000000-0000-4000-b000-000000000c6d', 'e2000000-0000-4000-a000-00000000013e', 1, 'Favorece o cultivo da intimidade e a exposição dos dotes físicos.', false),
  ('e2000000-0000-4000-b000-000000000c6e', 'e2000000-0000-4000-a000-00000000013e', 2, 'Possibilita vínculos pessoais duradouros e encontros casuais.', false),
  ('e2000000-0000-4000-b000-000000000c6f', 'e2000000-0000-4000-a000-00000000013e', 3, 'Propicia o sentido de comunidade e a exibição pessoal.', true),
  ('e2000000-0000-4000-b000-000000000c70', 'e2000000-0000-4000-a000-00000000013e', 4, 'Promove o anonimato e a segregação social.', false),
  ('e2000000-0000-4000-b000-000000000c76', 'e2000000-0000-4000-a000-00000000013f', 0, 'Dicionários, pois a forma do texto dá liberdade de acesso à informação.', true),
  ('e2000000-0000-4000-b000-000000000c77', 'e2000000-0000-4000-a000-00000000013f', 1, 'Documentários, pois o autor faz uma seleção dos fatos e das imagens.', false),
  ('e2000000-0000-4000-b000-000000000c78', 'e2000000-0000-4000-a000-00000000013f', 2, 'Relatos pessoais, pois o narrador apresenta sua percepção dos fatos.', false),
  ('e2000000-0000-4000-b000-000000000c79', 'e2000000-0000-4000-a000-00000000013f', 3, 'Editoriais, pois o editorialista faz uma abordagem detalhada dos fatos.', false),
  ('e2000000-0000-4000-b000-000000000c7a', 'e2000000-0000-4000-a000-00000000013f', 4, 'Romances românticos, pois os eventos ocorrem em diversos cenários.', false),
  ('e2000000-0000-4000-b000-000000000c80', 'e2000000-0000-4000-a000-000000000140', 0, '![](conteudo/enem/2010/136-a-62533d8a.webp)', false),
  ('e2000000-0000-4000-b000-000000000c81', 'e2000000-0000-4000-a000-000000000140', 1, '![](conteudo/enem/2010/136-b-f995e6dc.webp)', false),
  ('e2000000-0000-4000-b000-000000000c82', 'e2000000-0000-4000-a000-000000000140', 2, '![](conteudo/enem/2010/136-c-0c6f6086.webp)', true),
  ('e2000000-0000-4000-b000-000000000c83', 'e2000000-0000-4000-a000-000000000140', 3, '![](conteudo/enem/2010/136-d-4409150d.webp)', false),
  ('e2000000-0000-4000-b000-000000000c84', 'e2000000-0000-4000-a000-000000000140', 4, '![](conteudo/enem/2010/136-e-d9647bc4.webp)', false),
  ('e2000000-0000-4000-b000-000000000c8a', 'e2000000-0000-4000-a000-000000000141', 0, '1 : 20', false),
  ('e2000000-0000-4000-b000-000000000c8b', 'e2000000-0000-4000-a000-000000000141', 1, '1 : 100', false),
  ('e2000000-0000-4000-b000-000000000c8c', 'e2000000-0000-4000-a000-000000000141', 2, '1 : 200', false),
  ('e2000000-0000-4000-b000-000000000c8d', 'e2000000-0000-4000-a000-000000000141', 3, '1 : 1 000', false),
  ('e2000000-0000-4000-b000-000000000c8e', 'e2000000-0000-4000-a000-000000000141', 4, '1 : 2 000', true),
  ('e2000000-0000-4000-b000-000000000c94', 'e2000000-0000-4000-a000-000000000142', 0, '![](conteudo/enem/2010/138-a-35d4f2e6.webp)', false),
  ('e2000000-0000-4000-b000-000000000c95', 'e2000000-0000-4000-a000-000000000142', 1, '![](conteudo/enem/2010/138-b-dd953d59.webp)', false),
  ('e2000000-0000-4000-b000-000000000c96', 'e2000000-0000-4000-a000-000000000142', 2, '![](conteudo/enem/2010/138-c-4e654b9e.webp)', false),
  ('e2000000-0000-4000-b000-000000000c97', 'e2000000-0000-4000-a000-000000000142', 3, '![](conteudo/enem/2010/138-d-8f1dbb6d.webp)', false),
  ('e2000000-0000-4000-b000-000000000c98', 'e2000000-0000-4000-a000-000000000142', 4, '![](conteudo/enem/2010/138-e-10ab101d.webp)', true),
  ('e2000000-0000-4000-b000-000000000c9e', 'e2000000-0000-4000-a000-000000000143', 0, '5 cm.', true),
  ('e2000000-0000-4000-b000-000000000c9f', 'e2000000-0000-4000-a000-000000000143', 1, '6 cm.', false),
  ('e2000000-0000-4000-b000-000000000ca0', 'e2000000-0000-4000-a000-000000000143', 2, '12 cm.', false),
  ('e2000000-0000-4000-b000-000000000ca1', 'e2000000-0000-4000-a000-000000000143', 3, '24 cm.', false),
  ('e2000000-0000-4000-b000-000000000ca2', 'e2000000-0000-4000-a000-000000000143', 4, '25 cm.', false),
  ('e2000000-0000-4000-b000-000000000ca8', 'e2000000-0000-4000-a000-000000000144', 0, '13º', false),
  ('e2000000-0000-4000-b000-000000000ca9', 'e2000000-0000-4000-a000-000000000144', 1, '12º', true),
  ('e2000000-0000-4000-b000-000000000caa', 'e2000000-0000-4000-a000-000000000144', 2, '11º', false),
  ('e2000000-0000-4000-b000-000000000cab', 'e2000000-0000-4000-a000-000000000144', 3, '10º', false),
  ('e2000000-0000-4000-b000-000000000cac', 'e2000000-0000-4000-a000-000000000144', 4, '9º', false),
  ('e2000000-0000-4000-b000-000000000cb2', 'e2000000-0000-4000-a000-000000000145', 0, '5 513', false),
  ('e2000000-0000-4000-b000-000000000cb3', 'e2000000-0000-4000-a000-000000000145', 1, '6 556', false),
  ('e2000000-0000-4000-b000-000000000cb4', 'e2000000-0000-4000-a000-000000000145', 2, '7 450', false),
  ('e2000000-0000-4000-b000-000000000cb5', 'e2000000-0000-4000-a000-000000000145', 3, '8 344', true),
  ('e2000000-0000-4000-b000-000000000cb6', 'e2000000-0000-4000-a000-000000000145', 4, '9 536', false),
  ('e2000000-0000-4000-b000-000000000cbc', 'e2000000-0000-4000-a000-000000000146', 0, '![](conteudo/enem/2010/142-a-fb5ec95b.webp)', true),
  ('e2000000-0000-4000-b000-000000000cbd', 'e2000000-0000-4000-a000-000000000146', 1, '![](conteudo/enem/2010/142-b-da24640c.webp)', false),
  ('e2000000-0000-4000-b000-000000000cbe', 'e2000000-0000-4000-a000-000000000146', 2, '![](conteudo/enem/2010/142-c-06ba9bf4.webp)', false),
  ('e2000000-0000-4000-b000-000000000cbf', 'e2000000-0000-4000-a000-000000000146', 3, '![](conteudo/enem/2010/142-d-c2c0f326.webp)', false),
  ('e2000000-0000-4000-b000-000000000cc0', 'e2000000-0000-4000-a000-000000000146', 4, '![](conteudo/enem/2010/142-e-f9d1e289.webp)', false),
  ('e2000000-0000-4000-b000-000000000cc6', 'e2000000-0000-4000-a000-000000000147', 0, '100 km² e 900 km².', false),
  ('e2000000-0000-4000-b000-000000000cc7', 'e2000000-0000-4000-a000-000000000147', 1, '1 000 km² e 2 700 km².', false),
  ('e2000000-0000-4000-b000-000000000cc8', 'e2000000-0000-4000-a000-000000000147', 2, '2 800 km² e 3 200 km².', true),
  ('e2000000-0000-4000-b000-000000000cc9', 'e2000000-0000-4000-a000-000000000147', 3, '3 300 km² e 4 000 km².', false),
  ('e2000000-0000-4000-b000-000000000cca', 'e2000000-0000-4000-a000-000000000147', 4, '4 100 km² e 5 800 km².', false),
  ('e2000000-0000-4000-b000-000000000cd0', 'e2000000-0000-4000-a000-000000000148', 0, 'Direta, direta e direta.', false),
  ('e2000000-0000-4000-b000-000000000cd1', 'e2000000-0000-4000-a000-000000000148', 1, 'Direta, direta e inversa.', false),
  ('e2000000-0000-4000-b000-000000000cd2', 'e2000000-0000-4000-a000-000000000148', 2, 'Direta, inversa e direta.', true),
  ('e2000000-0000-4000-b000-000000000cd3', 'e2000000-0000-4000-a000-000000000148', 3, 'Inversa, direta e direta.', false),
  ('e2000000-0000-4000-b000-000000000cd4', 'e2000000-0000-4000-a000-000000000148', 4, 'Inversa, direta e inversa.', false),
  ('e2000000-0000-4000-b000-000000000cda', 'e2000000-0000-4000-a000-000000000149', 0, '24500', true),
  ('e2000000-0000-4000-b000-000000000cdb', 'e2000000-0000-4000-a000-000000000149', 1, '25000', false),
  ('e2000000-0000-4000-b000-000000000cdc', 'e2000000-0000-4000-a000-000000000149', 2, '220500', false),
  ('e2000000-0000-4000-b000-000000000cdd', 'e2000000-0000-4000-a000-000000000149', 3, '223000', false),
  ('e2000000-0000-4000-b000-000000000cde', 'e2000000-0000-4000-a000-000000000149', 4, '227500', false),
  ('e2000000-0000-4000-b000-000000000ce4', 'e2000000-0000-4000-a000-00000000014a', 0, 'Massa.', false),
  ('e2000000-0000-4000-b000-000000000ce5', 'e2000000-0000-4000-a000-00000000014a', 1, 'Volume.', true),
  ('e2000000-0000-4000-b000-000000000ce6', 'e2000000-0000-4000-a000-00000000014a', 2, 'Superfície.', false),
  ('e2000000-0000-4000-b000-000000000ce7', 'e2000000-0000-4000-a000-00000000014a', 3, 'Capacidade.', false),
  ('e2000000-0000-4000-b000-000000000ce8', 'e2000000-0000-4000-a000-00000000014a', 4, 'Comprimento.', false),
  ('e2000000-0000-4000-b000-000000000cee', 'e2000000-0000-4000-a000-00000000014b', 0, 'E1E3.', false),
  ('e2000000-0000-4000-b000-000000000cef', 'e2000000-0000-4000-a000-00000000014b', 1, 'E1E4.', false),
  ('e2000000-0000-4000-b000-000000000cf0', 'e2000000-0000-4000-a000-00000000014b', 2, 'E2E4.', false),
  ('e2000000-0000-4000-b000-000000000cf1', 'e2000000-0000-4000-a000-00000000014b', 3, 'E2E5.', true),
  ('e2000000-0000-4000-b000-000000000cf2', 'e2000000-0000-4000-a000-00000000014b', 4, 'E2E6', false),
  ('e2000000-0000-4000-b000-000000000cf8', 'e2000000-0000-4000-a000-00000000014c', 0, 'U$ 4.174.000,00.', false),
  ('e2000000-0000-4000-b000-000000000cf9', 'e2000000-0000-4000-a000-00000000014c', 1, 'U$ 41.740.000,00.', false),
  ('e2000000-0000-4000-b000-000000000cfa', 'e2000000-0000-4000-a000-00000000014c', 2, 'U$ 417.400.000,00.', false),
  ('e2000000-0000-4000-b000-000000000cfb', 'e2000000-0000-4000-a000-00000000014c', 3, 'U$ 41.740.000.000,00.', false),
  ('e2000000-0000-4000-b000-000000000cfc', 'e2000000-0000-4000-a000-00000000014c', 4, 'U$ 417.400.000.000,00.', true),
  ('e2000000-0000-4000-b000-000000000d02', 'e2000000-0000-4000-a000-00000000014d', 0, 'C = 4Q', false),
  ('e2000000-0000-4000-b000-000000000d03', 'e2000000-0000-4000-a000-00000000014d', 1, 'C = 3Q + 1', true),
  ('e2000000-0000-4000-b000-000000000d04', 'e2000000-0000-4000-a000-00000000014d', 2, 'C = 4Q + 1', false),
  ('e2000000-0000-4000-b000-000000000d05', 'e2000000-0000-4000-a000-00000000014d', 3, 'C = Q + 3', false),
  ('e2000000-0000-4000-b000-000000000d06', 'e2000000-0000-4000-a000-00000000014d', 4, 'C = 4Q – 2', false),
  ('e2000000-0000-4000-b000-000000000d0c', 'e2000000-0000-4000-a000-00000000014e', 0, 'O dobro do valor da primeira encomenda, porque a altura e a largura dos quadros dobraram.', false),
  ('e2000000-0000-4000-b000-000000000d0d', 'e2000000-0000-4000-a000-00000000014e', 1, 'Maior do que o valor da primeira encomenda, mas não o dobro.', true),
  ('e2000000-0000-4000-b000-000000000d0e', 'e2000000-0000-4000-a000-00000000014e', 2, 'A metade do valor da primeira encomenda, porque a altura e a largura dos quadros dobraram.', false),
  ('e2000000-0000-4000-b000-000000000d0f', 'e2000000-0000-4000-a000-00000000014e', 3, 'Menor do que o valor da primeira encomenda, mas não a metade.', false),
  ('e2000000-0000-4000-b000-000000000d10', 'e2000000-0000-4000-a000-00000000014e', 4, 'Igual ao valor da primeira encomenda, porque o custo de entrega será o mesmo.', false),
  ('e2000000-0000-4000-b000-000000000d16', 'e2000000-0000-4000-a000-00000000014f', 0, 'Encher a leiteira até a metade, pois ela tem um volume 20 vezes maior que o volume do copo.', true),
  ('e2000000-0000-4000-b000-000000000d17', 'e2000000-0000-4000-a000-00000000014f', 1, 'Encher a leiteira toda de água, pois ela tem um volume 20 vezes maior que o volume do copo.', false),
  ('e2000000-0000-4000-b000-000000000d18', 'e2000000-0000-4000-a000-00000000014f', 2, 'Encher a leiteira toda de água, pois ela tem um volume 10 vezes maior que o volume do copo.', false),
  ('e2000000-0000-4000-b000-000000000d19', 'e2000000-0000-4000-a000-00000000014f', 3, 'Encher duas leiteiras de água, pois ela tem um volume 10 vezes maior que o volume do copo.', false),
  ('e2000000-0000-4000-b000-000000000d1a', 'e2000000-0000-4000-a000-00000000014f', 4, 'Encher cinco leiteiras de água, pois ela tem um volume 10 vezes maior que o volume do copo.', false),
  ('e2000000-0000-4000-b000-000000000d20', 'e2000000-0000-4000-a000-000000000150', 0, '12 765 km.', false),
  ('e2000000-0000-4000-b000-000000000d21', 'e2000000-0000-4000-a000-000000000150', 1, '12 000 km', true),
  ('e2000000-0000-4000-b000-000000000d22', 'e2000000-0000-4000-a000-000000000150', 2, '11 730 km', false),
  ('e2000000-0000-4000-b000-000000000d23', 'e2000000-0000-4000-a000-000000000150', 3, '10 965 km.', false),
  ('e2000000-0000-4000-b000-000000000d24', 'e2000000-0000-4000-a000-000000000150', 4, '5 865 km', false),
  ('e2000000-0000-4000-b000-000000000d2a', 'e2000000-0000-4000-a000-000000000151', 0, 'I, pela relação área/capacidade de armazenamento de 1/3', false),
  ('e2000000-0000-4000-b000-000000000d2b', 'e2000000-0000-4000-a000-000000000151', 1, 'I, pela relação área/capacidade de armazenamento de 4/3', false),
  ('e2000000-0000-4000-b000-000000000d2c', 'e2000000-0000-4000-a000-000000000151', 2, 'II, pela relação área/capacidade de armazenamento de 3/4', false),
  ('e2000000-0000-4000-b000-000000000d2d', 'e2000000-0000-4000-a000-000000000151', 3, 'III, pela relação área/capacidade de armazenamento de 2/3', true),
  ('e2000000-0000-4000-b000-000000000d2e', 'e2000000-0000-4000-a000-000000000151', 4, 'III, pela relação área/capacidade de armazenamento de 7/12', false),
  ('e2000000-0000-4000-b000-000000000d34', 'e2000000-0000-4000-a000-000000000152', 0, 'Insuficiente.', false),
  ('e2000000-0000-4000-b000-000000000d35', 'e2000000-0000-4000-a000-000000000152', 1, 'Regular.', false),
  ('e2000000-0000-4000-b000-000000000d36', 'e2000000-0000-4000-a000-000000000152', 2, 'Bom.', true),
  ('e2000000-0000-4000-b000-000000000d37', 'e2000000-0000-4000-a000-000000000152', 3, 'Ótimo.', false),
  ('e2000000-0000-4000-b000-000000000d38', 'e2000000-0000-4000-a000-000000000152', 4, 'Excelente.', false),
  ('e2000000-0000-4000-b000-000000000d3e', 'e2000000-0000-4000-a000-000000000153', 0, '476', false),
  ('e2000000-0000-4000-b000-000000000d3f', 'e2000000-0000-4000-a000-000000000153', 1, '675', false),
  ('e2000000-0000-4000-b000-000000000d40', 'e2000000-0000-4000-a000-000000000153', 2, '923', true),
  ('e2000000-0000-4000-b000-000000000d41', 'e2000000-0000-4000-a000-000000000153', 3, '965', false),
  ('e2000000-0000-4000-b000-000000000d42', 'e2000000-0000-4000-a000-000000000153', 4, '1538', false),
  ('e2000000-0000-4000-b000-000000000d48', 'e2000000-0000-4000-a000-000000000154', 0, 'Menor ou igual a 200 m.', true),
  ('e2000000-0000-4000-b000-000000000d49', 'e2000000-0000-4000-a000-000000000154', 1, 'Maior que 200 m e menor ou igual a 400 m.', false),
  ('e2000000-0000-4000-b000-000000000d4a', 'e2000000-0000-4000-a000-000000000154', 2, 'Maior que 400 m e menor ou igual a 600 m', false),
  ('e2000000-0000-4000-b000-000000000d4b', 'e2000000-0000-4000-a000-000000000154', 3, 'Maior que 600 m e menor ou igual a 800 m.', false),
  ('e2000000-0000-4000-b000-000000000d4c', 'e2000000-0000-4000-a000-000000000154', 4, 'Maior que 800 m.', false),
  ('e2000000-0000-4000-b000-000000000d52', 'e2000000-0000-4000-a000-000000000155', 0, 'R$ 230,40.', false),
  ('e2000000-0000-4000-b000-000000000d53', 'e2000000-0000-4000-a000-000000000155', 1, 'R$ 124,00.', false),
  ('e2000000-0000-4000-b000-000000000d54', 'e2000000-0000-4000-a000-000000000155', 2, 'R$ 104,16.', false),
  ('e2000000-0000-4000-b000-000000000d55', 'e2000000-0000-4000-a000-000000000155', 3, 'R$ 54,56.', true),
  ('e2000000-0000-4000-b000-000000000d56', 'e2000000-0000-4000-a000-000000000155', 4, 'R$ 49,60.', false),
  ('e2000000-0000-4000-b000-000000000d5c', 'e2000000-0000-4000-a000-000000000156', 0, '29,9 toneladas.', true),
  ('e2000000-0000-4000-b000-000000000d5d', 'e2000000-0000-4000-a000-000000000156', 1, '31,1 toneladas.', false),
  ('e2000000-0000-4000-b000-000000000d5e', 'e2000000-0000-4000-a000-000000000156', 2, '32,4 toneladas.', false),
  ('e2000000-0000-4000-b000-000000000d5f', 'e2000000-0000-4000-a000-000000000156', 3, '35,3 toneladas.', false),
  ('e2000000-0000-4000-b000-000000000d60', 'e2000000-0000-4000-a000-000000000156', 4, '41,8 toneladas.', false),
  ('e2000000-0000-4000-b000-000000000d66', 'e2000000-0000-4000-a000-000000000157', 0, '0,4 cm/kg1/3.', false),
  ('e2000000-0000-4000-b000-000000000d67', 'e2000000-0000-4000-a000-000000000157', 1, '2,5 cm/kg1/3.', false),
  ('e2000000-0000-4000-b000-000000000d68', 'e2000000-0000-4000-a000-000000000157', 2, '8 cm/kg1/3.', false),
  ('e2000000-0000-4000-b000-000000000d69', 'e2000000-0000-4000-a000-000000000157', 3, '20 cm/kg1/3.', false),
  ('e2000000-0000-4000-b000-000000000d6a', 'e2000000-0000-4000-a000-000000000157', 4, '40 cm/kg1/3.', true),
  ('e2000000-0000-4000-b000-000000000d70', 'e2000000-0000-4000-a000-000000000158', 0, '1,8 km', false),
  ('e2000000-0000-4000-b000-000000000d71', 'e2000000-0000-4000-a000-000000000158', 1, '1,9 km', false),
  ('e2000000-0000-4000-b000-000000000d72', 'e2000000-0000-4000-a000-000000000158', 2, '3,1 km', true),
  ('e2000000-0000-4000-b000-000000000d73', 'e2000000-0000-4000-a000-000000000158', 3, '3,7 km', false),
  ('e2000000-0000-4000-b000-000000000d74', 'e2000000-0000-4000-a000-000000000158', 4, '5,5 km', false),
  ('e2000000-0000-4000-b000-000000000d7a', 'e2000000-0000-4000-a000-000000000159', 0, 'À mesma área do triângulo AMC.', false),
  ('e2000000-0000-4000-b000-000000000d7b', 'e2000000-0000-4000-a000-000000000159', 1, 'À mesma área do triângulo BNC.', false),
  ('e2000000-0000-4000-b000-000000000d7c', 'e2000000-0000-4000-a000-000000000159', 2, 'À metade da área formada pelo triângulo ABC.', false),
  ('e2000000-0000-4000-b000-000000000d7d', 'e2000000-0000-4000-a000-000000000159', 3, 'Ao dobro da área do triângulo MNC.', false),
  ('e2000000-0000-4000-b000-000000000d7e', 'e2000000-0000-4000-a000-000000000159', 4, 'Ao triplo da área do triângulo MNC.', true),
  ('e2000000-0000-4000-b000-000000000d84', 'e2000000-0000-4000-a000-00000000015a', 0, '1 mm.', false),
  ('e2000000-0000-4000-b000-000000000d85', 'e2000000-0000-4000-a000-00000000015a', 1, '10 mm.', false),
  ('e2000000-0000-4000-b000-000000000d86', 'e2000000-0000-4000-a000-00000000015a', 2, '17 mm.', false),
  ('e2000000-0000-4000-b000-000000000d87', 'e2000000-0000-4000-a000-00000000015a', 3, '160 mm.', true),
  ('e2000000-0000-4000-b000-000000000d88', 'e2000000-0000-4000-a000-00000000015a', 4, '167 mm.', false),
  ('e2000000-0000-4000-b000-000000000d8e', 'e2000000-0000-4000-a000-00000000015b', 0, 'Y = R.', false),
  ('e2000000-0000-4000-b000-000000000d8f', 'e2000000-0000-4000-a000-00000000015b', 1, 'Y = 2R.', false),
  ('e2000000-0000-4000-b000-000000000d90', 'e2000000-0000-4000-a000-00000000015b', 2, 'Y = πR.', false),
  ('e2000000-0000-4000-b000-000000000d91', 'e2000000-0000-4000-a000-00000000015b', 3, 'Y = 2πR.', false),
  ('e2000000-0000-4000-b000-000000000d92', 'e2000000-0000-4000-a000-00000000015b', 4, 'Y = 4πR.', true),
  ('e2000000-0000-4000-b000-000000000d98', 'e2000000-0000-4000-a000-00000000015c', 0, '1 cm.', false),
  ('e2000000-0000-4000-b000-000000000d99', 'e2000000-0000-4000-a000-00000000015c', 1, '2 cm.', true),
  ('e2000000-0000-4000-b000-000000000d9a', 'e2000000-0000-4000-a000-00000000015c', 2, '3 cm.', false),
  ('e2000000-0000-4000-b000-000000000d9b', 'e2000000-0000-4000-a000-00000000015c', 3, '4 cm.', false),
  ('e2000000-0000-4000-b000-000000000d9c', 'e2000000-0000-4000-a000-00000000015c', 4, '5 cm.', false),
  ('e2000000-0000-4000-b000-000000000da2', 'e2000000-0000-4000-a000-00000000015d', 0, '100.', false),
  ('e2000000-0000-4000-b000-000000000da3', 'e2000000-0000-4000-a000-00000000015d', 1, '108.', false),
  ('e2000000-0000-4000-b000-000000000da4', 'e2000000-0000-4000-a000-00000000015d', 2, '128.', false),
  ('e2000000-0000-4000-b000-000000000da5', 'e2000000-0000-4000-a000-00000000015d', 3, '130.', true),
  ('e2000000-0000-4000-b000-000000000da6', 'e2000000-0000-4000-a000-00000000015d', 4, '150.', false),
  ('e2000000-0000-4000-b000-000000000dac', 'e2000000-0000-4000-a000-00000000015e', 0, 'Menor que 1 150.', false),
  ('e2000000-0000-4000-b000-000000000dad', 'e2000000-0000-4000-a000-00000000015e', 1, '218 unidades maior que em 2004.', false),
  ('e2000000-0000-4000-b000-000000000dae', 'e2000000-0000-4000-a000-00000000015e', 2, 'Maior que 1 150 e menor que 1 200.', true),
  ('e2000000-0000-4000-b000-000000000daf', 'e2000000-0000-4000-a000-00000000015e', 3, '177 unidades maior que em 2010.', false),
  ('e2000000-0000-4000-b000-000000000db0', 'e2000000-0000-4000-a000-00000000015e', 4, 'Maior que 1 200.', false),
  ('e2000000-0000-4000-b000-000000000db6', 'e2000000-0000-4000-a000-00000000015f', 0, '6 gols', false),
  ('e2000000-0000-4000-b000-000000000db7', 'e2000000-0000-4000-a000-00000000015f', 1, '6,5 gols', true),
  ('e2000000-0000-4000-b000-000000000db8', 'e2000000-0000-4000-a000-00000000015f', 2, '7 gols', false),
  ('e2000000-0000-4000-b000-000000000db9', 'e2000000-0000-4000-a000-00000000015f', 3, '7,3 gols', false),
  ('e2000000-0000-4000-b000-000000000dba', 'e2000000-0000-4000-a000-00000000015f', 4, '8,5 gols', false),
  ('e2000000-0000-4000-b000-000000000dc0', 'e2000000-0000-4000-a000-000000000160', 0, '1,33', false),
  ('e2000000-0000-4000-b000-000000000dc1', 'e2000000-0000-4000-a000-000000000160', 1, '6,00', true),
  ('e2000000-0000-4000-b000-000000000dc2', 'e2000000-0000-4000-a000-000000000160', 2, '12,00', false),
  ('e2000000-0000-4000-b000-000000000dc3', 'e2000000-0000-4000-a000-000000000160', 3, '56,52', false),
  ('e2000000-0000-4000-b000-000000000dc4', 'e2000000-0000-4000-a000-000000000160', 4, '113,04', false),
  ('e2000000-0000-4000-b000-000000000dca', 'e2000000-0000-4000-a000-000000000161', 0, '4,0 m e 5,0 m.', false),
  ('e2000000-0000-4000-b000-000000000dcb', 'e2000000-0000-4000-a000-000000000161', 1, '5,0 m e 6,0 m.', false),
  ('e2000000-0000-4000-b000-000000000dcc', 'e2000000-0000-4000-a000-000000000161', 2, '6,0 m e 7,0 m.', false),
  ('e2000000-0000-4000-b000-000000000dcd', 'e2000000-0000-4000-a000-000000000161', 3, '7,0 m e 8,0 m.', true),
  ('e2000000-0000-4000-b000-000000000dce', 'e2000000-0000-4000-a000-000000000161', 4, '8,0 m e 9,0 m.', false),
  ('e2000000-0000-4000-b000-000000000dd4', 'e2000000-0000-4000-a000-000000000162', 0, 'Marco, pois a média e a mediana são iguais.', false),
  ('e2000000-0000-4000-b000-000000000dd5', 'e2000000-0000-4000-a000-000000000162', 1, 'Marco, pois obteve menor desvio padrão.', true),
  ('e2000000-0000-4000-b000-000000000dd6', 'e2000000-0000-4000-a000-000000000162', 2, 'Paulo, pois obteve a maior pontuação da tabela, 19 em Português.', false),
  ('e2000000-0000-4000-b000-000000000dd7', 'e2000000-0000-4000-a000-000000000162', 3, 'Paulo, pois obteve maior mediana.', false),
  ('e2000000-0000-4000-b000-000000000dd8', 'e2000000-0000-4000-a000-000000000162', 4, 'Paulo, pois obteve maior desvio padrão.', false),
  ('e2000000-0000-4000-b000-000000000dde', 'e2000000-0000-4000-a000-000000000163', 0, '16%', false),
  ('e2000000-0000-4000-b000-000000000ddf', 'e2000000-0000-4000-a000-000000000163', 1, '24%', true),
  ('e2000000-0000-4000-b000-000000000de0', 'e2000000-0000-4000-a000-000000000163', 2, '32%', false),
  ('e2000000-0000-4000-b000-000000000de1', 'e2000000-0000-4000-a000-000000000163', 3, '48%', false),
  ('e2000000-0000-4000-b000-000000000de2', 'e2000000-0000-4000-a000-000000000163', 4, '64%', false),
  ('e2000000-0000-4000-b000-000000000de8', 'e2000000-0000-4000-a000-000000000164', 0, '22,5%.', false),
  ('e2000000-0000-4000-b000-000000000de9', 'e2000000-0000-4000-a000-000000000164', 1, '50,0%.', false),
  ('e2000000-0000-4000-b000-000000000dea', 'e2000000-0000-4000-a000-000000000164', 2, '52,3%.', true),
  ('e2000000-0000-4000-b000-000000000deb', 'e2000000-0000-4000-a000-000000000164', 3, '65,5%.', false),
  ('e2000000-0000-4000-b000-000000000dec', 'e2000000-0000-4000-a000-000000000164', 4, '77,5%.', false),
  ('e2000000-0000-4000-b000-000000000df2', 'e2000000-0000-4000-a000-000000000165', 0, '60 min.', false),
  ('e2000000-0000-4000-b000-000000000df3', 'e2000000-0000-4000-a000-000000000165', 1, '90 min.', true),
  ('e2000000-0000-4000-b000-000000000df4', 'e2000000-0000-4000-a000-000000000165', 2, '120 min.', false),
  ('e2000000-0000-4000-b000-000000000df5', 'e2000000-0000-4000-a000-000000000165', 3, '180 min.', false),
  ('e2000000-0000-4000-b000-000000000df6', 'e2000000-0000-4000-a000-000000000165', 4, '360 min.', false),
  ('e2000000-0000-4000-b000-000000000dfc', 'e2000000-0000-4000-a000-000000000166', 0, '1/3', false),
  ('e2000000-0000-4000-b000-000000000dfd', 'e2000000-0000-4000-a000-000000000166', 1, '1/5', false),
  ('e2000000-0000-4000-b000-000000000dfe', 'e2000000-0000-4000-a000-000000000166', 2, '2/5', false),
  ('e2000000-0000-4000-b000-000000000dff', 'e2000000-0000-4000-a000-000000000166', 3, '5/7', true),
  ('e2000000-0000-4000-b000-000000000e00', 'e2000000-0000-4000-a000-000000000166', 4, '5/14', false),
  ('e2000000-0000-4000-b000-000000000e06', 'e2000000-0000-4000-a000-000000000167', 0, 'X = Y < Z.', false),
  ('e2000000-0000-4000-b000-000000000e07', 'e2000000-0000-4000-a000-000000000167', 1, 'Z < X = Y.', false),
  ('e2000000-0000-4000-b000-000000000e08', 'e2000000-0000-4000-a000-000000000167', 2, 'Y < Z < X.', false),
  ('e2000000-0000-4000-b000-000000000e09', 'e2000000-0000-4000-a000-000000000167', 3, 'Z < X < Y.', false),
  ('e2000000-0000-4000-b000-000000000e0a', 'e2000000-0000-4000-a000-000000000167', 4, 'Z < Y < X.', true),
  ('e2000000-0000-4000-b000-000000000e10', 'e2000000-0000-4000-a000-000000000168', 0, '406', false),
  ('e2000000-0000-4000-b000-000000000e11', 'e2000000-0000-4000-a000-000000000168', 1, '1 334', true),
  ('e2000000-0000-4000-b000-000000000e12', 'e2000000-0000-4000-a000-000000000168', 2, '4 002', false),
  ('e2000000-0000-4000-b000-000000000e13', 'e2000000-0000-4000-a000-000000000168', 3, '9 338', false),
  ('e2000000-0000-4000-b000-000000000e14', 'e2000000-0000-4000-a000-000000000168', 4, '28 014', false),
  ('e2000000-0000-4000-b000-000000000e1a', 'e2000000-0000-4000-a000-000000000169', 0, '10 -²', false),
  ('e2000000-0000-4000-b000-000000000e1b', 'e2000000-0000-4000-a000-000000000169', 1, '10³', false),
  ('e2000000-0000-4000-b000-000000000e1c', 'e2000000-0000-4000-a000-000000000169', 2, '10^4', false),
  ('e2000000-0000-4000-b000-000000000e1d', 'e2000000-0000-4000-a000-000000000169', 3, '10^6', false),
  ('e2000000-0000-4000-b000-000000000e1e', 'e2000000-0000-4000-a000-000000000169', 4, '10^9', true),
  ('e2000000-0000-4000-b000-000000000e24', 'e2000000-0000-4000-a000-00000000016a', 0, '12 cm³', false),
  ('e2000000-0000-4000-b000-000000000e25', 'e2000000-0000-4000-a000-00000000016a', 1, '64 cm³', false),
  ('e2000000-0000-4000-b000-000000000e26', 'e2000000-0000-4000-a000-00000000016a', 2, '96 cm³', false),
  ('e2000000-0000-4000-b000-000000000e27', 'e2000000-0000-4000-a000-00000000016a', 3, '1216 cm³', true),
  ('e2000000-0000-4000-b000-000000000e28', 'e2000000-0000-4000-a000-00000000016a', 4, '1728 cm³', false),
  ('e2000000-0000-4000-b000-000000000e2e', 'e2000000-0000-4000-a000-00000000016b', 0, '9', false),
  ('e2000000-0000-4000-b000-000000000e2f', 'e2000000-0000-4000-a000-00000000016b', 1, '45', false),
  ('e2000000-0000-4000-b000-000000000e30', 'e2000000-0000-4000-a000-00000000016b', 2, '64', false),
  ('e2000000-0000-4000-b000-000000000e31', 'e2000000-0000-4000-a000-00000000016b', 3, '81', true),
  ('e2000000-0000-4000-b000-000000000e32', 'e2000000-0000-4000-a000-00000000016b', 4, '285', false),
  ('e2000000-0000-4000-b000-000000000e38', 'e2000000-0000-4000-a000-00000000016c', 0, '2004-2005', false),
  ('e2000000-0000-4000-b000-000000000e39', 'e2000000-0000-4000-a000-00000000016c', 1, '2005-2006', false),
  ('e2000000-0000-4000-b000-000000000e3a', 'e2000000-0000-4000-a000-00000000016c', 2, '2006-2007', false),
  ('e2000000-0000-4000-b000-000000000e3b', 'e2000000-0000-4000-a000-00000000016c', 3, '2007-2008', false),
  ('e2000000-0000-4000-b000-000000000e3c', 'e2000000-0000-4000-a000-00000000016c', 4, '2008-2009', true),
  ('e2000000-0000-4000-b000-000000000e42', 'e2000000-0000-4000-a000-00000000016d', 0, 'Reforçar a atuação dos regimes políticos existentes.', false),
  ('e2000000-0000-4000-b000-000000000e43', 'e2000000-0000-4000-a000-00000000016d', 1, 'Tomar conhecimento dos fatos sem se envolver.', false),
  ('e2000000-0000-4000-b000-000000000e44', 'e2000000-0000-4000-a000-00000000016d', 2, 'Manter o distanciamento necessário à sua segurança.', false),
  ('e2000000-0000-4000-b000-000000000e45', 'e2000000-0000-4000-a000-00000000016d', 3, 'Disseminar vírus capazes de destruir programas dos computadores.', false),
  ('e2000000-0000-4000-b000-000000000e46', 'e2000000-0000-4000-a000-00000000016d', 4, 'Difundir ideias revolucionárias que mobilizaram a população.', true),
  ('e2000000-0000-4000-b000-000000000e4c', 'e2000000-0000-4000-a000-00000000016e', 0, 'Decorrentes da vontade divina e, por esse motivo, utópicas.', false),
  ('e2000000-0000-4000-b000-000000000e4d', 'e2000000-0000-4000-a000-00000000016e', 1, 'Parâmetros idealizados, cujo cumprimento é destituído de obrigação.', false),
  ('e2000000-0000-4000-b000-000000000e4e', 'e2000000-0000-4000-a000-00000000016e', 2, 'Amplas e vão além da capacidade de o indivíduo conseguir cumpri-las integralmente.', false),
  ('e2000000-0000-4000-b000-000000000e4f', 'e2000000-0000-4000-a000-00000000016e', 3, 'Criadas pelo homem, que concede a si mesmo a lei à qual deve se submeter', true),
  ('e2000000-0000-4000-b000-000000000e50', 'e2000000-0000-4000-a000-00000000016e', 4, 'Cumpridas por aqueles que se dedicam inteiramente a observar as normas jurídicas.', false),
  ('e2000000-0000-4000-b000-000000000e56', 'e2000000-0000-4000-a000-00000000016f', 0, 'Aliou-se aos partidos de oposição e organizou a campanha Diretas Já.', false),
  ('e2000000-0000-4000-b000-000000000e57', 'e2000000-0000-4000-a000-00000000016f', 1, 'Manifestou-se contra a corrupção e pressionou pela aprovação da Lei da Ficha Limpa.', false),
  ('e2000000-0000-4000-b000-000000000e58', 'e2000000-0000-4000-a000-00000000016f', 2, 'Engajou-se nos protestos relâmpago e utilizou a internet para agendar suas manifestações.', false),
  ('e2000000-0000-4000-b000-000000000e59', 'e2000000-0000-4000-a000-00000000016f', 3, 'Espelhou-se no movimento estudantil de 1968 e protagonizou ações revolucionárias armadas.', false),
  ('e2000000-0000-4000-b000-000000000e5a', 'e2000000-0000-4000-a000-00000000016f', 4, 'Tornou-se porta-voz da sociedade e influenciou no processo de impeachment do então presidente Collor.', true),
  ('e2000000-0000-4000-b000-000000000e60', 'e2000000-0000-4000-a000-000000000170', 0, 'Expansão do Projeto Grande Carajás, com incentivos à chegada de novas empresas mineradoras.', false),
  ('e2000000-0000-4000-b000-000000000e61', 'e2000000-0000-4000-a000-000000000170', 1, 'Difusão do cultivo da soja com a implantação de monoculturas mecanizadas.', true),
  ('e2000000-0000-4000-b000-000000000e62', 'e2000000-0000-4000-a000-000000000170', 2, 'Construção da rodovia Transamazônica, com o objetivo de interligar a região Norte ao restante do país.', false),
  ('e2000000-0000-4000-b000-000000000e63', 'e2000000-0000-4000-a000-000000000170', 3, 'Criação de áreas extrativistas do látex das seringueiras para os chamados povos da floresta.', false),
  ('e2000000-0000-4000-b000-000000000e64', 'e2000000-0000-4000-a000-000000000170', 4, 'Ampliação do polo industrial da Zona Franca de Manaus, visando atrair empresas nacionais e estrangeiras.', false),
  ('e2000000-0000-4000-b000-000000000e6a', 'e2000000-0000-4000-a000-000000000171', 0, 'Industrialização voltada para o setor de base.', false),
  ('e2000000-0000-4000-b000-000000000e6b', 'e2000000-0000-4000-a000-000000000171', 1, 'Economia da borracha no sul da Amazônia.', false),
  ('e2000000-0000-4000-b000-000000000e6c', 'e2000000-0000-4000-a000-000000000171', 2, 'Fronteira agropecuária que degradou parte do cerrado.', true),
  ('e2000000-0000-4000-b000-000000000e6d', 'e2000000-0000-4000-a000-000000000171', 3, 'Exploração mineral na Chapada dos Guimarães.', false),
  ('e2000000-0000-4000-b000-000000000e6e', 'e2000000-0000-4000-a000-000000000171', 4, 'Extrativismo na região pantaneira.', false),
  ('e2000000-0000-4000-b000-000000000e74', 'e2000000-0000-4000-a000-000000000172', 0, 'De clima temperado ocorrem alta pluviosidade e grande profundidade de solos.', false),
  ('e2000000-0000-4000-b000-000000000e75', 'e2000000-0000-4000-a000-000000000172', 1, 'Tropicais ocorre menor pluviosidade, o que se relaciona com a menor profundidade das rochas inalteradas.', false),
  ('e2000000-0000-4000-b000-000000000e76', 'e2000000-0000-4000-a000-000000000172', 2, 'De latitudes em torno de 30° ocorrem as maiores profundidades de solo, visto que há maior umidade.', false),
  ('e2000000-0000-4000-b000-000000000e77', 'e2000000-0000-4000-a000-000000000172', 3, 'Tropicais a profundidade do solo é menor, o que evidencia menor intemperismo químico da água sobre as rochas.', false),
  ('e2000000-0000-4000-b000-000000000e78', 'e2000000-0000-4000-a000-000000000172', 4, 'De menor latitude ocorrem as maiores precipitações, assim como a maior profundidade dos solos.', true),
  ('e2000000-0000-4000-b000-000000000e7e', 'e2000000-0000-4000-a000-000000000173', 0, 'Ampliar as regiões produtoras pela adaptação do cultivo a diferentes condições climáticas.', true),
  ('e2000000-0000-4000-b000-000000000e7f', 'e2000000-0000-4000-a000-000000000173', 1, 'Beneficiar os pequenos produtores camponeses de óleo pela venda direta ao varejo.', false),
  ('e2000000-0000-4000-b000-000000000e80', 'e2000000-0000-4000-a000-000000000173', 2, 'Abandonar a energia automotiva derivada do petróleo em favor de fontes alternativas.', false),
  ('e2000000-0000-4000-b000-000000000e81', 'e2000000-0000-4000-a000-000000000173', 3, 'Baratear cultivos alimentares substituídos pelas culturas energéticas de valor econômico superior.', false),
  ('e2000000-0000-4000-b000-000000000e82', 'e2000000-0000-4000-a000-000000000173', 4, 'Reduzir o impacto ambiental pela não emissão de gases do efeito estufa para a atmosfera.', false),
  ('e2000000-0000-4000-b000-000000000e88', 'e2000000-0000-4000-a000-000000000174', 0, 'A aração.', false),
  ('e2000000-0000-4000-b000-000000000e89', 'e2000000-0000-4000-a000-000000000174', 1, 'O terraceamento.', false),
  ('e2000000-0000-4000-b000-000000000e8a', 'e2000000-0000-4000-a000-000000000174', 2, 'O pousio.', false),
  ('e2000000-0000-4000-b000-000000000e8b', 'e2000000-0000-4000-a000-000000000174', 3, 'A drenagem.', false),
  ('e2000000-0000-4000-b000-000000000e8c', 'e2000000-0000-4000-a000-000000000174', 4, 'O desmatamento.', true),
  ('e2000000-0000-4000-b000-000000000e92', 'e2000000-0000-4000-a000-000000000175', 0, 'Pela reconstrução dos leitos originais dos cursos d’água antes canalizados.', false),
  ('e2000000-0000-4000-b000-000000000e93', 'e2000000-0000-4000-a000-000000000175', 1, 'Pela recomposição de áreas verdes nas áreas centrais dos centros urbanos.', false),
  ('e2000000-0000-4000-b000-000000000e94', 'e2000000-0000-4000-a000-000000000175', 2, 'Pelo uso de materiais com alta capacidade de reflexão no topo dos edifícios.', false),
  ('e2000000-0000-4000-b000-000000000e95', 'e2000000-0000-4000-a000-000000000175', 3, 'Pelo processo de impermeabilização do solo nas áreas centrais das cidades.', true),
  ('e2000000-0000-4000-b000-000000000e96', 'e2000000-0000-4000-a000-000000000175', 4, 'Pela construção de vias expressas e gerenciamento de tráfego terrestre.', false),
  ('e2000000-0000-4000-b000-000000000e9c', 'e2000000-0000-4000-a000-000000000176', 0, 'Ampliação da taxa de fecundidade.', false),
  ('e2000000-0000-4000-b000-000000000e9d', 'e2000000-0000-4000-a000-000000000176', 1, 'Diminuição da expectativa de vida.', true),
  ('e2000000-0000-4000-b000-000000000e9e', 'e2000000-0000-4000-a000-000000000176', 2, 'Elevação do crescimento vegetativo.', false),
  ('e2000000-0000-4000-b000-000000000e9f', 'e2000000-0000-4000-a000-000000000176', 3, 'Aumento na participação relativa de idosos.', false),
  ('e2000000-0000-4000-b000-000000000ea0', 'e2000000-0000-4000-a000-000000000176', 4, 'Redução na proporção de jovens na sociedade.', false),
  ('e2000000-0000-4000-b000-000000000ea6', 'e2000000-0000-4000-a000-000000000177', 0, 'O avanço do extrativismo de minerais metálicos voltados para a exportação na região Sudeste.', false),
  ('e2000000-0000-4000-b000-000000000ea7', 'e2000000-0000-4000-a000-000000000177', 1, 'A contínua ocupação agrícola intensiva de grãos na região Centro-Oeste do Brasil.', false),
  ('e2000000-0000-4000-b000-000000000ea8', 'e2000000-0000-4000-a000-000000000177', 2, 'O processo de desmatamento motivado pela expansão da atividade canavieira no Nordeste brasileiro.', false),
  ('e2000000-0000-4000-b000-000000000ea9', 'e2000000-0000-4000-a000-000000000177', 3, 'O avanço da indústria de papel e celulose a partir da exploração da madeira, extraída principalmente no Sul do Brasil.', true),
  ('e2000000-0000-4000-b000-000000000eaa', 'e2000000-0000-4000-a000-000000000177', 4, 'O adensamento do processo de favelização sobre áreas da Serra do Mar na região Sudeste.', false),
  ('e2000000-0000-4000-b000-000000000eb0', 'e2000000-0000-4000-a000-000000000178', 0, 'A migração forçada da população ribeirinha.', true),
  ('e2000000-0000-4000-b000-000000000eb1', 'e2000000-0000-4000-a000-000000000178', 1, 'O rebaixamento do nível do lençol freático local.', false),
  ('e2000000-0000-4000-b000-000000000eb2', 'e2000000-0000-4000-a000-000000000178', 2, 'A preservação da memória histórica da região.', false),
  ('e2000000-0000-4000-b000-000000000eb3', 'e2000000-0000-4000-a000-000000000178', 3, 'A ampliação das áreas de clima árido.', false),
  ('e2000000-0000-4000-b000-000000000eb4', 'e2000000-0000-4000-a000-000000000178', 4, 'A redução das áreas de agricultura irrigada.', false),
  ('e2000000-0000-4000-b000-000000000eba', 'e2000000-0000-4000-a000-000000000179', 0, 'Provoca a contaminação do solo e do lençol freático, ocasionando assim graves problemas socioambientais, que se adensarão com a continuidade da cultura do consumo desenfreado.', true),
  ('e2000000-0000-4000-b000-000000000ebb', 'e2000000-0000-4000-a000-000000000179', 1, 'Produz efeitos perversos nos ecossistemas, que são sanados por cadeias de organismos decompositores que assumem o papel de eliminadores dos resíduos depositados em lixões.', false),
  ('e2000000-0000-4000-b000-000000000ebc', 'e2000000-0000-4000-a000-000000000179', 2, 'Multiplica o número de lixões a céu aberto, considerados atualmente a ferramenta capaz de resolver de forma simplificada e barata o problema de deposição de resíduos nas grandes cidades.', false),
  ('e2000000-0000-4000-b000-000000000ebd', 'e2000000-0000-4000-a000-000000000179', 3, 'Estimula o empreendedorismo social, visto que um grande número de pessoas, os catadores, têm livre acesso aos lixões, sendo assim incluídos na cadeia produtiva dos resíduos tecnológicos.', false),
  ('e2000000-0000-4000-b000-000000000ebe', 'e2000000-0000-4000-a000-000000000179', 4, 'Possibilita a ampliação da quantidade de rejeitos que podem ser destinados a associações e cooperativas de catadores de materiais recicláveis, financiados por instituições da sociedade civil ou pelo poder público.', false),
  ('e2000000-0000-4000-b000-000000000ec4', 'e2000000-0000-4000-a000-00000000017a', 0, 'A estagnação dos Estados com forte identidade cultural.', false),
  ('e2000000-0000-4000-b000-000000000ec5', 'e2000000-0000-4000-a000-00000000017a', 1, 'O alcance da racionalidade anticapitalista.', false),
  ('e2000000-0000-4000-b000-000000000ec6', 'e2000000-0000-4000-a000-00000000017a', 2, 'A influência das grandes potências econômicas.', true),
  ('e2000000-0000-4000-b000-000000000ec7', 'e2000000-0000-4000-a000-00000000017a', 3, 'A dissolução de blocos políticos regionais.', false),
  ('e2000000-0000-4000-b000-000000000ec8', 'e2000000-0000-4000-a000-00000000017a', 4, 'O alargamento da força econômica dos países islâmicos.', false),
  ('e2000000-0000-4000-b000-000000000ece', 'e2000000-0000-4000-a000-00000000017b', 0, 'A corrosão de metais, pinturas, monumentos históricos, destruição da cobertura vegetal e acidificação dos lagos.', true),
  ('e2000000-0000-4000-b000-000000000ecf', 'e2000000-0000-4000-a000-00000000017b', 1, 'A diminuição do aquecimento global, já que esse tipo de chuva retira poluentes da atmosfera.', false),
  ('e2000000-0000-4000-b000-000000000ed0', 'e2000000-0000-4000-a000-00000000017b', 2, 'A destruição da fauna e da flora, a redução dos recursos hídricos, com o assoreamento dos rios.', false),
  ('e2000000-0000-4000-b000-000000000ed1', 'e2000000-0000-4000-a000-00000000017b', 3, 'As enchentes, que atrapalham a vida do cidadão urbano, corroendo, em curto prazo, automóveis e fios de cobre da rede elétrica.', false),
  ('e2000000-0000-4000-b000-000000000ed2', 'e2000000-0000-4000-a000-00000000017b', 4, 'A degradação da terra nas regiões semiáridas, localizadas, em sua maioria, no Nordeste do nosso país.', false),
  ('e2000000-0000-4000-b000-000000000ed8', 'e2000000-0000-4000-a000-00000000017c', 0, 'O aprofundamento dos vínculos dos operários com as linhas de montagem sob influência dos modelos orientais de gestão.', false),
  ('e2000000-0000-4000-b000-000000000ed9', 'e2000000-0000-4000-a000-00000000017c', 1, 'O aumento das formas de teletrabalho como solução de larga escala para o problema do desemprego crônico.', false),
  ('e2000000-0000-4000-b000-000000000eda', 'e2000000-0000-4000-a000-00000000017c', 2, 'O avanço do trabalho flexível e da terceirização como respostas às demandas por inovação e com vistas à mobilidade dos investimentos.', true),
  ('e2000000-0000-4000-b000-000000000edb', 'e2000000-0000-4000-a000-00000000017c', 3, 'A autonomização crescente das máquinas e computadores em substituição ao trabalho dos especialistas técnicos e gestores.', false),
  ('e2000000-0000-4000-b000-000000000edc', 'e2000000-0000-4000-a000-00000000017c', 4, 'O fortalecimento do diálogo entre operários, gerentes, executivos e clientes com a garantia de harmonização das relações de trabalho.', false),
  ('e2000000-0000-4000-b000-000000000ee2', 'e2000000-0000-4000-a000-00000000017d', 0, 'Igualitária, com um nível satisfatório de distribuição da renda.', false),
  ('e2000000-0000-4000-b000-000000000ee3', 'e2000000-0000-4000-a000-00000000017d', 1, 'Estagnada, com uma relativa harmonia entre as classes.', false),
  ('e2000000-0000-4000-b000-000000000ee4', 'e2000000-0000-4000-a000-00000000017d', 2, 'Tradicional, com a manutenção da escravidão nos engenhos como forma produtiva típica.', false),
  ('e2000000-0000-4000-b000-000000000ee5', 'e2000000-0000-4000-a000-00000000017d', 3, 'Ditatorial, perturbada por um constante clima de opressão mantido pelo exército e polícia.', false),
  ('e2000000-0000-4000-b000-000000000ee6', 'e2000000-0000-4000-a000-00000000017d', 4, 'Agrária, marcada pela concentração da terra e do poder político local e regional.', true),
  ('e2000000-0000-4000-b000-000000000eec', 'e2000000-0000-4000-a000-00000000017e', 0, 'Determinam o papel do Estado nas transformações socioeconômicas.', false),
  ('e2000000-0000-4000-b000-000000000eed', 'e2000000-0000-4000-a000-00000000017e', 1, 'Aumentam o clima de tensão social na sociedade civil.', false),
  ('e2000000-0000-4000-b000-000000000eee', 'e2000000-0000-4000-a000-00000000017e', 2, 'Pressionam o Estado para o atendimento das demandas da sociedade.', true),
  ('e2000000-0000-4000-b000-000000000eef', 'e2000000-0000-4000-a000-00000000017e', 3, 'Privilegiam determinadas parcelas da sociedade em detrimento das demais.', false),
  ('e2000000-0000-4000-b000-000000000ef0', 'e2000000-0000-4000-a000-00000000017e', 4, 'Propiciam a adoção de valores éticos pelos órgãos do Estado.', false),
  ('e2000000-0000-4000-b000-000000000ef6', 'e2000000-0000-4000-a000-00000000017f', 0, 'O fim da inspiração liberal sobre a estrutura política brasileira', false),
  ('e2000000-0000-4000-b000-000000000ef7', 'e2000000-0000-4000-a000-00000000017f', 1, 'A ampliação do direito de voto para maioria dos brasileiros nascidos livres.', false),
  ('e2000000-0000-4000-b000-000000000ef8', 'e2000000-0000-4000-a000-00000000017f', 2, 'A concentração de poderes na região produtora de café, o Sudeste brasileiro.', false),
  ('e2000000-0000-4000-b000-000000000ef9', 'e2000000-0000-4000-a000-00000000017f', 3, 'O controle do poder político nas mãos dos grandes proprietários e comerciantes.', true),
  ('e2000000-0000-4000-b000-000000000efa', 'e2000000-0000-4000-a000-00000000017f', 4, 'A diminuição da interferência da Igreja Católica nas decisões político-administrativas.', false),
  ('e2000000-0000-4000-b000-000000000f00', 'e2000000-0000-4000-a000-000000000180', 0, 'A justiça brasileira, por meio de tratados e leis, tem conseguido inibir e, inclusive, extinguir a prática da tortura.', false),
  ('e2000000-0000-4000-b000-000000000f01', 'e2000000-0000-4000-a000-000000000180', 1, 'A existência da lei não basta como garantia de justiça para as vítimas e testemunhas dos casos de tortura.', true),
  ('e2000000-0000-4000-b000-000000000f02', 'e2000000-0000-4000-a000-000000000180', 2, 'As denúncias anônimas dificultam a ação da justiça, impedindo que torturadores sejam reconhecidos e identificados pelo crime cometido.', false),
  ('e2000000-0000-4000-b000-000000000f03', 'e2000000-0000-4000-a000-000000000180', 3, 'A falta de registro da tortura por parte das autoridades policiais, em razão do desconhecimento da tortura como crime, legitima a impunidade.', false),
  ('e2000000-0000-4000-b000-000000000f04', 'e2000000-0000-4000-a000-000000000180', 4, 'A justiça tem esbarrado na precária existência de jurisprudência a respeito da tortura, o que a impede de atuar nesses casos.', false),
  ('e2000000-0000-4000-b000-000000000f0a', 'e2000000-0000-4000-a000-000000000181', 0, 'Orientarem os cidadãos na compra dos bens necessários à sua sobrevivência e bem-estar.', false),
  ('e2000000-0000-4000-b000-000000000f0b', 'e2000000-0000-4000-a000-000000000181', 1, 'Fornecerem informações que fomentam o debate político na esfera pública.', true),
  ('e2000000-0000-4000-b000-000000000f0c', 'e2000000-0000-4000-a000-000000000181', 2, 'Apresentarem aos cidadãos a versão oficial dos fatos.', false),
  ('e2000000-0000-4000-b000-000000000f0d', 'e2000000-0000-4000-a000-000000000181', 3, 'Propiciarem o entretenimento, aspecto relevante para conscientização política.', false),
  ('e2000000-0000-4000-b000-000000000f0e', 'e2000000-0000-4000-a000-000000000181', 4, 'Promoverem a unidade cultural, por meio das transmissões esportivas.', false),
  ('e2000000-0000-4000-b000-000000000f14', 'e2000000-0000-4000-a000-000000000182', 0, 'A riqueza gerada pelo café dava à oligarquia paulista a prerrogativa de indicar os candidatos à presidência, sem necessidade de alianças.', false),
  ('e2000000-0000-4000-b000-000000000f15', 'e2000000-0000-4000-a000-000000000182', 1, 'As divisões políticas internas de cada estado da federação invalidavam o uso do conceito de aliança entre estados para este período.', false),
  ('e2000000-0000-4000-b000-000000000f16', 'e2000000-0000-4000-a000-000000000182', 2, 'As disputas políticas do período contradiziam a suposta estabilidade da aliança entre mineiros e paulistas.', true),
  ('e2000000-0000-4000-b000-000000000f17', 'e2000000-0000-4000-a000-000000000182', 3, 'A centralização do poder no executivo federal impedia a formação de uma aliança duradoura entre as oligarquias.', false),
  ('e2000000-0000-4000-b000-000000000f18', 'e2000000-0000-4000-a000-000000000182', 4, 'A diversificação da produção e a preocupação com o mercado interno unificavam os interesses das oligarquias.', false),
  ('e2000000-0000-4000-b000-000000000f1e', 'e2000000-0000-4000-a000-000000000183', 0, 'Defina seus projetos a partir dos interesses coletivos.', true),
  ('e2000000-0000-4000-b000-000000000f1f', 'e2000000-0000-4000-a000-000000000183', 1, 'Guie-se por interesses econômicos, prescritos pela lógica do mercado.', false),
  ('e2000000-0000-4000-b000-000000000f20', 'e2000000-0000-4000-a000-000000000183', 2, 'Priorize a evolução da tecnologia, se apropriando da natureza.', false),
  ('e2000000-0000-4000-b000-000000000f21', 'e2000000-0000-4000-a000-000000000183', 3, 'Promova a separação entre natureza e sociedade tecnológica.', false),
  ('e2000000-0000-4000-b000-000000000f22', 'e2000000-0000-4000-a000-000000000183', 4, 'Tenha gestão própria, com o objetivo de melhor apropriação da natureza.', false),
  ('e2000000-0000-4000-b000-000000000f28', 'e2000000-0000-4000-a000-000000000184', 0, 'Pelo uso intensivo do trabalho manual para desenvolver produtos autênticos e personalizados.', false),
  ('e2000000-0000-4000-b000-000000000f29', 'e2000000-0000-4000-a000-000000000184', 1, 'Pelo ingresso tardio das mulheres no mercado de trabalho no setor industrial.', false),
  ('e2000000-0000-4000-b000-000000000f2a', 'e2000000-0000-4000-a000-000000000184', 2, 'Pela participação ativa das empresas e dos próprios trabalhadores no processo de qualificação laboral.', true),
  ('e2000000-0000-4000-b000-000000000f2b', 'e2000000-0000-4000-a000-000000000184', 3, 'Pelo aumento na oferta de vagas para trabalhadores especializados em funções repetitivas.', false),
  ('e2000000-0000-4000-b000-000000000f2c', 'e2000000-0000-4000-a000-000000000184', 4, 'Pela manutenção de estoques de larga escala em função da alta produtividade.', false),
  ('e2000000-0000-4000-b000-000000000f32', 'e2000000-0000-4000-a000-000000000185', 0, '1940-1950 – direito de voto para os ex-escravos.', false),
  ('e2000000-0000-4000-b000-000000000f33', 'e2000000-0000-4000-a000-000000000185', 1, '1950-1960 – fim do voto secreto.', false),
  ('e2000000-0000-4000-b000-000000000f34', 'e2000000-0000-4000-a000-000000000185', 2, '1960-1970 – direito de voto para as mulheres.', false),
  ('e2000000-0000-4000-b000-000000000f35', 'e2000000-0000-4000-a000-000000000185', 3, '1970-1980 – fim do voto obrigatório.', false),
  ('e2000000-0000-4000-b000-000000000f36', 'e2000000-0000-4000-a000-000000000185', 4, '1980-1996 – direito de voto para os analfabetos.', true),
  ('e2000000-0000-4000-b000-000000000f3c', 'e2000000-0000-4000-a000-000000000186', 0, 'Valorizar as propostas políticas democráticas e liberais vitoriosas.', false),
  ('e2000000-0000-4000-b000-000000000f3d', 'e2000000-0000-4000-a000-000000000186', 1, 'Resgatar simbolicamente as figuras políticas ligadas à Monarquia.', false),
  ('e2000000-0000-4000-b000-000000000f3e', 'e2000000-0000-4000-a000-000000000186', 2, 'Criticar a política educacional adotada durante a República Velha.', false),
  ('e2000000-0000-4000-b000-000000000f3f', 'e2000000-0000-4000-a000-000000000186', 3, 'Legitimar a ordem política inaugurada com a chegada desse grupo ao poder.', true),
  ('e2000000-0000-4000-b000-000000000f40', 'e2000000-0000-4000-a000-000000000186', 4, 'Destacar a ampla participação popular obtida no processo da Proclamação.', false),
  ('e2000000-0000-4000-b000-000000000f46', 'e2000000-0000-4000-a000-000000000187', 0, 'Codificam informações transmitidas nos programas infantis por meio da observação.', false),
  ('e2000000-0000-4000-b000-000000000f47', 'e2000000-0000-4000-a000-000000000187', 1, 'Adquirem conhecimentos variados que incentivam o processo de interação social.', false),
  ('e2000000-0000-4000-b000-000000000f48', 'e2000000-0000-4000-a000-000000000187', 2, 'Interiorizam padrões de comportamento e papéis sociais com menor visão crítica.', true),
  ('e2000000-0000-4000-b000-000000000f49', 'e2000000-0000-4000-a000-000000000187', 3, 'Observam formas de convivência social baseadas na tolerância e no respeito.', false),
  ('e2000000-0000-4000-b000-000000000f4a', 'e2000000-0000-4000-a000-000000000187', 4, 'Apreendem modelos de sociedade pautados na observância das leis.', false),
  ('e2000000-0000-4000-b000-000000000f50', 'e2000000-0000-4000-a000-000000000188', 0, 'O planejamento para a implantação de infraestruturas urbanas necessárias para atender as necessidades básicas dos moradores.', false),
  ('e2000000-0000-4000-b000-000000000f51', 'e2000000-0000-4000-a000-000000000188', 1, 'A organização de associações de moradores interessadas na melhoria do espaço urbano e financiadas pelo poder público.', false),
  ('e2000000-0000-4000-b000-000000000f52', 'e2000000-0000-4000-a000-000000000188', 2, 'A presença de ações referentes à educação ambiental com consequente preservação dos espaços naturais circundantes.', false),
  ('e2000000-0000-4000-b000-000000000f53', 'e2000000-0000-4000-a000-000000000188', 3, 'A ocupação de áreas de risco suscetíveis a enchentes ou desmoronamentos com consequentes perdas materiais e humanas.', true),
  ('e2000000-0000-4000-b000-000000000f54', 'e2000000-0000-4000-a000-000000000188', 4, 'O isolamento socioeconômico dos moradores ocupantes desses espaços com a resultante multiplicação de políticas que tentam reverter esse quadro.', false),
  ('e2000000-0000-4000-b000-000000000f5a', 'e2000000-0000-4000-a000-000000000189', 0, 'O uso de trajes simples indica a rápida incorporação dos ex-escravos ao mundo do trabalho urbano.', false),
  ('e2000000-0000-4000-b000-000000000f5b', 'e2000000-0000-4000-a000-000000000189', 1, 'A presença de acessórios como chapéu e sombrinha aponta para a manutenção de elementos culturais de origem africana.', false),
  ('e2000000-0000-4000-b000-000000000f5c', 'e2000000-0000-4000-a000-000000000189', 2, 'O uso de sapatos é um importante elemento de diferenciação social entre negros libertos ou em melhores condições na ordem escravocrata.', true),
  ('e2000000-0000-4000-b000-000000000f5d', 'e2000000-0000-4000-a000-000000000189', 3, 'A utilização do paletó e do vestido demonstra a tentativa de assimilação de um estilo europeu como forma de distinção em relação aos brasileiros.', false),
  ('e2000000-0000-4000-b000-000000000f5e', 'e2000000-0000-4000-a000-000000000189', 4, 'A adoção de roupas próprias para o trabalho doméstico tinha como finalidade demarcar as fronteiras da exclusão social naquele contexto.', false),
  ('e2000000-0000-4000-b000-000000000f64', 'e2000000-0000-4000-a000-00000000018a', 0, 'República Federalista Norte-Americana.', false),
  ('e2000000-0000-4000-b000-000000000f65', 'e2000000-0000-4000-a000-00000000018a', 1, 'República Fascista Italiana no século XX.', true),
  ('e2000000-0000-4000-b000-000000000f66', 'e2000000-0000-4000-a000-00000000018a', 2, 'Monarquia Teocrática do Egito Antigo.', false),
  ('e2000000-0000-4000-b000-000000000f67', 'e2000000-0000-4000-a000-00000000018a', 3, 'Monarquia Absoluta Francesa no século XVII.', false),
  ('e2000000-0000-4000-b000-000000000f68', 'e2000000-0000-4000-a000-00000000018a', 4, 'Monarquia Constitucional Brasileira no século XIX.', false),
  ('e2000000-0000-4000-b000-000000000f6e', 'e2000000-0000-4000-a000-00000000018b', 0, 'Do destino dado ao produto do trabalho nos seus sistemas culturais.', true),
  ('e2000000-0000-4000-b000-000000000f6f', 'e2000000-0000-4000-a000-00000000018b', 1, 'Da preocupação com a preservação dos recursos ambientais.', false),
  ('e2000000-0000-4000-b000-000000000f70', 'e2000000-0000-4000-a000-00000000018b', 2, 'Do interesse de ambas em uma exploração comercial mais lucrativa do pau-brasil.', false),
  ('e2000000-0000-4000-b000-000000000f71', 'e2000000-0000-4000-a000-00000000018b', 3, 'Da curiosidade, reverência e abertura cultural recíprocas.', false),
  ('e2000000-0000-4000-b000-000000000f72', 'e2000000-0000-4000-a000-00000000018b', 4, 'Da preocupação com o armazenamento de madeira para os períodos de inverno.', false),
  ('e2000000-0000-4000-b000-000000000f78', 'e2000000-0000-4000-a000-00000000018c', 0, 'Legitima o ensino das ciências humanas nas escolas.', false),
  ('e2000000-0000-4000-b000-000000000f79', 'e2000000-0000-4000-a000-00000000018c', 1, 'Divulga conhecimentos para a população afro-brasileira.', false),
  ('e2000000-0000-4000-b000-000000000f7a', 'e2000000-0000-4000-a000-00000000018c', 2, 'Reforça a concepção etnocêntrica sobre a África e sua cultura.', false),
  ('e2000000-0000-4000-b000-000000000f7b', 'e2000000-0000-4000-a000-00000000018c', 3, 'Garante aos afrodescendentes a igualdade no acesso à educação.', false),
  ('e2000000-0000-4000-b000-000000000f7c', 'e2000000-0000-4000-a000-00000000018c', 4, 'Impulsiona o reconhecimento da pluralidade étnico-racial do país.', true),
  ('e2000000-0000-4000-b000-000000000f82', 'e2000000-0000-4000-a000-00000000018d', 0, 'O lucro obtido com o seu comércio ser muito vantajoso.', true),
  ('e2000000-0000-4000-b000-000000000f83', 'e2000000-0000-4000-a000-00000000018d', 1, 'Os árabes serem aliados históricos dos portugueses', false),
  ('e2000000-0000-4000-b000-000000000f84', 'e2000000-0000-4000-a000-00000000018d', 2, 'A mão de obra necessária para o cultivo ser insuficiente.', false),
  ('e2000000-0000-4000-b000-000000000f85', 'e2000000-0000-4000-a000-00000000018d', 3, 'As feitorias africanas facilitarem a comercialização desse produto.', false),
  ('e2000000-0000-4000-b000-000000000f86', 'e2000000-0000-4000-a000-00000000018d', 4, 'Os nativos da América dominarem uma técnica de cultivo semelhante.', false),
  ('e2000000-0000-4000-b000-000000000f8c', 'e2000000-0000-4000-a000-00000000018e', 0, 'Instalar um partido nacional, sob sua liderança, garantindo participação controlada dos afro-brasileiros e inibindo novas rebeliões de negros.', false),
  ('e2000000-0000-4000-b000-000000000f8d', 'e2000000-0000-4000-a000-00000000018e', 1, 'Atender aos clamores apresentados no movimento baiano, de modo a inviabilizar novas rebeliões, garantindo o controle da situação.', false),
  ('e2000000-0000-4000-b000-000000000f8e', 'e2000000-0000-4000-a000-00000000018e', 2, 'Firmar alianças com as lideranças escravas, permitindo a promoção de mudanças exigidas pelo povo sem a profundidade proposta inicialmente.', false),
  ('e2000000-0000-4000-b000-000000000f8f', 'e2000000-0000-4000-a000-00000000018e', 3, 'Impedir que o povo conferisse ao movimento um teor libertário, o que terminaria por prejudicar seus interesses e seu projeto de nação.', true),
  ('e2000000-0000-4000-b000-000000000f90', 'e2000000-0000-4000-a000-00000000018e', 4, 'Rebelar-se contra as representações metropolitanas, isolando politicamente o Príncipe Regente, instalando um governo conservador para controlar o povo.', false),
  ('e2000000-0000-4000-b000-000000000f96', 'e2000000-0000-4000-a000-00000000018f', 0, 'O crescimento das atividades comerciais e urbanas.', true),
  ('e2000000-0000-4000-b000-000000000f97', 'e2000000-0000-4000-a000-00000000018f', 1, 'A migração de camponeses e artesãos', false),
  ('e2000000-0000-4000-b000-000000000f98', 'e2000000-0000-4000-a000-00000000018f', 2, 'A expansão dos parques industriais e fabris.', false),
  ('e2000000-0000-4000-b000-000000000f99', 'e2000000-0000-4000-a000-00000000018f', 3, 'O aumento do número de castelos e feudos.', false),
  ('e2000000-0000-4000-b000-000000000f9a', 'e2000000-0000-4000-a000-00000000018f', 4, 'A contenção das epidemias e doenças.', false),
  ('e2000000-0000-4000-b000-000000000fa0', 'e2000000-0000-4000-a000-000000000190', 0, 'Incapacidade do cristianismo de incorporar aspectos de outras religiões.', false),
  ('e2000000-0000-4000-b000-000000000fa1', 'e2000000-0000-4000-a000-000000000190', 1, 'Incorporação da ideia de liberdade religiosa na esfera pública.', false),
  ('e2000000-0000-4000-b000-000000000fa2', 'e2000000-0000-4000-a000-000000000190', 2, 'Permissão para o funcionamento de igrejas não cristãs.', false),
  ('e2000000-0000-4000-b000-000000000fa3', 'e2000000-0000-4000-a000-000000000190', 3, 'Relação de integração entre Estado e Igreja.', true),
  ('e2000000-0000-4000-b000-000000000fa4', 'e2000000-0000-4000-a000-000000000190', 4, 'Influência das religiões de origem africana.', false),
  ('e2000000-0000-4000-b000-000000000faa', 'e2000000-0000-4000-a000-000000000191', 0, 'Perda de nutrientes do solo devido à utilização constante de máquinas.', false),
  ('e2000000-0000-4000-b000-000000000fab', 'e2000000-0000-4000-a000-000000000191', 1, 'Eficiência e racionalidade no plantio com maior produtividade na colheita.', true),
  ('e2000000-0000-4000-b000-000000000fac', 'e2000000-0000-4000-a000-000000000191', 2, 'Ampliação da oferta de empregos nesse tipo de ambiente produtivo. D', false),
  ('e2000000-0000-4000-b000-000000000fad', 'e2000000-0000-4000-a000-000000000191', 3, 'Menor compactação do solo pelo uso de maquinário agrícola de porte.', false),
  ('e2000000-0000-4000-b000-000000000fae', 'e2000000-0000-4000-a000-000000000191', 4, 'Poluição do ar pelo consumo de combustíveis fósseis pelas máquinas.', false),
  ('e2000000-0000-4000-b000-000000000fb4', 'e2000000-0000-4000-a000-000000000192', 0, 'Fé e misticismo.', false),
  ('e2000000-0000-4000-b000-000000000fb5', 'e2000000-0000-4000-a000-000000000192', 1, 'Ciência e arte.', true),
  ('e2000000-0000-4000-b000-000000000fb6', 'e2000000-0000-4000-a000-000000000192', 2, 'Cultura e comércio.', false),
  ('e2000000-0000-4000-b000-000000000fb7', 'e2000000-0000-4000-a000-000000000192', 3, 'Política e economia.', false),
  ('e2000000-0000-4000-b000-000000000fb8', 'e2000000-0000-4000-a000-000000000192', 4, 'Astronomia e religião.', false),
  ('e2000000-0000-4000-b000-000000000fbe', 'e2000000-0000-4000-a000-000000000193', 0, 'Pela presença de órgãos econômicos internacionais como o Fundo Monetário Internacional (FMI) e o Banco Mundial, que restringem os investimentos chineses, uma vez que estes não se preocupam com a preservação do meio ambiente.', false),
  ('e2000000-0000-4000-b000-000000000fbf', 'e2000000-0000-4000-a000-000000000193', 1, 'Pela ação de ONGs (Organizações Não Governamentais) que limitam os investimentos estatais chineses, uma vez que estes se mostram desinteressados em relação aos problemas sociais africanos.', false),
  ('e2000000-0000-4000-b000-000000000fc0', 'e2000000-0000-4000-a000-000000000193', 2, 'Pela aliança com os capitais e investimentos diretos realizados pelos países ocidentais, promovendo o crescimento econômico de algumas regiões desse continente.', false),
  ('e2000000-0000-4000-b000-000000000fc1', 'e2000000-0000-4000-a000-000000000193', 3, 'Pela presença cada vez maior de investimentos diretos, o que pode representar uma ameaça à soberania dos países africanos ou manipulação das ações destes governos em favor dos grandes projetos', true),
  ('e2000000-0000-4000-b000-000000000fc2', 'e2000000-0000-4000-a000-000000000193', 4, 'Pela presença de um número cada vez maior de diplomatas, o que pode levar à formação de um Mercado Comum Sino-Africano, ameaçando os interesses ocidentais.', false),
  ('e2000000-0000-4000-b000-000000000fc8', 'e2000000-0000-4000-a000-000000000194', 0, 'Ateísmo', false),
  ('e2000000-0000-4000-b000-000000000fc9', 'e2000000-0000-4000-a000-000000000194', 1, 'Judaísmo', false),
  ('e2000000-0000-4000-b000-000000000fca', 'e2000000-0000-4000-a000-000000000194', 2, 'Hinduísmo.', false),
  ('e2000000-0000-4000-b000-000000000fcb', 'e2000000-0000-4000-a000-000000000194', 3, 'Islamismo', true),
  ('e2000000-0000-4000-b000-000000000fcc', 'e2000000-0000-4000-a000-000000000194', 4, 'Protestantismo.', false),
  ('e2000000-0000-4000-b000-000000000fd2', 'e2000000-0000-4000-a000-000000000195', 0, 'Fim da intervenção estatal na economia.', false),
  ('e2000000-0000-4000-b000-000000000fd3', 'e2000000-0000-4000-a000-000000000195', 1, 'Crescimento do setor de bens de consumo.', false),
  ('e2000000-0000-4000-b000-000000000fd4', 'e2000000-0000-4000-a000-000000000195', 2, 'Controle do desenvolvimento industrial.', false),
  ('e2000000-0000-4000-b000-000000000fd5', 'e2000000-0000-4000-a000-000000000195', 3, 'Atração de investimentos estrangeiros.', false),
  ('e2000000-0000-4000-b000-000000000fd6', 'e2000000-0000-4000-a000-000000000195', 4, 'Limitação da propriedade privada.', true),
  ('e2000000-0000-4000-b000-000000000fdc', 'e2000000-0000-4000-a000-000000000196', 0, 'Constituía mais uma ameaça para a democracia brasileira, ao difundir a ideologia comunista.', true),
  ('e2000000-0000-4000-b000-000000000fdd', 'e2000000-0000-4000-a000-000000000196', 1, 'Contribuía com a valorização da genuína cultura nacional, ao encenar peças de cunho popular', false),
  ('e2000000-0000-4000-b000-000000000fde', 'e2000000-0000-4000-a000-000000000196', 2, 'Realizava uma tarefa que deveria ser exclusiva do Estado, ao pretender educar o povo por meio da cultura.', false),
  ('e2000000-0000-4000-b000-000000000fdf', 'e2000000-0000-4000-a000-000000000196', 3, 'Prestava um serviço importante à sociedade brasileira, ao incentivar a participação política dos mais pobres.', false),
  ('e2000000-0000-4000-b000-000000000fe0', 'e2000000-0000-4000-a000-000000000196', 4, 'Diminuía a força dos operários urbanos, ao substituir os sindicatos como instituição de pressão política sobre o governo.', false),
  ('e2000000-0000-4000-b000-000000000fe6', 'e2000000-0000-4000-a000-000000000197', 0, 'A insatisfação da população com os benefícios de uma modernização urbana autoritária.', true),
  ('e2000000-0000-4000-b000-000000000fe7', 'e2000000-0000-4000-a000-000000000197', 1, 'A consciência da população pobre sobre a necessidade de vacinação para a erradicação das epidemias.', false),
  ('e2000000-0000-4000-b000-000000000fe8', 'e2000000-0000-4000-a000-000000000197', 2, 'A garantia do processo democrático instaurado com a República, através da defesa da liberdade de expressão da população.', false),
  ('e2000000-0000-4000-b000-000000000fe9', 'e2000000-0000-4000-a000-000000000197', 3, 'O planejamento do governo republicano na área de saúde, que abrangia a população em geral.', false),
  ('e2000000-0000-4000-b000-000000000fea', 'e2000000-0000-4000-a000-000000000197', 4, 'O apoio ao governo republicano pela atitude de vacinar toda a população em vez de privilegiar a elite.', false),
  ('e2000000-0000-4000-b000-000000000ff0', 'e2000000-0000-4000-a000-000000000198', 0, 'A autonomia do setor primário.', false),
  ('e2000000-0000-4000-b000-000000000ff1', 'e2000000-0000-4000-a000-000000000198', 1, 'A importância do setor financeiro.', true),
  ('e2000000-0000-4000-b000-000000000ff2', 'e2000000-0000-4000-a000-000000000198', 2, 'O distanciamento entre campo e cidade.', false),
  ('e2000000-0000-4000-b000-000000000ff3', 'e2000000-0000-4000-a000-000000000198', 3, 'A subordinação da indústria à agricultura.', false),
  ('e2000000-0000-4000-b000-000000000ff4', 'e2000000-0000-4000-a000-000000000198', 4, 'A horizontalidade das relações produtivas.', false),
  ('e2000000-0000-4000-b000-000000000ffa', 'e2000000-0000-4000-a000-000000000199', 0, 'A busca de oportunidades de trabalho e o aumento de barreiras contra a imigração.', true),
  ('e2000000-0000-4000-b000-000000000ffb', 'e2000000-0000-4000-a000-000000000199', 1, 'A necessidade de qualificação profissional e a abertura das fronteiras para os imigrantes.', false),
  ('e2000000-0000-4000-b000-000000000ffc', 'e2000000-0000-4000-a000-000000000199', 2, 'O desenvolvimento de projetos de pesquisa e o acautelamento dos bens dos imigrantes.', false),
  ('e2000000-0000-4000-b000-000000000ffd', 'e2000000-0000-4000-a000-000000000199', 3, 'A expansão da fronteira agrícola e a expulsão dos imigrantes qualificados.', false),
  ('e2000000-0000-4000-b000-000000000ffe', 'e2000000-0000-4000-a000-000000000199', 4, 'A fuga decorrente de conflitos políticos e o fortalecimento de políticas sociais.', false),
  ('e2000000-0000-4000-b000-000000001004', 'e2000000-0000-4000-a000-00000000019a', 0, 'O travamento do motor, para que ele não se solte aleatoriamente.', false),
  ('e2000000-0000-4000-b000-000000001005', 'e2000000-0000-4000-a000-00000000019a', 1, 'A seleção da velocidade, controlada pela pressão nos dentes da engrenagem.', false),
  ('e2000000-0000-4000-b000-000000001006', 'e2000000-0000-4000-a000-00000000019a', 2, 'O controle do sentido da velocidade tangencial, permitindo, inclusive, uma fácil leitura do seu valor.', false),
  ('e2000000-0000-4000-b000-000000001007', 'e2000000-0000-4000-a000-00000000019a', 3, 'A determinação do movimento, devido ao caráter aleatório, cuja tendência é o equilíbrio.', true),
  ('e2000000-0000-4000-b000-000000001008', 'e2000000-0000-4000-a000-00000000019a', 4, 'A escolha do ângulo a ser girado, sendo possível, inclusive, medi-lo pelo número de dentes da engrenagem.', false),
  ('e2000000-0000-4000-b000-00000000100e', 'e2000000-0000-4000-a000-00000000019b', 0, 'Produtor e consumidor primário.', false),
  ('e2000000-0000-4000-b000-00000000100f', 'e2000000-0000-4000-a000-00000000019b', 1, 'Consumidor primário e consumidor secundário.', false),
  ('e2000000-0000-4000-b000-000000001010', 'e2000000-0000-4000-a000-00000000019b', 2, 'Consumidor secundário e consumidor terciário.', true),
  ('e2000000-0000-4000-b000-000000001011', 'e2000000-0000-4000-a000-00000000019b', 3, 'Consumidor terciário e produtor.', false),
  ('e2000000-0000-4000-b000-000000001012', 'e2000000-0000-4000-a000-00000000019b', 4, 'Consumidor secundário e consumidor primário.', false),
  ('e2000000-0000-4000-b000-000000001018', 'e2000000-0000-4000-a000-00000000019c', 0, 'Febre alta e constante.', false),
  ('e2000000-0000-4000-b000-000000001019', 'e2000000-0000-4000-a000-00000000019c', 1, 'Redução de imunidade.', false),
  ('e2000000-0000-4000-b000-00000000101a', 'e2000000-0000-4000-a000-00000000019c', 2, 'Aumento da pressão arterial.', false),
  ('e2000000-0000-4000-b000-00000000101b', 'e2000000-0000-4000-a000-00000000019c', 3, 'Quadro de leucemia profunda.', false),
  ('e2000000-0000-4000-b000-00000000101c', 'e2000000-0000-4000-a000-00000000019c', 4, 'Problemas no transporte de oxigênio.', true),
  ('e2000000-0000-4000-b000-000000001022', 'e2000000-0000-4000-a000-00000000019d', 0, 'O sangramento nasal é devido à baixa quantidade de plaquetas, que são responsáveis pela coagulação sanguínea.', true),
  ('e2000000-0000-4000-b000-000000001023', 'e2000000-0000-4000-a000-00000000019d', 1, 'O cansaço ocorreu em função da quantidade de glóbulos brancos, que são responsáveis pela coagulação sanguínea.', false),
  ('e2000000-0000-4000-b000-000000001024', 'e2000000-0000-4000-a000-00000000019d', 2, 'A dificuldade respiratória decorreu da baixa quantidade de glóbulos vermelhos, que são responsáveis pela defesa imunológica.', false),
  ('e2000000-0000-4000-b000-000000001025', 'e2000000-0000-4000-a000-00000000019d', 3, 'O sangramento nasal é decorrente da baixa quantidade de glóbulos brancos, que são responsáveis pelo transporte de gases no sangue.', false),
  ('e2000000-0000-4000-b000-000000001026', 'e2000000-0000-4000-a000-00000000019d', 4, 'A dificuldade respiratória ocorreu pela quantidade de plaquetas, que são responsáveis pelo transporte de oxigênio no sangue.', false),
  ('e2000000-0000-4000-b000-00000000102c', 'e2000000-0000-4000-a000-00000000019e', 0, 'Benzeno.', false),
  ('e2000000-0000-4000-b000-00000000102d', 'e2000000-0000-4000-a000-00000000019e', 1, 'Metano.', false),
  ('e2000000-0000-4000-b000-00000000102e', 'e2000000-0000-4000-a000-00000000019e', 2, 'Glicose.', true),
  ('e2000000-0000-4000-b000-00000000102f', 'e2000000-0000-4000-a000-00000000019e', 3, 'Octano.', false),
  ('e2000000-0000-4000-b000-000000001030', 'e2000000-0000-4000-a000-00000000019e', 4, 'Etanol.', false),
  ('e2000000-0000-4000-b000-000000001036', 'e2000000-0000-4000-a000-00000000019f', 0, 'Construção, nas pequenas propriedades, de grandes fornos elétricos para torrar a mandioca.', false),
  ('e2000000-0000-4000-b000-000000001037', 'e2000000-0000-4000-a000-00000000019f', 1, 'Plantação, em suas propriedades, de árvores para serem utilizadas na produção de lenha.', false),
  ('e2000000-0000-4000-b000-000000001038', 'e2000000-0000-4000-a000-00000000019f', 2, 'Permissão, por parte do Ibama, da exploração da Mata Atlântica apenas pelos pequenos produtores.', false),
  ('e2000000-0000-4000-b000-000000001039', 'e2000000-0000-4000-a000-00000000019f', 3, 'Construção de biodigestores, para a produção de gás combustível a partir de resíduos orgânicos da região.', true),
  ('e2000000-0000-4000-b000-00000000103a', 'e2000000-0000-4000-a000-00000000019f', 4, 'Coleta de carvão de regiões mais distantes, onde existe menor intensidade de fiscalização do Ibama.', false),
  ('e2000000-0000-4000-b000-000000001040', 'e2000000-0000-4000-a000-0000000001a0', 0, 'Filtração.', false),
  ('e2000000-0000-4000-b000-000000001041', 'e2000000-0000-4000-a000-0000000001a0', 1, 'Cloração.', true),
  ('e2000000-0000-4000-b000-000000001042', 'e2000000-0000-4000-a000-0000000001a0', 2, 'Coagulação.', false),
  ('e2000000-0000-4000-b000-000000001043', 'e2000000-0000-4000-a000-0000000001a0', 3, 'Fluoretação.', false),
  ('e2000000-0000-4000-b000-000000001044', 'e2000000-0000-4000-a000-0000000001a0', 4, 'Decantação.', false),
  ('e2000000-0000-4000-b000-00000000104a', 'e2000000-0000-4000-a000-0000000001a1', 0, 'Alta concentração de macrófagos.', false),
  ('e2000000-0000-4000-b000-00000000104b', 'e2000000-0000-4000-a000-0000000001a1', 1, 'Elevada taxa de anticorpos específicos anti-HPV circulantes.', false),
  ('e2000000-0000-4000-b000-00000000104c', 'e2000000-0000-4000-a000-0000000001a1', 2, 'Aumento na produção de hemácias após a infecção por vírus HPV.', false),
  ('e2000000-0000-4000-b000-00000000104d', 'e2000000-0000-4000-a000-0000000001a1', 3, 'Rapidez na produção de altas concentrações de linfócitos matadores.', false),
  ('e2000000-0000-4000-b000-00000000104e', 'e2000000-0000-4000-a000-0000000001a1', 4, 'Presença de células de memória que atuam na resposta secundária.', true),
  ('e2000000-0000-4000-b000-000000001054', 'e2000000-0000-4000-a000-0000000001a2', 0, 'I e II.', false),
  ('e2000000-0000-4000-b000-000000001055', 'e2000000-0000-4000-a000-0000000001a2', 1, 'I e III.', false),
  ('e2000000-0000-4000-b000-000000001056', 'e2000000-0000-4000-a000-0000000001a2', 2, 'II e IV.', true),
  ('e2000000-0000-4000-b000-000000001057', 'e2000000-0000-4000-a000-0000000001a2', 3, 'III e V.', false),
  ('e2000000-0000-4000-b000-000000001058', 'e2000000-0000-4000-a000-0000000001a2', 4, 'IV e V.', false),
  ('e2000000-0000-4000-b000-00000000105e', 'e2000000-0000-4000-a000-0000000001a3', 0, 'Lipofilia.', false),
  ('e2000000-0000-4000-b000-00000000105f', 'e2000000-0000-4000-a000-0000000001a3', 1, 'Hidrofilia.', true),
  ('e2000000-0000-4000-b000-000000001060', 'e2000000-0000-4000-a000-0000000001a3', 2, 'Hipocromia.', false),
  ('e2000000-0000-4000-b000-000000001061', 'e2000000-0000-4000-a000-0000000001a3', 3, 'Cromatofilia.', false),
  ('e2000000-0000-4000-b000-000000001062', 'e2000000-0000-4000-a000-0000000001a3', 4, 'Hiperpolarização.', false),
  ('e2000000-0000-4000-b000-000000001068', 'e2000000-0000-4000-a000-0000000001a4', 0, 'Isola a passagem de corrente elétrica da bobina para o alto-falante.', false),
  ('e2000000-0000-4000-b000-000000001069', 'e2000000-0000-4000-a000-0000000001a4', 1, 'Varia seu comprimento mais intensamente do que ocorre com o aço.', false),
  ('e2000000-0000-4000-b000-00000000106a', 'e2000000-0000-4000-a000-0000000001a4', 2, 'Apresenta uma magnetização desprezível sob a ação do ímã permanente.', true),
  ('e2000000-0000-4000-b000-00000000106b', 'e2000000-0000-4000-a000-0000000001a4', 3, 'Induz correntes elétricas na bobina mais intensas que a capacidade do captador.', false),
  ('e2000000-0000-4000-b000-00000000106c', 'e2000000-0000-4000-a000-0000000001a4', 4, 'Oscila com uma frequência menor do que a que pode ser percebida pelo captador.', false),
  ('e2000000-0000-4000-b000-000000001072', 'e2000000-0000-4000-a000-0000000001a5', 0, 'Introdução de um parasita no ambiente da espécie que se deseja combater.', true),
  ('e2000000-0000-4000-b000-000000001073', 'e2000000-0000-4000-a000-0000000001a5', 1, 'Introdução de um gene letal nas borboletas, a fim de diminuir o número de indivíduos.', false),
  ('e2000000-0000-4000-b000-000000001074', 'e2000000-0000-4000-a000-0000000001a5', 2, 'Competição entre a borboleta e a microvespa para a obtenção de recursos.', false),
  ('e2000000-0000-4000-b000-000000001075', 'e2000000-0000-4000-a000-0000000001a5', 3, 'Modificação do ambiente para selecionar indivíduos melhor adaptados.', false),
  ('e2000000-0000-4000-b000-000000001076', 'e2000000-0000-4000-a000-0000000001a5', 4, 'Aplicação de inseticidas a fim de diminuir o número de indivíduos que se deseja combater.', false),
  ('e2000000-0000-4000-b000-00000000107c', 'e2000000-0000-4000-a000-0000000001a6', 0, 'Ligações iônicas.', false),
  ('e2000000-0000-4000-b000-00000000107d', 'e2000000-0000-4000-a000-0000000001a6', 1, 'Forças de London.', false),
  ('e2000000-0000-4000-b000-00000000107e', 'e2000000-0000-4000-a000-0000000001a6', 2, 'Ligações covalentes.', false),
  ('e2000000-0000-4000-b000-00000000107f', 'e2000000-0000-4000-a000-0000000001a6', 3, 'Forças dipolo-dipolo.', false),
  ('e2000000-0000-4000-b000-000000001080', 'e2000000-0000-4000-a000-0000000001a6', 4, 'Ligações de hidrogênio.', true),
  ('e2000000-0000-4000-b000-000000001086', 'e2000000-0000-4000-a000-0000000001a7', 0, 'Difusão, pois a cal se difunde nos corpos dos seres do microambiente e os intoxica.', false),
  ('e2000000-0000-4000-b000-000000001087', 'e2000000-0000-4000-a000-0000000001a7', 1, 'Osmose, pois a cal retira água do microambiente, tornando-o inviável ao desenvolvimento de microrganismos.', true),
  ('e2000000-0000-4000-b000-000000001088', 'e2000000-0000-4000-a000-0000000001a7', 2, 'Oxidação, pois a luz solar que incide sobre o tronco ativa fotoquimicamente a cal, que elimina os seres vivos do microambiente.', false),
  ('e2000000-0000-4000-b000-000000001089', 'e2000000-0000-4000-a000-0000000001a7', 3, 'Aquecimento, pois a luz do Sol incide sobre o tronco e aquece a cal, que mata os seres vivos do microambiente.', false),
  ('e2000000-0000-4000-b000-00000000108a', 'e2000000-0000-4000-a000-0000000001a7', 4, 'Vaporização, pois a cal facilita a volatilização da água para a atmosfera, eliminando os seres vivos do microambiente.', false),
  ('e2000000-0000-4000-b000-000000001090', 'e2000000-0000-4000-a000-0000000001a8', 0, '0,3.', true),
  ('e2000000-0000-4000-b000-000000001091', 'e2000000-0000-4000-a000-0000000001a8', 1, '0,6.', false),
  ('e2000000-0000-4000-b000-000000001092', 'e2000000-0000-4000-a000-0000000001a8', 2, '0,8.', false),
  ('e2000000-0000-4000-b000-000000001093', 'e2000000-0000-4000-a000-0000000001a8', 3, '1,7.', false),
  ('e2000000-0000-4000-b000-000000001094', 'e2000000-0000-4000-a000-0000000001a8', 4, '3,0.', false),
  ('e2000000-0000-4000-b000-00000000109a', 'e2000000-0000-4000-a000-0000000001a9', 0, 'A replicação do DNA é conservativa, isto é, a fita dupla filha é recém sintetizada e o filamento parental é conservado.', false),
  ('e2000000-0000-4000-b000-00000000109b', 'e2000000-0000-4000-a000-0000000001a9', 1, 'A replicação de DNA é dispersiva, isto é, as fitas filhas contêm DNA recém-sintetizado e parentais em cada uma das fitas.', false),
  ('e2000000-0000-4000-b000-00000000109c', 'e2000000-0000-4000-a000-0000000001a9', 2, 'A replicação é semiconservativa, isto é, as fitas filhas consistem de uma fita parental e uma recém-sintetizada.', true),
  ('e2000000-0000-4000-b000-00000000109d', 'e2000000-0000-4000-a000-0000000001a9', 3, 'A replicação do DNA é conservativa, isto é, as fitas filhas consistem de moléculas de DNA parental.', false),
  ('e2000000-0000-4000-b000-00000000109e', 'e2000000-0000-4000-a000-0000000001a9', 4, 'A replicação é semiconservativa, isto é, as fitas filhas consistem de uma fita molde e uma fita codificadora.', false),
  ('e2000000-0000-4000-b000-0000000010a4', 'e2000000-0000-4000-a000-0000000001aa', 0, 'C.', false),
  ('e2000000-0000-4000-b000-0000000010a5', 'e2000000-0000-4000-a000-0000000001aa', 1, 'N.', true),
  ('e2000000-0000-4000-b000-0000000010a6', 'e2000000-0000-4000-a000-0000000001aa', 2, 'P.', false),
  ('e2000000-0000-4000-b000-0000000010a7', 'e2000000-0000-4000-a000-0000000001aa', 3, 'CO2.', false),
  ('e2000000-0000-4000-b000-0000000010a8', 'e2000000-0000-4000-a000-0000000001aa', 4, 'PO43-.', false),
  ('e2000000-0000-4000-b000-0000000010ae', 'e2000000-0000-4000-a000-0000000001ab', 0, 'Azul.', false),
  ('e2000000-0000-4000-b000-0000000010af', 'e2000000-0000-4000-a000-0000000001ab', 1, 'Verde.', false),
  ('e2000000-0000-4000-b000-0000000010b0', 'e2000000-0000-4000-a000-0000000001ab', 2, 'Violeta.', false),
  ('e2000000-0000-4000-b000-0000000010b1', 'e2000000-0000-4000-a000-0000000001ab', 3, 'Laranja.', false),
  ('e2000000-0000-4000-b000-0000000010b2', 'e2000000-0000-4000-a000-0000000001ab', 4, 'Vermelho.', true),
  ('e2000000-0000-4000-b000-0000000010b8', 'e2000000-0000-4000-a000-0000000001ac', 0, 'Endemia, pois se concentra em uma área geográfica restrita desse continente.', true),
  ('e2000000-0000-4000-b000-0000000010b9', 'e2000000-0000-4000-a000-0000000001ac', 1, 'Peste, já que ocorre nas regiões mais quentes do continente.', false),
  ('e2000000-0000-4000-b000-0000000010ba', 'e2000000-0000-4000-a000-0000000001ac', 2, 'Epidemia, já que ocorre na maior parte do continente.', false),
  ('e2000000-0000-4000-b000-0000000010bb', 'e2000000-0000-4000-a000-0000000001ac', 3, 'Surto, pois apresenta ocorrência em áreas pequenas.', false),
  ('e2000000-0000-4000-b000-0000000010bc', 'e2000000-0000-4000-a000-0000000001ac', 4, 'Pandemia, pois ocorre em todo o continente.', false),
  ('e2000000-0000-4000-b000-0000000010c2', 'e2000000-0000-4000-a000-0000000001ad', 0, 'Aneuploidia do cromossomo sexual X.', false),
  ('e2000000-0000-4000-b000-0000000010c3', 'e2000000-0000-4000-a000-0000000001ad', 1, 'Polipoidia dos cromossomos autossômicos.', false),
  ('e2000000-0000-4000-b000-0000000010c4', 'e2000000-0000-4000-a000-0000000001ad', 2, 'Mutação em genes autossômicos com expressão dominante.', false),
  ('e2000000-0000-4000-b000-0000000010c5', 'e2000000-0000-4000-a000-0000000001ad', 3, 'Substituição no gene da cadeia beta da hemoglobina.', false),
  ('e2000000-0000-4000-b000-0000000010c6', 'e2000000-0000-4000-a000-0000000001ad', 4, 'Inativação de genes por meio de modificações nas bases nitrogenadas.', true),
  ('e2000000-0000-4000-b000-0000000010cc', 'e2000000-0000-4000-a000-0000000001ae', 0, 'Liberação de calor dentro do motor ser impossível.', false),
  ('e2000000-0000-4000-b000-0000000010cd', 'e2000000-0000-4000-a000-0000000001ae', 1, 'Realização de trabalho pelo motor ser incontrolável.', false),
  ('e2000000-0000-4000-b000-0000000010ce', 'e2000000-0000-4000-a000-0000000001ae', 2, 'Conversão integral de calor em trabalho ser impossível.', true),
  ('e2000000-0000-4000-b000-0000000010cf', 'e2000000-0000-4000-a000-0000000001ae', 3, 'Transformação de energia térmica em cinética ser impossível.', false),
  ('e2000000-0000-4000-b000-0000000010d0', 'e2000000-0000-4000-a000-0000000001ae', 4, 'Utilização de energia potencial do combustível ser incontrolável.', false),
  ('e2000000-0000-4000-b000-0000000010d6', 'e2000000-0000-4000-a000-0000000001af', 0, '0,4 a 0,5.', false),
  ('e2000000-0000-4000-b000-0000000010d7', 'e2000000-0000-4000-a000-0000000001af', 1, '0,5 a 0,6.', false),
  ('e2000000-0000-4000-b000-0000000010d8', 'e2000000-0000-4000-a000-0000000001af', 2, '0,6 a 0,7.', false),
  ('e2000000-0000-4000-b000-0000000010d9', 'e2000000-0000-4000-a000-0000000001af', 3, '0,7 a 0,8.', false),
  ('e2000000-0000-4000-b000-0000000010da', 'e2000000-0000-4000-a000-0000000001af', 4, '0,8 a 0,9.', true),
  ('e2000000-0000-4000-b000-0000000010e0', 'e2000000-0000-4000-a000-0000000001b0', 0, 'Possibilidade de sequenciar os genomas de bactérias para serem usados como receptoras de cromossomos artificiais.', false),
  ('e2000000-0000-4000-b000-0000000010e1', 'e2000000-0000-4000-a000-0000000001b0', 1, 'Capacidade de criação, pela ciência, de novas formas de vida, utilizando substâncias como carboidratos e lipídios.', false),
  ('e2000000-0000-4000-b000-0000000010e2', 'e2000000-0000-4000-a000-0000000001b0', 2, 'Possibilidade de produção em massa da bactéria Mycoplasma capricolum para sua distribuição em ambientes naturais.', false),
  ('e2000000-0000-4000-b000-0000000010e3', 'e2000000-0000-4000-a000-0000000001b0', 3, 'Possibilidade de programar geneticamente microrganismos ou seres mais complexos para produzir medicamentos, vacinas e combustíveis.', true),
  ('e2000000-0000-4000-b000-0000000010e4', 'e2000000-0000-4000-a000-0000000001b0', 4, 'Capacidade da bactéria Mycoplasma capricolum de expressar suas proteínas na bactéria sintética e estas serem usadas na indústria.', false),
  ('e2000000-0000-4000-b000-0000000010ea', 'e2000000-0000-4000-a000-0000000001b1', 0, 'Possui anticorpos contra o agente causador da doença.', false),
  ('e2000000-0000-4000-b000-0000000010eb', 'e2000000-0000-4000-a000-0000000001b1', 1, 'Possui proteínas que eliminam o agente causador da doença.', false),
  ('e2000000-0000-4000-b000-0000000010ec', 'e2000000-0000-4000-a000-0000000001b1', 2, 'Estimula a produção de glóbulos vermelhos pela medula óssea.', false),
  ('e2000000-0000-4000-b000-0000000010ed', 'e2000000-0000-4000-a000-0000000001b1', 3, 'Possui linfócitos B e T que neutralizam o agente causador da doença.', false),
  ('e2000000-0000-4000-b000-0000000010ee', 'e2000000-0000-4000-a000-0000000001b1', 4, 'Estimula a produção de anticorpos contra o agente causador da doença.', true),
  ('e2000000-0000-4000-b000-0000000010f4', 'e2000000-0000-4000-a000-0000000001b2', 0, '(1), (3), (6).', false),
  ('e2000000-0000-4000-b000-0000000010f5', 'e2000000-0000-4000-a000-0000000001b2', 1, '(3), (4), (5).', false),
  ('e2000000-0000-4000-b000-0000000010f6', 'e2000000-0000-4000-a000-0000000001b2', 2, '(1), (3), (5).', false),
  ('e2000000-0000-4000-b000-0000000010f7', 'e2000000-0000-4000-a000-0000000001b2', 3, '(1), (3), (7).', true),
  ('e2000000-0000-4000-b000-0000000010f8', 'e2000000-0000-4000-a000-0000000001b2', 4, '(1), (2), (5).', false),
  ('e2000000-0000-4000-b000-0000000010fe', 'e2000000-0000-4000-a000-0000000001b3', 0, 'Carboxila do ácido cólico.', true),
  ('e2000000-0000-4000-b000-0000000010ff', 'e2000000-0000-4000-a000-0000000001b3', 1, 'Aldeído do ácido cólico.', false),
  ('e2000000-0000-4000-b000-000000001100', 'e2000000-0000-4000-a000-0000000001b3', 2, 'Hidroxila do ácido cólico.', false),
  ('e2000000-0000-4000-b000-000000001101', 'e2000000-0000-4000-a000-0000000001b3', 3, 'Cetona do ácido cólico.', false),
  ('e2000000-0000-4000-b000-000000001102', 'e2000000-0000-4000-a000-0000000001b3', 4, 'Éster do ácido cólico.', false),
  ('e2000000-0000-4000-b000-000000001108', 'e2000000-0000-4000-a000-0000000001b4', 0, '0,6.', false),
  ('e2000000-0000-4000-b000-000000001109', 'e2000000-0000-4000-a000-0000000001b4', 1, '1,2.', true),
  ('e2000000-0000-4000-b000-00000000110a', 'e2000000-0000-4000-a000-0000000001b4', 2, '1,5.', false),
  ('e2000000-0000-4000-b000-00000000110b', 'e2000000-0000-4000-a000-0000000001b4', 3, '2,4.', false),
  ('e2000000-0000-4000-b000-00000000110c', 'e2000000-0000-4000-a000-0000000001b4', 4, '4,8.', false),
  ('e2000000-0000-4000-b000-000000001112', 'e2000000-0000-4000-a000-0000000001b5', 0, 'Propagação da luz na água ocorre a uma velocidade maior que a do som neste meio.', false),
  ('e2000000-0000-4000-b000-000000001113', 'e2000000-0000-4000-a000-0000000001b5', 1, 'Absorção da luz ao longo de uma camada de água é facilitada enquanto a absorção do som não.', false),
  ('e2000000-0000-4000-b000-000000001114', 'e2000000-0000-4000-a000-0000000001b5', 2, 'Refração da luz a uma grande profundidade acontece com uma intensidade menor que a do som.', false),
  ('e2000000-0000-4000-b000-000000001115', 'e2000000-0000-4000-a000-0000000001b5', 3, 'Atenuação da luz nos materiais analisados é distinta da atenuação de som nestes mesmos materiais.', true),
  ('e2000000-0000-4000-b000-000000001116', 'e2000000-0000-4000-a000-0000000001b5', 4, 'Reflexão da luz nas camadas de sedimento é menos intensa do que a reflexão do som neste material.', false),
  ('e2000000-0000-4000-b000-00000000111c', 'e2000000-0000-4000-a000-0000000001b6', 0, 'OH- , que reage com os íons Ca2+, deslocando o equilíbrio para a direita.', false),
  ('e2000000-0000-4000-b000-00000000111d', 'e2000000-0000-4000-a000-0000000001b6', 1, 'H+, que reage com as hidroxilas OH- , deslocando o equilíbrio para a direita.', true),
  ('e2000000-0000-4000-b000-00000000111e', 'e2000000-0000-4000-a000-0000000001b6', 2, 'OH- , que reage com os íons Ca2+, deslocando o equilíbrio para a esquerda.', false),
  ('e2000000-0000-4000-b000-00000000111f', 'e2000000-0000-4000-a000-0000000001b6', 3, 'H+, que reage com as hidroxilas OH- , deslocando o equilíbrio para a esquerda.', false),
  ('e2000000-0000-4000-b000-000000001120', 'e2000000-0000-4000-a000-0000000001b6', 4, 'Ca2+, que reage com as hidroxilas OH- , deslocando o equilíbrio para a esquerda.', false),
  ('e2000000-0000-4000-b000-000000001126', 'e2000000-0000-4000-a000-0000000001b7', 0, 'Facilidade em digerir todas as plantas desses locais.', false),
  ('e2000000-0000-4000-b000-000000001127', 'e2000000-0000-4000-a000-0000000001b7', 1, 'Interação com as plantas hospedeiras da família Apocinaceae.', false),
  ('e2000000-0000-4000-b000-000000001128', 'e2000000-0000-4000-a000-0000000001b7', 2, 'Adaptação para se alimentar de todas as plantas desses locais.', false),
  ('e2000000-0000-4000-b000-000000001129', 'e2000000-0000-4000-a000-0000000001b7', 3, 'Voracidade indiscriminada por todas as plantas existentes nesses locais.', false),
  ('e2000000-0000-4000-b000-00000000112a', 'e2000000-0000-4000-a000-0000000001b7', 4, 'Especificidade pelas plantas da família Solanaceae existentes nesses locais.', true),
  ('e2000000-0000-4000-b000-000000001130', 'e2000000-0000-4000-a000-0000000001b8', 0, 'Energia mecânica da régua aumenta, o que a faz cair mais rápido.', false),
  ('e2000000-0000-4000-b000-000000001131', 'e2000000-0000-4000-a000-0000000001b8', 1, 'Resistência do ar aumenta, o que faz a régua cair com menor velocidade.', false),
  ('e2000000-0000-4000-b000-000000001132', 'e2000000-0000-4000-a000-0000000001b8', 2, 'Aceleração de queda da régua varia, o que provoca um movimento acelerado.', false),
  ('e2000000-0000-4000-b000-000000001133', 'e2000000-0000-4000-a000-0000000001b8', 3, 'Força peso da régua tem valor constante, o que gera um movimento acelerado.', true),
  ('e2000000-0000-4000-b000-000000001134', 'e2000000-0000-4000-a000-0000000001b8', 4, 'Velocidade da régua é constante, o que provoca uma passagem linear de tempo.', false),
  ('e2000000-0000-4000-b000-00000000113a', 'e2000000-0000-4000-a000-0000000001b9', 0, 'À altura do sifão de água.', false),
  ('e2000000-0000-4000-b000-00000000113b', 'e2000000-0000-4000-a000-0000000001b9', 1, 'Ao volume do tanque de água.', true),
  ('e2000000-0000-4000-b000-00000000113c', 'e2000000-0000-4000-a000-0000000001b9', 2, 'À altura do nível de água no vaso.', false),
  ('e2000000-0000-4000-b000-00000000113d', 'e2000000-0000-4000-a000-0000000001b9', 3, 'Ao diâmetro do distribuidor de água.', false),
  ('e2000000-0000-4000-b000-00000000113e', 'e2000000-0000-4000-a000-0000000001b9', 4, 'À eficiência da válvula de enchimento do tanque.', false),
  ('e2000000-0000-4000-b000-000000001144', 'e2000000-0000-4000-a000-0000000001ba', 0, 'Como subproduto da respiração aeróbia bacteriana.', false),
  ('e2000000-0000-4000-b000-000000001145', 'e2000000-0000-4000-a000-0000000001ba', 1, 'Pela degradação anaeróbia de matéria orgânica por bactérias.', true),
  ('e2000000-0000-4000-b000-000000001146', 'e2000000-0000-4000-a000-0000000001ba', 2, 'Como produto da fotossíntese de organismos pluricelulares autotróficos.', false),
  ('e2000000-0000-4000-b000-000000001147', 'e2000000-0000-4000-a000-0000000001ba', 3, 'Pela transformação química do gás carbônico em condições anaeróbias.', false),
  ('e2000000-0000-4000-b000-000000001148', 'e2000000-0000-4000-a000-0000000001ba', 4, 'Pela conversão, por oxidação química, do gás carbônico sob condições aeróbias.', false),
  ('e2000000-0000-4000-b000-00000000114e', 'e2000000-0000-4000-a000-0000000001bb', 0, 'Limpa de energia, contribuindo para minimizar os efeitos deste fenômeno.', false),
  ('e2000000-0000-4000-b000-00000000114f', 'e2000000-0000-4000-a000-0000000001bb', 1, 'Eficaz de energia, tomando-se o percentual de oferta e os benefícios verificados.', false),
  ('e2000000-0000-4000-b000-000000001150', 'e2000000-0000-4000-a000-0000000001bb', 2, 'Limpa de energia, não afetando ou alterando os níveis dos gases do efeito estufa.', false),
  ('e2000000-0000-4000-b000-000000001151', 'e2000000-0000-4000-a000-0000000001bb', 3, 'Poluidora, colaborando com níveis altos de gases de efeito estufa em função de seu potencial de oferta.', true),
  ('e2000000-0000-4000-b000-000000001152', 'e2000000-0000-4000-a000-0000000001bb', 4, 'Alternativa, tomando-se por referência a grande emissão de gases de efeito estufa das demais fontes geradoras.', false),
  ('e2000000-0000-4000-b000-000000001158', 'e2000000-0000-4000-a000-0000000001bc', 0, '2,0×100  mol.', false),
  ('e2000000-0000-4000-b000-000000001159', 'e2000000-0000-4000-a000-0000000001bc', 1, '2,0×10-3 mol.', true),
  ('e2000000-0000-4000-b000-00000000115a', 'e2000000-0000-4000-a000-0000000001bc', 2, '8,0×10-1 mol.', false),
  ('e2000000-0000-4000-b000-00000000115b', 'e2000000-0000-4000-a000-0000000001bc', 3, '8,0×10-4 mol.', false),
  ('e2000000-0000-4000-b000-00000000115c', 'e2000000-0000-4000-a000-0000000001bc', 4, '5,0×10-3 mol.', false),
  ('e2000000-0000-4000-b000-000000001162', 'e2000000-0000-4000-a000-0000000001bd', 0, 'Comensalismo.', false),
  ('e2000000-0000-4000-b000-000000001163', 'e2000000-0000-4000-a000-0000000001bd', 1, 'Inquilinismo.', false),
  ('e2000000-0000-4000-b000-000000001164', 'e2000000-0000-4000-a000-0000000001bd', 2, 'Cooperação.', false),
  ('e2000000-0000-4000-b000-000000001165', 'e2000000-0000-4000-a000-0000000001bd', 3, 'Predatismo.', true),
  ('e2000000-0000-4000-b000-000000001166', 'e2000000-0000-4000-a000-0000000001bd', 4, 'Mutualismo.', false),
  ('e2000000-0000-4000-b000-00000000116c', 'e2000000-0000-4000-a000-0000000001be', 0, 'O acúmulo de sais insolúveis, desencadeando um processo de salinificação do solo.', false),
  ('e2000000-0000-4000-b000-00000000116d', 'e2000000-0000-4000-a000-0000000001be', 1, 'A eliminação de microorganismos existentes no solo responsáveis pelo processo de desnitrificação.', false),
  ('e2000000-0000-4000-b000-00000000116e', 'e2000000-0000-4000-a000-0000000001be', 2, 'A contaminação de rios e lagos devido à alta solubilidade de íons como NO3− e NH4+ em água.', true),
  ('e2000000-0000-4000-b000-00000000116f', 'e2000000-0000-4000-a000-0000000001be', 3, 'A diminuição do pH do solo pela presença de NH3, que reage com a água, formando o NH4OH(aq).', false),
  ('e2000000-0000-4000-b000-000000001170', 'e2000000-0000-4000-a000-0000000001be', 4, 'A diminuição da oxigenação do solo, uma vez que o nitrogênio ativo forma espécies químicas do tipo NO2, NO− , N2O.', false),
  ('e2000000-0000-4000-b000-000000001176', 'e2000000-0000-4000-a000-0000000001bf', 0, 'Ao se esconder atrás de um muro, um menino ouve a conversa de seus colegas.', true),
  ('e2000000-0000-4000-b000-000000001177', 'e2000000-0000-4000-a000-0000000001bf', 1, 'Ao gritar diante de um desfiladero, uma pessoa ouve a repetição do seu próprio grito.', false),
  ('e2000000-0000-4000-b000-000000001178', 'e2000000-0000-4000-a000-0000000001bf', 2, 'Ao encostar o ouvido no chão, um homem percebe o som de uma locomotiva antes de ouvi-lo pelo ar.', false),
  ('e2000000-0000-4000-b000-000000001179', 'e2000000-0000-4000-a000-0000000001bf', 3, 'Ao ouvir uma ambulância se aproximando, uma pessoa percebe o som mais agudo do que quando aquela se afasta.', false),
  ('e2000000-0000-4000-b000-00000000117a', 'e2000000-0000-4000-a000-0000000001bf', 4, 'Ao emitir uma nota musical muito aguda, uma cantora de ópera faz com que uma taça de cristal se despedace.', false),
  ('e2000000-0000-4000-b000-000000001180', 'e2000000-0000-4000-a000-0000000001c0', 0, 'Aumentar o volume do lixo incinerado para aumentar a produção de energia elétrica.', false),
  ('e2000000-0000-4000-b000-000000001181', 'e2000000-0000-4000-a000-0000000001c0', 1, 'Fomentar o uso de filtros nas chaminés dos incineradores para diminuir a poluição do ar.', true),
  ('e2000000-0000-4000-b000-000000001182', 'e2000000-0000-4000-a000-0000000001c0', 2, 'Aumentar o volume do lixo para baratear os custos operacionais relacionados ao processo.', false),
  ('e2000000-0000-4000-b000-000000001183', 'e2000000-0000-4000-a000-0000000001c0', 3, 'Fomentar a coleta seletiva de lixo nas cidades para aumentar o volume de lixo incinerado.', false),
  ('e2000000-0000-4000-b000-000000001184', 'e2000000-0000-4000-a000-0000000001c0', 4, 'Diminuir a temperatura de incineração do lixo para produzir maior quantidade de energia elétrica.', false),
  ('e2000000-0000-4000-b000-00000000118a', 'e2000000-0000-4000-a000-0000000001c1', 0, 'A energia cinética, representada na etapa I, seja totalmente convertida em energia potencial elástica representada na etapa IV.', false),
  ('e2000000-0000-4000-b000-00000000118b', 'e2000000-0000-4000-a000-0000000001c1', 1, 'A energia cinética, representada na etapa II, seja totalmente convertida em energia potencial gravitacional, representada na etapa IV.', false),
  ('e2000000-0000-4000-b000-00000000118c', 'e2000000-0000-4000-a000-0000000001c1', 2, 'A energia cinética, representada na etapa I, seja totalmente convertida em energia potencial gravitacional, representada na etapa III.', true),
  ('e2000000-0000-4000-b000-00000000118d', 'e2000000-0000-4000-a000-0000000001c1', 3, 'A energia potencial gravitacional, representada na etapa II, seja totalmente convertida em energia potencial elástica, representada na etapa IV.', false),
  ('e2000000-0000-4000-b000-00000000118e', 'e2000000-0000-4000-a000-0000000001c1', 4, 'A energia potencial gravitacional, representada na etapa I, seja totalmente convertida em energia potencial elástica, representada na etapa III.', false),
  ('e2000000-0000-4000-b000-000000001194', 'e2000000-0000-4000-a000-0000000001c2', 0, 'O filo.', false),
  ('e2000000-0000-4000-b000-000000001195', 'e2000000-0000-4000-a000-0000000001c2', 1, 'O reino.', true),
  ('e2000000-0000-4000-b000-000000001196', 'e2000000-0000-4000-a000-0000000001c2', 2, 'A classe.', false),
  ('e2000000-0000-4000-b000-000000001197', 'e2000000-0000-4000-a000-0000000001c2', 3, 'A família.', false),
  ('e2000000-0000-4000-b000-000000001198', 'e2000000-0000-4000-a000-0000000001c2', 4, 'A espécie.', false),
  ('e2000000-0000-4000-b000-00000000119e', 'e2000000-0000-4000-a000-0000000001c3', 0, 'Os animais eliminam metais pesados, que são usados pelas algas para a síntese de biomassa.', false),
  ('e2000000-0000-4000-b000-00000000119f', 'e2000000-0000-4000-a000-0000000001c3', 1, 'Os animais fornecem excretas orgânicos nitrogenados, que são transformados em gás carbônico pelas algas.', false),
  ('e2000000-0000-4000-b000-0000000011a0', 'e2000000-0000-4000-a000-0000000001c3', 2, 'As algas usam os resíduos nitrogenados liberados pelos animais e eliminam gás carbônico na fotossíntese, usado na respiração aeróbica.', false),
  ('e2000000-0000-4000-b000-0000000011a1', 'e2000000-0000-4000-a000-0000000001c3', 3, 'As algas usam os resíduos nitrogenados provenientes do metabolismo dos animais e, durante a síntese de compostos orgânicos, liberam oxigênio para o ambiente.', true),
  ('e2000000-0000-4000-b000-0000000011a2', 'e2000000-0000-4000-a000-0000000001c3', 4, 'As algas aproveitam os resíduos do metabolismo dos animais e, durante a quimiossíntese de compostos orgânicos, liberam oxigênio para o ambiente.', false),
  ('e2000000-0000-4000-b000-0000000011a8', 'e2000000-0000-4000-a000-0000000001c4', 0, 'Colocação de telas nas portas e janelas, pois o mosquito necessita de ambientes cobertos e fechados para a sua reprodução.', false),
  ('e2000000-0000-4000-b000-0000000011a9', 'e2000000-0000-4000-a000-0000000001c4', 1, 'Substituição das casas de barro por casas de alvenaria, haja vista que o mosquito se reproduz na parede das casas de barro.', false),
  ('e2000000-0000-4000-b000-0000000011aa', 'e2000000-0000-4000-a000-0000000001c4', 2, 'Remoção dos recipientes que possam acumular água, porque as larvas do mosquito se desenvolvem nesse meio.', true),
  ('e2000000-0000-4000-b000-0000000011ab', 'e2000000-0000-4000-a000-0000000001c4', 3, 'Higienização adequada de alimentos, visto que as larvas do mosquito se desenvolvem nesse tipo de substrato.', false),
  ('e2000000-0000-4000-b000-0000000011ac', 'e2000000-0000-4000-a000-0000000001c4', 4, 'Colocação de filtros de água nas casas, visto que a reprodução do mosquito acontece em águas contaminadas.', false),
  ('e2000000-0000-4000-b000-0000000011b2', 'e2000000-0000-4000-a000-0000000001c5', 0, 'Metano durante o processo de digestão.', true),
  ('e2000000-0000-4000-b000-0000000011b3', 'e2000000-0000-4000-a000-0000000001c5', 1, 'Óxido nitroso durante o processo de ruminação.', false),
  ('e2000000-0000-4000-b000-0000000011b4', 'e2000000-0000-4000-a000-0000000001c5', 2, 'Clorofluorcarbono durante o transporte de carne.', false),
  ('e2000000-0000-4000-b000-0000000011b5', 'e2000000-0000-4000-a000-0000000001c5', 3, 'Óxido nitroso durante o processo respiratório.', false),
  ('e2000000-0000-4000-b000-0000000011b6', 'e2000000-0000-4000-a000-0000000001c5', 4, 'Dióxido de enxofre durante o consumo de pastagens.', false),
  ('e2000000-0000-4000-b000-0000000011bc', 'e2000000-0000-4000-a000-0000000001c6', 0, 'À escassez de turistas no país.', false),
  ('e2000000-0000-4000-b000-0000000011bd', 'e2000000-0000-4000-a000-0000000001c6', 1, 'Ao difícil acesso ao lago Titicaca.', false),
  ('e2000000-0000-4000-b000-0000000011be', 'e2000000-0000-4000-a000-0000000001c6', 2, 'À destruição da arqueologia no país.', false),
  ('e2000000-0000-4000-b000-0000000011bf', 'e2000000-0000-4000-a000-0000000001c6', 3, 'Ao excesso de turistas na terra dos incas.', true),
  ('e2000000-0000-4000-b000-0000000011c0', 'e2000000-0000-4000-a000-0000000001c6', 4, 'À falta de atrativos turísticos em Arequipa.', false),
  ('e2000000-0000-4000-b000-0000000011c6', 'e2000000-0000-4000-a000-0000000001c7', 0, 'As doenças do coração atacam dez mil pacientes.', false),
  ('e2000000-0000-4000-b000-0000000011c7', 'e2000000-0000-4000-a000-0000000001c7', 1, 'As doenças do coração ocorrem na faixa dos dezesseis anos.', false),
  ('e2000000-0000-4000-b000-0000000011c8', 'e2000000-0000-4000-a000-0000000001c7', 2, 'As pesquisas sobre doenças são divulgadas no meio acadêmico.', false),
  ('e2000000-0000-4000-b000-0000000011c9', 'e2000000-0000-4000-a000-0000000001c7', 3, 'Jovens americanos são alertados dos riscos de doenças do coração.', false),
  ('e2000000-0000-4000-b000-0000000011ca', 'e2000000-0000-4000-a000-0000000001c7', 4, 'Maior nível de estudo reduz riscos de ataques do coração.', true),
  ('e2000000-0000-4000-b000-0000000011d0', 'e2000000-0000-4000-a000-0000000001c8', 0, 'Relatar novas experiências em tratamento de saúde.', false),
  ('e2000000-0000-4000-b000-0000000011d1', 'e2000000-0000-4000-a000-0000000001c8', 1, 'Alertar sobre os riscos mortais de determinados softwares de uso médico para o ser humano.', true),
  ('e2000000-0000-4000-b000-0000000011d2', 'e2000000-0000-4000-a000-0000000001c8', 2, 'Denunciar falhas médicas na implantação de softwares em seres humanos.', false),
  ('e2000000-0000-4000-b000-0000000011d3', 'e2000000-0000-4000-a000-0000000001c8', 3, 'Divulgar novos softwares presentes em aparelhos médicos lançados no mercado.', false),
  ('e2000000-0000-4000-b000-0000000011d4', 'e2000000-0000-4000-a000-0000000001c8', 4, 'Apresentar os defeitos mais comuns de softwares em aparelhos médicos.', false),
  ('e2000000-0000-4000-b000-0000000011da', 'e2000000-0000-4000-a000-0000000001c9', 0, 'Discutir sobre o conteúdo do seu trabalho já entregue.', false),
  ('e2000000-0000-4000-b000-0000000011db', 'e2000000-0000-4000-a000-0000000001c9', 1, 'Elogiar o tema proposto para o relatório solicitado.', false),
  ('e2000000-0000-4000-b000-0000000011dc', 'e2000000-0000-4000-a000-0000000001c9', 2, 'Sugerir temas para novas pesquisas e relatórios.', false),
  ('e2000000-0000-4000-b000-0000000011dd', 'e2000000-0000-4000-a000-0000000001c9', 3, 'Reclamar do curto prazo para entrega do trabalho.', false),
  ('e2000000-0000-4000-b000-0000000011de', 'e2000000-0000-4000-a000-0000000001c9', 4, 'Convencer de que fez o relatório solicitado.', true),
  ('e2000000-0000-4000-b000-0000000011e4', 'e2000000-0000-4000-a000-0000000001ca', 0, 'Participação em reuniões do Conselho Internacional de Monumentos e Sítios.', false),
  ('e2000000-0000-4000-b000-0000000011e5', 'e2000000-0000-4000-a000-0000000001ca', 1, 'Realização da cerimônia de recepção da Convenção do Patrimônio Mundial.', false),
  ('e2000000-0000-4000-b000-0000000011e6', 'e2000000-0000-4000-a000-0000000001ca', 2, 'Organização das análises feitas pelo Ministério da Cultura brasileiro.', false),
  ('e2000000-0000-4000-b000-0000000011e7', 'e2000000-0000-4000-a000-0000000001ca', 3, 'Discussão sobre o estado de conservação dos bens já declarados patrimônios mundiais.', true),
  ('e2000000-0000-4000-b000-0000000011e8', 'e2000000-0000-4000-a000-0000000001ca', 4, 'Estruturação da próxima reunião do Comitê do Patrimônio Mundial.', false),
  ('e2000000-0000-4000-b000-0000000011ee', 'e2000000-0000-4000-a000-0000000001cb', 0, 'Ao nível de felicidade das pessoas em tempos de guerra.', false),
  ('e2000000-0000-4000-b000-0000000011ef', 'e2000000-0000-4000-a000-0000000001cb', 1, 'À dificuldade de medir o nível de felicidade das pessoas a partir de seu humor.', false),
  ('e2000000-0000-4000-b000-0000000011f0', 'e2000000-0000-4000-a000-0000000001cb', 2, 'Ao nível de felicidade das pessoas enquanto falam ao celular com seus familiares.', false),
  ('e2000000-0000-4000-b000-0000000011f1', 'e2000000-0000-4000-a000-0000000001cb', 3, 'À relação entre o nível de felicidade das pessoas e o ambiente no qual se encontram.', true),
  ('e2000000-0000-4000-b000-0000000011f2', 'e2000000-0000-4000-a000-0000000001cb', 4, 'À influência das imagens grafitadas pelas ruas no aumento do nível de felicidade das pessoas.', false),
  ('e2000000-0000-4000-b000-0000000011f8', 'e2000000-0000-4000-a000-0000000001cc', 0, 'Manter-se inalterado ao longo de sua história no país.', false),
  ('e2000000-0000-4000-b000-0000000011f9', 'e2000000-0000-4000-a000-0000000001cc', 1, 'Influenciar os subúrbios, sem chegar a outras regiões.', false),
  ('e2000000-0000-4000-b000-0000000011fa', 'e2000000-0000-4000-a000-0000000001cc', 2, 'Sobreviver e se difundir, ultrapassando as fronteiras do país.', true),
  ('e2000000-0000-4000-b000-0000000011fb', 'e2000000-0000-4000-a000-0000000001cc', 3, 'Manifestar seu valor primitivo nas diferentes camadas sociais.', false),
  ('e2000000-0000-4000-b000-0000000011fc', 'e2000000-0000-4000-a000-0000000001cc', 4, 'Ignorar a influência de países europeus, como Inglaterra e França.', false),
  ('e2000000-0000-4000-b000-000000001202', 'e2000000-0000-4000-a000-0000000001cd', 0, 'A inércia do continente africano diante das injustiças sociais.', false),
  ('e2000000-0000-4000-b000-000000001203', 'e2000000-0000-4000-a000-0000000001cd', 1, 'A persistência da guerra enquanto houver diferenças raciais e sociais.', true),
  ('e2000000-0000-4000-b000-000000001204', 'e2000000-0000-4000-a000-0000000001cd', 2, 'As acentuadas diferenças culturais entre os países africanos.', false),
  ('e2000000-0000-4000-b000-000000001205', 'e2000000-0000-4000-a000-0000000001cd', 3, 'As discrepâncias sociais entre moçambicanos e angolanos como causa de conflitos.', false),
  ('e2000000-0000-4000-b000-000000001206', 'e2000000-0000-4000-a000-0000000001cd', 4, 'A fragilidade das diferenças raciais e sociais como justificativas para o início de uma guerra.', false),
  ('e2000000-0000-4000-b000-00000000120c', 'e2000000-0000-4000-a000-0000000001ce', 0, 'Informar o leitor a respeito da importância da reciclagem para a conservação do meio ambiente.', true),
  ('e2000000-0000-4000-b000-00000000120d', 'e2000000-0000-4000-a000-0000000001ce', 1, 'Indicar os cuidados que se deve ter para não consumir alimentos que podem ser focos de infecção.', false),
  ('e2000000-0000-4000-b000-00000000120e', 'e2000000-0000-4000-a000-0000000001ce', 2, 'Denunciar o quanto o consumismo é nocivo, pois é o gerador dos dejetos produzidos no México.', false),
  ('e2000000-0000-4000-b000-00000000120f', 'e2000000-0000-4000-a000-0000000001ce', 3, 'Ensinar como economizar tempo, dinheiro e esforço a partir dos 50 mil depósitos de lixo legalizados.', false),
  ('e2000000-0000-4000-b000-000000001210', 'e2000000-0000-4000-a000-0000000001ce', 4, 'Alertar a população mexicana para os perigos causados pelos consumidores de matéria-prima reciclável.', false),
  ('e2000000-0000-4000-b000-000000001216', 'e2000000-0000-4000-a000-0000000001cf', 0, 'Exercícios físicos aquáticos (natação/hidroginástica), que são exercícios de baixo impacto, evitando o atrito (não prejudicando as articulações), e que previnem o envelhecimento precoce e melhoram a qualidade de vida.', false),
  ('e2000000-0000-4000-b000-000000001217', 'e2000000-0000-4000-a000-0000000001cf', 1, 'Mecanismos que permitem combinar alimentação e exercício físico, que permitem a aquisição e manutenção de níveis adequados de saúde, sem a preocupação com padrões de beleza instituídos socialmente.', false),
  ('e2000000-0000-4000-b000-000000001218', 'e2000000-0000-4000-a000-0000000001cf', 2, 'Programas saudáveis de emagrecimento, que evitam os prejuízos causados na regulação metabólica, função imunológica, integridade óssea e manutenção da capacidade funcional ao longo do envelhecimento.', false),
  ('e2000000-0000-4000-b000-000000001219', 'e2000000-0000-4000-a000-0000000001cf', 3, 'Exercícios de relaxamento, reeducação postural e alongamentos, que permitem um melhor funcionamento do organismo como um todo, bem como uma dieta alimentar e hábitos saudáveis com base em produtos naturais.', false),
  ('e2000000-0000-4000-b000-00000000121a', 'e2000000-0000-4000-a000-0000000001cf', 4, 'Dietas que preconizam a ingestão excessiva ou restrita de um ou mais macronutrientes (carboidratos, gorduras ou proteínas), bem como exercícios que permitem um aumento de massa muscular e/ou modelar o corpo.', true),
  ('e2000000-0000-4000-b000-000000001220', 'e2000000-0000-4000-a000-0000000001d0', 0, 'Reduz o número de amigos virtuais, ao limitar o acesso à rede.', false),
  ('e2000000-0000-4000-b000-000000001221', 'e2000000-0000-4000-a000-0000000001d0', 1, 'Parte do anonimato obrigatório para se difundir.', false),
  ('e2000000-0000-4000-b000-000000001222', 'e2000000-0000-4000-a000-0000000001d0', 2, 'Reforça a configuração de laços mais profundos de amizade.', false),
  ('e2000000-0000-4000-b000-000000001223', 'e2000000-0000-4000-a000-0000000001d0', 3, 'Facilita a interação entre pessoas em virtude de interesses comuns.', true),
  ('e2000000-0000-4000-b000-000000001224', 'e2000000-0000-4000-a000-0000000001d0', 4, 'Tem a responsabilidade de promover a proximidade física.', false),
  ('e2000000-0000-4000-b000-00000000122a', 'e2000000-0000-4000-a000-0000000001d1', 0, 'É uma estratégia que, ao possibilitar caminhos totalmente abertos, desfavorece o leitor, ao confundir os conceitos cristalizados tradicionalmente.', false),
  ('e2000000-0000-4000-b000-00000000122b', 'e2000000-0000-4000-a000-0000000001d1', 1, 'É uma forma artificial de produção da escrita, que, ao desviar o foco da leitura, pode ter como consequência o menosprezo pela escrita tradicional.', false),
  ('e2000000-0000-4000-b000-00000000122c', 'e2000000-0000-4000-a000-0000000001d1', 2, 'Exige do leitor um maior grau de conhecimentos prévios, por isso deve ser evitado pelos estudantes nas suas pesquisas escolares.', false),
  ('e2000000-0000-4000-b000-00000000122d', 'e2000000-0000-4000-a000-0000000001d1', 3, 'Facilita a pesquisa, pois proporciona uma informação específica, segura e verdadeira, em qualquer site de busca ou blog oferecidos na internet.', false),
  ('e2000000-0000-4000-b000-00000000122e', 'e2000000-0000-4000-a000-0000000001d1', 4, 'Possibilita ao leitor escolher seu próprio percurso de leitura, sem seguir sequência predeterminada, constituindo-se em atividade mais coletiva e colaborativa.', true),
  ('e2000000-0000-4000-b000-000000001234', 'e2000000-0000-4000-a000-0000000001d2', 0, 'Descrição minuciosa dos traços biográficos do personagem-narrador.', false),
  ('e2000000-0000-4000-b000-000000001235', 'e2000000-0000-4000-a000-0000000001d2', 1, 'Construção da figura do retirante nordestino como um homem resignado com a sua situação.', false),
  ('e2000000-0000-4000-b000-000000001236', 'e2000000-0000-4000-a000-0000000001d2', 2, 'Representação, na figura do personagem-narrador, de outros Severinos que compartilham sua condição.', true),
  ('e2000000-0000-4000-b000-000000001237', 'e2000000-0000-4000-a000-0000000001d2', 3, 'Apresentação do personagem-narrador como uma projeção do próprio poeta, em sua crise existencial.', false),
  ('e2000000-0000-4000-b000-000000001238', 'e2000000-0000-4000-a000-0000000001d2', 4, 'Descrição de Severino, que, apesar de humilde, orgulha-se de ser descendente do coronel Zacarias.', false),
  ('e2000000-0000-4000-b000-00000000123e', 'e2000000-0000-4000-a000-0000000001d3', 0, 'A identificação com o público-alvo a que se destina o anúncio.', false),
  ('e2000000-0000-4000-b000-00000000123f', 'e2000000-0000-4000-a000-0000000001d3', 1, 'A avaliação da imagem como uma sátira às atrações de terror.', false),
  ('e2000000-0000-4000-b000-000000001240', 'e2000000-0000-4000-a000-0000000001d3', 2, 'A atenção para a imagem da parte do corpo humano selecionada aleatoriamente.', false),
  ('e2000000-0000-4000-b000-000000001241', 'e2000000-0000-4000-a000-0000000001d3', 3, 'O reconhecimento do intertexto entre a publicidade e um dito popular.', true),
  ('e2000000-0000-4000-b000-000000001242', 'e2000000-0000-4000-a000-0000000001d3', 4, 'A percepção do sentido literal da expressão “noites do terror”, equivalente à expressão “noites de terror”.', false),
  ('e2000000-0000-4000-b000-000000001248', 'e2000000-0000-4000-a000-0000000001d4', 0, 'Da ironia, ao se referir ao enriquecimento de origem duvidosa de alguns.', true),
  ('e2000000-0000-4000-b000-000000001249', 'e2000000-0000-4000-a000-0000000001d4', 1, 'Da crítica aos ricos que possuem joias, mas não têm herança.', false),
  ('e2000000-0000-4000-b000-00000000124a', 'e2000000-0000-4000-a000-0000000001d4', 2, 'Da maldade do povo a perguntar sobre a honestidade.', false),
  ('e2000000-0000-4000-b000-00000000124b', 'e2000000-0000-4000-a000-0000000001d4', 3, 'Do privilégio de alguns em clamar pela honestidade.', false),
  ('e2000000-0000-4000-b000-00000000124c', 'e2000000-0000-4000-a000-0000000001d4', 4, 'Da insistência em promover eventos beneficentes.', false),
  ('e2000000-0000-4000-b000-000000001252', 'e2000000-0000-4000-a000-0000000001d5', 0, 'Relata a seu interlocutor a história de Zé-Zim, demonstrando sua pouca disposição em ajudar seus agregados, uma vez que superou essa condição graças à sua força de trabalho.', false),
  ('e2000000-0000-4000-b000-000000001253', 'e2000000-0000-4000-a000-0000000001d5', 1, 'Descreve o processo de transformação de um meeiro — espécie de agregado — em proprietário de terra.', false),
  ('e2000000-0000-4000-b000-000000001254', 'e2000000-0000-4000-a000-0000000001d5', 2, 'Denuncia a falta de compromisso e a desocupação dos moradores, que pouco se envolvem no trabalho da terra.', false),
  ('e2000000-0000-4000-b000-000000001255', 'e2000000-0000-4000-a000-0000000001d5', 3, 'Mostra como a condição material da vida do sertanejo é dificultada pela sua dupla condição de homem livre e, ao mesmo tempo, dependente.', true),
  ('e2000000-0000-4000-b000-000000001256', 'e2000000-0000-4000-a000-0000000001d5', 4, 'Mantém o distanciamento narrativo condizente com sua posição social, de proprietário de terras.', false),
  ('e2000000-0000-4000-b000-00000000125c', 'e2000000-0000-4000-a000-0000000001d6', 0, 'O cordel é um dos gêneros textuais, por exemplo, que será extinto com o avanço da tecnologia.', false),
  ('e2000000-0000-4000-b000-00000000125d', 'e2000000-0000-4000-a000-0000000001d6', 1, 'O livro impresso permanecerá como objeto cultural veiculador de impressões e de valores culturais.', false),
  ('e2000000-0000-4000-b000-00000000125e', 'e2000000-0000-4000-a000-0000000001d6', 2, 'O surgimento da mídia eletrônica decretou o fim do prazer de se ler textos em livros e suportes impressos.', false),
  ('e2000000-0000-4000-b000-00000000125f', 'e2000000-0000-4000-a000-0000000001d6', 3, 'Os textos continuarão vivos e passíveis de reprodução em novas tecnologias, mesmo que os livros desapareçam.', true),
  ('e2000000-0000-4000-b000-000000001260', 'e2000000-0000-4000-a000-0000000001d6', 4, 'Os livros impressos desaparecerão e, com eles, a possibilidade de se ler obras literárias dos mais diversos gêneros.', false),
  ('e2000000-0000-4000-b000-000000001266', 'e2000000-0000-4000-a000-0000000001d7', 0, 'Incorporar novos costumes de origem francesa e americana, juntamente com vocábulos estrangeiros.', false),
  ('e2000000-0000-4000-b000-000000001267', 'e2000000-0000-4000-a000-0000000001d7', 1, 'Respeitar e preservar o português padrão como forma de fortalecimento do idioma do Brasil.', false),
  ('e2000000-0000-4000-b000-000000001268', 'e2000000-0000-4000-a000-0000000001d7', 2, 'Valorizar a fala popular brasileira como patrimônio linguístico e forma legítima de identidade nacional.', true),
  ('e2000000-0000-4000-b000-000000001269', 'e2000000-0000-4000-a000-0000000001d7', 3, 'Mudar os valores sociais vigentes à época, com o advento do novo e quente ritmo da música popular brasileira.', false),
  ('e2000000-0000-4000-b000-00000000126a', 'e2000000-0000-4000-a000-0000000001d7', 4, 'Ironizar a malandragem carioca, aculturada pela invasão de valores étnicos de sociedades mais desenvolvidas.', false),
  ('e2000000-0000-4000-b000-000000001270', 'e2000000-0000-4000-a000-0000000001d8', 0, 'Manifestações afetivas, históricas, ideológicas, intelectuais e espirituais de um povo, refletindo seu modo de expressar-se no mundo.', true),
  ('e2000000-0000-4000-b000-000000001271', 'e2000000-0000-4000-a000-0000000001d8', 1, 'Aspectos eminentemente afetivos, espirituais e de entretenimento de um povo, desconsiderando fatos históricos.', false),
  ('e2000000-0000-4000-b000-000000001272', 'e2000000-0000-4000-a000-0000000001d8', 2, 'Acontecimentos do cotidiano, sob influência mitológica e religiosa de cada região, sobrepondo aspectos políticos.', false),
  ('e2000000-0000-4000-b000-000000001273', 'e2000000-0000-4000-a000-0000000001d8', 3, 'Tradições culturais de cada região, cujas manifestações rítmicas são classificadas em um ranking das mais originais.', false),
  ('e2000000-0000-4000-b000-000000001274', 'e2000000-0000-4000-a000-0000000001d8', 4, 'Lendas, que se sustentam em inverdades históricas, uma vez que são inventadas, e servem apenas para a vivência lúdica de um povo.', false),
  ('e2000000-0000-4000-b000-00000000127a', 'e2000000-0000-4000-a000-0000000001d9', 0, 'A expressão “Além disso” marca uma sequenciação de idéias.', true),
  ('e2000000-0000-4000-b000-00000000127b', 'e2000000-0000-4000-a000-0000000001d9', 1, 'O conectivo “mas também” inicia oração que exprime ideia de contraste.', false),
  ('e2000000-0000-4000-b000-00000000127c', 'e2000000-0000-4000-a000-0000000001d9', 2, 'O termo “como”, em “como morte súbita e derrame”, introduz uma generalização.', false),
  ('e2000000-0000-4000-b000-00000000127d', 'e2000000-0000-4000-a000-0000000001d9', 3, 'O termo “Também” exprime uma justificativa.', false),
  ('e2000000-0000-4000-b000-00000000127e', 'e2000000-0000-4000-a000-0000000001d9', 4, 'O termo “fatores” retoma coesivamente “níveis de colesterol e de glicose no sangue”.', false),
  ('e2000000-0000-4000-b000-000000001284', 'e2000000-0000-4000-a000-0000000001da', 0, 'A presença de um capitel muito simples, reforçando a sustentação.', false),
  ('e2000000-0000-4000-b000-000000001285', 'e2000000-0000-4000-a000-0000000001da', 1, 'O traçado simples de amplas linhas curvas opostas, resultando em formas marcantes.', true),
  ('e2000000-0000-4000-b000-000000001286', 'e2000000-0000-4000-a000-0000000001da', 2, 'A disposição simétrica das curvas, conferindo saliência e distorção à base.', false),
  ('e2000000-0000-4000-b000-000000001287', 'e2000000-0000-4000-a000-0000000001da', 3, 'A oposição de curvas em concreto, configurando certo peso e rebuscamento.', false),
  ('e2000000-0000-4000-b000-000000001288', 'e2000000-0000-4000-a000-0000000001da', 4, 'O excesso de linhas curvas, levando a um exagero na ornamentação.', false),
  ('e2000000-0000-4000-b000-00000000128e', 'e2000000-0000-4000-a000-0000000001db', 0, 'Se tornaram um esporte, mas eram praticadas com o objetivo guerreiro a fim de garantir a sobrevivência.', false),
  ('e2000000-0000-4000-b000-00000000128f', 'e2000000-0000-4000-a000-0000000001db', 1, 'Apresentam a possibilidade de desenvolver o autocontrole, o respeito ao outro e a formação do caráter.', true),
  ('e2000000-0000-4000-b000-000000001290', 'e2000000-0000-4000-a000-0000000001db', 2, 'Possuem como objetivo principal a “defesa pessoal” por meio de golpes agressivos sobre o adversário.', false),
  ('e2000000-0000-4000-b000-000000001291', 'e2000000-0000-4000-a000-0000000001db', 3, 'Sofreram transformações em seus princípios filosóficos em razão de sua disseminação pelo mundo.', false),
  ('e2000000-0000-4000-b000-000000001292', 'e2000000-0000-4000-a000-0000000001db', 4, 'Se disseminaram pela necessidade de luta pela sobrevivência ou como filosofia pessoal de vida.', false),
  ('e2000000-0000-4000-b000-000000001298', 'e2000000-0000-4000-a000-0000000001dc', 0, 'Esclarecer que a velhice é inevitável.', false),
  ('e2000000-0000-4000-b000-000000001299', 'e2000000-0000-4000-a000-0000000001dc', 1, 'Contar fatos sobre a arte de envelhecer.', false),
  ('e2000000-0000-4000-b000-00000000129a', 'e2000000-0000-4000-a000-0000000001dc', 2, 'Defender a ideia de que a velhice é desagradável.', false),
  ('e2000000-0000-4000-b000-00000000129b', 'e2000000-0000-4000-a000-0000000001dc', 3, 'Influenciar o leitor para que lute contra o envelhecimento.', false),
  ('e2000000-0000-4000-b000-00000000129c', 'e2000000-0000-4000-a000-0000000001dc', 4, 'Mostrar às pessoas que é possível aceitar, sem angústia, o envelhecimento.', true),
  ('e2000000-0000-4000-b000-0000000012a2', 'e2000000-0000-4000-a000-0000000001dd', 0, 'Funcionais e de sofisticação decorativa.', false),
  ('e2000000-0000-4000-b000-0000000012a3', 'e2000000-0000-4000-a000-0000000001dd', 1, 'Futuristas e do abstrato geométrico.', false),
  ('e2000000-0000-4000-b000-0000000012a4', 'e2000000-0000-4000-a000-0000000001dd', 2, 'Construtivistas e de estruturas modulares.', false),
  ('e2000000-0000-4000-b000-0000000012a5', 'e2000000-0000-4000-a000-0000000001dd', 3, 'Abstracionistas e de releitura do objeto.', true),
  ('e2000000-0000-4000-b000-0000000012a6', 'e2000000-0000-4000-a000-0000000001dd', 4, 'Figurativas e de representação do cotidiano.', false),
  ('e2000000-0000-4000-b000-0000000012ac', 'e2000000-0000-4000-a000-0000000001de', 0, 'Anedota, pelo enredo e humor característicos.', true),
  ('e2000000-0000-4000-b000-0000000012ad', 'e2000000-0000-4000-a000-0000000001de', 1, 'Crônica, pela abordagem literária de fatos do cotidiano.', false),
  ('e2000000-0000-4000-b000-0000000012ae', 'e2000000-0000-4000-a000-0000000001de', 2, 'Depoimento, pela apresentação de experiências pessoais.', false),
  ('e2000000-0000-4000-b000-0000000012af', 'e2000000-0000-4000-a000-0000000001de', 3, 'Relato, pela descrição minuciosa de fatos verídicos.', false),
  ('e2000000-0000-4000-b000-0000000012b0', 'e2000000-0000-4000-a000-0000000001de', 4, 'Reportagem, pelo registro impessoal de situações reais.', false),
  ('e2000000-0000-4000-b000-0000000012b6', 'e2000000-0000-4000-a000-0000000001df', 0, 'A preferência por tintas naturais, em razão de seu efeito estético.', false),
  ('e2000000-0000-4000-b000-0000000012b7', 'e2000000-0000-4000-a000-0000000001df', 1, 'A inovação na técnica de pintura, rompendo com modelos estabelecidos.', false),
  ('e2000000-0000-4000-b000-0000000012b8', 'e2000000-0000-4000-a000-0000000001df', 2, 'O registro do pensamento e das crenças das sociedades em várias épocas.', true),
  ('e2000000-0000-4000-b000-0000000012b9', 'e2000000-0000-4000-a000-0000000001df', 3, 'A repetição dos temas e a restrição de uso pelas classes dominantes.', false),
  ('e2000000-0000-4000-b000-0000000012ba', 'e2000000-0000-4000-a000-0000000001df', 4, 'O uso exclusivista da arte para atender aos interesses da elite.', false),
  ('e2000000-0000-4000-b000-0000000012c0', 'e2000000-0000-4000-a000-0000000001e0', 0, 'O desejo do eu lírico de resgatar a movimentação dos centros urbanos, o que revela sua nostalgia com relação à cidade.', false),
  ('e2000000-0000-4000-b000-0000000012c1', 'e2000000-0000-4000-a000-0000000001e0', 1, 'A percepção do caráter efêmero da vida, possibilitada pela observação da aparente inércia da vida rural.', true),
  ('e2000000-0000-4000-b000-0000000012c2', 'e2000000-0000-4000-a000-0000000001e0', 2, 'A opção do eu lírico pelo espaço bucólico como possibilidade de meditação sobre a sua juventude.', false),
  ('e2000000-0000-4000-b000-0000000012c3', 'e2000000-0000-4000-a000-0000000001e0', 3, 'A visão negativa da passagem do tempo, visto que esta gera insegurança.', false),
  ('e2000000-0000-4000-b000-0000000012c4', 'e2000000-0000-4000-a000-0000000001e0', 4, 'A profunda sensação de medo gerada pela reflexão acerca da morte.', false),
  ('e2000000-0000-4000-b000-0000000012ca', 'e2000000-0000-4000-a000-0000000001e1', 0, 'Painel ideográfico, monocromático, que enfoca várias dimensões de um evento, renunciando à realidade, colocando-se em plano frontal ao espectador.', true),
  ('e2000000-0000-4000-b000-0000000012cb', 'e2000000-0000-4000-a000-0000000001e1', 1, 'Horror da guerra de forma fotográfica, com o uso da perspectiva clássica, envolvendo o espectador nesse exemplo brutal de crueldade do ser humano.', false),
  ('e2000000-0000-4000-b000-0000000012cc', 'e2000000-0000-4000-a000-0000000001e1', 2, 'Uso das formas geométricas no mesmo plano, sem emoção e expressão, despreocupado com o volume, a perspectiva e a sensação escultórica.', false),
  ('e2000000-0000-4000-b000-0000000012cd', 'e2000000-0000-4000-a000-0000000001e1', 3, 'Esfacelamento dos objetos abordados na mesma narrativa, minimizando a dor humana a serviço da objetividade, observada pelo uso do claro-escuro.', false),
  ('e2000000-0000-4000-b000-0000000012ce', 'e2000000-0000-4000-a000-0000000001e1', 4, 'Uso de vários ícones que representam personagens fragmentados bidimensionalmente, de forma fotográfica livre de sentimentalismo.', false),
  ('e2000000-0000-4000-b000-0000000012d4', 'e2000000-0000-4000-a000-0000000001e2', 0, 'Critica os processos de aquisição da leitura e da escrita.', false),
  ('e2000000-0000-4000-b000-0000000012d5', 'e2000000-0000-4000-a000-0000000001e2', 1, 'Fala sobre o domínio da leitura e da escrita no Brasil.', false),
  ('e2000000-0000-4000-b000-0000000012d6', 'e2000000-0000-4000-a000-0000000001e2', 2, 'Incentiva a participação efetiva na vida da comunidade.', false),
  ('e2000000-0000-4000-b000-0000000012d7', 'e2000000-0000-4000-a000-0000000001e2', 3, 'Faz uma avaliação crítica a respeito da condição cidadã do brasileiro.', true),
  ('e2000000-0000-4000-b000-0000000012d8', 'e2000000-0000-4000-a000-0000000001e2', 4, 'Define instrumentos eficazes para elevar a condição social da população do Brasil.', false),
  ('e2000000-0000-4000-b000-0000000012de', 'e2000000-0000-4000-a000-0000000001e3', 0, 'Procura desconstruir a visão metafórica do amor e abandona o cuidado formal.', false),
  ('e2000000-0000-4000-b000-0000000012df', 'e2000000-0000-4000-a000-0000000001e3', 1, 'Concebe a mulher como um ser sem linguagem e questiona o poder da palavra.', false),
  ('e2000000-0000-4000-b000-0000000012e0', 'e2000000-0000-4000-a000-0000000001e3', 2, 'Questiona o trabalho intelectual da mulher e antecipa a construção do verso livre.', false),
  ('e2000000-0000-4000-b000-0000000012e1', 'e2000000-0000-4000-a000-0000000001e3', 3, 'Propõe um modelo novo de erotização na lírica amorosa e propõe a simplificação verbal.', false),
  ('e2000000-0000-4000-b000-0000000012e2', 'e2000000-0000-4000-a000-0000000001e3', 4, 'Explora a construção da essência feminina, a partir da polissemia de “língua”, e inova o léxico.', true),
  ('e2000000-0000-4000-b000-0000000012e8', 'e2000000-0000-4000-a000-0000000001e4', 0, 'Destaca o nome de personagens brasileiras e omite o de personagens portuguesas.', false),
  ('e2000000-0000-4000-b000-0000000012e9', 'e2000000-0000-4000-a000-0000000001e4', 1, 'Exalta a força do cenário natural brasileiro e considera o do português inexpressivo.', false),
  ('e2000000-0000-4000-b000-0000000012ea', 'e2000000-0000-4000-a000-0000000001e4', 2, 'Mostra o poder envolvente da música brasileira, que cala o fado português.', true),
  ('e2000000-0000-4000-b000-0000000012eb', 'e2000000-0000-4000-a000-0000000001e4', 3, 'Destaca o sentimentalismo brasileiro, contrário à tristeza dos portugueses.', false),
  ('e2000000-0000-4000-b000-0000000012ec', 'e2000000-0000-4000-a000-0000000001e4', 4, 'Atribui aos brasileiros uma habilidade maior com instrumentos musicais.', false),
  ('e2000000-0000-4000-b000-0000000012f2', 'e2000000-0000-4000-a000-0000000001e5', 0, 'Ressalta a importância dos estudos históricos para a construção da memória social de um povo.', false),
  ('e2000000-0000-4000-b000-0000000012f3', 'e2000000-0000-4000-a000-0000000001e5', 1, 'Valoriza as lembranças individuais em detrimento das narrativas populares ou coletivas.', false),
  ('e2000000-0000-4000-b000-0000000012f4', 'e2000000-0000-4000-a000-0000000001e5', 2, 'Reforça a capacidade da literatura em promover a subjetividade e os valores humanos.', true),
  ('e2000000-0000-4000-b000-0000000012f5', 'e2000000-0000-4000-a000-0000000001e5', 3, 'Destaca a importância de reservar o texto literário àqueles que possuem maior repertório cultural.', false),
  ('e2000000-0000-4000-b000-0000000012f6', 'e2000000-0000-4000-a000-0000000001e5', 4, 'Revela a superioridade da escrita poética como forma ideal de preservação da memória cultural.', false),
  ('e2000000-0000-4000-b000-0000000012fc', 'e2000000-0000-4000-a000-0000000001e6', 0, 'Contribuição dos índios na escolarização dos brasileiros.', false),
  ('e2000000-0000-4000-b000-0000000012fd', 'e2000000-0000-4000-a000-0000000001e6', 1, 'Diferença entre as línguas dos colonizadores e as dos indígenas.', false),
  ('e2000000-0000-4000-b000-0000000012fe', 'e2000000-0000-4000-a000-0000000001e6', 2, 'Importância do padre Antônio Vieira para a literatura de língua portuguesa.', false),
  ('e2000000-0000-4000-b000-0000000012ff', 'e2000000-0000-4000-a000-0000000001e6', 3, 'Origem das diferenças entre a língua portuguesa e as línguas tupi.', false),
  ('e2000000-0000-4000-b000-000000001300', 'e2000000-0000-4000-a000-0000000001e6', 4, 'Interação pacífica no uso da língua portuguesa e da língua tupi.', true),
  ('e2000000-0000-4000-b000-000000001306', 'e2000000-0000-4000-a000-0000000001e7', 0, 'Imprime à canção as marcas de sua atitude pessoal, seus sentimentos.', true),
  ('e2000000-0000-4000-b000-000000001307', 'e2000000-0000-4000-a000-0000000001e7', 1, 'Transmite informações objetivas sobre o tema de que trata a canção.', false),
  ('e2000000-0000-4000-b000-000000001308', 'e2000000-0000-4000-a000-0000000001e7', 2, 'Busca persuadir o receptor da canção a adotar um certo comportamento.', false),
  ('e2000000-0000-4000-b000-000000001309', 'e2000000-0000-4000-a000-0000000001e7', 3, 'Procura explicar a própria linguagem que utiliza para construir a canção.', false),
  ('e2000000-0000-4000-b000-00000000130a', 'e2000000-0000-4000-a000-0000000001e7', 4, 'Objetiva verificar ou fortalecer a eficiência da mensagem veiculada.', false),
  ('e2000000-0000-4000-b000-000000001310', 'e2000000-0000-4000-a000-0000000001e8', 0, 'As suas opiniões, baseadas em fatos.', false),
  ('e2000000-0000-4000-b000-000000001311', 'e2000000-0000-4000-a000-0000000001e8', 1, 'Os aspectos objetivos e precisos.', true),
  ('e2000000-0000-4000-b000-000000001312', 'e2000000-0000-4000-a000-0000000001e8', 2, 'Os elementos de persuasão do leitor.', false),
  ('e2000000-0000-4000-b000-000000001313', 'e2000000-0000-4000-a000-0000000001e8', 3, 'Os elementos estéticos na construção do texto.', false),
  ('e2000000-0000-4000-b000-000000001314', 'e2000000-0000-4000-a000-0000000001e8', 4, 'Os aspectos subjetivos da mencionada pesquisa.', false),
  ('e2000000-0000-4000-b000-00000000131a', 'e2000000-0000-4000-a000-0000000001e9', 0, 'Ressaltar a informação no título, em detrimento do restante do conteúdo associado.', false),
  ('e2000000-0000-4000-b000-00000000131b', 'e2000000-0000-4000-a000-0000000001e9', 1, 'Incluir o leitor por meio do uso da 1a pessoa do plural no discurso.', false),
  ('e2000000-0000-4000-b000-00000000131c', 'e2000000-0000-4000-a000-0000000001e9', 2, 'Contar a história da criação do órgão como argumento de autoridade.', false),
  ('e2000000-0000-4000-b000-00000000131d', 'e2000000-0000-4000-a000-0000000001e9', 3, 'Subverter o fazer publicitário pelo uso de sua metalinguagem.', true),
  ('e2000000-0000-4000-b000-00000000131e', 'e2000000-0000-4000-a000-0000000001e9', 4, 'Impressionar o leitor pelo jogo de palavras no texto.', false),
  ('e2000000-0000-4000-b000-000000001324', 'e2000000-0000-4000-a000-0000000001ea', 0, 'Informar os consumidores em geral sobre a atuação do Conar.', true),
  ('e2000000-0000-4000-b000-000000001325', 'e2000000-0000-4000-a000-0000000001ea', 1, 'Conscientizar publicitários do compromisso ético ao elaborar suas peças publicitárias.', false),
  ('e2000000-0000-4000-b000-000000001326', 'e2000000-0000-4000-a000-0000000001ea', 2, 'Alertar chefes de família, para que eles fiscalizem o conteúdo das propagandas veiculadas pela mídia.', false),
  ('e2000000-0000-4000-b000-000000001327', 'e2000000-0000-4000-a000-0000000001ea', 3, 'Chamar a atenção de empresários e anunciantes em geral para suas responsabilidades ao contratarem publicitários sem ética.', false),
  ('e2000000-0000-4000-b000-000000001328', 'e2000000-0000-4000-a000-0000000001ea', 4, 'Chamar a atenção de empresas para os efeitos nocivos que elas podem causar à sociedade, se compactuarem com propagandas enganosas.', false),
  ('e2000000-0000-4000-b000-00000000132e', 'e2000000-0000-4000-a000-0000000001eb', 0, 'A oposição entre individual e coletivo, trazendo um ideário populista para o anúncio.', false),
  ('e2000000-0000-4000-b000-00000000132f', 'e2000000-0000-4000-a000-0000000001eb', 1, 'A utilização de tratamento informal com o leitor, o que suaviza a seriedade do problema.', false),
  ('e2000000-0000-4000-b000-000000001330', 'e2000000-0000-4000-a000-0000000001eb', 2, 'O emprego de linguagem figurada, o que desvia a atenção da população do apelo financeiro.', false),
  ('e2000000-0000-4000-b000-000000001331', 'e2000000-0000-4000-a000-0000000001eb', 3, 'O uso dos numerais “milhares” e “milhões”, responsável pela supervalorização das condições dos necessitados.', false),
  ('e2000000-0000-4000-b000-000000001332', 'e2000000-0000-4000-a000-0000000001eb', 4, 'O jogo de palavras entre “acordar” e “dormir”, o que relativiza o problema do leitor em relação ao dos necessitados.', true),
  ('e2000000-0000-4000-b000-000000001338', 'e2000000-0000-4000-a000-0000000001ec', 0, 'Inauguração do museu e o grande investimento em cultura no país.', false),
  ('e2000000-0000-4000-b000-000000001339', 'e2000000-0000-4000-a000-0000000001ec', 1, 'Importância da língua para a construção da identidade nacional.', true),
  ('e2000000-0000-4000-b000-00000000133a', 'e2000000-0000-4000-a000-0000000001ec', 2, 'Afetividade tão comum ao brasileiro, retratada através da língua.', false),
  ('e2000000-0000-4000-b000-00000000133b', 'e2000000-0000-4000-a000-0000000001ec', 3, 'Relação entre o idioma e as políticas públicas na área de cultura.', false),
  ('e2000000-0000-4000-b000-00000000133c', 'e2000000-0000-4000-a000-0000000001ec', 4, 'Diversidade étnica e linguística existente no território nacional.', false),
  ('e2000000-0000-4000-b000-000000001342', 'e2000000-0000-4000-a000-0000000001ed', 0, 'Necessidade de trabalho voluntário contínuo para a resolução das mazelas sociais.', false),
  ('e2000000-0000-4000-b000-000000001343', 'e2000000-0000-4000-a000-0000000001ed', 1, 'Importância de ações preventivas para evitar catástrofes, indevidamente atribuídas aos políticos.', false),
  ('e2000000-0000-4000-b000-000000001344', 'e2000000-0000-4000-a000-0000000001ed', 2, 'Incapacidade política para agir de forma diligente na resolução das mazelas sociais.', true),
  ('e2000000-0000-4000-b000-000000001345', 'e2000000-0000-4000-a000-0000000001ed', 3, 'Urgência de se criarem novos órgãos públicos com as mesmas características do SUS.', false),
  ('e2000000-0000-4000-b000-000000001346', 'e2000000-0000-4000-a000-0000000001ed', 4, 'Impossibilidade de o homem agir de forma eficaz ou preventiva diante das ações da natureza.', false),
  ('e2000000-0000-4000-b000-00000000134c', 'e2000000-0000-4000-a000-0000000001ee', 0, 'Ridicularizar a forma física do possível cliente do produto anunciado, aconselhando-o a uma busca de mudanças estéticas.', false),
  ('e2000000-0000-4000-b000-00000000134d', 'e2000000-0000-4000-a000-0000000001ee', 1, 'Enfatizar a tendência da sociedade contemporânea de buscar hábitos alimentares saudáveis, reforçando tal postura.', false),
  ('e2000000-0000-4000-b000-00000000134e', 'e2000000-0000-4000-a000-0000000001ee', 2, 'Criticar o consumo excessivo de produtos industrializados por parte da população, propondo a redução desse consumo.', false),
  ('e2000000-0000-4000-b000-00000000134f', 'e2000000-0000-4000-a000-0000000001ee', 3, 'Associar o vocábulo “açúcar” à imagem do corpo fora de forma, sugerindo a substituição desse produto pelo adoçante.', true),
  ('e2000000-0000-4000-b000-000000001350', 'e2000000-0000-4000-a000-0000000001ee', 4, 'Relacionar a imagem do saco de açúcar a um corpo humano que não desenvolve atividades físicas, incentivando a prática esportiva.', false),
  ('e2000000-0000-4000-b000-000000001356', 'e2000000-0000-4000-a000-0000000001ef', 0, 'Desconsideração da existência das normas populares pelos falantes da norma culta.', false),
  ('e2000000-0000-4000-b000-000000001357', 'e2000000-0000-4000-a000-0000000001ef', 1, 'Difusão do português de Portugal em todas as regiões do Brasil só a partir do século XVIII.', false),
  ('e2000000-0000-4000-b000-000000001358', 'e2000000-0000-4000-a000-0000000001ef', 2, 'Existência de usos da língua que caracterizam uma norma nacional do Brasil, distinta da de Portugal.', true),
  ('e2000000-0000-4000-b000-000000001359', 'e2000000-0000-4000-a000-0000000001ef', 3, 'Inexistência de normas cultas locais e populares ou vernáculas em um determinado país.', false),
  ('e2000000-0000-4000-b000-00000000135a', 'e2000000-0000-4000-a000-0000000001ef', 4, 'Necessidade de se rejeitar a ideia de que os usos frequentes de uma língua devem ser aceitos.', false),
  ('e2000000-0000-4000-b000-000000001360', 'e2000000-0000-4000-a000-0000000001f0', 0, 'Contraria o uso previsto para o registro oral da língua.', false),
  ('e2000000-0000-4000-b000-000000001361', 'e2000000-0000-4000-a000-0000000001f0', 1, 'Contraria a marcação das funções sintáticas de sujeito e objeto.', true),
  ('e2000000-0000-4000-b000-000000001362', 'e2000000-0000-4000-a000-0000000001f0', 2, 'Gera inadequação na concordância com o verbo.', false),
  ('e2000000-0000-4000-b000-000000001363', 'e2000000-0000-4000-a000-0000000001f0', 3, 'Gera ambiguidade na leitura do texto.', false),
  ('e2000000-0000-4000-b000-000000001364', 'e2000000-0000-4000-a000-0000000001f0', 4, 'Apresenta dupla marcação de sujeito.', false),
  ('e2000000-0000-4000-b000-00000000136a', 'e2000000-0000-4000-a000-0000000001f1', 0, 'Existem variedades regionais para nomear uma mesma espécie de planta.', true),
  ('e2000000-0000-4000-b000-00000000136b', 'e2000000-0000-4000-a000-0000000001f1', 1, 'Mandioca é nome específico para a espécie existente na região amazônica.', false),
  ('e2000000-0000-4000-b000-00000000136c', 'e2000000-0000-4000-a000-0000000001f1', 2, '“pão-de-pobre” é designação específica para a planta da região amazônica.', false),
  ('e2000000-0000-4000-b000-00000000136d', 'e2000000-0000-4000-a000-0000000001f1', 3, 'Os nomes designam espécies diferentes da planta, conforme a região.', false),
  ('e2000000-0000-4000-b000-00000000136e', 'e2000000-0000-4000-a000-0000000001f1', 4, 'A planta é nomeada conforme as particularidades que apresenta.', false),
  ('e2000000-0000-4000-b000-000000001374', 'e2000000-0000-4000-a000-0000000001f2', 0, 'Estudantes que não conhecem as diferenças entre língua escrita e língua falada empregam, indistintamente, usos aceitos na conversa com amigos quando vão elaborar um texto escrito.', false),
  ('e2000000-0000-4000-b000-000000001375', 'e2000000-0000-4000-a000-0000000001f2', 1, 'Falantes que dominam a variedade padrão do português do Brasil demonstram usos que confirmam a diferença entre a norma idealizada e a efetivamente praticada, mesmo por falantes mais escolarizados.', true),
  ('e2000000-0000-4000-b000-000000001376', 'e2000000-0000-4000-a000-0000000001f2', 2, 'Moradores de diversas regiões do país que enfrentam dificuldades ao se expressar na escrita revelam a constante modificação das regras de emprego de pronomes e os casos especiais de concordância.', false),
  ('e2000000-0000-4000-b000-000000001377', 'e2000000-0000-4000-a000-0000000001f2', 3, 'Pessoas que se julgam no direito de contrariar a gramática ensinada na escola gostam de apresentar usos não aceitos socialmente para esconderem seu desconhecimento da norma padrão.', false),
  ('e2000000-0000-4000-b000-000000001378', 'e2000000-0000-4000-a000-0000000001f2', 4, 'Usuários que desvendam os mistérios e sutilezas da língua portuguesa empregam formas do verbo ter quando, na verdade, deveriam usar formas do verbo haver, contrariando as regras gramaticais.', false),
  ('e2000000-0000-4000-b000-00000000137e', 'e2000000-0000-4000-a000-0000000001f3', 0, 'A possibilidade que o índio Potty vislumbrou em relação à comunicação que a web pode trazer a seu povo e à facilidade no envio de documentos e na conversação em tempo real.', false),
  ('e2000000-0000-4000-b000-00000000137f', 'e2000000-0000-4000-a000-0000000001f3', 1, 'O uso da internet para preparação e envio de documentos, bem como a contribuição para as atividades relacionadas aos trabalhos da cultura indígena.', false),
  ('e2000000-0000-4000-b000-000000001380', 'e2000000-0000-4000-a000-0000000001f3', 2, 'A preservação da identidade, demonstrada pela conservação do idioma, mesmo com a utilização de novas tecnologias características da cultura de outros grupos sociais.', true),
  ('e2000000-0000-4000-b000-000000001381', 'e2000000-0000-4000-a000-0000000001f3', 3, 'Adesão ao projeto do Comitê para Democratização da Informática (CDI), que, em parceria com a ONG Rede Povos da Floresta, possibilitou o acesso à web, mesmo em ambiente inóspito.', false),
  ('e2000000-0000-4000-b000-000000001382', 'e2000000-0000-4000-a000-0000000001f3', 4, 'A apropriação da nova tecnologia de forma gradual, evidente quando os guaranis incorporaram a novidade tecnológica ao seu estilo de vida com a possibilidade de acesso à internet.', false),
  ('e2000000-0000-4000-b000-000000001388', 'e2000000-0000-4000-a000-0000000001f4', 0, 'A evolução ocorreu e com ela evoluíram as dores de cabeça, o estresse e a falta de atenção à família.', false),
  ('e2000000-0000-4000-b000-000000001389', 'e2000000-0000-4000-a000-0000000001f4', 1, 'A vida sem o computador tornou-se quase inviável, mas se tem diminuído problemas de visão cansada.', false),
  ('e2000000-0000-4000-b000-00000000138a', 'e2000000-0000-4000-a000-0000000001f4', 2, 'A utilização demasiada do computador tem proporcionado o surgimento de cientistas que apresentam lesão por esforço repetitivo.', false),
  ('e2000000-0000-4000-b000-00000000138b', 'e2000000-0000-4000-a000-0000000001f4', 3, 'O homem criou o computador, que evoluiu, e hoje opera várias ações antes feitas pelas pessoas, tornando-as sedentárias ou obesas.', false),
  ('e2000000-0000-4000-b000-00000000138c', 'e2000000-0000-4000-a000-0000000001f4', 4, 'O uso contínuo do computador de forma inadequada tem ocasionado má postura corporal.', true)
on conflict (id) do nothing;
commit;
