
#import "estilos.typ": *
#show: planner-page

#let prog5 = {
  for _ in range(5) {
    box(rect(width: 3.4mm, height: 3.4mm, stroke: wt.box))
    h(0.4mm)
  }
}

#prog5
