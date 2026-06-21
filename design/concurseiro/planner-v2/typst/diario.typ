#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Identidade eyebrow (igual ao v1 mas agora via helper compartilhado) ──
#eyebrow("Diário", kicker: "foco do dia")

// ── Cabeçalho 3-colunas: Data · D-prova (círculo) · Tempo ──
#grid(columns: (1fr, 22mm, 30mm), column-gutter: 7mm, align: bottom,
  fieldcol("Data"),
  align(center, stack(dir: ttb, spacing: 1.4mm,
    text(font: sans, size: fs.micro, fill: ink-3)[D-prova],
    box(circle(radius: 6mm, stroke: (paint: accent, thickness: 1pt))))),
  fieldcol("Tempo de estudo"),
)
#v(3.5mm)

// ── Time-log: 3 blocos, 6 células de 10 min, hierarquia hora/10min ──
#grid(columns: (1fr, 1fr, 1fr), column-gutter: 5mm,
  timeblock("Manhã", ("05", "06", "07", "08", "09", "10", "11", "12")),
  timeblock("Tarde", ("13", "14", "15", "16", "17", "18", "19", "20")),
  timeblock("Noite", ("21", "22", "23", "00", "01", "02", "03", "04")),
)
#v(3mm)

// ── Estudar — seletor de status ativo (inovação v2) ──
#softhead("Estudar", hint: "matéria · tarefa · quanto")
#studyrows(7, selector: true)
#v(2mm)

// ── Revisar — faixa suave + seletor de status ──
#block(width: 100%, fill: band, inset: (x: 0mm, y: 2.5mm))[
  #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    text(font: sans, size: 8.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Revisar],
    text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[D+1 · D+3 · D+7 · D+15])
  #v(1.8mm)
  #studyrows(5, selector: true)
]
#v(2.4mm)

// ── Fechamento do dia ──
#grid(columns: (auto, 15mm, auto, 11mm, auto, auto, 14mm), column-gutter: 2.4mm, align: bottom,
  text(font: sans, size: fs.label, fill: ink-2)[Questões], wline(),
  text(font: sans, size: fs.label, fill: ink-2)[Acertos], wline(),
  text(font: sans, size: fs.label, fill: ink-2)[%],
  text(font: sans, size: fs.label, fill: ink-2)[Sessões], wline(),
)
#v(2.4mm)

// ── Rodapé ritual "HOJE ·" ──
#line(length: 100%, stroke: (paint: hair, thickness: 0.3pt))
#v(1.4mm)
#text(font: sans, size: 6.5pt, fill: ink-3, tracking: 1pt)[HOJE ·]
#v(2mm)
#wline() #v(4mm)
#wline() #v(4mm)
#wline()
