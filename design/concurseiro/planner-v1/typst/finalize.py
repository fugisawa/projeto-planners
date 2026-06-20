#!/usr/bin/env python
"""Monta o miolo (merge dos PDFs das páginas) e gera o PDF print-ready:
CMYK + PDF/X-1a com OutputIntent FOGRA39 (couché), via Ghostscript.

Uso:
  uv run --with pypdf python finalize.py                 # ordem-amostra padrão
  uv run --with pypdf python finalize.py diario          # só uma página (teste)
  uv run --with pypdf python finalize.py bussola semanal diario pontes ficha
"""

import os
import subprocess
import sys

D = os.path.dirname(os.path.abspath(__file__))
ICC = "/usr/share/color/icc/colord/FOGRA39L_coated.icc"
DEFPS = f"{D}/PDFX_def.ps"
# Ordem-amostra do protótipo (uma de cada). Produção monta o ciclo completo à parte.
ORDER = ["bussola", "semanal", "diario", "pontes", "ficha"]


def merge(order, out):
    from pypdf import PdfWriter

    w = PdfWriter()
    used = []
    for k in order:
        p = f"{D}/{k}.pdf"
        if os.path.exists(p):
            w.append(p)
            used.append(k)
        else:
            print(f"  (faltando: {k}.pdf — pulado)")
    with open(out, "wb") as f:
        w.write(f)
    print(f"merge: {used} -> {os.path.basename(out)} ({os.path.getsize(out)} bytes)")
    return out


def to_pdfx(src, out):
    cmd = [
        "gs",
        "-dNOSAFER",  # permite ler o ICC referenciado no PDFX_def.ps
        "-dPDFX",
        "-dBATCH",
        "-dNOPAUSE",
        "-dNOOUTERSAVE",
        "-sDEVICE=pdfwrite",
        "-dProcessColorModel=/DeviceCMYK",
        "-sColorConversionStrategy=CMYK",
        "-dPDFXSETBLEEDBOXTOMEDIABOX=true",
        f"-sOutputFile={out}",
        DEFPS,
        src,
    ]
    r = subprocess.run(cmd, capture_output=True, text=True)
    tail = (r.stdout or "")[-1200:] + (r.stderr or "")[-1200:]
    print(tail.strip())
    ok = os.path.exists(out) and os.path.getsize(out) > 0
    print(
        f"PDF/X-1a -> {os.path.basename(out)} {'OK' if ok else 'FALHOU'}"
        + (f" ({os.path.getsize(out)} bytes)" if ok else "")
    )
    return out if ok else None


def inkcov(pdf):
    """Confirma que o PDF está em CMYK (device inkcov reporta C M Y K por página)."""
    r = subprocess.run(
        ["gs", "-o", "-", "-sDEVICE=inkcov", pdf], capture_output=True, text=True
    )
    lines = [l for l in r.stdout.splitlines() if "CMYK" in l]
    print("inkcov (CMYK por página):")
    for l in lines:
        print("  ", l.strip())


if __name__ == "__main__":
    order = sys.argv[1:] or ORDER
    merged = merge(order, f"{D}/planner-proto-rgb.pdf")
    out = to_pdfx(merged, f"{D}/planner-proto-pdfx1a.pdf")
    if out:
        inkcov(out)
