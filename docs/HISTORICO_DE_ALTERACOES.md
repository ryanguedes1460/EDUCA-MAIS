# Histórico de alterações

## 1.3.0 (em desenvolvimento, mesma branch da 1.2)
**Novo**
- Banco de questões ampliado para **13.088 questões autorais** (antes 2.767), sem nenhum enunciado repetido. Por matéria: Matemática 5.372, Física 2.994, Química 2.128, Geografia 837, Biologia 477, Raciocínio lógico 326, Português 298, Inglês 248, História 218, Literatura 116, Filosofia 76, Sociologia 54 e Direito 10.
- 63 tipos novos de questão de exatas, incluindo nível ITA, IME e FUVEST (determinantes, complexos, polinômios, relações de Girard, gases, lentes, colisões, estequiometria, titulação e outros), e 26 tabelas novas de humanas, linguagens e natureza.
- 32 estilos de prova para filtrar: ENEM, FUVEST, UNICAMP, ITA, IME, UFMG, PAS/UnB, UEMA, UNITINS, UERJ, Unesp e uma universidade de cada estado, com cidades da região nos enunciados. As questões são autorais e avisam que não são oficiais.

**Melhorado**
- Primeiro acesso: o banco vem num arquivo só, em vez de milhares de linhas pela API.
- O app prepara o banco em segundo plano e as telas de questões abrem mais rápido.
- Busca de duplicadas do painel com índice e sem comparar as questões geradas entre si.
- Alternativas sem erros de formatação (ex.: "0,00 N" ou "18,0" como distrator foram eliminados).

## 1.2.0 (em desenvolvimento, branch `claude/project-thread-miog5u`)
Ainda não publicada: não está na `main`, no site nem no Supabase real. Vai para um projeto Supabase novo, para não mexer na 0.3 que está no ar.

**Novo**
- Banco de questões com 2.767 questões originais no estilo ENEM e vestibulares, em 13 matérias (inclui Literatura, Sociologia e Filosofia), com filtros, busca e nota estilo TRI nos simulados.
- Temas de redação (24 propostas e as 5 competências, sem correção automática).
- Flashcards criados pela plataforma a partir de um tema digitado.
- Aba Resultados: horas por mês, registro de cada sessão (dia, hora, matéria), histórico de respostas, simulados e evolução dos flashcards.
- Cronograma automático pelo objetivo ou pelas matérias e pesos do edital; o quadro da semana se ajusta ao tablet e ao computador.
- Aulas dentro da plataforma (YouTube, Vimeo ou vídeo próprio sem download), material de apoio, marcar como assistida, questões antes e depois.
- Tirar dúvidas com a professora, com assistente gratuito que procura explicações parecidas no banco.
- Painel do Ryan: contas novas aguardando liberação, liberar aulas e materiais por aluno ou por grupo, desligar partes do app por aluno, ver última entrada, última aula e aulas concluídas, responder dúvidas.
- 12 temas de cor, fundos, cantos e letras.
- Proteção do conteúdo: sem botão direito, cópia ou arrasto; o conteúdo escurece ao trocar de janela ou apertar a tecla de print; registro de quem abriu cada aula e material.

**Retirado**
- "Usar sem conta": o app sempre abre na tela de entrada.
- Backup: a rotina `backup.yml` e o baixar/restaurar dados da tela Conta.

**Testes**: 25 de lógica, 59 do banco e 19 no navegador, todos aprovados.

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
