// ───────────────────────────────────────────────────────────────────────────
// estilos.typ — Helpers · Planner v3
// Mantidos do 2.0: planner-page, masthead, eyebrow, sechead, softhead, fieldcol,
//   timeblock, studyrows, statusstrip, chip, colorsq, checkbox, softband, wline.
// NOVOS v3 (fundamentados na pesquisa-v3-sintese.md):
//   cycletable()  — grade de blocos numerados (ciclo de estudos; sem dia/data)
//   decadestrip() — 10 células = 100 h (Registro de Matérias / ledger + dicionário de cor)
//   paintchart()  — time-chart semanal 7 linhas × horas (Kokuyo; pintável)
//   calibtable()  — calibração: matéria · prevejo % · obtive %
//   sessrows()    — blocos de foco: cor · matéria · objetivo · tempo · ○△→×
//   bigthree()    — Daily Big 3 (3 prioridades)
//   ratingdots    — autoavaliação 1–5 (círculos a lápis)
// CANTOS RETOS; só círculos redondos.
// ───────────────────────────────────────────────────────────────────────────
#import "config.typ": *

// Página padrão. Numeração no canto externo inferior (margem, não consome o corpo).
#let planner-page(body) = {
  set page(width: pg.w, height: pg.h,
    margin: (left: pg.inside, right: pg.outside, top: pg.top, bottom: pg.bottom),
    fill: none,
    footer: context align(right, text(font: sans, size: 7pt, fill: ink-3)[#counter(page).display()]))
  set text(font: sans, size: fs.body, fill: ink, lang: "pt", number-width: "tabular")
  set par(leading: 0.6em, spacing: 0.4em)
  body
}

// Rótulo de seção forte + linhas de escrita.
#let seclbl(s) = text(font: sans, size: fs.h2, fill: ink, weight: 700, tracking: 0.2pt)[#s]
#let wline(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
#let dot(w: 1fr)   = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))

// Primitivos visuais (antes dos helpers que os usam — gotcha G10).
#let chip    = box(width: 8mm, height: 5mm, stroke: (paint: hair, thickness: wt.box))
#let colorsq = box(baseline: 0.6mm, rect(width: 4mm, height: 4mm, stroke: (paint: hair, thickness: wt.box)))
#let checkbox = box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, stroke: (paint: hair, thickness: wt.box)))

// ── MASTHEAD — frontmatter (Guia, Bússola) ───────────────────────────────
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

// ── EYEBROW — páginas recorrentes (Ciclo, Sessão, Semanal, Pontes) ────────
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

// Cabeçalhos de seção.
#let sechead(label, hint: none) = {
  grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    seclbl(label),
    if hint != none { text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#hint] } else [],
  )
  v(1.2mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
  v(2mm)
}

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

// ── STATUS STRIP — seletor ○ △ → × (inédito; pré-impresso por linha) ──────
//   ○ cumprida · △ parcial · → adiada · × eliminada — o aluno marca ao fim.
#let statusstrip = {
  let g = (paint: ink-3, thickness: 0.35pt)
  align(center + horizon,
    grid(
      columns: (auto, 1.8mm, auto, 1.8mm, auto, 1.8mm, auto),
      column-gutter: 0pt, align: center + horizon,
      box(baseline: 0.2mm, circle(radius: 1.3mm, stroke: g)),
      [],
      box(baseline: 0.2mm, text(font: (sans, "Noto Sans", "DejaVu Sans"), size: 5.5pt, fill: ink-3)[△]),
      [],
      box(baseline: 0.1mm, text(font: sans, size: 6pt, fill: ink-3)[→]),
      [],
      box(baseline: 0.2mm, text(font: sans, size: 6pt, fill: ink-3)[×]),
    )
  )
}

// ── TIME-LOG — 6 células de 10 min/hora, hierarquia hora/10-min ───────────
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

// ── SESSROWS — blocos de foco da Sessão (diário) ──────────────────────────
//   [cor 5mm] [matéria 16mm] [objetivo 1fr] [tempo 11mm] [○△→× 14mm]
//   "tempo" é a diferença vs. studyrows: registra a duração da sessão.
#let sessrows(n: 7, rh: 6mm) = {
  let cells = ()
  for _ in range(n) {
    cells += (
      align(center + horizon, colorsq),
      [], [], [],
      statusstrip,
    )
  }
  table(
    columns: (5mm, 16mm, 1fr, 11mm, 14mm),
    rows: rh,
    align: (center + horizon, left + horizon, left + horizon, center + horizon, center + horizon),
    inset: (x, y) => if x == 0 { (x: 0.6mm, y: 0pt) }
                     else if x == 4 { (x: 0.5mm, y: 0pt) }
                     else { (x: 1.5mm, y: 0pt) },
    stroke: (x, y) => (
      bottom: (paint: hair, thickness: wt.hair),
      right: if x < 4 { (paint: hair, thickness: wt.hair) } else { none },
    ),
    ..cells
  )
}

