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
| Investimento inicial | **R$ 5.000** | é o teste; **100% autofinanciado** depois; **banca 1 SKU: Concurseiro (F1); Caderno e Treino = F2** `[Daniel · 21/jun/2026]` |
| Preço de lançamento | Concurseiro **R$ 129** · Treino **R$ 109** | **lançamento sequencial (Conc. F1)** `[Daniel · 21/jun/2026]`; regime: ~R$ 139 / 119–129 |
| Custo/un (Conc., ~112 pp, micro-lote) | **4/4: R$ 43–55 · 2/2: R$ 36–47** → cai com volume | `[estimativa triangulada · 21/jun/2026]`; paleta fria (Y=0) → miolo 2 cores corta ~15–20% |
| MC/un Conc. (R$ 129) | **contribuição direta** (líq. do cascade do canal: devoluções 4% + pagamento 2,5% + embalagem R$ 4 → contrib. ~R$ 116,61) **~48–58% (4/4) · ~55–62% (2/2)** `[est.]` · blended **[a recalcular]** | `[estimativa triangulada · 21/jun/2026]`; marketplace destrói (Shopee ~R$ 6) |
| Recorrência | recompra **3–4×/ano** (Conc) / ~2,5 (Treino) | **LTV margem ~R$ 374–397** (mantém-se a R$ 129) `[est.]`; LTV/CAC ~7–8× |
| Mercado recorrente | **~2,3 M un/ano (~R$ 267 M)** | SAM ~R$ 55 M (Conc) / ~R$ 25 M (Treino) |
| Mix de canal (Fase 1) | **90% direto / 10% marketplace** | vender direto; marketplace só p/ descoberta |
| Pró-labore (**Estratégia B**) | ano 1 = **0** → ano 2 **R$ 500→2.000/sócio** → ano 3 ~R$ 3.000 | reinveste 100% no ano 1 |
| Escala / China | só ao cruzar **gatilho ~R$ 135 mil** + volume ≥ ~5.000 un | **sem pré-venda, sem empréstimo** |
| Sourcing | **NCM 4820.10.00** (tributado, sem imunidade de livro) · **AFRMM 8%** · landed 2,0–2,7× FOB · crossover China **~3.000–5.000 un** | Fase 1 gráfica BR; Fase 2 China |
| EVEF (5 anos, taxa 12–15%) | **[a recalcular pós-cotação @ R$ 129 / custo R$ 43–55 (4/4) ou R$ 36–47 (2/2) · 21/jun/2026]** (era VPL R$ 365–407 mil · TIR ~406%) | anos 3–5 ilustrativos |

> Ao mudar um número-chave, **propague para todos os documentos** e rode o `business-validator`.
> Premissas detalhadas: `docs/premissas-do-negocio.md`.

## Estrutura & fluxo (o valor flui numa direção)
`sources/` (rascunhos, **imutáveis**) → `research/` (evidência datada) → `models/` (.xlsx) +
`deliverables/` (docs) → **business-validator** (checagem cruzada antes de "pronto").

- `deliverables/` — 10 documentos (fonte `.md` → `.html` → `.pdf`; exceto `guia-do-negocio`, que tem só `.html` como fonte editável). Índice no `README.md`;
  `guia-do-negocio` = versão em linguagem leiga.
- `models/` — `viabilidade-planners-v2.xlsx` (10 abas) + `painel-kpis.xlsx`.
- `research/evidence/` (pesquisa datada) + `research/validation/` (laudos).
- `docs/` — metodologia, premissas e **`claude-setup.md`** (config da IA + skills/MCPs).
- `sources/` — 3 rascunhos originais (o "antes", **read-only**).
- `scripts/` — geradores (`build_model.py`, `build_painel.py`, `build_pdfs.py`, `build_legal.py`).
- `.claude/agents/` (agentes) · `.claude/skills/` (planner-designer, typst-planner) · `.mcp.json` (MCP servers do projeto).
- `design/` — **módulo de design do produto** (Concurseiro): pesquisa + conceitos + `caderno-de-erros/` (standalone F2) + **3 versões do planner**: `planner-v1` (referência de estilos 2.0 PRO), `planner-v2` (preterida), **`planner-v3` (candidato atual em avaliação)**. Índice e navegação: `design/concurseiro/README.md`. Ver também `design/README.md` e `conceitos/roadmap-faseado.md`.

