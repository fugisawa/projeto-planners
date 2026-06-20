
#import "config.typ": *

#let lbl(s, size: fs.h2, fill: ink-2, track: 1.6pt, weight: "medium") = {
  text(font: sans, size: size, fill: fill, weight: weight, tracking: track)[#upper(s)]
}

#rect(width: 10mm, height: 10mm, stroke: 0.4pt)
#lbl("Test")
