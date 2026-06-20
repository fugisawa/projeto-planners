
#import "estilos.typ": *
#show: planner-page

#let kpic(label) = {
  text(font: sans, size: 5pt, fill: ink-2, weight: "medium", tracking: 0.3pt)[#upper(label)]
  v(0.4mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted"))
}

#block(width: 100%, fill: tint, inset: (x: 3mm, y: 2.2mm), radius: 1pt)[
  #set par(spacing: 0pt, leading: 0pt)
  #set text(features: ("tnum",))
  #grid(
    columns: (14mm, 14mm, 1fr, 1fr),
    column-gutter: 2.5mm,
    align: left + top,
    kpic("Mes"),
    kpic("Horas"),
    kpic("Questoes"),
    kpic("Acerto"),
  )
]
Hello