## Comandos (regenerar — requer `uv`; não há openpyxl/markdown global)
```bash
uv run --with openpyxl python scripts/build_model.py     # modelo .xlsx (10 abas)
uv run --with openpyxl python scripts/build_painel.py    # painel de KPIs
uv run --with markdown --with matplotlib --with numpy python scripts/build_pdfs.py  # HTML dos docs (briefing)
uv run --with markdown python scripts/build_legal.py     # HTML dos docs jurídicos
# PDF a partir do HTML:
uv run --with weasyprint --with pypdf python ~/.claude/skills/briefing-designer/templates/render.py <in.html> <out.pdf>
# Design do produto (planner-v3 = candidato atual em avaliação):
uv run --with typst python design/concurseiro/planner-v3/typst/render.py <pagina>   # PDF + PNG de QA
uv run --with pypdf python design/concurseiro/planner-v3/typst/finalize.py          # merge → PDF/X-1a CMYK
```
Conferir fórmulas do modelo: `uv run --with openpyxl --with formulas python ...` (recalcular e comparar com o texto).
Git: **commit/push só quando o usuário pedir.**

## Agentes & skills do projeto (`.claude/`)
| Agente | Quando acionar | Encadeia com → |
|---|---|---|
| `market-researcher` | mercado (TAM/SAM/SOM), concorrência, demanda, taxas | → pricing-strategist, financial-modeler |
| `pricing-strategist` | preço, posicionamento (Dunford), oferta/SKU | ← market-researcher → financial-modeler |
| `sourcing-analyst` | gráfica BR × China, NCM, landed cost, RFQ, QA | → financial-modeler (Workflow PSF) |
| `financial-modeler` | unit economics, viabilidade, sensibilidade, rebuild do `.xlsx` | ← pricing/sourcing → business-validator → doc-updater |
| `business-validator` | **antes de dar algo por pronto** — checagem adversarial cruzada (read-only) | ← financial-modeler → doc-updater |
| `doc-updater` | propagar número-âncora por deliverables/CLAUDE.md (após validar; diff p/ revisão) | ← business-validator |
| `conteudo-mayara` | conteúdo/lançamento (roteiros TikTok/Reels, copy, calendário) — motor de aquisição | ← pricing-strategist |

**Skills** (`.claude/skills/`): `planner-designer` (decide design) + `typst-planner` (executa o build print-ready) — par decide→executa do módulo de design.

**Ferramentas — usar por padrão em tarefa substancial** (não improvisar): **`sequential-thinking`** (planejar/decompor o difícil) · **`exa`/`tavily`** (pesquisa web datada — pesquisa-primeiro antes de criar do zero) · **`context7`** (doc atual de libs). Em **design**, seguir o pipeline `planner-designer` → `typst-planner` → **QA visual do PNG** (hero-first). Antes de "pronto": `business-validator` (Workflow VAP).

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
  Planner de Estudo** (3 meses, ~112 pp, **SEM ficha**; só ponteiro "→ Caderno de Erros") · **F2** (lançamento sequencial, pago pelo caixa): **Caderno de Erros standalone** + **Treino de Força** + Síntese/Bússola/capa · **F3** foto→app. `[Daniel · 21/jun/2026]`
- **Persona v1:** dedicação exclusiva (recorte de alta intensidade da **P1**).
- **Design candidato:** **`planner-v3`** (redesign "por ciclo" · print-ready · PDF/X-1a gerado em 21/jun/2026 · fundamentado em `conceitos/pesquisa-v3-sintese.md` + `spec-v3-refino.md`). 6 páginas: Guia · Bússola+**Registro de Matérias** (ledger/dicionário de cor) · **Ciclo** · Sessão (time-log pintável + **calibração**) · Semanal · Pontes. **v1 = referência de estilos** (não é o produto final); v2 = preterida. Próximo gate: teste de impressão. **Decisão v1×v3 para produção/RFQ: a definir.**

## Convenções (inegociáveis)
- **Todo número leva fonte + data**; triangular ≥2 fontes para números centrais. Confiança:
  `[confirmado]` · `[estimativa triangulada]` · `[a confirmar]`. Nunca usar "ILUSTRATIVO" como fechado.
- **`sources/` é imutável** (o "antes"); o "depois" vai para `deliverables/`.
- **Datas relativas → absolutas**; registrar câmbio/data de toda cotação. Tributos/tarifas mudam →
  recomendar conferência (Siscomex/Receita/despachante/contador); não afirmar alíquota sem fonte+data.
- **Tabela em markdown precisa de linha em branco ANTES** dela (senão não vira tabela no PDF).
- **Aspas de ênfase** nos `.md` viram itálico no PDF; não afetam a renderização da tabela.
- Validar com **business-validator** antes de concluir qualquer artefato.
