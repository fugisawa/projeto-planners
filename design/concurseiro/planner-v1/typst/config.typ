// ───────────────────────────────────────────────────────────────────────────
// config.typ — Design tokens do Planner Concurseiro
// Estilo: planner de estudo coreano (amigável, suave). Cores em CMYK.
// Fundo = papel creme Pólen (NÃO imprimir). A COR vem do marca-texto do aluno;
// a impressão é sóbria (azul-claro/cinza) para o highlighter se destacar.
// ───────────────────────────────────────────────────────────────────────────

// Geometria A5 (trim). Margem interna reserva a espiral wire-o (lado esquerdo).
#let pg = (w: 148mm, h: 210mm, inside: 18mm, outside: 11mm, top: 11mm, bottom: 11mm)

// Tinta — sóbria e suave.
#let ink    = cmyk(0%, 0%, 0%, 88%)    // texto principal (preto suave)
#let ink-2  = cmyk(32%, 16%, 0%, 56%)  // rótulos (azul-acinzentado)
#let ink-3  = cmyk(28%, 12%, 0%, 40%)  // dicas / terciário
#let accent = cmyk(52%, 22%, 0%, 4%)   // azul suave (amigável) — uso pontual
#let grid-c = cmyk(24%, 10%, 0%, 8%)   // linhas da grade (azul-claro tipo INDIGO)
#let hair   = cmyk(22%, 9%, 0%, 24%)   // fios de seção
#let band   = cmyk(12%, 5%, 0%, 4%)    // faixa sombreada suave (Revisar)
#let title-c = cmyk(68%, 44%, 0%, 48%) // azul-ardósia profundo — títulos de página (acento escuro do tema)

// Fonte: Lato (humanista, quente, amigável). Instalada no sistema.
#let sans = "Lato"

// Escala tipográfica.
#let fs = (h1: 14pt, h2: 9.5pt, label: 8.5pt, body: 9.5pt, micro: 7pt, hour: 6.5pt, cell: 6pt)

// Espessuras de fio.
#let wt = (hair: 0.4pt, rule: 0.7pt, grid: 0.4pt, box: 0.6pt)

// Raios (cantos arredondados — amigável).
#let rad = (box: 1.6mm, chip: 1mm, band: 2mm)

// Espaçamento.
#let sp = (xs: 1.5mm, s: 3mm, m: 5mm, l: 8mm)
