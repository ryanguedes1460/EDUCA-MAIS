# Segurança

Resumo honesto do que protege os dados do Educa Mais, e do que **não** é possível garantir num site.

## Onde a segurança realmente acontece
O site (HTML/JavaScript) é público e qualquer pessoa pode ler o código. Por isso **nenhuma regra de acesso depende do site**. Tudo é conferido no banco de dados (Supabase/PostgreSQL):

| Proteção | Como |
|---|---|
| Senhas | O app só repassa a senha direto ao Supabase por HTTPS; ela nunca é gravada no aparelho, em arquivos ou em registros. O Supabase Auth guarda apenas o hash (bcrypt). Mínimo de 8 caracteres com letras e números. |
| Chaves | O site só tem a chave **pública** (publishable/anon), que não dá acesso a nada sozinha. O app se recusa a iniciar se alguém colocar uma chave secreta no `config.js`, e um teste automático verifica isso em todo envio. |
| Acesso aos dados | **Row Level Security** em todas as tabelas (35 na 1.1): cada aluno só lê e altera as próprias linhas. Permissões de anônimo e de usuário comum foram retiradas e concedidas tabela por tabela, coluna por coluna onde importa (ex.: o aluno não consegue mudar o próprio papel nem a situação da conta). |
| Administração | Funções do servidor (`security definer`, `search_path` vazio) que conferem a permissão antes de agir e gravam **auditoria**. O primeiro admin só pode ser criado pelo SQL Editor do Supabase. |
| Contas bloqueadas | Perdem acesso a todos os dados na hora (regra `is_active()` nas políticas) e as sessões são encerradas. |
| Professores | Banco de questões de cada professor é privado: outro professor e os alunos não leem; o aluno só vê questões que estão numa lista enviada à turma dele. O professor não se aprova sozinho, não publica no banco geral sem o Ryan e só vê resultados de quem aceitou compartilhar. Imagens em pasta própria. Tudo conferido no banco e testado ([SISTEMA_PROFESSORES.md](SISTEMA_PROFESSORES.md)). |
| Correção das questões | O gabarito vai para o aparelho para a correção funcionar offline, mas o resultado que fica no histórico e nas estatísticas é recalculado pelo servidor (gatilho `grade_answer`): ninguém consegue gravar um acerto falso. |
| Injeção de SQL | Não há SQL montado com texto do usuário. O site usa a API do Supabase (consultas parametrizadas) e as funções usam parâmetros tipados. |
| XSS (código malicioso em textos) | Todo texto do usuário passa por escape automático (`html\`...\``) e a política **CSP** proíbe scripts que não sejam do próprio site. Testado no navegador com `<script>` e `<img onerror>`. |
| CSRF | O login não usa cookies: o token vai no cabeçalho `Authorization`, então outro site não consegue agir em nome do aluno. `form-action 'self'` na CSP. |
| Força bruta | Supabase Auth limita tentativas por IP. O app ainda trava o formulário no aparelho após 5 erros (30 s, depois 60 s, até 15 min). Opcional: Cloudflare Turnstile (anti-robô). |
| Abuso / spam | Limites no servidor por usuário: 1.500 respostas/h, 30 comentários/h, 3.000 flashcards/h, 600 anotações/h, 5.000 revisões/h, 60 materiais/h. |
| Validação | Tamanhos, formatos e valores permitidos são verificados por `check` no banco (ex.: cores só `#RRGGBB`, dificuldade 1 a 5, enunciado até 8.000 caracteres), além do formulário. |
| HTTPS | GitHub Pages e Supabase só funcionam por HTTPS. |
| Cache offline | O service worker guarda **só os arquivos do app**. Respostas do Supabase (dados, tokens) nunca são guardadas em cache. Ao sair da conta, o banco local daquela conta é apagado do aparelho (se houver algo não enviado, o app avisa antes). |
| Dependências | Só uma biblioteca no site (supabase-js, versão fixa em `vendor/`). O Dependabot avisa sobre atualizações e falhas de segurança. |
| LGPD | Em **Conta**, o aluno baixa todos os seus dados, apaga o histórico ou exclui a conta (apaga tudo em cascata). |

## Proteção de conteúdo: limites honestos
- **Materiais** (PDFs etc.) ficam num local privado. Só alunos com conta ativa conseguem abrir, por um link que **vale 60 segundos**, e cada acesso é registrado. Abrir muitos materiais em pouco tempo gera um evento de segurança para o admin.
- **Não existe forma técnica de impedir** que alguém que pode ver um conteúdo o copie (print da tela, foto com o celular, salvar o PDF aberto). Nenhum site consegue isso. O que fazemos é: exigir conta, limitar a quantidade, registrar quem acessou e permitir bloquear a conta.
- As **questões publicadas** precisam chegar ao aparelho para funcionar offline, então quem tem acesso ao app pode, com conhecimento técnico, extrair o texto delas.

## O que depende de configuração (fora do código)
- SMTP próprio para e-mails de confirmação (ver [CONFIGURACAO.md](CONFIGURACAO.md)).
- Turnstile, se desejar anti-robô.
- "Leaked password protection" (bloquear senhas vazadas) só existe no plano Pro do Supabase.

## Se algo der errado
1. **Chave secreta vazou**: Supabase > Project Settings > API Keys > gere nova chave e revogue a antiga.
2. **Conta suspeita**: Administração > Usuários > Bloquear (derruba as sessões). Veja a aba Auditoria.
3. **Senha do Ryan comprometida**: "Esqueci a senha" no site, e depois Conta > Sessões > Encerrar as outras.
4. **Dados corrompidos**: no plano Pro, volte no tempo pelo painel do Supabase (Database > Backups).
