# Sistema dos professores

Versão 1.1 (em desenvolvimento na branch `claude/project-thread-air5ll`). Tudo abaixo foi implementado e testado no Supabase local; ainda **não** está no projeto Supabase real nem no site publicado.

## Como alguém vira professor
1. A pessoa cria uma conta normal (todo cadastro nasce como estudante).
2. Em **Minha conta > Área do professor**, toca em **Quero ser professor** e informa as disciplinas e um pouco sobre si.
3. O Ryan vê o pedido em **Administração > Professores** (com nome e e-mail) e aprova ou recusa. Fica registrado na auditoria.
4. Aprovado, aparece no menu a **Área do professor**. O Ryan pode tirar o acesso a qualquer momento (a conta volta a ser de estudante e as questões continuam guardadas).

Ninguém vira professor sozinho: a mudança de papel só acontece pela função `admin_decide_teacher`, que exige a permissão `users.manage`.

## Área do professor (precisa de internet)
Cada alteração é conferida e gravada no servidor na hora, por isso esta área não funciona offline.

### Meu banco de questões
- Banco **individual e privado**: só o próprio professor e a equipe da plataforma veem. Outro professor não vê, não altera e não apaga (testado).
- Criar, editar e excluir questões: disciplina, conteúdo, nível, dificuldade, banca, ano, tipo, tema, enunciado, **imagem** (até 2 MB), descrição da imagem, até 6 alternativas, **gabarito**, **resolução**, dica do tutor e fonte.
- Situação: rascunho, publicada ou arquivada. Só questões publicadas podem ir para os alunos.
- Busca por palavra-chave (sem acento), disciplina, conteúdo, dificuldade e situação.
- **Histórico**: toda alteração gera uma versão com autor e data ("Versões"). Se o Ryan corrigir uma questão do professor, a versão mostra o nome do Ryan.
- Excluir só funciona se ninguém respondeu e a questão não está numa lista. Caso contrário, arquive.
- **Enviar ao banco geral**: a questão fica "aguardando" até o Ryan aprovar. Depois de pública, só a equipe altera; o professor usa **Pedir correção**.

### Listas e simulados
- Criar lista de exercícios ou simulado (com tempo opcional em minutos).
- Adicionar questões do próprio banco ou do **banco geral** da plataforma, com busca e filtros. Questões de outros professores não podem entrar (conferido no banco).
- Reordenar, tirar questões, publicar ou voltar para rascunho, excluir.
- **Enviar para uma turma** com prazo opcional. Os alunos só recebem depois que a lista é publicada.

### Turmas
- Criar turma: o sistema gera um **código de 8 caracteres** que o professor passa aos alunos.
- Abrir ou fechar a entrada de novos alunos, editar, arquivar.
- Ver participantes, remover (a pessoa não volta sozinha) e readmitir.
- **Resultados por lista**: quem concluiu, acertos e data, e o acerto médio da turma. O professor só vê o resultado de quem **aceitou compartilhar** (o aluno escolhe em Minhas turmas; vem ligado ao entrar, e ele pode desligar quando quiser). Anotações, flashcards e o resto do estudo do aluno nunca aparecem para o professor.

### Pedidos de correção
Lista dos pedidos enviados à equipe sobre questões do banco geral, com a resposta do Ryan.

## Regras conferidas no banco (não no site)
| Regra | Onde |
|---|---|
| Questão do professor nasce privada; ele não muda o dono nem a torna pública | gatilho `set_question_authors`, função `save_question` |
| Só o dono (professor ativo) e a equipe leem e alteram questões privadas | `can_read_question`, `can_edit_question`, políticas RLS de `questions` e `question_options` |
| Aluno lê questão privada só se ela está numa lista publicada enviada a uma turma em que ele está | `question_in_my_lists` |
| Lista só aceita questões do dono ou do banco geral | gatilho `check_list_item` |
| Tentativa de lista só vale para quem está na turma | gatilho `check_attempt_assignment` |
| Professor não liga o compartilhamento pelo aluno; aluno removido não volta sozinho | gatilho `protect_member_update` |
| Imagens do professor ficam em `t/<id do professor>/`; só ele grava ali; imagens privadas só são lidas por quem pode ver a questão | políticas do Storage (migração 8) |
| Toda alteração de questão gera versão com autor | `record_question_revision` (uma versão por transação) |

## Ferramentas do professor (2.1)
Em `#ferramentas`:
- **Gerar PDF**: escolhe o banco (plataforma ou o próprio), filtra por matéria, conteúdo, dificuldade, origem e ano, sorteia ou escolhe questão por questão, ordena e imprime (salvar como PDF). Opções de cabeçalho: título, escola, professor, turma, data, instruções, linha de nome, referência da questão, gabarito, resolução, duas colunas e embaralhar.
- **Pesquisar na internet**: busca na Wikipédia dentro do app, copia o trecho com a fonte e cria uma questão no próprio banco a partir dele; também mostra questões parecidas do banco da plataforma.

A administração liga ou desliga cada ferramenta por professor: `prof_banco`, `prof_listas`, `prof_turmas`, `prof_pdf`, `prof_pesquisa`, `prof_banco_geral`.

## O que ainda não existe
- Notificações (e-mail ou aviso) quando uma lista nova chega.
- Correção de questões discursivas: só múltipla escolha e certo/errado.
