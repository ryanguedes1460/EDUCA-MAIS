// Objetivo do aluno (perguntado no primeiro acesso) e plano para chegar à nota de corte.
// Sem dependências de tela: testado em tests/unidade.
//
// IMPORTANTE: as notas de corte daqui são REFERÊNCIAS APROXIMADAS para orientar o estudo.
// Elas mudam a cada edição, por curso, campus, turno e cota. O aluno sempre pode digitar
// a nota de corte real que encontrou no SISU ou no edital.

export const TIPOS = {
  enem: { nome: 'ENEM e faculdade (SISU, ProUni, Fies)', icone: '🎓', escala: 'enem' },
  vestibular: { nome: 'Vestibular próprio de uma universidade', icone: '🏛️', escala: 'pct' },
  concurso: { nome: 'Concurso público', icone: '🏢', escala: 'pct' },
  escola: { nome: 'Escola (fundamental ou médio)', icone: '🏫', escala: 'media' }
};

// Instituições do Maranhão e da região que recebem nota do ENEM
export const FACULDADES = [
  'UFMA (Universidade Federal do Maranhão)', 'UEMA (Universidade Estadual do Maranhão)', 'UEMASUL (Universidade Estadual da Região Tocantina do Maranhão)',
  'IFMA (Instituto Federal do Maranhão)', 'UFPI (Universidade Federal do Piauí)', 'UESPI (Universidade Estadual do Piauí)', 'UFPA (Universidade Federal do Pará)',
  'UFT (Universidade Federal do Tocantins)', 'UFNT (Universidade Federal do Norte do Tocantins)', 'Faculdade particular (ProUni ou Fies)', 'Outra instituição'
];

export const VESTIBULARES = [
  { id: 'paes-uema', nome: 'PAES/UEMA', banca: 'Estilo PAES/UEMA', detalhe: 'Processo seletivo próprio da UEMA' },
  { id: 'uemasul', nome: 'Vestibular da UEMASUL', banca: 'Estilo vestibular UEMASUL', detalhe: 'Imperatriz, Açailândia e região tocantina' },
  { id: 'ifma', nome: 'Seletivo do IFMA (cursos técnicos)', banca: 'Estilo seletivo IFMA', detalhe: 'Português e Matemática do ensino fundamental' },
  { id: 'ufma', nome: 'UFMA (pelo ENEM e SISU)', banca: 'INEP (ENEM)', detalhe: 'A UFMA usa a nota do ENEM' },
  { id: 'uespi', nome: 'UESPI', banca: 'Estilo UFPI', detalhe: 'Piauí' },
  { id: 'unitins', nome: 'UNITINS', banca: 'Estilo UNITINS', detalhe: 'Tocantins' },
  { id: 'outro', nome: 'Outro vestibular', banca: null, detalhe: '' }
];

export const CONCURSOS = [
  { id: 'pref-ma', nome: 'Prefeituras do Maranhão', banca: ['Estilo concursos de prefeituras', 'Estilo concursos do Maranhão'], mats: ['Português', 'Raciocínio lógico', 'Conhecimentos do Maranhão', 'Direito', 'Informática', 'Atendimento ao público'] },
  { id: 'estado-ma', nome: 'Governo do Maranhão (SEDUC, SES, órgãos estaduais)', banca: ['Estilo concursos do Maranhão'], mats: ['Português', 'Conhecimentos do Maranhão', 'Direito', 'Raciocínio lógico', 'Informática'] },
  { id: 'seguranca-ma', nome: 'Segurança no Maranhão (PM, Bombeiros, Polícia Civil)', banca: ['Estilo concursos do Maranhão'], mats: ['Português', 'Direito', 'Conhecimentos do Maranhão', 'Raciocínio lógico', 'Informática'] },
  { id: 'tribunais-ma', nome: 'Tribunais e Ministério Público do Maranhão', banca: ['Estilo concursos do Maranhão'], mats: ['Português', 'Direito', 'Raciocínio lógico', 'Informática', 'Conhecimentos do Maranhão'] },
  { id: 'piaui', nome: 'Concursos do Piauí', banca: ['Estilo concursos do Piauí', 'Estilo concursos de prefeituras'], mats: ['Português', 'Raciocínio lógico', 'Conhecimentos regionais', 'Direito', 'Informática'] },
  { id: 'para', nome: 'Concursos do Pará', banca: ['Estilo concursos do Pará', 'Estilo concursos de prefeituras'], mats: ['Português', 'Raciocínio lógico', 'Conhecimentos regionais', 'Direito', 'Informática'] },
  { id: 'tocantins', nome: 'Concursos do Tocantins', banca: ['Estilo concursos do Tocantins', 'Estilo concursos de prefeituras'], mats: ['Português', 'Raciocínio lógico', 'Conhecimentos regionais', 'Direito', 'Informática'] },
  { id: 'federal', nome: 'Concursos federais', banca: ['Cebraspe', 'FGV'], mats: ['Português', 'Raciocínio lógico', 'Direito', 'Informática'] },
  { id: 'outro', nome: 'Outro concurso', banca: [], mats: ['Português', 'Raciocínio lógico', 'Direito', 'Informática'] }
];

