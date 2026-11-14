#!/usr/bin/env python3
"""Create standalone previews with embedded styles, scripts and localized images."""
from pathlib import Path
import base64
import mimetypes
import re

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'preview'
OUTPUT.mkdir(exist_ok=True)
js = (ROOT / 'assets/language.js').read_text()
for slug in ('support', 'privacy', 'gcamera'):
    source = ROOT / slug / 'index.html'
    html = source.read_text()
    def style(match):
        css = (source.parent / match[1]).resolve().read_text()
        return '<style>\n' + css + '\n</style>'
    html = re.sub(r'<link rel="stylesheet" href="([^"]+)">', style, html)
    html = html.replace('<script src="../assets/language.js"></script>', '<script>\n' + js + '\n</script>')
    def image_tag(match):
        def embed(attr):
            path = (source.parent / attr[2]).resolve()
            mime = mimetypes.guess_type(path.name)[0]
            data = base64.b64encode(path.read_bytes()).decode('ascii')
            return f'{attr[1]}="data:{mime};base64,{data}"'
        return re.sub(r'(?<![\w-])(src|data-ja|data-en)="([^"]+)"', embed, match[0])
    html = re.sub(r'<img\b[^>]*>', image_tag, html)
    for destination in ('support', 'privacy', 'gcamera'):
        html = html.replace(f'href="../{destination}/"', f'href="{destination}.html"')
    html = html.replace('href="../"', 'href="https://singo405.github.io/studio405-apps/"')
    target = OUTPUT / (slug + '.html')
    target.write_text(html)
    print('Created ' + str(target))
