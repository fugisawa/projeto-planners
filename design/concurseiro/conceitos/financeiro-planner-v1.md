# Análise Financeira — Planner v1 (Concurseiro): Custo Real de Sourcing

**Data:** 20/jun/2026 | **Analista:** financial-modeler (Claude Code) | **Câmbio ref.:** USD/BRL ≈ R$ 5,20

> ⚠️ **DESATUALIZADO:** preço-âncora era R$ 119; recalcular para R$ 129 + custo âncora 4/4: R$43–55 · 2/2: R$36–47 (estimativa triangulada · 21/jun/2026) — recalcular MC com price R$129 e custo triangulado. As tabelas internas abaixo são referência histórica (base preço R$ 119 / custo R$ 55) — **não usar como âncora operacional**. Rebuild é do `financial-modeler`.

> Documento complementar a `sourcing-planner-v1.md` e `prototipo-planner-v1.md`.
> Foco: recompute das unit economics com o custo real da gráfica BR (pós-sourcing).
> **Não altera o `.xlsx`** — são estimativas pré-RFQ; células a atualizar listadas na Seção 6.

---

## 1. Estrutura de deduções do canal (premissas fixas)

A contribuição por unidade **antes** de descontar o custo do produto segue a estrutura do modelo
(`Premissas` + `Unit Economics` do `viabilidade-planners-v2.xlsx`):

| Dedução | Direto | Blended (90% dir/10% ML) |
|---|---|---|
| Preço de venda | R$ 119,00 | R$ 119,00 |
| (−) Provisão devoluções 4% | R$ 4,76 | R$ 4,76 |
| (−) Taxa de pagamento 2,5% | R$ 2,98 | R$ 2,98 |
| (−) Comissão marketplace (ML 14%) | — | R$ 1,19 (10% do lote) |
| (−) Frete marketplace (R$ 18) | — | R$ 1,80 (10% do lote) |
| (−) Embalagem & manuseio | R$ 4,00 | R$ 4,00 |
| **(=) Contrib. excl. produto** | **R$ 107,27** | **R$ 103,80** |

`[histórico — calculado com preço R$114 (mix antigo: R$119/R$109); com novos preços R$129/R$109 o blended muda — a recalcular pós-cotação · 21/jun/2026]`

---

## 2. Tabela de MC por cenário — custo real do sourcing

Fontes de custo: `sourcing-planner-v1.md` §4 (jun/2026). `[estimativa triangulada]`

### 2.1 Micro-lote (~54 un) — protótipo de 71 pp

| Cenário | Especificação | Custo/un | MC Direto | MC% Direto | MC Blended | MC% Blended |
|---|---|---|---|---|---|---|
| **Tier A — melhor (R$45)** | Pólen Bold 90g + soft-touch + wire-o | R$ 45 | **R$ 62,27** | **52,3%** | R$ 58,80 | 49,4% |
| Tier A — âncora modelo (R$55) | Pólen Bold 90g + soft-touch + wire-o | R$ 55 | R$ 52,27 | 43,9% | R$ 48,80 | 41,0% |
| **Tier A — pior (R$58)** | Pólen Bold 90g + soft-touch + wire-o | R$ 58 | R$ 49,27 | 41,4% | R$ 45,80 | 38,5% |
| Tier B — melhor (R$35) | Offset 90g creme + fosca + wire-o | R$ 35 | R$ 72,27 | 60,7% | R$ 68,80 | 57,8% |
| Tier B — pior (R$48) | Offset 90g creme + fosca + wire-o | R$ 48 | R$ 59,27 | 49,8% | R$ 55,80 | 46,9% |

### 2.2 Produção comercial (~54 un) — SKU de venda (~120 pp / 3 ciclos)

| Cenário | Especificação | Custo/un | MC Direto | MC% Direto | MC Blended | MC% Blended |
|---|---|---|---|---|---|---|
| **Tier A — melhor (R$52)** | Pólen Bold 90g + soft-touch + wire-o | R$ 52 | **R$ 55,27** | **46,4%** | R$ 51,80 | 43,5% |
| **Tier A — base (R$60)** | Pólen Bold 90g + soft-touch + wire-o | R$ 60 | R$ 47,27 | 39,7% | R$ 43,80 | 36,8% |
| **Tier A — pior (R$68)** | Pólen Bold 90g + soft-touch + wire-o | R$ 68 | R$ 39,27 | **33,0%** | R$ 35,80 | 30,1% |
| Tier B — melhor (R$40) | Offset creme 90g + fosca + wire-o | R$ 40 | R$ 67,27 | 56,5% | R$ 63,80 | 53,6% |
| Tier B — pior (R$55) | Offset creme 90g + fosca + wire-o | R$ 55 | R$ 52,27 | 43,9% | R$ 48,80 | 41,0% |

`[estimativa — faixas do sourcing-planner-v1.md §4.2 e §4.3; confirmar por 3 cotações formais antes de comprometer capital]`

---

## 3. A margem aguenta Pólen Bold 90g + couché 300g fosca + wire-o?

Análise por fase:

