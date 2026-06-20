# Planner v1 — design & produção

Direção de produto + **fonte de verdade do protótipo** do Planner Concurseiro (estilo planner de
estudo coreano, A5, perpétuo, impressão sóbria — a cor vem do marca-texto do aluno).

## Fonte de verdade: `typst/`
O protótipo é gerado **por código** (Typst), in-house, sem InDesign/Affinity.

| Arquivo | O que é |
|---|---|
| `config.typ` | design tokens (geometria A5, cores CMYK, fonte Lato, escala, fios, raios) |
| `estilos.typ` | helpers compartilhados (masthead, sechead, timeblock, subjrow, chip, colorsq, softband…) |
| `diario.typ` · `semanal.typ` · `bussola.typ` · `pontes.typ` · `ficha.typ` | as **5 páginas** |
| `render.py` | compila 1 página → PDF + PNG p/ QA: `uv run --with typst python render.py <pagina>` |
| `finalize.py` + `PDFX_def.ps` | merge das 5 → **`planner-proto-pdfx1a.pdf`** (CMYK · PDF/X-1a · FOGRA39) |
| `INSTRUCOES-PAGINAS.md` | briefing concreto por página (spec do build) |
| `*-1.png` | previews · **`planner-proto-pdfx1a.pdf` = o protótipo (abra este)** |

> **Como mexer:** editar `.typ` → `render.py <pagina>` → **olhar o PNG** → iterar até 1 página A5.
> Skills: **`typst-planner`** (execução) + **`planner-designer`** (design). Princípios: `../conceitos/sintese-design-refinada.md`.

## Documentos
- `ESTADO-RETOMADA.md` — estado vivo / ponto de retomada.
- `tier1-ultraplan.md` · `tier1-toolchain.md` · `tier1-priorart.md` — plano e pesquisa do "Tier-1 sem software pro".
- `freelancers-pesquisa.md` — sourcing de freelancer (se/quando contratar acabamento premium).
- `rfq-graficas.md` — cotação p/ as 3 gráficas (anexar o `typst/planner-proto-pdfx1a.pdf`).

## Status (20/jun/2026)
Protótipo Tier-1 das 5 páginas **construído e print-ready** (CMYK/PDF-X-1a). Próximo: micro-polish ·
página de onboarding/contracapa (key de símbolos BuJo + legenda "10 min" que saiu do corpo) · teste de
impressão real · (opcional) freelancer para acabamento premium.
