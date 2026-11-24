# Arquitetura

```
Navegador (celular / tablet / computador)
 ├─ index.html + css/ + js/          site estático (GitHub Pages), sem etapa de compilação
 ├─ sw.js                             service worker: guarda os arquivos do app para funcionar offline
 ├─ IndexedDB "educa-mais:<conta>"    cópia local dos dados do aluno + fila de envio
 └─ vendor/supabase.js                cliente oficial do Supabase (versão fixa)
        │  HTTPS (token no cabeçalho)
        ▼
Supabase
 ├─ Auth        cadastro, login, confirmação de e-mail, recuperação de senha, sessões
 ├─ PostgreSQL  tabelas + Row Level Security + funções/gatilhos (supabase/migrations)
 └─ Storage     imagens das questões e materiais protegidos
```

## Por que assim
- **Sem servidor próprio**: o GitHub Pages só serve arquivos. Toda regra de segurança fica no banco (RLS e funções), que é o único lugar que o aluno não controla.
- **Local primeiro**: tudo é gravado antes no aparelho, então o app responde na hora e funciona sem internet. A sincronização envia e recebe em segundo plano.
- **Sem compilação**: módulos JavaScript nativos (`import`). Qualquer pessoa consegue editar um arquivo no GitHub e o site atualiza.

## Pastas
| Caminho | Conteúdo |
|---|---|
| `index.html` | Casca do app, política de segurança (CSP), carrega `config.js` e `js/main.js` |
| `config.js` | Endereço e chave **pública** do Supabase (vazio = modo local) |
| `css/` | `base.css` (cores, temas, tipografia), `layout.css` (menus e modos de tela), `componentes.css` |
| `js/main.js` | Inicialização, menu, rotas (`#questoes`, `#flashcards`...), entrada/saída da conta, atualização do app |
| `js/core/` | `backend` (cliente Supabase), `auth` (login), `store` (IndexedDB + fila), `sync` (envio/recebimento), `tabelas` (o que sincroniza e como), `aparencia` (temas e modos de tela), `conteudo` (catálogo e questões), `util` (escape de HTML, diálogos, datas), `bus` (eventos) |
| `js/lib/` | Lógica pura testada: `srs` (revisão espaçada SM-2), `stats` (sequência, acerto, metas), `graficos` (SVG), `migrar-v02` (traz dados da versão antiga), `editor-questao` (editor usado pelo professor e pelo Ryan) |
| `js/views/` | Uma tela por arquivo: inicio, questoes, flashcards, plano, foco, anotacoes, desempenho, aparencia, conta, materiais, turmas (aluno), professor, admin, entrar |
| `js/data/conteudo-inicial.js` | 25 questões e o catálogo, para o modo local e o primeiro uso offline |
| `conteudo/` | Fonte do conteúdo inicial (JSON). `npm run conteudo` gera o SQL e o JS |
| `supabase/` | Migrações, instalador e pós-restauração |
| `scripts/` | `build.mjs` (gera `sw.js` com a lista de arquivos e o instalador SQL), `servidor.mjs` (servidor local), `gerar-conteudo.mjs` |
| `tests/` | `unidade/`, `integracao/` (banco real), `e2e/` (navegador real) |
| `legado/` | Versões 0.2 e 0.3 guardadas |

## Fluxos principais
- **Responder questão**: grava `answers` no aparelho → mostra correção na hora → se errou, cria flashcard na coleção "Questões que errei" → envia ao servidor, que **recalcula** o acerto.
- **Entrar na conta**: o banco local passa a ser o da conta; se havia dados feitos sem conta, o app pergunta se quer levá-los; baixa preferências e histórico.
- **Sair da conta**: envia pendências, apaga o banco local da conta (se ainda houver algo não enviado, avisa e guarda até a próxima entrada).
- **Atualizar o app**: `sw.js` muda de versão quando qualquer arquivo muda (`npm run build`). O app mostra "Uma nova versão da Educa Mais está pronta" e só recarrega quando o aluno toca em "Atualizar agora", para não perder nada no meio de um simulado.
- **Lista do professor**: Minhas turmas baixa as turmas e listas (`my_classes`, `my_assignments`) e as questões delas, e guarda no aparelho → `#questoes/lista/<envio>` cria uma tentativa com `assignment_id` → as respostas seguem a mesma fila de envio das outras.
- **Área do professor e painel**: falam direto com o banco (sem cópia local), porque cada alteração precisa ser conferida na hora.
- **Modos de tela**: `html[data-device]` = `mobile` (até 699 px), `tablet` (até 1099 px) ou `desktop`, detectado automaticamente ou escolhido em Aparência.
