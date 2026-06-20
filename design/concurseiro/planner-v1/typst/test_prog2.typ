
#import "estilos.typ": *
#show: planner-page

#let prog5 = {
  for _ in range(5) {
    box(baseline: 0.2mm,
      rect(width: 3.4mm, height: 3.4mm, stroke: (paint: hair, thickness: wt.box)))
    h(0.4mm)
  }
}

// set par AFTER the function definition
#set par(spacing: 0pt)
#prog5
