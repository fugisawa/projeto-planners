# Laudo de validação — limpeza de consistência do dossiê (pós-pivô 21/jun/2026)

**Data:** 21/jun/2026 · **Validador:** `business-validator` (adversarial, read-only) + varredura programática + recomputação independente.
**Escopo:** reconciliação em massa de TODO o dossiê às decisões travadas de 21/jun/2026 (63 arquivos).
**Veredito final (pós-correções): ✅ PRONTO** — com **uma pendência única e conhecida**: rebuild
financeiro pós-cotação (ver §4). Substitui os laudos de 19/jun (marcados HISTÓRICOS/OBSOLETOS).

## 1. O que foi reconciliado
Âncoras travadas propagadas/consistentes em todo o dossiê: lançamento **sequencial** (F1 = só
Concurseiro; Treino e Caderno de Erros = F2); preço lançamento **R$ 129** (regime ~R$ 139);
**SEM pré-venda / SEM aporte/empréstimo**; custo micro-lote **4/4 R$ 43–55 · 2/2 R$ 36–47**
`[estimativa triangulada]`; v1 **SEM ficha** (ponteiro → Caderno de Erros); beachhead/F1 = o
**Planner Concurseiro** (não o Caderno); tema **2.0 PRO** (cantos retos, dot-grid abandonado).

## 2. Abordagem por tipo de documento
- **Deliverables financeiros pré-pivô** (business-plan, estudo-viabilidade, estudo-de-mercado,
  plano-estrategico, plano-de-gestao, consultoria-sourcing, guia-do-negocio.html): **banner**
  "baseline pré-pivô / a recalcular pós-cotação" no topo + correção estratégica não-numérica. As
  **tabelas numéricas do corpo são baseline** — o rebuild é do `financial-modeler` pós-cotação
  (não se inventou número).
- **Laudos de validação 19/jun:** banner HISTÓRICO/OBSOLETO; corpo preservado (registro de auditoria).
- **Evidência (research/evidence):** notas datadas de atualização; evidência histórica preservada.
- **Docs vivos** (CLAUDE.md, README, docs/, design/, .claude/agents, .claude/skills,
  .claude/tooling-research): **consertados integralmente** às âncoras.

## 3. Achados do validador — todos endereçados
| # | Sev | Achado | Resolução |
|---|---|---|---|
| 1 | ALTO | MC% âncora "irreproduzível" a partir de custo+preço | **Não era erro** — é **contribuição líquida do cascade do canal direto** (devoluções 4% + pagamento 2,5% + embalagem R$ 4 → contrib. ~R$ 116,61). Recomputado: 4/4 ~48–57%, 2/2 ~54–62% ✓. **Rotulado** em CLAUDE.md (sem recalcular). |
| 2 | ALTO | R$ 119 como preço **operativo** (Decision Log D2; business-plan Rec 5) | D2 → R$ 129 (revisada); Rec 5 → R$ 129 + nota; §5 ganhou callout DESATUALIZADO. |
| 3 | MÉD | ESTADO-RETOMADA lista "ficha" sem caveat | Adicionado "(artefato de protótipo — v1 sem ficha; F2)". |
| 4 | MÉD | financial-modeler: lote calc. sobre R$ 5.000 (não R$ 3.000 de material) | Corrigido para verba de material ~R$ 3.000 → ~61 un. |
| 5 | MÉD | charter "2 SKUs" sem qualificar F1/F2 | Corrigido para "Concurseiro F1; Treino F2 (sequencial)". |
| 6 | MÉD | LGPD: cláusula de pré-venda no corpo publicável | Neutralizada (item 6 = "sem pré-venda"; cláusula movida p/ comentário inativo). |
| 7 | BAIXO | consultoria-sourcing: pré-venda "caso a caso" | Trocado por "decisão travada: SEM pré-venda". |
| 8 | BAIXO | mercado-demanda: conclusão liderava com R$ 119 | Invertido — R$ 129 primário. |

## 4. Pendência única (gated em ação externa)
**Rebuild financeiro pós-cotação** (Gate A = 3 orçamentos reais via `rfq-graficas.md`): refazer
`models/viabilidade-planners-v2.xlsx` + EVEF/VPL/TIR/break-even/MC blended + os corpos numéricos dos
deliverables pré-pivô, a **R$ 129 + custo real**. Executores: `financial-modeler` → `doc-updater` →
`business-validator`. Até lá, todos esses números estão **marcados** `[a recalcular pós-cotação]` —
nenhum é apresentado como fechado.

## 5. Conformidade com convenções
✅ Nenhum número inventado (todo derivado tem fonte+data ou tag `[a recalcular]`). ✅ `sources/`
intacto. ✅ Nenhum binário alterado. ✅ Datas absolutas. ✅ Typst recompila (Diário OK, 1 página).
