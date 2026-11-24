# Painel do administrador

Só aparece para contas com permissão (o Ryan, depois do passo 5 de [CONFIGURACAO.md](CONFIGURACAO.md)). Todas as permissões são conferidas **no servidor**: esconder o botão é só conforto, quem tenta acessar sem permissão recebe "acesso negado" do banco de dados.

## Abas
| Aba | O que faz | Permissão |
|---|---|---|
| Visão geral | Usuários, ativos em 7 dias, questões respondidas, acerto geral, flashcards, eventos de segurança | `stats.view` |
| Usuários | Buscar, ver atividade, **bloquear/desbloquear** (bloquear derruba as sessões na hora), mudar papel | `users.view`, `users.manage` (bloquear), `roles.manage` (papel) |
| Questões | Criar, editar, arquivar e publicar questões com alternativas, imagem, explicação, dica, fonte, banca, ano; estatística de acerto por questão | `content.manage` |
| Matérias e categorias | Áreas, disciplinas, assuntos (com subassuntos) e bancas | `content.manage` |
| Materiais | Enviar PDFs e outros arquivos protegidos (só para alunos com conta, ou só equipe) | `content.manage` |
| Comentários | Ocultar ou apagar comentários das questões | `content.manage` |
| Configurações | Aviso geral no topo do app, cadastro aberto/fechado, número de questões por simulado, comentários ligados/desligados | `settings.manage` |
| Permissões | Papéis (administrador, estudante, professor) e o que cada um pode fazer | `roles.manage` |
| Auditoria | Quem fez o quê e quando (bloqueios, mudanças de papel, edição de questões e configurações) | `audit.view` |

## Papéis
- **Administrador**: tudo (`*`).
- **Estudante**: só os próprios dados.
- **Professor** (pronto para o futuro): acessar o painel (`admin.access`), gerenciar conteúdo e ver estatísticas, sem mexer em usuários.

Permissões existentes: `admin.access`, `users.view`, `users.manage`, `roles.manage`, `content.manage`, `stats.view`, `audit.view`, `settings.manage`.

Novos papéis podem ser criados na aba Permissões. O papel de administrador e o de estudante são fixos e não podem ser apagados. Ninguém consegue bloquear a si mesmo nem mudar o próprio papel, e o único administrador não consegue excluir a própria conta.

## Boas práticas
- Use uma senha longa e única para a conta do Ryan, e não a compartilhe.
- Em **Conta > Sessões**, encerre aparelhos que não reconhecer.
- Confira a aba **Auditoria** e o contador de **eventos de segurança** de vez em quando. Um evento "material.bulk_access" indica alguém abrindo muitos materiais em pouco tempo.
- Questões em **rascunho** não aparecem para alunos. Publique só quando estiver revisada.
