# Laudo de Validação Adversarial — PROJETO PLANNERS
**Validador:** business-validator  
**Data:** 19/jun/2026  
**Artefatos auditados:**
- `deliverables/business-plan-planners.md` (BP)
- `deliverables/consultoria-sourcing-planners.md` (CS)
- `models/viabilidade-planners-v2.xlsx` + `models/build_model.py` (MOD)
- `research/evidence/*.md` (EV)
- `docs/premissas-do-negocio.md` (PREM)

**Método:** leitura completa de todos os artefatos + recomputação independente via Python de todas as métricas-chave anunciadas. Cada achado tem localização precisa, evidência e correção.

---

## ACHADOS ORDENADOS POR SEVERIDADE

---

### MÉDIO-1 — ICMS na base do landed cost: inclusão discutível do despachante

**Arquivo + trecho:** `sourcing-tributos.md` §5.3 e `consultoria-sourcing-planners.md` §5, tabela de decomposição.

**Problema:** O cálculo do ICMS-DF "por dentro" inclui o custo de despachante/armazenagem (R$2.000) na base de cálculo:
`base_ICMS = CIF + II + IPI + PIS/COF + R$2.000 despacho → ICMS = base × 0,20 / (1 − 0,20) = R$7.299`

A inclusão do custo de despachante privado na base do ICMS é metodologicamente questionável. A legislação do ICMS na importação (art. 13 da LC 87/96) define a base como o valor aduaneiro acrescido dos tributos federais + AFRMM, não de despesas privadas como despachante. O cálculo correto sem despacho na base daria:
`ICMS = (CIF + II + IPI + PIS/COF) × 0,20 / 0,80 = R$6.799/un`

**Efeito numérico:** landed/un passa de R$36,83 (doc) para R$36,33 (sem despacho na base). Diferença de R$0,50/un. O múltiplo cai de 2,36× para 2,33×. Landed total do lote de 1.000 un: R$36.328 vs R$36.827 documentado.

**Impacto na decisão:** Imaterial — não altera a conclusão do crossover China ~3.000 un nem a recomendação. Porém, se o despachante for auditado pela Receita e o ICMS for recalculado sem essa base, o landed real é ~R$36,33 (ligeiramente melhor que o documentado).

**Correção sugerida:** Em `sourcing-tributos.md` §5.3, adicionar nota: "O custo de despachante (R$2.000) foi incluído na base do ICMS por conservadorismo — o cálculo estrito pela LC 87/96 daria ICMS de R$6.799 (landed R$36,33); confirmar tratamento com despachante aduaneiro". O número apresentado é **conservador**, não otimista — isso é positivo para a decisão.

---

### MÉDIO-2 — Shopee: potencial dupla contagem do frete R$18

**Arquivo + trecho:** `canal-aquisicao.md` §2: "Frete grátis: Compulsório desde março/2026 para todos os vendedores (o custo já está embutido na nova estrutura, sem cobrança separada dos 6% anteriores)." `build_model.py` linha 771: `frete_mkt = 18` aplicado igualmente a ML e Shopee.

**Problema:** A evidência descreve que na nova estrutura Shopee (mar/2026) o frete grátis "já está embutido na nova estrutura" — sugerindo que os 14% + R$20 fixo já absorvem o custo de frete logístico. Se isso for verdade, adicionar R$18 de frete_mkt separadamente é dupla contagem.

**Efeito numérico:** MC Shopee com dupla contagem = R$6,48. MC Shopee sem duplicidade (retirando R$18) = R$24,48. A diferença é R$18/un.

**Impacto na decisão:** A conclusão estratégica (não usar Shopee como canal de receita) permanece válida com ambas as versões. Mesmo R$24,48 de MC é inadequado para sustentar o negócio. O erro, se existir, torna o número mais pessimista que o real.

