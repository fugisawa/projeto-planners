# Planner v3 — redesign por ciclo (print-ready Typst)

> Terceira opção do Planner de Estudo (Concurseiro, F1). **Não é melhoria do v1/v2** — é uma
> arquitetura nova, fundamentada em pesquisa tripla (ciência da aprendizagem + workflow real do
> concurseiro BR + landscape de design). Base: [`../../conceitos/pesquisa-v3-sintese.md`](../../conceitos/pesquisa-v3-sintese.md).
> v1 e v2 permanecem intactos.

## O que muda em relação ao v1/v2

O DNA do v1/v2 é **INDIGO** (time-log + rotação por dia da semana). O v3 troca o eixo:

| Eixo | v1 / v2 | **v3** |
|---|---|---|
| Organização do estudo | rotação `M1–M4 × Seg–Dom` (cronograma) | **Ciclo de blocos numerados** (avança por bloco, não por dia) |
| Mapa de matérias | "Mapa do edital" (progresso 0–100%) | **Registro de Matérias** (ledger): cor + meta-h + faixa de 100 h + recorde |
| Página diária | time-log 3 blocos + estudar/revisar | **intenção + Estudar (plano, cor=matéria) + Tempo de estudo (pinta o tempo REAL na cor da matéria = distribuição) + output (questões/acerto + foco 1–5) + Revisar/praticar + amanhã** |
| Semanal | metas + rotação | **calibração (prevejo/obtive) + horas por matéria (alocação) + reflexão fechada** |
| Pontes | campos de número | **sinal do app → decisão** (não transcrição) |

> **Correção 21/jun/2026 (feedback Daniel):** uma primeira tentativa do v3 comprimiu o time-log diário
> numa tira e empurrou a pintura para a semana — **sobre-correção**. A pesquisa (Kokuyo/INDIGO "見える化";
> fóruns KR/JP/BR; reatividade do automonitoramento d≈0,4; plano-vs-real) confirma: **pintar o tempo real
> por matéria no grid diário = distribuição + calibração** é mecânica valiosa, não falha. Correto =
> **manter o grid diário pintável E somar output** (questões/acerto). Revisão **não é só Anki**: inclui
> resolver questões (QConcursos) e discursivas. Cor = matéria (um sistema só). O Semanal virou *alocação
> por matéria* (agrega o diário) para não duplicar a pintura.

## Fundamento (cada mecânica → evidência)

- **Ciclo, não cronograma** — método dominante no Brasil; defesa contra a culpa de cronograma
  quebrado (causa nº 1 de abandono). Nenhum planner pesquisado faz isso. `[Estratégia/Estudaqui · jun/2026]`
- **Registro de Matérias (ledger)** — endowed progress / goal-gradient (Nunes&Drèze 2006); vira o
  **dicionário de cor** do planner inteiro.
- **Calibração prevejo/obtive** — mata a ilusão de fluência (Karpicke 2009; Bjork).
- **Intenção pré-sessão** — implementation intention (Gollwitzer, d≈.65); a maioria dos planners só
  tem log de saída.
- **Output > tempo** — testing effect (Roediger&Karpicke 2006; Dunlosky 2013).
- **Reflexão fechada** (prompts de 1 linha, nunca caixa em branco) — Bisra 2018 (d=.55); caixa grande
  gera culpa e fica vazia.
- **Revisar = o que vira card** — o Anki executa; o papel decide.
- **Mapa semanal pintável** — Kokuyo "見える化"; spread herói, fotogênico cheio, invisível vazio.

## Mantido do 2.0 (o que funcionou)
Paleta CMYK fria · Lato · cantos retos · masthead/eyebrow · time-log 10-min · **seletor ○ △ → ×**
(genuinamente inédito) · helpers Typst.

## Páginas
`guia` · `bussola` (+ ledger) · `ciclo` (nova) · `sessao` (diário) · `semanal` · `pontes`.

## Build
```bash
uv run --with typst python render.py <pagina>     # PDF + PNG 150dpi (QA visual)
uv run --with pypdf python finalize.py            # merge → PDF/X-1a CMYK FOGRA39
```
Ordem do miolo: `guia bussola ciclo sessao semanal pontes`.
Skills: `planner-designer` (decide) + `typst-planner` (executa).
