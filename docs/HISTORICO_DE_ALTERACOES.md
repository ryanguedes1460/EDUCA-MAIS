# Histórico de alterações

## 1.1.0 (em desenvolvimento, branch `claude/project-thread-air5ll`)
Ainda não publicada: não está na `main`, no site nem no Supabase real.

**Novo**
- Professores: pedido em Minha conta e aprovação pelo Ryan; banco de questões individual e privado (criar, editar, excluir, imagem, gabarito, resolução, busca, histórico de versões); listas e simulados com questões próprias ou do banco geral; turmas com código; envio de listas com prazo; resultados de quem aceitou compartilhar; pedidos de correção.
- Alunos: tela Minhas turmas (entrar pelo código, compartilhar ou não os resultados, sair, fazer as listas, inclusive sem internet depois de abertas).
- Ryan: abas Professores e Pedidos de correção; filtro por banco de cada professor, por visibilidade e palavra-chave; aprovação de questões para o banco geral; busca de duplicadas; filtro de usuários por papel.
- Banco: migrações 7 e 8 (8 tabelas novas, versões de questões, regras de acesso e imagens dos professores).
- 14 testes automáticos novos (83 no total, todos executados e aprovados).

**Alterado**
- O papel "professor" deixou de ter acesso a todo o conteúdo (`content.manage`); agora tem só a própria área (`teacher.area`).
- Documentação reorganizada com os nomes DOCUMENTACAO_GERAL, SISTEMA_PROFESSORES, SISTEMA_ALUNOS, SISTEMA_ADMINISTRATIVO, BANCO_DE_DADOS e HISTORICO_DE_ALTERACOES.

## 0.3 (24/11/2026, enviada direto na `main`)
Página única (`index.html`) ligada ao Supabase real, com os dados de cada aluno guardados num bloco JSON (`student_data`) e tabela `admins`. Guardada em `legado/index-v0.3.html`. É a versão que está no ar.

## 1.0.0 (24/11/2026)
Reconstrução completa da plataforma.

**Novo**
- Contas com cadastro, confirmação por e-mail, login, recuperação e troca de senha, gestão de sessões e exclusão da conta (Supabase Auth).
- Banco de dados com 27 tabelas, Row Level Security em todas, correção das questões no servidor, auditoria e limites contra abuso.
- Sincronização entre aparelhos que funciona offline (fila de envio, a última edição vence, indicador de pendências).
- Questões com filtros completos, busca sem acento, dica, explicação, comentários, imagens, favoritos e simulados retomáveis.
- Flashcards com coleções, favoritos e revisão espaçada; erros viram flashcards automaticamente.
- Plano de estudos, metas, Pomodoro, anotações e painel de desempenho com dados reais.
- Personalização salva na conta: temas, cores, cartões, densidade, letra e modo de tela (automático/computador/tablet/celular).
- Painel do administrador: estatísticas, usuários e bloqueio, editor de questões, catálogo, materiais protegidos, moderação, configurações, permissões e auditoria.
- Backup semanal criptografado e procedimento de recuperação testado.
- 69 testes automáticos (lógica, banco e navegador) e integração contínua.

**Mantido**
- Funciona sem configuração em "modo local".
- Dados da versão 0.2 são trazidos automaticamente na primeira abertura. A versão antiga está em `legado/`.

## 0.2
App de estudos estático com dados só no aparelho.
