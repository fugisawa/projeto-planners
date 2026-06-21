---
name: typst-planner
description: |
  Constrói e edita páginas de planner/caderno A5 print-ready com Typst (pipeline open-source, sem
  InDesign/Affinity). Use ao desenhar/alterar páginas dos planners Concurseiro/Treino, ou qualquer
  miolo A5 que precise sair como PDF CMYK para gráfica. Acione para: compilar .typ → PDF → PNG (QA
  visual), configurar tokens/fontes, lista de estudo estilo INDIGO, time-log com hierarquia de fios,
  figuras tabulares, ou pós-processar com Ghostscript (CMYK/PDF-X FOGRA39). Cobre toolchain, padrões
  2.0 provados, packages e gotchas. Validado em 2026-06-20 (atualizado p/ o 2.0 PRO).
---

# Typst para planners print-ready (A5) — 2.0 PRO

Conhecimento prático destilado do protótipo real em `design/concurseiro/planner-v1/typst/`.
Todo padrão aqui foi compilado, inspecionado e impresso (CMYK/PDF-X). Design: skill `planner-designer`.

## 1 · Toolchain (instalado e validado)
| Passo | Comando | Nota |
|---|---|---|
| Compilar | `uv run --with typst python render.py <pagina>` | `typst.compile()` → `<pagina>.pdf`; PNG via `pdftoppm` (poppler) → `<pagina>-1.png` 150 dpi |
| QA visual | Read o PNG | **obrigatório** — nunca confie no código sem olhar |
| Fontes | `pdffonts <pagina>.pdf` | confirma peso estático embutido |
| Merge + CMYK | `uv run --with pypdf python finalize.py [<key>…]` | junta PDFs → GS PDF/X-1a FOGRA39 |
| CMYK ok? | `gs -o - -sDEVICE=inkcov a.pdf` | reporta C M Y K por página |

Scripts: `render.py`, `finalize.py`, `PDFX_def.ps` (no dir typst/).
Compilação do PDF: `typst.compile(src, output=pdf, root=d, font_paths=["/usr/share/fonts"])`.
**Rasterização do PNG (QA):** `render.py` chama `pdftoppm` (poppler) — **não** é o Typst. Pré-requisito:
`poppler-utils` instalado (`apt install poppler-utils`). Sem ele, o PDF gera mas o PNG falha.

## 2 · Arquitetura de arquivos
```
config.typ   ← tokens (CMYK, fonte, medidas) — compartilhado, NÃO editar ao montar 1 página
estilos.typ  ← helpers (importa config) — compartilhado, NÃO editar ao montar 1 página
<pagina>.typ ← compõe com os helpers; helpers ESPECÍFICOS da página ficam locais aqui
render.py · finalize.py · PDFX_def.ps
```
Helpers atuais em `estilos.typ`: `planner-page`, `masthead`, `sechead`, `softhead`, `fieldcol`,
`timeblock`, `studyrows`, `chip`, `colorsq`, `checkbox`, `softband`, `wline`, `dot`, `seclbl`.

## 3 · Padrões provados (copiar)

### 3.1 Página (figuras tabulares + papel limpo)
```typst
#let planner-page(body) = {
  set page(width: 148mm, height: 210mm,
    margin: (left: 18mm, right: 11mm, top: 11mm, bottom: 11mm), fill: none) // fill:none = papel
  set text(font: "Lato", size: 9.5pt, fill: cmyk(0%,0%,0%,88%), lang: "pt",
    number-width: "tabular")   // ← figuras tabulares: números alinham em coluna
  set par(leading: 0.6em, spacing: 0.4em)
  body
}
```

### 3.2 Anti-overflow
No topo de cada página: `#show: planner-page` + `#set par(spacing: 0pt)`; todos os gaps via `v()`.
(`par.spacing` infla listas-de-parágrafo e estoura a A5.)

