# Estado & retomada — Planner Concurseiro

**20/jun/2026.** Compactação para **retomar exatamente no ponto: construir o protótipo print-ready do
Planner v1** (e, em seguida, a tarefa Tier-1). Leia este doc + os linkados e siga.

## Projeto em 30s
Venture D2C "Planners" (Daniel = estratégia/ops · Mayara = aquisição/conteúdo, **storytelling viral em
vídeo IA no TikTok**). Produto em foco: **Concurseiro** — não é agenda nem caderno: é um **sistema de
estudo / "hub analógico"** que mantém o concurseiro focado (sem celular) e **dá liga** com o digital
(Anki, QConcursos, cursinho) **sem replicá-lo nem colidir** (cursinhos já entregam edital
verticalizado/cronograma baratos).

## Decisões TRAVADAS
- **Arquitetura:** ecossistema modular (módulos independentes + complementares). **v1 = o PLANNER**
  (módulo-âncora) com **seção lite de diagnóstico de erro**. Caderno de Erros completo = módulo da F2.
- **Persona v1:** concurseiro **dedicação exclusiva** ("Rafael", 6–10 h/dia).
- **Validado com a Mayara** (19/jun).
- **Mayara NÃO faz design** (só conteúdo/vídeo-IA). Arte: **eu (programático)** no protótipo ·
  **freelancer** (Upwork-Leste-Europeu ~R$ 800–1,8k OU Fiverr-Bangladesh ~R$ 400–800, com golden
  sample) no comercial. → **furo no RACI do dossiê a reconciliar.**
- Roadmap: F0 pesquisa ✅ · **F1 = Planner v1** · F2 ecossistema · F3 foto→app.

## Fatos-âncora
- Preço **R$ 119** · custo/un alvo **R$ 45–55**. Físico: **A5 (148×210)** · papel **Pólen Bold 90 g
  creme** (fallback Soft 80 g; F2 = Munken) · capa **couché 300 g + laminação fosca** (firme, não-dura)
  · **wire-o duplo** (lay-flat) · **perpétuo** (sem datas).
- Protótipo = **1 ciclo (~1 mês), ~71 pp (≈36 folhas)**; produção ~110–130 pp.
- ⚠️ **Flag:** `conceitos/financeiro-planner-v1.md` calculou MC mais estrita que o dossiê (R$ 55→44%
  vs "50%"). **Reconciliar a definição de MC** (business-validator) antes de mexer em âncora.

## As 5 páginas do v1 (estrutura travada) → mockups **v3**
1. **Diário de Foco** — time-log 3 blocos (manhã/tarde/noite, pintável) · STUDY · REVIEW · KPI do dia · reflexão.
2. **Semanal — Ciclo de Matérias** — comprometer/adaptar o ciclo do cursinho · metas por volume · rotação (10–14 matérias).
3. **Bússola da Jornada** (frontmatter) — objetivo · mapa do edital (14 linhas) · meu stack · calendário de provas · balanço mensal (KPIs).
4. **Pontes Digitais** — transcrever sinal-chave do digital + refletir.
5. **Diagnóstico de Erro (lite)** — origem (livro/pág/nº ou site/id) · triagem · "o que eu pensei" · raciocínio correto · gatilho→ação · revisão D+1/7/15/30.
Mockups: `mockups/p*-v3.{html,pdf,png}` + `shared-v3.css`. **Pendência:** "ainda feio" — refino é o alvo do **Tier-1**.

## PONTO DE RETOMADA (executar)
**Construir o protótipo print-ready do Planner v1 (1 ciclo), eu mesmo (R$ 0)**, a partir dos mockups v3
→ PDF **A5 + sangria 3 mm**, pronto p/ impressão digital. **Ambição:** chegar o mais perto possível de
**Tier-1 profissional sem software pro** (ver `tier1-toolchain.md` + `tier1-priorart.md` + o ultraplan, em preparação).

## Pendências
1. **Protótipo print-ready** (eu) ← retomar aqui.
2. **Tier-1** (toolchain + qualidade sem InDesign/Affinity) — pesquisa rodando → ultraplan → build c/ loop de crítica.
3. Reescrever `briefing-mayara.md` → **brief de freelancer** + **brief de conteúdo/lançamento da Mayara**.
4. Reconciliar **RACI/MC** no dossiê (business-validator).
5. **Commit** dos novos arquivos (este doc, freelancers-pesquisa, tier1-*, etc.).

## Mapa de artefatos
`conceitos/` (método/definição/direção/roadmap/personas/teardowns/wireframes/protótipo/sourcing/financeiro) ·
`planner-v1/` (mockups · rfq-graficas · briefing-mayara · freelancers-pesquisa · este doc) ·
`caderno-de-erros/` (spec · wireframe-ficha · benchmark-{cn,kr,jp}) ·
`pesquisa/fontes/` (mercado/reviews/uso-*/manifests). Imagens de concorrentes em `pesquisa/capturas/` e
`caderno-de-erros/referencias/` (**gitignored**, re-baixáveis via manifests). Fotos do exemplar do Daniel: `referencias/*.jpeg` (commitadas).

## Git
Repo `fugisawa/projeto-planners` · branch **main** · último commit **7b53e28**. Commit/push só quando o Daniel pedir.