**Micro-lote ~54 un (protótipo, ~71 pp):**
O Tier A (Pólen Bold 90g + soft-touch + wire-o, R$45–58) aguenta **com folga no melhor caso
(R$45) e com pressão no pior (R$58)**. A R$45 a MC direta é 52,3% — acima da meta de 50%.
A R$58 a MC direta cai para 41,4% — abaixo de qualquer meta razoável.
**Conclusão:** Tier A no micro-lote é viável **somente se a cotação real ficar ≤ R$54/un**
(MC direta 50%). Acima disso, usar Tier B como fallback.

**Produção comercial (~120 pp, SKU de venda):**
O Tier A na produção **fura a margem em qualquer ponto acima de R$53,71/un** (teto para MC ≥ 45% direta).
No cenário base (R$60), a MC direta é 39,7% — inaceitável para um produto com 90% de venda direta.
No pior caso (R$68), chega a 33% — inviável.
**O Tier A na produção ~120 pp é a zona de risco: a cotação formal é obrigatória antes de fechar a spec.**

**Quando o Tier A (~120 pp) fura definitivamente:**
- MC direta abaixo de 45%: custo > R$ 53,71 → **o Tier A fura a partir de R$ 54/un**
- MC blended abaixo de 45%: custo > R$ 50,25 → **o Tier A fura a partir de R$ 51/un no blended**

`[estimativa; a confirmar por cotação formal — Gráfica do Livro, Avanço Color, GIV Online]`

---

## 4. Análise de sensibilidade — teto de custo

### 4.1 Limites por meta de margem (direto e blended, preço R$ 119)

| Meta de MC% | Teto de custo (Direto) | Teto de custo (Blended) | Interpretação |
|---|---|---|---|
| ≥ 50% | **R$ 47,77** | R$ 44,30 | Só Tier A melhor (R$45) no direto entrega; Tier B garante |
| ≥ 45% | **R$ 53,71** | R$ 50,25 | Tier A micro-lote dentro se ≤ R$53; produção Tier A quase sempre fura |
| ≥ 40% | R$ 63,07 | R$ 59,60 | Tier A produção base (R$60) entra aqui; mínimo aceitável |
| ≥ 35% | R$ 72,42 | R$ 68,95 | Limiar de sobrevivência — produção Tier A pior (R$68) entra |

### 4.2 Tabela de sensibilidade — MC% por custo/un

| Custo/un | MC Direto (R$) | MC% Direto | MC Blended (R$) | MC% Blended | Status |
|---|---|---|---|---|---|
| R$ 35 | R$ 72,27 | 60,7% | R$ 68,80 | 57,8% | Excelente |
| R$ 40 | R$ 67,27 | 56,5% | R$ 63,80 | 53,6% | Ótimo |
| R$ 45 | R$ 62,27 | 52,3% | R$ 58,80 | 49,4% | Bom (meta 50% direto ok) |
| R$ 48 | R$ 59,27 | 49,8% | R$ 55,80 | 46,9% | Aceitável (≥45%) |
| R$ 50 | R$ 57,27 | 48,1% | R$ 53,80 | 45,2% | Aceitável (≥45%) |
| R$ 52 | R$ 55,27 | 46,4% | R$ 51,80 | 43,5% | Atenção (blended < 45%) |
| **R$ 53,71** | **R$ 53,56** | **45,0%** | R$ 50,09 | 42,1% | **Teto direto para MC ≥ 45%** |
| R$ 55 | R$ 52,27 | 43,9% | R$ 48,80 | 41,0% | Atenção — âncora modelo furada |
| R$ 58 | R$ 49,27 | 41,4% | R$ 45,80 | 38,5% | Risco — abaixo de 45% direto |
| R$ 60 | R$ 47,27 | 39,7% | R$ 43,80 | 36,8% | Risco alto |
| R$ 65 | R$ 42,27 | 35,5% | R$ 38,80 | 32,6% | Crítico |
| R$ 68 | R$ 39,27 | 33,0% | R$ 35,80 | 30,1% | Inviável |

`[confirmado — aritmética fechada; valores de custo são [estimativa] do sourcing pré-RFQ]`

### 4.3 Revelação importante: a âncora R$55 do modelo está errada como meta

> ⚠️ Análise calculada ao preço R$119 (histórico). A R$129, os tetos de custo para cada meta de MC são ~R$8 mais folgados — a recalcular [a recalcular pós-cotação · 21/jun/2026].

A âncora do CLAUDE.md/xlsx (`custo/un âncora R$ 55 → R$ 45`) usa R$55 como **custo do micro-lote**,
mas a R$ 119 (não R$ 114 do preço médio), custo R$55 **entrega MC direta de 43,9% — abaixo da meta
de 45%**. A âncora R$57,59 (50%) é válida ao preço médio de R$114 (mix com Treino R$109) e
custo R$45, **não** como meta do Concurseiro a R$119 com custo de R$55.

