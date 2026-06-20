---
name: typst-planner
description: |
  Constrói e edita páginas de planner/caderno A5 print-ready com Typst (pipeline
  open-source, sem InDesign/Affinity). Use ao desenhar ou alterar páginas dos planners
  Concurseiro/Treino, ou qualquer miolo A5 que precise sair como PDF CMYK para gráfica.
  Acione para: compilar .typ → PDF → PNG (QA visual), configurar tokens de cor/fonte,
  pós-processar com Ghostscript (CMYK/PDF-X FOGRA39), ou diagnosticar overflow de A5.
  Cobre toolchain completo, padrões de layout provados, packages recomendados e gotchas.
  Validado em 2026-06-20.
---

# Typst para planners print-ready (A5)

Conhecimento prático destilado do protótipo real em
`design/concurseiro/planner-v1/typst/`. Todo padrão aqui foi compilado e impresso.

---

## 1 · Toolchain (instalado e validado)

| Passo | Comando | Nota |
|---|---|---|
| Compilar | `uv run --with typst python render.py <pagina>` | gera `<pagina>.pdf` + `<pagina>-1.png` 150 dpi; avisa se > 1 pág |
| QA visual | Read o PNG gerado | **obrigatório** — nunca confie no código sem olhar a imagem |
| Inspecionar fontes | `pdffonts <pagina>.pdf` | confirma peso estático embutido |
| Merge + CMYK | `uv run --with pypdf python finalize.py [<key>…]` | junta PDFs → Ghostscript PDF/X-1a FOGRA39 |
| Verificar CMYK | `gs -o - -sDEVICE=inkcov arquivo.pdf` | reporta C M Y K por página |

Scripts prontos: `design/concurseiro/planner-v1/typst/render.py` e `finalize.py`.
Compilação direta (sem render.py): `typst.compile(src, output=pdf, root=d, font_paths=["/usr/share/fonts"])`.

---

## 2 · Arquitetura de arquivos

```
config.typ      ← tokens de design (CMYK, fontes, medidas) — NÃO editar ao montar página
estilos.typ     ← helpers reutilizáveis (importa config) — NÃO editar ao montar página
<pagina>.typ    ← compõe com os helpers; helpers locais ficam aqui
render.py       ← compilar + rasterizar
finalize.py     ← merge + Ghostscript PDF/X
PDFX_def.ps     ← OutputIntent FOGRA39 (passado ao GS)
```

Regra: helpers **específicos** da página ficam localmente no `<pagina>.typ`.
Nunca altere `config.typ`/`estilos.typ` ao construir uma página — são compartilhados
e quebram as outras.

Para projetos novos: seguir a mesma separação (um arquivo por tipo de página;
`main.typ` orquestra a sequência).

---

## 3 · Padrões provados (copiar diretamente)

### 3.1 Configuração de página

```typst
// Provado em config.typ + estilos.typ do protótipo
#let pg = (w:148mm, h:210mm, inside:18mm, outside:11mm, top:11mm, bottom:11mm)

#let planner-page(body) = {
  set page(width: pg.w, height: pg.h,
    margin: (left: pg.inside, right: pg.outside, top: pg.top, bottom: pg.bottom),
    fill: none)                      // fill:none → papel creme aparece; não floode fundo
  set text(font: "Lato", size: 9.5pt, fill: cmyk(0%,0%,0%,88%), lang: "pt")
  set par(leading: 0.6em, spacing: 0.4em)
  body
}
```

`fill:none` é essencial — cor de fundo desperdiça tinta; o papel creme da gráfica faz o trabalho.
Margem interna maior (18 mm) reserva a espiral wire-o.

### 3.2 Controle de espaçamento (anti-overflow)

```typst
// No topo de cada <pagina>.typ:
#show: planner-page
#set par(spacing: 0pt)   // zera espaço entre parágrafos; controle total via v()

// Usar v() explícito para todos os gaps
#v(3mm)
#sechead("Seção")
#v(2mm)
```

