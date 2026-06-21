#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Helpers locais ──
#let col-hd(s) = align(center + horizon,
  text(font: sans, size: 6pt, fill: ink-2, tracking: 0.06em, weight: 700)[#upper(s)])

#let ifield(lbl-txt, w: 22mm, unit: none) = box(baseline: 0pt)[
  #text(font: sans, size: fs.label, fill: ink-2)[#lbl-txt ]
  #box(width: w, wline())
  #if unit != none { text(font: sans, size: fs.label, fill: ink-2)[ #unit] }
]

#let bs  = (bottom: (paint: hair, thickness: wt.hair))
#let bls = (bottom: (paint: hair, thickness: wt.hair), left: (paint: hair, thickness: wt.hair))

// ── EYEBROW — substitui masthead (diferença central do v2 vs. INDIGO) ────
#eyebrow("Semanal", kicker: "Ciclo de matérias")

#grid(columns: (auto, 14mm, auto, 14mm, auto, 10mm, auto, 1fr),
  column-gutter: 1.6mm, align: bottom,
  text(font: sans, size: fs.label, fill: ink-2)[Semana], wline(w: 14mm),
  text(font: sans, size: fs.label, fill: ink-2)[ a ], wline(w: 14mm),
  text(font: sans, size: fs.label, fill: ink-2)[· D-prova], wline(w: 10mm),
  text(font: sans, size: fs.label, fill: ink-2)[· Prova], wline(w: 1fr),
)
#v(3mm)

// ── METAS DA SEMANA ──────────────────────────────────────────────────────
#sechead("Metas da semana", hint: "rotação & volume")

#let col-m = (5mm, 1fr, 13mm, 17mm, 15mm, 9mm)
#let rh = 7mm

#grid(columns: col-m, column-gutter: 0pt, align: bottom,
  [],
  align(left + horizon,
    text(font: sans, size: 6pt, fill: ink-2, tracking: 0.06em, weight: 700)[#upper("Matéria")]),
  col-hd("Quest."),
  col-hd("Págs/Aulas"),
  col-hd("Hrs-alvo"),
  col-hd("Feito?"),
)
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))

// 9 linhas de matéria (v2 ganha 1 extra pelo espaço liberto do eyebrow)
#for _ in range(9) {
  grid(columns: col-m, column-gutter: 0pt,
    rect(width: 100%, height: rh, stroke: bs)[
      #align(center + horizon)[#colorsq]
    ],
    rect(width: 100%, height: rh, stroke: bs)[],
    rect(width: 100%, height: rh, stroke: bls)[],
    rect(width: 100%, height: rh, stroke: bls)[],
    rect(width: 100%, height: rh, stroke: bls)[],
    rect(width: 100%, height: rh, stroke: bls)[
      #align(center + horizon)[#checkbox]
    ],
  )
}
#line(length: 100%, stroke: (paint: hair, thickness: wt.rule))
#v(1.5mm)

#grid(columns: (auto, auto, auto, 1fr, auto),
  column-gutter: 3.5mm, align: bottom,
  ifield("Previsto", w: 11mm, unit: "h"),
  ifield("Real", w: 11mm, unit: "h"),
  ifield("Questões", w: 12mm),
  [],
  ifield("% Acerto", w: 11mm, unit: "%"),
)
#v(3mm)

// ── ROTAÇÃO DA SEMANA ────────────────────────────────────────────────────
#sechead("Rotação da semana")

#let col-r = (9mm, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr, 1fr)
#let dias  = ("Seg", "Ter", "Qua", "Qui", "Sex", "Sáb", "Dom")
#let rh-r  = 7mm

#grid(columns: col-r, column-gutter: 0pt, align: bottom,
  align(left + horizon,
    text(font: sans, size: 6pt, fill: ink-2, tracking: 0.06em, weight: 700)[#upper("Slot")]),
  ..dias.map(d => align(center + horizon,
    text(font: sans, size: 6pt, fill: ink-2, tracking: 0.06em, weight: 700)[#upper(d)]))
)
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))

#for slot in ("M1", "M2", "M3", "M4") {
  grid(columns: col-r, column-gutter: 0pt,
    rect(width: 100%, height: rh-r, stroke: bs)[
      #align(left + horizon)[
        #pad(left: 1.5mm,
          text(font: sans, size: fs.label, fill: accent, weight: 700)[#slot])
      ]
    ],
    ..range(7).map(_ => rect(width: 100%, height: rh-r, stroke: bls)[])
  )
}
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
#v(2.5mm)

// ── AJUSTE & REFLEXÃO ────────────────────────────────────────────────────
#block(width: 100%, fill: band, inset: (x: 0mm, y: 2.5mm))[
  #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    seclbl("Ajuste & reflexão semanal"),
    text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[o que funcionou · o que ajustar])
  #v(2mm)
  #wline() #v(6mm)
  #wline() #v(6mm)
  #wline() #v(6mm)
  #wline()
]
#v(2.5mm)

// ── → MIGRAR ─────────────────────────────────────────────────────────────
#line(length: 100%, stroke: (paint: hair, thickness: 0.3pt))
#v(1.5mm)
#text(font: sans, size: 6.5pt, fill: ink-3, tracking: 1pt)[→ MIGRAR]
#v(2mm)
#wline() #v(6mm)
#wline() #v(6mm)
#wline()
