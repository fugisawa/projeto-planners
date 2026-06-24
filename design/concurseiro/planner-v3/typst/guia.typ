#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Título do Guia — tratamento distinto dos demais (é o manual / porta) ──────
// Maior que o masthead (22pt vs 18pt) + subtítulo + régua de acento cheia.
#stack(dir: ttb, spacing: 1.2mm,
  text(font: sans, size: 19pt, fill: title-c, weight: 900, tracking: -0.1pt)[Guia de uso],
  text(font: sans, size: 8pt, fill: ink-3, tracking: 0.6pt)[#upper("O manual — leia uma vez, depois é só seguir")],
)
#v(2.5mm)
#box(width: 100%, height: 2.4pt)[
  #place(left + horizon, line(length: 100%, stroke: (paint: accent, thickness: 2.4pt)))
]
#v(3.5mm)

#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[
  Este planner é um hub analógico: ele te ajuda a decidir e processar; o digital
  (Anki, QConcursos, cursinho) executa e guarda. Eles se completam — não competem.
]
#v(4mm)

// ── O sistema (5 módulos) ─────────────────────────────────────────────────────
#sechead("O sistema", hint: "o ciclo, em 5 módulos")
#let step(n, name, when, desc) = {
  grid(columns: (6mm, 1fr, auto), column-gutter: 3mm,
    align: (left + horizon, left + horizon, right + horizon),
    text(font: sans, size: 12pt, fill: title-c, weight: 900)[#n],
    {
      text(font: sans, size: fs.label, fill: ink, weight: 700)[#name]
      h(2.5mm)
      text(font: sans, size: fs.micro, fill: ink-3)[#desc]
    },
    text(font: sans, size: 6.5pt, fill: ink-3, style: "italic")[#when],
  )
  v(3mm)
}
#step("1", "Bússola", "1 vez", "alvo · registro de matérias (cores) · calendário")
#step("2", "Ciclo", "a cada ciclo", "monta a fila de blocos por matéria")
#step("3", "Sessão", "todo dia", "intenção · estudar · pinte o tempo real · revisar/praticar")
#step("4", "Semanal", "toda semana", "calibração · horas por matéria · fechamento")
#step("5", "Pontes", "semanal", "sinal do app → decisão")
#v(2mm)

// ── O ciclo (conceito-chave do sistema) ───────────────────────────────────────
#block(width: 100%, fill: band, inset: (x: 3.5mm, y: 3mm))[
  #text(font: sans, size: 8.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Por que CICLO e não cronograma]
  #v(2mm)
  #text(font: sans, size: fs.micro, fill: ink-2)[
    O ciclo é uma *fila de blocos*, não uma agenda. Você avança bloco a bloco e retoma
    de onde parou — *sem dia da semana, sem data*. Faltou um dia? O bloco continua amanhã;
    nada se perde. É assim que se estuda por edital sem a culpa do cronograma quebrado.
  ]
]
#v(4mm)

// ── 2 colunas ─────────────────────────────────────────────────────────────────
#grid(columns: (1fr, 1fr), column-gutter: 7mm,

  // ── Símbolos de status ────────────────────────────────────────────────────
  [
    #sechead("Símbolos de status")
    #let symrow(sym, meaning) = {
      grid(columns: (10mm, 1fr), column-gutter: 2mm,
        align: (center + horizon, left + horizon),
        sym, text(font: sans, size: fs.micro, fill: ink-2)[#meaning])
      v(2.8mm)
    }
    #text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Em cada linha de tarefa:]
    #v(2mm)
    #symrow(box(circle(radius: 1.6mm, stroke: (paint: hair, thickness: wt.box))), "cumprida · pinte ●")
    #symrow(box(text(font: (sans, "Noto Sans"), size: 7.5pt, fill: ink-2)[△]), "parcial (continua amanhã)")
    #symrow(box(text(font: sans, size: 8pt, fill: accent, weight: 700)[→]), "adiada · vá para → Migrar")
    #symrow(box(text(font: sans, size: 8pt, fill: ink-3)[×]), "eliminada (não faz mais sentido)")
  ],

  // ── Cores ─────────────────────────────────────────────────────────────────
  [
    #sechead("Cores", hint: "uma por matéria · a mesma em tudo")
    #text(font: sans, size: fs.micro, fill: ink-3)[
      Dê uma cor a cada matéria no Registro. Use a *mesma cor* no plano, no time-log
      e na semana — a cor vira o atalho visual de tudo. Ex.:
    ]
    #v(2.8mm)
    #let ex(name) = {
      grid(columns: (8mm, 1fr), column-gutter: 2.5mm, align: (center + horizon, left + horizon),
        box(width: 8mm, height: 5mm, stroke: (paint: hair, thickness: wt.box)),
        text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#name])
      v(2.9mm)
    }
    #ex("Dir. Constitucional")
    #ex("Português")
    #ex("RLM")
    #ex("Informática")
  ],
)

#v(3mm)

// ── Revisar e praticar ────────────────────────────────────────────────────────
#sechead("Revisar e praticar", hint: "revise espaçado — quem agenda é o Anki")
#text(font: sans, size: fs.micro, fill: ink-2)[
  *Revisar* é decidir *o que vira card* — não reler. O espaçamento funciona (revisar com
  intervalos que crescem conforme a prova se aproxima), mas *quem agenda é o Anki/FSRS*:
  ele traz cada item na hora certa, melhor que qualquer calendário no papel. No papel você
  *decide* (o que ankificar) e *pratica*: resolver questões (QConcursos) + treinar
  discursivas + lei seca. *Gerar* — recuperar da própria cabeça — vence reler e grifar.
]
