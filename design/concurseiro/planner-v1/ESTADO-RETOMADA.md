# Estado & retomada — Planner Concurseiro

**20/jun/2026.** Estado vivo para retomar o trabalho. **Protótipo Tier-1 das 5 páginas já construído**
(Typst, print-ready). Mapa do diretório + como gerar: [`README.md`](README.md).

## Projeto em 30s
Venture D2C "Planners" (Daniel = estratégia/ops · Mayara = aquisição/conteúdo, **storytelling viral em
vídeo IA no TikTok**). Produto em foco: **Concurseiro** — não é agenda nem caderno: é um **sistema de
estudo / "hub analógico"** que mantém o concurseiro focado (sem celular) e **dá liga** com o digital
(Anki, QConcursos, cursinho) **sem replicá-lo nem colidir**.

## Decisões TRAVADAS
- **Arquitetura:** ecossistema modular. **v1 = o PLANNER** (com diagnóstico de erro *lite*). Caderno de Erros completo = F2.
- **Persona v1:** concurseiro **dedicação exclusiva** ("Rafael", 6–10 h/dia). **Validado com a Mayara** (19/jun).
- **Mayara NÃO faz design** (só conteúdo/vídeo-IA). Arte: **eu (programático/Typst)** no protótipo ·
  **freelancer** (Upwork-Leste-Europeu ~R$ 800–1,8k OU Fiverr-Bangladesh ~R$ 400–800, com golden sample)
  p/ acabamento premium. → **furo no RACI do dossiê a reconciliar.**
- **Tema visual:** planner de estudo coreano — **Lato**, grade azul-clara suave, cantos arredondados,
  impressão sóbria (a cor vem do marca-texto). Skills: `typst-planner` + `planner-designer`.
- Roadmap: F0 pesquisa ✅ · **F1 = Planner v1** · F2 ecossistema · F3 foto→app.

## Fatos-âncora
- Preço **R$ 119** · custo/un alvo **R$ 45–55**. Físico: **A5 (148×210)** · papel **Pólen Bold 90 g
  creme** (fallback Soft 80 g; F2 = Munken) · capa **couché 300 g + laminação fosca** · **wire-o duplo**
  · **perpétuo**. Protótipo = **1 ciclo (~72 pp)**; produção ~110–130 pp.
- ⚠️ **Flag:** `conceitos/financeiro-planner-v1.md` calculou MC mais estrita que o dossiê (R$ 55→44% vs
  "50%"). **Reconciliar a definição de MC** (business-validator) antes de mexer em âncora.

## As 5 páginas (construídas em `typst/`)
1. **Diário** — time-log 3 blocos (6×10 min contíguos) · Estudar/Revisar (chip+linha) · Sessões · "Hoje·".
2. **Semanal** — metas por matéria (chip+volume) · rotação M1–M4×dias · Ajuste & reflexão · → Migrar.
3. **Bússola** (frontmatter) — objetivo · "por que" (4 linhas) · mapa do edital (chip+peso+progresso) · stack · calendário · balanço mensal.
4. **Pontes Digitais** — banco de questões · Anki · aulas · simulados · Ajuste de Rota.
5. **Diagnóstico de Erro (lite)** — origem · **"o que eu pensei" ANTES** · triagem/causa · raciocínio · gatilho→ação · D+1/7/15/30.
> Fonte: `typst/*.typ`; saída: `typst/planner-proto-pdfx1a.pdf` (CMYK · PDF/X-1a · FOGRA39). Spec: `typst/INSTRUCOES-PAGINAS.md`. Design: `../conceitos/sintese-design-refinada.md`.

## PONTO DE RETOMADA
Protótipo Tier-1 **construído e print-ready**. Próximos passos:
1. **Micro-polish** das 5 páginas (rodar `render.py`, olhar PNGs, ajustar).
2. **Página de onboarding/contracapa** — key de símbolos BuJo + legenda "10 min" (que saiu do corpo do Diário).
3. **Teste de impressão real** (Gate A: + 3 orçamentos via `rfq-graficas.md`).
4. Reconciliar **RACI/MC** no dossiê (business-validator).
5. (Opcional) **freelancer** p/ acabamento premium (ver `freelancers-pesquisa.md`) — vira polimento, não criação.

## Como gerar
`cd typst && uv run --with typst python render.py <pagina>` (1 página → PDF+PNG) ·
`uv run --with pypdf python finalize.py` (merge 5 → PDF/X-1a CMYK). Detalhe no `README.md` + skill `typst-planner`.

## Git
Repo `fugisawa/projeto-planners` · branch **main**. Commit/push só quando o Daniel pedir. Imagens de
concorrentes (`pesquisa/capturas/`, `caderno-de-erros/referencias/`) gitignored; intermediários `typst/*.pdf` (menos o proto) gitignored.