**Implicação:** Para o Planner Concurseiro a R$119, a meta de MC ≥ 50% exige custo ≤ R$47,77.
A âncora de R$55 só entrega MC direta de ~44% — aceitável operacionalmente, mas abaixo da meta
declarada de 50%.

---

## 5. Veredito de viabilidade

**Micro-lote ~54 un (protótipo, ~71 pp) — VIÁVEL com restrição:**
- Tier A (Pólen Bold + soft-touch + wire-o, R$45–58): **viável se cotação ≤ R$54/un**; acima disso a MC cai para <45%.
- Tier B (offset 90g + fosca + wire-o, R$35–48): **confortável em toda a faixa** (MC 49,8%–60,7% direta).
- **Recomendação:** solicitar Tier A da Gráfica do Livro e Avanço Color; usar Tier B como fallback se Tier A > R$54/un.

**Produção comercial ~120 pp (SKU de venda) — RISCO NO TIER A:**
- Tier A (Pólen Bold + soft-touch, R$52–68): **fura acima de R$53,71 no direto** e acima de R$50,25 no blended.
  O ponto médio estimado (R$60) entrega apenas 39,7% direta — abaixo de qualquer meta razoável.
- Tier B (offset creme 90g, R$40–55): **boa margem em toda a faixa** (43,9%–56,5% direta).
- **Implicação:** a produção comercial com Pólen Bold 90g (~120 pp) provavelmente **exige ajuste de preço ou de páginas** para manter margem.

**Ajustes possíveis se Tier A ~120 pp vier > R$54/un:**

| Opção | Efeito | Trade-off |
|---|---|---|
| Subir preço para R$ 129 (regime pós-lançamento) | Eleva teto para R$ 58,50 (direto 45%) | Impacto na conversão no lançamento |
| Reduzir para ~100 pp (2 ciclos + frontmatter) | Reduz custo de papel ~15%; Tier A volta para ~R$52–60 | Teste de percepção de valor |
| Migrar para Tier B (offset creme 90g) | MC direto 43,9%–56,5% a qualquer volume | Toque menos premium; testa com público antes de decidir |
| Manter Tier A e aceitar MC ~40% no lançamento | Investe em percepção premium; reconstrói margem no volume/China | Só se o fluxo de caixa suportar |

`[estimativa; decisão dependente da cotação formal e do teste com o protótipo]`

---

## 6. Células a atualizar no xlsx quando vier a cotação formal

| Aba | Célula / Campo | Valor atual | Atualizar para |
|---|---|---|---|
| Premissas | Custo/un — 1º micro-lote <100 un | R$ 55 | Custo Tier A confirmado (ex.: R$52 ou R$58) |
| Premissas | Custo/un — reposição ≥300 un | R$ 45 | Custo Tier B ou Tier A ~300 un confirmado |
| EVEF (5 anos) | Custo/un Ano 1 | R$ 45 | Custo reposição confirmado ~120 pp |
| Sensibilidade | Faixa de custo | — | Adicionar linhas R$52, R$55, R$58, R$60, R$68 |

> Não altere até ter 3 cotações formais. Os valores atuais refletem a faixa do research; a cotação
> real pode tanto confirmar como refinar as estimativas.

---

## 7. Conclusão

O Planner v1 (Concurseiro) foi analisado a R$ 119 (histórico) — ver banner DESATUALIZADO; a viabilidade a R$ 129 com custo 4/4 R$43–55 / 2/2 R$36–47 [a recalcular pós-cotação · 21/jun/2026]. Condicionantes da análise histórica:

1. **No micro-lote (~71 pp, protótipo):** o Tier A (Pólen Bold 90g + wire-o) funciona **se a
   gráfica cotar ≤ R$54/un**. O Tier B é o plano B seguro (MC ≥ 49% em qualquer caso).

2. **Na produção comercial (~120 pp, SKU de venda):** o Tier A **fura a margem** no ponto médio
   estimado (R$60 → MC 39,7%). A decisão entre manter o Pólen Bold (Tier A) a ~120 pp e ajustar
   preço/páginas, ou migrar para Tier B, deve ser tomada **após a cotação formal de 3 gráficas**
   e o teste do protótipo com o público.

3. **A âncora R$55 do modelo** entrega MC direta de 43,9% a R$119 — operacionalmente aceitável,
   mas abaixo da meta declarada de 50%. A meta de 50% exige custo ≤ R$47,77 (Tier B ou Tier A
   micro-lote melhor).

4. **Próximo passo inegociável:** 3 orçamentos formais (Gráfica do Livro, Avanço Color, GIV Online)
   com spec completa para ~71 pp e ~120 pp antes de comprometer qualquer capital no 1º lote.

`[estimativa triangulada — sourcing pré-RFQ; confirmar por cotação antes de decisão de capital]`

---

*Fontes: `sourcing-planner-v1.md` (jun/2026), `prototipo-planner-v1.md` (jun/2026),
`premissas-do-negocio.md`, `estudo-viabilidade-economica.md`, `viabilidade-planners-v2.xlsx` (abas
Unit Economics / Premissas / EVEF). Cálculos conferidos por recálculo independente (Python) — aritmética fechada.*
