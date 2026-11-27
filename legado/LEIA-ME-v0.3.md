# Educa Mais: app de estudos (versão 0.3)

Esta pasta é o app completo. Ele funciona **online e offline**: depois de aberto uma vez pela internet, fica guardado no aparelho e continua funcionando sem conexão.

## O que tem nesta pasta
- `index.html`: o app inteiro (telas, estilos e lógica). Ao mudar este arquivo, troque também o nome do cache em `sw.js` para os aparelhos receberem a versão nova.
- `sw.js`: guarda o app no aparelho para funcionar sem internet.
- `manifest.webmanifest` e `icons/`: nome, cores e ícone que aparecem quando o app é instalado.

## Como colocar no ar (grátis)
O modo offline e o botão de instalar só funcionam quando o app está num endereço `https://`. Opções gratuitas:
1. **Netlify Drop** (mais simples): arraste esta pasta para app.netlify.com/drop.
2. **GitHub Pages**: crie um repositório, envie estes arquivos e ative o Pages.
3. **Cloudflare Pages** ou **Vercel**: também aceitam uma pasta estática.

Depois, abra o endereço no celular e toque em "Adicionar à tela inicial".

## Onde ficam os dados
Tudo fica no próprio aparelho (armazenamento do navegador), com ou sem conta. Quem entra na tela **Conta** passa a ter uma cópia na nuvem (Supabase, tabela `student_data`), sincronizada entre aparelhos quando há internet. A tela **Dados** continua fazendo backup em arquivo.

## Contas (Supabase)
- Login por e-mail e senha, com confirmação de e-mail e recuperação de senha.
- Cada aluno só lê e grava a própria linha em `student_data` (políticas RLS).
- Administradores ficam na tabela protegida `admins`. Só é possível incluir alguém nela pelo painel do Supabase.

## Próximas etapas
- Banco de questões grande (ENEM/INEP e por série da BNCC).
- Tutor com inteligência artificial de verdade.
