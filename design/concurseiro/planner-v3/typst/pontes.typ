#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)
#set text(hyphenate: false)

// ── Helpers locais ────────────────────────────────────────────────────────────
#let lb(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]
#let fw(w) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))

// Uma ponte: [fonte + dica] │ sinal que li → decisão que tomo.
#let bridge(fonte, hint) = {
  grid(columns: (30mm, 1fr), column-gutter: 4mm, align: (left + top, left + top),
    box[
      #text(font: sans, size: fs.label, fill: ink, weight: 700)[#fonte]
      #v(0.8mm)
      #text(font: sans, size: 6pt, fill: ink-3, style: "italic")[#hint]
    ],
    box(width: 100%)[
      #grid(columns: (12mm, 1fr), column-gutter: 1.5mm, align: bottom,
        text(font: sans, size: fs.micro, fill: ink-3)[sinal], wline())
      #v(4.6mm)
      #grid(columns: (16mm, 1fr), column-gutter: 1.5mm, align: bottom,
        text(font: sans, size: fs.micro, fill: accent, weight: 700)[→ decisão], wline())
    ],
  )
  v(6.5mm)
}

// ── EYEBROW ───────────────────────────────────────────────────────────────────
// O digital calcula e guarda; aqui o papel decide o que fazer com o número.
#eyebrow("Pontes digitais", kicker: "o app mostra · você decide")

#grid(columns: (auto, 18mm, auto, 18mm, 1fr),
  column-gutter: 1.5mm, align: bottom,
  lb("Semana"), fw(18mm), lb("a"), fw(18mm), [],
)
#v(2mm)
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[
  Não copie números que o app já calcula. Leia o sinal, escreva a decisão.
]
#v(5mm)

// ── As pontes (sinal → decisão) ───────────────────────────────────────────────
#bridge("Questões", "QConcursos · TEC · Gran — % e raio-x por banca")
#bridge("Anki", "revisão espaçada — retenção, atrasados, o que ankificar")
#bridge("Aulas / cursinho", "trilha do curso — ritmo, módulo, o que pular")
#bridge("Lei seca / legislação", "vade mécum · lei seca — artigos que mais caem")

// ── Simulados ─────────────────────────────────────────────────────────────────
#sechead("Simulados", hint: "preencher só quando houver")
#table(
  columns: (1fr, 18mm, 14mm, 1fr),
  rows: (auto, 7mm, 7mm, 7mm),
  inset: (x, y) => (x: 1mm, y: 0.6mm),
  align: (left + horizon, left + horizon, left + horizon, left + horizon),
  stroke: (x, y) => (bottom: (paint: hair, thickness: wt.hair)),
  text(font: sans, size: 6pt, fill: ink-2, weight: 700, tracking: 0.4pt)[#upper("Concurso / banca")],
  text(font: sans, size: 6pt, fill: ink-2, weight: 700, tracking: 0.4pt)[#upper("Nota / meta")],
  text(font: sans, size: 6pt, fill: ink-2, weight: 700, tracking: 0.4pt)[#upper("Data")],
  text(font: sans, size: 6pt, fill: ink-2, weight: 700, tracking: 0.4pt)[#upper("Ponto mais fraco → ação")],
  [], [], [], [],
  [], [], [], [],
  [], [], [], [],
)
#v(5mm)

// ── Ajuste de Rota — a decisão da semana ──────────────────────────────────────
#block(width: 100%, fill: band, inset: (x: 3.5mm, y: 3mm))[
  #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    seclbl("Ajuste de rota"),
    text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[o que o dado revela → o que faço diferente])
  #v(3mm)
  #text(font: sans, size: fs.label, fill: ink-3, style: "italic")[O dado revela]
  #v(2.2mm) #wline() #v(5mm) #wline()
  #v(4mm)
  #text(font: sans, size: fs.label, fill: ink-3, style: "italic")[No próximo ciclo eu]
  #v(2.2mm) #wline() #v(5mm) #wline()
]
