# Arquitetura de Orquestração — Projeto Planners
**Data:** 20/jun/2026 | **Autor:** subagente arquiteto (Sonnet 4.6) | **Revisão recomendada:** business-validator

---

## Resumo executivo

O projeto tem 7 agentes especializados e 2 skills de design maduros. Os agentes doc-updater e conteudo-mayara já foram implementados (jun/2026). Os workflows propostos neste documento estão parcialmente em vigor: cada agente ainda é acionado pontualmente, sem gatilhos formais de encadeamento, sem padrões de handoff e sem orquestrador. O resultado é retrabalho (números mudados em um agente que não se propagam), validação tardia (business-validator chamado depois do fato) e ausência de um pipeline claro para o módulo de design (typst-planner + planner-designer sem protocolo de QA).

Esta proposta define: (a) mapa de capacidades com gatilhos claros; (b) 4 workflows reutilizáveis; (c) 3 novos agentes/skills justificados; (d) melhorias na tabela do CLAUDE.md.

---

## (a) Mapa de Capacidades — Skill vs. Agente

### Regra fundamental de separação

| Tipo | O que faz | Quando NÃO usar |
|---|---|---|
| **Skill** | Protocolo de execução tática (como fazer) — compila Typst, gera layouts, aplica padrões de design | Quando a tarefa exige pesquisa, julgamento estratégico ou cálculo financeiro |
| **Agente** | Especialista de domínio (o que decidir) — pesquisa, analisa, recomenda, valida | Quando a tarefa é puramente mecânica/executiva e um skill resolve |

### Tabela completa de gatilhos

| Componente | Tipo | Gatilho claro (invocar quando...) | Output esperado | NÃO invocar para |
|---|---|---|---|---|
| **planner-designer** | Skill | Desenhar/criticar página; decidir hierarquia tipográfica; checar cor, grid, fio, canto | Princípios + decisão de design fundamentada | Compilar Typst, gerar PDF |
| **typst-planner** | Skill | Implementar em código Typst qualquer página de planner; converter design para print-ready; exportar CMYK/PDF-X | `.typ` compilado + PNG de QA + PDF gráfica | Decidir o que o layout deve conter |
| **market-researcher** | Agente | Precisar de número de mercado com fonte datada (TAM/SAM/SOM, concorrentes, taxas ML/Shopee, sinais de demanda) | `research/evidence/<tema>.md` + resumo executivo | Calcular margens, recomendar preço |
| **pricing-strategist** | Agente | Decidir preço, mudar SKU ou bundle, recalcular economia de canal, posicionamento Dunford | Tabela Dunford + recomendação de preço + regra de entrada em marketplace | Dimensionar mercado, modelar cashflow |
| **sourcing-analyst** | Agente | Avaliar novo fornecedor, confirmar NCM/alíquota, calcular landed cost, preparar RFQ, cronograma de produção | Tabela de decisão sourcing + cálculo de landed cost documentado | Modelar LTV, recomendar preço |
| **financial-modeler** | Agente | Qualquer número de custo/preço/margem/ROI/payback mudou; rebuild do .xlsx; sensibilidade; cenários | Laudo + tabelas de unit economics + .xlsx atualizado em `models/` | Pesquisar mercado, definir sourcing |
| **business-validator** | Agente | ANTES de dar qualquer entregável por pronto; após qualquer mudança em número-âncora do CLAUDE.md | Laudo com severidades CRÍTICO/ALTO/MÉDIO/BAIXO + veredito | Construir modelos, pesquisar dados |

### Diagrama de responsabilidade (visual)

```
PESQUISA          DECISÃO                 EXECUÇÃO              VALIDAÇÃO
─────────         ───────                 ─────────             ──────────
market-           pricing-strategist ─→  planner-designer ─→   business-
researcher   ─→   sourcing-analyst   ─→  typst-planner         validator
                  financial-modeler
```

---

## (b) Padrões de Workflow Reutilizáveis

### Workflow 1 — Pesquisa → Síntese → Build (P→S→B)

