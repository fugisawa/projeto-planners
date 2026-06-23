#import "estilos.typ": *
#show: planner-page
#set par(spacing: 0pt)

// ── Helpers locais ────────────────────────────────────────────────────────────
#let lb(s) = text(font: sans, size: fs.label, fill: ink-2)[#s]

// Plano do dia, estilo INDIGO: [matéria/sigla │ o que vou fazer │ ○△→×]. A cor vai na PRÓPRIA
// coluna de matéria (pinta-se a sigla), não num box separado — um sistema de cor só (cor = matéria),
// que liga ao time-log e ao Registro. Sem chip-box: lição 2.0 PRO da v1 (o box não batia com as
// células do time-log/dots e duplicava o color-coding).
#let planorows(n: 5, rh: 5.6mm) = {
  let cells = ()
  for _ in range(n) { cells += ([], [], statusstrip) }
  table(
    columns: (16mm, 1fr, 15mm), rows: rh, align: horizon,
    inset: (x: 1.6mm, y: 0pt),
    stroke: (x, y) => (bottom: (paint: hair, thickness: wt.hair),
                       right: if x == 0 { (paint: hair, thickness: wt.hair) } else { none }),
    ..cells
  )
}

// Revisar com o MESMO peso do plano de estudo (paridade: "revisar é tão importante quanto
// estudar"). Espelha o planorows INDIGO (mesma divisória de matéria → alinha com Estudar), mas troca
// o status pelo VOLUME: [matéria/sigla │ o que revisei │ min │ fiz │ corr.]. A cor vai na própria
// coluna de matéria (sem box, como no Estudar). "min" = revisão por tempo (Anki/leitura/lei seca);
// "fiz/corr." = revisão por questões (feitas / corrigidas → Caderno de Erros). Sinal AGREGADO por
// matéria — não o log questão-a-questão (isso é do digital: QConcursos/Anki).
#let revth(s) = text(font: sans, size: 5.5pt, fill: ink-3, weight: 700, tracking: 0.4pt)[#upper(s)]
#let revrows(n: 4, rh: 5.6mm) = {
  let head = ([], [],
    align(center + horizon, revth("min")),
    align(center + horizon, revth("fiz")),
    align(center + horizon, revth("corr.")))
  let cells = ()
  for _ in range(n) { cells += ([], [], [], [], []) }
  table(
    columns: (16mm, 1fr, 10mm, 9mm, 9mm),
    rows: (auto,) + (rh,) * n, align: horizon,
    inset: (x, y) => (x: 1.6mm, y: if y == 0 { 0.7mm } else { 0pt }),
    stroke: (x, y) => if y == 0 {
      (bottom: (paint: hair, thickness: wt.hair))
    } else {
      (bottom: (paint: hair, thickness: wt.hair),
       right: if x == 0 or x == 2 or x == 3 { (paint: hair, thickness: wt.hair) } else { none })
    },
    ..head, ..cells
  )
}

// ── Cabeçalho integrado: Data (1fr) · D-prova (centro) · Horas líquidas (dir.) ─
// Proporção INDIGO real (DATE / D-DAY / TIME), em vez do D-prova solto no canto.
#eyebrow("Sessão", kicker: "foco do dia")
#grid(columns: (1fr, 22mm, 26mm), column-gutter: 6mm, align: bottom,
  fieldcol("Data"),
  align(center, stack(dir: ttb, spacing: 1.2mm,
    text(font: sans, size: fs.micro, fill: ink-3)[D-prova],
    circle(radius: 4mm, stroke: (paint: accent, thickness: 0.8pt)))),
  stack(dir: ttb, spacing: 1.4mm,
    text(font: sans, size: fs.micro, fill: ink-3)[Horas líquidas],
    box[#box(width: 1fr, line(length: 100%, stroke: (paint: hair, thickness: wt.hair)))#lb(" h")]),
)
#v(3.5mm)

// ── Intenção + se→então (implementation intention; antecipar o obstáculo · Gollwitzer d≈0,65) ──
// O obstáculo PREVISTO é o que protege a execução ("se abrir o Instagram → então…").
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Antes de começar — esta sessão é para:]
#v(1.6mm)
#wline()
#v(2.6mm)
#grid(columns: (auto, 1fr, auto, 1fr), column-gutter: 2mm, align: bottom,
  text(font: sans, size: fs.micro, fill: ink-3)[Se], wline(),
  text(font: sans, size: fs.micro, fill: ink-3)[→ então], wline())
#v(3.2mm)

// ── ESTUDAR — o plano (cor = matéria; marque a cor e use a mesma no time-log) ──
#softhead("Estudar", hint: "o plano · matéria · o que vou fazer")
#planorows(n: 5)
#v(3mm)

// ── TEMPO DE ESTUDO — pinte o tempo REAL na cor da matéria (06–23h) ───────────
// A pintura mostra a DISTRIBUIÇÃO das horas entre matérias e o gap plano-vs-real.
#grid(columns: (1fr, auto), align: (left + horizon, right + bottom),
  text(font: sans, size: 8.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Tempo de estudo],
  text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[pinte o tempo REAL na cor da matéria · 1 quadradinho = 10 min])
#v(1mm)
#line(length: 100%, stroke: (paint: hair, thickness: wt.hair))
#v(1.5mm)
#grid(columns: (1fr, 1fr, 1fr), column-gutter: 5mm,
  timeblock("Manhã", ("06", "07", "08", "09", "10", "11")),
  timeblock("Tarde", ("12", "13", "14", "15", "16", "17")),
  timeblock("Noite", ("18", "19", "20", "21", "22", "23")),
)
#v(3mm)

// ── REVISAR / PRATICAR — peer do Estudar: o QUÊ (matéria) + QUANTO (tempo/questões) ──
// Antes só marcava a modalidade (raso). Agora registra matéria + volume com o mesmo peso do
// plano. Os 4 modos viram lembrete; a grade captura o sinal por matéria. Erro → Caderno de Erros.
#softhead("Revisar / praticar", hint: "matéria · o que revisei · quanto")
#text(font: sans, size: fs.micro, fill: ink-3)[modos: Anki · Questões (QConcursos) · Discursiva · Lei seca · erro → Caderno de Erros]
#v(2.2mm)
#revrows(n: 4)
#v(3mm)

// ── FECHAR O DIA — recordação livre (de memória) + autoavaliação ──────────────
// Recordação livre = recuperação na forma mais pura (Roediger&Karpicke 2010); lacuna → card no Anki.
#text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Sem consultar — o que ficou de hoje? (de memória; lacunas → Anki)]
#v(1.6mm)
#wline() #v(4.5mm) #wline()
#v(2.6mm)
#grid(columns: (1fr, auto, auto), column-gutter: 2.8mm, align: horizon,
  text(font: sans, size: fs.micro, fill: ink-3, style: "italic")[Como foi o foco hoje?],
  text(font: sans, size: fs.micro, fill: ink-3)[foco da sessão (1–5)],
  box(baseline: 1.2mm, ratingdots))
#v(3mm)

// ── AMANHÃ — ritual de fechamento (ajuste de rota, não balanço moral) ─────────
#text(font: sans, size: 7.5pt, fill: ink-2, weight: 700, tracking: 0.3pt)[Amanhã ajusto ·]
#v(2mm)
#wline() #v(4.5mm) #wline()
