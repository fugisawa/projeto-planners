# Caderno de Erros — especificação (v1)

Consolida [`../conceitos/metodo-hub-analogico.md`](../conceitos/metodo-hub-analogico.md) §6 + os
**3 benchmarks visuais** (`benchmark-china.md`, `benchmark-coreia.md`, `benchmark-japao.md`).
**19/jun/2026.** Confiança: `[confirmado]` (visto em ≥2 benchmarks) · `[proposta]` (a validar).

> **✅ Reconciliado e aplicado `[23/jun/2026]`** (T2/T3/T5 abaixo) — fonte:
> [`../conceitos/reconciliacao-estudo-asia.md`](../conceitos/reconciliacao-estudo-asia.md); laudo VAP em
> `research/validation/validation-2026-06-23-reconciliacao-asia.md`. §3 e §5 já refletem: taxonomia
> **K/M/R/S/T + flag ⚑banca**, **confiança 1–5**, e revisão por **status + `→ Anki`** (timing do FSRS).

## 1. Conceito
Não é gabarito nem lista de questões erradas. É o **diagnóstico do raciocínio errado** + sua
conversão em **regra de ação**. Caderno **ativo** (processa), não **depósito passivo**.

## 2. O que os 3 benchmarks convergiram `[confirmado]`
Padrão universal CN (错题本) + KR (오답노트) + JP (解き直しノート):
- **"Raciocínio errado" ANTES da solução** — inegociável nos três.
- **Categorização da causa do erro** (taxonomia + cor; "3 canetas": preto = enunciado, azul = correto, vermelho = erro).
- **Revisão espaçada embutida na ficha** (Ebbinghaus ~1/7/14/30) — **sem depender de app**.
- **Gatilho → ação** ("quando ver X → fazer Y / cuidado com Z").
- **Triagem na entrada** (CN: só ponto-cego/armadilha/questão-modelo entram; descuido puro não).
- **Layout frente/verso** (JP) ativa o *testing effect* (recordar antes de ver o gabarito).
- **Campo "questão análoga"** (lacuna apontada em JP/CN) — refazer num problema parecido.
- Físico premium: **B5/A5 apaisado, dot grid, folha solta (活页)**.

## 3. Ficha — versão COMPLETA (módulo standalone, Fase 2) `[reconciliado · 23/jun/2026]`
Layout em **2 colunas** (ou frente/verso para *testing effect*):
- **Cabeçalho:** data __ · matéria (cor) · fonte (banca/ano/assunto) · ☐ triagem (ponto-cego / armadilha / questão-modelo) · **confiança no erro `|||||` (1–5)** — círculo no nº (o erro confiante é prioridade de revisita; hipercorreção, Butterfield & Metcalfe 2001).
- **Tipo de erro (K/M/R/S/T) + flag ⚑banca:** ☐ **K** conhecimento · ☐ **M** método/confusão de institutos · ☐ **R** raciocínio do enunciado · ☐ **S** execução *(diga onde travou — "desatenção" não é diagnóstico)* · ☐ **T** estratégia · ⚑ **armadilha de banca** (flag transversal). Cor por matéria; somar no mês para achar o padrão.
- **"O que eu estava pensando" (raciocínio errado)** — bloco amplo, **ANTES** da solução.
- **Solução / raciocínio correto** (com as próprias palavras — autoexplicação; copiar gabarito não internaliza).
- **Gatilho → Ação:** "quando ver __ → faço __ / cuidado com __".
- **Questão análoga** (refazer): referência + ☐ acertei.
- **Ciclo de revisão (status, não escada fixa):** `refiz fechado __ · ✓ acertou · ☐ dominado` + `→ Anki ☐ (agendado)`. O **timing é do FSRS/Anki**; o papel rastreia status. Re-fazer de **cabeça fechada** (re-teste bloqueia o retorno do erro — Metcalfe et al. 2014); acertou 2×→ dominado.

## 4. Nota sobre Planner v1 `[decisão · Daniel · 21/jun/2026]`
O Planner v1 **não inclui ficha de erro** — contém apenas um **ponteiro impresso** "→ Caderno de Erros" (seção lite foi descartada). A especificação completa deste documento é exclusivamente para o **módulo standalone (Fase 2)**.

## 5. Taxonomia de erro (canônica) `[reconciliado · 23/jun/2026 — validar com usuários]`
Espinha codificada **K/M/R/S/T** (do 错题本 — permite estatística mensal) **+ flag transversal ⚑banca**:
- **K** Conhecimento — lacuna conceitual / não sabia.
- **M** Método — confundi institutos / abordagem errada (discriminação; nó das pegadinhas).
- **R** Raciocínio do enunciado — li/interpretei errado.
- **S** Execução — aplicação/cálculo/passo (**exige dizer onde travou**; "desatenção" deixou de ser categoria — é um não-diagnóstico, evidência `[Forte]`).
- **T** esTratégia — tempo/ordem/chute/gestão de prova.
- **⚑ armadilha de banca** — flag ortogonal (não é 6ª causa): a pegadinha *causa* M/R/S. Cruzar a flag com a causa expõe o padrão FGV/CEBRASPE — o diferencial concurso.

(Cores por matéria, customizáveis. Migração desta taxonomia ao `wireframe-ficha.md` ocorre no build da Fase 2.)

## 6. Não-colisão
Complementa **QConcursos/TEC** (dizem *o quê* você errou) e **Anki** (executa a revisão dos *fatos*).
A ficha processa o **porquê** e decide o que ankificar — **não loga toda questão**.

## 7. Físico
Papel **≥120 g** anti-traspasse · **dot grid** · **lay-flat** · **perpétuo**; (completa) **B5/A5
apaisado**, folha solta. Sistema de 3 cores de caneta como convenção de uso.

## 8. Pendências
✅ Wireframe da ficha completa (standalone, Fase 2): `wireframe-ficha.md`. ⏳ Pendentes: taxonomia final · validar triagem/gatilho/revisão com usuários · custo/sourcing do standalone. [lite descartada — decisão Daniel 21/jun/2026]
