// Definição das tabelas sincronizadas entre o aparelho (IndexedDB) e o banco (Supabase).
// Cada linha local tem "id". Algumas tabelas do banco usam outra chave
// (ex.: favoritos = user_id + question_id), por isso há conversões.

export const USER_TABLES = {
  user_settings: {
    kind: 'mutable', conflict: 'user_id', localId: () => 'me',
    cols: ['theme', 'color_primary', 'color_secondary', 'color_accent', 'device_mode', 'card_style', 'density', 'font_scale', 'reduce_motion',
      'home_sections', 'daily_goal_min', 'focus_minutes', 'short_break_min', 'long_break_min', 'last_view',
      'background', 'radius', 'font_family', 'custom_themes', 'protect_content', 'study_goal', 'updated_at'],
    fromRemote: r => ({ ...r, id: 'me' })
  },
  decks: { kind: 'mutable', conflict: 'id', cols: ['id', 'name', 'subject_id', 'color', 'is_favorite', 'kind', 'created_at', 'updated_at', 'deleted_at'] },
  flashcards: { kind: 'mutable', conflict: 'id', cols: ['id', 'deck_id', 'front', 'back', 'subject_id', 'is_favorite', 'source_question_id', 'ease', 'interval_days', 'repetitions', 'lapses', 'due_at', 'last_reviewed_at', 'created_at', 'updated_at', 'deleted_at'] },
  flashcard_reviews: { kind: 'append', conflict: 'id', cols: ['id', 'card_id', 'rating', 'interval_before', 'interval_after', 'reviewed_at'] },
  notes: { kind: 'mutable', conflict: 'id', cols: ['id', 'title', 'body', 'subject_id', 'is_favorite', 'created_at', 'updated_at', 'deleted_at'] },
  plan_tasks: { kind: 'mutable', conflict: 'id', cols: ['id', 'title', 'weekday', 'start_time', 'duration_min', 'done_on', 'subject_id', 'note', 'auto', 'created_at', 'updated_at', 'deleted_at'] },
  goals: {
    kind: 'mutable', conflict: 'user_id,kind', cols: ['kind', 'target', 'active', 'created_at', 'updated_at', 'deleted_at'],
    fromRemote: r => ({ ...r, id: r.kind })
  },
  favorites: {
    kind: 'mutable', conflict: 'user_id,question_id', cols: ['question_id', 'created_at', 'updated_at', 'deleted_at'],
    toRemote: r => ({ ...r, question_id: r.id }), fromRemote: r => ({ ...r, id: r.question_id })
  },
  exam_attempts: { kind: 'mutable', conflict: 'id', cols: ['id', 'title', 'filters', 'total', 'correct', 'started_at', 'finished_at', 'assignment_id', 'updated_at', 'deleted_at'] },
  answers: { kind: 'append', conflict: 'id', cols: ['id', 'question_id', 'option_id', 'time_spent_ms', 'used_hint', 'mode', 'exam_attempt_id', 'answered_at'] },
  study_sessions: { kind: 'append', conflict: 'id', cols: ['id', 'kind', 'subject', 'started_at', 'duration_sec'] },
  lesson_progress: {
    kind: 'mutable', conflict: 'user_id,lesson_id', cols: ['lesson_id', 'completed_at', 'created_at', 'updated_at', 'deleted_at'],
    toRemote: r => ({ ...r, lesson_id: r.id }), fromRemote: r => ({ ...r, id: r.lesson_id })
  }
};

// Ordem de envio respeita as chaves estrangeiras (baralho antes do cartão etc.)
export const PUSH_ORDER = ['user_settings', 'decks', 'flashcards', 'flashcard_reviews', 'notes', 'plan_tasks', 'goals', 'favorites', 'exam_attempts', 'answers', 'study_sessions', 'lesson_progress'];

// Conteúdo (somente leitura para alunos), guardado no aparelho para uso offline
export const CONTENT_TABLES = ['areas', 'subjects', 'topics', 'exam_boards', 'questions'];

export const ALL_STORES = [...Object.keys(USER_TABLES), ...CONTENT_TABLES, 'meta', 'outbox', 'rejected'];

/** Converte uma linha local para o formato do banco (apenas colunas permitidas). */
export function toRemote(table, row) {
  const def = USER_TABLES[table];
  const src = def.toRemote ? def.toRemote(row) : row;
  const out = {};
  for (const c of def.cols) if (src[c] !== undefined) out[c] = src[c];
  return out;
}

export function fromRemote(table, row) {
  const def = USER_TABLES[table];
  const r = def.fromRemote ? def.fromRemote(row) : { ...row };
  delete r.user_id; delete r.synced_at;
  return r;
}

/**
 * Decide o que fica no aparelho quando chega uma versão do servidor.
 * Regra: "última edição vence" (a mesma regra aplicada pelo banco).
 * Se há alteração local ainda não enviada e ela é mais nova, mantém a local.
 */
export function mergeRemote(local, remote, hasPending) {
  if (!local) return remote;
  if (hasPending && local.updated_at && remote.updated_at && new Date(local.updated_at) > new Date(remote.updated_at)) return local;
  if (!hasPending && local.updated_at && remote.updated_at && new Date(local.updated_at) > new Date(remote.updated_at)) return local;
  return { ...local, ...remote };
}