`set par(spacing:…)` insere espaço entre **todos** os parágrafos. Listas via `for … []`
tratam cada item como parágrafo — sem `spacing:0pt` a lista infla e estoura a A5.

### 3.3 Grade de time-log contígua (células coladas)

```typst
// Padrão provado em estilos.typ / diario.typ
// Células sem gutter; traço só nas células (x>=1); rótulo de hora sem borda
table(
  columns: (5mm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
  rows: 4.5mm,
  inset: (x, y) => if x == 0 { (right: 1.2mm) } else { 0pt },
  align: center + horizon,
  stroke: (x, y) => if x >= 1 { (paint: grid-c, thickness: 0.4pt) } else { none },
  ..cells   // 1 rótulo de hora + 6 células de 10 min
)
```

### 3.4 Tokens de cor em CMYK (escala do projeto)

```typst
// De config.typ — copiar como base para novas páginas
#let ink    = cmyk(0%,  0%,  0%, 88%)   // texto principal (preto suave)
#let ink-2  = cmyk(32%, 16%, 0%, 56%)   // rótulos (azul-acinzentado)
#let ink-3  = cmyk(28%, 12%, 0%, 40%)   // dicas / terciário
#let accent = cmyk(52%, 22%, 0%,  4%)   // azul suave — uso pontual
#let grid-c = cmyk(24%, 10%, 0%,  8%)   // linhas de grade
#let band   = cmyk(12%,  5%, 0%,  4%)   // faixa sombreada suave
```

Evitar 4-color black em texto — usar K 80–90% max para evitar halo de registro.
Preto rico (áreas grandes impressas): `cmyk(60%,40%,40%,100%)` (TIC 240%, couché).

### 3.5 Elementos de UI amigáveis

```typst
// Cantos arredondados (planner coreano / amigável)
box(radius: 1.6mm, stroke: (paint: hair, thickness: 0.6pt))

// Faixa suave para seções (Revisar, Ajuste de Rota)
block(width: 100%, fill: band, radius: 2mm, inset: (x: 3.5mm, y: 3mm))[corpo]

// Chip de cor (aluno pinta com marca-texto)
box(width: 8mm, height: 5mm, radius: 1mm, stroke: (paint: hair, thickness: 0.6pt))
```

---

## 4 · Fontes

- **Lato** (humanista, quente, amigável) — provado e instalado em `/usr/share/fonts`.
  Pesos estáticos disponíveis: Regular 400, Medium 500, SemiBold 600, Bold 700, Black 900.
- **Outras instaladas:** Inter (grotesca), EB Garamond (serifa editorial).
- **Alternativas open-license para novos projetos:** TeX Gyre Pagella (corpo serifa),
  Source Sans 3 (labels/headers), Atkinson Hyperlegible (acessibilidade).

**Atenção — variable fonts NÃO funcionam** no `typst-py`: pega apenas um master
(ex.: ExtraLight), silenciosamente. Use sempre famílias com **pesos estáticos**.
Confirme com `pdffonts out.pdf` após compilar.

---

## 5 · Print-correctness (CMYK / PDF/X-1a / FOGRA39)

