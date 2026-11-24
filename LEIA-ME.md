# Educa Mais: plataforma de estudos (versão 1.0)

Plataforma de estudos para ENEM, ensino fundamental e médio (e concursos), que funciona **online e offline** no computador, no tablet e no celular.

Endereço público: https://ryanguedes1460.github.io/educa-mais/

## O que o app faz
- **Questões** com filtros (disciplina, assunto, nível, dificuldade, banca, ano, tipo), busca sem acento, dica do tutor, correção automática feita pelo servidor, explicação, comentários, favoritos e **simulados** que podem ser retomados.
- **Flashcards** com coleções, favoritos e revisão espaçada (o cartão volta logo antes de você esquecer). Toda questão errada vira flashcard automaticamente na coleção "Questões que errei".
- **Plano de estudos** (cronograma semanal) e **metas** medidas com dados reais.
- **Foco** (Pomodoro) que registra o tempo estudado.
- **Anotações** com busca e favoritos.
- **Desempenho**: sequência de dias, acerto por disciplina, assuntos com dificuldade, gráficos de tempo e evolução. Nada é inventado: tudo vem das suas respostas.
- **Aparência**: temas, cores, estilo dos cartões, densidade, tamanho da letra e modo de tela (automático, computador, tablet ou celular). Fica salvo na conta.
- **Conta**: cadastro com confirmação por e-mail, entrar, sair, recuperar e alterar senha, ver e encerrar sessões em outros aparelhos, baixar todos os seus dados, apagar o histórico ou a conta.
- **Painel do administrador (Ryan)**: estatísticas gerais, usuários (bloquear, desbloquear, mudar papel), editor de questões com imagem, matérias e categorias, materiais protegidos, moderação de comentários, configurações gerais, permissões e registro de auditoria.

## Situação atual
Sem configuração, o site funciona em **modo local**: tudo fica só no aparelho, sem login. Para ligar as contas, a sincronização entre aparelhos e o painel do Ryan, siga **[docs/CONFIGURACAO.md](docs/CONFIGURACAO.md)** (cerca de 30 minutos, sem programar).

## Documentação
| Arquivo | Para quê |
|---|---|
| [docs/CONFIGURACAO.md](docs/CONFIGURACAO.md) | Passo a passo para colocar tudo no ar (Supabase, e-mail, admin) |
| [docs/ADMINISTRACAO.md](docs/ADMINISTRACAO.md) | Como o Ryan usa o painel |
| [docs/SEGURANCA.md](docs/SEGURANCA.md) | Como os dados são protegidos e os limites honestos |
| [docs/BANCO-DE-DADOS.md](docs/BANCO-DE-DADOS.md) | Tabelas, relações, backup e recuperação |
| [docs/ARQUITETURA.md](docs/ARQUITETURA.md) | Como o app é organizado por dentro |
| [docs/MANUTENCAO.md](docs/MANUTENCAO.md) | Atualizar o app, adicionar questões, rotina de cuidados |
| [docs/TESTES.md](docs/TESTES.md) | Testes automáticos e resultados |
| [CHANGELOG.md](CHANGELOG.md) | O que mudou em cada versão |

## Serviços externos
| Serviço | Uso | Custo |
|---|---|---|
| GitHub Pages | Hospeda o site | Grátis |
| Supabase | Banco de dados, contas, arquivos | Grátis até 500 MB de banco e 1 GB de arquivos |
| Provedor de e-mail SMTP (ex.: Resend ou Brevo) | Enviar confirmação de cadastro e recuperação de senha | Plano grátis basta no início |
| Cloudflare Turnstile (opcional) | Anti-robô no login e cadastro | Grátis |

## Para quem programa
```bash
npm install
npm run servir          # abre em http://127.0.0.1:8080 (modo local)
npm test                # testes de lógica
npx supabase start      # banco local (precisa do Docker)
npm run test:banco      # testes do banco e da segurança
npm run test:e2e        # testes no navegador
npm run build           # OBRIGATÓRIO depois de mudar arquivos do app (atualiza sw.js)
```
As versões anteriores estão guardadas em `legado/`: a 0.2 (`index-v0.2.html`) e a 0.3 (`index-v0.3.html`, a que usa a tabela `student_data`). Os dados guardados no aparelho por elas são trazidos automaticamente na primeira abertura.
