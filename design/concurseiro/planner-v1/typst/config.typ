// ───────────────────────────────────────────────────────────────────────────
// config.typ — Design tokens do Planner Concurseiro · 2.0 PRO
// Blend: rigor japonês (grade do time-log, hierarquia de fios, cor quieta, alinhamento)
// + calor coreano (Lato humanista, acento amigável). CANTOS RETOS (só círculos redondos).
// Fundo = papel creme; a COR vem do marca-texto do aluno → a impressão recua ao máximo.
// ───────────────────────────────────────────────────────────────────────────

// Geometria A5 (trim). Margem interna reserva a espiral wire-o (lado esquerdo).
#let pg = (w: 148mm, h: 210mm, inside: 18mm, outside: 11mm, top: 11mm, bottom: 11mm)

// Módulo vertical (baseline). Tudo alinha a múltiplos de 4.5 mm.

// Tinta — sóbria; 2.0 = mais quieta (recua para a caligrafia do aluno).
#let ink    = cmyk(0%, 0%, 0%, 88%)    // texto principal (preto suave)
#let ink-2  = cmyk(32%, 16%, 0%, 56%)  // rótulos / labels de seção
#let ink-3  = cmyk(28%, 12%, 0%, 40%)  // dicas / terciário
#let title-c = cmyk(68%, 44%, 0%, 48%) // azul-ardósia profundo — títulos de página
#let accent = cmyk(52%, 22%, 0%, 4%)   // azul suave (amigável) — uso pontual
#let grid-c = cmyk(16%, 7%, 0%, 5%)    // grade do time-log/tabelas — quieta
#let grid-h = cmyk(22%, 10%, 0%, 15%)  // linha "forte" da grade (limite de hora) — hierarquia
#let hair   = cmyk(20%, 9%, 0%, 20%)   // fios de seção / bordas de campo
#let band   = cmyk(9%, 4%, 0%, 3%)     // faixa sombreada suave (Revisar / Ajuste de Rota)

// Fonte: Lato (humanista, quente). Uso refinado: figuras tabulares (ver estilos).
#let sans = "Lato"

// Escala tipográfica. h1 = título de página (Lato Black, masthead).
#let fs = (h1: 18pt, h2: 9.5pt, label: 8.5pt, body: 9.5pt, micro: 7pt, hour: 6.5pt, cell: 6pt)

// Espessuras de fio (2.0: grade mais fina + hierarquia).
#let wt = (hair: 0.4pt, rule: 0.7pt, grid: 0.3pt, gridh: 0.5pt, box: 0.6pt)

// Espaçamento.
#let sp = (xs: 1.5mm, s: 3mm, m: 5mm, l: 8mm)