**Correção sugerida:** Em `consultoria-sourcing-planners.md` e BP §5, esclarecer: a Shopee embutiu o frete na comissão, mas o custo físico de envio existe e recai sobre o vendedor de alguma forma. Verificar no painel do vendedor Shopee se o frete é de fato subsidiado pela plataforma ou cobrado separadamente. Ajustar a tabela conforme apuração.

---

### MÉDIO-3 — Sumário executivo mistura dois instrumentos financeiros distintos sem aviso claro

**Arquivo + trecho:** `business-plan-planners.md` §1, tabela de indicadores:
- "Caixa gerado ANTES do pró-labore: +R$ 16,2 mil (ROI 325% s/ R$ 5k)" → vem do **Cenário Base** (360 un, tabela fixa)
- "Projeção 12 meses (base): ramp do zero [...] 387 un no ano [...] caixa operacional antes do pró-labore soma ~R$ 17 k" → vem da **Projeção 12M** (ramp específico, 387 un total)

**Problema:** Um leitor atento nota que R$16,2k (cenário 360 un) e R$17k (projeção 387 un) são valores próximos mas diferentes, sem explicação de por que diferem. O documento não declara explicitamente que são simulações distintas com premissas diferentes.

**Aritmética verificada:** Cenário Base 360 un × MC R$54,48 − marketing R$2.400 − DAS R$972 = R$16.240 (**confirmado**). Projeção 12M 387 un com ramp e marketing variável = R$17.011 (**confirmado**). Nenhum erro aritmético — apenas falta de aviso editorial.

**Correção sugerida:** Adicionar nota de rodapé na tabela §1: "(1) +R$16,2k e ROI 325% são do Cenário Base estático (360 un; aba 'Cenários' da planilha). O '+R$17k' é da Projeção 12M com ramp (387 un; aba 'Projeção 12M'). Os dois números são consistentes e complementares, não contraditórios."

---

### MÉDIO-4 — Custo gráfica BR (R$55 micro-lote / R$45 reposição) usado como premissa fixa sem orçamento real

**Arquivo + trecho:** `build_model.py` linhas 258–262 (células azuis editáveis): `custo micro-lote = R$55`, `custo reposição = R$45`. `business-plan-planners.md` §7 e §8 tratam esses valores como premissas do modelo.

**Problema:** `sourcing-tributos.md` §4 classifica explicitamente essas faixas como "[a confirmar por 3 orçamentos reais]". A nota no sourcing cita faixas: micro-lote (<100 un) Tier A/B: R$50–75; reposição (300 un) R$35–52. O valor R$55 é o topo do mínimo e R$45 é o meio-superior da faixa.

**Efeito numérico se custo for pior (R$65 micro / R$52 reposição):**
- Break-even do lote: muda de 51 un para ~57 un (de 54 un disponíveis — **impossível cobrir no micro-lote**)
- MC blended reposição: cai de R$54,48 para R$47,48 (−13%)
- Break-even mensal sobe de 39 para ~45 un/mês
- Cenário Base (360 un, custo R$52): MC R$47,48 × 360 − R$3.372 = **+R$13.711 antes** (vs R$16.240 doc)

**Risco real:** Se gráficas cotarem R$65 para <100 un premium (capa dura + wire-o + hot stamping), o **micro-lote de R$3.000 compra apenas ~46 unidades** (3000/65 = 46) e o break-even do lote (51 un) se torna **inalcançável sem aumentar o investimento inicial**. Esse cenário não está modelado.

**Correção sugerida:** (a) No business plan §7, adicionar: "A premissa de R$55/un micro-lote e R$45/un reposição é estimativa de faixa; os orçamentos reais podem chegar a R$65–75 para Tier A premium sem desconto de volume. Se o custo exceder R$59/un, o micro-lote de R$3.000 não comporta as 51 un necessárias para cobrir o investimento." (b) Adicionar linha na aba Sensibilidade variando custo/un.

---

### MÉDIO-5 — SAM usa "renda familiar ≥ 3 SM" como proxy de capacidade de compra individual

