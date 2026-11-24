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

## Backup
**Automático** (recomendado): `.github/workflows/backup.yml` roda todo domingo, gera os arquivos com `supabase db dump`, criptografa com a frase `BACKUP_PASSPHRASE` (AES-256) e guarda como "artifact" do GitHub Actions por 90 dias. Precisa dos segredos descritos em [CONFIGURACAO.md](CONFIGURACAO.md#7-backup-automático-recomendado). O arquivo é criptografado porque repositórios públicos permitem baixar artifacts.

**Manual**: na tela **Conta**, cada aluno baixa os próprios dados (JSON) e pode restaurá-los.

**Não incluído no backup do banco**: as imagens e materiais enviados (Storage). Guarde os originais, ou baixe pelo painel do Supabase (Storage) de tempos em tempos.

## Recuperação
1. Baixe o artifact em GitHub > Actions > Backup do banco > (execução) > Artifacts.
2. Descriptografe (precisa do GnuPG instalado):
   ```bash
   gpg --decrypt --batch --passphrase 'SUA FRASE' backup.tar.gz.gpg > backup.tar.gz && tar xzf backup.tar.gz
   ```
3. Restaure num projeto Supabase (o mesmo ou um novo), usando a connection string dele:
   ```bash
   psql --single-transaction --variable ON_ERROR_STOP=1 \
     --file roles.sql --file schema.sql \
     --command 'SET session_replication_role = replica' \
     --file data.sql --dbname "$NOVA_DB_URL"
   ```
4. No SQL Editor do projeto, rode o arquivo [`supabase/pos-restauracao.sql`](../supabase/pos-restauracao.sql). Ele recria o gatilho que cria o perfil no cadastro e as regras de acesso aos arquivos, que ficam fora do backup do esquema `public`. Sem este passo, novos cadastros não funcionam.
5. Se for um projeto novo, atualize `config.js` com a URL e a chave pública dele, e refaça o passo 3 de CONFIGURACAO.md (login).

Este procedimento foi testado: restauramos uma cópia num banco vazio, rodamos o pós-restauração, e os 39 testes do banco passaram (contas, respostas e questões iguais às de antes).

No plano Pro, o Supabase também faz backup diário e permite voltar no tempo pelo painel (Database > Backups).

## Mudanças na estrutura
Crie um arquivo novo em `supabase/migrations/` (nunca edite um já aplicado), rode `npm run build` e `npm run test:banco`. Para aplicar no projeto real, cole só a migração nova no SQL Editor.
