# CLAUDE.md

Guia para o Claude Code (claude.ai/code) neste repositório. **Não é um codebase** — é o **dossiê de
negócio do PROJETO PLANNERS**. Idioma de trabalho: **pt-BR**.

<!-- Manutenção (humanos): manter < 200 linhas. Atualizar os "Fatos-âncora" sempre que um número
canônico mudar — eles são a fonte única da verdade citada por todos os documentos. Skills/MCPs e
dicas de uso ficam em docs/claude-setup.md (não duplicar aqui). -->

## O que é
Micro-venture D2C de **dois planners perpétuos premium** (sem datas):
- **Concurseiro** — *sistema de estudo* (grade de ciclo, revisão espaçada, tracker), não "agenda".
- **Treino de Força** — *diário de periodização* (mesociclo, carga, RPE/RIR, PRs), não "caderno".

Operação enxuta a partir de Brasília/DF. O dossiê está **completo**; o trabalho agora é
**mantê-lo consistente, atualizado e executável** (não "refatorar do zero"). Audiência: os dois
sócios (uso interno e honesto — não é pitch para investidor).

## Sócios (definem os papéis)
- **Daniel** — economista/oficial de inteligência → estratégia, finanças, pesquisa, sourcing, ops.
- **Mayara** — criadora de conteúdo viral (milhões de views no TikTok) → redes sociais, conteúdo e
  marca = **motor de aquisição** (de-risca o maior risco do plano: distribuição do zero).

## Fatos-âncora — FONTE ÚNICA DA VERDADE (sincronizar em todos os documentos)
| Parâmetro | Valor | Nota |
|---|---|---|
| Câmbio USD/BRL | ≈ **R$ 5,20** | planejamento (spot ≈ R$ 5,18 em 17/jun/2026) |
| Investimento inicial | **R$ 5.000** | é o teste; **100% autofinanciado** depois |
| Preço de lançamento | Concurseiro **R$ 119** · Treino **R$ 109** | regime depois: R$ 129–139 / 119–129 |
| Custo/un | micro-lote **R$ 55** → reposição **R$ 45** | Tier B; cai com volume |
| MC/un (preço médio R$ 114) | direto **R$ 57,59 (50%)** · blended **R$ 54,48** | marketplace destrói (Shopee R$ 6,48) |
| Recorrência | recompra **3–4×/ano** (Conc) / ~2,5 (Treino) | **LTV margem ~R$ 374–397**; LTV/CAC ~7–8× |
| Mercado recorrente | **~2,3 M un/ano (~R$ 267 M)** | SAM ~R$ 55 M (Conc) / ~R$ 25 M (Treino) |
| Mix de canal (Fase 1) | **90% direto / 10% marketplace** | vender direto; marketplace só p/ descoberta |
| Pró-labore (**Estratégia B**) | ano 1 = **0** → ano 2 **R$ 500→2.000/sócio** → ano 3 ~R$ 3.000 | reinveste 100% no ano 1 |
| Escala / China | só ao cruzar **gatilho ~R$ 135 mil** + volume ≥ ~5.000 un | **sem pré-venda, sem empréstimo** |
| Sourcing | **NCM 4820.10.00** (tributado, sem imunidade de livro) · **AFRMM 8%** · landed 2,0–2,7× FOB · crossover China **~3.000–5.000 un** | Fase 1 gráfica BR; Fase 2 China |
| EVEF (5 anos, taxa 12–15%) | VPL **R$ 365–407 mil** · TIR ~406% · payback < 1 ano | anos 3–5 ilustrativos |

> Ao mudar um número-chave, **propague para todos os documentos** e rode o `business-validator`.
> Premissas detalhadas: `docs/premissas-do-negocio.md`.

## Estrutura & fluxo (o valor flui numa direção)
`sources/` (rascunhos, **imutáveis**) → `research/` (evidência datada) → `models/` (.xlsx) +
`deliverables/` (docs) → **business-validator** (checagem cruzada antes de "pronto").

- `deliverables/` — 10 documentos (`.md` → `.pdf`; o `guia-do-negocio` usa `.html` como fonte). Índice no `README.md`;
  `guia-do-negocio` = versão em linguagem leiga.
