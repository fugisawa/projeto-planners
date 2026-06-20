#import "estilos.typ": *
#show: planner-page

// ── Helpers locais ───────────────────────────────────────────────────────────

// 5 quadradinhos pintáveis
#let prog5 = {
  for _ in range(5) {
    box(baseline: 0.2mm,
      rect(width: 3.4mm, height: 3.4mm, stroke: (paint: hair, thickness: wt.box)))
    h(0.4mm)
  }
}

// Linha do Mapa do Edital
#let mapa-row(last: false) = {
  grid(
    columns: (1fr, 14mm, auto),
    column-gutter: 2mm,
    align: (left + horizon, right + horizon, right + horizon),
    // matéria
    box(width: 100%, height: 3.8mm,
      pad(top: 1.4mm, dot())
    ),
    // peso
    box(height: 3.8mm,
      pad(top: 0.8mm, right: 0mm,
        text(font: sans, size: 5.5pt, fill: ink-3)[#h(3mm) %]
      )
    ),
    // progresso
    box(height: 3.8mm,
      pad(top: 0.2mm, prog5)
    ),
  )
  if not last {
    line(length: 100%, stroke: (paint: hair2, thickness: wt.hair))
  }
}

// Linha do stack
#let stack-row(label) = {
  text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#label]
  v(0.4mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted"))
  v(1.4mm)
}

// Linha do Calendário de Provas
#let cal-row(last: false) = {
  v(0.4mm)
  grid(
    columns: (1fr, 14mm, 13mm, 8mm),
    column-gutter: 1.5mm,
    align: (left + horizon, left + horizon, left + horizon, right + horizon),
    dot(), dot(), dot(), dot(),
  )
  v(0.4mm)
  if not last {
    line(length: 100%, stroke: (paint: hair2, thickness: wt.hair))
  }
}

// Célula KPI: rótulo micro + underline field
#let kpic(label) = {
  text(font: sans, size: 5pt, fill: ink-2, weight: "medium", tracking: 0.3pt)[#upper(label)]
  v(0.4mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted"))
}

// Rótulo micro de cabeçalho de tabela
#let th(s) = text(font: sans, size: 5.5pt, fill: ink-2, weight: "medium", tracking: 0.5pt)[#upper(s)]

// ── Página ───────────────────────────────────────────────────────────────────

#masthead("Bússola da Jornada", kicker: "Frontmatter")

// Suprimir par.spacing — controlaremos tudo via v()
#set par(spacing: 0pt)

// Objetivo + Por que
#grid(columns: (auto, 1fr), column-gutter: 2.5mm, align: left + horizon,
  text(font: sans, size: fs.label, fill: ink-2)[Meu objetivo / cargo-alvo],
  dot(),
)
#v(1.6mm)
#grid(columns: (auto, 1fr), column-gutter: 2.5mm, align: left + horizon,
  text(font: sans, size: fs.label, fill: ink-3, style: "italic")[Por que quero isso?],
  dot(),
)
#v(2.8mm)

// ── Duas colunas ─────────────────────────────────────────────────────────────
#grid(
  columns: (1fr, 52mm),
  column-gutter: 5mm,

  // ── ESQUERDA: Mapa do edital ─────────────────────────────────────────────
  [
    #sechead("Mapa do edital", hint: "visão macro")

    // Cabeçalho da tabela
    #grid(
      columns: (1fr, 14mm, auto),
      column-gutter: 2mm,
      align: (left + horizon, right + horizon, right + horizon),
      th("Bloco / Matéria"),
      th("Peso"),
      th("Progresso"),
    )
    #v(0.6mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))

    #for i in range(14) { mapa-row(last: i == 13) }

    #v(2mm)
    // Legenda
    #grid(
      columns: (auto, auto, auto, 1fr),
      column-gutter: 1.8mm,
      align: left + horizon,
      rect(width: 3.4mm, height: 3.4mm, stroke: (paint: hair, thickness: wt.box)),
      rect(width: 3.4mm, height: 3.4mm, fill: hair2, stroke: (paint: hair, thickness: wt.box)),
      rect(width: 3.4mm, height: 3.4mm, fill: ink-2, stroke: (paint: hair, thickness: wt.box)),
      align(left + horizon,
        text(font: sans, size: 5pt, fill: ink-3)[0% → 100% (pintável)]
      ),
    )
  ],

  // ── DIREITA: Meu stack + Calendário ─────────────────────────────────────
  [
    #sechead("Meu stack", hint: "preencher uma vez")
    #v(0.5mm)

    #stack-row("Cursinho / trilha")
    #stack-row("Banco de questões")
    #stack-row("Revisão espaçada (Anki etc.)")
    #stack-row("Simulados")
    #stack-row("App de foco/tempo (ex.: Forest)")
    #stack-row("Outro")

    #v(3mm)
    #sechead("Calendário de provas")

    // Cabeçalho calendário
    #grid(
      columns: (1fr, 14mm, 13mm, 8mm),
      column-gutter: 1.5mm,
      align: (left + horizon, left + horizon, left + horizon, right + horizon),
      th("Concurso"), th("Fase"), th("Data"), th("D-"),
    )
    #v(0.5mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))

    #for i in range(5) { cal-row(last: i == 4) }
  ],
)

#v(3mm)

// ── Balanço mensal ───────────────────────────────────────────────────────────
#sechead("Balanço mensal", hint: "replicar a cada fechamento")

#block(width: 100%, fill: tint, inset: (x: 3mm, y: 2.2mm), radius: 1pt)[
  #set par(spacing: 0pt, leading: 0pt)
  #set text(features: ("tnum",))
  #grid(
    columns: (14mm, 14mm, 22mm, 16mm, 22mm, 1fr, 1fr),
    column-gutter: 2.5mm,
    align: left + top,
    kpic("Mês"),
    kpic("Horas"),
    kpic("Questões"),
    kpic("% Acerto"),
    kpic("Discursivas"),
    kpic("Anki criados"),
    kpic("Anki revisados"),
  )

]

#v(2mm)

// Reflexão — 2 colunas com 2 linhas de escrita cada
#grid(
  columns: (1fr, 1fr),
  column-gutter: 5mm,
  [
    #lbl("O que foi bem", size: fs.label)
    #v(0.9mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    #v(0.8mm)
    #dot()
    #v(4mm)
    #dot()
  ],
  [
    #lbl("O que precisa mudar · ajuste de rota", size: fs.label)
    #v(0.9mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    #v(0.8mm)
    #dot()
    #v(4mm)
    #dot()
  ],
)