**Quando aplicar:** nova seção do business plan; validar premissa de mercado; briefing de competidor.

**Sequência (pipeline):**

```
① market-researcher (paralelo com fontes independentes)
      ↓ research/evidence/<tema>.md
② pricing-strategist OU sourcing-analyst (lê evidência, sintetiza implicações)
      ↓ recomendação com números
③ financial-modeler (integra ao modelo .xlsx se número-âncora mudou)
      ↓ tabela de unit economics atualizada
④ business-validator (checagem adversarial)
      ↓ veredito
⑤ [se aprovado] atualizar deliverable em deliverables/
```

**Custo estimado:** ~4N de turns sequenciais. Estágios 1–2 podem ser parcialmente paralelos se os domínios forem distintos (ex.: pesquisa de mercado Concurseiro em paralelo com pesquisa Treino).

**Anti-padrão a evitar:** pular o market-researcher e alimentar pricing/financial com estimativas não-documentadas. Output ruim no estágio 1 contamina toda a cadeia.

---

### Workflow 2 — Validar-Antes-de-Pronto (VAP)

**Quando aplicar:** SEMPRE antes de marcar qualquer entregável como pronto; antes de commit/push de deliverable; após mudança em qualquer número-âncora do CLAUDE.md.

**Sequência:**

```
① Confirmar: quais documentos foram alterados?
② business-validator lê todos os artefatos afetados
      ↓ laudo com tabela de premissas (Premissa | Evidência | Contra-argumento | Severidade | Teste)
③ Se CRÍTICO encontrado → PARAR; corrigir antes de continuar
   Se ALTO → plano de mitigação com prazo
   Se MÉDIO/BAIXO → documentar; prosseguir
④ [somente se aprovado] marcar como pronto / commit
```

**Regra de ouro:** o business-validator é o "porteiro" — nunca bypasse. O custo de 1 turn adversarial é trivial comparado ao custo de circular número errado.

**Gatilho automático recomendado** (hook Stop): ao final de qualquer sessão que altere arquivo em `deliverables/` ou `models/`, imprimir: "Lembrete: rode o business-validator antes de dar como pronto."

---

### Workflow 3 — Pipeline de Design (typst-planner + planner-designer)

**Quando aplicar:** criar nova página de planner; iterar sobre mockup existente; preparar arquivo para gráfica.

**Sequência:**

```
① planner-designer (SKILL) — decidir conteúdo + hierarquia (princípios 2.0: título azul-ardósia
      + tab; cantos RETOS; listas INDIGO coluna+divisória; cor quieta; alinhamento de divisórias)
      ↓ especificação: grid 4.5mm, tipo, cor, seções, mecânicas (time-log, studyrows)
② typst-planner (SKILL) — implementar em Typst
      ↓ .typ → compilar → PNG de QA
③ OLHAR o PNG (obrigatório; não confiar no código às cegas)
      ↓ checklist de inegociáveis: ≤3 níveis tipo; fill:none; fio nunca 1pt; cantos corretos
④ [se ok] finalize.py → CMYK/PDF-X FOGRA39 para gráfica
   [se NOK] voltar ao passo ①/② com diagnóstico específico
```

**Separação crítica:** planner-designer decide, typst-planner executa. Nunca pedir ao typst-planner que "invente" o layout — é papel do planner-designer. O inverso (pedir ao planner-designer que compile) também é erro.

**Hero-first:** acerte a página mais difícil primeiro, **valide com o usuário**, só então propague o sistema às demais. Itere render→olhar PNG→corrigir — o capricho mora na iteração (não no primeiro passe).

**QA de impressão:** sempre verificar `pdffonts` (fonts embarcadas), `gs -o - -sDEVICE=inkcov` (CMYK OK) e nº de páginas (render.py avisa se passar de 1).

---

### Workflow 4 — Cadeia Preço/Sourcing/Financeiro (PSF)

