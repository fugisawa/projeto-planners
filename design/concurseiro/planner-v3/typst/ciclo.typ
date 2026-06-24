#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Helpers locais ────────────────────────────────────────────────────────────
#let lb(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]
#let fw(w) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))

// ── EYEBROW ───────────────────────────────────────────────────────────────────
// O ciclo avança BLOCO A BLOCO, não por dia da semana — fiel ao método e à prova
// de culpa de cronograma quebrado (pesquisa-v3-sintese §0).
#eyebrow("Ciclo de estudo", kicker: "avança por bloco · não por dia")

// ── Registro do ciclo ─────────────────────────────────────────────────────────
#grid(columns: (auto, 12mm, auto, 1fr, auto, 18mm),
  column-gutter: 1.5mm, align: bottom,
  lb("Ciclo nº"), fw(12mm),
  lb("· início"), fw(1fr),
  lb("· término"), fw(18mm),
)
#v(3mm)
#grid(columns: (auto, 16mm, auto, 1fr), column-gutter: 1.5mm, align: bottom,
  lb("Duração"), fw(16mm), lb("dias"), [],
)
#v(1.4mm)
#pad(left: 5mm, text(font: sans, size: 6pt, fill: ink-3, style: "italic")[quantos dias para fechar a fila — seu proxy de consistência])
#v(5mm)

// ── A FILA DE BLOCOS ──────────────────────────────────────────────────────────
// Montagem: liste as matérias ponderadas por peso no edital + dificuldade.
// Carga sugerida: 1h–2h30 por bloco. Marque ○ ao concluir; retome do próximo.
#sechead("A fila de blocos", hint: "matéria · carga · ○ ao concluir")
#cycletable(n: 12)
#v(3.5mm)

// ── Regras do ciclo (3 lembretes curtos, fundamentados) ───────────────────────
#block(width: 100%, fill: band, inset: (x: 3.5mm, y: 2.8mm))[
  #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    text(font: sans, size: 7.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Como rodar],
    text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[o ciclo é uma fila, não um calendário])
  #v(2.5mm)
  #let rule(n, body) = {
    grid(columns: (5mm, 1fr), column-gutter: 2mm, align: (left + horizon, left + horizon),
      text(font: sans, size: fs.label, fill: accent, weight: 700)[#n],
      text(font: sans, size: fs.micro, fill: ink-2)[#body])
    v(2.6mm)
  }
  #rule("1", [Estudou parte de um bloco? Retome de onde parou — *o bloco continua amanhã*, não recomeça.])
  #rule("2", [*Conteúdo novo → bloco; revisar e discriminar institutos → intercale.* Nunca lógica logo após constitucional.])
  #rule("3", [Fechou o último bloco? *Reinicie a fila* — independente de quantos dias levou. Sem dia perdido.])
]
#v(3.5mm)

// ── Ajuste do próximo ciclo ───────────────────────────────────────────────────
#line(length: 100%, stroke: (paint: hair, thickness: 0.3pt))
#v(1.5mm)
#text(font: sans, size: 6.5pt, fill: ink-3, tracking: 1pt)[→ AJUSTAR NO PRÓXIMO CICLO]
#v(2mm)
#grid(columns: (1fr, 5mm, 1fr), align: top,
  [
    #text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Dar mais carga a]
    #v(2mm) #wline() #v(5mm) #wline()
  ],
  [],
  [
    #text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Tirar carga de]
    #v(2mm) #wline() #v(5mm) #wline()
  ],
)
