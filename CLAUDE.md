# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## O que é este repositório

**Não é um codebase de software.** É o dossiê de uma micro-venture D2C: o **PROJETO PLANNERS**
— uma linha de dois planners perpétuos premium (sem datas) para nichos brasileiros de alto
engajamento:

1. **Concurseiro** — posicionado como *sistema de estudo* (grade de ciclo, revisão espaçada,
   tracker de simulados), não "agenda".
2. **Treino de Força** — posicionado como *diário de periodização* (mesociclo, carga, RPE/RIR,
   PRs, tonelagem), não "caderno".

Operação enxuta a partir de **Brasília/DF**, investimento inicial **~R$ 5.000**. **Fase 1** =
produção nacional (gráfica, micro-lote); **Fase 2** = escala via importação da China.
Idioma de trabalho: **português (pt-BR)**.

O objetivo corrente do repositório é **refatorar três rascunhos em artefatos profissionais,
respaldados em pesquisa de mercado robusta e análise financeira defensável.**

## Arquitetura do dossiê (o fluxo que importa)

O valor flui em uma direção. Entender isto evita inconsistência entre documentos:

```
sources/  (rascunhos originais, IMUTÁVEIS)
   │  insumo de partida — nunca editar; são o "antes"
   ▼
research/  (base de evidências: pesquisa de mercado datada e citável)
   │  alimenta números e afirmações
   ▼
models/        deliverables/
(modelo .xlsx)  (artefatos refatorados: business plan, sourcing, etc.)
   └──────┬──────┘
          ▼
   business-validator  (checagem adversarial cruzada antes de "pronto")
```

Os **três artefatos precisam ser internamente consistentes**. Números compartilhados (preço,
custo/un, câmbio, margem, MOQ, alíquotas, sell-through) têm **uma única fonte da verdade** — o
modelo financeiro em `models/` puxa premissas de `research/`, e os documentos em `deliverables/`
citam os mesmos valores. Ao mudar um número-chave, propague para os três.

### Layout
- `sources/` — os 3 rascunhos originais (2 `.md` + `viabilidade-planners.xlsx`). **Read-only.**
- `research/evidence/` — notas de evidência por tema (mercado, concorrência, tributos, sourcing).
- `research/` — laudos de validação (`validation-<data>.md`).
- `models/` — modelo(s) financeiro(s) reconstruído(s) (`.xlsx`).
- `deliverables/` — artefatos profissionais finais (business plan, relatório de sourcing, PDFs).
- `docs/` — metodologia e notas de trabalho.
- `.claude/agents/` — subagentes específicos do projeto.

## Fatos-âncora (fonte da verdade — mantenha sincronizados nos 3 artefatos)

| Parâmetro | Valor de planejamento | Observação |
|---|---|---|
| Câmbio USD/BRL | **≈ R$ 5,20** | datar ao reconfirmar (≈ R$ 5,18 em 17/jun/2026) |
| Investimento inicial | **R$ 5.000** | — |
| Preço de lançamento | **Concurseiro R$ 119 · Treino R$ 109** | premium ~15% acima do Juspodivm (~R$ 103) |
| Custo/un (Fase 1, BR) | **~R$ 45** (Tier B) | faixa de mercado, a confirmar por 3 orçamentos |
| Mix de canal (Fase 1) | **90% direto / 10% marketplace** | marketplace destrói margem neste preço |
| Margem contrib. direta | **~R$ 62/un (52%)** | vs ~R$ 7,60 no marketplace |
| Classificação fiscal | **NCM 4820.10.00 — tributado** | planner ≠ livro; **sem** imunidade do art. 150 CF |
| Fases | **Fase 1 BR / Fase 2 China** | China só com SKU validado, ≥1.000 un, CNPJ + Radar |

## Comandos

Inspecionar ou reconstruir o modelo financeiro (`.xlsx`) — não há `openpyxl` global; use **uv**:
```bash
# Ler/auditar a planilha (dump de fórmulas e valores)
uv run --with openpyxl python - <<'PY'
import openpyxl
wb = openpyxl.load_workbook("sources/viabilidade-planners.xlsx", data_only=False)
for ws in wb.worksheets:
    print("==", ws.title, "==")
    for row in ws.iter_rows():
        for c in row:
            if c.value is not None: print(c.coordinate, repr(c.value))
PY
```
Reconstruções e cálculos de landed cost também rodam via `uv run --with openpyxl python ...`.
Histórico versionado com git (repo inicializado; commit/push só quando o usuário pedir).

## Subagentes do projeto (`.claude/agents/`)

| Agente | Quando acionar |
|---|---|
| **market-researcher** | dimensionar mercado (TAM/SAM/SOM), concorrência, preços, demanda, taxas |
| **sourcing-analyst** | gráfica BR × China, NCM, landed cost, regimes de importação, RFQ, QA |
| **financial-modeler** | unit economics, break-even, cenários, sensibilidade, rebuild do `.xlsx` |
| **pricing-strategist** | preço, posicionamento (April Dunford), oferta/SKU, economia de canal |
| **business-validator** | **sempre antes de dar algo como pronto** — checagem adversarial e cruzada |

Subagentes rodam em Sonnet por padrão (config global); `financial-modeler` e
`business-validator` herdam o modelo principal (`model: inherit`) por exigirem precisão.

## Skills correspondentes (globais — acionar por tarefa)

- **deep-research** — motor de pesquisa de mercado (Exa + Tavily). Base de `research/`.
- **data-analyst** — EDA, tabelas e quadros comparativos, dataviz com storytelling.
- **senior-data-scientist** — modelagem de cenários, sensibilidade, projeções.
- **briefing-designer** — gerar o business plan / relatório de sourcing como **PDF profissional**.
- **xlsx** — criar/editar o modelo de viabilidade quando o deliverable for a própria planilha.
- **pptx** / **docx** — formatos alternativos de entrega (pitch deck, documento Word).

## Convenções (inegociáveis)

- **Toda afirmação numérica leva fonte + data.** Triangular ≥2 fontes para números centrais.
  Marcar confiança: `[confirmado]` · `[estimativa triangulada]` · `[a confirmar]`. Nunca usar
  número "ILUSTRATIVO" como se fosse fechado.
- **`sources/` é imutável** — é o "antes" do refactor. O "depois" vai para `deliverables/`.
- **Datas relativas → absolutas.** Registrar o câmbio e a data de toda cotação de preço/tributo.
- **Tributos e tarifas mudam** — recomendar conferência no Siscomex Classif / Receita /
  despachante / contador; não afirmar alíquota sem data e fonte.
- **Imutabilidade de dados** ao manipular o modelo: gerar nova versão do `.xlsx`, não sobrescrever
  silenciosamente o original em `sources/`.
- Validar com **business-validator** antes de marcar qualquer artefato como concluído.
