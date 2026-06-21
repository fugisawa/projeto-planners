# Estado & retomada — Planner Concurseiro

**20/jun/2026.** Estado vivo. **Diário elevado ao padrão 2.0 PRO (página-herói, validado pelo Daniel).**
**Tarefa atual: padronizar as outras 4 páginas ao padrão 2.0 do Diário.** Mapa: [`README.md`](README.md).

## Projeto em 30s
Venture D2C "Planners" (Daniel = estratégia/ops · Mayara = aquisição/conteúdo, storytelling viral em
vídeo IA no TikTok). Produto: **Concurseiro** — **sistema de estudo / hub analógico** (não agenda),
focado, sem celular, que dá liga com o digital (Anki/QConcursos/cursinho) sem replicá-lo nem colidir.

## Decisões TRAVADAS
- **Arquitetura:** ecossistema modular. **v1 = o PLANNER** (com diagnóstico de erro *lite*). Caderno de Erros = F2.
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
Preço **R$119** · custo/un alvo **R$45–55**. Físico: A5 (148×210) · papel Pólen Bold 90g creme · capa
couché 300g fosca · wire-o duplo · perpétuo. Protótipo = 1 ciclo (~72pp). ⚠️ **Flag:** `conceitos/financeiro-planner-v1.md`
calculou MC mais estrita (R$55→44% vs "50%") — **reconciliar MC** (business-validator) antes de mexer em âncora.

## PADRÃO 2.0 (checklist — aplicar em toda página; referência = Diário)
- Título azul-ardósia + tab + eyebrow (`masthead`); seção forte = `sechead`; **página sem título grande usa `softhead` (discreto)**.
- **Tudo reto** (cells/chips/checkboxes/faixas); só círculos redondos.
- Listas matéria+conteúdo = **INDIGO** (`studyrows`: coluna+divisória+pauta+○); senão, ruled limpo.
- **Linhas de preenchimento na BASE do texto** (`align: bottom`) — nunca no meio.
- **Alinhamento:** divisórias/colunas de seções irmãs alinham; faixa **largura cheia** quando precisa alinhar com conteúdo fora dela.
- **Figuras tabulares**; cor quieta; 1 acento/página; `fill:none` em grade/checklist.
- Campos com **espaço real de escrita** (nem faltar nem sobrar); ≤4 linhas de reflexão.
- Compilar → **olhar o PNG** → iterar até **1 página A5**.

## PONTO DE RETOMADA — padronizar as 4 ao 2.0 (Diário = referência)
- **Semanal** — totais/linha de semana na base; "Ajuste & reflexão" + "→ Migrar" ruled limpos; metas/rotação no módulo.
- **Bússola** — "objetivo"/"por que" + reflexões com linha na base; calendário e mapa-do-edital alinhados; balanço.
- **Pontes** — TODOS os campos (Banco/Anki/Aulas/Simulados) com linha na **base**; "Ajuste de Rota" faixa reta.
- **Ficha** — origem / "o que pensei" / "raciocínio" como pauta na base; card já reto; checar densidade.
- Depois: `finalize.py` → re-gerar `planner-proto-pdfx1a.pdf` + commitar.

## Pendências (pós-padronização)
Onboarding/contracapa (key de símbolos + legenda "10 min") · teste de impressão (Gate A + 3 orçamentos
via `rfq-graficas.md`) · reconciliar RACI/MC (business-validator) · (opcional) freelancer p/ acabamento.

## Como gerar
`cd typst && uv run --with typst python render.py <pagina>` · `uv run --with pypdf python finalize.py`.
Detalhe: `README.md` + skill `typst-planner`.

## Git
Repo `fugisawa/projeto-planners` · branch **main** · último: **8d5e2e0**. Commit/push só quando o Daniel pedir.
