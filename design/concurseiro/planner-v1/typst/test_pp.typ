
#import "config.typ": *

#let planner-page(body) = {
  set page(width: pg.w, height: pg.h,
    margin: (left: pg.inside, right: pg.outside, top: pg.top, bottom: pg.bottom),
    fill: none)
  set text(font: sans, size: fs.body, fill: ink, lang: "pt")
  set par(leading: 0.62em, spacing: 0.9em)
  body
}
#show: planner-page

#rect(width: 10mm, height: 10mm, stroke: 0.4pt)
Hello
