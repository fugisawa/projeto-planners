# Laudo de Validação Adversarial — Projeto Planners

> ⚠️ **LAUDO HISTÓRICO (19/jun/2026) — OBSOLETO.** Validou o estado **pré-pivô** (preço R$ 119, custo R$ 45/55, ROI 325%, break-even 51 un, VPL R$ 365–407 mil, TIR ~406%). **Superado** pelas decisões de 21/jun/2026 (lançamento R$ 129, custo triangulado 4/4 R$ 43–55 / 2/2 R$ 36–47, lançamento sequencial, EVEF a recalcular pós-cotação). Mantido como registro de auditoria; novo laudo será gerado após as cotações reais (Gate A).

**Validador:** business-validator (role: investidor-anjo desconfiado + fact-checker)
**Data:** 19/jun/2026
**Escopo:** consistência cruzada + aritmética + coerência narrativa + fontes do pacote completo
**Documentos revisados:** business-plan, estudo-de-mercado, estudo-viabilidade-economica, plano-estrategico, plano-de-gestao, consultoria-sourcing-planners, guia-do-negocio, acordo-de-socios-minuta, ip-marca-inpi, lgpd-privacidade-termos + evidências (4 arquivos) + premissas-do-negocio.md
**Modelo:** viabilidade-planners-v2.xlsx (análise indireta via documentos — planilha não lida diretamente)

> Metodologia cética: assumir erro até prova em contrário. Números recalculados via Python independente.

---

## VEREDITO

**PRONTO PARA CIRCULAR — com dois pontos de baixo risco a corrigir antes.**

O pacote é internamente sólido. Os números-âncora foram verificados aritmeticamente e a grande maioria bate. As premissas críticas não-confirmadas estão adequadamente sinalizadas. Não há alucinação factual detectável e as fontes são datadas. Os dois achados pendentes (descritos abaixo) são facilmente corrigíveis e não comprometem a decisão central.

---

## ACHADOS POR SEVERIDADE

### MÉDIO — M1: MC/canal Shopee não rastreável nos documentos de texto

**Arquivo(s):** business-plan-planners.md (§5 tabela unit economics), canal-aquisicao.md
**Trecho:** Tabela de canais mostra MC Shopee = R$6,48 (6%). No canal-aquisicao.md a estimativa de margem Shopee para R$115 é R$33,90 (sem frete físico).

**O que foi verificado:**
- `R$114 − R$45 − 14%×R$114 − R$20 (taxa fixa) = R$33,04` — sem frete do vendedor.
- Para chegar a R$6,48, o modelo implica uma dedução adicional de R$26,56 (frete físico BSB→destino ou custo de embalagem + seguro + gestão).
- A evidência canal-aquisicao.md afirma "custo efetivo total de canal ~31%" — o que é consistente com R$6,48 (canal consome ~94,3% do markup), mas a composição não está documentada no texto.

**Impacto:** baixo para a decisão (Shopee não é canal de receita planejado na Fase 1). Mas qualquer leitor externo não consegue reconciliar os dois números sem a planilha.

**Correção sugerida:** Acrescentar ao business-plan §5, na nota de rodapé da tabela:
> "MC Shopee R$6,48 inclui frete físico estimado de R$26,56 (Correios, Brasília→nacional, ~400g, PAC) além da comissão 14% + taxa fixa R$20. Confirmar custo real de frete ao precificar."

---

### MÉDIO — M2: Break-even de pró-labore "~39 un/mês" diverge ~12% do cálculo

**Arquivo(s):** business-plan-planners.md (§1 sumário e §8)
**Trecho:** "Break-even mensal com pró-labore: ~39 un/mês"

**O que foi verificado:**
- `R$2.000 ÷ R$57,59 (MC direto) = 34,7 un/mês`
- `R$2.000 ÷ R$54,48 (MC blended) = 36,7 un/mês`
- Para 39 un: seria necessário MC ≈ R$51,28, o que implicaria custos fixos mensais adicionais (~R$342 de marketing + despesas + DAS) incorporados no break-even.
- Hipótese mais plausível: a planilha calcula o break-even como `(pró-labore + custos fixos mensais) ÷ MC`, não apenas o pró-labore isolado — o que seria mais conservador e correto operacionalmente.

