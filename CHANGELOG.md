# Histórico de versões

## 1.0.0 (24/11/2026)
Reconstrução completa da plataforma.

**Novo**
- Contas com cadastro, confirmação por e-mail, login, recuperação e troca de senha, gestão de sessões e exclusão da conta (Supabase Auth).
- Banco de dados com 27 tabelas, Row Level Security em todas, correção das questões no servidor, auditoria e limites contra abuso.
- Sincronização entre aparelhos que funciona offline (fila de envio, a última edição vence, indicador de pendências).
- Questões com filtros completos, busca sem acento, dica, explicação, comentários, imagens, favoritos e simulados retomáveis.
- Flashcards com coleções, favoritos e revisão espaçada; erros viram flashcards automaticamente.
- Plano de estudos, metas, Pomodoro, anotações e painel de desempenho com dados reais.
- Personalização salva na conta: temas, cores, cartões, densidade, letra e modo de tela (automático/computador/tablet/celular).
- Painel do administrador: estatísticas, usuários e bloqueio, editor de questões, catálogo, materiais protegidos, moderação, configurações, permissões e auditoria.
- Backup semanal criptografado e procedimento de recuperação testado.
- 69 testes automáticos (lógica, banco e navegador) e integração contínua.

**Mantido**
- Funciona sem configuração em "modo local".
- Dados da versão 0.2 são trazidos automaticamente na primeira abertura. A versão antiga está em `legado/`.

## 0.2
App de estudos estático com dados só no aparelho.
