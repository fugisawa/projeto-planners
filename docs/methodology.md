# Metodologia

Como este dossiê foi construído — e como mantê-lo rigoroso. Princípio único: **substituir suposição
por evidência**, com honestidade calibrada. O público é **interno** (os dois sócios), então o viés é
mostrar o que é fato, o que é estimativa e onde o plano pode falhar — não vender.

## Pipeline (evidência → decisão)
Cada camada alimenta a próxima; nada "fecha" sem passar pela validação.

1. **Evidência primeiro** — `research/evidence/`
   - Pesquisa multi-fonte (skill `deep-research` / Exa + Tavily + WebSearch), **triangulando ≥2
     fontes** para todo número central. Cada tema vira uma nota: pergunta · método · achados ·
     tabela de fontes (nome · URL · data · trecho) · nível de confiança.
   - Frameworks de mercado: **TAM/SAM/SOM** (top-down + bottom-up), personas, **Porter (5 forças)**,
     mapa competitivo e a economia de **recorrência/LTV**.

2. **Modelagem financeira** — `models/`
   - `financial-modeler` constrói o `.xlsx` com premissas ligadas à evidência: unit economics por
     canal, break-even, cenários, **análise de sensibilidade**, projeção 12M, pró-labore (A×B),
     **EVEF** (DRE e fluxo de caixa 5 anos, VPL/TIR/payback descontado, capital de giro) e LTV/recorrência.
   - **Rigor quantitativo:** toda fórmula é **conferida por recálculo independente** (lib `formulas`
     + um cálculo paralelo em Python). Os números do texto têm de bater com o `.xlsx` ao centavo.

3. **Estratégia & redação** — `deliverables/`
   - Posicionamento (April Dunford), preço (`pricing-strategist`), sourcing/tributos
     (`sourcing-analyst`), estratégia (moat, SWOT, **Ansoff**, cenários, Business Model Canvas) e
     gestão (charter, RACI, OKRs, risk register, decision log).
   - Cada afirmação numérica **cita** a evidência/modelo e leva **marca de confiança**.

4. **Validação adversarial** — gate de qualidade
   - `business-validator` tenta **derrubar** o material: consistência cruzada entre documentos,
     aritmética recomputada, fontes, premissas frágeis/otimismo e alucinação. Veredito por
     severidade (CRÍTICO → BAIXO) antes de "pronto". Laudos em `research/validation/`.

5. **Publicação**
   - PDFs profissionais via `briefing-designer` (persona editorial); documentos jurídicos em estilo
     formal; e o **guia em linguagem leiga** (`guia-do-negocio`) para quem não é da área.

## Processo iterativo (o que aguça o dossiê)
A revisão dos sócios é entrada de dados, não ruído. Várias premissas centrais nasceram desse loop:
a leitura correta do **ciclo eleitoral** de concursos (lull legal, não queda estrutural), a natureza
**recorrente** do produto (recompra 3–4×/ano → LTV), e a **força de conteúdo da sócia** que de-risca
a distribuição. Ao receber correção do dono, **propague-a por todo o dossiê** e revalide.

## Taxonomia de confiança
| Marca | Significado | Uso |
|---|---|---|
| `[confirmado]` | fonte primária datada e verificável | pode embasar decisão |
| `[estimativa triangulada]` | ≥2 fontes convergentes, sem confirmação formal | usar com ressalva explícita |
| `[a confirmar]` | suposição / faixa de mercado | nunca apresentar como fechado |

## Padrão de fontes
- Preferir **primárias** (IBGE, órgãos de concurso, ACAD/IHRSA, Receita/Siscomex, páginas oficiais
  de marketplaces, releases setoriais) a blogs. **Datar tudo** (mês/ano); registrar o câmbio usado.
- **Tributos/tarifas mudam** → recomendar conferência (Siscomex Classif / Receita / despachante /
  contador); nunca fixar alíquota sem fonte datada.

## Fonte única da verdade
Números compartilhados (preço, custo, margem, LTV, câmbio, alíquotas, sell-through…) têm **um único
valor canônico** — a tabela de **Fatos-âncora** no `CLAUDE.md`. Ao mudar um, **propagar para todos os
documentos + o modelo** e revalidar.

## Manutenção & extensão
- Novo número/afirmação → evidência datada **antes** de escrever.
- Novo documento → **citar** os fatos-âncora, nunca recalcular por fora.
- Mudou um fato-âncora → atualizar `CLAUDE.md` → propagar → `business-validator`.

## Regras de ouro
- `sources/` é **imutável** (o "antes"); resultados vão para `research/`, `models/`, `deliverables/`.
- **Honestidade > otimismo:** marcar incerteza; separar fato de meta.
- Nada é "concluído" sem passar pelo **business-validator**.
