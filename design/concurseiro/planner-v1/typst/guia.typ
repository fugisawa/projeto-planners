#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt) // controle total dos gaps via v()

#masthead("Guia de uso", kicker: "Comece por aqui")

#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[
  Este planner é um hub analógico: ele te ajuda a decidir e processar; o digital
  (Anki, QConcursos, cursinho) executa e guarda. Eles se completam — não competem.
]
#v(4mm)

// ── O sistema (5 módulos) ──
#sechead("O sistema", hint: "o ciclo, em 5 módulos")
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
  v(3.4mm)
}
#step("1", "Bússola", "1 vez", "alvo · mapa do edital · stack · calendário")
#step("2", "Semanal", "toda semana", "metas por matéria · rotação · ajuste")
#step("3", "Diário", "todo dia", "tempo estudado · estudar/revisar · fechamento")
#step("4", "Diagnóstico de Erro", "1–3 / dia", "o que você pensou · a causa · quando revisar")
#step("5", "Pontes Digitais", "semanal", "questões · Anki · aulas · simulados")
#v(2.5mm)

// ── Como pintar o tempo (legenda do time-log, que saiu do corpo do Diário) ──
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

// ── 2 colunas: Símbolos + Cores ──
#grid(columns: (1fr, 1fr), column-gutter: 7mm,
  [
    #sechead("Símbolos")
    #let symrow(sym, meaning) = {
      grid(columns: (7mm, 1fr), column-gutter: 2.5mm, align: (center + horizon, left + horizon),
        sym, text(font: sans, size: fs.micro, fill: ink-2)[#meaning])
      v(2.6mm)
    }
    #symrow(box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, stroke: (paint: hair, thickness: wt.box))), "a fazer")
    #symrow(box(baseline: 0.4mm, rect(width: 3mm, height: 3mm, fill: ink-2, stroke: (paint: hair, thickness: wt.box))), "feito")
    #symrow(box(baseline: 0.2mm, circle(radius: 1.6mm, stroke: (paint: hair, thickness: wt.box))), "a revisar")
    #symrow(box(baseline: 0.2mm, circle(radius: 1.6mm, fill: ink-2, stroke: none)), "revisado")
    #symrow(text(font: sans, size: 10pt, fill: accent, weight: 700)[→], "migrar p/ outro dia/semana")
  ],
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
#v(5mm)

// ── Revisão espaçada (explica o mecanismo usado no Diário e na Ficha) ──
#sechead("Revisão espaçada", hint: "o que você estuda hoje volta nestes dias")
#grid(columns: (auto, 1fr), column-gutter: 5mm, align: horizon,
  {
    for d in ("D+1", "D+7", "D+15", "D+30") {
      box(inset: (x: 2.2mm, y: 1.3mm), stroke: (paint: hair, thickness: wt.box),
        text(font: sans, size: fs.micro, fill: ink-2, weight: 700)[#d])
      h(2.2mm)
    }
  },
  text(font: sans, size: fs.micro, fill: ink-3)[
    Revise cada conteúdo 1, 7, 15 e 30 dias depois de estudar. O *Diário* (Revisar) e a
    *Ficha* já trazem esses marcos — é só seguir e marcar.
  ],
)
