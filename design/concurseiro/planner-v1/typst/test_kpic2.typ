
#import "estilos.typ": *
#show: planner-page

#let kpic(label) = {
  text(font: sans, size: 5pt, fill: ink-2, weight: "medium", tracking: 0.3pt)[#upper(label)]
  v(0.4mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted"))
}

#rect(width: 10mm, height: 10mm, stroke: 0.4pt)
#kpic("Test")
