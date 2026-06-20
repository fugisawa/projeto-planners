
#import "config.typ": *

#let dot(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))
#let mat = box(inset: (x: 2.6pt, y: 1.6pt), stroke: (paint: hair, thickness: wt.box),
  text(font: sans, size: 6pt, fill: ink-2, tracking: 0.6pt)[MAT])
#let chk = box(baseline: 1mm, circle(radius: 1.85mm, stroke: (paint: hair, thickness: wt.box)))
#let sqr = box(baseline: 0.6mm, rect(width: 2.8mm, height: 2.8mm, stroke: (paint: hair, thickness: wt.box)))

#rect(width: 10mm, height: 10mm, stroke: 0.4pt)
#mat #chk #sqr
