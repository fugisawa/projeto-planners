
#import "config.typ": *

#let dot(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))
#let pcell = box(width: 100%, height: 4.4mm, stroke: (paint: hair2, thickness: wt.box))

#rect(width: 10mm, height: 10mm, stroke: 0.4pt)
#pcell
