# Educa Mais: documentação geral

Atualizado em 24/11/2026.

## Versões e onde cada uma está
| Versão | Onde | Situação |
|---|---|---|
| 0.3 | branch `main`, site no GitHub Pages, Supabase real `dvzmcvuvpcnfcxjnmvev` | **No ar.** Página única; dados de cada aluno num bloco JSON (`student_data`) e tabela `admins`. Cópia em `legado/index-v0.3.html`. |
| 1.0 | branch `claude/project-thread-air5ll` (PR #1) | Plataforma modular: contas, sincronização offline, banco com tabelas próprias, painel do Ryan. Testada no Supabase local. |
| 1.1 (em desenvolvimento) | mesma branch | 1.0 + sistema de professores, turmas e listas. Testada no Supabase local. |

Regras combinadas: a `main` só muda com autorização expressa; nada é instalado ou alterado no Supabase real sem autorização; nenhum comando destrutivo; nenhuma chave secreta no repositório.

## Documentos
| Arquivo | Para quê |
|---|---|
| [CONFIGURACAO.md](CONFIGURACAO.md) | Colocar no ar: Supabase, e-mail, primeiro administrador |
| [ARQUITETURA.md](ARQUITETURA.md) | Como o app é organizado por dentro |
| [BANCO_DE_DADOS.md](BANCO_DE_DADOS.md) | Tabelas, relações, sincronização e instalação |
| [SEGURANCA.md](SEGURANCA.md) | Proteções e limites honestos |
| [SISTEMA_ALUNOS.md](SISTEMA_ALUNOS.md) | O que o aluno faz, Minhas turmas, privacidade |
| [SISTEMA_PROFESSORES.md](SISTEMA_PROFESSORES.md) | Banco próprio, listas, turmas, regras |
| [SISTEMA_ADMINISTRATIVO.md](SISTEMA_ADMINISTRATIVO.md) | Painel do Ryan e acesso aos bancos dos professores |
| [MANUTENCAO.md](MANUTENCAO.md) | Rotina de cuidados e atualizações |
| [TESTES.md](TESTES.md) | Testes automáticos e o último resultado |
| [HISTORICO_DE_ALTERACOES.md](HISTORICO_DE_ALTERACOES.md) | O que mudou em cada versão |

## O que está pronto e testado (no Supabase local)
- Contas, confirmação por e-mail, recuperação e troca de senha, sessões, exclusão de conta.
- Estudo completo online e offline com sincronização entre aparelhos.
- Painel do Ryan: usuários, bloqueio, questões, catálogo, materiais, moderação, configurações, permissões, auditoria.
- Professores: pedido e aprovação, banco individual privado, versões, listas, turmas, resultados com consentimento do aluno, pedidos de correção, imagens.
- Alunos: Minhas turmas, listas também sem internet.
- 83 testes automáticos executados e aprovados ([TESTES.md](TESTES.md)).

## Pendências
1. **Instalar no Supabase real**: o instalador da 1.x foi feito para um projeto vazio. O projeto real já tem `student_data` e `admins` da 0.3, então é preciso um instalador adaptado que não apague nada e reconheça os administradores atuais. Depende do resultado das consultas só de leitura ("Passo 0") pedidas à responsável.
2. **Migração dos dados da 0.3**: copiar o conteúdo de `student_data` para as tabelas novas, sem apagar `student_data` (fica como cópia de segurança). Ainda não escrito: depende do formato real dos dados.
3. **GitHub Actions**: os testes automáticos nunca rodaram no GitHub; provavelmente o Actions está desligado no repositório.
4. **LGPD**: pergunta de idade com consentimento do responsável para menores de 13 anos, e aviso de privacidade completo.
5. **Ambiente de testes separado**: recomendado criar um segundo projeto Supabase (grátis) só para testes antes de mexer no real.
6. Professores: envio de PDFs, avisos de lista nova, tela no painel para ver turmas e listas de qualquer professor.
7. Testes em Safari/iPhone e Firefox (só Chromium é automatizado).

## Como publicar (quando autorizado)
1. Instalar no Supabase real num projeto Supabase novo (ver BANCO_DE_DADOS.md), sem mexer no projeto que está no ar.
2. Testar o site da branch apontando para o projeto real (ou para o projeto de testes).
3. Juntar a branch na `main` (PR #1). O GitHub Pages publica sozinho.
