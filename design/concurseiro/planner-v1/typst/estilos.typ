// ───────────────────────────────────────────────────────────────────────────
// estilos.typ — Helpers (estilo planner coreano, amigável). Importa config.
// ───────────────────────────────────────────────────────────────────────────
#import "config.typ": *

// Página padrão.
#let planner-page(body) = {
  set page(width: pg.w, height: pg.h,
    margin: (left: pg.inside, right: pg.outside, top: pg.top, bottom: pg.bottom),
    fill: none)
  set text(font: sans, size: fs.body, fill: ink, lang: "pt")
  set par(leading: 0.6em, spacing: 0.4em)
  body
}

// Rótulo de seção — Lato bold, suave (sem caixa-alta agressiva).
#let seclbl(s) = text(font: sans, size: fs.h2, fill: ink, weight: 700, tracking: 0.2pt)[#s]

// Linha de escrita (sólida fina) e pontilhada.
#let wline(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
#let dot(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))

// Masthead de página: título Lato Black em azul-ardósia + kicker (eyebrow) + fio com "tab" de acento.
#let masthead(title, kicker: none) = {
  grid(columns: (1fr, auto), column-gutter: 4mm, align: (left + bottom, right + bottom),
    text(font: sans, size: 18pt, fill: title-c, weight: 900, tracking: -0.1pt)[#title],
    if kicker != none { text(font: sans, size: 6.5pt, fill: ink-3, tracking: 1.5pt)[#upper(kicker)] } else [],
  )
  v(2mm)
  // Fio: hairline largura cheia + "tab" curto de acento à esquerda (âncora da identidade)
  box(width: 100%, height: 2pt)[
    #place(left + horizon, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
    #place(left + horizon, line(length: 14mm, stroke: (paint: accent, thickness: 2pt)))
  ]
  v(3mm)
}

// Cabeçalho de seção amigável: rótulo + dica à direita, fio fino embaixo.
#let sechead(label, hint: none) = {
  grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    seclbl(label),
    if hint != none { text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#hint] } else [],
  )
  v(1.2mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
  v(2mm)
}

// Campo rotulado: rótulo pequeno acima + linha de escrita.
#let fieldcol(label) = stack(dir: ttb, spacing: 1.4mm,
  text(font: sans, size: fs.micro, fill: ink-3)[#label], wline())

// Bloco do time-log: título + grade CONTÍGUA de 6 células (10 min) por hora.
#let timeblock(title, hours) = {
  text(font: sans, size: fs.micro, fill: ink-2, weight: 700)[#title]
  v(1mm)
  let cells = ()
  for h in hours {
    cells.push(align(right + horizon, text(font: sans, size: fs.cell, fill: ink-3)[#h]))
    for _ in range(6) { cells.push([]) }
  }
  table(
    columns: (5mm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr),
    rows: 4.5mm,
    inset: (x, y) => if x == 0 { (right: 1.2mm) } else { 0pt },
    align: center + horizon,
    stroke: (x, y) => if x >= 1 { (paint: grid-c, thickness: wt.grid) } else { none },
    ..cells
  )
}

// Chip de cor (o aluno pinta = cor da matéria), arredondado. 8mm (alivia a linha).
#let chip = box(width: 8mm, height: 5mm, radius: rad.chip, stroke: (paint: hair, thickness: wt.box))
// Quadradinho de cor p/ tabelas (dicionário de cor: Mapa do Edital, Semanal). Canto reto.
#let colorsq = box(baseline: 0.6mm, rect(width: 4mm, height: 4mm, stroke: (paint: hair, thickness: wt.box)))
// Círculo "feito".
#let donecirc = box(baseline: 1mm, circle(radius: 1.9mm, stroke: (paint: hair, thickness: wt.box)))
// Linha de matéria: chip + linha longa de conteúdo + círculo.
#let subjrow = grid(columns: (8mm, 1fr, auto), column-gutter: 2.6mm, align: horizon,
  chip, box(inset: (bottom: 1.2mm), wline()), donecirc)

// Caixinha de check arredondada.
#let checkbox = box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, radius: 0.6mm, stroke: (paint: hair, thickness: wt.box)))

// Faixa suave arredondada (seções tipo Revisar / Ajuste de Rota).
#let softband(body) = block(width: 100%, fill: band, radius: rad.band, inset: (x: 3.5mm, y: 3mm), body)
