---
name: typst-planner
description: Construir páginas de planner/caderno A5 print-ready com Typst (livre, in-house, sem InDesign/Affinity). Use ao desenhar/editar páginas dos planners (Concurseiro/Treino) ou qualquer miolo A5 que precise exportar CMYK PDF/X para gráfica. Cobre toolchain (Typst via uv, render→PNG p/ QA, Ghostscript CMYK/PDF-X FOGRA39), padrões de layout (grade de pintura contígua, encaixe em A5) e os gotchas. Validado em 2026-06-20.
---

# Typst para planners print-ready (A5)

Conhecimento prático para gerar páginas de planner **bonitas e prontas para gráfica**, por código, sem software pago.

## Toolchain (já instalado/validado)
- **Compilar:** Typst via `uv run --with typst python` (pacote `typst`). Sem instalar binário.
- **Helper de render:** `design/concurseiro/planner-v1/typst/render.py` → `uv run --with typst python render.py <pagina>` gera `<pagina>.pdf` + `<pagina>-1.png` (150 dpi) e **avisa se passar de 1 página**.
- **SEMPRE inspecionar:** compile → rasterize p/ PNG → **Read o PNG e olhe de verdade**. Nunca confie no código às cegas.

## Fontes
- Use fontes do sistema: `font_paths=['/usr/share/fonts']`. Boas e instaladas: **Lato** (humanista, quente, amigável — ótima p/ planner), Inter (grotesca), EB Garamond (serifa editorial).
- ⚠️ **Variable fonts NÃO funcionam** no typst-py (pega só um master, ex.: ExtraLight). Use famílias com **pesos estáticos** (Lato tem Regular/Medium/Semibold/Bold/Black). Confirme o peso embutido com `pdffonts out.pdf`.

## Estrutura de arquivos
`config.typ` (tokens) → `estilos.typ` (helpers reutilizáveis) → `<pagina>.typ` (compõe). Helpers **específicos** da página = locais; **não** edite config/estilos ao construir uma página (são compartilhados → quebram as outras).

## Padrões que funcionam
- **Página A5 + papel:** `#set page(width:148mm,height:210mm, margin:(left:18mm,right:11mm,top:11mm,bottom:11mm), fill:none)`. `fill:none` → o papel creme aparece; **NÃO floode cor de fundo** (desperdiça tinta; a cor vem do marca-texto do aluno). Margem interna maior reserva a espiral wire-o.
- **Grade de pintura CONTÍGUA (time-log):** células coladas (sem gutter), traço só nas células:
  ```typst
  table(columns: (5mm, 1fr,1fr,1fr,1fr,1fr,1fr), rows: 4mm,
    inset: (x,y) => if x==0 {(right: 1.2mm)} else {0pt},
    stroke: (x,y) => if x>=1 {(paint: grid-color, thickness: 0.4pt)} else {none},
    ..cells)   // por hora: 1 rótulo + 6 células de 10 min, contíguas
  ```
- **Amigável:** cantos arredondados `box/rect/block(radius: 1.6mm)`; faixa suave `block(fill: tint, radius: 2mm, inset:(x:3.5mm,y:3mm))`.

## ⚠️ GOTCHA crítico — overflow / encaixe em A5
`set par(spacing:…)` insere espaço ENTRE parágrafos. Listas via `for … [ #linha #v(..) ]` tratam cada item como parágrafo → o spacing default (~0.85em) **infla a lista e estoura a página**. Solução: `set par(leading: 0.6em, spacing: 0.4em)` e controle os gaps só com `v()` explícito. Confira o nº de páginas e aperte (altura de linha, `v()`, nº de linhas) até 1 página.

## Print-correctness (CMYK / PDF/X-1a / FOGRA39)
Typst ainda não exporta PDF/X (issue #6012) → pós-processar com **Ghostscript**.
- ICC **FOGRA39** (couché) já no sistema: `/usr/share/color/icc/colord/FOGRA39L_coated.icc`.
- **`-dNOSAFER` é OBRIGATÓRIO** (senão GS não lê o ICC do `PDFX_def.ps` → `/invalidfileaccess`).
- Receita pronta: `design/concurseiro/planner-v1/typst/finalize.py` (+ `PDFX_def.ps`):
  ```
  gs -dNOSAFER -dPDFX -dBATCH -dNOPAUSE -dNOOUTERSAVE -sDEVICE=pdfwrite \
     -dProcessColorModel=/DeviceCMYK -sColorConversionStrategy=CMYK \
     -dPDFXSETBLEEDBOXTOMEDIABOX=true -sOutputFile=out.pdf PDFX_def.ps in-rgb.pdf
  ```
- **Verificar CMYK:** `gs -o - -sDEVICE=inkcov in.pdf` (reporta C M Y K por página); conferir `GTS_PDFX`/`OutputIntent`/`FOGRA39` no binário.
- **Tinta:** texto corrido = **K100 puro**; preto rico = **C60 M40 Y40 K100** (TIC 240%, couché). Sangria 3 mm; marcas via `markly` ou a gráfica.
- Merge de páginas: `pypdf` (`PdfWriter.append`) → depois GS.

## Erros comuns
- Linter/formatter reescreve `.typ`/`.py` após o Write → **releia antes de Edit**.
- typst-py não erra com fonte ausente (fallback silencioso) → confirme com `pdffonts`.
- Não meta cor de fundo cheia; deixe o papel.