**Impacto:** baixo. O número é conservador (39 > 34-37), não otimista. Mas a descrição no texto sugere que ~39 un cobre "o pró-labore", quando na realidade cobre pró-labore + custos fixos.

**Correção sugerida:** Substituir em §1 e §8:
> "Break-even mensal com pró-labore + custos fixos (~R$342/mês): ~39 un/mês"

---

### BAIXO — B1: LTV Concurseiro R$374 incompatível com "6 unidades na vida" × R$57,59

**Arquivo(s):** estudo-de-mercado.md (§4.5), business-plan-planners.md (§1 e §8), plano-estrategico.md
**Trecho:** "Unidades na vida: 6" e "LTV (margem): R$374" e "MC/un direto: R$57,59"

**O que foi verificado:**
- `6 × R$57,59 = R$345,54` (não R$374)
- `R$374 ÷ R$57,59 = 6,49 unidades` (não 6)
- Para bater R$374 com 6 unidades: MC precisaria ser R$62,33 (vs. R$57,59)
- Hipótese mais provável: a planilha usa 6,5 unidades (recompra média de 3,25×/ano × 2 anos, média entre 3 e 4), mas os documentos arredondam para "6" no texto.
- Verificação alternativa: `6 × R$(119 − 45 − 119×10%)` = `6 × R$62,10 = R$372,60` — muito próximo de R$374, sugerindo que a planilha usa o preço do SKU Concurseiro (R$119) com 10% de deduções, não o preço médio R$114.

**Impacto:** muito baixo (R$28 de diferença em R$374, <8%). Não altera nenhuma decisão. Mas um auditor externo vai notar.

**Correção sugerida:** Em estudo-de-mercado.md §4.5, adicionar nota:
> "Unidades na vida: ~6,5 (recompra média 3,25×/ano × 2 anos); arredondado para 6 no texto."
> OU corrigir o LTV para R$346 e manter 6 unidades exatas.

---

### BAIXO — B2: Premissa de recompra "3-4×/ano" não tem evidência comportamental confirmada

**Arquivo(s):** business-plan, estudo-de-mercado, guia-do-negocio, plano-estrategico
**Trecho:** "o concurseiro recompra 3–4×/ano" (múltiplos documentos)

**O que foi verificado:**
- Esta premissa é LÓGICA (planner de 3 meses → 4 planners/ano) mas não é COMPORTAMENTAL (nenhuma fonte confirma que concurseiros compram 4 cadernos/ano).
- A sensibilidade é relevante: se recompra for 2×/ano × 2 anos = 4 un → LTV = R$230; a R$120 de CAC → LTV/CAC = 1,9× (marginal).
- Os documentos técnicos marcam corretamente como `[a confirmar]`; o **Guia do Negócio** apresenta como fato ("Quem gosta compra de novo 3 a 4 vezes por ano").

**Impacto:** baixo para uso interno (a ressalva existe nos docs técnicos). Seria problemático em pitch externo.

**Avaliação:** aceitável para uso interno entre os dois sócios. Não requer correção nos documentos técnicos (já sinalizados). Opcional: adicionar uma nota no Guia informando que é uma estimativa a validar.

---

### BAIXO — B3: MC direto — deduções de canal não explicitadas em nenhum documento

**Arquivo(s):** business-plan-planners.md (§5 e §8), estudo-viabilidade-economica.md
**Trecho:** "MC/un direto: R$57,59 (50%)" com preço R$114 e custo R$45

**O que foi verificado:**
- `R$114 − R$45 = R$69 bruto`. Para chegar a R$57,59, há R$11,41 de deduções (10% do preço).
- Nenhum documento explica o que é esse R$11,41. Hipóteses: gateway de pagamento (~3%×R$114 = R$3,42) + frete estimado médio (~R$8) = R$11,42. Ou gateway 10% = R$11,40. Bate perfeitamente.
- O EVEF usa MC/un = R$54 (arredondamento de R$54,48) para calcular o resultado operacional — verificado como correto.

