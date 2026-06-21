#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)
#set text(hyphenate: false)

// ── Helpers locais ───────────────────────────────────────────────────────────

// Rótulo de campo
#let lb(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]

// Sufixo de campo (ex.: %)
#let sfx(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]

// Campo elástico: rótulo + linha SÓLIDA preenche o espaço restante (base do texto)
#let fe(label) = grid(
  columns: (auto, 1fr), column-gutter: 1mm, align: bottom,
  box(lb(label + " ")), wline(),
)

// Campo elástico com sufixo (base do texto)
#let fes(label, suffix) = grid(
  columns: (auto, 1fr, auto), column-gutter: 1mm, align: bottom,
  box(lb(label + " ")), wline(), sfx(suffix),
)

// Linha sólida de largura fixa (substitui dw/dot)
#let fw(w) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))

// Opção de ritmo: checkbox + rótulo
#let opt(label) = box(baseline: 0.5mm)[#checkbox#h(1.5mm)#lb(label)]

// ── Masthead ─────────────────────────────────────────────────────────────────

#masthead("Pontes Digitais", kicker: "Semanal · Quinzenal")

// Linha de semana — Sem. ___ de ___ a ___
#grid(
  columns: (auto, 16mm, auto, 16mm, auto, 16mm),
  column-gutter: 1.5mm,
  align: bottom,
  lb("Sem."), fw(16mm), lb("de"), fw(16mm), lb("a"), fw(16mm),
)
#v(7mm)

// ── 1 · Banco de questões ────────────────────────────────────────────────────

#sechead("Banco de questões", hint: "QConcursos · Estratégia · Gran")
#grid(
  columns: (auto, 14mm, auto, 1fr, auto),
  column-gutter: 1.5mm, align: bottom,
  lb("Acerto geral "), fw(14mm), sfx("%"),
  fe("Melhor matéria"), sfx("%"),
)
#v(4mm)
#grid(
  columns: (1fr, auto, auto, 14mm),
  column-gutter: 1.5mm, align: bottom,
  fe("Pior matéria"), sfx("%"),
  lb("   Total questões "), fw(14mm),
)
#v(8mm)

// ── 2 · Anki / revisão espaçada ──────────────────────────────────────────────

#sechead("Anki / revisão espaçada")
#grid(columns: (1fr, 6mm, 1fr), column-gutter: 0mm, align: bottom,
  fe("Cards maduros (>21 d.)"), [],
  fes("Retenção média", " %"),
)
#v(4mm)
#grid(columns: (1fr, 6mm, 1fr), column-gutter: 0mm, align: bottom,
  fe("Novos cards"), [], fe("Atrasados"),
)
#v(8mm)

// ── 3 · Aulas / cursinho ─────────────────────────────────────────────────────

#sechead("Aulas / cursinho")
#grid(
  columns: (auto, 14mm, 1fr, auto, 14mm, auto),
  column-gutter: 1.5mm, align: bottom,
  lb("Aulas concluídas "), fw(14mm),
  fe("Módulo atual"),
  lb("% módulo "), fw(12mm), sfx("%"),
)
#v(4mm)
#lb("Ritmo: ")#h(2.5mm)#opt("No ritmo")#h(7mm)#opt("Atrasado")#h(7mm)#opt("À frente")
#v(8mm)

// ── 4 · Simulados ────────────────────────────────────────────────────────────

#sechead("Simulados", hint: "preencher só quando houver")

// Cabeçalho de colunas
#grid(
  columns: (1fr, 20mm, 16mm, 16mm, 1fr),
  column-gutter: 2mm, align: bottom,
  text(font: sans, size: 6.5pt, fill: ink-3, tracking: 0.3pt)[CONCURSO / BANCA],
  text(font: sans, size: 6.5pt, fill: ink-3, tracking: 0.3pt)[DATA],
  text(font: sans, size: 6.5pt, fill: ink-3, tracking: 0.3pt)[NOTA],
  text(font: sans, size: 6.5pt, fill: ink-3, tracking: 0.3pt)[META],
  text(font: sans, size: 6.5pt, fill: ink-3, tracking: 0.3pt)[PONTO MAIS FRACO],
)
#v(2mm)
#line(length: 100%, stroke: (paint: grid-c, thickness: 0.4pt))
// Linha 1 de dados
#v(4mm)
#grid(
  columns: (1fr, 20mm, 16mm, 16mm, 1fr),
  column-gutter: 2mm, align: bottom,
  wline(), wline(), wline(), wline(), wline(),
)
#v(4mm)
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
// Linha 2 de dados
#v(4mm)
#grid(
  columns: (1fr, 20mm, 16mm, 16mm, 1fr),
  column-gutter: 2mm, align: bottom,
  wline(), wline(), wline(), wline(), wline(),
)
#v(4mm)
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
#v(6mm)

// ── 5 · Ajuste de Rota ───────────────────────────────────────────────────────

// Faixa largura cheia (inset x:0mm): linhas de escrita alinham com conteúdo externo.
#block(width: 100%, fill: band, inset: (x: 0mm, y: 3mm))[
  #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    seclbl("Ajuste de Rota"),
    text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[dado → ação])
  #v(3.5mm)
  // Campo A: O que o dado revela
  #text(font: sans, size: fs.label, fill: ink-3, style: "italic")[O que o dado revela]
  #v(2.5mm)
  #wline()
  #v(6mm)
  #wline()
  #v(6mm)
  // Campo B: O que farei diferente
  #text(font: sans, size: fs.label, fill: ink-3, style: "italic")[O que farei diferente]
  #v(2.5mm)
  #wline()
  #v(6mm)
  #wline()
  #v(6mm)
  // Sub-campos em 2 colunas
  #grid(
    columns: (1fr, 4mm, 1fr),
    column-gutter: 0mm,
    align: top,
    [
      #lb("→ Ajuste para próxima semana")
      #v(2.5mm)
      #wline()
      #v(6mm)
      #wline()
    ],
    [],
    [
      #lb("Sinal de alerta")
      #v(2.5mm)
      #wline()
      #v(6mm)
      #wline()
    ],
  )
]