**Quando aplicar:** qualquer mudança que envolva custo unitário, preço de venda, mix de canal, fornecedor ou gatilho de escala (ex.: "gráfica respondeu o orçamento real"; "decidimos mudar para R$129"; "atingimos o gatilho de R$135k").

**Sequência (Supervisor + Fan-Out parcial):**

```
GATILHO: número-âncora mudou
    ↓
Fan-out PARALELO:
    ├── sourcing-analyst: recalcular landed cost com novo dado
    └── pricing-strategist: recalcular economia de canal / posicionamento
    ↓ (fan-in — coletar outputs)
financial-modeler (Supervisor Opus): integrar ambos; recalcular unit economics; rebuild .xlsx
    ↓
business-validator: validação adversarial do modelo atualizado
    ↓
[se aprovado] propagar para deliverables/ (business-plan-planners.md, consultoria-sourcing-planners.md, estudo-viabilidade-economica.md)
```

**Por que fan-out:** sourcing e pricing são independentes — não há dependência entre eles. Rodar em paralelo reduz latência pela metade.

**Custo:** ~(3N + 1 supervisor + 1 validator). Justificado porque a propagação manual de números cria inconsistências entre documentos — o maior risco operacional atual do dossiê.

---

## (c) Agentes/Skills implementados e propostos

### Implementados (jun/2026)

### Agente 1 — `doc-updater` (implementado · jun/2026)

**Justificativa:** O maior gap operacional atual. Quando um número-âncora muda (ex.: custo/un 4/4 de R$43–55 → cotação real após RFQ), ele precisa ser propagado para todos os deliverables (business-plan, consultoria-sourcing, estudo-viabilidade, guia-do-negocio) E para o CLAUDE.md. Hoje isso é feito manualmente, gerando inconsistências. O `business-validator` detecta as divergências mas não as corrige — o `doc-updater` fecha esse loop.

**Quando invocar:** após financial-modeler atualizar o .xlsx E o business-validator aprovar; após mudança confirmada em qualquer número-âncora do CLAUDE.md.

**Capacidade:** ler todos os deliverables/.md; localizar ocorrências do número antigo; substituir com o novo; marcar com fonte + data; gerar diff para revisão humana antes de salvar.

**Tools:** Read, Edit, Grep, Glob (sem WebSearch — não precisa de pesquisa externa).

**Modelo:** sonnet (tarefa mecânica de substituição + verificação; não exige raciocínio pesado).

**Definition of Done:** todos os arquivos em `deliverables/` e `CLAUDE.md` usam o mesmo valor; diff gerado para aprovação humana antes do Write.

---

### Agente 2 — `conteudo-mayara` (implementado · jun/2026)

**Justificativa:** Mayara é o motor de aquisição (CAC ≈ R$0 via orgânico). Hoje não há nenhum suporte de IA para o trabalho dela — roteiros de TikTok, copy de produto, narrativa de lançamento, scripts de stories, briefings de parceria. Sem esse agente, a distribuição depende inteiramente da intuição dela, sem estrutura replicável.

**Quando invocar:** ao preparar lançamento de produto; ao criar campanha de conteúdo; ao briefar UGC/parceria; ao escrever copy de página de produto ou descrição de marketplace.

**Capacidade:** roteiro de TikTok/Reels (hook + desenvolvimento + CTA); copy de produto (headline, benefícios, provas sociais); calendário de conteúdo semanal; briefing de colaboração; adaptação de posicionamento Dunford para linguagem leiga.

**Âncora:** os outputs do pricing-strategist (posicionamento Dunford) e do market-researcher (persona, demanda) alimentam este agente — ele não pesquisa, transforma.

**Tools:** Read, Write (sem Bash/WebSearch — é redação, não pesquisa).

**Modelo:** sonnet (escrita criativa + estrutura; não precisa de Opus).

**Restrição:** não inventar claims sobre o produto (ex.: "reduz tempo de estudo em 40%") sem evidência; sempre checar com o dossiê antes de afirmar benefício mensurável.

---

### Proposto (avaliar em 30d)

