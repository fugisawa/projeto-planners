#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt) // controle total dos gaps via v()

// ── Helpers locais ─────────────────────────────────────────────────────────────

// Quadrado pintável de progresso (5 un = 0%→100%).
#let prog5 = {
  for _ in range(5) {
    box(baseline: 0.2mm,
      rect(width: 3.5mm, height: 3.5mm, stroke: (paint: hair, thickness: wt.box)))
    h(0.5mm)
  }
}

// Micro cabeçalho de coluna.
#let th(s) = text(font: sans, size: 5.5pt, fill: ink-2, weight: 700, tracking: 0.5pt)[#upper(s)]

// Célula KPI com largura fixa.
#let kpic(label, w: 20mm) = box(width: w)[
  #text(font: sans, size: 5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[#upper(label)]
  #v(0.8mm)
  #line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted"))
]

// Linha pontilhada de escrita em bloco próprio.
#let dline = block(width: 100%, above: 0pt, below: 0pt, spacing: 0pt, dot())

// Linha do stack digital.
#let stack-row(label) = {
  text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#label]
  v(0.8mm)
  line(length: 100%, stroke: (paint: hair, thickness: wt.hair, dash: "dotted"))
  v(2mm)
}

// ── Página ─────────────────────────────────────────────────────────────────────

#masthead("Bússola da Jornada", kicker: "Frontmatter")

// ── Objetivo + Por que ─────────────────────────────────────────────────────────
#grid(columns: (auto, 1fr), column-gutter: 2.5mm, align: left + horizon,
  text(font: sans, size: fs.label, fill: ink-2)[Meu objetivo / cargo-alvo],
  wline(),
)
#v(3mm)
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Por que quero isso?]
#v(2mm)
#dline #v(2.5mm) #dline #v(2.5mm) #dline #v(2.5mm) #dline
#v(4mm)

// ── Duas colunas ───────────────────────────────────────────────────────────────
#grid(
  columns: (1fr, 52mm),
  column-gutter: 5mm,

  // ── ESQUERDA: Mapa do edital (tabela com chip de cor) ────────────────────
  [
    #sechead("Mapa do edital", hint: "visão macro")
    // Cabeçalho manual da tabela
    #grid(
      columns: (5.5mm, 1fr, 13mm, auto),
      column-gutter: 1.5mm,
      align: (center + horizon, left + horizon, right + horizon, right + horizon),
      [], th("Bloco / Matéria"), th("Peso"), th("Progresso"),
    )
    #v(0.8mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    // Tabela unificada: chip | matéria (pontilhado) | peso (%) | progresso (prog5)
    // Usa table() para rows fixas de 4.5mm — mais estável que grid empilhado
    #let n = 12
    #let cells = ()
    #for i in range(n) {
      // chip
      cells.push(align(center + horizon,
        rect(width: 4mm, height: 3.5mm, fill: none, stroke: (paint: hair, thickness: wt.box))
      ))
      // matéria (pontilhado)
      cells.push(box(width: 100%, align(left + horizon, dot())))
      // peso %
      cells.push(align(right + horizon,
        text(font: sans, size: 5pt, fill: ink-3)[%]
      ))
      // progresso (5 quadradinhos)
      cells.push(align(right + horizon, prog5))
    }
    #table(
      columns: (5.5mm, 1fr, 9mm, auto),
      rows: 4.5mm,
      inset: (x, y) => {
        if x == 0 { (x: 0.8mm, y: 0.5mm) }
        else if x == 2 { (x: 1mm, y: 0.5mm) }
        else { (x: 1mm, y: 0.5mm) }
      },
      align: (center + horizon, left + horizon, right + horizon, right + horizon),
      stroke: (x, y) => (paint: grid-c, thickness: wt.hair),
      ..cells
    )
    #v(2mm)
    // Legenda de progresso
    #grid(
      columns: (auto, auto, auto, 1fr),
      column-gutter: 2mm,
      align: left + horizon,
      rect(width: 3.5mm, height: 3.5mm, fill: none, stroke: (paint: hair, thickness: wt.box)),
      rect(width: 3.5mm, height: 3.5mm, fill: grid-c, stroke: (paint: hair, thickness: wt.box)),
      rect(width: 3.5mm, height: 3.5mm, fill: ink-2, stroke: (paint: hair, thickness: wt.box)),
      align(left + horizon,
        text(font: sans, size: 5pt, fill: ink-3)[0% → 100% (pintável)]
      ),
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
    // Cabeçalho
    #grid(
      columns: (1fr, 11mm, 9mm, 7mm),
      column-gutter: 1mm,
      align: (left + horizon, left + horizon, left + horizon, right + horizon),
      th("Concurso"), th("Fase"), th("Data"), th("D-"),
    )
    #v(0.8mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    // 4 linhas em tabela — rows fixas de 5.5mm (espaço real p/ escrita à mão)
    #table(
      columns: (1fr, 11mm, 9mm, 7mm),
      rows: 5.5mm,
      inset: (x, y) => (x: 1mm, y: 0.5mm),
      align: left + horizon,
      stroke: (x, y) => if y > 0 { (top: (paint: grid-c, thickness: wt.hair)) } else { none },
      dot(), dot(), dot(), dot(),
      dot(), dot(), dot(), dot(),
      dot(), dot(), dot(), dot(),
      dot(), dot(), dot(), dot(),
    )
  ],
)

#v(4mm)

// ── Balanço mensal ─────────────────────────────────────────────────────────────
#sechead("Balanço mensal", hint: "replicar a cada fechamento")

#softband[
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
  #v(3.5mm)
  #box(width: 100%)[
    #kpic("Anki criados", w: 25mm)
    #h(3mm)
    #kpic("Anki revisados", w: 25mm)
  ]
]

#v(4mm)

// ── Reflexão mensal ────────────────────────────────────────────────────────────
#grid(
  columns: (1fr, 1fr),
  column-gutter: 5mm,
  [
    #seclbl("O que foi bem")
    #v(2.5mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    #v(2.5mm)
    #dline #v(5mm) #dline #v(5mm) #dline #v(5mm) #dline
  ],
  [
    #seclbl("O que precisa mudar")
    #v(2.5mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    #v(2.5mm)
    #dline #v(5mm) #dline #v(5mm) #dline #v(5mm) #dline
  ],
)

#v(4mm)

// ── Foco do próximo ciclo (fecha o loop mensal) ────────────────────────────────
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
#v(2.5mm)
#text(font: sans, size: fs.micro, fill: ink-3, tracking: 0.5pt)[#upper("→ Foco do próximo ciclo")]
#v(3mm)
#dline #v(5mm) #dline #v(5mm) #dline
