// ───────────────────────────────────────────────────────────────────────────
// estilos.typ — Helpers · 2.0 PRO (blend JP rigor + KR calor). Importa config.
// Cantos: TUDO RETO (células, quadrados, chips, checkboxes, faixas); só círculos redondos.
// Calor KR vem da fonte (Lato) + cor — não de cantos arredondados.
// ───────────────────────────────────────────────────────────────────────────
#import "config.typ": *

// Página padrão: figuras tabulares (Lato) p/ alinhamento perfeito de números.
#let planner-page(body) = {
  set page(width: pg.w, height: pg.h,
    margin: (left: pg.inside, right: pg.outside, top: pg.top, bottom: pg.bottom),
    fill: none)
  set text(font: sans, size: fs.body, fill: ink, lang: "pt", number-width: "tabular")
  set par(leading: 0.6em, spacing: 0.4em)
  body
}

// Rótulo de seção — Lato bold escuro (nível 2; usado nas páginas-masthead).
#let seclbl(s) = text(font: sans, size: fs.h2, fill: ink, weight: 700, tracking: 0.2pt)[#s]

// Linha de escrita (sólida fina) e pontilhada.
#let wline(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
#let dot(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))

// Masthead: título Lato Black em azul-ardósia + kicker (eyebrow) + fio com "tab" de acento.
#let masthead(title, kicker: none) = {
  grid(columns: (1fr, auto), column-gutter: 4mm, align: (left + bottom, right + bottom),
    text(font: sans, size: fs.h1, fill: title-c, weight: 900, tracking: -0.1pt)[#title],
    if kicker != none { text(font: sans, size: 6.5pt, fill: ink-3, tracking: 1.5pt)[#upper(kicker)] } else [],
  )
  v(2mm)
  box(width: 100%, height: 2pt)[
    #place(left + horizon, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
    #place(left + horizon, line(length: 14mm, stroke: (paint: accent, thickness: 2pt)))
  ]
  v(3mm)
}

// Cabeçalho de seção (masthead pages): rótulo forte + dica + fio.
#let sechead(label, hint: none) = {
  grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    seclbl(label),
    if hint != none { text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#hint] } else [],
  )
  v(1.2mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
  v(2mm)
}

// Cabeçalho de seção DISCRETO (no Diário, onde não há título grande dominando):
// menor + cor mutada — não rouba a cena.
#let softhead(label, hint: none) = {
  grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    text(font: sans, size: 8.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[#label],
    if hint != none { text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#hint] } else [],
  )
  v(1mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
  v(1.5mm)
}

// Campo rotulado: rótulo pequeno acima + linha de escrita.
#let fieldcol(label) = stack(dir: ttb, spacing: 1.4mm,
  text(font: sans, size: fs.micro, fill: ink-3)[#label], wline())

// Bloco do time-log: 6 células (10 min) por hora, CONTÍGUAS, com hierarquia de fios
// (limites de hora = grid-h mais forte; divisões de 10 min = grid-c quietas).
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
    stroke: (x, y) => if x >= 1 {
      (left: (paint: grid-c, thickness: wt.grid), right: (paint: grid-c, thickness: wt.grid),
       top: (paint: grid-h, thickness: wt.gridh), bottom: (paint: grid-h, thickness: wt.gridh))
    } else { none },
    ..cells
  )
}

// Lista estilo INDIGO: [matéria/sigla] │ divisória vertical │ [tarefa · pauta] │ ○
// Sem boxes — coluna de matéria delimitada por linha vertical; pauta = fio inferior.
#let studyrows(n, rh: 5.6mm, subjw: 15mm) = {
  let cells = ()
  for i in range(n) {
    cells.push([])  // matéria (sigla — escreve e pode pintar a cor aqui)
    cells.push([])  // tarefa (escreve na pauta)
    cells.push(align(center + horizon, circle(radius: 1.9mm, stroke: (paint: hair, thickness: wt.box))))
  }
  table(
    columns: (subjw, 1fr, 6mm),
    rows: rh,
    align: horizon,
    inset: (x: 1.6mm, y: 0pt),
    stroke: (x, y) => (
      bottom: (paint: hair, thickness: wt.hair),
      right: if x == 0 { (paint: hair, thickness: wt.hair) } else { none },
    ),
    ..cells
  )
}

// Chip de cor p/ a matéria (o aluno pinta) — canto reto (consistente com células).
#let chip = box(width: 8mm, height: 5mm, stroke: (paint: hair, thickness: wt.box))
// Quadradinho de cor p/ tabelas (dicionário de cor). Canto reto.
#let colorsq = box(baseline: 0.6mm, rect(width: 4mm, height: 4mm, stroke: (paint: hair, thickness: wt.box)))
// Caixinha de check — canto reto (consistente).
#let checkbox = box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, stroke: (paint: hair, thickness: wt.box)))

// Faixa sombreada (container): cantos retos (consistente com as células).
#let softband(body) = block(width: 100%, fill: band, inset: (x: 3.5mm, y: 3mm), body)
