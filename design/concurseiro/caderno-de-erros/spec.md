# Caderno de Erros — especificação (v1)

Consolida [`../conceitos/metodo-hub-analogico.md`](../conceitos/metodo-hub-analogico.md) §6 + os
**3 benchmarks visuais** (`benchmark-china.md`, `benchmark-coreia.md`, `benchmark-japao.md`).
**19/jun/2026.** Confiança: `[confirmado]` (visto em ≥2 benchmarks) · `[proposta]` (a validar).

## 1. Conceito
Não é gabarito nem lista de questões erradas. É o **diagnóstico do raciocínio errado** + sua
conversão em **regra de ação**. Caderno **ativo** (processa), não **depósito passivo**.

## 2. O que os 3 benchmarks convergiram `[confirmado]`
Padrão universal CN (错题本) + KR (오답노트) + JP (解き直しノート):
- **"Raciocínio errado" ANTES da solução** — inegociável nos três.
- **Categorização da causa do erro** (taxonomia + cor; "3 canetas" canônicas: **preto = pergunta · azul = solução · vermelho = causa**).
- **Revisão espaçada** — nos benchmarks, embutida na ficha (Ebbinghaus ~1/7/14/30); **no nosso produto, delegada ao Anki/FSRS** — o papel decide *o quê* ankificar, o algoritmo agenda *quando* `[D1 · 23/jun/2026]`.
- **Gatilho → ação** ("quando ver X → fazer Y / cuidado com Z").
- **Triagem na entrada** (CN: só ponto-cego/armadilha/questão-modelo entram; descuido puro não).
- **Layout frente/verso** (JP) ativa o *testing effect* (recordar antes de ver o gabarito).
- **Campo "questão análoga"** (lacuna apontada em JP/CN) — refazer num problema parecido.
- Físico premium: **B5/A5 apaisado, dot grid, folha solta (活页)**.

## 3. Ficha — versão COMPLETA (módulo standalone, Fase 2) `[proposta]`
Layout em **2 colunas** (ou frente/verso para *testing effect*):
- **Cabeçalho:** data __ · matéria (cor) · fonte (banca/ano/assunto) · **confiança no erro (1–5)** (gatilho da hipercorreção: o erro confiante é prioridade) · ☐ triagem (ponto-cego / armadilha / questão-modelo).
- **Tipo de erro** (checkboxes — taxonomia **K/M/R/S/T**): ☐ **K** conhecimento/conceito ☐ **M** método/confusão de institutos ☐ **R** leitura do enunciado ☐ **S** execução/cálculo/desatenção ☐ **T** estratégia/tempo · + ☐ **pegadinha de banca** (transversal — categoria-chave BR).
- **"O que eu estava pensando" (raciocínio errado)** — bloco amplo, **ANTES** da solução.
- **Solução / raciocínio correto.**
- **Gatilho → Ação:** "quando ver __ → faço __ / cuidado com __".
- **Questão análoga** (refazer): referência + ☐ acertei.
- **Refiz fechado** (re-teste que bloqueia o retorno do erro — Metcalfe 2014): data __ · ○ acertei / ○ errei · ☐ dominado.
- **Ponte p/ revisão** (canto): `→ card no Anki ☐` — a temporização (ritmo D+3/D+7/D+15) é executada pelo FSRS, **não rastreada no papel**.

## 4. Nota sobre Planner v1 `[decisão · Daniel · 21/jun/2026]`
O Planner v1 **não inclui ficha de erro** — contém apenas um **ponteiro impresso** "→ Caderno de Erros" (seção lite foi descartada). A especificação completa deste documento é exclusivamente para o **módulo standalone (Fase 2)**.

## 5. Taxonomia de erro `[decidida · D2 · 23/jun/2026]`
**K** conhecimento/conceito · **M** método/confusão de institutos · **R** leitura do enunciado ·
**S** execução/cálculo/desatenção · **T** estratégia/tempo. **+ pegadinha de banca** (transversal —
categoria-chave BR). Permite customização. Os códigos K/M/R/S/T habilitam a **estatística mensal**
("onde mais caio?"). *(Alinhada ao modelo 错题本 do estudo de evidência, 23/jun/2026.)*

## 6. Não-colisão
Complementa **QConcursos/TEC** (dizem *o quê* você errou) e **Anki** (executa a revisão dos *fatos*).
A ficha processa o **porquê** e decide o que ankificar — **não loga toda questão**.

## 7. Físico
Papel **≥120 g** anti-traspasse · **dot grid** · **lay-flat** · **perpétuo**; (completa) **B5/A5
apaisado**, folha solta. Sistema de 3 cores de caneta (**preto = pergunta · azul = solução · vermelho = causa**) como convenção de uso.

## 8. Pendências
✅ Wireframe da ficha completa (standalone, Fase 2): `wireframe-ficha.md`. ⏳ Pendentes: taxonomia final · validar triagem/gatilho/revisão com usuários · custo/sourcing do standalone. [lite descartada — decisão Daniel 21/jun/2026]