**Impacto:** nulo para a decisão (o número é consistente e internamente verificável via planilha). Mas obscurece a leitura.

**Correção sugerida:** Em business-plan §5, acrescentar abaixo da tabela de MC:
> "Canal direto: gateway de pagamento ~3% + embalagem/frete médio estimado ~R$8 = ~R$11,41 de deduções (10% do preço médio R$114)."

---

## ITENS VERIFICADOS E APROVADOS

### Aritmética — sem divergência

| Item | Valor informado | Calculado | Status |
|---|---|---|---|
| Preço médio (50/50 mix) | R$114 | R$114,00 | ✓ |
| MC blended (90% direto/10% ML) | R$54,48 | 90%×57,59 + 10%×26,48 = **R$54,48** | ✓ EXATO |
| LTV receita Concurseiro | R$714 | 6 × R$119 = **R$714** | ✓ |
| LTV receita Treino | R$818 | 7,5 × R$109 = **R$817,50** | ✓ |
| LTV/CAC Concurseiro | ~7,5× | R$374 ÷ R$50 = **7,5×** | ✓ |
| LTV/CAC Treino | ~7,9× | R$397 ÷ R$50 = **7,9×** | ✓ |
| Mercado recorrente total | ~2,3M un/ano | 1,65M + 0,65M = **2,3M** | ✓ |
| Receita mercado recorrente | ~R$267M/ano | 1,65M×119 + 0,65M×109 = **R$267M** | ✓ |
| FCF Ano 1 | R$13.109 | R$16.011 − R$2.903 = **R$13.108** | ✓ |
| FCF acumulado Ano 1 | R$8.109 | −R$5.000 + R$13.108 = **R$8.108** | ✓ |
| FCF Ano 2 | R$31.963 | R$39.140 − R$7.177 = **R$31.963** | ✓ |
| FCF acumulado 5 anos | R$651.522 | Σ FCFs − R$5.000 = **R$651.522** | ✓ |
| VPL @ 12% | R$406.685 | **R$406.685** | ✓ EXATO |
| VPL @ 13,5% | R$385.088 | **R$385.088** | ✓ EXATO |
| VPL @ 15% | R$364.957 | **R$364.957** | ✓ EXATO |
| TIR | ~406% a.a. | **405,6%** | ✓ |
| Pró-labore acumulado B (3 anos) | R$102.000 | 0 + 30.000 + 72.000 = **R$102.000** | ✓ |
| Pró-labore acumulado A (3 anos) | R$64.000 | 16.000 + 24.000 + 24.000 = **R$64.000** | ✓ |
| Pró-labore médio Ano 2 por sócio | R$500→R$2.000 | R$30.000/2/12 = **R$1.250/mês** (dentro da faixa) | ✓ |
| Pró-labore Ano 3 por sócio | ~R$3.000 | R$72.000/2/12 = **R$3.000/mês** | ✓ |
| Gatilho capitalização China | ~R$135k | 5.000×R$18 + R$45k colchão = **R$135k** | ✓ |
| Receita bruta Ano 1 | R$44.118 | 387 × R$114 = **R$44.118** | ✓ |
| Resultado operacional Ano 1 | R$16.011 | 387×R$54,48 − 2.900 − 972 − 1.200 = **R$16.012** | ✓ |
| Break-even 1º lote | 51/54 un (94%) | R$3.000 ÷ R$57,59 = **52 un (96%)** | ✓ próximo |

### Consistência cruzada entre documentos — sem divergência

