# Módulo de Design — Planner de Estudos (Concurseiro)

Espaço de trabalho do **design do produto**: o objeto físico e o sistema de páginas do
**planner de estudos** (o *Concurseiro*). É **complementar ao dossiê de negócio** da raiz do
repositório — enquanto o dossiê responde *"o negócio fecha?"*, este módulo responde
*"como o planner é, por dentro e por fora?"*.

> **Status (20/jun/2026):** **protótipo Tier-1 das 5 páginas construído** — gerado **por código**
> (Typst, in-house, sem InDesign/Affinity) e **print-ready** (CMYK · PDF/X-1a · FOGRA39). É um
> **sistema de estudo modular** ("hub analógico"); **v1 = o Planner de Estudo** (com diagnóstico de
> erro *lite*); **Caderno de Erros** completo = Fase 2. Fonte de verdade + como gerar:
> [`concurseiro/planner-v1/`](concurseiro/planner-v1/README.md). Validado com a Mayara (19/jun).
> Próximo: micro-polish · página de onboarding · teste de impressão real.

## Estrutura

```
design/
└── concurseiro/                  o planner de estudos
    ├── planner-v1/               ★ PROTÓTIPO (fonte de verdade) — ver planner-v1/README.md
    │   └── typst/                config/estilos + 5 páginas + render/finalize → PDF/X-1a CMYK
    ├── conceitos/                definição, direção, síntese de design, teardowns, instruções
    ├── caderno-de-erros/         módulo standalone (Fase 2)
    ├── referencias/              imagens do exemplar real (base visual)   ← VOCÊ ENVIA
    └── pesquisa/                 evidência de pesquisa (fontes/ datadas + capturas/ gitignored)
```

> A pasta `treino/` (design do planner de **Treino de Força**) poderá ser criada ao lado de
> `concurseiro/` quando chegar a vez — a estrutura é a mesma.

## Fluxo de trabalho (o valor flui numa direção)

`referencias/` (exemplar) + `pesquisa/` (Exa · Tavily · Playwright)
→ **análise** → `conceitos/` (definição, direção, **síntese de design refinada**)
→ **build paramétrico** em [`planner-v1/typst/`](concurseiro/planner-v1/typst/) (Typst)
→ `planner-proto-pdfx1a.pdf` (print-ready) → RFQ/gráfica.

Skills de apoio: **`typst-planner`** (execução) e **`planner-designer`** (princípios de design).

## Convenções (herdadas do dossiê)

- **Idioma:** pt-BR.
- **Toda referência leva fonte + data**; datas relativas → **absolutas**.
- **Imutabilidade do insumo:** imagens em `referencias/` são o material-base; análises e derivados
  vão para `pesquisa/`, `conceitos/` e `planner-v1/` — não se sobrescreve o protótipo original.
- **Crédito/uso:** referências de concorrentes servem a estudo e inspiração; registrar a origem.

## Versionamento das imagens

As imagens de referência **são versionadas**, mas qualquer **dado pessoal é tarjado** antes do Git.
Originais sem tarja ficam em `concurseiro/referencias/_originais/` — **somente local** (`.gitignore`).
Imagens de concorrentes (`pesquisa/capturas/`, `caderno-de-erros/referencias/`) são **gitignored**
(re-baixáveis via manifests). Catálogo e proveniência em `concurseiro/referencias/fontes.md`.
