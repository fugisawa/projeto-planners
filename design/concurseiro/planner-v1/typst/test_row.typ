
#import "estilos.typ": *
#show: planner-page

#let mapa-row(last: false) = {
  grid(
    columns: (1fr, 14mm, auto),
    column-gutter: 2mm,
    align: (left + horizon, right + horizon, right + horizon),
    rows: (4mm,),
    box(width: 100%, height: 4mm,
      align(left + horizon, [test])
    ),
    box(height: 4mm, [peso]),
    box(height: 4mm, [prog]),
  )
}

#mapa-row()