// Referência aproximada (média do ENEM, ampla concorrência, universidades públicas do Nordeste).
export const CORTES_ENEM = [
  ['Medicina', 790], ['Odontologia', 740], ['Direito', 720], ['Psicologia', 720], ['Engenharias', 690], ['Ciência da Computação', 700],
  ['Arquitetura e Urbanismo', 700], ['Enfermagem', 700], ['Farmácia', 690], ['Fisioterapia', 690], ['Nutrição', 690], ['Medicina Veterinária', 710],
  ['Jornalismo e Comunicação', 670], ['Administração', 650], ['Ciências Contábeis', 650], ['Economia', 650], ['Educação Física', 640],
  ['Pedagogia', 610], ['Licenciaturas (Letras, História, Geografia, Matemática...)', 600], ['Cursos tecnológicos', 580], ['Outro curso', 650]
];
export const corteSugerido = curso => (CORTES_ENEM.find(([c]) => c === curso) || [])[1] || null;

export const AREAS_ENEM = [
  ['lc', 'Linguagens', ['Português', 'Literatura', 'Inglês', 'Espanhol', 'Artes', 'Educação Física']],
  ['ch', 'Ciências Humanas', ['História', 'Geografia', 'Sociologia', 'Filosofia']],
  ['cn', 'Ciências da Natureza', ['Biologia', 'Física', 'Química']],
  ['mt', 'Matemática', ['Matemática', 'Raciocínio lógico']],
  ['red', 'Redação', []]
];

export const MATERIAS_ESCOLHA = ['Português', 'Redação', 'Literatura', 'Inglês', 'Espanhol', 'Matemática', 'Física', 'Química', 'Biologia', 'História', 'Geografia',
  'Filosofia', 'Sociologia', 'Raciocínio lógico', 'Direito', 'Informática', 'Conhecimentos do Maranhão', 'Conhecimentos regionais', 'Atendimento ao público'];

export const DIFICULDADES_GERAIS = ['Falta de tempo', 'Concentração', 'Ansiedade na prova', 'Interpretação de texto', 'Contas e cálculos', 'Decorar conteúdo', 'Organizar os estudos', 'Terminar a prova no tempo'];

const num = v => { const t = String(v ?? '').trim().replace(',', '.'); if (!t) return null; const n = Number(t); return Number.isFinite(n) ? n : null; };
const media = arr => { const v = arr.filter(x => x != null); return v.length ? v.reduce((a, b) => a + b, 0) / v.length : null; };

/** Limpa o que veio da tela: só campos conhecidos, textos curtos e números dentro da escala. */
export function normalizar(o = {}) {
  const tipo = TIPOS[o.tipo] ? o.tipo : 'enem';
  const escala = TIPOS[tipo].escala;
  const max = escala === 'enem' ? 1000 : escala === 'pct' ? 100 : 10;
  const nota = v => { const n = num(v); return n == null || n < 0 || n > max ? null : Math.round(n * 10) / 10; };
  const txt = (v, n = 120) => String(v ?? '').replace(/[\u0000-\u001f]/g, ' ').trim().slice(0, n) || null;
  const lista = (v, n) => (Array.isArray(v) ? v : []).map(x => txt(x, 60)).filter(Boolean).slice(0, n);
  const notas = {};
  if (escala === 'enem') for (const [k] of AREAS_ENEM) { const v = nota(o.notas?.[k]); if (v != null) notas[k] = v; }
  return {
    v: 1, tipo,
    prova: txt(o.prova), instituicao: txt(o.instituicao), curso: txt(o.curso, 80),
    data_prova: /^\d{4}-\d{2}-\d{2}$/.test(o.data_prova || '') ? o.data_prova : null,
    dificuldades: lista(o.dificuldades, 12), outras: lista(o.outras, 8), obs: txt(o.obs, 500),
    ja_fez: !!o.ja_fez, ano_anterior: o.ja_fez ? (num(o.ano_anterior) >= 2000 && num(o.ano_anterior) <= 2100 ? num(o.ano_anterior) : null) : null,
    notas: o.ja_fez ? notas : {}, nota_geral: o.ja_fez ? nota(o.nota_geral) : null,
    meta: nota(o.meta), meta_fonte: o.meta_fonte === 'informada' ? 'informada' : 'estimativa',
    horas_semana: Math.min(80, Math.max(1, Math.round(num(o.horas_semana) || 10))),
    criado_em: o.criado_em || new Date().toISOString()
  };
}

/** Nota atual: média das áreas (ENEM) ou nota geral informada. */
export function notaAtual(o) {
  if (!o) return null;
  if (TIPOS[o.tipo]?.escala === 'enem') {
    const m = media(AREAS_ENEM.map(([k]) => o.notas?.[k] ?? null));
    return m != null ? Math.round(m) : o.nota_geral;
  }
  return o.nota_geral;
}

/**
 * Monta o plano: quanto falta, peso de cada matéria e horas por semana.
 * desempenho: { 'Matemática': { ok, n } } (acertos nas questões da plataforma).
 */
