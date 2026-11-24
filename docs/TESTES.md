# Testes automáticos

Três níveis, todos rodados de verdade (nada simulado no lugar do banco ou do navegador):

| Comando | O que testa | Precisa de |
|---|---|---|
| `npm test` | Lógica pura: revisão espaçada, estatísticas, regras de sincronização, escape de HTML, conteúdo inicial, `sw.js` e instaladores atualizados, ausência de chave secreta no código | Node 22 |
| `npm run test:banco` | Banco real (Supabase local): cadastro, isolamento entre alunos, correção no servidor, sincronização, permissões de admin, bloqueio, auditoria, arquivos, limites de uso, LGPD, editor de questões | Docker + `npx supabase start` |
| `npm run test:e2e` | Navegador Chromium real contra o Supabase local, com e-mails de verdade (Mailpit) | O mesmo + Playwright |
| `npm run test:tudo` | Os três em sequência | |

O workflow `.github/workflows/testes.yml` foi feito para rodar os três a cada envio, mas **até 24/11/2026 ele nunca rodou** no GitHub (o GitHub Actions parece estar desligado no repositório). Os resultados abaixo são de execuções feitas no ambiente de desenvolvimento.

## Resultado da última execução (24/11/2026, versão 1.1 em desenvolvimento)
**83 de 83 aprovados**: 18 de lógica, 49 de banco e 16 no navegador (Node 22, Supabase CLI 3.3.0, Playwright 1.63, Chromium).

### Novos na 1.1: professores (10 de banco, 4 no navegador)
Banco: ninguém vira professor sozinho e o Ryan aprova; questão do professor nasce privada e outro professor/aluno não vê, não altera e não apaga; professor não troca o dono nem publica pela API; Ryan corrige o banco de qualquer professor com versão e autor registrados; turma por código e outro professor não enxerga; lista só aceita questões próprias ou do banco geral e o aluno da turma recebe e responde (aluno de fora não); professor vê só quem compartilha e não liga isso pelo aluno, aluno removido não volta sozinho; pedidos de correção e envio ao banco geral passam pelo Ryan; duplicadas, lista de professores e questão respondida não é apagada; imagens na pasta própria com leitura restrita.

Navegador: pedido para ser professor e aprovação pelo Ryan; professora cria questão privada, turma e lista e envia; aluno entra pelo código, faz a lista e o resultado chega à professora (e some quando o aluno desliga o compartilhamento); lista aberta com internet é feita sem internet e sincroniza depois.

### Resultado da 1.0
**69 de 69 aprovados**.

### Lógica: 18/18
Revisão espaçada (5), estatísticas do painel (4), sincronização (4), proteção da interface (2), conteúdo e empacotamento (3).

### Banco e segurança: 39/39
- Cadastro e perfil (4): perfil "estudante" criado sozinho; ninguém vira admin pelos dados do cadastro; aluno não muda a própria categoria; visitante sem login não lê nada além das configurações públicas.
- Isolamento (3): um aluno não vê, não altera e não grava em nome de outro.
- Questões (9): correção no servidor, histórico imutável, reenvio não duplica, simulado recalculado, aluno não edita questões, busca sem acento, comentários e moderação.
- Sincronização (4): versão antiga não sobrescreve a nova, `synced_at` do servidor, exclusão chega aos outros aparelhos, validações recusam dados inválidos.
- Administração (10): aluno barrado, `bootstrap_admin` inacessível pelo site, estatísticas, bloqueio/desbloqueio, admin não se bloqueia, publicação exige 1 correta, rascunho oculto, auditoria imutável, categorias, configurações globais.
- Arquivos (2), limites de uso (1), LGPD (2), editor de questões (4).

### Navegador: 12/12
1. Sem conta: estuda, erra uma questão e ela vira flashcard; dados persistem ao recarregar
2. Cadastro com confirmação por e-mail e entrada na conta, levando os dados do aparelho
3. Personalização e dados aparecem em outro aparelho (e não afetam outro usuário)
4. Offline: grava sem internet e sincroniza quando a conexão volta
5. Alterar senha exige a senha atual; recuperação por e-mail funciona
6. Sair da conta remove os dados pessoais do aparelho
7. Estudante não vê nem acessa a administração
8. Ryan acessa o painel, vê estatísticas, publica questão e bloqueia um usuário
9. Modos de tela: detecção automática e escolha manual, sem rolagem lateral no celular
10. Texto malicioso não executa código (XSS)
11. Funciona offline depois da primeira visita (service worker)
12. A política de segurança (CSP) não bloqueia nada do próprio app

Os testes de navegador encontraram e ajudaram a corrigir 2 falhas reais: anotações perdiam o título quando o texto era digitado logo em seguida, e "Sair" avisava pendências que seriam enviadas em segundos.

### Backup e recuperação
Testado manualmente no banco local: cópia gerada com os mesmos comandos do `backup.yml`, restaurada num banco vazio com o procedimento de [BANCO_DE_DADOS.md](BANCO_DE_DADOS.md#recuperação), seguida de `pos-restauracao.sql`. Contagens iguais às de antes e os 39 testes do banco passaram no banco restaurado.

## O que não foi testado aqui
- O projeto Supabase real (`dvzmcvuvpcnfcxjnmvev`), que hoje roda a versão 0.3: o ambiente de desenvolvimento não consegue acessá-lo, e nada da 1.x foi instalado nele. Os testes usam o mesmo software rodando localmente.
- Envio de e-mail por SMTP real (os testes usam o Mailpit local).
- Turnstile (precisa das chaves da Cloudflare).
- Safari/iPhone e Firefox: só Chromium foi automatizado. Recomenda-se abrir o site num iPhone após publicar.
- Os workflows do GitHub Actions rodam depois do envio; o `backup.yml` só funciona com os segredos configurados.
