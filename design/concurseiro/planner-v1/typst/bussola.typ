#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt) // controle total dos gaps via v()

// ── Helpers locais ─────────────────────────────────────────────────────────────

// Quadrados pintáveis de progresso (5 un = 0%→100%).
#let prog5 = {
  for _ in range(5) {
    box(baseline: 0.2mm,
      rect(width: 3.2mm, height: 3.2mm, stroke: (paint: hair, thickness: wt.box)))
    h(0.5mm)
  }
}

// Micro cabeçalho de coluna.
#let th(s) = text(font: sans, size: 5.5pt, fill: ink-2, weight: 700, tracking: 0.5pt)[#upper(s)]

// Célula peso (linha de escrita + %), para a tabela do edital.
#let pesocell = box[#box(width: 4mm, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))#h(0.6mm)#text(font: sans, size: 5.5pt, fill: ink-3)[%]]

// Célula KPI com largura fixa — rótulo acima, linha na BASE (align: bottom).
#let kpic(label, w: 20mm) = box(width: w, height: 6.5mm, clip: false)[
  #stack(dir: ttb, spacing: 0pt,
    text(font: sans, size: 5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[#upper(label)],
    v(1fr),
    line(length: 100%, stroke: (paint: hair, thickness: wt.hair)),
  )
]

// Linha sólida de escrita em bloco próprio (substitui dline pontilhado).
#let dline = block(width: 100%, above: 0pt, below: 0pt, spacing: 0pt, wline())

// Linha do stack digital — sólida.
#let stack-row(label) = {
  text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#label]
  v(0.8mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
  v(2mm)
}

// ── Página ─────────────────────────────────────────────────────────────────────

#masthead("Bússola da Jornada", kicker: "Frontmatter")

// ── Objetivo + Por que ─────────────────────────────────────────────────────────
#text(font: sans, size: fs.label, fill: ink-2)[Meu objetivo / cargo-alvo]
#v(1.8mm)
#wline()
#v(3mm)
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Por que quero isso?]
#v(2mm)
#dline #v(4.5mm) #dline #v(4.5mm) #dline #v(4.5mm) #dline
#v(3.5mm)

// ── Duas colunas ───────────────────────────────────────────────────────────────
#grid(
  columns: (1fr, 52mm),
  column-gutter: 5mm,

  // ── ESQUERDA: Mapa do edital (tabela com header integrado + chip de cor) ──
  [
    #sechead("Mapa do edital", hint: "visão macro")
    #let ecells = (
      [], th("Bloco / Matéria"), align(right + horizon, th("Peso")), align(right + horizon, th("Progresso")),
    )
    #for i in range(12) {
      ecells.push(align(center + horizon, rect(width: 4mm, height: 3.4mm, fill: none, stroke: (paint: hair, thickness: wt.box))))
      ecells.push(align(left + horizon, wline()))
      ecells.push(align(right + horizon, pesocell))
      ecells.push(align(right + horizon, prog5))
    }
    #table(
      columns: (5.5mm, 1fr, 11mm, auto),
      rows: (auto,) + (4.5mm,) * 12,
      inset: (x, y) => (x: 1mm, y: 0.5mm),
      align: (center + horizon, left + horizon, right + horizon, right + horizon),
      stroke: (x, y) => if y == 0 { (bottom: (paint: hair, thickness: wt.hair)) } else { (top: (paint: grid-c, thickness: wt.hair)) },
      ..ecells
    )
    #v(2mm)
    // Legenda de progresso
    #grid(
      columns: (auto, auto, auto, 1fr),
      column-gutter: 2mm,
      align: left + horizon,
      rect(width: 3.2mm, height: 3.2mm, fill: none, stroke: (paint: hair, thickness: wt.box)),
      rect(width: 3.2mm, height: 3.2mm, fill: grid-c, stroke: (paint: hair, thickness: wt.box)),
      rect(width: 3.2mm, height: 3.2mm, fill: ink-2, stroke: (paint: hair, thickness: wt.box)),
      align(left + horizon, text(font: sans, size: 5pt, fill: ink-3)[0% → 100% (pintável)]),
    )
  ],

  // ── DIREITA: Stack + Calendário ───────────────────────────────────────────
  [
    #sechead("Meu stack", hint: "preencher uma vez")
    #stack-row("Cursinho / trilha")
    #stack-row("Banco de questões")
    #stack-row("Revisão espaçada (Anki)")
    #stack-row("Simulados")
    #stack-row("App de foco / tempo")
    #stack-row("Outro")
    #v(3mm)
    #sechead("Calendário de provas")
    // Header integrado na tabela → colunas alinhadas; D-/Data com espaço de escrita
    #table(
      columns: (1fr, 9mm, 12mm, 8mm),
      rows: (auto,) + (5.6mm,) * 4,
      inset: (x, y) => (x: 1mm, y: 0.6mm),
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

#v(3mm)

// ── Balanço mensal ─────────────────────────────────────────────────────────────
#sechead("Balanço mensal", hint: "replicar a cada fechamento")

#block(width: 100%, fill: band, inset: (x: 0mm, y: 2.5mm))[
  #box(width: 100%)[
    #kpic("Mês", w: 11mm)
    #h(3mm)
    #kpic("Horas", w: 13mm)
    #h(3mm)
    #kpic("Questões", w: 20mm)
    #h(3mm)
    #kpic("% Acerto", w: 16mm)
    #h(3mm)
    #kpic("Discursivas", w: 20mm)
  ]
  #v(2mm)
  #box(width: 100%)[
    #kpic("Anki criados", w: 25mm)
    #h(3mm)
    #kpic("Anki revisados", w: 25mm)
  ]
]

#v(3mm)

// ── Reflexão mensal ────────────────────────────────────────────────────────────
#grid(
  columns: (1fr, 1fr),
  column-gutter: 5mm,
  [
    #seclbl("O que foi bem")
    #v(2.5mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    #v(2.5mm)
    #dline #v(4.5mm) #dline #v(4.5mm) #dline #v(4.5mm) #dline
  ],
  [
    #seclbl("O que precisa mudar")
    #v(2.5mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    #v(2.5mm)
    #dline #v(4.5mm) #dline #v(4.5mm) #dline #v(4.5mm) #dline
  ],
)

#v(4mm)

// ── Foco do próximo ciclo (fecha o loop mensal) ────────────────────────────────
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
#v(2.5mm)
#text(font: sans, size: fs.micro, fill: ink-3, tracking: 0.5pt)[#upper("→ Foco do próximo ciclo")]
#v(2.5mm)
#dline #v(4.5mm) #dline #v(4.5mm) #dline
