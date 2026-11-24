# Manutenção

## Rotina sugerida
| Quando | O quê |
|---|---|
| Toda semana | Conferir se o **Backup do banco** rodou (GitHub > Actions). Olhar a aba **Auditoria** e os eventos de segurança no painel. |
| Todo mês | Aceitar os pedidos do **Dependabot** que passarem nos testes. Ver uso do plano grátis no Supabase (banco, arquivos, usuários). |
| A cada 3 meses | Testar a recuperação de um backup num projeto Supabase de teste ([BANCO-DE-DADOS.md](BANCO-DE-DADOS.md#recuperação)). |

## Adicionar questões
- **Pelo painel** (mais fácil): Administração > Questões > Nova questão. Salve como rascunho, revise, e mude para Publicada.
- **Em lote** (para quem programa): edite `conteudo/questoes-iniciais.json` e `conteudo/catalogo.json`, rode `npm run conteudo` e `npm run build`, e crie uma migração nova com o SQL gerado.

Use só questões próprias ou com licença de uso. Questões do ENEM/INEP são públicas, mas cite a fonte no campo "Fonte".

## Mudar o app
1. Edite os arquivos em `js/`, `css/` ou `index.html`.
2. Rode `npm run build` (atualiza a versão do `sw.js`; sem isso os aparelhos continuam com a versão antiga guardada).
3. Rode `npm test` (e, com Docker, `npm run test:tudo`).
4. Envie para o GitHub. O workflow **Testes** roda tudo de novo automaticamente.

## Mudar o banco
Nunca edite uma migração já aplicada. Crie `supabase/migrations/<data>_<nome>.sql`, rode `npm run build` e `npm run test:banco`, e depois cole só o arquivo novo no SQL Editor do Supabase.

## Problemas comuns
| Sintoma | Causa provável |
|---|---|
| Aluno não recebe e-mail de confirmação | SMTP não configurado (CONFIGURACAO.md passo 3) ou caiu no spam |
| Site abre em "modo local" | `config.js` vazio ou com URL errada |
| Aviso "chave SECRETA" ao abrir | Colocaram a chave secret no `config.js`: troque pela publishable e gere uma nova secret no Supabase |
| Site fora do ar depois de dias sem uso | Projeto grátis do Supabase pausado: reative no painel |
| Aparelho não mostra a versão nova | Faltou `npm run build`, ou o aluno ainda não tocou em "Atualizar agora" |
| "Limite de uso atingido" | Proteção contra abuso: espere alguns minutos (a janela é de 1 hora) |
