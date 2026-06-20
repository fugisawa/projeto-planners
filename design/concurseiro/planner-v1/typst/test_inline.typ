
#import "config.typ": *

// All of estilos inline:
#let planner-page(body) = {
  set page(width: pg.w, height: pg.h,
    margin: (left: pg.inside, right: pg.outside, top: pg.top, bottom: pg.bottom),
    fill: none)
  set text(font: sans, size: fs.body, fill: ink, lang: "pt")
  set par(leading: 0.62em, spacing: 0.9em)
  body
}
#let lbl(s, size: fs.h2, fill: ink-2, track: 1.6pt, weight: "medium") = {
  text(font: sans, size: size, fill: fill, weight: weight, tracking: track)[#upper(s)]
}
#let dot(w: 1fr) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted")))
#let masthead(title, kicker: none) = {
  grid(columns: (1fr, auto), align: (left + bottom, right + bottom),
    text(font: serif, size: fs.title, fill: ink, weight: "medium")[#title],
    if kicker != none { text(font: sans, size: fs.micro, fill: ink-3, tracking: 1.4pt)[#upper(kicker)] },
  )
  v(1.4mm)
  line(length: 100%, stroke: (paint: ink, thickness: wt.rule))
  v(2.6mm)
}
#let sechead(label, hint: none) = {
  grid(columns: (auto, 1fr, auto), column-gutter: 2.2mm,
    align: (left + horizon, left + horizon, right + horizon),
    box(width: 4pt, height: 4pt, fill: accent),
    lbl(label),
    if hint != none { text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#hint] } else [],
  )
  v(1mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
  v(2.2mm)
}
#show: planner-page
#rect(width: 10mm, height: 10mm, stroke: 0.4pt)
Hello
