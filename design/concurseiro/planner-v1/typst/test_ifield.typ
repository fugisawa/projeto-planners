
#import "estilos.typ": *
#show: planner-page
#let ifield(lbl-txt, w: 22mm, unit: none) = box[
  #text(font: sans, size: fs.label, fill: ink-2, weight: "medium")[#lbl-txt ]
  #box(width: w, dot())
  #if unit != none { text(font: sans, size: fs.label, fill: ink-2)[ #unit] }
]
#let dot2(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))
test #ifield("Previsto", w: 14mm, unit: "h")
