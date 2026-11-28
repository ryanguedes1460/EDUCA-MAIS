// Resumos e mapas mentais da Educa Mais (texto autoral, escrito para revisão rápida).
// Cada resumo vira duas coisas na tela: a lista de tópicos (resumo) e o mapa mental desenhado em SVG.
// prioridade: 3 = cai muito no ENEM e nos vestibulares, 2 = cai com frequência, 1 = cai às vezes.
// busca: palavra usada para achar o conteúdo correspondente no banco de questões.
const R = (id, disc, titulo, prioridade, busca, ideia, ramos, cai) => ({ id, disc, titulo, prioridade, busca, ideia, ramos, cai });

export const DISCIPLINAS = [
  { id: 'mat', nome: 'Matemática', icone: '📐', materia: 'Matemática' },
  { id: 'fis', nome: 'Física', icone: '⚛️', materia: 'Física' },
  { id: 'qui', nome: 'Química', icone: '🧪', materia: 'Química' },
  { id: 'bio', nome: 'Biologia', icone: '🧬', materia: 'Biologia' },
  { id: 'his', nome: 'História', icone: '🏛️', materia: 'História' },
  { id: 'geo', nome: 'Geografia', icone: '🌎', materia: 'Geografia' },
  { id: 'por', nome: 'Português', icone: '📖', materia: 'Português' },
  { id: 'lit', nome: 'Literatura', icone: '📚', materia: 'Literatura' },
  { id: 'fil', nome: 'Filosofia', icone: '🤔', materia: 'Filosofia' },
  { id: 'soc', nome: 'Sociologia', icone: '👥', materia: 'Sociologia' }
];