- `models/` — `viabilidade-planners-v2.xlsx` (10 abas) + `painel-kpis.xlsx`.
- `research/evidence/` (pesquisa datada) + `research/validation/` (laudos).
- `docs/` — metodologia, premissas e **`claude-setup.md`** (config da IA + skills/MCPs).
- `sources/` — 3 rascunhos originais (o "antes", **read-only**).
- `scripts/` — geradores (`build_model.py`, `build_painel.py`, `build_pdfs.py`, `build_legal.py`).
- `.claude/agents/` (agentes) · `.mcp.json` (MCP servers do projeto).
- `design/` — **módulo de design do produto** (Concurseiro): pesquisa + conceitos + o módulo **`caderno-de-erros/`** (beachhead). Ver `design/README.md` e `design/concurseiro/conceitos/roadmap-faseado.md`.

## Comandos (regenerar — requer `uv`; não há openpyxl/markdown global)
```bash
uv run --with openpyxl python scripts/build_model.py     # modelo .xlsx (10 abas)
uv run --with openpyxl python scripts/build_painel.py    # painel de KPIs
uv run --with markdown --with matplotlib --with numpy python scripts/build_pdfs.py  # HTML dos docs (briefing)
uv run --with markdown python scripts/build_legal.py     # HTML dos docs jurídicos
# PDF a partir do HTML:
uv run --with weasyprint --with pypdf python ~/.claude/skills/briefing-designer/templates/render.py <in.html> <out.pdf>
```
Conferir fórmulas do modelo: `uv run --with openpyxl --with formulas python ...` (recalcular e comparar com o texto).
Git: **commit/push só quando o usuário pedir.**

## Agentes & skills do projeto (`.claude/`)
| Agente | Quando acionar |
|---|---|
| `market-researcher` | mercado (TAM/SAM/SOM), concorrência, demanda, taxas |
| `pricing-strategist` | preço, posicionamento (Dunford), oferta/SKU |
| `sourcing-analyst` | gráfica BR × China, NCM, landed cost, RFQ, QA |
| `financial-modeler` | unit economics, viabilidade, sensibilidade, rebuild do `.xlsx` |
| `business-validator` | **antes de dar algo por pronto** — checagem adversarial cruzada (read-only) |
| `doc-updater` | propagar número-âncora por deliverables/CLAUDE.md (após validar; diff p/ revisão) |
| `conteudo-mayara` | conteúdo/lançamento (roteiros TikTok/Reels, copy, calendário) — motor de aquisição |

**Skills** (`.claude/skills/`): `planner-designer` (decide design) + `typst-planner` (executa o build print-ready) — par decide→executa do módulo de design.

Subagentes rodam em Sonnet (config); `financial-modeler` e `business-validator` em Opus
(`model: inherit`). **Orquestração** (mapa de capacidades + workflows P→S→B · VAP · PSF · design): `docs/orquestracao.md`. Skills, MCPs e desempenho: `docs/claude-setup.md`.

## Direção de produto (design) — Concurseiro `[validado · Mayara · 19/jun/2026]`
Trabalho em `design/concurseiro/`. Refina o "sistema de estudo": é um **hub analógico** (foco sem
celular + síntese + **diagnóstico de erro**) **harmônico** com o digital (Anki, QConcursos,
cursinhos) — **sem replicá-lo** nem colidir com o que os portais já entregam (edital
verticalizado/cronograma). *Nuance a reconciliar com `## O que é`:* revisão espaçada e tracker de
questões tendem a ficar **no digital**; o papel **decide e processa** (o que ankificar, o porquê do erro).
- **Arquitetura:** ecossistema **modular** (módulos independentes + complementares sob uma capa).
- **Roadmap** (`design/concurseiro/conceitos/roadmap-faseado.md`): **F0** pesquisa ✅ · **F1 = o
  Planner de Estudo** (com diagnóstico de erro *lite*) · **F2** ecossistema (Caderno de Erros standalone, Síntese, Bússola + capa) · **F3** foto→app.
- **Persona v1:** dedicação exclusiva (recorte de alta intensidade da **P1**).

## Convenções (inegociáveis)
- **Todo número leva fonte + data**; triangular ≥2 fontes para números centrais. Confiança:
  `[confirmado]` · `[estimativa triangulada]` · `[a confirmar]`. Nunca usar "ILUSTRATIVO" como fechado.
- **`sources/` é imutável** (o "antes"); o "depois" vai para `deliverables/`.
- **Datas relativas → absolutas**; registrar câmbio/data de toda cotação. Tributos/tarifas mudam →
  recomendar conferência (Siscomex/Receita/despachante/contador); não afirmar alíquota sem fonte+data.
- **Tabela em markdown precisa de linha em branco ANTES** dela (senão não vira tabela no PDF).
- **Aspas de ênfase** nos `.md` viram itálico no PDF; não afetam a renderização da tabela.
- Validar com **business-validator** antes de concluir qualquer artefato.
