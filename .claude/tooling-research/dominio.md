# Rigor por Domínio — Frameworks & Checklists para os 5 Agentes do Projeto Planners
**Data:** 20/jun/2026 | **Contexto:** micro-venture D2C papelaria premium, Brasília/DF

---

## 1. market-researcher — Dimensionamento TAM/SAM/SOM

### Princípios acionáveis

**Triangulação obrigatória (≥2 métodos):**
- **Top-down:** dado macro (IBGE, ABIPEME, relatório setorial) → filtros geográficos e demográficos → SAM
- **Bottom-up:** unidade atômica de demanda (ex.: "concurseiro ativo com caderno premium") × preço médio × penetração estimada = SOM
- **Value-theory:** quanto o cliente economiza/ganha pelo produto × disposição a capturar → cross-check de preço e volume
- Regra crítica: discrepância top-down ↔ bottom-up > 15% exige investigação de causa raiz (dupla contagem ou penetração irreal)

**Sinais de proxy úteis (sem pesquisa primária cara):**
| Sinal | Fonte | Uso |
|---|---|---|
| Volume de busca keyword | Google Trends / SEMrush | proxy de demanda latente |
| Reviews e vendas estimadas | Amazon BR / Mercado Livre | benchmark de SKU concorrente |
| Seguidores de contas temáticas | Instagram/TikTok (concursos, treino) | TAM social = proxy de nicho |
| Anúncios ativos de concorrentes | Meta Ad Library | sinal de CAC e conversão do segmento |
| Dados PNAD/IBGE | IBGE Sidra | população-alvo (concurseiros: 7–8 M candidatos/ano; CEBRASPE 2024) |

**Fontes prioritárias para papelaria/concursos BR:**
- IBGE PNAD (mercado de trabalho + escolaridade)
- CEBRASPE/FGV — dados de inscrições por concurso (público)
- ABIPEME — classes econômicas
- Euromonitor Passaporte (se disponível) — mercado de papelaria/stationery
- Relatórios ABCOMM + Mercado Livre para e-commerce

**Checklist de rigor (22-point adaptado para o projeto):**
- [ ] Unidade-base documentada com definição precisa (ex: "caderno A5 premium, R$80+")
- [ ] Universo populacional calculado de ≥2 fontes independentes
- [ ] Taxa de penetração baseada em análogo histórico (ex.: penetração de planner no UK/US como proxy)
- [ ] Cross-check com receita de concorrentes identificados (ex.: Não Me Perco, planner importado)
- [ ] Análise de sensibilidade ±20% nos principais drivers
- [ ] Dados com data e fonte explícita; confiança marcada (`[confirmado]`/`[estimativa triangulada]`/`[a confirmar]`)
- [ ] Triangulação top-down ↔ bottom-up com delta documentado

### Melhorias concretas recomendadas para o agente
1. **Adicionar rotina de sinais proxy**: antes de estimar SAM, checar volume de busca mensal (Google Trends) para termos como "planner concurso", "caderno de estudos", "diário de treino premium" — é dado gratuito e imediato.
2. **Exigir análogo de penetração**: o agente deve sempre citar um produto/categoria análogo com penetração conhecida (ex.: agenda premium no BR ~2–3% da PEA, qual é o benchmark?).
3. **Forçar Monte Carlo simplificado**: rodar 3 cenários (pessimista/base/otimista) com distribuição triangular nas 3 variáveis-chave e reportar P10/P50/P90.
4. **Documentar fonte + data em cada célula numérica** do output (não apenas no rodapé do relatório).

