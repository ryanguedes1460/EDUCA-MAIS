# Sistema administrativo (painel do Ryan)

Só aparece para contas com permissão (o Ryan, depois do passo 5 de [CONFIGURACAO.md](CONFIGURACAO.md)). Todas as permissões são conferidas **no servidor**: esconder o botão é só conforto, quem tenta acessar sem permissão recebe "acesso negado" do banco de dados.

## Abas
| Aba | O que faz | Permissão |
|---|---|---|
| Visão geral | Usuários, ativos em 7 dias, questões respondidas, acerto geral, flashcards, eventos de segurança | `stats.view` |
| Usuários | Buscar (e filtrar por papel: estudantes, professores, administradores), ver atividade, **bloquear/desbloquear** (bloquear derruba as sessões na hora), mudar papel | `users.view`, `users.manage` (bloquear), `roles.manage` (papel) |
| Questões | Criar, editar, arquivar e publicar questões com alternativas, imagem, explicação, dica, fonte, banca, ano; estatística de acerto por questão. Filtros por **banco** (plataforma ou de cada professor), situação, onde está (privada, aguardando, banco geral) e palavra-chave. Ver versões de cada questão (quem alterou e quando). Aprovar ou recusar questões enviadas ao banco geral. **Procurar duplicadas** (textos parecidos). | `content.manage` |
| Professores | Pedidos para ser professor (aprovar/recusar), lista de professores, **ver o banco de cada um**, tirar o acesso de professor, números gerais (turmas, listas, questões dos professores, pedidos abertos) | `users.manage` |
| Pedidos de correção | Pedidos dos professores sobre questões do banco geral; responder como resolvido ou recusado | `content.manage` |
| Matérias e categorias | Áreas, disciplinas, assuntos (com subassuntos) e bancas | `content.manage` |
| Materiais | Enviar PDFs e outros arquivos protegidos (só para alunos com conta, ou só equipe) | `content.manage` |
| Comentários | Ocultar ou apagar comentários das questões | `content.manage` |
| Configurações | Aviso geral no topo do app, cadastro aberto/fechado, número de questões por simulado, comentários ligados/desligados | `settings.manage` |
| Permissões | Papéis (administrador, estudante, professor) e o que cada um pode fazer | `roles.manage` |
| Alunos | Contas aguardando liberação (com e-mail e se pediu para ser aluno ou professor): liberar escolhendo o papel e o que a conta recebe, ou recusar | `users.manage` |
| Atividade e aparelhos | Todas as contas com último acesso e número de aparelhos; linha do tempo de ações com filtro; detalhe de cada conta (aparelhos, logins, ações dos últimos 30 dias) | `users.view` |
| Mensagens e erros | Dúvidas para o professor e relatos de erro ou sugestões para o desenvolvedor, com a tela e o aparelho | `users.view` |
| Auditoria | Quem fez o quê e quando (bloqueios, mudanças de papel, edição de questões e configurações) | `audit.view` |

## Papéis
- **Administrador**: tudo (`*`).
- **Estudante**: só os próprios dados.
- **Professor**: só `teacher.area` (banco próprio, listas e turmas). **Não** acessa o painel nem o conteúdo dos outros. Até a 1.0 este papel tinha `content.manage`; a migração 7 retirou isso.

Permissões existentes: `admin.access`, `users.view`, `users.manage`, `roles.manage`, `content.manage`, `stats.view`, `audit.view`, `settings.manage`, `teacher.area`.

## Acesso do Ryan aos bancos dos professores
- O Ryan vê e edita **todas** as questões de todos os professores pelo próprio login (permissão `content.manage`). Não precisa e não deve pedir a senha de ninguém.
- Para abrir o banco de um professor: Professores > **Ver banco**, ou o filtro "Banco de ..." na aba Questões.
- Ao editar a questão de um professor, o editor avisa de quem é o banco. A alteração fica registrada numa versão com o nome do Ryan, e o professor vê essa versão.
- O banco permite à equipe consultar turmas e listas de qualquer professor (`content.manage`), mas o painel ainda não tem uma tela própria para isso: hoje o painel mostra os números gerais na aba Professores.
- Detalhes do que o professor pode fazer: [SISTEMA_PROFESSORES.md](SISTEMA_PROFESSORES.md).

Novos papéis podem ser criados na aba Permissões. O papel de administrador e o de estudante são fixos e não podem ser apagados. Ninguém consegue bloquear a si mesmo nem mudar o próprio papel, e o único administrador não consegue excluir a própria conta.

## Boas práticas
- Use uma senha longa e única para a conta do Ryan, e não a compartilhe.
- Em **Conta > Sessões**, encerre aparelhos que não reconhecer.
- Confira a aba **Auditoria** e o contador de **eventos de segurança** de vez em quando. Um evento "material.bulk_access" indica alguém abrindo muitos materiais em pouco tempo.
- Questões em **rascunho** não aparecem para alunos. Publique só quando estiver revisada.
