#!/usr/bin/env python3
"""Create standalone previews from the current support/privacy pages and shared assets."""
from pathlib import Path
import re

ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / 'preview'
OUTPUT.mkdir(exist_ok=True)
css = (ROOT / 'assets/site.css').read_text()
js = (ROOT / 'assets/language.js').read_text()
for slug in ('support', 'privacy'):
    html = (ROOT / slug / 'index.html').read_text()
    html = html.replace('<link rel="stylesheet" href="../assets/site.css">', '<style>\n' + css + '\n</style>')
    html = html.replace('<script src="../assets/language.js"></script>', '<script>\n' + js + '\n</script>')
    html = html.replace('href="../support/"', 'href="support.html"')
    html = html.replace('href="../privacy/"', 'href="privacy.html"')
    html = html.replace('href="../"', 'href="https://singo405.github.io/studio405-apps/"')
    (OUTPUT / (slug + '.html')).write_text(html)
    print('Created ' + str(OUTPUT / (slug + '.html')))
