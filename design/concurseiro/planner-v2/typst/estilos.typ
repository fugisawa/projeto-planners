// ───────────────────────────────────────────────────────────────────────────
// estilos.typ — Helpers · Planner v2
// Novidades v2:
//   eyebrow()   — cabeçalho discreto para páginas recorrentes (Semanal, Pontes)
//   statusstrip — seletor pré-impresso de 4 estados por linha de tarefa
//   studyrows() — parâmetro selector:bool ativa o seletor em vez do círculo simples
// Cantos: TUDO RETO; só círculos redondos.
// ───────────────────────────────────────────────────────────────────────────
#import "config.typ": *

// Página padrão.
#let planner-page(body) = {
  set page(width: pg.w, height: pg.h,
    margin: (left: pg.inside, right: pg.outside, top: pg.top, bottom: pg.bottom),
    fill: none)
  set text(font: sans, size: fs.body, fill: ink, lang: "pt", number-width: "tabular")
  set par(leading: 0.6em, spacing: 0.4em)
  body
}

// Rótulo de seção forte.
#let seclbl(s) = text(font: sans, size: fs.h2, fill: ink, weight: 700, tracking: 0.2pt)[#s]

// Linha de escrita e pontilhada.
#let wline(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
#let dot(w: 1fr)   = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))

// ── MASTHEAD — único em frontmatter (Bússola, Guia) ──────────────────────
// Uso: uma vez por produto. Nas páginas recorrentes (Semanal, Pontes, Diário)
// usa-se eyebrow() em vez disso — visualmente distinto do padrão INDIGO.
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

// ── EYEBROW — cabeçalho discreto para páginas recorrentes ────────────────
// Substitui masthead no Semanal e Pontes. Mantém identidade da página sem
// replicar o visual INDIGO (título Black 18pt azul-ardósia).
#let eyebrow(label, kicker: none) = {
  grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    text(font: sans, size: 6.5pt, fill: ink-3, weight: 700, tracking: 1.6pt)[#upper(label)],
    if kicker != none { text(font: sans, size: 6.5pt, fill: ink-3, tracking: 1.4pt)[#upper(kicker)] } else [],
  )
  v(1.2mm)
  box(width: 100%, height: 1.4pt)[
    #place(left + horizon, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
    #place(left + horizon, line(length: 12mm, stroke: (paint: accent, thickness: 1.6pt)))
  ]
  v(2.8mm)
}

// Cabeçalho de seção (em páginas com masthead).
#let sechead(label, hint: none) = {
  grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    seclbl(label),
    if hint != none { text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#hint] } else [],
  )
  v(1.2mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
  v(2mm)
}

// Cabeçalho de seção DISCRETO (Diário — sem título grande dominando).
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

// ── STATUS STRIP — inovação v2 ────────────────────────────────────────────
// Seletor de 4 estados pré-impresso em ink-3 (fantasma até o aluno marcar).
// O aluno marca a opção que se aplica ao fim do dia:
//   ○ = cumprida integralmente · △ = parcial · → = adiada · × = eliminada
// Nenhuma outra planner no mercado oferece isso inline por linha.
#let statusstrip = {
  let g = (paint: ink-3, thickness: 0.35pt)
  align(center + horizon,
    grid(
      columns: (auto, 1.8mm, auto, 1.8mm, auto, 1.8mm, auto),
      column-gutter: 0pt,
      align: center + horizon,
      // ○ — circle nativo Typst (sempre renderiza corretamente)
      box(baseline: 0.2mm, circle(radius: 1.3mm, stroke: g)),
      [],
      // △ — texto com fallback Noto Sans se Lato não tiver o glifo
      box(baseline: 0.2mm,
        text(font: (sans, "Noto Sans", "DejaVu Sans"), size: 5.5pt, fill: ink-3)[△]),
      [],
      // → — em Lato
      box(baseline: 0.1mm, text(font: sans, size: 6pt, fill: ink-3)[→]),
      [],
      // × (U+00D7 Multiplication Sign) — em Lato
      box(baseline: 0.2mm, text(font: sans, size: 6pt, fill: ink-3)[×]),
    )
  )
}

// Time-log: 6 células de 10 min/hora, hierarquia hora/10min.
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

// Lista INDIGO: [matéria] │ [tarefa] │ [status]
// selector: true → seletor 4-estados (v2); false → círculo simples (compatível v1).
#let studyrows(n, rh: 5.6mm, subjw: 15mm, selector: false) = {
  let statw = if selector { 15mm } else { 6mm }
  let cells = ()
  for i in range(n) {
    cells.push([])
    cells.push([])
    if selector {
      cells.push(statusstrip)
    } else {
      cells.push(align(center + horizon,
        circle(radius: 1.9mm, stroke: (paint: hair, thickness: wt.box))))
    }
  }
  table(
    columns: (subjw, 1fr, statw),
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

// Primitivos visuais.
#let chip    = box(width: 8mm, height: 5mm, stroke: (paint: hair, thickness: wt.box))
#let colorsq = box(baseline: 0.6mm, rect(width: 4mm, height: 4mm, stroke: (paint: hair, thickness: wt.box)))
#let checkbox = box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, stroke: (paint: hair, thickness: wt.box)))

// Faixa sombreada.
#let softband(body) = block(width: 100%, fill: band, inset: (x: 3.5mm, y: 3mm), body)
