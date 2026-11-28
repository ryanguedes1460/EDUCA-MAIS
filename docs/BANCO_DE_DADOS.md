# Banco de dados

PostgreSQL no Supabase. A estrutura está em `supabase/migrations/` (em ordem) e junta num só arquivo em `supabase/instalar.sql` (gerado por `npm run build`).

| Migração | Conteúdo |
|---|---|
| `..._000100_estrutura.sql` | Tabelas, relações, restrições e índices |
| `..._000200_funcoes.sql` | Funções e gatilhos (permissões, correção, sincronização, limites, LGPD, admin) |
| `..._000300_seguranca_rls.sql` | Permissões e políticas de Row Level Security |
| `..._000400_armazenamento.sql` | Locais de arquivos (imagens das questões, materiais) |
| `..._000500_conteudo_inicial.sql` | Catálogo (5 áreas, 10 disciplinas, 46 assuntos, 6 bancas) e 25 questões. Gerado de `conteudo/` por `npm run conteudo` |
| `..._000600_admin_questoes.sql` | Salvar questão e alternativas numa única transação |
| `..._000700_professores.sql` | Professores: dono e visibilidade das questões, versões, turmas, listas, pedidos, funções do Ryan (1.1) |
| `..._000800_armazenamento_professores.sql` | Imagens dos professores em pasta própria e leitura restrita (1.1) |

## Tabelas
**Pessoas e acesso**
- `roles`: papéis e lista de permissões (`*` = tudo).
- `profiles`: um por conta (`id` = usuário do Supabase Auth). Nome, perfil de estudo, série, papel, situação (`active`/`blocked`). Criado automaticamente no cadastro, sempre como estudante.
- `user_settings`: aparência e preferências (tema, cores, modo de tela, cartões, densidade, letra, metas de tempo, última tela).
- `login_sessions`: aparelhos conectados (para ver e encerrar sessões).

**Conteúdo** (leitura para todos, escrita só com `content.manage`)
- `areas` → `subjects` (disciplinas) → `topics` (assuntos, com `parent_id` para subassuntos).
- `exam_boards` (bancas).
- `questions`: código, disciplina, assunto, nível (fundamental/médio/enem/concurso), dificuldade 1–5, banca, ano, tipo (múltipla escolha, certo/errado), tema, enunciado, imagem, explicação, dica, fonte, situação (rascunho/publicada/arquivada), busca por texto (`search`, sem acento).
- `question_options`: alternativas, com exatamente 1 correta (verificado ao final da transação).
- `question_comments`, `materials`, `material_access_log`, `app_settings`.

**Professores e turmas** (1.1)
- `questions` ganhou `owner_id` (dono; vazio = plataforma), `visibility` (`private`, `pending_public`, `public`) e `updated_by`.
- `question_revisions`: uma versão por alteração (foto da questão e alternativas, quem alterou, quando). Só leitura.
- `teacher_requests` (pedido para ser professor), `correction_requests` (pedido de correção ao Ryan).
- `classes` (turma, código de entrada, aberta/fechada, arquivada) → `class_members` (aluno, situação `active`/`left`/`removed`, `share_progress`).
- `lists` (lista ou simulado, tempo, situação) → `list_items` (questões em ordem) → `list_assignments` (lista enviada a uma turma, abertura e prazo).
- `exam_attempts.assignment_id`: liga a tentativa do aluno à lista recebida.
Detalhes e regras: [SISTEMA_PROFESSORES.md](SISTEMA_PROFESSORES.md).

**Estudo do aluno** (cada um só vê as próprias linhas)
- `answers`: cada resposta (questão, alternativa, acerto **corrigido pelo servidor**, tempo, dica usada, modo, simulado). Só pode ser acrescentada, nunca alterada.
- `exam_attempts`: simulados (questões, acertos, início, fim).
- `favorites`, `decks` (coleções), `flashcards` (com dados da revisão espaçada), `flashcard_reviews` (histórico de revisões), `notes`, `plan_tasks` (cronograma), `goals` (metas), `study_sessions` (tempo de estudo).

**Segurança**
- `audit_log` (ações administrativas), `security_events`, `rate_counters` (limites de uso).

