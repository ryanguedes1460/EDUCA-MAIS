# Educa Mais: app de estudos (versão 0.2)

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
Tudo fica no próprio aparelho (armazenamento do navegador). Use a tela **Dados** para fazer backup e levar o progresso para outro aparelho.

## Próximas etapas
- Contas com login e sincronização entre aparelhos quando houver internet.
- Banco de questões grande (ENEM/INEP e por série da BNCC).
- Tutor com inteligência artificial de verdade.
