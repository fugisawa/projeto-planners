
#import "estilos.typ": *
#show: planner-page

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
    box(height: 4mm, [x]),
  )
  if not last {
    line(length: 100%, stroke: (paint: hair2, thickness: wt.hair))
  }
}

#mapa-row()
