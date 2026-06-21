#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Helpers locais ────────────────────────────────────────────────────────────
#let lb(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]
#let th(s) = text(font: sans, size: 5.5pt, fill: ink-2, weight: 700, tracking: 0.4pt)[#upper(s)]
#let dline = block(width: 100%, above: 0pt, below: 0pt, spacing: 0pt, dot())
#let optbox(label) = box(baseline: 0.5mm)[#checkbox#h(1.4mm)#lb(label)]
#let stackrow(label) = {
  text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#label]
  v(0.8mm); line(length: 100%, stroke: (paint: hair, thickness: wt.hair)); v(2.2mm)
}

// Uma linha do Registro: chip 8mm (pintável, dicionário de cor) · matéria · meta · 100h · recorde.
#let ledgerrow = {
  grid(columns: (9mm, 1fr, 13mm, 44mm, 15mm), column-gutter: 2mm, align: bottom,
    align(center + horizon, box(width: 8mm, height: 5mm, stroke: (paint: hair, thickness: wt.box))),
    wline(),
    box[#box(width: 1fr, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))#text(font: sans, size: 6.5pt, fill: ink-3)[ h]],
    align(center + bottom, decadestrip(cell: 4mm)),
    wline(),
  )
  v(3.4mm)
}

// ── Masthead — frontmatter ────────────────────────────────────────────────────
#masthead("Bússola da Jornada", kicker: "Frontmatter")

// ── Objetivo + Por quê (4 linhas) ─────────────────────────────────────────────
#lb("Meu objetivo / cargo-alvo")
#v(1.8mm) #wline() #v(3mm)
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Por que quero isso?]
#v(2mm)
#dline #v(4.5mm) #dline #v(4.5mm) #dline #v(4.5mm) #dline
#v(3.5mm)

// ── Fase atual + foco crítico (mapa pessoal, não edital) ──────────────────────
#grid(columns: (auto, 1fr), column-gutter: 3mm, align: horizon,
  lb("Fase atual"),
  box[#optbox("Conteúdo novo")#h(4mm)#optbox("Questões")#h(4mm)#optbox("Revisão")#h(4mm)#optbox("Reta final")],
)
#v(3mm)
#grid(columns: (auto, 1fr, 1fr, 1fr), column-gutter: 4mm, align: bottom,
  lb("Foco crítico da fase"), wline(), wline(), wline(),
)
#v(4.5mm)

// ── REGISTRO DE MATÉRIAS — o ledger + dicionário de cor ───────────────────────
#sechead("Registro de matérias", hint: "cor · meta · 1 faixa = 100 h · recorde")
#grid(columns: (9mm, 1fr, 13mm, 44mm, 15mm), column-gutter: 2mm, align: bottom,
  align(center, th("Cor")), th("Matéria"), align(center, th("Meta")),
  align(center, th("Progresso  ·  cada □ = 10 h")), align(center, th("Recorde")),
)
#v(1.5mm)
#ledgerrow #ledgerrow #ledgerrow #ledgerrow #ledgerrow #ledgerrow
#v(2mm)

// ── Meu stack + Calendário de provas (2 colunas) ──────────────────────────────
#grid(columns: (46mm, 1fr), column-gutter: 7mm, align: top,
  [
    #sechead("Meu stack", hint: "1 vez")
    #stackrow("Questões")
    #stackrow("Revisão espaçada")
    #stackrow("Aulas / cursinho")
    #stackrow("Foco / tempo")
  ],
  [
    #sechead("Calendário de provas")
    #table(
      columns: (1fr, 10mm, 16mm, 9mm),
      rows: (auto,) + (6.5mm,) * 4,
      inset: (x: 1.2mm, y: 0pt),
      align: (left + horizon, left + horizon, left + horizon, right + horizon),
      stroke: (x, y) => (bottom: (paint: hair, thickness: wt.hair)),
      th("Concurso"), th("Fase"), th("Data"), th("D-"),
      [], [], [], [],
      [], [], [], [],
      [], [], [], [],
      [], [], [], [],
    )
  ],
)
