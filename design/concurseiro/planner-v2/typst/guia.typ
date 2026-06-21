#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

#masthead("Guia de uso", kicker: "Comece por aqui")

#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[
  Este planner é um hub analógico: ele te ajuda a decidir e processar; o digital
  (Anki, QConcursos, cursinho) executa e guarda. Eles se completam — não competem.
]
#v(4mm)

// ── O sistema (4 módulos) ─────────────────────────────────────────────────
#sechead("O sistema", hint: "o ciclo, em 4 módulos")
#let step(n, name, when, desc) = {
  grid(columns: (6mm, 1fr, auto), column-gutter: 3mm, align: (left + horizon, left + horizon, right + horizon),
    text(font: sans, size: 12pt, fill: title-c, weight: 900)[#n],
    {
      text(font: sans, size: fs.label, fill: ink, weight: 700)[#name]
      h(2.5mm)
      text(font: sans, size: fs.micro, fill: ink-3)[#desc]
    },
    text(font: sans, size: 6.5pt, fill: ink-3, style: "italic")[#when],
  )
  v(3.2mm)
}
#step("1", "Bússola", "1 vez", "alvo · mapa do edital · stack · calendário")
#step("2", "Semanal", "toda semana", "metas por matéria · rotação · ajuste")
#step("3", "Diário", "todo dia", "time-log · estudar · revisar · fechamento")
#step("4", "Pontes Digitais", "semanal", "questões · Anki · aulas · simulados · ajuste de rota")
#v(2mm)

// ── Como pintar o tempo ───────────────────────────────────────────────────
#sechead("Como pintar o tempo")
#grid(columns: (auto, 1fr), column-gutter: 4mm, align: horizon,
  table(columns: (5mm,) * 6, rows: 4.5mm, inset: 0pt,
    stroke: (x, y) => (left: (paint: grid-c, thickness: wt.grid), right: (paint: grid-c, thickness: wt.grid),
      top: (paint: grid-h, thickness: wt.gridh), bottom: (paint: grid-h, thickness: wt.gridh)),
    ..range(6).map(_ => [])),
  text(font: sans, size: fs.micro, fill: ink-2)[
    Cada quadradinho = *10 min* · uma linha de 6 = *1 hora*. Pinte o tempo de fato
    estudado, na *cor da matéria* — o bloco colorido vira seu mapa de esforço do dia.
  ],
)
#v(4mm)

// ── 2 colunas ─────────────────────────────────────────────────────────────
#grid(columns: (1fr, 1fr), column-gutter: 7mm,

  // ── Símbolos de status de tarefa (inovação v2) ──
  [
    #sechead("Símbolos de status")
    #let symrow(sym, meaning) = {
      grid(columns: (14mm, 1fr), column-gutter: 2mm, align: (center + horizon, left + horizon),
        sym, text(font: sans, size: fs.micro, fill: ink-2)[#meaning])
      v(2.8mm)
    }
    // Seletor de 4 estados — pré-impresso em cada linha de tarefa
    #text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Nas linhas de tarefa:]
    #v(2mm)
    #symrow(
      box(circle(radius: 1.6mm, stroke: (paint: hair, thickness: wt.box))),
      "cumprida · pinte ●"
    )
    #symrow(
      box(text(font: (sans, "Noto Sans"), size: 7.5pt, fill: ink-2)[△]),
      "parcial (continua amanhã)"
    )
    #symrow(
      box(text(font: sans, size: 8pt, fill: accent, weight: 700)[→]),
      "adiada · vá para → Migrar"
    )
    #symrow(
      box(text(font: sans, size: 8pt, fill: ink-3)[×]),
      "eliminada (não faz sentido)"
    )
    #v(1mm)
    #line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
    #v(2mm)
    #text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[No Semanal:]
    #v(2mm)
    #symrow(
      box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, stroke: (paint: hair, thickness: wt.box))),
      "a fazer"
    )
    #symrow(
      box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, fill: ink-2, stroke: (paint: hair, thickness: wt.box))),
      "feito"
    )
  ],

  // ── Cores ──
  [
    #sechead("Cores", hint: "pinte 1 vez; vale em tudo")
    #let colorrow = {
      grid(columns: (8mm, 1fr), column-gutter: 2.5mm, align: (left + horizon, left + bottom),
        chip, box(inset: (bottom: 1mm), wline()))
      v(2.9mm)
    }
    #for _ in range(8) { colorrow }
  ],
)

#v(4mm)

// ── Revisão espaçada ─────────────────────────────────────────────────────
#sechead("Revisão espaçada", hint: "o que você estuda hoje volta nestes dias")
#grid(columns: (auto, 1fr), column-gutter: 5mm, align: horizon,
  {
    // v2 adiciona D+3 (confirmado por pesquisa de spaced repetition)
    for d in ("D+1", "D+3", "D+7", "D+15", "D+30") {
      box(inset: (x: 2.2mm, y: 1.3mm), stroke: (paint: hair, thickness: wt.box),
        text(font: sans, size: fs.micro, fill: ink-2, weight: 700)[#d])
      h(2mm)
    }
  },
  text(font: sans, size: fs.micro, fill: ink-3)[
    Revise cada conteúdo 1, 3, 7, 15 e 30 dias depois de estudar. O *Diário*
    (Revisar) já traz esses marcos — é só seguir e marcar o status.
  ],
)