**Arquivo + trecho:** `mercado-demanda.md` §3, cálculo SAM: "renda familiar ≥ 3 salários mínimos (pode pagar ~R$ 110) = ~42% do total [Censo 2025: ~58% ganham até 3 SM]". `business-plan-planners.md` §3.1: "SAM (compraria planner ~R$ 110) R$ 35–80 M/ano (~400–700 k pessoas)".

**Problema:** O Censo dos Concursos mede **renda familiar**, não renda pessoal do concurseiro. 67,8% dos concurseiros estão empregados, mas muitos são jovens estudantes com renda familiar média-alta e renda pessoal baixa. O planner de R$119 seria pago com renda pessoal, não familiar. A proxy de renda familiar para WTP individual superestima o SAM.

**Efeito:** Se o critério correto fosse "gasto anual com preparação ≥ 1 SM (R$1.518)" como proxy de capacidade de gasto, o Censo indica que apenas **35,75%** dos concurseiros gastam esse valor. Isso reduziria o SAM de ~42% para ~36% — redução de ~14% no SAM, que cai para ~R$30–68M.

**Impacto na decisão:** Imaterial para o SOM, que é limitado por capacidade de aquisição (não por tamanho de SAM). O SOM de 200–600 un representa < 0,1% de qualquer SAM razoável.

**Correção sugerida:** Em `mercado-demanda.md`, ajustar: "Atenção: o critério usa renda FAMILIAR; a capacidade de gasto individual pode ser menor. Considerar o segmento de alto gasto (35,75% que gastam ≥ 1SM/ano em preparação) como proxy alternativa, dando SAM ~R$30–68M — mais conservador."

---

### MÉDIO-6 — Crossover China ~3.000 un é verdadeiro apenas para gráfica BR premium; faixa real é 1.000–5.000+ un

**Arquivo + trecho:** `consultoria-sourcing-planners.md` §1: "a partir de ~3.000 un, não 1.000". `business-plan-planners.md` §7: "China, mas **só a partir de ~3.000 un**". `sourcing-tributos.md` §6: "A China só abre vantagem clara a partir de ~3.000 un."

**Problema:** A tabela em `sourcing-tributos.md` §6 mostra:
- China 1.000 un landed: R$37
- BR 1.000 un: R$22–38 (faixa)

Se a gráfica BR cotar **R$22–30/un** para 1.000 un (offset, sem hot stamping), a China fica **significativamente mais cara** mesmo em 3.000 un (China R$24 vs BR R$18–22). O crossover real para offset BR pode estar em 5.000+ un. O crossover de ~3.000 un é válido apenas se a gráfica BR premium cotar na **ponta alta** da faixa (R$35–38/un em 1.000 un).

**Evidência:** `sourcing-tributos.md` §6, nota: "Em 1.000 un o resultado depende de qual ponta da faixa BR se realiza."

**Impacto na decisão:** Favorável — a recomendação "ficar no Brasil por mais tempo" é reforçada, não enfraquecida. O crossover real pode ser ainda mais adiante que 3.000 un.

**Correção sugerida:** Nos documentos, substituir "a partir de ~3.000 un" por "entre 1.000–5.000 un, dependendo do tier de acabamento da gráfica BR escolhida. Com gráfica offset sem hot stamping (Tier C), o crossover pode ser acima de 5.000 un. Com gráfica premium Tier A, fica ~3.000 un."

---

### BAIXO-1 — Câmbio: R$5,18 (referenciado) vs R$5,20 (utilizado nos cálculos)

**Arquivo + trecho:** `sourcing-tributos.md` §9 e BP §8: "câmbio ≈ R$ 5,18 em 17/jun/2026 (Investing.com)". `build_model.py` linha 770: `pm = 0.5*119 + 0.5*109` (sem câmbio). Landed cost usa câmbio R$5,20 implícito no FOB BRL.