### Recursos
- [Bottom-Up Market Sizing Methodology — Umbrex](https://umbrex.com/resources/market-sizing-playbook/bottom-up-market-sizing-methodology/)
- [TAM SAM SOM — ICanPitch 2026](https://www.icanpitch.com/blog/tam-sam-som-market-sizing-guide)
- [Effective Market Sizing for Startups — Medium](https://optimaljon.medium.com/effective-market-sizing-tam-sam-som-pam-for-startups-and-vcs-e7b0847af8c0)

---

## 2. pricing-strategist — Posicionamento, WTP e Economia de Canal

### Princípios acionáveis

**Framework April Dunford — 5 Componentes do Canvas:**

| Componente | Pergunta-chave | Aplicação Planners |
|---|---|---|
| 1. Alternativas competitivas | "O que o cliente faria se não existíssemos?" | Cadernos comuns (Tilibra/Brochurinhas), planners importados, apps de estudo |
| 2. Atributos únicos | "Quais features são genuinamente nossas?" | Estrutura de ciclo de estudos, diagnóstico de erro, layout de periodização |
| 3. Valor (e prova) | "Por que cada atributo importa? Como provo?" | "Reduz o tempo de revisão em X%" — depoimento Mayara + beta users |
| 4. Segmento-alvo | "Quem mais valoriza esse valor?" | Concurseiro exclusivo de alta dedicação (P1); atleta amador com coach |
| 5. Categoria de mercado | "Como quero que me categorizem?" | **Hub analógico de alto desempenho** (não "agenda/caderno") |

**Recurso:** Workbook gratuito de 12p disponível em [aprildunford.com/books](https://www.aprildunford.com/books) e [canvas guide](https://www.kathirvel.com/guide-april-dunford-positioning-framework/)

**Van Westendorp PSM — as 4 perguntas exatas:**
1. *"A que preço este produto seria tão barato que você duvidaria da qualidade?"* → limite inferior (too cheap)
2. *"A que preço seria uma pechincha, um ótimo custo-benefício?"* → barganha
3. *"A que preço começaria a parecer caro, mas você ainda consideraria comprar?"* → caro
4. *"A que preço seria tão caro que você nem consideraria comprar?"* → too expensive

**4 pontos de intersecção (leitura do gráfico PSM):**
| Ponto | Intersecção | Significado |
|---|---|---|
| PMC (marginalidade barata) | too cheap × expensive | piso da faixa aceitável |
| Preço ótimo (OPP) | too cheap × too expensive | melhor equilíbrio resistência |
| Preço normal/indiferença | cheap × expensive | onde metade acha barato, metade caro |
| PME (marginalidade cara) | cheap × too expensive | teto da faixa aceitável |

**Nota de limitação**: PSM é hipotético → validar com Gabor-Granger ou conjoint analysis para confirmação.

**Ancoragem e economia de canal:**
- Canal direto (próprio): MC/un ~50–57% (sem comissão de marketplace)
- Marketplace (Shopee/ML): MC/un ~6–8% — estruturalmente inviável como canal primário
- Regra prática: se margem bruta < 45%, qualquer comissão de marketplace (20%+) + logística + devoluções empurra CM para negativo
- Ancoragem de preço: oferecer SKU premium-plus (capa + refil) justifica preço do SKU-base; o kit age como âncora superior

**Checklist de rigor:**
- [ ] Posicionamento testado com as 5 perguntas do Canvas Dunford
- [ ] PSM aplicado com ≥40 respondentes do público-alvo (não amigos/família)
- [ ] Preço de lançamento dentro da faixa PMC–PME
- [ ] Calculada CM por canal (direto, marketplace, revendedor) antes de fechar mix
- [ ] Ancoragem documentada (qual SKU "caro" ancora o preço do principal?)

### Melhorias concretas recomendadas para o agente
1. **Executar PSM digital antes do lançamento**: pesquisa Google Forms com 40–80 pessoas da lista de leads da Mayara; custo zero, dados primários.
2. **Construir tabela de CM por canal** sempre que avaliar novo parceiro (ex.: livraria, papelaria física): fórmula = preço – COGS – comissão_canal – frete – devoluções.
3. **Documentar alternativas competitivas de verdade**: o Canvas começa pelas alternativas — o agente deve listar ≥5 com preços reais pesquisados (não "outros planners genéricos").
4. **Separar posicionamento do Concurseiro x Treino**: os dois produtos têm categorias diferentes e alternativas diferentes — um canvas por produto.

### Recursos
- [April Dunford Positioning Framework Guide](https://www.kathirvel.com/guide-april-dunford-positioning-framework/)
- [Van Westendorp PSM — Conjointly](https://conjointly.com/products/van-westendorp/)
- [Van Westendorp Guide — OpinionX](https://www.opinionx.co/blog/van-westendorp-pricing-guide)
- [eCommerce Contribution Margin — Saras Analytics](https://www.sarasanalytics.com/blog/ecommerce-contribution-margin)

---

## 3. sourcing-analyst — Landed Cost BR, NCM, Incoterms, MOQ, QA

### Princípios acionáveis

**Fórmula de landed cost Brasil (cascata — base CIF):**

```
Base = CIF = FOB + Frete internacional + Seguro
① II        = CIF × alíquota_II          (NCM 4820.10.00: verificar TIPI — tipicamente 15–20%)
② IPI       = (CIF + II) × alíquota_IPI  (cadernos: geralmente 0%)
③ AFRMM     = Frete oceânico × 25%        (só marítimo; obrigatório)
④ PIS       = CIF × 2,1%
⑤ COFINS    = CIF × 9,65%
⑥ Base ICMS = (CIF + II + IPI + PIS + COFINS + despesas_aduaneiras) ÷ (1 – alíq_ICMS)
   ICMS      = Base_ICMS × alíq_ICMS      (SP: 18%; DF: 20%; verificar por destino)
⑦ SISCOMEX  = R$ 185 + R$ 29,50/item adicional
+ Despachante aduaneiro + capatazia + armazenagem + frete doméstico
```

**Efeito cascata típico:** FOB $100 → landed ≈ R$250–300 (2,0–2,7× FOB), conforme referência do dossiê. Número crítico: carga tributária total pode representar ~66–94% do valor FOB.

**NCM 4820.10.00 (cadernos/planners):**
- Tributado normalmente (sem imunidade de livro — confirmado)
- AFRMM: 8% do frete oceânico (nota: fonte principal indica 8%, artigo MyBusinessBrazil indica 25% — confirmar com despachante; a alíquota atual AFRMM é 25% sobre o frete marítimo, mas há isenções parciais)
- Cruzeiro China: economicamente justificável a partir de ~3.000–5.000 un (conforme dossiê)

**Regimes de importação:**
| Regime | Limiar | Impostos | Quando usar |
|---|---|---|---|
| Formal (DI) | qualquer valor | II + IPI + PIS/COFINS + ICMS + AFRMM | ≥500 un, fornecedor China |
| Remessa expressa (e-commerce) | até US$50 | isento (PF) | amostras/testes individuais |
| Remessa postal (pessoa física) | até US$500 | II 60% flat | não usar para operação |
| Drawback | manufatura p/ exportação | isenção de II/IPI | não aplicável aqui |

**Incoterms — recomendação:**
- **FOB** (no fornecedor): comprador controla frete → consegue cotar AFRMM separadamente, base CIF menor → impostos menores
- **CIF** (frete do fornecedor): mais simples mas perde controle de custo e eleva base tributária
- Evitar DAP/DDP de fornecedor chinês: embutido no preço sem transparência de custo

**Checklist de sourcing (QA/MOQ):**
- [ ] RFQ enviado para ≥3 fornecedores (Alibaba Gold + referenciados + gráfica BR)
- [ ] Amostras físicas recebidas e avaliadas (gramatura, impressão, espiral, papel, lombada)
- [ ] AQL definido (recomendado 2.5% para produto físico de consumo)
- [ ] Inspeção pré-embarque obrigatória a partir de 500 un (inspetor local ou serviço ~US$209/dia)
- [ ] NCM confirmado com despachante (não apenas consultado no TIPI)
- [ ] Câmbio + data de qualquer cotação registrado na planilha
- [ ] Lead time de produção + transit time mapeado (China: 30–45d produção + 30d marítimo = ~75d)
- [ ] Cláusula de retrabalho/rejeição no contrato com fornecedor

**Checklist de QA para cadernos/planners:**
- Gramatura de papel (75g/m² mínimo para caneta sem sangrar)
- Impressão: registro de cores, alinhamento de grid/linhas
- Espiral: calibre, acabamento das pontas, abertura plana (180°)
- Capa: laminação, resistência à flexão, impressão UV
- Paginação: correta, sem páginas invertidas
- Dimensão: A5 ± 2mm

### Melhorias concretas recomendadas para o agente
1. **Construir calculadora de landed cost parametrizável**: planilha com inputs (FOB, frete, seguro, NCM, estado destino) e output em R$ com detalhamento por imposto — já existe parcialmente no modelo; garantir que reflita cascata correta.
2. **Exigir confirmação de NCM com despachante** antes de qualquer projeção financeira (alíquota errada invalida todo o modelo).
3. **Documentar câmbio e data em toda cotação** — o AFRMM e o II são cobrados em reais na data do registro da DI, não da cotação.
4. **Adicionar checklist de AQL no RFQ**: definir critérios de aceitação/rejeição antes de fechar pedido, não depois de receber.

### Recursos
- [Brazil Import Duties 2026 — NovaTrade Brasil](https://novatradebrasil.com/en/import-duties-taxes-brazil/)
- [Import Costs Brazil 2026 — MyBusinessBrazil](https://mybusinessbrazil.com/import-costs-in-brazil-2026-what-foreign-companies-must-know/)
- [Incoterms in Brazil — NovaTrade](https://novatradebrasil.com/en/incoterms-in-brazil/)
- [China Factory Audit Checklist — Maple Sourcing](https://www.maplesourcing.com/detailed-explanations-of-china-factory-audit-checklist.html)
- [Extensive Factory Audit — AQI Service](https://aqiservice.com/factory-audit/extensive-factory-audit/)
- [How to Calculate Landed Cost — IncoDocs](https://incodocs.com/blog/how-to-calculate-the-landed-cost-of-imported-goods-2/)

---

## 4. financial-modeler — Unit Economics, MC por Canal, Sensibilidade, LTV-CAC

### Princípios acionáveis

**Camadas de margem de contribuição (framework D2C):**

```
Receita bruta
− Devoluções/descontos
= Receita líquida (NR)
− COGS (custo do produto + embalagem)
− Frete + fulfillment
− Taxas de pagamento (2–4% no BR)
= CM1 (Margem de Contribuição Nível 1) → benchmark saudável: >50%

CM1
− CAC variável (anúncios atribuídos ao pedido)
= CM2 → benchmark saudável: >25%

CM2
− Custos fixos alocados (pró-labore, software, overhead)
= EBITDA por unidade
```

**Benchmarks D2C ecommerce (2025–2026):**

| Métrica | Saudável | Atenção | Crítico |
|---|---|---|---|
| CM1 | >50% | 40–50% | <40% |
| CM2 | >25% | 15–25% | <15% |
| LTV:CAC | >3:1 | 2–3:1 | <2:1 |
| Payback CAC | <12 meses | 12–18 meses | >18 meses |
| Devolução | <10% | 10–20% | >20% |
| Margem líquida | >15% | 8–15% | <8% |

**Fórmulas fundamentais:**

```
CAC = (gasto_marketing + taxas_agência + criativos + descontos_novos_clientes) ÷ novos_clientes
      [inclui 30–60% a mais do que o painel de plataforma mostra]

LTV (coorte) = receita_cumulativa_24m × margem_bruta
             OU = (ticket_médio × frequência_anual × margem_bruta) ÷ churn_anual

Payback = CAC ÷ (CM_mensal_por_cliente)

LTV:CAC = LTV ÷ CAC  [mínimo 3:1; projeto Planners estimado em 7–8× — validar por coorte]
```

**Sensibilidade — variáveis-chave para planners:**
- Preço (±R$10): impacto direto em CM e LTV
- Custo unitário (micro-lote vs reposição): ±R$10/un em MC
- CAC (orgânico vs pago): diferença estrutural entre canal Mayara (0 CAC) vs paid (R$30–80+)
- Frequência de recompra: 3× vs 4× ao ano muda LTV em ~33%
- Churn de coorte: perda de 20% da coorte no ano 1 é diferente de 20% ao mês

**Análise de sensibilidade obrigatória (tornado chart):**
1. Custo por unidade (sourcing)
2. CAC blended (mix orgânico/pago)
3. Frequência de recompra
4. Preço médio de venda
5. Mix de canal (% direto vs marketplace)

**Payback inicial (Fase 1 — investimento R$5.000):** `[ilustrativo · a recalcular pós-cotação · 21/jun/2026]`
```
Estoque micro-lote ~45 un × custo 4/4 R$43–55 (2/2 R$36–47)  [estimativa triangulada]
Receita 45 un × R$129 (Concurseiro F1, lançamento)          = R$5.805
MC bruta ≈ 48–62% (faixa 4/4 → 2/2)                          [a recalcular pós-cotação]
Após CAC orgânico (R$0 via Mayara): payback < 1 ciclo de venda
```

**Checklist de rigor financeiro:**
- [ ] CM calculada por canal (direto, marketplace, revendedor) separadamente
- [ ] CAC calculado com TODOS os custos (não só ad spend)
- [ ] LTV calculado por coorte, não por cliente médio
- [ ] Análise de sensibilidade com ≥3 cenários e ≥3 variáveis
- [ ] Payback calculado sobre CM, não receita bruta
- [ ] Modelo tem aba de assumptions explícita com fonte de cada parâmetro
- [ ] Gatilhos de escala documentados (ex.: cruzar R$135k para ativar China)
- [ ] EVEF com taxa de desconto justificada (12–15% para venture BR)

### Melhorias concretas recomendadas para o agente
1. **Adicionar análise de coorte real** ao modelo: quando as primeiras vendas acontecerem, rastrear receita cumulativa aos 3/6/12 meses por mês de aquisição — substitui o LTV estimado por LTV observado.
2. **Calcular CAC por canal e não só blended**: CAC orgânico (Mayara) ≈ R$0 é o motor de viabilidade; CAC pago pode ser R$50–100+. Misturar os dois esconde o risco de escalar via paid.
3. **Forçar tabela de sensibilidade antes de qualquer decisão de preço ou sourcing**: nenhum output financeiro sem o tornado chart.
4. **Documentar pressupostos com data e fonte** na aba de assumptions do modelo (não só no texto do relatório).

### Recursos
- [Ecommerce Unit Economics — Eightx](https://eightx.co/blog/ecommerce-unit-economics)
- [LTV:CAC Guide — Eightx](https://eightx.co/blog/ltv-cac-ratio-guide)
- [D2C & E-Commerce Valuation — Virtual Auditor](https://virtualauditor.in/learn/d2c-ecommerce-valuation-india/)
- [Unit Economics at Scale — GrowthGurukul](https://growthgurukul.in/unit-economics-at-scale-ltv-cac-payback-period-cac-ratio)

---

## 5. business-validator — Validação Adversarial / Red-Team de Planos de Negócio

### Princípios acionáveis

**Metodologia pré-mortem (Gary Klein — obrigatória antes de qualquer deliverable):**
1. **Presumir que o negócio falhou** — não "o que pode dar errado", mas "o negócio faliu. Por quê?"
2. Cada participante escreve individualmente as causas de falha (evitar groupthink)
3. Consolidar lista de causas; agrupar por categoria (demanda, supply, financeiro, execução, macro)
4. Rankear por **magnitude × probabilidade**
5. Para cada causa de alta magnitude: "qual é o teste mais barato que falsificaria esta premissa?"

**Stress-test de premissas (adversarial framework):**

```
Para cada premissa carregada no plano:
  1. Nomear a premissa explicitamente
  2. Classificar: load-bearing (falha = plano cai) vs suportante (falha = ajuste)
  3. Evidência que sustenta a premissa (fonte + data)
  4. O que tornaria esta premissa falsa? (contra-argumento)
  5. Severidade: CRÍTICO / ALTO / MÉDIO / BAIXO
  6. Teste empírico mais barato para validar/refutar
```

**Categorias de premissas a checar (adaptado para Planners):**

| Categoria | Premissas Load-Bearing | Sinal de Alarme |
|---|---|---|
| **Demanda** | "O público quer planner físico, não só app" | Zero pré-vendas após 30d de conteúdo |
| **Canal** | "Mayara converte seguidores em clientes" | CTR < 0.5% em posts de produto |
| **Preço** | "R$129 é percebido como premium, não caro" `[Daniel · 21/jun/2026]` | PSM coloca OPP abaixo de R$99 |
| **Sourcing** | "Gráfica BR entrega no prazo e qualidade" | Atraso > 2 semanas na 1ª entrega |
| **Unit economics** | "LTV:CAC > 3× com CAC orgânico" | CAC pago >R$60 sem escala orgânica |
| **Recompra** | "3–4× ao ano" | Cohort 3m mostra <1,5× na prática |
| **Competição** | "Barreira suficiente (marca Mayara)" | Concorrente com 100k+ seguidores lança similar |
| **Regulatório** | "NCM/alíquotas estáveis" | Reforma tributária 2026 altera ICMS/IPI |

**Severidades e protocolo de resposta:**

| Severidade | Critério | Ação |
|---|---|---|
| CRÍTICO | Falha invalida o modelo de negócio inteiro | Parar e resolver ANTES de continuar |
| ALTO | Falha reduz viabilidade em >30% | Plano de mitigação com prazo definido |
| MÉDIO | Falha requer ajuste de mix ou preço | Monitorar com KPI e trigger |
| BAIXO | Falha é gerenciável com adaptação | Documentar; revisar trimestralmente |

**Checklist adversarial — o que o validador DEVE checar:**
- [ ] Todos os números têm fonte + data? (sem "estimado" sem âncora)
- [ ] A premissa de demanda tem evidência primária (≥1 venda real ou pré-venda)?
- [ ] O CAC usado no modelo inclui custo criativo, ferramentas e tempo?
- [ ] O LTV reflete churn histórico observado ou é projeção otimista?
- [ ] A análise de sensibilidade cobre o cenário onde o canal primário (Mayara) perde alcance?
- [ ] O modelo de sourcing inclui lead time total (produção + transporte + desembaraço)?
- [ ] Os gatilhos de escala (R$135k, 5.000 un) são mensuráveis e têm data-alvo?
- [ ] Existe cenário de saída ou pivô documentado se KPIs não baterem em 6 meses?
- [ ] A premissa "90% direto / 10% marketplace" foi testada com os primeiros 50 clientes?
- [ ] O modelo financeiro passou pelo test de "e se o preço precisar cair 20%?" mantendo viabilidade?

**Regras de ouro do validador:**
- "Nunca usar ILUSTRATIVO como se fosse fechado" (regra do dossiê — reforçar em cada revisão)
- Toda tabela deve ter linha em branco antes (convenção do projeto — validar antes de gerar PDF)
- Datas relativas → absolutas em qualquer premissa de prazo
- Tributos/alíquotas: nunca afirmar sem fonte + data + "recomendar conferência com despachante/contador"

### Melhorias concretas recomendadas para o agente
1. **Estruturar output como tabela de premissas**: cada relatório do validator deve gerar uma tabela com colunas: Premissa | Evidência | Contra-argumento | Severidade | Teste mais barato — não só texto narrativo.
2. **Adicionar protocolo de pré-mortem explícito**: sempre iniciar a sessão de validação com "o negócio faliu. Qual foi a causa mais provável?" antes de checar os documentos.
3. **Cruzar automaticamente com a Fonte Única da Verdade (CLAUDE.md)**: verificar se todos os números nos deliverables batem com os fatos-âncora definidos no CLAUDE.md; qualquer divergência é CRÍTICO.
4. **Exigir evidência primária para premissas de demanda**: o validador deve rejeitar qualquer plano que não tenha pelo menos 1 dado de comportamento real (venda, pré-venda, ou entrevista com pagamento-simbólico solicitado).

### Recursos
- [Pre-mortem — Wikipedia](https://en.wikipedia.org/wiki/Pre-mortem)
- [Business Model Stress Testing — ResearchGate](https://www.researchgate.net/publication/316179973_Business_model_stress_testing_A_practical_approach_to_test_the_robustness_of_a_business_model)
- [Pre-Product Validation — thoughtbot Playbook](https://thoughtbot.com/playbook/validation/product-validation)
- [Business Model Stress Test Tool](https://ap0t.com/tools/business-model-stress-test-tool.html)

---

## Síntese de Melhorias por Agente (Prioridade de Implementação)

| Agente | Melhoria #1 (maior impacto) | Esforço |
|---|---|---|
| market-researcher | Rotina de sinais proxy (Google Trends + ML/Amazon) antes de dimensionar | Baixo |
| pricing-strategist | PSM com 40–80 respondentes da lista da Mayara (Google Forms grátis) | Baixo |
| sourcing-analyst | Calculadora de landed cost parametrizável com cascata correta | Médio |
| financial-modeler | Análise de coorte real (assim que primeiras vendas acontecerem) | Médio |
| business-validator | Output como tabela de premissas com severidade em todo relatório | Baixo |

---

*Fontes trianguladas: Umbrex, Conjointly, OpinionX, NovaTrade Brasil, MyBusinessBrazil, Eightx, ICanPitch, April Dunford / Kathirvel, Wikipedia Pre-mortem, thoughtbot Playbook, ResearchGate, AQI Service, Maple Sourcing. Câmbio de referência: R$5,20/USD (jun/2026).*
