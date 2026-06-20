
#import "config.typ": *

#let dot(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))

#rect(width: 10mm, height: 10mm, stroke: 0.4pt)
#dot()
