# ENEM 2024 e 2025: as provas ainda não estão na enem-api. Usa duas extrações independentes
# dos PDFs oficiais do INEP e só aceita a questão quando as duas concordam no gabarito.
# Questões que dependem de imagem (gráfico, mapa, tirinha...) ficam de fora, porque essas
# extrações vieram sem as imagens. Saída: scripts/.cache/enem-q/<ano>-<n>.json (formato enem-api).
import json, re, sys, html, difflib, urllib.request, pathlib
RAIZ = pathlib.Path(__file__).resolve().parents[2]
CACHE = RAIZ / 'scripts/.cache/enem-q'
FONTES = {
  'gab': 'https://raw.githubusercontent.com/LuanMartini/gabarita_app/main/assets/data/enem/enem_{ano}.json',
  'des': 'https://raw.githubusercontent.com/alexsantossp71-lgtm/desafio_enem/main/questoes/enem_{ano}.json',
}
IMAGEM = re.compile(r'\b(figura|gr[aá]fico|imagem|charge|tirinha|cartum|quadrinho|mapa|esquema|ilustra|fotografia|foto\b|cartaz|infogr[aá]fico|observe|representad[ao] (a seguir|abaixo|na)|tabela|quadro (a seguir|abaixo)|desenho|diagrama|pintura|obra (a seguir|apresentada)|anúncio|propaganda|capa)', re.I)

def baixar(url):
    with urllib.request.urlopen(url, timeout=120) as r: return json.load(r)

def limpa(s):
    s = html.unescape(s or '').replace('\r', '')
    s = re.sub(r'-\n(?=[a-zà-ú])', '', s)                    # hifenização de fim de linha
    s = re.sub(r'\n(?=[\.,;:\)])', '', s)                    # "Amazônica\n. São Paulo"
    linhas = [l.strip() for l in s.split('\n')]
    out = ''
    for l in linhas:
        if not l: out += '\n\n'; continue
        if not out or out.endswith('\n'): out += l
        elif re.search(r'[\.\?!:»”"]$', out) and re.match(r'[A-ZÀ-Ú0-9“"(—–-]', l) and len(l) < 60 and not re.match(r'[A-ZÀ-Ú][a-zà-ú]+ [a-zà-ú]', l): out += '\n' + l
        else: out += ' ' + l
    out = re.sub(r'[ \t]+', ' ', out); out = re.sub(r' ([\.,;:])', r'\1', out)
    out = re.sub(r'\s*\b(TEXTO [IVX]+)\b\s*', r'\n\n\1\n', out)                       # "TEXTO II" em linha própria
    out = re.sub(r'(\((?:adaptado|fragmento)\)\.|Acesso em: \d{1,2} [a-zç]{3,5}\.? ?\d{4}(?: \(adaptado\))?\.)\s+', r'\1\n\n', out)  # fim da citação
    out = re.sub(r'\n(?=[A-ZÀ-Ú][a-zà-ú]* ?[A-ZÀ-Ú]?[a-zà-ú]*\.? ?[A-ZÀ-Ú]?\.?\n)', ' ', out)
    return re.sub(r'\n{3,}', '\n\n', out).strip()

def chave(s): return re.sub(r'[^a-z0-9]', '', html.unescape(re.sub('<[^>]+>', ' ', s or '')).lower())

def main():
    CACHE.mkdir(parents=True, exist_ok=True)
    total = 0
    for ano in (2024, 2025):
        G = baixar(FONTES['gab'].format(ano=ano))['questions']
        D = baixar(FONTES['des'].format(ano=ano))['itens']
        dchaves = [(chave(' '.join(x['alternativas'])), x) for x in D if x.get('correta') is not None and len(x['alternativas']) == 5]
        aceitas = rej_img = rej_conf = 0
        for g in G:
            alts = g['alternatives']
            if len(alts) != 5 or not g.get('correctAlternative') or any(not (a.get('text') or '').strip() for a in alts): continue
            kg = chave(' '.join(a['text'] for a in alts))
            par, melhor = None, 0
            for kd, x in dchaves:
                r = difflib.SequenceMatcher(None, kg, kd, autojunk=False).quick_ratio()
                if r > melhor and r > 0.9 and difflib.SequenceMatcher(None, kg, kd, autojunk=False).ratio() > 0.9: par, melhor = x, r
            if not par: rej_conf += 1; continue
            certa_g = chave([a['text'] for a in alts if a['letter'] == g['correctAlternative']][0])
            certa_d = chave(par['alternativas'][par['correta']])
            if difflib.SequenceMatcher(None, certa_g, certa_d).ratio() < 0.9: rej_conf += 1; continue
            ctx = limpa(g['context']); intro = limpa(g.get('alternativesIntroduction'))
            if IMAGEM.search(ctx + ' ' + intro) or len(ctx) < 40: rej_img += 1; continue
            lang = g.get('language') if g['index'] <= 5 else None
            q = { 'title': f"Questão {g['index']} - ENEM {ano}", 'index': g['index'], 'year': ano, 'language': lang, 'discipline': g.get('discipline'),
                  'context': ctx, 'files': [], 'correctAlternative': g['correctAlternative'], 'alternativesIntroduction': intro,
                  'alternatives': [{ 'letter': a['letter'], 'text': limpa(a['text']), 'file': None, 'isCorrect': a['letter'] == g['correctAlternative'] } for a in alts],
                  'fonte': 'Extração dos cadernos oficiais do INEP conferida em duas fontes independentes' }
            (CACHE / f"{ano}-{g['index']}{'-' + lang if lang else ''}.json").write_text(json.dumps(q, ensure_ascii=False, indent=1))
            aceitas += 1
        total += aceitas
        print(f'ENEM {ano}: {aceitas} aceitas, {rej_img} dependem de imagem, {rej_conf} sem confirmação em duas fontes')
    print('total', total)
main()
