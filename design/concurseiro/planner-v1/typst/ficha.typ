#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Helpers locais ──────────────────────────────────────────────────────────

// Rótulo de campo interno — Lato bold ink-2.
#let flbl(s) = text(font: sans, size: fs.label, fill: ink-2, weight: 700)[#s]

// Hint micro itálico.
#let fhint(s) = text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#s]

// Cabeçalho de sub-seção: label + fio + hint opcional.
#let ihead(s, hint: none) = {
  grid(
    columns: (auto, 1fr, auto), column-gutter: 2mm,
    align: (left + horizon, center + horizon, right + horizon),
    flbl(s),
    line(length: 100%, stroke: (paint: hair, thickness: wt.hair)),
    if hint != none { fhint(hint) } else [],
  )
  v(0.8mm)
}

// Linha pontilhada com altura de escrita confortável (4.2 mm, ligeiramente abaixo do baseline).
#let drow = block(width: 100%, height: 4.2mm, above: 0pt, below: 0pt,
  align(bottom, dot()))

// Checkbox + texto micro para Triagem / Causa / Revisão.
#let chk(s) = box[#checkbox#h(1pt)#text(font: sans, size: fs.micro, fill: ink-2, tracking: 0.8pt)[#upper(s)]#h(2mm)]

// Seta accent para o campo "→ Faço".
#let arrow = text(font: sans, size: fs.label, fill: accent, weight: "medium")[→]

// Linha de origem: Livro · p. · nº · Site · id
#let origem-line = {
  grid(
    columns: (auto, 24mm, auto, 7mm, auto, 9mm, 3mm, auto, 14mm, auto, 1fr),
    align: horizon,
    text(font: sans, size: fs.label, fill: ink-2)[Livro ], dot(),
    text(font: sans, size: fs.label, fill: ink-2)[ p. ], dot(),
    text(font: sans, size: fs.label, fill: ink-2)[ nº ], dot(),
    [],
    text(font: sans, size: fs.label, fill: ink-2)[Site ], dot(),
    text(font: sans, size: fs.label, fill: ink-2)[ id ], dot(),
  )
}

// ── Ficha-card ───────────────────────────────────────────────────────────────
#let ficha-card = block(
  width: 100%,
  fill: none,
  radius: 1pt,
  inset: (x: 3.5mm, y: 2.2mm),
  stroke: (left: (paint: accent, thickness: 2pt), rest: (paint: hair, thickness: wt.box)),
  {
    // 1. Cabeçalho: chip de matéria + linha "MATÉRIA" + D–
    grid(
      columns: (8mm, 1fr, auto), column-gutter: 2.5mm,
      align: (left + horizon, left + horizon, right + horizon),
      chip,
      box(width: 1fr, inset: (bottom: 1.2mm))[
        #text(font: sans, size: fs.label, fill: ink-2, weight: 700, tracking: 0.6pt)[#upper("Matéria") ]
        #dot()
      ],
      box[#text(font: sans, size: fs.label, fill: ink-2)[D– ]#box(width: 11mm, dot())],
    )
    v(1.2mm)

    // Origem
    origem-line
    v(1.8mm)

    // 2. O que eu pensei (ANTES da solução — inversão mais importante)
    ihead("O que eu pensei", hint: "errado — antes de ver a resposta")
    drow; drow; drow
    v(1.8mm)

    // 3. Triagem + Causa (bloco compacto com bordura accent)
    block(width: 100%, above: 0pt, below: 0pt,
      fill: none,
      stroke: (left: (paint: accent, thickness: 1.5pt)),
      inset: (left: 3.5mm, right: 0mm, y: 1mm),
    )[
      #grid(columns: (18mm, 1fr), column-gutter: 2mm,
        align: (left + horizon, left + horizon),
        flbl("Triagem"),
        [#chk("Ponto-cego")#chk("Armadilha")#chk("Questão-modelo")],
      )
      #v(1.2mm)
      #grid(
        columns: (18mm, 1fr, 1fr, 1fr, 1fr, 1fr),
        column-gutter: 1mm,
        align: (left + horizon,) * 6,
        flbl("Causa"),
        box[#checkbox#h(0.8pt)#text(font: sans, size: fs.micro, fill: ink-2)[Conceito]],
        box[#checkbox#h(0.8pt)#text(font: sans, size: fs.micro, fill: ink-2)[Interpret.]],
        box[#checkbox#h(0.8pt)#text(font: sans, size: fs.micro, fill: ink-2)[Cálculo]],
        box[#checkbox#h(0.8pt)#text(font: sans, size: fs.micro, fill: ink-2)[Desatenção]],
        box[#checkbox#h(0.8pt)#text(font: sans, size: fs.micro, fill: ink-2)[Pegadinha]],
      )
    ]
    v(1.8mm)

    // 4. Raciocínio correto — 3 linhas
    ihead("Raciocínio correto")
    drow; drow; drow
    v(1.8mm)

    // 5. Quando vir → Faço (2 linhas para o "Faço" — ação é mais longa que o gatilho)
    block(width: 100%, height: 4.2mm, above: 0pt, below: 1.2mm,
      align(bottom, grid(columns: (auto, 1fr), column-gutter: 1.5mm, align: horizon,
        flbl("Quando vir"), dot())))
    block(width: 100%, height: 4.2mm, above: 0pt, below: 1.2mm,
      align(bottom, grid(columns: (auto, 1fr), column-gutter: 1.5mm, align: horizon,
        arrow + h(1mm) + flbl("Faço"), dot())))
    block(width: 100%, height: 4.2mm, above: 0pt, below: 1.5mm,
      align(bottom, dot()))

    // 6. Revisão espaçada
    grid(columns: (auto, 1fr), column-gutter: 3mm, align: horizon,
      flbl("Revisão"),
      [#chk("D+1")#chk("D+7")#chk("D+15")#chk("D+30")],
    )
  }
)

// ── Página ──────────────────────────────────────────────────────────────────

#masthead("Diagnóstico de Erro", kicker: "Concurseiro · lite")

// Instrução editorial (bordura accent, sem fill — não compete com as fichas)
#block(width: 100%, fill: none,
  stroke: (left: (paint: accent, thickness: 2pt)),
  inset: (left: 4mm, right: 0mm, y: 1.2mm),
)[
  #text(font: sans, size: fs.micro, fill: ink-2, style: "italic")[Não registre todo erro — o QConcursos já guarda. Traga só 1–3 por dia: o que te pegou (ponto-cego / armadilha / questão-modelo).]
]
#v(3mm)

#ficha-card
#v(2mm)
#ficha-card

// Rodapé
#v(1.8mm)
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
#v(0.8mm)
#align(right, text(font: sans, size: fs.micro, fill: ink-3, tracking: 1pt)[#upper("Diagnóstico de Erro")])
