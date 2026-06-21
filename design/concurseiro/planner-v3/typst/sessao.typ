#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Helpers locais ────────────────────────────────────────────────────────────
#let lb(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]
#let optbox(label) = box(baseline: 0.5mm)[#checkbox#h(1.4mm)#text(font: sans, size: fs.micro, fill: ink-2)[#label]]

// Plano do dia: [cor │ matéria │ o que vou fazer │ ○△→×]. A cor conecta o plano
// ao time-log e ao Registro de Matérias (um sistema de cor só: cor = matéria).
#let planorows(n: 5, rh: 5.6mm) = {
  let cells = ()
  for _ in range(n) { cells += (align(center + horizon, colorsq), [], [], statusstrip) }
  table(
    columns: (5mm, 16mm, 1fr, 15mm), rows: rh, align: horizon,
    inset: (x, y) => if x == 0 { (x: 0.6mm, y: 0pt) } else { (x: 1.6mm, y: 0pt) },
    stroke: (x, y) => (bottom: (paint: hair, thickness: wt.hair),
                       right: if x == 0 or x == 1 { (paint: hair, thickness: wt.hair) } else { none }),
    ..cells
  )
}

// ── Cabeçalho integrado: Data (1fr) · D-prova (centro) · Horas líquidas (dir.) ─
// Proporção INDIGO real (DATE / D-DAY / TIME), em vez do D-prova solto no canto.
#eyebrow("Sessão", kicker: "foco do dia")
#grid(columns: (1fr, 22mm, 26mm), column-gutter: 6mm, align: bottom,
  fieldcol("Data"),
  align(center, stack(dir: ttb, spacing: 1.2mm,
    text(font: sans, size: fs.micro, fill: ink-3)[D-prova],
    circle(radius: 4mm, stroke: (paint: accent, thickness: 0.8pt)))),
  stack(dir: ttb, spacing: 1.4mm,
    text(font: sans, size: fs.micro, fill: ink-3)[Horas líquidas],
    box[#box(width: 1fr, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))#lb(" h")]),
)
#v(3.5mm)

// ── Intenção do dia (implementation intention — escrever ANTES) ───────────────
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Antes de começar — esta sessão é para:]
#v(1.6mm)
#wline()
#v(3.5mm)

// ── ESTUDAR — o plano (cor = matéria; marque a cor e use a mesma no time-log) ──
#softhead("Estudar", hint: "o plano · cor · matéria · o que vou fazer")
#planorows(n: 5)
#v(3mm)

// ── TEMPO DE ESTUDO — pinte o tempo REAL na cor da matéria (06–23h) ───────────
// A pintura mostra a DISTRIBUIÇÃO das horas entre matérias e o gap plano-vs-real.
#grid(columns: (1fr, auto), align: (left + horizon, right + bottom),
  text(font: sans, size: 8.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Tempo de estudo],
  text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[pinte o tempo REAL na cor da matéria · 1 quadradinho = 10 min])
#v(1mm)
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
#v(1.5mm)
#grid(columns: (1fr, 1fr, 1fr), column-gutter: 5mm,
  timeblock("Manhã", ("06", "07", "08", "09", "10", "11")),
  timeblock("Tarde", ("12", "13", "14", "15", "16", "17")),
  timeblock("Noite", ("18", "19", "20", "21", "22", "23")),
)
#v(3mm)

// ── FECHAR O DIA — output (o que o tempo produziu) + autoavaliação ────────────
#grid(columns: (auto, 14mm, auto, 12mm, auto, 1fr, auto), column-gutter: 2.2mm, align: bottom,
  lb("Questões"), box(width: 14mm, line(length: 100%, stroke: (paint: hair, thickness: wt.hair))),
  lb("Acertos"), box(width: 12mm, line(length: 100%, stroke: (paint: hair, thickness: wt.hair))),
  lb("%"),
  align(right + bottom, text(font: sans, size: fs.micro, fill: ink-3)[foco da sessão (1–5)]),
  box(baseline: 1.2mm, ratingdots),
)
#v(3mm)

// ── REVISAR / PRATICAR — o papel decide; o digital executa ────────────────────
// Revisão não é só Anki: inclui resolver questões (QConcursos) e treinar discursivas.
#block(width: 100%, fill: band, inset: (x: 3.5mm, y: 2.8mm))[
  #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    text(font: sans, size: 8.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Revisar / praticar],
    text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[você decide · erro → Caderno de Erros])
  #v(2.2mm)
  #box[#optbox("Anki")#h(5mm)#optbox("Questões (QConcursos)")#h(5mm)#optbox("Discursiva")#h(5mm)#optbox("Lei seca")]
  #v(2.6mm)
  #wline() #v(4.5mm) #wline()
]
#v(2.8mm)

// ── AMANHÃ — ritual de fechamento (ajuste de rota, não balanço moral) ─────────
#text(font: sans, size: 7.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Amanhã ajusto ·]
#v(2mm)
#wline() #v(4.5mm) #wline()