### 3.3 Time-log: 6 células/hora contíguas + HIERARQUIA de fios
```typst
table(columns: (5mm, 1fr,1fr,1fr,1fr,1fr,1fr), rows: 4.5mm,
  inset: (x,y) => if x==0 { (right: 1.2mm) } else { 0pt },
  align: center + horizon,
  stroke: (x,y) => if x >= 1 {
    (left: (paint: grid-c, thickness: 0.3pt), right: (paint: grid-c, thickness: 0.3pt),  // 10-min quietas
     top: (paint: grid-h, thickness: 0.5pt), bottom: (paint: grid-h, thickness: 0.5pt))  // hora mais forte
  } else { none },
  ..cells)  // 1 rótulo de hora (tabular) + 6 células
```

### 3.4 Tokens 2.0 (de config.typ)
```typst
#let ink=cmyk(0%,0%,0%,88%)  #let ink-2=cmyk(32%,16%,0%,56%)  #let ink-3=cmyk(28%,12%,0%,40%)
#let title-c=cmyk(68%,44%,0%,48%)  // azul-ardósia — TÍTULOS
#let accent=cmyk(52%,22%,0%,4%)    // acento pontual
#let grid-c=cmyk(16%,7%,0%,5%)  #let grid-h=cmyk(22%,10%,0%,15%)  // grade quieta + linha de hora
#let band=cmyk(9%,4%,0%,3%)  #let hair=cmyk(20%,9%,0%,20%)
```

### 3.5 Masthead 2.0 (título + tab de acento + eyebrow)
```typst
#let masthead(title, kicker: none) = {
  grid(columns: (1fr, auto), align: (left+bottom, right+bottom),
    text(font:"Lato", size: 18pt, fill: title-c, weight: 900, tracking: -0.1pt)[#title],
    if kicker != none { text(size: 6.5pt, fill: ink-3, tracking: 1.5pt)[#upper(kicker)] })
  v(2mm)
  box(width: 100%, height: 2pt)[                          // hairline + "tab" de acento à esquerda
    #place(left+horizon, line(length: 100%, stroke: (paint: hair, thickness: 0.4pt)))
    #place(left+horizon, line(length: 14mm, stroke: (paint: accent, thickness: 2pt)))]
  v(3mm)
}
```
Página sem título grande (Diário): use só o eyebrow + tab; e `softhead` (8.5pt ink-2) nas seções.

### 3.6 Lista de escrita estilo INDIGO (`studyrows`) — NÃO chip-box, NÃO dot-grid
```typst
// [matéria/sigla] │ divisória vertical │ tarefa (pauta = fio inferior) │ ○
#let studyrows(n, rh: 5.6mm, subjw: 15mm) = {
  let cells = ()
  for i in range(n) {
    cells.push([]); cells.push([])
    cells.push(align(center+horizon, circle(radius: 1.9mm, stroke: (paint: hair, thickness: 0.6pt))))
  }
  table(columns: (subjw, 1fr, 6mm), rows: rh, align: horizon, inset: (x: 1.6mm, y: 0pt),
    stroke: (x,y) => (bottom: (paint: hair, thickness: 0.4pt),
                      right: if x==0 { (paint: hair, thickness: 0.4pt) } else { none }),
    ..cells)
}
```
**Alinhamento:** se a lista estiver dentro de uma faixa (Revisar), a faixa tem de ser **largura
cheia (inset x:0)** para a divisória alinhar com a lista irmã (Estudar). Linhas de campo
(Questões/Acertos…) usam `align: bottom` no grid → ficam na **base do texto**.

### 3.7 Cantos: TUDO RETO (consistência)
Células/quadrados/chips/checkboxes/faixas = canto reto. Só círculos redondos.
```typst
#let chip = box(width: 8mm, height: 5mm, stroke: (paint: hair, thickness: 0.6pt))      // reto
#let checkbox = box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, stroke: (paint: hair, thickness: 0.6pt)))
#let softband(body) = block(width: 100%, fill: band, inset: (x: 3.5mm, y: 3mm), body)   // sem radius
```
**Faixa × `softband`:** o helper `softband` tem `inset x: 3.5mm` (recuo lateral) — bom para caixas
autônomas (reflexão). Mas faixa que contém `studyrows`/listas a alinhar com a lista irmã usa
`block(width:100%, fill: band, inset:(x:0mm, y:2.5mm))` — **x:0** para a divisória alinhar (ver G6).
O Diário usa esse `block` inline, não `softband`.