**Problema:** Os documentos citam R$5,18 como câmbio observado, mas os cálculos usam R$5,20 (arredondamento). A diferença é de R$0,02/US$.

**Efeito numérico:** No lote de 1.000 un (FOB US$3.000): impacto de R$60 total = R$0,06/un. Imaterial.

**Correção sugerida:** Unificar câmbio em R$5,18 ou R$5,20 explicitamente em todos os documentos; adicionar nota: "Câmbio de planejamento R$5,20 (arredondado de R$5,18 observado em 17/jun/2026)."

---

### BAIXO-2 — Projeção 12M: 387 un totais fica ligeiramente abaixo do mínimo somado dos SOMs

**Arquivo + trecho:** `business-plan-planners.md` §3.1: "SOM ano 1 R$ 24–71 k (200–600 un) Concurseiro". §3.2: "SOM ano 1 R$ 16–54 k (150–500 un) Treino". Projeção 12M: 387 un total.

**Problema:** Com split 50/50 dos 387 un: ~194 Concurseiro + 193 Treino. O SOM mínimo do Concurseiro é 200 un — a projeção base ficaria 3% abaixo. Inconsistência menor.

**Impacto na decisão:** Nulo — o SOM é um range amplo e estimado; a projeção está dentro da margem de erro.

**Correção sugerida:** Ajustar o SOM mínimo do Concurseiro para 180–600 un, ou declarar explicitamente que o SOM é para cada SKU individualmente e que a projeção de 387 un combina os dois.

---

### BAIXO-3 — "CAC orgânico ≈ R$0" pode induzir subestimação de esforço

**Arquivo + trecho:** `build_model.py` linha 344: `prem(34, "CAC orgânico (R$/cliente)", 0, ...)`. `business-plan-planners.md` §6: tráfego orgânico referenciado como custo ~0.

**Problema:** O custo financeiro do canal orgânico é de fato zero. Porém, a produção de Reels diários (5–7/semana) consome 2–3h/dia de tempo dos sócios, conforme a própria evidência (`canal-aquisicao.md`). O custo de oportunidade existe e é coberto pelo pró-labore a partir do mês 5. Nos meses 1–4 (sem pró-labore), esse custo é real e não modelado.

**Impacto:** Custo de oportunidade não modelado = ~R$2.750–4.000 nos meses 1–4 (tempo dos sócios). Não altera a viabilidade do negócio, mas é uma ressalva honesta para a "dupla linha de resultado".

**Correção sugerida:** No BP §6, adicionar: "Custo financeiro zero não significa custo zero — produzir 5+ Reels/semana exige 2–3h/dia dos sócios, cujo custo de oportunidade nos primeiros 4 meses (antes do pró-labore) é real. O modelo não captura esse custo implicitamente até o mês 5."

---

### BAIXO-4 — Gap no market de Treino de Força: "confirmado" com ressalva metodológica

**Arquivo + trecho:** `mercado-demanda.md` §2.3: "não há diário de periodização nacional com marca [confirmado, mercado-demanda.md]". `business-plan-planners.md` §3.2 e §4.

**Problema:** O gap foi confirmado via buscas no Amazon BR, Amorimpresso, buscas gerais. Porém, D2C de nicho (Instagram, Hotmart, produtores pequenos) é notoriamente difícil de mapear por busca web. É possível existir produto semelhante vendido exclusivamente via stories de Instagram ou grupos de Telegram sem presença em marketplaces.

**Impacto:** Baixo — mesmo que exista produto análogo em nicho, não há evidência de player com escala, marca ou reviews significativos.

**Correção sugerida:** Rebaixar de "confirmado" para "não identificado em buscas em jun/2026"; adicionar: "Busca não alcança D2C puro via Instagram/WhatsApp; possível existência de produtos análogos sem canal rastreável."

---

## RISCOS MATERIAIS OMITIDOS (COBERTURA)

