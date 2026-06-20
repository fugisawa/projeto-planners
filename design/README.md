# Módulo de Design — Planner de Estudos (Concurseiro)

Espaço de trabalho do **design do produto**: o objeto físico e o sistema de páginas do
**planner de estudos** (o *Concurseiro*). É **complementar ao dossiê de negócio** da raiz do
repositório — enquanto o dossiê responde *"o negócio fecha?"*, este módulo responde
*"como o planner é, por dentro e por fora?"*: grade do ciclo de estudo, tracker de revisão
espaçada, miolo, capa, formato, papel e a experiência de uso.

> **Status (19/jun/2026):** **pesquisa concluída e produto definido.** É um **sistema de estudo
> modular** ("hub analógico"). **v1 = o Planner de Estudo** (com diagnóstico de erro *lite*); o
> **Caderno de Erros** completo é módulo standalone (Fase 2) —
> [`concurseiro/caderno-de-erros/`](concurseiro/caderno-de-erros/README.md). Roadmap em
> [`concurseiro/conceitos/roadmap-faseado.md`](concurseiro/conceitos/roadmap-faseado.md).
> **Validado com a Mayara (19/jun/2026).** Próximo: protótipo de 1 ciclo → sourcing/custo.

## Estrutura

```
design/
└── concurseiro/                  o planner de estudos
    ├── referencias/              imagens-protótipo enviadas (base visual)   ← VOCÊ ENVIA
    ├── pesquisa/                 evidência de pesquisa de design
    │   ├── fontes/               extrações Exa/Tavily, links datados
    │   └── capturas/             screenshots de navegação (Playwright)
    └── conceitos/                user stories, features, direção de design, moodboard
```

> A pasta `treino/` (design do planner de **Treino de Força**) poderá ser criada ao lado de
> `concurseiro/` quando chegar a vez — a estrutura é a mesma.

## Fluxo de trabalho (o valor flui numa direção)

`referencias/` (protótipos) + `pesquisa/` (Exa · Tavily · Playwright)
→ **análise** (entender design, opções, padrões)
→ `conceitos/` (user stories, features, direção de design)
→ deliverable de design (a definir: spec de miolo, wireframes, mockups).

| Ferramenta | Papel no módulo |
|---|---|
| **Exa** | busca semântica/neural de referências e prior art de design |
| **Tavily** | busca agêntica, extração e *crawl* de páginas de produto/lojas |
| **Playwright** | navegar lojas/galerias e **capturar** telas (vão para `pesquisa/capturas/`) |

## Convenções (herdadas do dossiê)

- **Idioma:** pt-BR.
- **Toda referência leva fonte + data** (de onde veio a imagem/inspiração e quando foi captada);
  datas relativas → **absolutas**.
- **Imutabilidade do insumo:** as imagens em `referencias/` são o material-base; análises e
  derivados vão para `pesquisa/` e `conceitos/` — não se sobrescreve o protótipo original.
- **Crédito/uso:** referências de concorrentes servem a estudo e inspiração; registrar a origem
  e respeitar direitos ao reutilizar qualquer elemento.

## Versionamento das imagens

**Decidido (19/jun/2026):** as imagens de referência **são versionadas**, mas qualquer
**dado pessoal é tarjado** antes de entrar no Git. Os originais sem tarja ficam em
`concurseiro/referencias/_originais/` — **somente local** (regra no `.gitignore` da raiz).
Catálogo e proveniência em `concurseiro/referencias/fontes.md`.
