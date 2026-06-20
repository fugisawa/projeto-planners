# Meta: Best Practices — Subagentes, Skills & Orquestração Multi-Agente
**Data:** 20/jun/2026 | **Fontes trianguladas:** Anthropic Docs, PubNub, Hidekazu Konishi, alexop.dev, digitalapplied.com, wshobson/agents

---

## 1. Estrutura Ideal de um Subagente

### 1.1 Frontmatter (campos suportados)

```yaml
---
name: nome-do-agente          # kebab-case; único no projeto
description: |                # CAMPO MAIS CRÍTICO — ver 1.2
  Faz X. Invoke quando Y.
model: sonnet                 # haiku | sonnet | opus | fable | inherit
tools:                        # omitir = herda tudo (evitar)
  - Read
  - Bash
  - Edit
color: blue                   # vermelho p/ destrutivos, azul p/ analistas
maxTurns: 10                  # teto de ciclos autônomos
isolation: worktree           # git-isolated se alterar arquivos
memory: project               # user | project | local
---
```

Fontes: [hidekazu-konishi.com](https://hidekazu-konishi.com/entry/claude_code_subagents_and_orchestration_guide.html) · [pubnub.com](https://www.pubnub.com/blog/best-practices-for-claude-code-sub-agents/)

### 1.2 Campo `description` — princípios de disparo proativo

O campo `description` é o **filtro de delegação**: Claude lê nome + description de cada agente no startup (~100 tokens por agente) e decide quando invocar.

**Regras:**
- Escrever em **terceira pessoa** ("Reviews code…", não "I review…")
- Incluir **frases gatilho explícitas**: "Use when…", "Invoke after…", "Trigger when…"
- Ser específico sobre **escopo e saída esperada**: "Read-only; retorna relatório markdown"
- Evitar phrasing genérico: "code helper" → inútil; "security-focused code reviewer after any authentication change" → funciona

**Exemplo (bom):**
```
Reviews code for security vulnerabilities and quality. Use proactively after
any authentication, authorization, or database change. Returns a structured
markdown report with severity classifications.
```

**Exemplo (ruim):**
```
Helps with code review tasks.
```

Fontes: [platform.claude.com/docs/…/best-practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices) · [pubnub.com](https://www.pubnub.com/blog/best-practices-for-claude-code-sub-agents/)

### 1.3 System Prompt (corpo do agente)

- **Single responsibility**: um agente, uma tarefa, uma definição de "pronto"
- Embutir **Definition of Done** como checklist dentro do prompt
- Codificar explicitamente condições de **STOP and ask** (anti-runaway)
- Não explicar o que o modelo já sabe — ser conciso
- Especificar formato de output (markdown, JSON com schema, etc.)

### 1.4 Escopo de tools (princípio do menor privilégio)

| Tipo de agente | Tools recomendadas |
|---|---|
| Pesquisador/analista | Read, WebSearch, MCP tools de leitura |
| Revisor de código | Read (sem Write/Edit) |
| Implementador | Read, Edit, Write, Bash |
| Release/deploy | Apenas tools estritamente necessárias |

Omitir `tools` herda **tudo** — evitar. Sempre listar explicitamente.

### 1.5 Seleção de modelo (tiering por complexidade)

| Tier | Modelo | Quando usar |
|---|---|---|
| 0 | Fable 5 | Trabalho autônomo de longa duração |
| 1 | Opus | Arquitetura, segurança, revisão crítica, orquestração principal |
| 2 | inherit | Tarefas do domínio principal (backend, frontend, ML) |
| 3 | Sonnet | Docs, testes, debugging, subagentes padrão |
| 4 | Haiku | Ops rápidas, SEO, CI/CD, tarefas mecânicas de alto volume |

Fonte: [wshobson/agents](https://github.com/wshobson/agents) authoring.md

---

## 2. Estrutura Ideal de uma SKILL

### 2.1 Frontmatter obrigatório

```yaml
---
name: nome-da-skill           # max 64 chars; kebab-case; sem "anthropic"/"claude"
description: |                # max 1024 chars; terceira pessoa; sem XML tags
  Extrai texto de PDFs e preenche formulários. Use quando o usuário mencionar
  PDFs, extração de texto, formulários ou arquivos .pdf.
---
```

Regras de nome: apenas minúsculas, números e hífens.
Regra de description: incluir **o que faz** E **quando usar** (com termos-chave de trigger).

Fonte: [platform.claude.com/docs/…/best-practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)

### 2.2 Corpo do SKILL.md

- Manter **abaixo de 500 linhas** (hard limit Codex: 8 KB)
- Claude lê apenas quando a skill é relevante — investir em estrutura, não em verbosidade
- Usar **progressive disclosure**: SKILL.md como índice → arquivos separados carregados sob demanda
- Referências **no máximo 1 nível de profundidade** (SKILL.md → arquivo.md, nunca SKILL.md → a.md → b.md)

### 2.3 Padrão de progressive disclosure

```
minha-skill/
├── SKILL.md              # overview + quick-start + links para referências
├── referencias.md        # detalhes técnicos (carregado sob demanda)
├── exemplos.md           # input/output pairs (carregado sob demanda)
└── scripts/
    ├── processar.py      # executado, não lido no contexto
    └── validar.py
```

**Padrão 1 — Guia com links:**
SKILL.md traz quick-start; seções avançadas apontam para arquivos separados.

**Padrão 2 — Por domínio:**
Para skills com múltiplos domínios, um arquivo por domínio em `reference/`; só o relevante é carregado.

**Padrão 3 — Condicional:**
SKILL.md mostra o caminho feliz; casos especiais apontam para arquivos específicos.

### 2.4 Grau de liberdade (latitude x rigidez)

| Situação | Abordagem |
|---|---|
| Múltiplas abordagens válidas | Alta liberdade: prosa com heurísticas |
| Padrão preferido mas flexível | Média liberdade: pseudocódigo parametrizado |
| Operação frágil / crítica | Baixa liberdade: script exato, sem flags adicionais |

Analogia: ponte estreita (baixa liberdade) vs campo aberto (alta liberdade).

### 2.5 Outros princípios de qualidade

- **Um exemplo concreto > três parágrafos de explicação**
- **Passos numerados** para procedimentos (mais confiável que prosa não estruturada)
- **Evitar informação time-sensitive** (use seção "old patterns" para legado)
- **Terminologia consistente** — escolher um termo e mantê-lo em todo o arquivo
- **Referências a ferramentas MCP**: usar nome qualificado `ServidorMCP:nome_ferramenta`
- **Testar com todos os modelos alvo** — Haiku precisa de mais detalhe; Opus não precisa ser over-explicado
- **Audit mensal**: deletar skills não acionadas em 30 dias (todo skill carregado consome tokens)

### 2.6 Nomenclatura

Preferir **forma gerundiva**: `processing-pdfs`, `analyzing-spreadsheets`, `managing-databases`.
Alternativas: noun phrase (`pdf-processing`) ou action-oriented (`process-pdfs`).
Evitar: `helper`, `utils`, `tools`, `documents`, `data`.

Fonte: [platform.claude.com/docs/…/best-practices](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)

---

## 3. Padrões de Orquestração Multi-Agente

### 3.1 Os 5 padrões fundamentais

#### Padrão 1: Fan-Out → Reduce → Synthesize
```
Orquestrador recebe tarefa
    ↓
Dispara N subagentes em PARALELO
    ↓
Coleta todos os outputs (fan-in)
    ↓
Sintetiza resultado unificado
```
**Quando usar:** auditorias, pesquisa paralela em múltiplas fontes, review de múltiplos arquivos simultaneamente, varredura abrangente onde breadth > depth.
**Custo:** ~N× soma dos branches; latência = branch mais lento (não acumulada).
**Atenção:** branches que falham devem ter estratégia explícita de aggregação.

#### Padrão 2: Pipeline (Sequential Stages)
```
Input → Agente A → Agente B → Agente C → Output
```
**Quando usar:** cada estágio depende do anterior (research→draft→critique→revise), transforms ETL, compliance chains.
**Custo:** ~N× soma dos estágios; cria gargalo de latência.
**Anti-padrão:** output ruim no estágio 1 contamina toda a cadeia — adicionar validação por estágio.

#### Padrão 3: Supervisor + Delegação (Hierárquico) ⭐ *padrão default 2026*
```
Supervisor (Opus/Fable)
    ├── Especialista A (domínio X)
    ├── Especialista B (domínio Y)
    └── Especialista C (domínio Z)
```
**Quando usar:** tarefas cross-domain que requerem especialistas diferentes (coder + researcher + reviewer). Ponto de entrada padrão para a maioria dos workflows multi-agente.
**Restrição Claude Agent SDK:** subagentes não podem spawnar subagentes (1 nível de profundidade).
**Custo:** ~(N+1)× (subagentes + coordenador).

#### Padrão 4: Debate / Critique Adversarial
```
Gerador → Output preliminar
    ↓
N Críticos em PARALELO (lentes: segurança, correção, reprodutibilidade…)
    ↓
Juiz/árbitro → Veredito final
```
**Quando usar:** outputs de alto risco, decisões arquiteturais críticas, validação de código em produção. Usar quando os stakes justificam o custo.
**Custo:** ~1.2× (variante critique) a ~2.5× (variante council com juiz).
**Anti-padrão:** usar como quality booster padrão — custo não compensa para tarefas rotineiras.

#### Padrão 5: Loop-Until-Dry
```
Executar ciclo de descoberta
    ↓
Deduplicar contra tudo já *visto* (não só confirmado)
    ↓
Repetir até K rounds consecutivos sem novos achados
```
**Quando usar:** exploração iterativa (descoberta de bugs, análise de cobertura), tarefas onde o volume de achados é desconhecido a priori.
**Chave:** deduplicar contra histórico completo — evita findings rejeitados ressurgindo.

### 3.2 Como combinar padrões

**Arquitetura padrão de produção:**
1. **Supervisor** no topo
2. **Fan-out branches** para subtarefas genuinamente paralelas
3. **Pipeline** apenas dentro de branches com dependências sequenciais
4. **Debate/critique** para outputs de alto risco do supervisor
5. **Swarm** (50+ agentes dinâmicos) apenas para escala real — complexidade de infraestrutura elevada

### 3.3 Princípios arquiteturais

| Princípio | Implicação prática |
|---|---|
| **Orquestração determinista** | Fluxo de controle em código; só a execução de tarefas delega ao modelo |
| **Estrutura > contagem de agentes** | Padrões verify/judge geram mais confiança do que mais agentes |
| **Token economics** | Workflows justificados quando breadth/escala supera custo; single-agent para tarefas ordinárias |
| **Schema validation** | Forçar output estruturado com JSON schemas; agents retentam em mismatch |
| **Parallelismo é opt-in** | Claude é conservador por default — pedir explicitamente execução paralela |
| **Hard caps** | Implementar teto de turns por subagente (Claude Agent SDK: ~25 turns default) |

### 3.4 Padrões de handoff e visibilidade

- **Chain with hooks, not prompt glue**: usar eventos `SubagentStop` e `Stop` para capturar fim de execução
- **Hooks como código de produção**: versionar em `.claude/hooks/`, validar JSON, manter idempotentes
- **Artefatos persistentes**: queue files, working notes, ADRs — trilha auditável
- **Slugs únicos**: identificadores por feature ligam todos os artefatos de um workflow

---

## 4. Repositórios e Recursos

### 4.1 Coleções de agentes/skills para copiar

| Recurso | URL | O que copiar |
|---|---|---|
| **wshobson/agents** | https://github.com/wshobson/agents | 192 agentes, 156 skills, 84 plugins; tiering de modelo documentado; conventions em `docs/authoring.md` |
| **wshobson-agents (mirror)** | https://github.com/mvandermeulen/wshobson-agents | Fork com agents de produção adicionais |
| **awesome-claude-agents** | https://github.com/rahulvrane/awesome-claude-agents | Curadoria de subagentes para casos de uso específicos |
| **chusri/claude-code-agents** | https://github.com/chusri/claude-code-agents | Subagentes full-stack prontos para uso |
| **lst97/claude-code-sub-agents** | https://github.com/lst97/claude-code-sub-agents | Especialistas de desenvolvimento (frontend/backend/DevOps) |
| **Anthropic Skill Docs** | https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices | Fonte oficial: estrutura, progressive disclosure, checklist |

### 4.2 Recursos de orquestração

| Recurso | URL | O que copiar |
|---|---|---|
| **alexop.dev — Deterministic Orchestration** | https://alexop.dev/posts/claude-code-workflows-deterministic-orchestration/ | Implementação code-first dos 6 padrões; schema validation; fan-out com barrier vs pipeline |
| **digitalapplied.com — 5 Patterns** | https://www.digitalapplied.com/blog/multi-agent-orchestration-5-patterns-that-work | Comparativo de custo, failure modes e quando combinar padrões |
| **PubNub Part I** | https://www.pubnub.com/blog/best-practices-for-claude-code-sub-agents/ | System prompt design, HITL rules, tool scoping, handoff patterns |
| **PubNub Part II** | https://www.pubnub.com/blog/best-practices-claude-code-subagents-part-two-from-prompts-to-pipelines/ | Prompts → Pipelines; hooks como código de produção |

---

## 5. Melhorias Concretas Recomendadas para este Projeto

### 5.1 Agentes existentes (`.claude/agents/`)

**Ação imediata — descriptions para disparo proativo:**

Todos os agentes precisam que a `description` inclua frases gatilho explícitas ("Use when…", "Invoke after…"). Revisar cada um:

| Agente | Melhoria de description recomendada |
|---|---|
| `market-researcher` | Adicionar: "Use when validating TAM/SAM/SOM assumptions, researching competitors, or when market data needs triangulation from ≥2 sources." |
| `pricing-strategist` | Adicionar: "Invoke before finalizing any SKU, pricing tier, or positioning change. Use when anchor price, markdown depth, or channel margin changes." |
| `sourcing-analyst` | Adicionar: "Use when evaluating new suppliers, NCM classification questions arise, or landed cost assumptions need validation against real RFQs." |
| `financial-modeler` | Adicionar: "Invoke when any anchor number in CLAUDE.md changes, before rebuilding .xlsx, or when unit economics sensitivity needs recalculation." |
| `business-validator` | Adicionar: "Use BEFORE marking any deliverable complete. Invoke adversarially — goal is to find inconsistencies, not confirm." |

**Ação — `tools` explícito:**
Verificar se algum agente omite `tools` (herda tudo). `market-researcher` e `business-validator` devem ser **read-only** (sem Write/Edit). `financial-modeler` pode precisar de Bash para rodar scripts.

**Ação — `model` explícito:**
- `business-validator` e `financial-modeler`: `model: inherit` (já configurado para Opus via settings)
- `market-researcher`, `pricing-strategist`, `sourcing-analyst`: `model: sonnet` (suficiente para pesquisa)

### 5.2 Skills existentes

**Ação — audit de acionamento:**
Mapear quais skills foram ativadas nas últimas 4 semanas. Deletar ou arquivar as não usadas (todo skill carregado consome tokens no startup mesmo sem ser invocado).

**Ação — descriptions em terceira pessoa:**
Verificar se alguma skill usa "I can help you…" ou "You can use this…" — substituir por terceira pessoa.

**Ação — progressive disclosure:**
Skills com SKILL.md > 300 linhas devem ser refatoradas: criar `references/` com subdomínios e deixar SKILL.md como índice + quick-start.

### 5.3 Orquestração — padrão a adotar

Para tarefas complexas do projeto Planners, usar:

```
financial-modeler (Opus) — Supervisor
    ├── market-researcher (Sonnet) — pesquisa paralela
    ├── pricing-strategist (Sonnet) — validação de preço
    └── sourcing-analyst (Sonnet) — custo/landed
         ↓
business-validator (Opus) — Critique Adversarial do output
```

Este é o padrão **Supervisor + Fan-Out + Critique** — adequado para validação do modelo de negócio.

Para updates rotineiros (número único mudou → propagar): usar **Pipeline simples**:
```
financial-modeler → business-validator → doc-updater
```

### 5.4 Hooks de handoff

Implementar em `.claude/hooks/`:
- Hook `Stop`: ao finalizar tarefa com slug, imprimir sugestão do próximo agente ("Run `business-validator` on slug `X`")
- Manter hooks idempotentes e versionados no git

### 5.5 Checklist de qualidade antes de "pronto" para qualquer agente/skill

- [ ] `description` em terceira pessoa com "Use when…" explícito
- [ ] `tools` listados explicitamente (sem herança implícita)
- [ ] `model` definido (não deixar como default implícito)
- [ ] Definition of Done no system prompt
- [ ] Condições de STOP-and-ask codificadas
- [ ] SKILL.md < 500 linhas; referências 1 nível de profundidade
- [ ] Testado com Sonnet e Opus

---

## 6. Referências Consolidadas

- [Skill authoring best practices — Anthropic Docs](https://platform.claude.com/docs/en/agents-and-tools/agent-skills/best-practices)
- [wshobson/agents — Multi-harness plugin marketplace](https://github.com/wshobson/agents)
- [Claude Code Subagents — PubNub Part I](https://www.pubnub.com/blog/best-practices-for-claude-code-sub-agents/)
- [Claude Code Subagents — PubNub Part II](https://www.pubnub.com/blog/best-practices-claude-code-subagents-part-two-from-prompts-to-pipelines/)
- [Deterministic Orchestration — alexop.dev](https://alexop.dev/posts/claude-code-workflows-deterministic-orchestration/)
- [5 Orchestration Patterns — digitalapplied.com](https://www.digitalapplied.com/blog/multi-agent-orchestration-5-patterns-that-work)
- [Subagents Guide — hidekazu-konishi.com](https://hidekazu-konishi.com/entry/claude_code_subagents_and_orchestration_guide.html)
- [awesome-claude-agents — GitHub](https://github.com/rahulvrane/awesome-claude-agents)
- [chusri/claude-code-agents — GitHub](https://github.com/chusri/claude-code-agents)