export function montarPlano(o, desempenho = {}, hoje = new Date()) {
  if (!o) return null;
  const escala = TIPOS[o.tipo]?.escala || 'enem';
  const atual = notaAtual(o);
  const meta = o.meta;
  const falta = meta != null && atual != null ? Math.max(0, Math.round((meta - atual) * 10) / 10) : null;
  const semanas = o.data_prova ? Math.max(1, Math.ceil((new Date(o.data_prova + 'T12:00:00') - hoje) / (7 * 864e5))) : null;

  // Matérias e o peso de cada uma
  let mats;
  if (o.tipo === 'concurso') mats = (CONCURSOS.find(c => c.nome === o.prova) || CONCURSOS.at(-1)).mats.map((m, i) => [m, 5 - Math.min(3, i)]);
  else if (o.tipo === 'escola') mats = [['Matemática', 3], ['Português', 3], ['Ciências', 2], ['História', 1], ['Geografia', 1], ['Inglês', 1]];
  else if (o.prova && /IFMA/.test(o.prova)) mats = [['Português', 4], ['Matemática', 4]];
  else mats = [['Matemática', 3], ['Português', 3], ['Redação', 2], ['Biologia', 2], ['Química', 2], ['Física', 2], ['História', 2], ['Geografia', 2], ['Literatura', 1], ['Inglês', 1], ['Sociologia', 1], ['Filosofia', 1]];

  // Áreas com nota mais baixa (ENEM) ganham peso
  const fraquezas = [];
  if (escala === 'enem' && Object.keys(o.notas || {}).length) {
    const vals = AREAS_ENEM.filter(([k]) => o.notas[k] != null).map(([k, nome, ms]) => ({ k, nome, ms, v: o.notas[k] }));
    const ref = meta ?? media(vals.map(x => x.v));
    for (const a of vals.sort((x, y) => x.v - y.v)) {
      const gap = ref - a.v;
      if (gap > 0) fraquezas.push({ area: a.nome, nota: a.v, falta: Math.round(gap) });
      const extra = gap > 120 ? 3 : gap > 60 ? 2 : gap > 0 ? 1 : 0;
      for (const m of (a.k === 'red' ? ['Redação'] : a.ms)) { const it = mats.find(x => x[0] === m); if (it) it[1] += extra; }
    }
  }
  // Matérias marcadas como difíceis e com acerto baixo na plataforma
  for (const it of mats) {
    if ((o.dificuldades || []).includes(it[0])) it[1] += 2;
    const d = desempenho[it[0]];
    if (d && d.n >= 10) it[1] += d.ok / d.n < 0.5 ? 2 : d.ok / d.n < 0.7 ? 1 : 0;
  }
  for (const m of o.dificuldades || []) if (!mats.find(x => x[0] === m) && MATERIAS_ESCOLHA.includes(m)) mats.push([m, 3]);

  const soma = mats.reduce((a, [, p]) => a + p, 0);
  const horas = o.horas_semana || 10;
  const distrib = mats.map(([m, p]) => ({ materia: m, peso: p, horas: Math.round(horas * p / soma * 2) / 2 })).sort((a, b) => b.peso - a.peso);

  // Ritmo: quanto subir por semana para chegar na meta
  const porSemana = falta != null && semanas ? Math.round(falta / semanas * 10) / 10 : null;
  const unidade = escala === 'enem' ? 'pontos' : escala === 'pct' ? 'pontos percentuais' : 'pontos';
  const questoesSemana = Math.max(30, Math.round(horas * 6));
  const passos = [];
  if (falta === 0) passos.push('Você já está na meta: o foco agora é manter o ritmo e não cair de nível.');
  if (falta && porSemana) passos.push(`Subir cerca de ${String(porSemana).replace('.', ',')} ${unidade} por semana até a prova.`);
  passos.push(`Resolver cerca de ${questoesSemana} questões por semana, priorizando ${distrib.slice(0, 3).map(d => d.materia).join(', ')}.`);
  if (escala === 'enem') passos.push('Fazer um simulado com nota estilo TRI a cada 15 dias para medir a evolução.');
  if (escala === 'enem' && (o.notas?.red == null || (meta && o.notas.red < meta))) passos.push('Escrever uma redação por semana e revisar pelas cinco competências.');
  if (o.tipo === 'concurso') passos.push('Ler o edital e marcar o que cai; resolver questões no estilo da banca e revisar a lei seca.');
  if ((o.outras || []).includes('Ansiedade na prova')) passos.push('Treinar com o cronômetro na Sala de foco para acostumar com o tempo de prova.');
  if ((o.outras || []).includes('Falta de tempo')) passos.push('Usar blocos curtos de 25 minutos (Pomodoro) nos dias mais corridos.');
  if ((o.outras || []).includes('Interpretação de texto')) passos.push('Começar cada sessão com 5 questões de interpretação de texto.');
  return { atual, meta, falta, semanas, porSemana, unidade, escala, distrib, fraquezas, passos, horas };
}

/** Transforma o plano no edital do cronograma automático ("Matéria: peso"). */
export const editalDoPlano = p => (p?.distrib || []).map(d => `${d.materia}: ${Math.min(9, Math.max(1, d.peso))}`).join('\n');