## 4 · Fontes
**Lato** (instalada): Regular/Medium/SemiBold/Bold/**Black 900**. Inter, EB Garamond também.
Sempre `number-width: "tabular"` (alinhamento de coluna). ⚠️ **Variable fonts NÃO funcionam**
no typst-py (pega 1 master silenciosamente) — use pesos **estáticos**; confirme com `pdffonts`.

## 5 · Print-correctness (CMYK / PDF/X-1a / FOGRA39)
Typst não exporta PDF/X (issue #6012) → pós-processar com Ghostscript (`finalize.py` + `PDFX_def.ps`):
```bash
gs -dNOSAFER -dPDFX -dBATCH -dNOPAUSE -dNOOUTERSAVE -sDEVICE=pdfwrite \
   -dProcessColorModel=/DeviceCMYK -sColorConversionStrategy=CMYK \
   -dPDFXSETBLEEDBOXTOMEDIABOX=true -sOutputFile=out.pdf PDFX_def.ps in-rgb.pdf
```
`-dNOSAFER` OBRIGATÓRIO (senão GS não lê o ICC). FOGRA39: `/usr/share/color/icc/colord/FOGRA39L_coated.icc`.
Texto K88; preto rico C60 M40 Y40 K100. Sangria: dimensões +3mm ou package `markly`.

## 6 · Packages (quando usar)
`calendaring` (calendário) · `markly` (sangria/marcas) · `cetz` (gráficos/barras) ·
`showybox` (caixas de dica) · `tablex` DEPRECATED. `grid` = layout; `table` = dados/grade.
> `[VERIFICAR]` Hoje a sangria é feita por GS (`-dPDFXSETBLEEDBOXTOMEDIABOX`) ou dimensões +3mm. O PR
> de bleed nativo do `markly` (#6357) estava "em revisão" em jun/2026 — checar se foi mergeado antes de adotar.

## 7 · Gotchas críticos
- **G1 overflow:** `set par(spacing:0pt)` + `v()` explícito.
- **G2 variable fonts:** fallback silencioso → confira `pdffonts`.
- **G3 `-dNOSAFER`:** sem ele GS não lê o ICC (`/invalidfileaccess`).
- **G4 `set page` no meio:** insere página em branco — manter no topo/escopo local.
- **G5 dot-grid substrato (tiling):** parece sistemático mas **desalinha elementos** (chip/círculo caem entre dots) e **duplica a grade** do time-log. Para listas de escrita, use `studyrows` (INDIGO ruled), não dot-grid.
- **G6 alinhamento de divisória:** lista dentro de faixa recuada desalinha a barra vertical da lista irmã → faixa **largura cheia (inset x:0)**.
- **G7 linha de preenchimento no meio do texto:** use `align: bottom` no grid p/ a linha ficar na **base** (o número escrito senta na linha).
- **G8 linter:** relê o arquivo após Write antes de Edit.
- **G9 `pagebreak()` em container:** não funciona dentro de box/rect/grid.cell.
- **G10 `let` valor × função:** bloco de conteúdo ESTÁTICO declara-se sem parênteses (`#let ficha-card = block(...)`). Com parênteses (`#let x() = ...`) vira função e exige chamada `#x()` — esquecer disso renderiza nada (silencioso).
- **G11 PNG via poppler:** `render.py` rasteriza com `pdftoppm` (não Typst). Falta de `poppler-utils` → PDF ok, PNG falha.

## 8 · Referências
`design/concurseiro/planner-v1/typst/` (arquivos reais 2.0) · `.claude/tooling-research/typst.md`
(packages/repos) · `…/conceitos/sintese-design-refinada.md` (design) · https://typst.app/docs.