**1. Concentração de plataforma de conteúdo (não mencionado como risco)**
O plano depende fundamentalmente de Instagram/TikTok para construção de audiência orgânica. Mudanças de algoritmo (já ocorreram em 2023–2024) ou banimento de conta podem zerar a distribuição sem aviso. O risco §9 lista "capacidade de execução" mas não o risco de plataforma. Sugestão: adicionar "Dependência de plataforma de mídia social: mudança de algoritmo ou ban de conta elimina o canal principal de aquisição."

**2. Margem D2C supõe que cliente paga o frete (mencionado como premissa, não como risco)**
Frete Brasília → SP/RJ (onde está ~40% do PIB e provável concentração de compradores premium): R$20–35 por Correios/Melhor Envio. Se precisar oferecer frete grátis para converter visitantes, a MC direto cai de R$57,59 para ~R$25–35 — próxima da ML. Esse trade-off não aparece na tabela de riscos.

**3. Teto MEI quase alcançado no cenário otimista**
650 un × R$119 = R$77.350 — apenas R$3.650 abaixo do teto MEI de R$81.000/ano. Migração para ME/Simples durante o ano 1 implica mudança de regime tributário, contador, possível aumento de DAS. O texto menciona "ao se aproximar" mas não quantifica quando isso ocorre. Recomendação: calcular gate numérico (ex: "ao atingir ~600 un/ano ou ~R$68k de receita acumulada, iniciar migração").

**4. Recompra: não modelada, mas citada como vantagem do Treino**
O diário de treino "acaba" (se esgota), gerando recompra. O modelo trata cada venda igualmente. LTV > 1 compra por cliente não está modelado. É upside não capturado — positivo para o negócio, mas se for incluído no argumento de viabilidade, deveria estar no modelo.

---

## ALUCINAÇÃO / FATOS NÃO VERIFICÁVEIS

**1. Hevy: "14 M+ atletas globais"**
Fonte: `hevyapp.com` (maio/2026) — confirmado pela evidência. Porém: dado de marketing do próprio app, sem auditoria independente. Marcação "confirmado" é correta para a fonte mas a fonte é o próprio interessado.

**2. "CNU 3ª edição confirmado para 2027"**
Fonte: mercado-demanda.md atribui a "Gran Cursos; Estratégia, 2026". São sites de cursinhos com interesse em afirmar continuidade do mercado. Não há decreto ou portaria governamental confirmando o CNU 3. O padrão histórico é defensável, mas "confirmado" é forte para uma decisão política futura.

**3. "2027 historicamente retoma com força — em 2023, após a eleição de 2022, foram 9.116 vagas federais autorizadas, +47% que os 4 anos anteriores somados"**
Fonte: Poder360, jan/2024 — link fornecido, confirmado. A inferência "2027 = vento de cauda" é razoável mas assume continuidade do padrão, que depende do governo eleito em 2026.

---

## VERIFICAÇÃO ARITMÉTICA — RESUMO

