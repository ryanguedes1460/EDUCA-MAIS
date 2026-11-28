# Converte as imagens das questões do ENEM para WebP (máx. 900 px de largura).
# Uso: python3 scripts/provas/converter_imagens.py lista.json
# lista.json: [[origem, destino], ...]. Precisa do Pillow (pip install pillow).
import json, os, sys
from concurrent.futures import ThreadPoolExecutor
from PIL import Image

def converter(par):
    src, dst = par
    if os.path.exists(dst): return
    os.makedirs(os.path.dirname(dst), exist_ok=True)
    im = Image.open(src)
    if im.mode in ('P', 'LA', 'RGBA'):
        im = im.convert('RGBA'); fundo = Image.new('RGB', im.size, 'white'); fundo.paste(im, mask=im.split()[3]); im = fundo
    else:
        im = im.convert('RGB')
    if im.width > 900: im = im.resize((900, round(im.height * 900 / im.width)), Image.LANCZOS)
    im.save(dst, 'WEBP', quality=72, method=5)

with ThreadPoolExecutor(8) as ex: list(ex.map(converter, json.load(open(sys.argv[1]))))
