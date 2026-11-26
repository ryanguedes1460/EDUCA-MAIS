// Gerador do cronograma automático (sem dependências de tela, testado em tests/unidade).
// Objetivos com as matérias e o peso de cada uma (quanto maior, mais blocos na semana)
export const OBJETIVOS = {
  enem: { nome: 'ENEM', mats: [['Matemática', 4], ['Português', 3], ['Redação', 2], ['Biologia', 2], ['Química', 2], ['Física', 2], ['História', 2], ['Geografia', 2], ['Literatura', 1], ['Inglês', 1], ['Sociologia', 1], ['Filosofia', 1]] },
  vestibular: { nome: 'Vestibular (FUVEST, Unicamp, UFPR, UFPE, UFAM e outros)', mats: [['Matemática', 4], ['Português', 3], ['Literatura', 2], ['Física', 3], ['Química', 3], ['Biologia', 3], ['História', 2], ['Geografia', 2], ['Inglês', 1], ['Redação', 2]] },
  medio: { nome: 'Ensino médio (provas da escola)', mats: [['Matemática', 3], ['Português', 3], ['Física', 2], ['Química', 2], ['Biologia', 2], ['História', 2], ['Geografia', 2], ['Inglês', 1], ['Literatura', 1]] },
  fundamental: { nome: 'Ensino fundamental', mats: [['Matemática', 3], ['Português', 3], ['Ciências', 2], ['História', 1], ['Geografia', 1], ['Inglês', 1]] },
  concurso: { nome: 'Concurso público', mats: [['Português', 4], ['Raciocínio lógico', 3], ['Direito', 3], ['Matemática', 1]] }
};

/** Distribui as matérias pelos dias e horários livres, intercalando para não repetir a mesma matéria seguida. */
export function montarCronograma({ objetivo = 'enem', edital = '', dias, inicio = '19:00', horas = 2, bloco = 50, materias = [] }) {
  let lista = edital.split(/\n+/).map(l => l.trim()).filter(Boolean).map(l => { const m = l.match(/^(.*?)[:\-–]\s*(\d+)\s*$/); return m ? [m[1].trim(), Math.min(9, Math.max(1, +m[2]))] : [l.replace(/[:\-–]\s*$/, ''), 1]; }).filter(([n]) => n.length >= 2).slice(0, 30);
  if (!lista.length) lista = (OBJETIVOS[objetivo] || OBJETIVOS.enem).mats;
  const porDia = Math.max(1, Math.floor(horas * 60 / (bloco + 10)));
  const total = porDia * dias.length;
  const soma = lista.reduce((a, [, p]) => a + p, 0);
  // quantos blocos cada matéria recebe (pelo menos 1 se couber)
  const fila = [];
  const cotas = lista.map(([n, p]) => ({ n, q: Math.max(1, Math.round(total * p / soma)) }));
  while (fila.length < total && cotas.some(c => c.q > 0)) for (const c of cotas) if (c.q > 0 && fila.length < total) { fila.push(c.n); c.q--; }
  while (fila.length < total) fila.push('Revisão e flashcards');
  const [h0, m0] = String(inicio).split(':').map(Number);
  const out = []; let k = 0;
  for (const d of dias) {
    let min = (h0 || 0) * 60 + (m0 || 0);
    const doDia = [];
    for (let i = 0; i < porDia; i++) {
      let nome = fila[k++];
      if (doDia.includes(nome)) { const j = fila.findIndex((x, idx) => idx >= k && !doDia.includes(x)); if (j >= 0) { [fila[j], fila[k - 1]] = [fila[k - 1], fila[j]]; nome = fila[k - 1]; } }
      doDia.push(nome);
      const ultimoDia = d === Math.max(...dias) && i === porDia - 1 && dias.length >= 3;
      const titulo = ultimoDia ? 'Simulado da semana' : nome;
      const mat = materias.find(s => s.name.toLowerCase() === String(nome).toLowerCase());
      out.push({ title: titulo.slice(0, 60), weekday: d, start_time: `${String(Math.floor(min / 60) % 24).padStart(2, '0')}:${String(min % 60).padStart(2, '0')}`, duration_min: bloco, subject_id: ultimoDia ? null : mat?.id ?? null, note: null });
      min += bloco + 10;
    }
  }
  return out;
}
