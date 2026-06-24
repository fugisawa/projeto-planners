# Módulo de Design — Planner de Estudos (Concurseiro)

Espaço de trabalho do **design do produto**: o objeto físico e o sistema de páginas do
**planner de estudos** (o *Concurseiro*). É **complementar ao dossiê de negócio** da raiz do
repositório — enquanto o dossiê responde *"o negócio fecha?"*, este módulo responde
*"como o planner é, por dentro e por fora?"*.

> **Status (21/jun/2026):** existem **três versões** do planner, todas print-ready por código (Typst,
> in-house · CMYK · PDF/X-1a · FOGRA39). É um **sistema de estudo modular** ("hub analógico"), **F1
> SEM ficha integrada** (só ponteiro "→ Caderno de Erros" = Fase 2; `ficha.typ` na v1 é artefato de
> teste, **não** entra no produto `[Daniel · 21/jun/2026]`).
>
> | Versão | Status | O que é |
> |---|---|---|
> | `planner-v1` | **referência de estilos** (2.0 PRO) | 1º protótipo; tokens/Lato/cantos retos — base de estilo, **não é o produto final** |
> | `planner-v2` | **preterida** | iteração "só melhorias" (eyebrow + seletor ○△→×); arquivada |
> | **`planner-v3`** | **★ candidato atual (em avaliação)** | redesign "por ciclo": Ciclo · Registro de Matérias (ledger) · calibração · Sessão com time-log pintável. Fundamento: `conceitos/pesquisa-v3-sintese.md` + `spec-v3-refino.md` |
>
> **Decisão v1×v3 para produção/RFQ: a definir.** Índice/navegação: [`concurseiro/README.md`](concurseiro/README.md).
> Validado com a Mayara (19/jun). Próximo: teste de impressão real.

## Estrutura

```
design/
└── concurseiro/                  o planner de estudos  (ver concurseiro/README.md = índice)
    ├── planner-v3/   ★ CANDIDATO ATUAL (em avaliação) — redesign por ciclo · 6 páginas
    │   └── typst/                config/estilos + 6 páginas + render/finalize → PDF/X-1a CMYK
    ├── planner-v1/               referência de estilos (2.0 PRO) — não é o produto final
    ├── planner-v2/               preterida (arquivada)
    ├── conceitos/                definição, roadmap, síntese, teardowns, pesquisa-v3, spec-v3
    ├── caderno-de-erros/         módulo standalone (Fase 2)
    ├── referencias/              imagens do exemplar real (base visual)   ← VOCÊ ENVIA
    └── pesquisa/                 evidência de pesquisa (fontes/ datadas + capturas/ gitignored)
```

> A pasta `treino/` (design do planner de **Treino de Força**) poderá ser criada ao lado de
> `concurseiro/` quando chegar a vez — a estrutura é a mesma.

## Fluxo de trabalho (o valor flui numa direção)

`referencias/` (exemplar) + `pesquisa/` (Exa · Tavily · Playwright)
→ **análise** → `conceitos/` (definição, direção, **síntese de design** + `pesquisa-v3-sintese` + `spec-v3-refino`)
→ **build paramétrico** em [`planner-v3/typst/`](concurseiro/planner-v3/typst/) (Typst · candidato atual)
→ `planner-v3-proto-pdfx1a.pdf` (print-ready) → teste de impressão → RFQ/gráfica.

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
(re-baixáveis via os arquivos `benchmark-{china,coreia,japao}.md` que contêm todas as URLs).
Catálogo e proveniência em `concurseiro/referencias/fontes.md`.