## Regras importantes
- Chaves estrangeiras com `on delete cascade` a partir do perfil: excluir a conta apaga tudo do aluno. Questões com respostas não podem ser apagadas (`restrict`); arquive em vez disso.
- Exclusões de dados do aluno são "suaves" (`deleted_at`) para a exclusão chegar aos outros aparelhos.
- Cada linha tem `updated_at` (quando foi editada) e `synced_at` (quando chegou ao servidor). Um gatilho impede que uma edição mais antiga sobrescreva uma mais nova (**a última edição vence**).
- Índices para as consultas do app: por usuário + data, por disciplina/assunto/nível, busca de texto (GIN), `synced_at` para sincronizar.

## Sincronização offline
1. Toda alteração é gravada primeiro no aparelho (IndexedDB) e entra numa fila.
2. Com internet, a fila é enviada em ordem (coleções antes de cartões, simulados antes de respostas).
3. Depois o app baixa o que mudou no servidor desde a última vez (`synced_at`).
4. Conflito: vence a edição mais recente; se o aparelho tem uma alteração mais nova ainda não enviada, ela é preservada.
5. O que o servidor recusar (ex.: limite atingido) fica em "não enviados" na tela **Conta**, com opção de tentar de novo ou descartar.

## Banco de questões grande (1.3)
- Gerado por `node scripts/gerar-banco.mjs` (determinístico: rodar de novo gera as mesmas questões, com os mesmos ids). Saídas: `conteudo/banco.json`, a migração do catálogo e as partes SQL.
- Todas as questões geradas têm id `e1000000-0000-4000-a000-…` e `updated_at` fixo em 26/11/2026. No primeiro acesso, o app baixa o arquivo `conteudo/banco.json` (um download só) e pede ao servidor apenas as questões editadas depois dessa data.
- Cada questão tem um **estilo de prova** (tabela `exam_boards`, tipo `estilo`, ids 20 a 51): ENEM, FUVEST, UNICAMP, ITA, IME, UFMG, PAS/UnB, UEMA, UNITINS e uma universidade de cada estado. São questões autorais no jeito daquela prova, não questões oficiais; o campo `source` diz isso.
- A busca de duplicadas do painel compara as questões escritas à mão com todas as outras, mas não as geradas entre si (elas seguem modelos e seriam "parecidas" aos milhares).

## Cópias de segurança
Na versão 1.2 a rotina de backup do repositório (`backup.yml`) e o "baixar/restaurar meus dados" da tela Conta foram retirados, a pedido da administração. Os dados de cada aluno ficam na conta, no Supabase.
- Se um aluno pedir uma cópia dos próprios dados, a administração pode consultar as tabelas dele no painel do Supabase.
- No plano Pro, o Supabase faz cópia diária e permite voltar no tempo pelo painel (Database > Backups).
- O arquivo `supabase/pos-restauracao.sql` continua no repositório para o caso de restaurar uma cópia feita pelo painel.

## Instalar num projeto Supabase novo (1.2)
No SQL Editor do projeto novo, rode nesta ordem:
1. `supabase/instalar.sql` (todas as tabelas, regras e funções).
2. `supabase/banco-de-questoes/parte-01.sql` até `parte-14.sql` (as 13.088 questões, cerca de 1 MB cada; cada parte pode ser rodada de novo sem duplicar).
3. Para a 2.1/2.2: `supabase/banco-de-questoes/provas-01.sql` até `provas-12.sql` (ENEM oficial e concursos). Num projeto que já existia, rode antes as migrações `20261128001200_catalogo_provas.sql` e `20261128001300_contas_atividade.sql`.
4. `select public.bootstrap_admin('SEU-EMAIL', 'Ryan');` depois de criar a sua conta pelo site.

Contas novas entram **aguardando liberação** (configuração `liberacao_manual`). Para desligar: `update public.app_settings set value = 'false'::jsonb where key = 'liberacao_manual';`

## Mudanças na estrutura
Crie um arquivo novo em `supabase/migrations/` (nunca edite um já aplicado), rode `npm run build` e `npm run test:banco`. Para aplicar no projeto real, cole só a migração nova no SQL Editor.
