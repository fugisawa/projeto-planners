
#import "estilos.typ": *
#show: planner-page
#let rh = 7mm
#let col-metas = (1fr, 13mm, 17mm, 16mm, 9mm)
#let bot-stroke = (bottom: (paint: hair2, thickness: wt.hair))
#let bot-left-stroke = (bottom: (paint: hair2, thickness: wt.hair), left: (paint: hair2, thickness: wt.hair))
#for _ in range(8) {
  grid(columns: col-metas, column-gutter: 0pt,
    rect(width: 100%, height: rh, stroke: bot-stroke)[],
    rect(width: 100%, height: rh, stroke: bot-left-stroke)[],
  )
}
