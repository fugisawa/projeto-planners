// ───────────────────────────────────────────────────────────────────────────
// config.typ — Design tokens · Planner Concurseiro v2
// Blend: rigor japonês (grade do time-log, hierarquia de fios, cor quieta)
// + calor coreano (Lato humanista, acento amigável). CANTOS RETOS.
// Diferencial v2: eyebrow em lugar de masthead nas páginas recorrentes;
// seletor de status (○ △ → ×) em cada linha de tarefa.
// ───────────────────────────────────────────────────────────────────────────

// Geometria A5 (trim). Margem interna reserva a espiral wire-o.
#let pg = (w: 148mm, h: 210mm, inside: 18mm, outside: 11mm, top: 11mm, bottom: 11mm)

// Tinta — recua para a caligrafia do aluno.
#let ink    = cmyk(0%, 0%, 0%, 88%)
#let ink-2  = cmyk(32%, 16%, 0%, 56%)
#let ink-3  = cmyk(28%, 12%, 0%, 40%)
#let title-c = cmyk(68%, 44%, 0%, 48%)
#let accent = cmyk(52%, 22%, 0%, 4%)
#let grid-c = cmyk(16%, 7%, 0%, 5%)
#let grid-h = cmyk(22%, 10%, 0%, 15%)
#let hair   = cmyk(20%, 9%, 0%, 20%)
#let band   = cmyk(9%, 4%, 0%, 3%)

#let sans = "Lato"

// Escala tipográfica.
#let fs = (h1: 18pt, h2: 9.5pt, label: 8.5pt, body: 9.5pt, micro: 7pt, hour: 6.5pt, cell: 6pt)

// Espessuras de fio.
#let wt = (hair: 0.4pt, rule: 0.7pt, grid: 0.3pt, gridh: 0.5pt, box: 0.6pt)

// Espaçamento.
#let sp = (xs: 1.5mm, s: 3mm, m: 5mm, l: 8mm)