// ── CYCLETABLE — grade de blocos numerados do CICLO (novo v3) ─────────────
//   Sem dia da semana, sem data. [nº] [matéria] [carga ___h] [○ concluído]
//   O ciclo avança bloco a bloco, independente do calendário.
#let cycletable(n: 12, rh: 6.6mm) = {
  let th(s) = text(font: sans, size: 6pt, fill: ink-2, weight: 700, tracking: 0.4pt)[#upper(s)]
  let head = (
    align(center + horizon, th("Bl")),
    align(center + horizon, th("Cor")),
    align(left + horizon, th("Matéria")),
    align(center + horizon, th("Carga")),
    align(center + horizon, th("Feito")),
  )
  let cells = ()
  for i in range(n) {
    cells += (
      align(center + horizon, text(font: sans, size: fs.label, fill: accent, weight: 700)[#str(i + 1)]),
      align(center + horizon, colorsq),
      [],
      align(center + horizon, text(font: sans, size: 7pt, fill: ink-3)[h]),
      align(center + horizon, circle(radius: 1.7mm, stroke: (paint: hair, thickness: wt.box))),
    )
  }
  table(
    columns: (7mm, 9mm, 1fr, 13mm, 11mm),
    rows: (auto,) + (rh,) * n,
    align: horizon,
    inset: (x: 1.4mm, y: 0pt),
    stroke: (x, y) => if y == 0 {
      (bottom: (paint: hair, thickness: wt.rule))
    } else {
      (bottom: (paint: hair, thickness: wt.hair),
       right: if x < 4 { (paint: hair, thickness: wt.hair) } else { none })
    },
    ..head, ..cells
  )
}

// ── DECADESTRIP — 10 células = 100 h (cada célula = 10 h) ──────────────────
//   Núcleo do Registro de Matérias: o aluno pinta na cor da matéria conforme
//   acumula horas. É o dicionário de cor + prova de progresso de longo prazo.
#let decadestrip(cell: 4.2mm) = {
  table(
    columns: (cell,) * 10,
    rows: cell,
    inset: 0pt,
    stroke: (paint: hair, thickness: wt.box),
    ..range(10).map(_ => [])
  )
}

// ── PAINTCHART — time-chart semanal (Kokuyo): 7 linhas × horas ────────────
//   Linha = dia; coluna = hora. O aluno pinta na cor da matéria → a semana
//   vira uma pintura. Grade quieta; hierarquia a cada 6 h.
#let paintchart(start: 6, end: 24, rh: 5mm, labelw: 9mm) = {
  let nh = end - start
  let hours = range(start, end)
  // Cabeçalho de horas (rótulo a cada 2 h para não poluir)
  let head = (text(font: sans, size: 5.5pt, fill: ink-3)[],)
  for h in hours {
    head.push(align(center + bottom,
      if calc.rem(h, 2) == 0 { text(font: sans, size: 5pt, fill: ink-3)[#h] } else [] ))
  }
  let dias = ("Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom")
  let body = ()
  for d in dias {
    body.push(align(left + horizon, text(font: sans, size: 6pt, fill: ink-2, weight: 700)[#upper(d)]))
    for _ in range(nh) { body.push([]) }
  }
  table(
    columns: (labelw,) + (1fr,) * nh,
    rows: (auto,) + (rh,) * 7,
    inset: 0pt,
    align: center + horizon,
    stroke: (x, y) => if x == 0 { none } else if y == 0 {
      none
    } else {
      // divisão de hora quieta; limite de bloco de 6h mais forte
      let strong = calc.rem(x - 1 + start, 6) == 0
      (left: (paint: if strong { grid-h } else { grid-c }, thickness: if strong { wt.gridh } else { wt.grid }),
       right: (paint: grid-c, thickness: wt.grid),
       top: (paint: grid-c, thickness: wt.grid),
       bottom: (paint: grid-c, thickness: wt.grid))
    },
    ..head, ..body
  )
}

// ── CALIBTABLE — calibração: matéria · prevejo % · obtive % (novo v3) ──────
//   Predição ANTES das questões, resultado depois. O gap treina autoavaliação.
#let calibtable(n: 6, rh: 6.5mm) = {
  let th(s) = text(font: sans, size: 6pt, fill: ink-2, weight: 700, tracking: 0.4pt)[#upper(s)]
  let head = (
    align(center + horizon, th("Cor")),
    align(left + horizon, th("Matéria")),
    align(center + horizon, th("Prevejo")),
    align(center + horizon, th("Obtive")),
  )
  let cells = ()
  for _ in range(n) {
    cells += (
      align(center + horizon, colorsq),
      [],
      align(center + horizon, text(font: sans, size: 7pt, fill: ink-3)[%]),
      align(center + horizon, text(font: sans, size: 7pt, fill: ink-3)[%]),
    )
  }
  table(
    columns: (9mm, 1fr, 17mm, 17mm),
    rows: (auto,) + (rh,) * n,
    align: horizon,
    inset: (x: 1.4mm, y: 0pt),
    stroke: (x, y) => if y == 0 {
      (bottom: (paint: hair, thickness: wt.rule))
    } else {
      (bottom: (paint: hair, thickness: wt.hair),
       right: if x < 3 { (paint: hair, thickness: wt.hair) } else { none })
    },
    ..head, ..cells
  )
}

// ── BIGTHREE — Daily Big 3 (3 prioridades, com estimativa de minutos) ─────
#let bigthree = {
  let row(n) = {
    grid(columns: (5mm, 1fr, 14mm), column-gutter: 1.5mm, align: bottom,
      text(font: sans, size: fs.label, fill: accent, weight: 700)[#n],
      wline(),
      box[#text(font: sans, size: fs.micro, fill: ink-3)[~] #box(width: 7mm, line(length: 100%, stroke: (paint: hair, thickness: wt.hair))) #text(font: sans, size: fs.micro, fill: ink-3)[min]],
    )
    v(3mm)
  }
  row("1"); row("2"); row("3")
}

// ── RATINGDOTS — autoavaliação 1–5 (círculos a lápis) ─────────────────────
#let ratingdots = {
  grid(columns: (auto,) * 5, column-gutter: 1.6mm, align: horizon,
    ..range(5).map(_ => circle(radius: 1.5mm, stroke: (paint: hair, thickness: wt.box))))
}

// ── studyrows clássico (mantido p/ Guia / compat) ─────────────────────────
#let studyrows(n, rh: 5.6mm, subjw: 15mm, selector: false) = {
  let statw = if selector { 15mm } else { 6mm }
  let cells = ()
  for i in range(n) {
    cells.push([]); cells.push([])
    if selector { cells.push(statusstrip) }
    else { cells.push(align(center + horizon, circle(radius: 1.9mm, stroke: (paint: hair, thickness: wt.box)))) }
  }
  table(
    columns: (subjw, 1fr, statw),
    rows: rh, align: horizon, inset: (x: 1.6mm, y: 0pt),
    stroke: (x, y) => (
      bottom: (paint: hair, thickness: wt.hair),
      right: if x == 0 { (paint: hair, thickness: wt.hair) } else { none },
    ),
    ..cells
  )
}

// Faixa sombreada autônoma (reflexão).
#let softband(body) = block(width: 100%, fill: band, inset: (x: 3.5mm, y: 3mm), body)
