"""Renderiza os documentos jurídicos (acordo, INPI, LGPD) com estilo formal neutro
(diferente do briefing analítico). Gera os .html prontos para render.py."""

import markdown as md

HERE = "/home/daniel/planners/deliverables"
DOCS = ["acordo-de-socios-minuta", "ip-marca-inpi", "lgpd-privacidade-termos"]

CSS = """
@page { size: A4; margin: 18mm 18mm 16mm;
  @bottom-center { content: "Projeto Planners · documento-modelo — revisar com advogado(a) · p. " counter(page);
    font-family: 'Inter','Liberation Sans',sans-serif; font-size: 8pt; color: #94a3b8; } }
* { box-sizing: border-box; }
body { font-family: 'EB Garamond','Liberation Serif',serif; font-size: 12pt; line-height: 1.5;
  color: #1f2937; margin: 0; }
h1 { font-size: 22pt; color: #0f172a; margin: 0 0 2pt; line-height: 1.15; }
h1 + h3 { color: #64748b; font-weight: 600; margin: 0 0 6pt; font-size: 12.5pt; }
h2 { font-size: 14pt; color: #1e3a5f; margin: 17pt 0 5pt; border-bottom: 1px solid #e2e8f0;
  padding-bottom: 2pt; break-after: avoid; }
h3 { font-size: 12.5pt; color: #1e3a5f; margin: 12pt 0 4pt; break-after: avoid; }
p { margin: 0 0 7pt; }
strong { color: #0f172a; }
blockquote { background: #fffbeb; border-left: 4px solid #d97706; padding: 8pt 13pt;
  border-radius: 6px; margin: 11pt 0; color: #78350f; break-inside: avoid; }
blockquote p { margin: 0 0 4pt; }
blockquote p:last-child { margin: 0; }
table { width: 100%; border-collapse: collapse; font-size: 10.5pt; margin: 9pt 0; break-inside: avoid; }
th, td { border: 1px solid #cbd5e1; padding: 4pt 8pt; text-align: left; vertical-align: top; }
th { background: #f1f5f9; color: #0f172a; }
ul, ol { padding-left: 20pt; margin: 0 0 8pt; } li { margin-bottom: 3pt; }
hr { border: none; border-top: 1px solid #e2e8f0; margin: 15pt 0; }
code { background: #f1f5f9; padding: 0 3px; border-radius: 3px; font-size: 10.5pt;
  font-family: 'Inter','Liberation Mono',monospace; color: #b91c1c; }
</style>"""  # noqa

for slug in DOCS:
    src = open(f"{HERE}/{slug}.md", encoding="utf-8").read()
    body = md.markdown(src, extensions=["tables", "sane_lists"])
    html = (
        '<!DOCTYPE html><html lang="pt-BR"><head><meta charset="UTF-8">'
        "<style>" + CSS + "\n<body>" + body + "</body></html>"
    )
    open(f"{HERE}/{slug}.html", "w", encoding="utf-8").write(html)
    print("html:", slug)
print("OK")
