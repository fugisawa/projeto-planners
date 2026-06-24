#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── MAPA DE SETAS (Ficha C) — protótipo do CADERNO DE SÍNTESE (Fase 2) ────────
// NÃO é página do planner-v3 (F1 = 6 páginas; mapa fica como instrução no Guia +
// páginas do Caderno de Síntese F2). Realiza a decisão D5 de
// `conceitos/revisao-evidencia-2026-06.md` (mapa construído pelo aluno · g≈0,72).
// Construir o mapa supera olhar um pronto (0,43); setas ROTULADAS forçam nomear a
// relação. Fonte: research/evidence/aprendizagem-papelaria-asia.md §3.5
// (Schroeder 2018 · Nesbit & Adesope 2006). NÃO incluir no ORDER do finalize.py.

// ── Helpers locais ────────────────────────────────────────────────────────────
#let lb(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]
#let fw(w) = box(width: w, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))
#let optbox(label) = box(baseline: 0.5mm)[#checkbox#h(1.4mm)#text(font: sans, size: fs.micro, fill: ink-2)[#label]]

// Canvas de dot-grid quieto (exceção justificada à regra "sem dot-grid": aqui é um
// canvas livre de mapa/desenho — os dots auxiliam o traçado, não competem com grade).
#let dotgrid(cols: 28, rows: 28, rh: 4.6mm) = table(
  columns: (1fr,) * cols,
  rows: (rh,) * rows,
  inset: 0pt, align: center + horizon, stroke: none,
  ..range(cols * rows).map(_ => circle(radius: 0.2mm, fill: grid-c))
)

#eyebrow("Integração", kicker: "mapa · construir > olhar pronto")

// ── Modo (escolha conforme o conteúdo) ────────────────────────────────────────
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Escolha o modo — conforme o conteúdo:]
#v(1.8mm)
#box[#optbox("mapa de setas rotuladas")#h(5mm)#optbox("explicar (Feynman)")#h(5mm)#optbox("desenhar o procedimento")]
#v(3.2mm)

// ── Tópico · Data ─────────────────────────────────────────────────────────────
#grid(columns: (auto, 1fr, auto, 24mm), column-gutter: 1.5mm, align: bottom,
  lb("Tópico / nó confundível"), fw(1fr),
  lb("Data"), fw(24mm),
)
#v(3.5mm)

// ── Canvas de construção ──────────────────────────────────────────────────────
#box(width: 100%, stroke: (paint: hair, thickness: wt.box), inset: 2.6mm,
  dotgrid())
#v(2.4mm)

// ── Rodapé de evidência ───────────────────────────────────────────────────────
#text(font: sans, size: 6.5pt, fill: ink-3, style: "italic")[
  Construa você — construir o mapa supera olhar um pronto (g≈0,72 vs 0,43); *setas
  rotuladas* nomeiam a relação ("EC → exige → 3/5 em 2 turnos"), não só os conceitos.
  O que valer a pena vira card no Anki. Schroeder 2018 · Nesbit & Adesope 2006.
]