export const RESUMOS = [
  // ============================ MATEMÁTICA ============================
  R('mat-porcentagem', 'mat', 'Porcentagem e juros', 3, 'Porcentagem', 'Porcentagem é uma razão de denominador 100; quase toda conta vira multiplicação por um fator.', [
    ['Fator multiplicativo', ['Aumento de p%: multiplique por (1 + p/100)', 'Desconto de p%: multiplique por (1 − p/100)', 'Aumentos sucessivos: multiplique os fatores, não some as taxas']],
    ['Juros simples', ['J = C·i·t', 'Montante: M = C(1 + i·t)', 'Cresce em linha reta (PA)']],
    ['Juros compostos', ['M = C(1 + i)ᵗ', 'Juro sobre juro: cresce como PG', 'Taxa e tempo na mesma unidade']],
    ['Armadilhas', ['20% de aumento seguido de 20% de desconto não volta ao preço inicial (fica 96%)', 'Ponto percentual ≠ porcentagem']]
  ], 'Contas de supermercado, salário, inflação e financiamento. O ENEM cobra muito fator multiplicativo e comparação de planos.'),
  R('mat-razao', 'mat', 'Razão, proporção e escala', 3, 'Razão', 'Comparar grandezas: direta quando crescem juntas, inversa quando uma cresce e a outra diminui.', [
    ['Razão e proporção', ['Razão: a/b', 'Proporção: a/b = c/d ⇔ a·d = b·c']],
    ['Grandezas', ['Diretamente proporcionais: razão constante', 'Inversamente proporcionais: produto constante', 'Regra de três composta: analise cada grandeza com a incógnita']],
    ['Escala', ['E = medida no desenho / medida real (mesma unidade)', '1:100.000 → 1 cm = 1 km', 'Área escala ao quadrado; volume ao cubo']],
    ['Densidades e taxas', ['Velocidade, densidade demográfica, consumo (km/L)', 'Sempre olhe a unidade']]
  ], 'Mapas, plantas de casa, receitas e consumo de combustível. Atenção a escala de área (k²).'),
  R('mat-estatistica', 'mat', 'Estatística: média, moda e mediana', 3, 'Estatística', 'Medidas que resumem um conjunto de dados: tendência central e dispersão.', [
    ['Tendência central', ['Média: soma ÷ quantidade', 'Média ponderada: Σ(valor·peso) ÷ Σpesos', 'Mediana: valor do meio com os dados em ordem', 'Moda: valor que mais aparece']],
    ['Dispersão', ['Amplitude: maior − menor', 'Variância: média dos quadrados dos desvios', 'Desvio padrão: raiz da variância; quanto menor, mais regular']],
    ['Gráficos', ['Barras: comparar categorias', 'Linhas: evolução no tempo', 'Setores: partes de um todo (360° = 100%)', 'Histograma: classes de valores']]
  ], 'Leitura de tabelas e gráficos é das habilidades mais cobradas. Mediana com quantidade par: média dos dois centrais.'),
  R('mat-funcao-afim', 'mat', 'Função afim (1º grau)', 3, 'Função afim', 'f(x) = ax + b: o gráfico é uma reta; a é a taxa de variação e b é o valor inicial.', [
    ['Coeficientes', ['a > 0: crescente; a < 0: decrescente', 'a = Δy/Δx (inclinação)', 'b: onde a reta corta o eixo y']],
    ['Raiz', ['f(x) = 0 ⇒ x = −b/a', 'Ponto onde a reta corta o eixo x']],
    ['Aplicações', ['Tarifa fixa + valor por unidade', 'Comparar planos: igualar as duas funções', 'Proporcional quando b = 0']]
  ], 'Planos de celular, táxi, conta de água. Comparar duas retas e achar o ponto de equilíbrio.'),
  R('mat-funcao-quadratica', 'mat', 'Função quadrática (2º grau)', 3, 'quadrática', 'f(x) = ax² + bx + c: o gráfico é uma parábola, com concavidade dada pelo sinal de a.', [
    ['Gráfico', ['a > 0: boca para cima (mínimo)', 'a < 0: boca para baixo (máximo)', 'c: corte no eixo y']],
    ['Raízes', ['Δ = b² − 4ac', 'x = (−b ± √Δ)/2a', 'Δ > 0: duas raízes; Δ = 0: uma; Δ < 0: nenhuma real', 'Soma = −b/a; produto = c/a']],
    ['Vértice', ['xv = −b/2a', 'yv = −Δ/4a', 'Máximo lucro, altura máxima, área máxima']]
  ], 'Problemas de máximo e mínimo (lucro, área, lançamento). Use o vértice.'),
  R('mat-exp-log', 'mat', 'Exponencial e logaritmo', 2, 'Logaritmo', 'Crescimentos por um fator constante (populações, juros, decaimento) e a operação inversa, o logaritmo.', [
    ['Exponencial', ['f(x) = a·bˣ', 'b > 1: crescente; 0 < b < 1: decrescente', 'Meia-vida: a quantidade cai pela metade a cada período']],
    ['Logaritmo', ['log_b a = x ⇔ bˣ = a', 'log(a·c) = log a + log c', 'log(a/c) = log a − log c', 'log aⁿ = n·log a']],
    ['Aplicações', ['Escala Richter e pH são logarítmicas', 'Tempo para dobrar: resolver bˣ = 2']]
  ], 'Crescimento de bactérias, juros compostos, terremotos, pH.'),
  R('mat-pa-pg', 'mat', 'Progressões (PA e PG)', 2, 'Progress', 'Sequências que crescem somando (PA) ou multiplicando (PG) um valor fixo.', [
    ['PA', ['Razão r: diferença entre termos', 'aₙ = a₁ + (n − 1)r', 'Soma: Sₙ = (a₁ + aₙ)·n/2']],
    ['PG', ['Razão q: quociente entre termos', 'aₙ = a₁·qⁿ⁻¹', 'Soma: Sₙ = a₁(qⁿ − 1)/(q − 1)', 'Soma infinita (|q|<1): a₁/(1 − q)']],
    ['Ligações', ['Juros simples ↔ PA', 'Juros compostos ↔ PG']]
  ], 'Padrões em figuras, economia mensal, contas de crescimento.'),
  R('mat-geometria-plana', 'mat', 'Geometria plana: áreas', 3, 'Geometria plana', 'Áreas e perímetros das figuras mais usadas, com atenção às unidades.', [
    ['Áreas', ['Retângulo: b·h', 'Triângulo: b·h/2', 'Trapézio: (B + b)·h/2', 'Losango: D·d/2', 'Círculo: πr²']],
    ['Triângulos', ['Soma dos ângulos internos: 180°', 'Pitágoras: a² = b² + c²', 'Semelhança: lados proporcionais']],
    ['Polígonos', ['Soma dos ângulos internos: (n − 2)·180°', 'Diagonais: n(n − 3)/2']],
    ['Unidades', ['1 m² = 10.000 cm²', '1 hectare = 10.000 m²']]
  ], 'Terrenos, pisos, pinturas, plantas baixas. Converter unidade de área é armadilha comum.'),
  R('mat-geometria-espacial', 'mat', 'Geometria espacial: volumes', 3, 'espacial', 'Volume é área da base vezes altura (prismas e cilindros) ou um terço disso (pirâmides e cones).', [
    ['Prismas e cilindros', ['V = Ab·h', 'Cilindro: V = πr²h', 'Paralelepípedo: a·b·c']],
    ['Pirâmides e cones', ['V = Ab·h/3', 'Cone: V = πr²h/3']],
    ['Esfera', ['V = 4πr³/3', 'Área: 4πr²']],
    ['Capacidade', ['1 dm³ = 1 L', '1 m³ = 1.000 L', 'Planificação: as faces abertas no plano']]
  ], 'Caixas d’água, embalagens, latas e reservatórios. Litros ↔ m³ cai muito.'),
  R('mat-trigonometria', 'mat', 'Trigonometria', 2, 'Trigonometria', 'Relações entre ângulos e lados de triângulos, e as funções periódicas seno e cosseno.', [
    ['Triângulo retângulo', ['sen = oposto/hipotenusa', 'cos = adjacente/hipotenusa', 'tg = oposto/adjacente']],
    ['Ângulos notáveis', ['sen 30° = 1/2; cos 30° = √3/2', 'sen 45° = cos 45° = √2/2', 'sen 60° = √3/2; cos 60° = 1/2']],
    ['Qualquer triângulo', ['Lei dos senos: a/sen A = b/sen B', 'Lei dos cossenos: a² = b² + c² − 2bc·cos A']],
    ['Funções', ['sen²x + cos²x = 1', 'Período de sen(kx): 2π/k', 'Fenômenos periódicos: marés, ondas, rodas-gigantes']]
  ], 'Alturas de prédios e rampas (ângulo de elevação) e fenômenos periódicos.'),
  R('mat-combinatoria', 'mat', 'Análise combinatória', 2, 'combinatória', 'Contar possibilidades sem listar uma a uma.', [
    ['Princípio fundamental', ['Etapas independentes: multiplique as possibilidades']],
    ['Permutação', ['n! (todos em fila)', 'Com repetição: n!/(a!·b!…)', 'Anagramas']],
    ['Arranjo × Combinação', ['A ordem importa? Arranjo: n!/(n − p)!', 'Não importa? Combinação: n!/[p!(n − p)!]', 'Senha e pódio: arranjo; comissão e salada: combinação']]
  ], 'Senhas, placas, comissões e cardápios. A pergunta-chave é se a ordem importa.'),
  R('mat-probabilidade', 'mat', 'Probabilidade', 3, 'Probabilidade', 'P = casos favoráveis ÷ casos possíveis, todos igualmente prováveis.', [
    ['Básico', ['0 ≤ P ≤ 1', 'Evento complementar: P(não A) = 1 − P(A)']],
    ['E / OU', ['E (independentes): multiplique', 'OU (excludentes): some', 'P(A ∪ B) = P(A) + P(B) − P(A ∩ B)']],
    ['Condicional', ['P(A|B) = P(A ∩ B)/P(B)', 'O espaço amostral encolhe para B']]
  ], 'Sorteios, dados, genética, exames médicos. Use o complementar quando a pergunta tiver "pelo menos um".'),
  R('mat-matrizes', 'mat', 'Matrizes e sistemas lineares', 1, 'Sistemas lineares', 'Tabelas de números e as equações que elas organizam.', [
    ['Matrizes', ['Ordem m × n', 'Produto: linha × coluna (colunas de A = linhas de B)', 'Identidade: 1 na diagonal']],
    ['Determinante', ['2×2: ad − bc', 'det = 0: matriz sem inversa']],
    ['Sistemas', ['Substituição ou adição', 'SPD: uma solução; SPI: infinitas; SI: nenhuma']]
  ], 'Problemas com duas ou três incógnitas (preços, idades, misturas).'),
  R('mat-analitica', 'mat', 'Geometria analítica', 2, 'analítica', 'Geometria feita com coordenadas no plano cartesiano.', [
    ['Pontos', ['Distância: √[(Δx)² + (Δy)²]', 'Ponto médio: média das coordenadas']],
    ['Reta', ['y = mx + n', 'm = Δy/Δx', 'Paralelas: mesmo m; perpendiculares: m₁·m₂ = −1']],
    ['Circunferência', ['(x − a)² + (y − b)² = r²', 'Centro (a, b) e raio r']]
  ], 'Mapas com coordenadas, rotas e localização.'),
  R('mat-conjuntos', 'mat', 'Conjuntos e conjuntos numéricos', 1, 'Conjuntos', 'Agrupar elementos e entender as operações entre grupos.', [
    ['Operações', ['União: está em A ou em B', 'Interseção: está em A e em B', 'Diferença A − B: só em A']],
    ['Contagem', ['n(A ∪ B) = n(A) + n(B) − n(A ∩ B)', 'Diagrama de Venn: comece pela interseção']],
    ['Numéricos', ['ℕ ⊂ ℤ ⊂ ℚ ⊂ ℝ', 'Irracionais: √2, π (dízimas não periódicas)']]
  ], 'Pesquisas de preferência (quem gosta de A, de B, dos dois, de nenhum).'),

  // ============================ FÍSICA ============================
  R('fis-cinematica', 'fis', 'Cinemática: MU e MUV', 3, 'Cinemática', 'Descrever o movimento: posição, velocidade e aceleração ao longo do tempo.', [
    ['MU', ['Velocidade constante', 's = s₀ + vt', 'Gráfico s×t: reta; inclinação = v']],
    ['MUV', ['Aceleração constante', 'v = v₀ + at', 's = s₀ + v₀t + at²/2', 'Torricelli: v² = v₀² + 2aΔs']],
    ['Gráficos', ['v×t: área = deslocamento', 'v×t: inclinação = aceleração']],
    ['Unidades', ['km/h ÷ 3,6 = m/s', 'Velocidade média = Δs/Δt (não é a média das velocidades)']]
  ], 'Leitura de gráficos e situações de trânsito (frenagem, ultrapassagem, radar).'),
  R('fis-lancamentos', 'fis', 'Queda livre e lançamentos', 2, 'Lançamento', 'Movimentos sob a gravidade, sem resistência do ar.', [
    ['Queda livre', ['a = g ≈ 10 m/s²', 'h = gt²/2', 'v = gt', 'Não depende da massa']],
    ['Lançamento vertical', ['Na altura máxima v = 0', 'Tempo de subida = v₀/g', 'H = v₀²/2g']],
    ['Oblíquo', ['Horizontal: MU com vx = v·cos θ', 'Vertical: MUV com vy = v·sen θ', 'Alcance máximo a 45°']]
  ], 'Decomposição da velocidade e tempo de voo.'),
  R('fis-newton', 'fis', 'Leis de Newton', 3, 'Dinâmica', 'Força muda o estado de movimento; a resultante determina a aceleração.', [
    ['1ª lei (inércia)', ['Sem força resultante: repouso ou MRU', 'Cinto de segurança, freada do ônibus']],
    ['2ª lei', ['Fr = m·a', 'Peso: P = m·g', 'Força em newtons (N)']],
    ['3ª lei', ['Ação e reação: mesmo módulo, sentidos opostos, corpos diferentes', 'Nunca se anulam']],
    ['Forças comuns', ['Normal, tração, atrito (Fat = μN), elástica (F = kx)', 'Plano inclinado: P·sen θ ao longo do plano']]
  ], 'Situações do cotidiano (elevador, carro, foguete). Separe as forças em cada corpo.'),
  R('fis-energia', 'fis', 'Trabalho, energia e potência', 3, 'Energia', 'Energia se transforma, mas o total se conserva; trabalho mede essa transferência.', [
    ['Formas', ['Cinética: mv²/2', 'Potencial gravitacional: mgh', 'Potencial elástica: kx²/2']],
    ['Conservação', ['Sem atrito: Ec + Ep = constante', 'Com atrito: parte vira calor (energia dissipada)']],
    ['Trabalho', ['τ = F·d·cos θ', 'Teorema: τ resultante = ΔEc']],
    ['Potência e rendimento', ['P = τ/Δt (watts)', 'η = útil/total', '1 kWh = 3,6·10⁶ J']]
  ], 'Usinas, montanha-russa, consumo de aparelhos. Cadeias de transformação de energia são clássicas.'),
  R('fis-impulso', 'fis', 'Impulso e quantidade de movimento', 2, 'colis', 'Em sistemas isolados a quantidade de movimento total se conserva.', [
    ['Grandezas', ['Q = m·v (vetor)', 'Impulso: I = F·Δt = ΔQ']],
    ['Colisões', ['Q total se conserva em todas', 'Elástica: conserva energia cinética', 'Perfeitamente inelástica: corpos seguem juntos, maior perda de energia']],
    ['Aplicações', ['Airbag aumenta Δt e diminui a força', 'Recuo de arma, explosões']]
  ], 'Segurança veicular (airbag, zona de deformação) e choques.'),
  R('fis-gravitacao', 'fis', 'Gravitação universal', 3, 'Gravitação', 'Toda massa atrai outra massa; a mesma lei explica a queda de uma maçã e a órbita da Lua.', [
    ['Lei de Newton', ['F = G·M·m/d²', 'Dobrou a distância: força cai para 1/4', 'Atração mútua: mesmo módulo nos dois corpos']],
    ['Leis de Kepler', ['1ª: órbitas elípticas, Sol num dos focos', '2ª: áreas iguais em tempos iguais (mais rápido no periélio)', '3ª: T²/R³ = constante']],
    ['Gravidade', ['g = GM/R²', 'Em altitude h: g = GM/(R + h)²', 'Peso muda de planeta; massa não']],
    ['Satélites', ['v = √(GM/R): não depende da massa do satélite', 'Geoestacionário: período de 24 h sobre o equador', 'Imponderabilidade: tudo cai junto (não é ausência de gravidade)']]
  ], 'Relações de proporção (o que acontece se a distância dobrar?) e interpretação de órbitas e satélites.'),
  R('fis-hidrostatica', 'fis', 'Hidrostática', 2, 'Hidrostática', 'Pressão nos fluidos e a força de empuxo.', [
    ['Pressão', ['p = F/A', 'Stevin: p = p₀ + d·g·h', 'A cada 10 m de água, +1 atm']],
    ['Pascal', ['Pressão se transmite igualmente', 'Prensa hidráulica: F₁/A₁ = F₂/A₂']],
    ['Arquimedes', ['Empuxo: E = d_líquido·V_submerso·g', 'Flutua se a densidade do corpo for menor que a do líquido', 'Fração submersa = d_corpo/d_líquido']]
  ], 'Mergulho, freios hidráulicos, navios e icebergs.'),
  R('fis-termologia', 'fis', 'Calorimetria e trocas de calor', 3, 'Calor', 'Calor é energia em trânsito por diferença de temperatura.', [
    ['Escalas', ['C/5 = (F − 32)/9 = (K − 273)/5', 'K = C + 273']],
    ['Calor sensível', ['Q = m·c·ΔT', 'c da água = 1 cal/g°C (alto: a água esquenta devagar)']],
    ['Calor latente', ['Q = m·L', 'Na mudança de fase a temperatura não muda']],
    ['Propagação', ['Condução (sólidos)', 'Convecção (fluidos: brisas, geladeira)', 'Irradiação (ondas, inclusive no vácuo)']]
  ], 'Garrafa térmica, efeito estufa, brisas marítimas, cozinha. Equilíbrio térmico: ΣQ = 0.'),
  R('fis-termodinamica', 'fis', 'Gases e termodinâmica', 2, 'Termodinâmica', 'Como gases trocam calor e trabalho, e os limites das máquinas térmicas.', [
    ['Gases', ['pV = nRT (Clapeyron)', 'p·V/T constante para massa fixa', 'Isotérmica, isobárica, isovolumétrica']],
    ['1ª lei', ['Q = τ + ΔU', 'Expansão: gás realiza trabalho (τ > 0)', 'Adiabática: Q = 0']],
    ['2ª lei', ['Calor flui do quente para o frio espontaneamente', 'Nenhuma máquina tem rendimento de 100%', 'Carnot: η = 1 − Tf/Tq (em kelvin)']]
  ], 'Motores, geladeiras e usinas térmicas. Temperatura sempre em kelvin.'),
  R('fis-optica', 'fis', 'Óptica geométrica', 2, 'Óptica', 'A luz em linha reta: sombras, reflexão, refração e lentes.', [
    ['Princípios', ['Propagação retilínea (sombra, eclipse, câmara escura)', 'Independência e reversibilidade dos raios']],
    ['Reflexão', ['Ângulo de incidência = ângulo de reflexão', 'Espelho plano: imagem virtual, simétrica, mesmo tamanho', 'Associação: N = 360/α − 1']],
    ['Refração', ['n = c/v', 'Snell: n₁·sen i = n₂·sen r', 'Reflexão total: fibra óptica, brilho do diamante']],
    ['Lentes e visão', ['V = 1/f (dioptria)', 'Miopia: lente divergente', 'Hipermetropia e presbiopia: lente convergente']]
  ], 'Óculos, câmeras, arco-íris, piscina que parece mais rasa.'),
  R('fis-ondas', 'fis', 'Ondulatória e som', 3, 'Ondulatória', 'Ondas transportam energia sem transportar matéria.', [
    ['Equação', ['v = λ·f', 'f = 1/T', 'Na refração muda v e λ; f não muda']],
    ['Tipos', ['Mecânicas (precisam de meio: som)', 'Eletromagnéticas (luz, rádio, micro-ondas: andam no vácuo)', 'Transversais e longitudinais (som no ar)']],
    ['Fenômenos', ['Reflexão (eco), refração, difração (contornar obstáculos)', 'Interferência', 'Ressonância', 'Efeito Doppler: fonte se aproxima → som mais agudo']],
    ['Som', ['Altura: frequência (grave/agudo)', 'Intensidade: amplitude (decibéis)', 'Timbre: forma da onda']]
  ], 'Espectro eletromagnético, tecnologias (rádio, wi-fi, ultrassom) e qualidades do som.'),
  R('fis-eletrostatica', 'fis', 'Eletrostática', 2, 'Eletrost', 'Cargas elétricas em repouso: forças, campo e potencial.', [
    ['Eletrização', ['Atrito: cargas opostas', 'Contato: mesmo sinal', 'Indução: aproximar sem tocar']],
    ['Coulomb', ['F = k·|q₁q₂|/d²', 'Iguais se repelem; opostas se atraem']],
    ['Campo e potencial', ['E = F/q', 'V = k·Q/d', 'Gaiola de Faraday: campo nulo dentro do condutor']]
  ], 'Raios, para-raios, choque na porta do carro, xerox.'),
  R('fis-eletrodinamica', 'fis', 'Eletricidade: circuitos e consumo', 3, 'Circuito', 'Corrente, resistência, potência e o custo da energia em casa.', [
    ['Ohm', ['U = R·i', 'R = ρ·L/A (fio mais longo ou fino: mais resistência)']],
    ['Associações', ['Série: Req = soma; mesma corrente', 'Paralelo: 1/Req = Σ1/R; mesma tensão', 'Casas usam ligação em paralelo']],
    ['Potência', ['P = U·i = R·i² = U²/R', 'Energia: E = P·Δt (kWh)', 'Custo = kWh × tarifa']],
    ['Segurança', ['Disjuntor e fusível protegem contra sobrecorrente', 'Chuveiro: posição inverno tem menor resistência']]
  ], 'Conta de luz, chuveiro elétrico, lâmpadas. Questões de consumo estão entre as mais frequentes.'),
  R('fis-magnetismo', 'fis', 'Magnetismo e indução', 2, 'magn', 'Correntes criam campos magnéticos e campos variáveis criam correntes.', [
    ['Ímãs', ['Polos inseparáveis', 'Bússola aponta para o polo sul magnético (perto do norte geográfico)']],
    ['Força magnética', ['Em carga: F = q·v·B·sen θ', 'Em fio: F = B·i·L', 'Regra da mão direita']],
    ['Indução', ['Faraday: variação de fluxo gera corrente', 'Lenz: a corrente induzida se opõe à variação', 'Geradores, transformadores, carregador por indução']]
  ], 'Usinas (geradores), motores elétricos e transformadores.'),

  // ============================ QUÍMICA ============================
  R('qui-atomistica', 'qui', 'Modelos atômicos', 2, 'atôm', 'A ideia de átomo mudou com cada experimento.', [
    ['Modelos', ['Dalton: esfera maciça', 'Thomson: pudim de passas (elétrons)', 'Rutherford: núcleo pequeno e denso, eletrosfera', 'Bohr: níveis de energia; salto emite luz']],
    ['Partículas', ['Z = prótons', 'A = prótons + nêutrons', 'Íons: ganham ou perdem elétrons']],
    ['Semelhanças', ['Isótopos: mesmo Z', 'Isóbaros: mesmo A', 'Isótonos: mesmos nêutrons']]
  ], 'Fogos de artifício e teste de chama (Bohr), experimento da folha de ouro.'),
  R('qui-tabela', 'qui', 'Tabela periódica', 2, 'periódic', 'Elementos organizados por número atômico; propriedades se repetem.', [
    ['Organização', ['Períodos: linhas (camadas)', 'Famílias: colunas (elétrons de valência)', '1: metais alcalinos; 17: halogênios; 18: gases nobres']],
    ['Propriedades', ['Raio atômico: cresce para baixo e para a esquerda', 'Eletronegatividade e energia de ionização: crescem para cima e para a direita (flúor)']],
    ['Classificação', ['Metais: conduzem, maleáveis', 'Ametais', 'Gases nobres: estáveis']]
  ], 'Prever reatividade e tipo de ligação pela posição.'),
  R('qui-ligacoes', 'qui', 'Ligações e forças intermoleculares', 3, 'Ligaç', 'Como os átomos se unem e como as moléculas se atraem.', [
    ['Ligações', ['Iônica: metal + ametal (transferência de elétrons)', 'Covalente: ametais (compartilham)', 'Metálica: mar de elétrons']],
    ['Polaridade', ['Geometria + eletronegatividade', 'Semelhante dissolve semelhante']],
    ['Forças intermoleculares', ['Dipolo induzido (fraca)', 'Dipolo-dipolo', 'Ligação de hidrogênio: H ligado a F, O ou N (forte)', 'Mais força → maior ponto de ebulição']]
  ], 'Solubilidade (óleo e água, sabão), pontos de ebulição.'),
  R('qui-funcoes-inorganicas', 'qui', 'Ácidos, bases, sais e óxidos', 2, 'inorgân', 'As quatro funções inorgânicas e a neutralização.', [
    ['Arrhenius', ['Ácido: libera H⁺ em água', 'Base: libera OH⁻', 'Neutralização: ácido + base → sal + água']],
    ['pH', ['pH < 7 ácido; 7 neutro; > 7 básico', 'Cada unidade de pH = 10 vezes']],
    ['Óxidos', ['Ácidos: CO₂, SO₂, NO₂ (chuva ácida)', 'Básicos: CaO (cal)']]
  ], 'Chuva ácida, antiácido estomacal, correção do solo com calcário.'),
  R('qui-estequiometria', 'qui', 'Mol e estequiometria', 3, 'Estequiometria', 'Contar partículas pela massa: a proporção da equação balanceada manda.', [
    ['Mol', ['1 mol = 6·10²³ partículas', 'Massa molar em g/mol', 'Gás nas CNTP: 22,4 L/mol']],
    ['Cálculo', ['Balanceie a equação', 'Use a proporção em mols', 'Regra de três com as unidades pedidas']],
    ['Casos', ['Reagente limitante acaba primeiro', 'Pureza: use só a parte pura', 'Rendimento: real/teórico']]
  ], 'Produção industrial, combustão, emissão de CO₂.'),
  R('qui-solucoes', 'qui', 'Soluções e concentração', 2, 'Soluç', 'Quanto soluto há em cada volume de solução.', [
    ['Concentrações', ['Comum: C = m/V (g/L)', 'Molar: M = n/V (mol/L)', 'Título e ppm']],
    ['Diluição', ['C₁V₁ = C₂V₂', 'Adicionar água diminui a concentração']],
    ['Solubilidade', ['Coeficiente: máximo dissolvido', 'Saturada, insaturada, supersaturada']]
  ], 'Soro caseiro, rótulos, água sanitária, contaminação em ppm.'),
  R('qui-termoquimica', 'qui', 'Termoquímica', 2, 'Termoquímica', 'Calor liberado ou absorvido nas reações.', [
    ['Tipos', ['Exotérmica: ΔH < 0 (libera calor; combustão)', 'Endotérmica: ΔH > 0 (absorve; fotossíntese)']],
    ['Cálculo', ['ΔH = ΣHf produtos − ΣHf reagentes', 'Hess: soma de etapas', 'Energia de ligação: quebrar absorve, formar libera']]
  ], 'Poder calorífico de combustíveis e comparação entre etanol e gasolina.'),
  R('qui-cinetica', 'qui', 'Cinética química', 2, 'Cinética', 'A velocidade das reações e o que a altera.', [
    ['Fatores', ['Temperatura ↑ velocidade ↑', 'Superfície de contato ↑', 'Concentração ↑', 'Catalisador: diminui a energia de ativação']],
    ['Lei de velocidade', ['v = k[A]ᵃ[B]ᵇ', 'Ordens obtidas experimentalmente']]
  ], 'Conservar alimentos na geladeira, comprimido efervescente, enzimas.'),
  R('qui-equilibrio', 'qui', 'Equilíbrio químico e pH', 2, 'Equilíbrio', 'Reações reversíveis chegam a um estado em que as velocidades se igualam.', [
    ['Constante', ['Kc = [produtos]/[reagentes] (com expoentes)', 'Sólidos e líquidos puros não entram']],
    ['Le Chatelier', ['O sistema reage contra a perturbação', 'Aumentar reagente: desloca para os produtos', 'Pressão maior: lado com menos mols de gás']],
    ['pH', ['pH = −log[H⁺]', 'pH + pOH = 14', 'Tampão resiste a mudanças de pH (sangue)']]
  ], 'Hidrólise de sais, tampão no sangue, síntese da amônia.'),
  R('qui-eletroquimica', 'qui', 'Eletroquímica', 2, 'Eletroquímica', 'Reações de oxirredução que produzem ou consomem corrente.', [
    ['Oxirredução', ['Oxidação: perde elétrons', 'Redução: ganha elétrons']],
    ['Pilha', ['Espontânea', 'Ânodo: oxidação (−)', 'Cátodo: redução (+)', 'ddp = E°red maior − E°red menor']],
    ['Eletrólise', ['Não espontânea (precisa de fonte)', 'Galvanoplastia, produção de alumínio', 'Faraday: 96.500 C por mol de elétrons']],
    ['Corrosão', ['Ferrugem', 'Metal de sacrifício (zinco protege o ferro)']]
  ], 'Baterias, ferrugem, descarte de pilhas.'),
  R('qui-organica', 'qui', 'Funções orgânicas', 3, 'orgân', 'Compostos de carbono identificados pelo grupo funcional.', [
    ['Hidrocarbonetos', ['Só C e H', 'Alcano (simples), alceno (dupla), alcino (tripla), aromáticos']],
    ['Oxigenadas', ['Álcool: –OH em C saturado', 'Aldeído: –CHO na ponta', 'Cetona: C=O no meio', 'Ácido carboxílico: –COOH', 'Éster: –COO– (aromas)']],
    ['Nitrogenadas', ['Amina: –NH₂', 'Amida: –CONH₂']],
    ['Isomeria', ['Mesma fórmula molecular, estruturas diferentes', 'Óptica: carbono quiral (medicamentos)']]
  ], 'Identificar funções em moléculas de remédios, hormônios e alimentos.'),
  R('qui-reacoes-organicas', 'qui', 'Reações orgânicas e polímeros', 1, 'Polímer', 'Transformações dos compostos de carbono e a química dos plásticos.', [
    ['Reações', ['Adição: quebra a dupla', 'Substituição: troca um H', 'Esterificação: ácido + álcool → éster + água', 'Saponificação: gordura + base → sabão']],
    ['Polímeros', ['Adição: polietileno, PVC', 'Condensação: PET, náilon', 'Biodegradáveis × plásticos comuns']]
  ], 'Sabão e detergente, biodiesel, plásticos e meio ambiente.'),
  R('qui-radioatividade', 'qui', 'Radioatividade', 2, 'Radioativ', 'Núcleos instáveis emitem radiação até ficarem estáveis.', [
    ['Emissões', ['Alfa (α): A − 4, Z − 2; pouco penetrante', 'Beta (β): Z + 1', 'Gama (γ): onda, muito penetrante']],
    ['Meia-vida', ['Tempo para a massa cair à metade', 'Após n meias-vidas: m₀/2ⁿ', 'Datação por carbono-14']],
    ['Nuclear', ['Fissão: núcleo grande se divide (usinas)', 'Fusão: núcleos leves se unem (Sol)']]
  ], 'Medicina nuclear, acidentes (Goiânia, Chernobyl), datação.'),
  R('qui-misturas', 'qui', 'Substâncias e separação de misturas', 2, 'mistura', 'Distinguir substâncias de misturas e escolher o método de separação.', [
    ['Misturas', ['Homogênea: uma fase', 'Heterogênea: mais de uma fase']],
    ['Métodos', ['Filtração: sólido + líquido', 'Decantação: líquidos imiscíveis', 'Destilação simples: sólido dissolvido', 'Destilação fracionada: petróleo', 'Centrifugação, imantação, peneiração']],
    ['Fenômenos', ['Físico: não muda a substância', 'Químico: forma substância nova']]
  ], 'Tratamento de água (coagulação, floculação, decantação, filtração, cloração).'),

  // ============================ BIOLOGIA ============================
  R('bio-citologia', 'bio', 'Citologia: a célula', 3, 'Célula', 'A célula é a unidade da vida; organelas dividem o trabalho.', [
    ['Tipos', ['Procarionte: sem núcleo (bactérias)', 'Eucarionte: com núcleo (animais, plantas, fungos)']],
    ['Organelas', ['Mitocôndria: respiração', 'Cloroplasto: fotossíntese', 'Ribossomo: proteínas', 'Complexo golgiense: secreção', 'Lisossomo: digestão']],
    ['Membrana', ['Mosaico fluido', 'Difusão e osmose (passivos)', 'Bomba de sódio e potássio (ativo)']]
  ], 'Comparação de células e transporte pela membrana (osmose em alimentos salgados).'),
  R('bio-metabolismo', 'bio', 'Fotossíntese e respiração', 3, 'Metabolismo', 'Os dois processos que movem a energia nos seres vivos.', [
    ['Fotossíntese', ['6CO₂ + 6H₂O + luz → C₆H₁₂O₆ + 6O₂', 'Fase clara: luz, água, libera O₂', 'Fase escura: ciclo de Calvin, fixa CO₂']],
    ['Respiração', ['Glicose + O₂ → CO₂ + H₂O + ATP', 'Glicólise, ciclo de Krebs, cadeia respiratória', 'Cerca de 30 a 38 ATP por glicose']],
    ['Fermentação', ['Sem O₂, apenas 2 ATP', 'Alcoólica (pão, cerveja)', 'Láctica (iogurte, músculo cansado)']]
  ], 'Ciclo do carbono, produção de alimentos, exercícios físicos.'),
  R('bio-dna', 'bio', 'DNA, RNA e biotecnologia', 3, 'Genética', 'A informação genética e como ela vira proteína.', [
    ['Ácidos nucleicos', ['DNA: dupla hélice, A–T e C–G', 'RNA: fita simples, U no lugar de T']],
    ['Processos', ['Replicação: DNA → DNA', 'Transcrição: DNA → RNA', 'Tradução: RNA → proteína (ribossomo)', 'Código genético: trincas (códons)']],
    ['Biotecnologia', ['Transgênicos', 'Clonagem', 'Teste de DNA (paternidade, perícia)', 'Vacinas de RNA mensageiro', 'CRISPR']]
  ], 'Temas atuais de biotecnologia e dilemas éticos.'),
  R('bio-mendel', 'bio', 'Genética mendeliana', 3, 'Mendel', 'Como as características passam de pais para filhos.', [
    ['Conceitos', ['Gene, alelo, genótipo, fenótipo', 'Homozigoto (AA, aa) e heterozigoto (Aa)']],
    ['1ª lei', ['Cada característica: um par de alelos que se separa nos gametas', 'Aa × Aa → 3:1']],
    ['2ª lei', ['Genes em cromossomos diferentes: segregação independente', 'AaBb × AaBb → 9:3:3:1']],
    ['Casos especiais', ['Sangue ABO (codominância), fator Rh', 'Herança ligada ao X (daltonismo, hemofilia)', 'Heredogramas']]
  ], 'Heredogramas, tipagem sanguínea e probabilidade.'),
  R('bio-evolucao', 'bio', 'Evolução', 3, 'Evolu', 'As espécies mudam ao longo do tempo por seleção natural e outros mecanismos.', [
    ['Teorias', ['Lamarck: uso e desuso, herança dos adquiridos (refutada)', 'Darwin: variação + seleção natural', 'Neodarwinismo: mutação e recombinação']],
    ['Evidências', ['Fósseis', 'Órgãos homólogos e análogos', 'Semelhança no DNA']],
    ['Especiação', ['Isolamento geográfico e reprodutivo', 'Resistência de bactérias a antibióticos e de insetos a inseticidas']]
  ], 'Resistência a antibióticos é exemplo clássico de seleção natural.'),
  R('bio-ecologia', 'bio', 'Ecologia', 3, 'Ecolog', 'Relações entre os seres vivos e o ambiente.', [
    ['Níveis', ['População, comunidade, ecossistema, biosfera', 'Habitat (endereço) × nicho (profissão)']],
    ['Energia', ['Produtores → consumidores → decompositores', 'Fluxo de energia unidirecional, só ~10% passa de nível', 'Magnificação trófica: poluentes acumulam no topo']],
    ['Relações', ['Mutualismo, comensalismo, parasitismo, predação, competição']],
    ['Ciclos', ['Carbono, nitrogênio (bactérias fixadoras), água']]
  ], 'Impactos ambientais, cadeias alimentares e controle biológico.'),
  R('bio-impactos', 'bio', 'Impactos ambientais', 3, 'Impacto', 'Ações humanas que alteram os ecossistemas.', [
    ['Ar', ['Efeito estufa intensificado (CO₂, CH₄)', 'Destruição da camada de ozônio (CFC)', 'Chuva ácida']],
    ['Água', ['Eutrofização: excesso de nutrientes, falta de O₂', 'Esgoto e metais pesados']],
    ['Solo e biodiversidade', ['Desmatamento e queimadas', 'Espécies invasoras', 'Unidades de conservação']]
  ], 'Eutrofização, aquecimento global e soluções sustentáveis caem todo ano.'),
  R('bio-fisiologia', 'bio', 'Corpo humano: sistemas', 3, 'Sistema', 'Como os sistemas mantêm o corpo funcionando em equilíbrio (homeostase).', [
    ['Digestório', ['Boca (amilase), estômago (pepsina), intestino delgado (absorção)', 'Fígado: bile emulsiona gorduras']],
    ['Circulatório e respiratório', ['Coração com 4 cavidades', 'Pequena circulação: pulmões; grande: corpo', 'Trocas gasosas nos alvéolos']],
    ['Excretor', ['Rins filtram o sangue (néfrons)', 'ADH controla a água']],
    ['Nervoso e endócrino', ['Neurônio, sinapse', 'Insulina e glucagon (glicose)', 'Hormônios sexuais e ciclo menstrual']]
  ], 'Doenças (diabetes, hipertensão) e efeitos de drogas e exercícios.'),
  R('bio-imunologia', 'bio', 'Vírus, bactérias e saúde', 3, 'Doen', 'Agentes de doenças, prevenção e defesa do corpo.', [
    ['Agentes', ['Vírus: acelulares, parasitas intracelulares (gripe, dengue, covid)', 'Bactérias: procariontes (tuberculose, cólera)', 'Protozoários (malária, Chagas, leishmaniose)', 'Vermes (esquistossomose, ascaridíase)']],
    ['Imunidade', ['Vacina: imunização ativa, cria memória', 'Soro: imunização passiva, anticorpos prontos']],
    ['Prevenção', ['Saneamento básico', 'Controle de vetores (Aedes aegypti)', 'Antibiótico não age em vírus']]
  ], 'Saúde pública e epidemias; vacina × soro é clássica.'),
  R('bio-botanica', 'bio', 'Botânica', 2, 'vegeta', 'Os grupos de plantas e como elas funcionam.', [
    ['Grupos', ['Briófitas: sem vasos', 'Pteridófitas: vasos, sem sementes', 'Gimnospermas: sementes nuas', 'Angiospermas: flores e frutos']],
    ['Tecidos', ['Xilema: água e sais (sobe)', 'Floema: seiva elaborada (açúcares)', 'Estômatos: trocas gasosas e transpiração']],
    ['Hormônios', ['Auxina: crescimento e tropismos', 'Etileno: amadurecimento dos frutos']]
  ], 'Adaptações das plantas a biomas e amadurecimento de frutas.'),
  R('bio-zoologia', 'bio', 'Zoologia', 1, 'animais', 'Os grandes grupos de animais e suas novidades evolutivas.', [
    ['Invertebrados', ['Poríferos e cnidários', 'Platelmintos e nematelmintos (verminoses)', 'Anelídeos, moluscos, artrópodes (exoesqueleto)', 'Equinodermos']],
    ['Vertebrados', ['Peixes, anfíbios (metamorfose)', 'Répteis (ovo com casca)', 'Aves e mamíferos (endotérmicos)']]
  ], 'Comparação de características e adaptações.'),

  // ============================ HISTÓRIA ============================
  R('his-colonia', 'his', 'Brasil Colônia', 3, 'Colôn', 'De 1500 a 1822: exploração, açúcar, ouro e escravidão.', [
    ['Administração', ['Capitanias hereditárias (1534)', 'Governo-geral (1548)', 'Câmaras municipais']],
    ['Economia', ['Pau-brasil', 'Açúcar no Nordeste: latifúndio, monocultura, trabalho escravo', 'Mineração no século XVIII: Minas Gerais, quinto']],
    ['Sociedade', ['Escravidão africana e indígena', 'Quilombos (Palmares)', 'Missões jesuíticas']],
    ['Revoltas', ['Nativistas: Beckman (MA, 1684), Emboabas, Mascates', 'Separatistas: Inconfidência Mineira (1789), Conjuração Baiana (1798)']]
  ], 'Escravidão e resistência, economia açucareira e mineradora.'),
  R('his-imperio', 'his', 'Brasil Império', 3, 'Império', 'De 1822 a 1889: independência, Regências, café e abolição.', [
    ['Primeiro Reinado', ['Independência (1822)', 'Constituição de 1824: Poder Moderador, voto censitário', 'Confederação do Equador']],
    ['Regências (1831–1840)', ['Cabanagem (PA), Balaiada (MA), Sabinada (BA), Farroupilha (RS)']],
    ['Segundo Reinado', ['Café no Sudeste', 'Guerra do Paraguai (1864–1870)', 'Leis abolicionistas: Eusébio de Queirós, Ventre Livre, Sexagenários, Áurea (1888)']]
  ], 'Revoltas regenciais e processo abolicionista. A Balaiada aconteceu no Maranhão.'),
  R('his-republica-velha', 'his', 'Primeira República', 2, 'República', 'De 1889 a 1930: oligarquias, café com leite e revoltas.', [
    ['Política', ['Política dos governadores', 'Café com leite (SP e MG)', 'Coronelismo e voto de cabresto']],
    ['Revoltas', ['Canudos (BA)', 'Contestado (PR/SC)', 'Revolta da Vacina (1904)', 'Revolta da Chibata (1910)', 'Tenentismo']],
    ['Fim', ['Crise de 1929', 'Revolução de 1930']]
  ], 'Movimentos sociais rurais e urbanos e o coronelismo.'),
  R('his-vargas', 'his', 'Era Vargas', 3, 'Vargas', 'De 1930 a 1945: centralização, trabalhismo e Estado Novo.', [
    ['Fases', ['Governo Provisório (1930–34)', 'Constitucional (1934–37): voto feminino', 'Estado Novo (1937–45): ditadura, DIP, censura']],
    ['Trabalho', ['CLT (1943)', 'Salário mínimo', 'Sindicatos ligados ao Estado']],
    ['Economia', ['Industrialização de base: CSN, Vale', 'Volta em 1951: Petrobras ("O petróleo é nosso")']]
  ], 'Direitos trabalhistas, populismo e nacionalismo econômico.'),
  R('his-ditadura', 'his', 'Ditadura militar e redemocratização', 3, 'Ditadura', 'De 1964 a 1985: autoritarismo, milagre econômico e abertura.', [
    ['Repressão', ['Golpe de 1964', 'Atos Institucionais; AI-5 (1968)', 'Censura, tortura, exílio']],
    ['Economia', ['Milagre econômico (1968–73)', 'Dívida externa e inflação']],
    ['Abertura', ['Lei da Anistia (1979)', 'Diretas Já (1984)', 'Constituição de 1988 ("Cidadã")']]
  ], 'Uso de músicas, charges e documentos da época. Direitos da Constituição de 1988.'),
  R('his-antiguidade', 'his', 'Antiguidade clássica', 2, 'Antigu', 'Grécia e Roma deixaram bases da política e do direito ocidentais.', [
    ['Grécia', ['Pólis: Atenas (democracia direta, só cidadãos) e Esparta (militar)', 'Filosofia, teatro, olimpíadas']],
    ['Roma', ['Monarquia, República (senado), Império', 'Direito romano', 'Pão e circo']],
    ['Oriente', ['Egito: rio Nilo, teocracia', 'Mesopotâmia: Código de Hamurábi']]
  ], 'Comparar a democracia ateniense com a atual (quem era cidadão).'),
  R('his-medieval', 'his', 'Idade Média e feudalismo', 2, 'Feudal', 'Do fim de Roma (476) à tomada de Constantinopla (1453).', [
    ['Feudalismo', ['Suseranos e vassalos', 'Servos presos à terra', 'Economia agrária e autossuficiente']],
    ['Igreja', ['Poder espiritual e político', 'Cruzadas']],
    ['Baixa Idade Média', ['Renascimento comercial e urbano', 'Burguesia', 'Peste negra']]
  ], 'Relações de poder e o papel da Igreja.'),
  R('his-moderna', 'his', 'Idade Moderna', 3, 'Moderna', 'Renascimento, Reformas, absolutismo e Grandes Navegações.', [
    ['Cultura', ['Renascimento: humanismo, antropocentrismo', 'Reforma protestante (Lutero, Calvino) e Contrarreforma']],
    ['Política e economia', ['Absolutismo (Luís XIV)', 'Mercantilismo: metalismo, balança favorável, colônias']],
    ['Navegações', ['Portugal pioneiro', 'Chegada à América (1492) e ao Brasil (1500)']]
  ], 'Ligação entre navegações, mercantilismo e colonização.'),
  R('his-revolucoes', 'his', 'Iluminismo e revoluções', 3, 'Revolu', 'As ideias e revoluções que criaram o mundo contemporâneo.', [
    ['Iluminismo', ['Razão contra o absolutismo', 'Locke (direitos naturais), Montesquieu (três poderes), Rousseau (contrato social)']],
    ['Revoluções', ['Industrial (Inglaterra, séc. XVIII): fábrica, máquina a vapor', 'Independência dos EUA (1776)', 'Francesa (1789): liberdade, igualdade, fraternidade']],
    ['Consequências', ['Era Napoleônica', 'Independências na América Latina', 'Movimento operário']]
  ], 'Direitos humanos, trabalho nas fábricas e separação dos poderes.'),
  R('his-guerras', 'his', 'Guerras mundiais e Guerra Fria', 3, 'Guerra', 'O século XX dos conflitos globais e da bipolaridade.', [
    ['1ª Guerra (1914–18)', ['Imperialismo e nacionalismo', 'Guerra de trincheiras', 'Tratado de Versalhes']],
    ['Entre guerras', ['Revolução Russa (1917)', 'Crise de 1929', 'Nazifascismo']],
    ['2ª Guerra (1939–45)', ['Holocausto', 'Bombas atômicas', 'Criação da ONU']],
    ['Guerra Fria', ['EUA (capitalismo) × URSS (socialismo)', 'Corrida armamentista e espacial', 'Muro de Berlim (1961–1989)']]
  ], 'Totalitarismos, propaganda e direitos humanos.'),
  R('his-maranhao', 'his', 'História do Maranhão', 2, 'Maranhão', 'Fatos que caem nos vestibulares e concursos do estado.', [
    ['Fundação', ['São Luís fundada pelos franceses em 1612 (França Equinocial)', 'Expulsão dos franceses em 1615']],
    ['Colônia e Império', ['Revolta de Beckman (1684) contra a Companhia de Comércio', 'Adesão tardia à independência (1823)', 'Balaiada (1838–1841)']],
    ['Cultura', ['"Atenas Brasileira": Gonçalves Dias, Aluísio Azevedo', 'Bumba meu boi: patrimônio da UNESCO', 'Centro Histórico de São Luís: patrimônio mundial (1997)']]
  ], 'Fatos e datas do estado para PAES/UEMA, UEMASUL e concursos estaduais.'),

  // ============================ GEOGRAFIA ============================
  R('geo-cartografia', 'geo', 'Cartografia', 2, 'Cartograf', 'Representar a Terra em mapas e se localizar.', [
    ['Coordenadas', ['Latitude: 0° a 90° N/S (Equador)', 'Longitude: 0° a 180° L/O (Greenwich)']],
    ['Escala', ['1:50.000 → 1 cm = 500 m', 'Escala grande: mais detalhe, área menor']],
    ['Projeções', ['Mercator: conforme, deforma áreas', 'Peters: equivalente, preserva áreas']],
    ['Fusos', ['15° = 1 hora', 'Leste está adiantado']]
  ], 'Cálculo de escala e fuso horário.'),
  R('geo-relevo', 'geo', 'Geologia e relevo', 2, 'Relevo', 'A estrutura da Terra e as formas da superfície.', [
    ['Placas tectônicas', ['Convergentes: montanhas, terremotos', 'Divergentes: dorsais', 'Brasil no meio da placa: poucos terremotos fortes']],
    ['Rochas', ['Magmáticas (granito, basalto)', 'Sedimentares (arenito; guardam fósseis e petróleo)', 'Metamórficas (mármore)']],
    ['Agentes', ['Internos: tectonismo, vulcanismo', 'Externos: intemperismo, erosão (água, vento)']],
    ['Brasil', ['Planaltos, planícies e depressões (Ross)']]
  ], 'Erosão e ocupação humana, desastres naturais.'),
  R('geo-clima', 'geo', 'Clima', 3, 'Clima', 'Tempo é o momento; clima é o padrão ao longo dos anos.', [
    ['Fatores', ['Latitude, altitude, maritimidade, massas de ar, correntes marinhas, relevo']],
    ['Brasil', ['Equatorial (Amazônia)', 'Tropical', 'Semiárido (sertão)', 'Subtropical (Sul)']],
    ['Fenômenos', ['El Niño: seca no Nordeste e chuva no Sul', 'Ilha de calor, inversão térmica', 'Chuva ácida']],
    ['Mudanças climáticas', ['Efeito estufa intensificado', 'Acordo de Paris']]
  ], 'Fenômenos urbanos e aquecimento global estão entre os temas mais frequentes.'),
  R('geo-biomas', 'geo', 'Biomas brasileiros', 3, 'Bioma', 'As grandes paisagens naturais do Brasil e suas ameaças.', [
    ['Amazônia', ['Floresta densa, rios', 'Desmatamento e garimpo']],
    ['Cerrado', ['"Caixa d’água do Brasil"', 'Árvores tortas, raízes profundas', 'Expansão da soja (MATOPIBA)']],
    ['Caatinga', ['Semiárido, plantas xerófilas', 'Exclusivo do Brasil']],
    ['Outros', ['Mata Atlântica: a mais devastada', 'Pantanal: planície alagável', 'Pampa: campos do Sul']]
  ], 'Relação entre bioma, clima e atividade econômica. O Maranhão tem Amazônia, Cerrado e áreas de transição.'),
  R('geo-hidrografia', 'geo', 'Hidrografia', 2, 'Hidrograf', 'Rios, bacias e o uso da água.', [
    ['Bacias', ['Amazônica: maior do mundo', 'Paraná: mais hidrelétricas', 'São Francisco: "rio da integração nacional"', 'Tocantins-Araguaia']],
    ['Aquíferos', ['Guarani e Alter do Chão']],
    ['Problemas', ['Assoreamento', 'Crise hídrica', 'Transposição do São Francisco']]
  ], 'Uso múltiplo da água e conflitos.'),
  R('geo-populacao', 'geo', 'População e migração', 2, 'Demograf', 'Como a população cresce, envelhece e se desloca.', [
    ['Conceitos', ['Populoso × povoado', 'Crescimento vegetativo = natalidade − mortalidade']],
    ['Transição demográfica', ['Queda da mortalidade, depois da natalidade', 'Envelhecimento da população', 'Pirâmide com base estreita']],
    ['Migrações', ['Êxodo rural', 'Nordestinos para o Sudeste no século XX', 'Refugiados']]
  ], 'Leitura de pirâmides etárias e efeitos do envelhecimento (previdência).'),
  R('geo-urbanizacao', 'geo', 'Urbanização', 3, 'Urban', 'O crescimento das cidades e seus problemas.', [
    ['Conceitos', ['Metrópole, megalópole, conurbação, região metropolitana']],
    ['Brasil', ['Urbanização rápida após 1950', 'Macrocefalia urbana']],
    ['Problemas', ['Favelização e segregação', 'Mobilidade', 'Enchentes por impermeabilização', 'Ilha de calor']]
  ], 'Segregação socioespacial e direito à cidade.'),
  R('geo-agrario', 'geo', 'Espaço agrário', 2, 'agr', 'Produção no campo, concentração de terras e conflitos.', [
    ['Estrutura', ['Latifúndio e minifúndio', 'Concentração fundiária', 'Reforma agrária e MST']],
    ['Modernização', ['Revolução Verde: máquinas, agrotóxicos, sementes', 'Agronegócio e exportação de commodities']],
    ['Agricultura familiar', ['Produz grande parte dos alimentos do mercado interno']]
  ], 'Conflitos no campo e fronteira agrícola (Matopiba, Amazônia).'),
  R('geo-industria', 'geo', 'Indústria e energia', 2, 'Indústria', 'Como o mundo produz e com que energia.', [
    ['Revoluções industriais', ['1ª: carvão e vapor', '2ª: eletricidade e petróleo', '3ª: informática', '4ª: automação e dados']],
    ['Modelos', ['Fordismo: produção em massa', 'Toyotismo: just in time, flexível']],
    ['Energia', ['Matriz elétrica brasileira: predominância hidrelétrica', 'Renováveis: solar, eólica (Nordeste)', 'Não renováveis: petróleo, carvão']]
  ], 'Matriz energética brasileira e impactos de cada fonte.'),
  R('geo-globalizacao', 'geo', 'Globalização e geopolítica', 3, 'Globaliza', 'A integração mundial da economia, da cultura e da informação.', [
    ['Características', ['Fluxos de capitais, mercadorias e informações', 'Multinacionais', 'Meio técnico-científico-informacional (Milton Santos)']],
    ['Blocos', ['Mercosul, União Europeia, Nafta/USMCA, BRICS']],
    ['Conflitos', ['Israel × Palestina', 'Rússia × Ucrânia', 'Refugiados e xenofobia']]
  ], 'Desigualdades da globalização e conflitos atuais.'),
  R('geo-ambiental', 'geo', 'Questões ambientais', 3, 'ambiental', 'Desenvolvimento sustentável e os acordos internacionais.', [
    ['Conferências', ['Estocolmo (1972)', 'Rio-92 (Agenda 21)', 'Protocolo de Kyoto', 'Acordo de Paris (2015)']],
    ['Problemas', ['Desmatamento', 'Desertificação', 'Poluição e lixo']],
    ['Soluções', ['Desenvolvimento sustentável', 'Unidades de conservação', 'Economia circular e reciclagem']]
  ], 'Propostas de solução e impactos (casa com a redação do ENEM).'),

  // ============================ PORTUGUÊS ============================
  R('por-interpretacao', 'por', 'Interpretação de texto', 3, 'Interpreta', 'Entender o que o texto diz e o que ele deixa implícito.', [
    ['Leitura', ['Tema e ideia central', 'Informação explícita × inferência', 'Pressupostos e subentendidos']],
    ['Intenção', ['Quem fala, para quem, com que objetivo', 'Ironia e humor (charges, tirinhas)']],
    ['Estratégia', ['Leia o enunciado primeiro', 'Volte ao texto para confirmar', 'Desconfie de alternativas absolutas']]
  ], 'Base de toda a prova de Linguagens. Charges, tirinhas e propagandas aparecem todo ano.'),
  R('por-generos', 'por', 'Gêneros e tipologias textuais', 3, 'Gênero', 'Tipos são estruturas; gêneros são os textos do dia a dia.', [
    ['Tipologias', ['Narração (fatos no tempo)', 'Descrição (características)', 'Dissertação (opinião e argumentos)', 'Injunção (instruções)', 'Exposição (informar)']],
    ['Gêneros', ['Notícia, reportagem, artigo de opinião, crônica, charge, receita, anúncio, carta, e-mail']],
    ['Função', ['Identifique a finalidade e o suporte']]
  ], 'Reconhecer gênero pela função social e pelo suporte.'),
  R('por-funcoes', 'por', 'Funções da linguagem', 3, 'Funç', 'Cada texto destaca um elemento da comunicação.', [
    ['Funções', ['Referencial: informar (notícia)', 'Emotiva: emissor (diário, poesia lírica)', 'Conativa: convencer o leitor (propaganda)', 'Fática: testar o canal ("alô?")', 'Metalinguística: a língua falando da língua (dicionário)', 'Poética: forma da mensagem (poema, slogan)']]
  ], 'Identificar a função predominante; propaganda costuma ser conativa.'),
  R('por-figuras', 'por', 'Figuras de linguagem', 3, 'Figuras', 'Recursos que dão expressividade ao texto.', [
    ['Semânticas', ['Metáfora (comparação implícita)', 'Comparação (com "como")', 'Metonímia (parte pelo todo, autor pela obra)', 'Hipérbole (exagero)', 'Eufemismo (suavizar)', 'Ironia', 'Antítese e paradoxo', 'Personificação']],
    ['Sonoras', ['Aliteração (consoantes)', 'Assonância (vogais)', 'Onomatopeia']]
  ], 'Poemas, letras de música e propagandas.'),
  R('por-variacao', 'por', 'Variação linguística', 3, 'Variação', 'A língua muda conforme a região, o grupo, a situação e a época.', [
    ['Tipos', ['Regional (diatópica)', 'Social (diastrática)', 'Situacional: formal × informal (diafásica)', 'Histórica (diacrônica)']],
    ['Conceitos', ['Norma-padrão × norma culta', 'Adequação, não "certo e errado"', 'Preconceito linguístico']]
  ], 'Um dos temas mais cobrados no ENEM: respeito às variedades e adequação ao contexto.'),
  R('por-coesao', 'por', 'Coesão e coerência', 2, 'Coes', 'Como as partes do texto se ligam e fazem sentido.', [
    ['Coesão referencial', ['Pronomes e sinônimos retomam termos', 'Evitar repetições']],
    ['Conectivos', ['Adição: e, além disso', 'Oposição: mas, porém, contudo', 'Causa: porque, já que', 'Conclusão: portanto, logo', 'Concessão: embora']],
    ['Coerência', ['Lógica e não contradição']]
  ], 'Valor semântico de conectivos e a quem um pronome se refere.'),
  R('por-sintaxe', 'por', 'Sintaxe do período', 1, 'Oraç', 'Como as orações se combinam.', [
    ['Coordenadas', ['Aditivas, adversativas, alternativas, conclusivas, explicativas']],
    ['Subordinadas', ['Substantivas', 'Adjetivas (restritivas e explicativas, vírgula muda o sentido)', 'Adverbiais: causa, condição, concessão, finalidade, tempo, consequência']],
    ['Concordância e regência', ['Verbo concorda com o sujeito', 'Assistir (ver) a; aspirar (desejar) a; obedecer a']]
  ], 'Mais forte em vestibulares tradicionais e concursos.'),
  R('por-redacao', 'por', 'Redação do ENEM', 3, 'Redação', 'Texto dissertativo-argumentativo com proposta de intervenção.', [
    ['Estrutura', ['Introdução: tema + tese', 'Dois parágrafos de desenvolvimento com repertório', 'Conclusão: proposta de intervenção']],
    ['Competências', ['1: norma-padrão', '2: tema e tipo textual', '3: argumentação', '4: coesão', '5: proposta (agente, ação, meio, finalidade, detalhamento)']],
    ['Cuidados', ['Respeitar os direitos humanos', 'Nada de fuga ao tema', 'Repertório legitimado e pertinente']]
  ], 'Vale 1.000 pontos. A proposta completa tem cinco elementos.'),

  // ============================ LITERATURA ============================
  R('lit-quinhentismo-barroco', 'lit', 'Quinhentismo, Barroco e Arcadismo', 2, 'Barroco', 'A literatura do Brasil colonial.', [
    ['Quinhentismo', ['Carta de Caminha', 'Literatura jesuítica (Anchieta)']],
    ['Barroco', ['Conflito fé × prazer', 'Gregório de Matos (sátira, "Boca do Inferno")', 'Padre Antônio Vieira (sermões)']],
    ['Arcadismo', ['Bucolismo, vida simples, carpe diem', 'Tomás Antônio Gonzaga (Marília de Dirceu)']]
  ], 'Antíteses barrocas e idealização árcade.'),
  R('lit-romantismo', 'lit', 'Romantismo', 3, 'Romantismo', 'Subjetividade, nacionalismo e idealização.', [
    ['Poesia', ['1ª geração: indianismo (Gonçalves Dias, maranhense: "Canção do exílio")', '2ª: mal do século (Álvares de Azevedo)', '3ª: condoreira, social (Castro Alves, "Navio negreiro")']],
    ['Prosa', ['José de Alencar: indianista (Iracema), urbano, regionalista', 'Joaquim Manuel de Macedo']]
  ], 'Indianismo e nacionalismo; Castro Alves e a abolição.'),
  R('lit-realismo', 'lit', 'Realismo e Naturalismo', 3, 'Realismo', 'Objetividade, crítica social e análise psicológica.', [
    ['Realismo', ['Machado de Assis: Memórias póstumas de Brás Cubas (1881), Dom Casmurro', 'Ironia, narrador não confiável']],
    ['Naturalismo', ['Determinismo (meio, raça, momento)', 'Aluísio Azevedo (maranhense): O mulato, O cortiço']],
    ['Parnasianismo', ['Arte pela arte, forma perfeita', 'Olavo Bilac']]
  ], 'Machado de Assis é o autor mais cobrado.'),
  R('lit-modernismo', 'lit', 'Modernismo', 3, 'Modernismo', 'Ruptura com a tradição e busca de uma identidade brasileira.', [
    ['1ª fase (1922)', ['Semana de Arte Moderna', 'Oswald de Andrade (Manifesto Antropófago)', 'Mário de Andrade (Macunaíma)', 'Verso livre, linguagem coloquial']],
    ['2ª fase (1930)', ['Romance regionalista: Graciliano Ramos (Vidas secas), Rachel de Queiroz', 'Poesia: Drummond, Cecília Meireles, Vinicius']],
    ['3ª fase (1945)', ['Guimarães Rosa (Grande sertão: veredas)', 'Clarice Lispector (introspecção)', 'João Cabral (Morte e vida severina)']]
  ], 'Antropofagia, regionalismo de 30 e Drummond caem muito.'),
  R('lit-contemporanea', 'lit', 'Literatura contemporânea', 1, 'contempor', 'Vozes diversas da literatura brasileira recente.', [
    ['Temas', ['Violência urbana, identidade, memória', 'Literatura periférica e marginal']],
    ['Autores', ['Carolina Maria de Jesus (Quarto de despejo)', 'Conceição Evaristo (escrevivência)', 'Ferreira Gullar (maranhense, Poema sujo)']]
  ], 'Literatura e questões sociais; autoria negra e periférica.'),

  // ============================ FILOSOFIA ============================
  R('fil-antiga', 'fil', 'Filosofia antiga', 3, 'Filosofia', 'Do mito ao logos: a busca racional por explicações.', [
    ['Pré-socráticos', ['Arché (princípio de tudo)', 'Tales (água), Heráclito (devir), Parmênides (ser imutável)']],
    ['Sócrates', ['"Só sei que nada sei"', 'Maiêutica e ironia']],
    ['Platão', ['Mundo das ideias × mundo sensível', 'Mito da caverna']],
    ['Aristóteles', ['Lógica, ética da virtude (justo meio)', '"O homem é um animal político"']]
  ], 'Mito da caverna e passagem do mito à razão.'),
  R('fil-medieval', 'fil', 'Filosofia medieval', 1, 'medieval', 'Fé e razão em diálogo.', [
    ['Patrística', ['Santo Agostinho: platonismo cristão, livre-arbítrio']],
    ['Escolástica', ['São Tomás de Aquino: aristotelismo cristão, cinco vias']]
  ], 'Relação entre fé e razão.'),
  R('fil-moderna', 'fil', 'Filosofia moderna', 3, 'Epistemolog', 'O problema do conhecimento: razão ou experiência?', [
    ['Racionalismo', ['Descartes: dúvida metódica, "Penso, logo existo"']],
    ['Empirismo', ['Locke: tábula rasa', 'Hume: hábito e causalidade']],
    ['Kant', ['Síntese: conhecimento começa na experiência, mas a razão organiza', 'Imperativo categórico (ética do dever)']]
  ], 'Comparação racionalismo × empirismo.'),
  R('fil-politica', 'fil', 'Filosofia política', 3, 'polít', 'De onde vem o poder e o que o torna legítimo.', [
    ['Maquiavel', ['Política separada da moral', 'Virtù e fortuna']],
    ['Contratualistas', ['Hobbes: estado de natureza = guerra; Leviatã', 'Locke: direitos naturais (vida, liberdade, propriedade)', 'Rousseau: vontade geral; o homem nasce bom']],
    ['Montesquieu', ['Separação dos três poderes']]
  ], 'Contratualistas são muito cobrados; compare as visões de estado de natureza.'),
  R('fil-contemporanea', 'fil', 'Filosofia contemporânea', 2, 'Existencial', 'Críticas à razão, à sociedade e ao modo de viver.', [
    ['Nietzsche', ['Morte de Deus, niilismo', 'Crítica à moral de rebanho']],
    ['Existencialismo', ['Sartre: "a existência precede a essência"', 'Liberdade e responsabilidade']],
    ['Escola de Frankfurt', ['Indústria cultural (Adorno e Horkheimer)', 'Razão instrumental']],
    ['Outros', ['Hannah Arendt: banalidade do mal', 'Foucault: poder disciplinar, vigilância']]
  ], 'Indústria cultural e Arendt aparecem bastante no ENEM.'),
  R('fil-etica', 'fil', 'Ética', 2, 'Ética', 'Como devemos agir e por quê.', [
    ['Correntes', ['Virtude (Aristóteles)', 'Dever (Kant)', 'Utilitarismo (Bentham e Mill): maior felicidade para o maior número']],
    ['Conceitos', ['Moral (costumes) × ética (reflexão)', 'Autonomia × heteronomia']]
  ], 'Dilemas éticos atuais (tecnologia, bioética).'),

  // ============================ SOCIOLOGIA ============================
  R('soc-classicos', 'soc', 'Clássicos da Sociologia', 3, 'Sociologia', 'Durkheim, Marx e Weber: três formas de explicar a sociedade.', [
    ['Durkheim', ['Fato social: exterior, coercitivo, geral', 'Solidariedade mecânica × orgânica', 'Anomia']],
    ['Marx', ['Luta de classes', 'Mais-valia e alienação', 'Materialismo histórico']],
    ['Weber', ['Ação social (com sentido)', 'Tipos de dominação: tradicional, carismática, racional-legal', 'Ética protestante e capitalismo']]
  ], 'Identificar o autor pela ideia central.'),
  R('soc-cultura', 'soc', 'Cultura e identidade', 2, 'Cultura', 'Cultura é tudo o que é aprendido e compartilhado.', [
    ['Conceitos', ['Etnocentrismo: julgar pela própria cultura', 'Relativismo cultural', 'Aculturação e hibridismo']],
    ['Indústria cultural', ['Cultura de massa, padronização', 'Consumo e mídia']],
    ['Brasil', ['Gilberto Freyre (Casa-grande & senzala)', 'Sérgio Buarque (homem cordial)', 'Mito da democracia racial']]
  ], 'Etnocentrismo e diversidade cultural.'),
  R('soc-trabalho', 'soc', 'Trabalho e sociedade', 2, 'Trabalho', 'Como o trabalho se organiza e se transforma.', [
    ['Modelos', ['Taylorismo: tempos e movimentos', 'Fordismo: linha de montagem', 'Toyotismo: flexível, polivalente']],
    ['Hoje', ['Precarização, uberização', 'Desemprego estrutural', 'Informalidade']]
  ], 'Mudanças no mundo do trabalho e aplicativos.'),
  R('soc-cidadania', 'soc', 'Cidadania e movimentos sociais', 3, 'Cidadania', 'Direitos conquistados ao longo da história.', [
    ['Direitos (Marshall)', ['Civis (liberdade)', 'Políticos (votar e ser votado)', 'Sociais (saúde, educação)']],
    ['Movimentos', ['Operário', 'Feminista', 'Negro', 'LGBTQIA+', 'Ambientalista', 'Indígena']],
    ['Brasil', ['Constituição de 1988', 'Estatutos: ECA, Idoso, Igualdade Racial']]
  ], 'Movimentos sociais e direitos humanos.'),
  R('soc-desigualdade', 'soc', 'Desigualdade e estratificação', 2, 'Desigual', 'Como as sociedades distribuem riqueza, poder e prestígio.', [
    ['Estratificação', ['Castas, estamentos, classes', 'Mobilidade social']],
    ['Brasil', ['Concentração de renda', 'Racismo estrutural', 'Políticas afirmativas (cotas)']]
  ], 'Racismo estrutural e políticas públicas.'),
  R('soc-estado', 'soc', 'Estado, poder e democracia', 2, 'Estado', 'As formas de organizar o poder político.', [
    ['Formas de Estado', ['Absolutista, liberal, de bem-estar social, neoliberal']],
    ['Democracia', ['Direta e representativa', 'Três poderes: Executivo, Legislativo, Judiciário']],
    ['Brasil', ['República federativa presidencialista', 'Voto obrigatório dos 18 aos 70 anos']]
  ], 'Participação política e funcionamento dos poderes.')
];

export const resumo = id => RESUMOS.find(r => r.id === id);
