# Metodologia de refatoração

Como transformar os rascunhos de `sources/` em artefatos profissionais defensáveis.

## Princípio

Os rascunhos atuais são bem estruturados, mas a maioria dos números é **estimativa de
mercado / "ILUSTRATIVO" / "a confirmar"**, e o dimensionamento de mercado é raso. A
refatoração não reescreve o texto — ela **substitui suposição por evidência** e adiciona o
rigor analítico que falta.

## Pipeline

1. **Evidência primeiro** (`research/evidence/`)
   - Pesquisa multi-fonte via skill **deep-research** (Exa + Tavily) + WebSearch/WebFetch.
   - Cada tema vira uma nota com: pergunta · método · achados · tabela de fontes · confiança.
   - Triangular ≥2 fontes independentes para todo número central.

2. **Modelo financeiro** (`models/`)
   - **financial-modeler** audita o `.xlsx` atual, corrige fórmulas, e reconstrói com
     premissas ligadas à evidência + **análise de sensibilidade** (não só 3 cenários).

3. **Refatoração dos documentos** (`deliverables/`)
   - Business plan e relatório de sourcing reescritos com os números agora respaldados.
   - Posicionamento e preço passam por **pricing-strategist**; sourcing por **sourcing-analyst**.
   - Formato final profissional via **briefing-designer** (PDF) quando aplicável.

4. **Validação adversarial** (gate de qualidade)
   - **business-validator** tenta derrubar o material: consistência cruzada, aritmética,
     fontes, premissas frágeis, alucinação. Veredito por severidade antes de "pronto".

## Taxonomia de confiança

| Marca | Significado | Uso |
|---|---|---|
| `[confirmado]` | fonte primária datada e verificável | pode embasar decisão |
| `[estimativa triangulada]` | ≥2 fontes convergentes, ainda sem confirmação formal | usar com ressalva explícita |
| `[a confirmar]` | suposição/faixa de mercado | nunca apresentar como fechado |

## Padrão de fontes

- Preferir primárias: IBGE, órgãos de concurso, Receita Federal/Siscomex, páginas oficiais dos
  marketplaces, relatórios setoriais — a blogs.
- Datar toda fonte (mês/ano) e registrar o câmbio usado em qualquer conversão.
- Tributos/tarifas: sempre recomendar conferência (Siscomex Classif / Receita / despachante /
  contador). Não fixar alíquota sem fonte datada.

## Regras de ouro

- `sources/` é **imutável** — é o "antes". Todo resultado vai para `research/`, `models/` ou
  `deliverables/`.
- **Uma fonte da verdade** para números compartilhados (ver tabela de fatos-âncora no `CLAUDE.md`);
  ao alterar um, propagar para os três artefatos.
- Nenhum artefato é "concluído" sem passar pelo **business-validator**.