| Número | Declarado | Calculado | Status |
|--------|-----------|-----------|--------|
| Preço médio (50%×119 + 50%×109) | R$114 | R$114,00 | ✓ CONFIRMADO |
| MC/un direto | R$57,59 (50%) | R$57,59 (50,5%) | ✓ CONFIRMADO |
| MC/un ML | R$26,48 (23%) | R$26,48 (23,2%) | ✓ CONFIRMADO |
| MC/un Shopee | R$6,48 (6%) | R$6,48 (5,7%) | ✓ CONFIRMADO |
| MC/un blended (90/10) | R$54,48 (48%) | R$54,48 (47,8%) | ✓ CONFIRMADO |
| Break-even lote: 51/54 un | 51 un / 94% | 51 un / 94,4% | ✓ CONFIRMADO |
| Break-even mensal c/ pró-labore | ~39 un/mês | 39 un/mês | ✓ CONFIRMADO |
| Cenário Base antes pró-labore | +R$16,2k / ROI 325% | +R$16.240 / 325% | ✓ CONFIRMADO |
| Cenário Base depois pró-labore | +R$0,2k | +R$240 | ✓ CONFIRMADO |
| Cenário Conservador antes/depois | +R$4,7k / −R$11,3k | +R$4.693 / −R$11.307 | ✓ CONFIRMADO |
| Cenário Otimista antes/depois | +R$38,1k / +R$22,1k | +R$38.120 / +R$22.120 | ✓ CONFIRMADO |
| Projeção 12M: total unidades | 387 un | 387 un | ✓ CONFIRMADO |
| Projeção 12M: cobre pró-labore | ~mês 9–10 | mês 9 | ✓ CONFIRMADO |
| Caixa op. acum. (antes pró-labore) | ~R$17k | R$17.011 | ✓ CONFIRMADO |
| DAS MEI 2026 | ~R$81/mês | R$80,90 | ✓ CONFIRMADO |
| Landed China 1.000 un | R$36,83/un | R$36,83 (com despacho na base ICMS) | ✓ CONFIRMADO* |
| AFRMM | 8% | 8% (Lei 14.301/2022) | ✓ CONFIRMADO |
| Crossover China ~3.000 un | ~3.000 un | 1.000–5.000 un (depende do tier) | ⚠ AMBÍGUO |
| CAC tráfego frio | R$120–333 | Metodologia: CPC/conv. — defensável | ✓ DEFENSÁVEL |

*Vide MÉDIO-1 para ressalva metodológica sobre inclusão do despacho na base ICMS.

---

## CONSISTÊNCIA CRUZADA — RESUMO

Todos os números centrais (preço médio, MCs por canal, break-evens, cenários, projeção 12M) são **internamente consistentes** entre os três artefatos e correspondem exatamente ao código `build_model.py`. Não há divergência numérica entre BP, CS e MOD para os indicadores críticos.

Divergências encontradas:
1. Câmbio R$5,18 (citado) vs R$5,20 (calculado) — imaterial (BAIXO-1)
2. SOM Concurseiro mínimo 200 un vs projeção 194 un com split 50/50 — imaterial (BAIXO-2)
3. BP §1 mistura resultados de Cenário Base e Projeção 12M — editorial, não aritmético (MÉDIO-3)

---

## VEREDITO FINAL

**PRECISA DE CORREÇÕES**

O plano é **internamente coerente e aritmeticamente correto** nos números que declara. Não há erro de cálculo material. As premissas são adequadamente sinalizadas como estimativas na maioria dos casos.

Os problemas encontrados são de **comunicação e robustez de premissas**, não de aritmética:

1. O custo de gráfica (R$55 micro-lote / R$45 reposição) é a premissa mais frágil e com maior impacto: se o custo real do micro-lote ultrapassar R$59/un, o orçamento de R$3.000 não comporta as 51 un necessárias para o break-even do lote — invalidando a estrutura de "pré-venda cobre o lote". **Resolver antes de imprimir: obter 3 orçamentos reais.**

2. O sumário executivo mescla dois instrumentos distintos (Cenário Base e Projeção 12M) sem aviso claro — cria confusão desnecessária para um documento de decisão interna.

3. Dois riscos materiais ausentes da tabela §9: dependência de plataforma de mídia social e impacto de frete grátis na MC direta.

4. O crossover China "~3.000 un" precisa de qualificação: é válido para gráfica premium; pode ser 5.000+ un para offset. Não altera a recomendação, mas pode induzir decisão precipitada de importação.

Nenhum achado invalida o plano ou a viabilidade da Fase 1. Com os ajustes editoriais e a obtenção dos orçamentos reais de gráfica, o material fica pronto para circular entre os sócios e apoiar a decisão de avançar.

---

*Laudo gerado em 19/jun/2026. Validador: business-validator (claude-sonnet-4-6). Metodologia: leitura integral dos 5 artefatos + recomputação Python independente de todas as métricas anunciadas.*
