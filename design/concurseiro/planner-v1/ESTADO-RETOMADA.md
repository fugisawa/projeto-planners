# Estado & retomada — Planner Concurseiro

**20/jun/2026.** Estado vivo. **As 6 páginas no padrão 2.0 PRO** (5 módulos + Guia de uso/contracapa),
print-ready (CMYK/PDF-X). **Próximo: teste de impressão (Gate A) + reconciliar RACI/MC.** Mapa: [`README.md`](README.md).

## Projeto em 30s
Venture D2C "Planners" (Daniel = estratégia/ops · Mayara = aquisição/conteúdo, storytelling viral em
vídeo IA no TikTok). Produto: **Concurseiro** — **sistema de estudo / hub analógico** (não agenda),
focado, sem celular, que dá liga com o digital (Anki/QConcursos/cursinho) sem replicá-lo nem colidir.

## Decisões TRAVADAS
- **Arquitetura:** ecossistema modular. **v1 = o PLANNER** **SEM ficha** (só ponteiro → Caderno de Erros); **Caderno de Erros standalone = F2** (lançamento sequencial) `[Daniel · 21/jun/2026]`.
- **Persona v1:** concurseiro dedicação exclusiva ("Rafael"). **Validado com a Mayara** (19/jun).
- **Mayara NÃO faz design** (só conteúdo/vídeo-IA). Arte: **eu (Typst)** no protótipo · freelancer p/
  acabamento premium (Upwork-Leste-Europeu ~R$800–1,8k ou Fiverr-BD ~R$400–800, golden sample). → furo no RACI a reconciliar.
- **Tema = 2.0 PRO (blend JP/KR):** Lato + **figuras tabulares**; título Lato **Black azul-ardósia
  (`title-c`) + tab de acento + eyebrow**; **CANTOS RETOS** (só círculos redondos); cor **quieta** (a
  cor é do marca-texto); time-log com **hierarquia de fios**; listas de escrita estilo **INDIGO**
  (`studyrows`: matéria │ divisória vertical │ pauta │ ○). Codificado nos skills **`planner-designer`**
  + **`typst-planner`** e em `conceitos/sintese-design-refinada.md` (seção "2.0 PRO"). **Fonte de
  verdade = `typst/*.typ`** (Diário = referência canônica).
- Roadmap: F0 ✅ · **F1 = Planner v1** · F2 ecossistema · F3 foto→app.

## Fatos-âncora
Preço **R$129** `[Daniel · 21/jun/2026]` · custo/un alvo **~R$60 pré-RFQ** `[estimativa pré-RFQ · 21/jun/2026]` (ref. histórica: protótipo 71 pp era R$45–55). Físico: A5 (148×210) · papel Pólen Bold 90g creme · capa
couché 300g fosca · wire-o duplo · perpétuo · **~112 pp, sem ficha**. Protótipo = 1 ciclo (~72pp). ⚠️ **Flag:** `conceitos/financeiro-planner-v1.md`
calculou MC mais estrita — **reconciliar MC** `[a recalcular pós-cotação · 21/jun/2026]` (business-validator) antes de mexer em âncora.

## PADRÃO 2.0 (checklist — aplicar em toda página; referência = Diário)
- Título azul-ardósia + tab + eyebrow (`masthead`); seção forte = `sechead`; **página sem título grande usa `softhead` (discreto)**.
- **Tudo reto** (cells/chips/checkboxes/faixas); só círculos redondos.
- Listas matéria+conteúdo = **INDIGO** (`studyrows`: coluna+divisória+pauta+○); senão, ruled limpo.
- **Linhas de preenchimento na BASE do texto** (`align: bottom`) — nunca no meio.
- **Alinhamento:** divisórias/colunas de seções irmãs alinham; faixa **largura cheia** quando precisa alinhar com conteúdo fora dela.
- **Figuras tabulares**; cor quieta; 1 acento/página; `fill:none` em grade/checklist.
- Campos com **espaço real de escrita** (nem faltar nem sobrar); ≤4 linhas de reflexão.
- Compilar → **olhar o PNG** → iterar até **1 página A5**.

## FEITO (2.0)
- ✅ **Padronização das 4** (Semanal/Bússola/Pontes/Ficha) ao 2.0 — linhas sólidas, base, faixas largura cheia.
- ✅ **Guia de uso / contracapa** (`guia.typ`) — onboarding (5 módulos) + legenda do time-log ("10 min") + símbolos (BuJo) + dicionário de cor + revisão espaçada. **Entra na FRENTE do booklet.**
- ✅ **Booklet = 6 páginas** (guia+bussola+semanal+diario+pontes+ficha) em `planner-proto-pdfx1a.pdf` (CMYK/PDF-X-1a/FOGRA39).

## PONTO DE RETOMADA
1. **Teste de impressão real** (Gate A: + 3 orçamentos via `rfq-graficas.md`) — provar CMYK/papel/wire-o numa gráfica.
2. **Reconciliar RACI/MC** no dossiê (`business-validator`) — flag da MC `[a recalcular pós-cotação · 21/jun/2026]`.
3. (Opcional) **freelancer** p/ acabamento premium (`freelancers-pesquisa.md`) — vira polimento, não criação.

## Como gerar
`cd typst && uv run --with typst python render.py <pagina>` · `uv run --with pypdf python finalize.py`.
Detalhe: `README.md` + skill `typst-planner`.

## Git
Repo `fugisawa/projeto-planners` · branch **main** · último commit: ver `git log`. Commit/push só quando o Daniel pedir.
