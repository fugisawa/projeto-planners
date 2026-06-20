
#import "estilos.typ": *
#show: planner-page

#let prog5 = {
  for _ in range(5) {
    box(baseline: 0.2mm,
      rect(width: 3.4mm, height: 3.4mm, stroke: (paint: hair, thickness: wt.box)))
    h(0.4mm)
  }
}

#let mapa-row(last: false) = {
  grid(
    columns: (1fr, 14mm, auto),
    column-gutter: 2mm,
    align: (left + horizon, right + horizon, right + horizon),
    rows: (4mm,),
    box(width: 100%, height: 4mm,
      align(left + horizon, dot())
    ),
    box(height: 4mm, align(right + horizon,
      text(font: sans, size: 5.5pt, fill: ink-3)[__ %]
    )),
    box(height: 4mm, align(right + horizon, prog5)),
  )
  if not last {
    line(length: 100%, stroke: (paint: hair2, thickness: wt.hair))
  }
}

#mapa-row()
#mapa-row(last: true)
