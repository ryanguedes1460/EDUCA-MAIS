# Sistema dos alunos

## Sem conta (modo local)
Tudo fica só no aparelho: questões do conteúdo inicial, flashcards, plano, foco, anotações, desempenho e aparência. Nada vai para a nuvem. Ao criar uma conta, o app pergunta se quer levar esses dados.

## Com conta
- **Questões** do banco geral com filtros (área, disciplina, conteúdo, nível, dificuldade, banca, ano, tipo, situação), busca sem acento, prática e **simulados** retomáveis. Correção na hora no aparelho e recalculada no servidor. Erros viram flashcards.
- **Flashcards** com revisão espaçada, **plano de estudos**, **metas**, **foco** (Pomodoro), **anotações**, **desempenho**, **aparência** salva na conta.
- **Materiais** protegidos (links de 60 segundos, cada acesso registrado).
- **Minha conta**: perfil, senha, sessões em outros aparelhos, baixar todos os dados, apagar histórico ou excluir a conta.

## Minhas turmas (novo na 1.1)
1. O professor passa o código da turma (8 caracteres).
2. Em **Minhas turmas**, o aluno digita o código e entra.
3. As **listas e simulados** enviados aparecem ali, com prazo, número de questões e situação (em andamento, feita com a nota, prazo encerrado).
4. **Começar / Continuar / Fazer de novo**: abre as questões da lista. Em lista de exercícios há dica do tutor; em simulado, não. Simulado com tempo termina sozinho quando o tempo acaba (questões sem resposta contam como erradas).
5. **Compartilhar resultados**: em cada turma há a opção "Deixar o professor ver meus resultados". Vem ligada ao entrar; pode ser desligada a qualquer momento e o professor deixa de ver na hora. O professor nunca vê anotações, flashcards ou o restante do estudo.
6. **Sair da turma**: as listas dela deixam de aparecer; as respostas continuam no histórico do aluno.

### Sem internet
Quando Minhas turmas é aberta com internet, as questões das listas recebidas são guardadas no aparelho. Depois disso a lista pode ser feita sem internet, e as respostas sobem na próxima sincronização (testado no navegador). Entrar numa turma, mudar o compartilhamento e sair exigem internet.

As questões privadas dos professores **não** aparecem na tela Questões (banco geral): só dentro da lista.

## Privacidade
- Cada aluno só vê os próprios dados (Row Level Security em todas as tabelas).
- O professor vê só: nome, data de entrada na turma, se compartilha, e (se compartilhar) acertos e datas das listas daquela turma.
- Pendente (LGPD): pergunta de idade e consentimento do responsável para menores de 13 anos, e aviso de privacidade completo. Ver [DOCUMENTACAO_GERAL.md](DOCUMENTACAO_GERAL.md#pendências).