Typst não exporta PDF/X nativamente (issue typst/typst#6012, aberta) — pós-processar
com Ghostscript. Receita pronta em `finalize.py` + `PDFX_def.ps`:

```bash
# Ghostscript — converter RGB → CMYK PDF/X-1a com OutputIntent FOGRA39
# -dNOSAFER OBRIGATÓRIO (senão GS não lê ICC do PDFX_def.ps → /invalidfileaccess)
gs -dNOSAFER -dPDFX -dBATCH -dNOPAUSE -dNOOUTERSAVE \
   -sDEVICE=pdfwrite -dProcessColorModel=/DeviceCMYK \
   -sColorConversionStrategy=CMYK -dPDFXSETBLEEDBOXTOMEDIABOX=true \
   -sOutputFile=saida.pdf PDFX_def.ps entrada-rgb.pdf
```

ICC FOGRA39 (couché) no sistema: `/usr/share/color/icc/colord/FOGRA39L_coated.icc`.
Merge antes do GS: `pypdf.PdfWriter.append()` — ver `finalize.py`.

**Sangria:** Typst ≥ 0.14 ainda não tem `page.bleed` nativo (PR #6357 em revisão).
Workaround: expandir dimensões manualmente (`148mm + 2*3mm`) ou usar package `markly`.

---

## 6 · Packages (quando usar)

| Package | Versão | Usar quando | Ignorar quando |
|---|---|---|---|
| `calendaring` | 0.1.0 | grid de calendário mensal/anual com callback por célula | não há calendário na página |
| `markly` | 0.1.0 | marcas de corte + sangria (até bleed nativo chegar) | gráfica aceita sem marcas |
| `cetz` | 0.5.2 | gráficos de progresso, barras, círculos de hábito | elementos puramente textuais |
| `booktabs` | 0.0.4 | tabelas de dados estilo acadêmico (cargas/RPE/volume) | layout visual/células de escrita → usar `grid` |
| `showybox` | 2.0.4 | blocos de instrução/dica com título colorido e breakable | caixas que nunca excedem uma página |
| `tablex` | — | DEPRECATED desde Typst 0.11 — não usar | — |

`grid` (layout visual) vs `table` (dados): show-rules de um **não** afetam o outro.
Células de escrita → `grid`; headers repetíveis em múltiplas páginas → `table.header()`.

---

## 7 · Gotchas críticos

**G1 — Overflow / encaixe em A5**
`set par(spacing:…)` infla listas tratadas como parágrafos. Solução: `set par(spacing:0pt)`
no início de cada página e gaps somente via `v()` explícito.

**G2 — Variable fonts silenciosas**
typst-py não avisa quando usa fallback de peso. Confirme sempre com `pdffonts`.

**G3 — `-dNOSAFER` obrigatório no GS**
Sem ele, Ghostscript não lê o ICC do `PDFX_def.ps` e retorna `/invalidfileaccess`.

**G4 — `set page` no meio do documento**
Cada `set page` insere uma página em branco antes. Colocar sempre no topo do template
ou em escopo local `{ set page(...); conteudo }`.

**G5 — `show heading` que duplica TOC**
`show h: it => heading(...)` reconstrói o elemento e duplica entradas no outline.
Preferir `show heading.where(level:1): set text(...)`.

**G6 — State não convergente**
Aviso "layout did not converge within 5 attempts" = `state.get()` dentro de `state.update()`.
Usar forma funcional: `state-x.update(v => v + 1)`.

**G7 — Linter reescreve .typ/.py**
Após Write de um arquivo, releia antes de Edit — o formatter pode ter ajustado indentação.

**G8 — `pagebreak()` dentro de containers**
Não pode ser usado dentro de `box`, `rect`, `grid.cell` — causa erro em compilação.
Deve estar no fluxo principal da página.

---

## 8 · Referências rápidas

| Recurso | O que contém |
|---|---|
| `design/concurseiro/planner-v1/typst/` | Arquivos reais provados (config, estilos, diario, semanal, bussola, render.py, finalize.py, PDFX_def.ps) |
| `.claude/tooling-research/typst.md` | Referência completa: packages Universe, repos, padrões de impressão, armadilhas |
| `design/concurseiro/conceitos/roadmap-faseado.md` | Roadmap de produto (F0–F3) |
| https://typst.app/docs/guides/tables | Tutorial completo de tabelas e grids |
| https://typst.app/universe/package/calendaring/ | Grid de calendário para planner |
| https://typst.app/universe/package/markly/ | Marcas de corte/bleed |