### Skill 3 — `dossi-navigator` (PRIORIDADE BAIXA — avaliar em 30 dias)

**Justificativa:** O dossiê tem 10 deliverables + modelos .xlsx + research/evidence com múltiplos arquivos. Encontrar "onde está o número de CAC mais atualizado" ou "qual é a última versão da análise de sensibilidade" consome tempo de contexto. Uma skill de navegação (índice vivo + busca semântica por slug) pode resolver isso com custo baixo.

**Quando invocar:** ao iniciar sessão em que precisar localizar número específico sem saber em qual arquivo está; ao auditar consistência antes de business-validator.

**Capacidade:** busca por número/conceito em `deliverables/`, `research/`, `models/`; retorna localização + trecho + data da última atualização.

**Tools:** Read, Grep, Glob.

**Modelo:** haiku (tarefa mecânica de busca + indexação).

**Decisão recomendada:** implementar apenas se o business-validator reportar inconsistências frequentes por "número não encontrado" nas próximas 4 semanas. Caso contrário, o Grep direto é suficiente.

---

## (d) Melhorias na Tabela de Agentes do CLAUDE.md

A tabela atual no CLAUDE.md é funcional mas incompleta — lista apenas "quando acionar" sem capturar os encadeamentos entre agentes. Proposta de substituição:

### Tabela atual (para referência)

| Agente | Quando acionar |
|---|---|
| `market-researcher` | mercado (TAM/SAM/SOM), concorrência, demanda, taxas |
| `pricing-strategist` | preço, posicionamento (Dunford), oferta/SKU |
| `sourcing-analyst` | gráfica BR × China, NCM, landed cost, RFQ, QA |
| `financial-modeler` | unit economics, viabilidade, sensibilidade, rebuild do `.xlsx` |
| `business-validator` | **antes de dar algo por pronto** — checagem adversarial cruzada |

### Tabela proposta (substitui a acima)

| Agente | Quando acionar | Output típico | Encadeia com |
|---|---|---|---|
| `market-researcher` | Precisar de número de mercado datado (TAM/SAM/SOM); mapear concorrente; sinal de demanda; taxas marketplace | `research/evidence/<tema>.md` | → pricing-strategist, financial-modeler |
| `pricing-strategist` | Mudar preço, SKU ou bundle; recalcular margem por canal; posicionamento Dunford; ancoragem de oferta | Tabela Dunford + recomendação de preço | ← market-researcher → financial-modeler |
| `sourcing-analyst` | Novo fornecedor; confirmar NCM/alíquota; calcular landed cost; preparar RFQ; cronograma de produção | Tabela de decisão + landed cost | → financial-modeler (via Workflow PSF) |
| `financial-modeler` | Qualquer número-âncora mudou; rebuild .xlsx; análise de sensibilidade; cenários | Laudo + .xlsx em `models/` | ← pricing/sourcing → business-validator → doc-updater |
| `business-validator` | **SEMPRE** antes de marcar entregável pronto; após mudança em número do CLAUDE.md | Laudo CRÍTICO/ALTO/MÉDIO/BAIXO + veredito | ← financial-modeler → doc-updater |
| `doc-updater` | Após business-validator aprovar mudança de número-âncora; propagação para deliverables e CLAUDE.md | Diff de alterações para revisão humana | ← business-validator |
| `conteudo-mayara` | Preparar lançamento; roteiros TikTok/Reels; copy de produto; calendário de conteúdo; briefing de parceria | Roteiro / copy / calendário pronto para uso | ← pricing-strategist (posicionamento) |

---

## Melhorias pontuais nos agentes existentes

### business-validator
- Adicionar output obrigatório em formato de tabela de premissas: `Premissa | Evidência | Contra-argumento | Severidade | Teste mais barato` (hoje o output é narrativo — difícil de rastrear).
- Adicionar checagem explícita: "todos os números batem com a tabela Fatos-âncora do CLAUDE.md?" — deve ser o primeiro passo, não o implícito.
- `tools`: remover `Write` do frontmatter (o validador não deve alterar arquivos; só relatar). Manter `Read, Grep, Glob, Bash, WebSearch, WebFetch`.