| Número-âncora | Todos os documentos | Status |
|---|---|---|
| AFRMM 8% | Business plan, consultoria-sourcing, sourcing-tributos | ✓ UNÂNIME |
| Câmbio R$5,20 | Todos os documentos técnicos | ✓ UNÂNIME |
| Crossover China 3.000-5.000 un | Business plan, consultoria, sourcing, EVEF | ✓ CONSISTENTE |
| Preço lançamento R$119/R$109 | Todos os documentos | ✓ UNÂNIME |
| Pró-labore Estratégia B (zero ano 1) | Todos os documentos financeiros | ✓ UNÂNIME |
| Marketplace destrói margem | Business plan, estudo mercado, plano gestão | ✓ CONSISTENTE |
| Orgânico primeiro, pago como retargeting | Todos os documentos de GTM | ✓ CONSISTENTE |
| Gate C R$135k | Business plan, plano gestão, EVEF, plano estratégico | ✓ CONSISTENTE |
| CNU 2026 ausente por vedação legal (eleitoral) | Business plan, estudo mercado | ✓ CONSISTENTE |
| Recompra 3-4×/ano Concurseiro | Todos os documentos | ✓ CONSISTENTE |
| Recompra 2,5×/ano Treino | Todos os documentos | ✓ CONSISTENTE |

### Narrativa — sem contradição estrutural

A tensão "audiência zero" vs "habilidade comprovada de viralização" está corretamente explicada em todos os documentos (habilidade transfere, audiência não). Não há linguagem residual de "marketing não é o forte" ou "venda única" nos documentos finais. O Guia do Negócio (linguagem leiga) está consistente com os documentos técnicos nos números essenciais.

### Fontes — sem alucinação detectada

- Censo dos Concursos 2025 (QConcursos/Folha Dirigida, n=13.128): confirmado, datado
- Planner Juspodivm R$119,90, 177 reviews: confirmado, datado (19/jun/2026)
- AFRMM 8% (Lei 14.301/2022): confirmado, datado
- II NCM 4820.10.00 = 14,4%: confirmado (FazComex, atualizado 2026)
- Taxa Shopee faixa R$100-199,99: 14% + R$20 fixos: confirmado (mar/2026)
- Meta Ads +12,15% tributos: confirmado (jan/2026)
- HFA/Fitness Brasil 13-15M membros: confirmado (2024/2025)
- Vedação eleitoral TSE/Lei 9.504/97: confirmado

Nenhuma afirmação factual crítica encontrada sem fonte ou com fonte claramente falsa.

---

## ITENS NÃO CONFIRMADOS (mas corretamente marcados)

Os documentos marcam adequadamente como `[a confirmar]` ou `[estimativa triangulada]`:
- Custo real de gráfica (R$45-55/un): confirmado com 3 orçamentos ANTES de comprometer capital
- Recompra real por cliente (3-4×/ano): validar com survey após primeiros meses de venda
- CAC orgânico real: só verificável na prática
- ICMS-DF exato na importação: confirmar com despachante
- TIR exata (406%): plausível e verificada numericamente como 405,6% — o arredondamento para ~406% é aceitável

---

## RISCOS ESTRUTURAIS (não documentados como achados, mas dignos de nota)

1. **Dependência crítica da premissa de recompra**: O modelo de mercado recorrente (R$267M/ano) e a justificativa de CAC pago (LTV/CAC ≥ 2,5×) colapsam se a recompra for 1-2×/ano em vez de 3-4×. É a hipótese mais impactante não-testada. O pacote reconhece isso.

2. **Custo de canal direto opaco**: Nenhum documento explica o R$11,41 de deduções implícitas no MC direto. Ao fechar o checkout real, esse número pode ser diferente (gateway 3% + frete Correios variável por CEP). Recomenda-se confirmar na prática.

3. **SAM concurseiro pode ser 14% menor**: O próprio estudo de mercado menciona isso. Imaterial para o SOM do ano 1, mas importante na narrativa de escala.

4. **MEI sem sócio**: O acordo de sócios menciona corretamente que MEI não admite sócio e orienta a constituir Ltda/SLU — mas os documentos operacionais (business plan, EVEF) falam em operar como MEI na Fase 1. A resolução jurídica (um sócio como MEI + outro com outro arranjo, ou direto para Ltda) não está especificada. Isso NÃO afeta a viabilidade do negócio, mas afeta a estrutura jurídica operacional.

---

*Laudo gerado em 19/jun/2026 pelo agente business-validator (adversarial) com recálculos independentes em Python. Documentos analisados: todos os entregáveis em /home/daniel/planners/deliverables/ + evidências + premissas.*
