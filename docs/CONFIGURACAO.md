# Configuração: colocar o Educa Mais no ar com contas e sincronização

Tempo: cerca de 30 minutos. Não precisa programar. Você vai copiar e colar.

> **Regra de ouro:** a única chave do Supabase que pode ir para o site é a **publishable** (ou "anon public"). Nunca copie a chave **secret** / **service_role** para o GitHub, para o `config.js` nem para mensagens. Se isso acontecer por engano, gere uma nova chave no Supabase na mesma hora (Project Settings > API Keys).

Os nomes dos menus do Supabase podem mudar um pouco com o tempo; procure pelo nome mais parecido.

---

## 1. Criar o projeto no Supabase
1. Entre em https://supabase.com e crie uma conta (pode usar a do GitHub).
2. Clique em **New project**.
   - Nome: `educa-mais`
   - **Database password**: crie uma senha forte e guarde num gerenciador de senhas. Ela não vai para o site.
   - Região: **South America (São Paulo)**.
3. Espere o projeto ficar pronto (1 a 2 minutos).

## 2. Criar o banco de dados
1. No menu da esquerda, abra **SQL Editor** e clique em **New query**.
2. Abra o arquivo [`supabase/instalar.sql`](../supabase/instalar.sql) aqui no GitHub, clique no botão de copiar o conteúdo ("Copy raw file"), e cole no editor.
3. Clique em **Run**. Deve aparecer "Success". Isso cria as 27 tabelas, as regras de segurança, as funções, os locais de arquivos e as 25 questões iniciais.

## 3. Configurar o login
Em **Authentication**:
1. **URL Configuration**
   - Site URL: `https://ryanguedes1460.github.io/educa-mais/`
   - Redirect URLs: adicione `https://ryanguedes1460.github.io/educa-mais/`
2. **Sign In / Providers > Email**
   - **Confirm email**: ligado.
   - **Minimum password length**: 8.
   - **Password requirements**: "Letters and digits" (letras e números).
3. **Emails > SMTP Settings** (envio de e-mails): o e-mail embutido do Supabase só entrega para os membros da sua equipe no Supabase e tem limite de poucos e-mails por hora, então **alunos não receberiam a confirmação**. Configure um provedor:
   - Crie conta grátis no **Resend** (resend.com) ou **Brevo** (brevo.com), confirme seu domínio ou e-mail remetente, e copie os dados de SMTP (servidor, porta, usuário, senha) para essa tela do Supabase.
   - A senha do SMTP fica guardada só no Supabase.
4. **Emails > Templates** (opcional): traduza os textos dos e-mails para português.
5. **Rate Limits**: deixe os valores padrão (eles protegem contra abuso).

## 4. Ligar o site ao Supabase
1. No Supabase, abra **Project Settings > API Keys** (ou **Data API**) e copie:
   - **Project URL** (ex.: `https://abcdefgh.supabase.co`)
   - **Publishable key** (começa com `sb_publishable_`) ou, em projetos antigos, a **anon public**.
2. No GitHub, abra o arquivo `config.js` do repositório, clique no lápis (Edit), e preencha:
   ```js
   supabaseUrl: 'https://abcdefgh.supabase.co',
   supabaseAnonKey: 'sb_publishable_...',
   ```
3. Clique em **Commit changes**. Em 1 a 2 minutos o site atualiza.

O próprio app recusa funcionar se alguém colocar uma chave secreta ali, e o teste automático também acusa.

## 5. Criar o administrador (Ryan)
1. Abra o site, clique em **Criar conta**, e cadastre o Ryan com o e-mail dele. Confirme pelo link que chega no e-mail.
2. No Supabase, abra o **SQL Editor** e rode (trocando o e-mail):
   ```sql
   select public.bootstrap_admin('email-do-ryan@exemplo.com', 'Ryan');
   ```
3. Deve aparecer "Pronto: Ryan agora é administrador." Saia e entre de novo no site: o menu **Administração** aparece.

Essa função só funciona pelo SQL Editor (que exige entrar no Supabase). Ninguém consegue se tornar administrador pelo site. A senha do Ryan nunca passa por nós nem fica em arquivo: ela é criada por ele no cadastro e guardada pelo Supabase de forma criptografada (hash).

## 6. Anti-robô (opcional, recomendado ao divulgar)
1. Crie conta em https://dash.cloudflare.com > **Turnstile** > **Add site** com o domínio `ryanguedes1460.github.io`.
2. Copie a **Secret key** para o Supabase em **Authentication > Attack Protection > Enable Captcha protection** (provedor Turnstile). A chave secreta fica só no Supabase.
3. Copie a **Site key** (pública) para `turnstileSiteKey` no `config.js`.

## 7. Conferir
- Abra o site no celular, crie uma conta de teste, confirme o e-mail, responda uma questão, e abra no computador com a mesma conta: o histórico deve aparecer.
- No painel do Ryan, **Visão geral** deve mostrar 2 usuários.

## Atenção ao plano grátis do Supabase
- Projetos sem nenhum acesso por **7 dias seguidos** são pausados. Basta reativar no painel. Com alunos usando, isso não acontece.
- Limites: 500 MB de banco, 1 GB de arquivos, 50 mil usuários ativos por mês. Para crescer, o plano Pro (US$ 25/mês) inclui backup diário automático.
