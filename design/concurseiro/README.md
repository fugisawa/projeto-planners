# Concurseiro — índice do design do planner

Navegação do design do **Planner de Estudo (Concurseiro)**. O dossiê de negócio fica na raiz do
repo; aqui é o **objeto físico** e o **sistema de páginas**. Idioma: pt-BR.

## As três versões do planner

| Versão | Status | O que é | Entrada |
|---|---|---|---|
| **`planner-v3/`** | **★ candidato atual (em avaliação)** | Redesign "por ciclo": **Ciclo** (fila de blocos, não dia da semana) · **Registro de Matérias** (ledger/dicionário de cor) · **calibração** prevejo/obtive · **Sessão** com time-log pintável + output · Semanal · Pontes. Fundamentado em pesquisa tripla + crítica adversarial. | [`planner-v3/typst/README.md`](planner-v3/typst/README.md) |
| `planner-v1/` | referência de estilos (2.0 PRO) | 1º protótipo (DNA INDIGO: rotação M1–M4 × dias). Base de **estilo** (paleta CMYK fria, Lato, cantos retos). **Não é o produto final.** Contém `ficha.typ` = artefato de teste (F1 vai SEM ficha). | [`planner-v1/README.md`](planner-v1/README.md) |
| `planner-v2/` | preterida (arquivada) | Iteração "só melhorias" (eyebrow + seletor ○△→×). Mantida como histórico de iteração. | `planner-v2/typst/` |

> **Decisão v1×v3 para produção/RFQ: a definir** (`[Daniel]`). Até lá, v1 e v3 coexistem com status claro.
> A v3 é a direção de desenvolvimento; a v1 é a fonte dos tokens/estilos 2.0 PRO.

## Conceitos & fundamento
- [`conceitos/roadmap-faseado.md`](conceitos/roadmap-faseado.md) — F0→F3 (F1 = Planner de Estudo SEM ficha).
- [`conceitos/definicao-do-produto.md`](conceitos/definicao-do-produto.md) — categoria, módulos, não-colisão.
- [`conceitos/pesquisa-v3-sintese.md`](conceitos/pesquisa-v3-sintese.md) — pesquisa que fundou a v3 (aprendizagem + workflow BR + design).
- [`conceitos/spec-v3-refino.md`](conceitos/spec-v3-refino.md) — spec de refino "caprichoso JP/KR" da v3.
- [`conceitos/sintese-design-refinada.md`](conceitos/sintese-design-refinada.md) — direção de design 2.0 PRO (estilos).

## Build (candidato v3)
```bash
uv run --with typst python planner-v3/typst/render.py <pagina>   # PDF + PNG de QA (olhar o PNG!)
uv run --with pypdf python planner-v3/typst/finalize.py          # merge → PDF/X-1a CMYK FOGRA39
```
Skills do par decide→executa: `planner-designer` (decide) · `typst-planner` (executa).
Páginas v3: `guia · bussola · ciclo · sessao · semanal · pontes`.

## Módulo Fase 2
- [`caderno-de-erros/`](caderno-de-erros/README.md) — Caderno de Erros standalone (F2, pago pelo caixa da F1).
