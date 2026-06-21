#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Helpers locais ────────────────────────────────────────────────────────────
#let lb(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]
#let fw(w) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
#let th(s) = text(font: sans, size: 6pt, fill: ink-2, weight: 700, tracking: 0.4pt)[#upper(s)]
#let prompt(label) = {
  text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[#label]
  v(2mm); wline(); v(4mm)
}

// Tabela única por matéria: cor · matéria · horas · prevejo% · obtive%.
// Funde alocação (horas, detecta matéria esquecida) + calibração (prevejo vs obtive).
// Fios internos leves (0.4pt hairline) — somem ao escrever; nada de grade pesada.
#let weekreview(n: 6, rh: 8.5mm) = {
  let head = (
    align(center + horizon, th("Cor")), align(left + horizon, th("Matéria")),
    align(center + horizon, th("Horas")), align(center + horizon, th("Prevejo")),
    align(center + horizon, th("Obtive")),
  )
  let cells = ()
  for _ in range(n) {
    cells += (
      align(center + horizon, box(width: 8mm, height: 4.6mm, stroke: (paint: hair, thickness: wt.box))),
      [],
      align(center + horizon, text(font: sans, size: 7pt, fill: ink-3)[h]),
      align(center + horizon, text(font: sans, size: 7pt, fill: ink-3)[%]),
      align(center + horizon, text(font: sans, size: 7pt, fill: ink-3)[%]),
    )
  }
  table(
    columns: (11mm, 1fr, 16mm, 18mm, 18mm),
    rows: (auto,) + (rh,) * n, align: horizon, inset: (x: 1.4mm, y: 0pt),
    stroke: (x, y) => if y == 0 { (bottom: (paint: hair, thickness: wt.rule)) }
      else { (bottom: (paint: hair, thickness: wt.hair),
              right: if x == 1 or x == 2 { (paint: hair, thickness: wt.hair) } else { none }) },
    ..head, ..cells
  )
}

// ── EYEBROW ───────────────────────────────────────────────────────────────────
#eyebrow("Semanal", kicker: "revisar · calibrar · ajustar")

// ── Cabeçalho: semana + ciclo em curso ────────────────────────────────────────
#grid(columns: (auto, 16mm, auto, 16mm, auto, 12mm, 1fr),
  column-gutter: 1.5mm, align: bottom,
  lb("Semana"), fw(16mm), lb("a"), fw(16mm), lb("· Ciclo nº"), fw(12mm), [],
)
#v(4.5mm)

// ── REVISÃO DA SEMANA — horas + calibração, por matéria (tabela única) ────────
#sechead("Revisão por matéria", hint: "horas da semana · preveja ANTES · confira DEPOIS")
#weekreview(n: 7)
#v(2mm)
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[
  As horas vêm da pintura diária — aqui você vê a semana e flagra a matéria esquecida.
]
#v(5mm)

// ── FECHAMENTO — prompts fechados (nunca caixa em branco) ─────────────────────
#block(width: 100%, fill: band, inset: (x: 3.5mm, y: 3mm))[
  #text(font: sans, size: 8.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Fechamento da semana]
  #v(2.8mm)
  #prompt("Matéria com maior queda de acertos —")
  #prompt("Causa principal do erro  (conceito · atenção · tempo · pegadinha) —")
  #prompt("Uma coisa que funcionou e vou manter —")
]
#v(3.5mm)

// ── A PRÓXIMA SEMANA — olhar para frente (fecha o ciclo SRL: forethought) ──────
#text(font: sans, size: 8.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[A próxima semana]
#v(2.8mm)
#grid(columns: (1fr, 6mm, 1fr), align: top,
  [
    #text(font: sans, size: fs.micro, fill: accent, weight: 700)[→ Migrar  ]
    #text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[o que não terminou]
    #v(2.2mm) #wline() #v(4.5mm) #wline()
  ],
  [],
  [
    #text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Foco / meta da semana que vem]
    #v(2.2mm) #wline() #v(4.5mm) #wline()
  ],
)
#v(5mm)

// ── Notas livres (canto de anotação Kokuyo/Hobonichi) ─────────────────────────
#text(font: sans, size: 7.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Notas da semana]
#v(2.5mm)
#dot() #v(4.5mm) #dot() #v(4.5mm) #dot()
