#!/usr/bin/env python3
"""Fatiador de tiras-infográfico altas em blocos legíveis para leitura por IA.

Uso:
    uv run --with pillow python _slice.py <model_dir> [altura_tile=1500]

Fatia <model_dir>/detail/*.jpg em <model_dir>/_tiles/ (blocos de ~900-1000px de
largura × `altura_tile`, com sobreposição), preservando a ordem por prefixo do nome.
"""

import glob
import os
import sys

from PIL import Image


def slice_one(path, outdir, tileh=1500, overlap=120, maxw=1000):
    im = Image.open(path).convert("RGB")
    w, h = im.size
    if w > maxw:
        s = maxw / w
        im = im.resize((maxw, int(h * s)))
        w, h = im.size
    base = os.path.splitext(os.path.basename(path))[0]
    if h <= tileh:
        im.save(os.path.join(outdir, base + ".jpg"), quality=88)
        return 1
    n, y, i, step = 0, 0, 1, tileh - overlap
    while True:
        tile = im.crop((0, y, w, min(y + tileh, h)))
        tile.save(os.path.join(outdir, f"{base}_t{i:02d}.jpg"), quality=88)
        n += 1
        if y + tileh >= h:
            break
        y += step
        i += 1
    return n


if __name__ == "__main__":
    model_dir = sys.argv[1]
    tileh = int(sys.argv[2]) if len(sys.argv) > 2 else 1500
    det = os.path.join(model_dir, "detail")
    out = os.path.join(model_dir, "_tiles")
    os.makedirs(out, exist_ok=True)
    total = 0
    for f in sorted(glob.glob(os.path.join(det, "*.jpg"))):
        total += slice_one(f, out, tileh)
    print(f"{os.path.basename(model_dir.rstrip('/'))}: {total} tiles -> {out}")
