#!/usr/bin/env python
"""Compila uma página Typst e rasteriza para PNG (150 dpi).
Uso: uv run --with typst python render.py <key>   (ex.: diario, semanal, bussola, pontes, ficha)
Avisa se o resultado tiver mais de 1 página (o alvo é 1 A5 por página)."""

import os
import subprocess
import sys

import typst

d = os.path.dirname(os.path.abspath(__file__))
key = sys.argv[1]
src = f"{d}/{key}.typ"
pdf = f"{d}/{key}.pdf"

typst.compile(src, output=pdf, root=d, font_paths=["/usr/share/fonts"])
for f in os.listdir(d):
    if f.startswith(f"{key}-") and f.endswith(".png"):
        os.remove(os.path.join(d, f))
subprocess.run(["pdftoppm", "-png", "-r", "150", pdf, f"{d}/{key}"], check=True)
pages = sorted(
    f for f in os.listdir(d) if f.startswith(f"{key}-") and f.endswith(".png")
)
status = (
    "OK (1 página)"
    if len(pages) == 1
    else f"ATENÇÃO: {len(pages)} páginas — comprima para caber em 1"
)
print(f"{key}: {os.path.getsize(pdf)} bytes; {pages}; {status}")
