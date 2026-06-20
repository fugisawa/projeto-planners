#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt) // controle total dos gaps via v()

// ── Cabeçalho (3TIMES): Data (grande) · D-prova (círculo) · Tempo ──
#grid(columns: (1fr, 22mm, 30mm), column-gutter: 7mm, align: bottom,
  fieldcol("Data"),
  align(center, stack(dir: ttb, spacing: 1.4mm,
    text(font: sans, size: fs.micro, fill: ink-3)[D-prova],
    box(circle(radius: 5mm, stroke: (paint: accent, thickness: 0.9pt))))),
  fieldcol("Tempo de estudo"),
)
#v(3.5mm)

// ── Time-log: 3 blocos, 6 células de 10 min contíguas (4.5mm) ──
#grid(columns: (1fr, 1fr, 1fr), column-gutter: 5mm,
  timeblock("Manhã", ("05", "06", "07", "08", "09", "10", "11", "12")),
  timeblock("Tarde", ("13", "14", "15", "16", "17", "18", "19", "20")),
  timeblock("Noite", ("21", "22", "23", "00", "01", "02", "03", "04")),
)
#v(3mm)

// ── Estudar (7 linhas) ──
#sechead("Estudar", hint: "matéria · tarefa · quanto")
#for _ in range(7) [ #subjrow #v(1.2mm) ]
#v(1.5mm)

// ── Revisar (faixa suave, 4 linhas) ──
#softband[
  #grid(columns: (1fr, auto), align: (left + horizon, right + horizon),
    seclbl("Revisar"),
    text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[revisão espaçada · D+1 · D+7 · D+15])
  #v(2.4mm)
  #for _ in range(4) [ #subjrow #v(1.2mm) ]
]
#v(2.6mm)

// ── Fechamento do dia (ponte com o digital) ──
#grid(columns: (auto, 15mm, auto, 11mm, auto, auto, 14mm), column-gutter: 2.4mm, align: horizon,
  text(font: sans, size: fs.label, fill: ink-2)[Questões], wline(),
  text(font: sans, size: fs.label, fill: ink-2)[Acertos], wline(),
  text(font: sans, size: fs.label, fill: ink-2)[%],
  text(font: sans, size: fs.label, fill: ink-2)[Sessões], wline(),
)
#v(2.6mm)

// ── Rodapé ritual "HOJE ·" (2 linhas) ──
#line(length: 100%, stroke: (paint: hair, thickness: 0.3pt))
#v(1.6mm)
#text(font: sans, size: 6.5pt, fill: ink-3, tracking: 1pt)[HOJE ·]
#v(1.8mm)
#dot()
#v(2.2mm)
#dot()
