// Minha conta: perfil, segurança (senha e sessões), sincronização e dados pessoais (LGPD).
import { html, setHTML, actions, toast, confirmDialog, formDialog, friendlyError, download, fmtDateTime, dayKey } from '../core/util.js';
import * as auth from '../core/auth.js';
import * as store from '../core/store.js';
import * as sync from '../core/sync.js';
import { sb, configured } from '../core/backend.js';
import { USER_TABLES } from '../core/tabelas.js';
import { on } from '../core/bus.js';

const PERFIS = { enem: 'ENEM e vestibular', medio: 'Ensino médio', fundamental: 'Ensino fundamental', concurso: 'Concursos' };
const strong = p => p.length >= 8 && /[A-Za-z]/.test(p) && /\d/.test(p);

export default {
  title: 'Minha conta',
  async render(el, params, ctx) {
    const draw = async () => {
      const p = auth.state.profile;
      const [pending, rejected] = [await store.pendingCount(), await store.allRaw('rejected')];
      let sessions = [];
      if (auth.isLogged() && navigator.onLine) sessions = await auth.listLoginSessions().catch(() => []);
      const curSession = auth.currentLoginSessionId();
      const counts = {};
      for (const t of ['answers', 'flashcards', 'notes', 'flashcard_reviews', 'study_sessions']) counts[t] = (await store.all(t)).length;

      setHTML(el, html`<div class="stack" style="gap:var(--gap)">
        <div class="head"><div><span class="eyebrow">Conta</span><h1>Minha conta</h1></div>
          ${auth.isLogged() ? html`<button class="btn ghost" type="button" data-action="logout">Sair</button>` : ''}</div>
        ${!auth.isLogged() ? html`<div class="card stack"><h2>Você está usando sem conta</h2><p>Seus dados ficam só neste aparelho. ${configured ? 'Crie uma conta para guardar tudo na nuvem e estudar em qualquer aparelho.' : 'O servidor ainda não foi configurado pela administração.'}</p>${configured ? html`<div><a class="btn" href="#entrar">Entrar ou criar conta</a></div>` : ''}</div>` : html`
        <div class="grid g2">
          <form class="card stack" id="profileForm"><h2>Perfil</h2>
            <p class="small">E-mail: <b>${auth.state.user.email}</b> · Categoria: <b>${p?.role_name || p?.role}</b>${p?.status === 'blocked' ? html` · <span class="chip bad">Bloqueada</span>` : ''}</p>
            <label class="f">Nome<input class="input" name="display_name" required maxlength="60" value="${p?.display_name || ''}"></label>
            <label class="f">Eu estudo para<select class="input" name="study_profile">${Object.entries(PERFIS).map(([k, v]) => html`<option value="${k}" ${p?.study_profile === k ? 'selected' : ''}>${v}</option>`)}</select></label>
            <label class="f">Série ou etapa (opcional)<input class="input" name="school_year" maxlength="40" value="${p?.school_year || ''}" placeholder="Ex.: 3º ano do médio"></label>
            <div><button class="btn" type="submit">Salvar perfil</button></div>
            <p class="muted small">Conta criada em ${p?.created_at ? fmtDateTime(p.created_at) : '–'}.</p>
          </form>
          <div class="card stack"><h2>Segurança</h2>
            <button class="btn ghost" type="button" data-action="password">Alterar senha</button>
            <h3>Aparelhos conectados</h3>
            ${sessions.length ? html`<div class="list">${sessions.slice(0, 10).map(s => html`<div class="row between small"><span><b>${s.device || 'Aparelho'}</b>${s.id === curSession ? html` <span class="chip on">este aparelho</span>` : ''}<br><span class="muted">Entrou em ${fmtDateTime(s.started_at)} · visto ${fmtDateTime(s.last_seen_at)}</span></span><span class="chip ${s.ended_at ? '' : 'good'}">${s.ended_at ? 'encerrada' : 'ativa'}</span></div>`)}</div>` : html`<p class="muted small">${navigator.onLine ? 'Nenhum registro.' : 'Disponível com internet.'}</p>`}
            <div class="row"><button class="btn ghost sm" type="button" data-action="others">Encerrar outros aparelhos</button><button class="btn ghost sm" type="button" data-action="global">Sair de todos os aparelhos</button></div>
          </div>
        </div>`}
        <div class="grid g2">
          <div class="card stack" id="dados"><h2>Sincronização</h2>
            <p>${!auth.isLogged() ? 'Sem conta: nada é enviado para a nuvem.' : pending ? `${pending} alteração(ões) aguardando envio.` : 'Tudo enviado para a sua conta.'}</p>
            ${sync.status.lastSync ? html`<p class="muted small">Última sincronização: ${fmtDateTime(sync.status.lastSync)}</p>` : ''}
            ${auth.isLogged() ? html`<div><button class="btn ghost sm" type="button" data-action="syncNow">Sincronizar agora</button></div>` : ''}
            ${rejected.length ? html`<div class="banner bad stack"><b>${rejected.length} registro(s) recusado(s) pelo servidor</b>${rejected.slice(0, 5).map(r => html`<span class="small">${r.table}: ${r.error}</span>`)}<div class="row"><button class="btn sm" type="button" data-action="retry">Tentar de novo</button><button class="btn ghost sm" type="button" data-action="discard">Descartar</button></div></div>` : ''}
          </div>
          <div class="card stack"><h2>Meus dados</h2>
            <p class="small">${counts.answers} respostas · ${counts.flashcards} flashcards · ${counts.flashcard_reviews} revisões · ${counts.notes} anotações · ${counts.study_sessions} sessões de estudo</p>
            <div class="row"><button class="btn ghost sm" type="button" data-action="export">Baixar meus dados (JSON)</button>${!auth.isLogged() ? html`<label class="btn ghost sm">Restaurar backup<input type="file" accept=".json,application/json" id="restore" hidden></label>` : ''}</div>
            <p class="muted small">Você pode consultar, corrigir (editando nas telas) e excluir seus dados a qualquer momento.</p>
            <div class="row"><button class="btn ghost sm" type="button" data-action="resetData">Apagar meu histórico de estudo</button>${auth.isLogged() ? html`<button class="btn danger sm" type="button" data-action="deleteAccount">Excluir minha conta</button>` : ''}</div>
          </div>
        </div>
      </div>`);
      const f = el.querySelector('#profileForm');
      if (f) f.onsubmit = async e => {
        e.preventDefault();
        const name = f.display_name.value.trim(); if (!name) return toast('Informe seu nome.');
        const { error } = await sb.from('profiles').update({ display_name: name, study_profile: f.study_profile.value, school_year: f.school_year.value.trim() || null }).eq('id', auth.state.user.id);
        if (error) return toast(friendlyError(error));
        await auth.loadProfile(); toast('Perfil salvo'); draw();
      };
      const r = el.querySelector('#restore');
      if (r) r.onchange = async () => {
        const file = r.files[0]; if (!file) return;
        try {
          const o = JSON.parse(await file.text());
          if (o.app !== 'educa-mais' || !o.tabelas) throw new Error();
          if (!(await confirmDialog(`Restaurar o backup de ${fmtDateTime(o.em)}? Os registros serão somados aos deste aparelho.`, { ok: 'Restaurar' }))) return;
          let n = 0;
          for (const [t, rows] of Object.entries(o.tabelas)) if (USER_TABLES[t]) { await store.putRaw(t, rows); n += rows.length; }
          toast(`${n} registros restaurados`); draw();
        } catch { toast('Este arquivo não é um backup válido da Educa Mais.'); }
      };
    };

    actions(el, {
      async logout() {
        // antes de sair, tenta enviar o que ainda falta
        if (navigator.onLine) await sync.syncNow().catch(() => {});
        const pending = await store.pendingCount();
        if (pending && !(await confirmDialog(`Há ${pending} alteração(ões) ainda não enviadas (sem internet?). Se sair agora, elas ficam guardadas neste aparelho até você entrar de novo. Sair mesmo assim?`, { ok: 'Sair' }))) return;
        try { await auth.signOut('local'); } catch (e) { toast(friendlyError(e)); }
        await ctx.leaveAccount(); toast('Você saiu da conta');
      },
      async password() {
        const fd = await formDialog('Alterar senha', html`<label class="f">Senha atual<input class="input" name="cur" type="password" autocomplete="current-password" required></label>
          <label class="f">Nova senha (8+ caracteres, letras e números)<input class="input" name="pw" type="password" autocomplete="new-password" required minlength="8" maxlength="72"></label>
          <label class="f">Repita a nova senha<input class="input" name="pw2" type="password" autocomplete="new-password" required></label>`,
          { validate: async f => {
            if (!strong(String(f.get('pw')))) return 'A nova senha precisa de 8+ caracteres, com letras e números.';
            if (f.get('pw') !== f.get('pw2')) return 'As senhas não são iguais.';
            try { await auth.changePassword(String(f.get('pw')), String(f.get('cur'))); } catch (e) { return friendlyError(e); }
            return null;
          } });
        if (fd) { toast('Senha alterada. Os outros aparelhos foram desconectados.'); draw(); }
      },
      async others() { try { await auth.signOutOthers(); toast('Outros aparelhos desconectados'); draw(); } catch (e) { toast(friendlyError(e)); } },
      async global() {
        if (!(await confirmDialog('Sair de todos os aparelhos, inclusive deste?', { ok: 'Sair de todos' }))) return;
        try { await auth.signOut('global'); } catch (e) { toast(friendlyError(e)); }
        await ctx.leaveAccount();
      },
      async syncNow() { await sync.syncNow({ content: true }); toast(sync.status.state === 'idle' ? 'Sincronizado' : 'Não foi possível sincronizar agora'); draw(); },
      async retry() { await sync.retryRejected(); draw(); },
      async discard() { if (await confirmDialog('Descartar os registros recusados? Eles não serão enviados.', { ok: 'Descartar', danger: true })) { await sync.discardRejected(); draw(); } },
      async export() {
        if (auth.isLogged() && navigator.onLine) {
          const { data, error } = await sb.rpc('export_my_data');
          if (error) return toast(friendlyError(error));
          download(`educa-mais-meus-dados-${dayKey()}.json`, JSON.stringify(data, null, 2));
        } else {
          const out = { app: 'educa-mais', v: 3, em: new Date().toISOString(), tabelas: {} };
          for (const t of Object.keys(USER_TABLES)) out.tabelas[t] = await store.allRaw(t);
          download(`educa-mais-backup-${dayKey()}.json`, JSON.stringify(out));
        }
        toast('Arquivo gerado');
      },
      async resetData() {
        if (!(await confirmDialog('Apagar todo o seu histórico de estudo (respostas, flashcards, revisões, anotações, cronograma, metas e sessões)? A conta continua existindo.', { ok: 'Apagar histórico', danger: true, typed: 'APAGAR' }))) return;
        if (auth.isLogged()) {
          const { error } = await sb.rpc('reset_my_study_data');
          if (error) return toast(friendlyError(error));
        }
        for (const t of Object.keys(USER_TABLES)) if (t !== 'user_settings') await store.clearRaw(t);
        await store.clearRaw('outbox'); await store.clearRaw('rejected');
        for (const t of Object.keys(USER_TABLES)) await store.meta.set('cur:' + t, '1970-01-01T00:00:00Z');
        toast('Histórico apagado'); draw();
      },
      async deleteAccount() {
        const fd = await formDialog('Excluir minha conta', html`<p>Isso apaga <b>definitivamente</b> sua conta e todos os seus dados. Não dá para desfazer. Recomendamos baixar seus dados antes.</p>
          <label class="f">Digite sua senha para confirmar<input class="input" name="pw" type="password" autocomplete="current-password" required></label>
          <label class="f">Digite EXCLUIR<input class="input" name="typed" autocomplete="off" required></label>`,
          { ok: 'Excluir para sempre', validate: async f => {
            if (String(f.get('typed')).trim().toUpperCase() !== 'EXCLUIR') return 'Digite EXCLUIR para confirmar.';
            try { await auth.verifyPassword(String(f.get('pw'))); } catch (e) { return e.message; }
            return null;
          } });
        if (!fd) return;
        const { error } = await sb.rpc('delete_my_account');
        if (error) return toast(friendlyError(error));
        await auth.signOut('local').catch(() => {});
        await ctx.leaveAccount(); toast('Conta excluída');
      }
    });
    await draw();
    return on('sync:status', () => { /* atualiza contadores sem redesenhar formulários abertos */ });
  }
};
