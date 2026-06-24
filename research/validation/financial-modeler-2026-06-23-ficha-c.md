# Laudo financial-modeler — impacto da Ficha C no custo/un (23/jun/2026)

**Agente:** `financial-modeler` · **Escopo:** delta de custo/un e âncora de paginação ao adicionar a
**Ficha C / Integração** (página periódica) ao planner-v3. Sem rebuild do `.xlsx` (aguarda RFQ).
**Premissas declaradas:** custo/pp = midpoint da faixa triangulada ÷ 112 pp (linear = **teto conservador**;
em offset o marginal é menor, podendo ser ~0 se não cruzar salto de caderno de 4/8 pp). Miolo = 55% do
custo total `[est. · a confirmar RFQ]`. Base: 4/4 R$ 49 / 2/2 R$ 41,50 (midpoints).

## Cenários de cópias da Ficha C

| Cenário | Cópias | Total pp | Δ pp | Δ % | Δ custo 4/4 | Δ custo 2/2 | "~inalterado" (≤4%)? |
|---|---|---|---|---|---|---|---|
| Base | 0 | 112 | — | — | — | — | — |
| A | 6 | 118 | +6 | +5,4% | +R$ 1,45 (~3,0%) | +R$ 1,22 | ✅ sim |
| **B (recomendado)** | **8** | **120** | **+8** | **+7,1%** | **+R$ 1,93 (~3,9%)** | **+R$ 1,63** | ✅ marginal |
| C | 12 | 124 | +12 | +10,7% | +R$ 2,89 (~5,9%) | +R$ 2,45 | ❌ não |

## MC/un a R$ 129 (contrib. antes de COGS = R$ 116,62)

| Cenário | COGS 4/4 | CM1% 4/4 | COGS 2/2 | CM1% 2/2 |
|---|---|---|---|---|
| Base (112 pp) | R$ 49,00 | 52,4% | R$ 41,50 | 58,2% |
| **B (120 pp)** | R$ 50,93 | **50,9%** | R$ 43,13 | **57,0%** |
| C (124 pp) | R$ 51,89 | 50,2% | R$ 43,95 | 56,3% |

**Ressalva do VAP de homologação:** nos cenários mediano/otimista a MC permanece nas faixas-âncora
(48–58% / 55–62%); no **pior caso** (COGS no teto + 8 cópias) a CM1 cai a **~46% (4/4) · ~53% (2/2)** —
ligeiramente abaixo do piso. Registrado na âncora do CLAUDE.md como faixa condicional.

## Conclusões
1. **Recomendado: 8 cópias → âncora "~120 pp"** (cadência ~1 Ficha C por ciclo; ~8 ciclos em 3 meses).
2. **"~inalterado" vale para 6–8 cópias, não para 12.** Delta absolvível dentro da incerteza pré-RFQ.
3. **Imaterial ao EVEF:** ~0,4–1,0 pp de TIR, ~R$ 3–5 mil de VPL (5 anos) — dominado por CAC blended e recompra. O rebuild do `.xlsx` deve usar o COGS da cotação real com ~120 pp, não as faixas trianguladas.
4. **Propagação:** CLAUDE.md atualizado para ~120 pp (23/jun); os 6 deliverables aguardam a recalibração pós-cotação já pendente (não regenerar 6 PDFs por número provisório).