### financial-modeler
- Adicionar `model: inherit` já está correto. Confirmar que Bash é usado para cálculos Python (uv run --with openpyxl) — atualmente OK.
- Adicionar à description: "Invoke after sourcing-analyst OR pricing-strategist deliver new numbers, and always before business-validator runs."

### market-researcher
- Remover `Write` e `Edit` do frontmatter — o agente escreve em `research/evidence/`, mas idealmente via `Write` (já tem). `Edit` não é necessário se ele sempre gera arquivos novos com data no nome.
- Adicionar rotina de proxy (Google Trends via WebSearch) como passo 0 antes de dimensionar SAM.

### pricing-strategist
- Sem `Bash` atualmente — correto (não precisa de execução). Confirmar que não tem acesso a `Write` desnecessário para arquivos fora de `research/`.
- Adicionar à description: "Invoke before any pricing decision AND after market-researcher delivers TAM/SAM/SOM evidence."

### sourcing-analyst
- Adicionar `model: sonnet` está correto. Confirmar que o cálculo de landed cost usa `Bash + Python (uv)` — já especificado no body do agente.
- Adicionar checklist de AQL no output padrão (já documentado em `.claude/tooling-research/dominio.md`, mas não está no system prompt do agente).

---

## Síntese de implementação (por prioridade)

| Ação | Prioridade | Esforço | Impacto |
|---|---|---|---|
| `doc-updater` criado (jun/2026) | — implementado — | — | Elimina inconsistências entre deliverables |
| Implementar Workflow PSF (fan-out sourcing+pricing → financial) | Alta | Nenhum (é protocolo) | Reduz latência em 50% ao mudar número |
| Implementar Workflow VAP como regra inviolável | Alta | Nenhum (é protocolo) | Previne deliverables com erro |
| Atualizar tabela de agentes no CLAUDE.md | Média | Baixo | Melhora acionamento proativo |
| Corrigir `tools` do business-validator (remover Write) | Média | Mínimo | Princípio do menor privilégio |
| `conteudo-mayara` criado (jun/2026) | — implementado — | — | Suporta motor de aquisição |
| Adicionar output tabular ao business-validator | Média | Médio (editar system prompt) | Rastreabilidade de premissas |
| Criar hook Stop sugerindo business-validator | Baixa | Baixo | Boa prática de orquestração |
| Criar `dossi-navigator` | Baixa (avaliar em 30d) | Médio | Só se inconsistências forem frequentes |

---

## Diagrama de orquestração completo

```
ENTRADA (dado novo / decisão / deliverable)
    │
    ├── É dado de MERCADO? ──────────────────────→ market-researcher
    │                                                    ↓
    ├── É decisão de PREÇO/SKU? ──→ pricing-strategist ←┘
    │                                    ↓
    ├── É decisão de SOURCING? ──→ sourcing-analyst
    │                               ↓         ↓
    │                          [fan-in → financial-modeler (Opus)]
    │                                    ↓
    ├── É deliverable pronto? ──→ business-validator (SEMPRE)
    │                                    ↓
    │                          [CRÍTICO → PARAR]
    │                          [ALTO/MÉDIO/BAIXO → doc-updater]
    │                                    ↓
    ├── É conteúdo/copy? ──────→ conteudo-mayara (← posicionamento Dunford)
    │
    └── É página de DESIGN? ──→ planner-designer (SKILL, decide)
                                        ↓
                               typst-planner (SKILL, executa)
                                        ↓
                               [PNG QA → finalize.py → PDF/X gráfica]
```

---

*Fontes: `.claude/tooling-research/meta.md` (orquestração), `.claude/tooling-research/dominio.md` (rigor por agente), `CLAUDE.md` (fatos-âncora), `.claude/agents/*.md` (system prompts), `.claude/skills/*/SKILL.md`. Câmbio R$5,20 (jun/2026). Revisão recomendada: business-validator antes de implementar.*
