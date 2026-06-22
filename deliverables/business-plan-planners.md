# Business Plan — Projeto Planners
### Linha de planners perpétuos premium · Concurseiro & Treino de Força · Brasil (D2C)

> ## ⚠️ DOCUMENTO EM REVISÃO — baseline pré-pivô (a recalcular pós-cotação)
> **Atualizado: 21/jun/2026.** Redigido em 19/jun/2026, **antes** das decisões travadas de 21/jun/2026. As **tabelas e indicadores numéricos** deste corpo (VPL/TIR, MC/un, ROI, break-even, preço médio R$ 114, custo R$ 55) refletem o **cenário pré-pivô (2 SKUs em paralelo · R$ 119)** e **serão refeitos** pelo `financial-modeler` após as cotações reais (Gate A). **Não usar os números deste corpo como âncora operacional** — a fonte da verdade é `CLAUDE.md` §Fatos-âncora + `design/concurseiro/planner-v1/ESTADO-RETOMADA.md`.
>
> **Decisões que prevalecem sobre o corpo abaixo:**
> - **Lançamento sequencial:** F1 = **só o Concurseiro** (R$ 5.000 banca 1 SKU); **Treino de Força e Caderno de Erros = F2**, pagos pelo caixa gerado. (O corpo trata os 2 SKUs em paralelo — superado.)
> - **Preço de lançamento Concurseiro = R$ 129** (regime ~R$ 139); Treino R$ 109 (regime R$ 119–129). `[Daniel · 21/jun/2026]`
> - **SEM pré-venda · SEM empréstimo/aporte** — 100% autofinanciado. (Onde o corpo disser "pré-venda obrigatória" ou "aporte", está superado.)
> - **Custo/un (~112 pp, micro-lote):** 4/4 R$ 43–55 · 2/2 (paleta fria) R$ 36–47 `[estimativa triangulada · 21/jun/2026]` (supera ~R$ 55–60).
> - **Produto v1 = o Planner SEM ficha embutida** (só ponteiro → Caderno de Erros).
>
> ---

**Sócios:** dois irmãos (Daniel + Mayara), que **são o público-alvo** dos dois produtos.
**Investimento inicial:** R$ 5.000 (é o teste; **100% autofinanciado** — sem empréstimo, sem aporte externo). Treino de Força e Caderno de Erros entram em F2, pagos pelo caixa gerado.
**Praça:** Brasil, operação a partir de Brasília/DF · **Data:** 19/jun/2026 · **Câmbio de planejamento:** USD/BRL ≈ R$ 5,20.
**Modelo financeiro:** `models/viabilidade-planners-v2.xlsx` (premissas editáveis; tudo recalcula).
**Base de evidências:** `research/evidence/` (mercado, concorrência/preço, sourcing/tributos, canal/aquisição — fontes datadas).

> **Natureza do documento.** Este é um **dossiê interno de decisão** entre os dois sócios — não um pitch para investidor. O viés é a honestidade: o que é fato, o que é estimativa, e onde o plano pode falhar. Marcações de confiança: `[confirmado]` · `[estimativa]` · `[a confirmar]`.

---

## 1. Sumário executivo

**É viável começar com R$ 5.000? Sim.** O desafio central é **construir distribuição** — e essa é justamente a **força do time**: a sócia de conteúdo tem **viralização comprovada** (milhões de views no TikTok) e o caminho é o **orgânico**, que ela domina; o outro sócio (economista) cobre estratégia, números e operação. Soma-se a isso a **recorrência**: o produto é consumível (o concurseiro recompra **3–4×/ano**), o que eleva o **LTV** para **~R$ 374–397/cliente** e torna a aquisição muito mais defensável — o tráfego pago frio não se paga numa venda isolada (CAC R$ 120–333), mas **cabe no LTV** na escala. `[mercado-demanda.md · canal-aquisicao.md]`

**O que o modelo financeiro v2 mostra (cenário-base: 360 un no ano, preço médio R$ 114, custo R$ 45, 90% direto):**

> **DESATUALIZADO / a recalcular @ R$ 129 + custo triangulado [21/jun/2026].** Os indicadores abaixo foram calculados a preço médio R$ 114 e custo R$ 55 (pré-pivô). Com Concurseiro F1 a R$ 129 e custo 4/4 R$ 43–55 / 2/2 R$ 36–47, todos precisam ser recalculados pelo `financial-modeler`. Mantidos como referência histórica.

| Indicador | Valor | Leitura |
|---|---|---|
| Margem de contribuição/un — **canal direto** | **R$ 57,59 (50%)** | preserva margem |
| Margem de contribuição/un — Shopee | R$ 6,48 (6%) ⚠️ | marketplace destrói margem neste preço |
| Break-even do 1º lote | **51 de 54 un (94%)** | break-even alto — por isso o lote inicial deve ser pequeno (~54 un) e a venda aberta só após audiência construída (≥ 200–500 na lista de espera) |
| Break-even mensal (pró-labore + DAS) | **~39 un/mês** | o teste de viabilidade real |
| Ano 1 — caixa gerado **antes** do pró-labore | **+R$ 16,2 mil (ROI 325% s/ R$ 5k)** | o negócio em si é rentável |
| **Estratégia de pró-labore recomendada** | **B (otimizadora)** | reinveste 100% no ano 1; sócios sacam só a partir do ano 2 (ver §8) |
| Pró-labore acumulado em 3 anos — **B vs A** | **R$ 102 mil vs R$ 64 mil** | a paciência paga mais aos donos, sem sufocar o negócio |

**Faixa de cenários (ano 1, resultado após pró-labore — sob a Estratégia A):** Conservador **−R$ 11,3k** · Base **+R$ 0,2k** · Otimista **+R$ 22,1k**. A dispersão mostra que o resultado é decidido pela **velocidade de aquisição** (volume), não pela sorte. *(Sob a Estratégia B recomendada, o ano 1 reinveste 100% — ver §8.)*

> **Nota de leitura.** Há duas simulações distintas (consistentes, não somáveis): o **Cenário Base** acima é um retrato anual de 360 un; a **Projeção 12M** (§8) é uma simulação mês a mês com 387 un e ramp do zero. Ambas mostram o mesmo: o negócio **recupera o capital com folga já no ano 1** (≈ R$ 17 mil de caixa antes do pró-labore).

**Recomendações centrais:**
1. **Lançar o Concurseiro primeiro (F1)** — banca 1 SKU com os R$ 5.000; Treino de Força e Caderno de Erros entram na F2, financiados pelo caixa gerado. Foco no Concurseiro no lançamento; conteúdo de Treino pode ser construído em paralelo para preparar F2. `[Daniel · 21/jun/2026]`
2. **Pré-construir audiência por ~60–90 dias antes de imprimir** (lista de espera) — pré-venda sem audiência ≈ zero `[estimativa, canal-aquisicao.md]`. Mirar 200–500 inscritos antes de abrir vendas.
3. **Vender 100% direto na Fase 1** (Instagram/TikTok + checkout próprio + pix). Marketplace só para visibilidade, nunca como canal de receita neste preço.
4. **Mídia paga só como retargeting de audiência quente, a partir do mês ~4** — nunca tráfego frio em escala no ano 1.
5. **Preço de lançamento: Concurseiro R$ 129 · Treino R$ 109** (premium defensável; regime ~R$ 139 / R$ 119–129) `[Daniel · 21/jun/2026]`. *(A justificativa numérica do §5 abaixo é pré-pivô, a R$ 119 — a recalcular pós-cotação; ver banner.)*
6. **Pró-labore na Estratégia B (otimizadora):** reinvestir 100% no ano 1, iniciar a retirada só no ano 2 (R$ 500 → R$ 2.000 por sócio) e ampliar no ano 3. Mantém ~R$ 17 mil no negócio no ano mais frágil — e, ainda assim, paga mais aos sócios em 3 anos (R$ 102 mil vs R$ 64 mil da Estratégia A). **Pré-condição: os sócios precisam de outra renda no ano 1.**

**Por que isto se sustenta apesar do mercado "pequeno" no ano 1:** o SOM do ano 1 (≈ 200–600 un Concurseiro / 150–500 un Treino, **combinados ~350–1.100 un**) `[estimativa triangulada, mercado-demanda.md]` é limitado por **capacidade de aquisição**, não por tamanho de mercado — que é grande e persistente (4–6 M concurseiros que estudam ~2 anos; 13–15 M praticantes de academia). É um negócio que **começa pequeno e honesto e escala em 2027** (ver §3 e §10) — e, por ser **recorrente** (recompra 3–4×/ano), cada cliente conquistado vale ~R$ 374–397 de margem ao longo do tempo (LTV), não só a 1ª venda.

> **⚠️ Premissa crítica a confirmar ANTES de comprometer capital.** O custo do micro-lote (R$ 55/un) é faixa de mercado `[a confirmar]`, não orçamento fechado. Se a gráfica cobrar ~R$ 65/un, R$ 3.000 compram só ~46 un e o break-even do 1º lote fica inviável. **Ação nº 1: fechar 3 orçamentos reais de gráfica antes de imprimir** (ver §7 e §9).

---

## 2. Produto & proposta de valor

Dois SKUs sobre a **mesma plataforma física** (reduz custo de insumo e MOQ): **A5, wire-o capa dura, perpétuo (sem datas)**, miolo offset 90 g, capa soft-touch + hot stamping.

- **Concurseiro** — não é agenda, é um **sistema de estudo**: grade de **ciclo** (compromete/adapta o plano — não gera cronograma datado nem edital verticalizado, que ficam no digital), registro diário (matéria/tempo/questões/% acerto), **decisão de revisão** (o quê e quando revisar; a execução fica no Anki), tracker de simulados, página de constância.
- **Treino de Força** — não é caderno, é um **diário de periodização**: bloco/mesociclo, template de sessão (séries×reps, **carga, RPE/RIR**, descanso), PRs, tonelagem, *deload*, métricas corporais.

**Por que perpétuo (decisão crítica):** zero obsolescência de ano, zero estoque morto, venda o ano inteiro. E casa com o comportamento real do cliente: o concurseiro **estuda em média 2 anos e 1 mês** `[confirmado — Censo dos Concursos 2025, n=13.128]` e o praticante de força periodiza em ciclos contínuos — ambos têm horizonte plurianual, que um produto datado atende mal.

**Ativo já existente:** o conteúdo/miolo dos planners já está rascunhado pelos sócios — acelera o protótipo e o golden sample.

---

## 3. Mercado & cliente (ICP)

### 3.1 Concurseiro — grande, recorrente e estruturalmente persistente

- **Base ativa:** **4–6 milhões** de concurseiros únicos `[estimativa triangulada]` (9.581 concursos abertos em 2025, +57% vs 2024; CNU 2024 teve 2,14 M inscritos) `[confirmado — MGI/Folha Dirigida]`.
- **Demanda é estoque, não fluxo:** o candidato **estuda ~2 anos** `[confirmado — Censo 2025]`; 67,8% estudam empregados → demandam organização de longo prazo. A base é relativamente estável: cada ano parte é absorvida e nova entra.
- **Gasto médio anual com preparação:** ~R$ 2.011 (média; mediana ~R$ 800–1.200) `[confirmado — Censo 2025]`. Plataformas: Gran R$ 838/ano, QConcursos Elite R$ 779/ano `[confirmado, jun/2026]`.
- **Validação de categoria:** o Planner do Concurseiro (Juspodivm) existe, custa R$ 119,90 e tem 177 avaliações 99% positivas `[confirmado, jun/2026]` — o mercado **paga por método no papel**.

> **⚠️ Correção importante de leitura (vs. rascunho original).** Não haverá CNU em 2026, mas **isso não é fraqueza de demanda — é uma vedação legal de ano eleitoral**: a Lei 9.504/97 (art. 73, V) proíbe nomeações de **4/jul/2026 a ~25/jan/2027** (3 meses após o 2º turno previsto), e a LRF (art. 21) veda aumento de despesa de pessoal nos 180 dias finais de mandato `[confirmado]`. Editais, provas e homologações continuam o ano todo. O **ciclo pós-eleição (2027) historicamente retoma com força** — em 2023, após a eleição de 2022, foram **9.116 vagas federais autorizadas, +47% que os 4 anos anteriores somados**; a PLOA 2026 já prevê ~89 mil provimentos e o **CNU 3ª edição é previsto para 2027** `[a confirmar — sinalizado por fontes de cursinhos; sem decreto publicado]`. Enquadramento **apartidário**: o padrão vale para qualquer vencedor. **Conclusão estratégica: 2026 = construir audiência e validar; 2027 = escalar no vento de cauda.**

- **ICP:** concurseiro de alto desafio (Senado, Câmara, tribunais, fiscais, polícias), 25–40 anos, estuda 15–30 h/semana, já gasta com cursos, valoriza método e estética, ativo em comunidades (Instagram, Telegram, fóruns).
- **TAM/SAM/SOM** `[estimativa triangulada, mercado-demanda.md]`: TAM material físico R$ 300–800 M/ano · **SAM (compraria planner ~R$ 110) R$ 35–80 M/ano** (~400–700 k pessoas; usa proxy de renda familiar — pode estar ~14% superestimado, imaterial ao SOM) · **SOM ano 1 R$ 24–71 k (200–600 un); ano 2 R$ 95–238 k (800–2.000 un)**.

### 3.2 Treino de Força — *whitespace* nacional (não identificado em buscas)

- **Base:** 41–63 mil academias (2º maior parque mundial); **13–15 M membros ativos** (7% de penetração, +50% desde 2019) `[confirmado — HFA/Panorama Fitness 2025]`; 6–7 M com foco em musculação; **1,3–3 M** seguem treino periodizado/sério `[estimativa]`.
- **Registro de treino (proxy de demanda):** Hevy 14 M+ atletas globais, Strong 5 M+ `[confirmado]`. Dado BR específico é pago `[a confirmar]`.
- **Gap de mercado:** **não foi identificado diário de periodização nacional com marca** em buscas `[estimativa — buscas não alcançam D2C puro via Instagram/Telegram; jun/2026]`. A concorrência é importada (R$ 130–200 no Brasil) ou app (R$ 130–165/ano). Menos concorrência, menos âncora de preço, mais espaço de marca — e **recompra** (logbook "acaba").
- **ICP:** praticante intermediário/avançado, 25–45 anos, treina 3–6×/semana, segue periodização, gosta do registro analógico, ativo em comunidades fitness/força.
- **TAM/SAM/SOM** `[estimativa triangulada]`: **SAM R$ 15–40 M/ano** (~150–370 k pessoas) · **SOM ano 1 R$ 16–54 k (150–500 un); ano 2 R$ 65–196 k (600–1.800 un)**.

### 3.3 Por que a sequência Concurseiro (F1) → Treino (F2)

Lançar os dois em paralelo seria a decisão natural — compartilham a plataforma física (mesmo formato, papel e encadernação → MOQ e custo de insumo conjuntos) e os sócios vivem os dois nichos. Porém a restrição de capital (R$ 5.000) e foco de conteúdo levaram à decisão de sequenciar: **Concurseiro (F1) primeiro** — SAM maior (~2× o do Treino), validação mais rápida — e **Treino na F2, financiado pelo caixa gerado**. O conteúdo de Treino pode ser construído em paralelo para preparar o lançamento de F2. `[Daniel · 21/jun/2026]`

---

## 4. Análise competitiva & posicionamento (April Dunford)

| Etapa | Concurseiro | Treino de Força |
|---|---|---|
| **Alternativas** | Juspodivm (R$ 85–120, **datado**); perpétuos sem marca (Tche Decor R$ 71–77); PDFs (R$ 35–60); agendas genéricas (R$ 28–57); apps/planilhas | Logbooks importados (R$ 130–200 no BR); nacional genérico (Amor Impresso R$ 77–85, **sem periodização**); apps Strong/Hevy (R$ 130–165/ano); Canva; caderno comum |
| **Atributos únicos** | Ciclo + **decisão de revisão** (papel decide, Anki executa); **perpétuo** (vs. Juspodivm datado); feito por quem é concurseiro **e** atleta; acabamento premium | Periodização + RPE/RIR + PRs + tonelagem (não só "registro"); **perpétuo**; **único premium nacional**; tátil (não depende de tela na academia) |
| **Valor** | Estudar com método e constância sem montar planilha; sem comprar exemplar novo todo ano | Progredir carga com método sem celular na academia; rápido, durável; economiza vs. assinatura de app |
| **Cliente best-fit** | Concurseiro de alto desafio, focado em método e estética | Praticante sério de força, orientado a progressão |
| **Categoria** | "Planner-sistema de estudo para concursos" | "Diário de força com periodização" |

**Mapa de preço (mercado, jun/2026):**

| Faixa | Produto | Preço | Nosso posicionamento |
|---|---|---|---|
| Genérico | Agendas/cadernos | R$ 28–64 | abaixo da nossa qualidade |
| **Premium de marca** | Juspodivm (datado) / nacional fitness | R$ 77–120 | **nós: R$ 109–129** (Treino R$ 109 · Concurseiro R$ 129), no vão superior entre premium de marca e topo importado |
| Topo | Importados / apps premium | R$ 130–200 | teto da categoria |

**Ponto cego que ocupamos:** produto **físico, nacional, com método especializado, perpétuo**, na faixa R$ 109–129 (Treino R$ 109 · Concurseiro R$ 129). O Juspodivm prova que pagam R$ 85–120 por método (mas é datado); os importados provam R$ 130–200 (mas têm barreira/idioma); os apps provam R$ 130–165/ano (mas com fricção recorrente e sem tangibilidade). A R$ 129, o Concurseiro está no teto do Juspodivm — posicionamento claro como premium, não apenas "no vão".

---

## 5. Estratégia de preço

> **⚠️ DESATUALIZADO (pré-pivô).** O preço de lançamento do Concurseiro é **R$ 129** `[Daniel · 21/jun/2026]` (regime ~R$ 139). A análise abaixo (eixos, MC/un) foi feita a **R$ 119** e **será refeita pós-cotação** pelo `financial-modeler`. Mantida como baseline.

**Concurseiro R$ 119 · Treino R$ 109** (preço de lançamento — *baseline pré-pivô*). Justificativa em três eixos `[concorrencia-preco.md]`:

1. **Factível para o consumidor.** Concurseiro: paridade com o Juspodivm (R$ 85–120), com o argumento "perpétuo" (no 2º ano o custo amortizado tende a zero vs. recomprar o datado). Treino: 15–30% abaixo dos importados e sem a renovação anual dos apps; o premium de ~R$ 25–32 sobre o nacional genérico (R$ 77–85) se paga pelo método de periodização, que a concorrência nacional não tem. WTP triangulada: R$ 80–130 nos dois nichos; teto psicológico ~R$ 130.
2. **Viável para o negócio.** A R$ 114 (médio), no canal direto, a margem de contribuição é **R$ 57,59/un (50%)** `[modelo]`. Cobre o break-even mensal de pró-labore + DAS (~39 un/mês) e absorve um CAC de retargeting com folga.
3. **Sustenta o CAC.** Margem de R$ 57,59 comporta CAC ≤ R$ 50 — atingível só por **retargeting de audiência quente**, não por tráfego frio (R$ 120–333). Por isso a sequência é: audiência orgânica primeiro, mídia paga depois.

**O alerta decisivo — marketplace destrói a margem neste preço** `[modelo · canal-aquisicao.md]`:

| MC/un a preço médio R$ 114 | Canal direto | Mercado Livre (Clássico) | Shopee |
|---|---|---|---|
| Custo de canal | ~3% (pagamento) | ~14% + frete R$ 18 | 14% + **R$ 20 fixos** + frete |
| **Margem de contribuição/un** | **R$ 57,59 (50%)** | R$ 26,48 (23%) | **R$ 6,48 (6%)** |

> Correção vs. rascunho: o ML **não cobra taxa fixa** acima de R$ 79 e o frete grátis é incentivado, não estritamente obrigatório; a Shopee é que aplica R$ 20 fixos na faixa R$ 100–199,99 (≈31% de custo de canal efetivo). **Vender direto na Fase 1**; entrar em marketplace só para descoberta/prova social, e a preço de regime (≥ R$ 129–139) na Fase 2.

**Preço de regime (após validação + reviews):** Concurseiro R$ 129–139 · Treino R$ 119–129.

---

## 6. Go-to-market & aquisição — *a seção que decide o negócio*

O desafio nº 1 é **construir distribuição** — e aqui está a maior vantagem do projeto: a sócia responsável por isso tem **viralização comprovada** (milhões de views) e o caminho é o **orgânico**, que é o forte dela. A audiência atual é de outros nichos, então é preciso construir presença em concurso/treino — mas a **habilidade** (a parte difícil) já existe. O tráfego pago frio não se paga numa venda isolada; com a **recompra** (LTV ~R$ 374–397), porém, ele passa a caber na escala, como reforço do orgânico.

**Realidade da aquisição** `[estimativa, canal-aquisicao.md]`:
- CAC de tráfego frio (CPC ÷ conversão): **R$ 120–333/venda** — inviável contra margem de R$ 57.
- Margem só comporta CAC ≤ R$ 50 → **só retargeting/lookalike de audiência quente**, que exige audiência primeiro.
- Construir audiência orgânica: **~1.000 seguidores em 3–6 meses; ~10.000 em 12–24 meses** em nicho de concurso/força, com produção consistente (Reels/TikTok + carrosséis).
- Meta Ads tem **+12,15% de tributos na fatura** desde jan/2026 — orce com folga.
- ⚠️ "CAC orgânico ≈ R$ 0" é em **dinheiro** — custa **tempo dos sócios** (~2–3 h/dia). Na Estratégia B recomendada (§8.1), esse tempo é **reinvestimento**: os sócios não retiram pró-labore no ano 1.

**Sequência (Fase 0 → Fase 1):**
1. **Mês 1–2 — construção de audiência + lista de espera.** Conteúdo orgânico equilibrado nos dois nichos (os sócios são o público); landing page de captura; *seeding* de unidades-amostra a 6–10 micro-perfis. Meta: **200–500 inscritos** antes de imprimir.
2. **Mês 3 — golden sample + abertura de vendas** (checkout próprio + pix, sem pré-venda prévia ao lote). Imprimir o micro-lote somente após Gate A (≥ 200–500 na lista de espera), vendendo imediatamente a partir da entrega física. Controle de risco pelo tamanho do lote (~54 un) e pelo perpétuo (estoque não vence).
3. **Mês 4+ — retargeting** (R$ 300–500/mês) sobre visitantes/seguidores; **afiliados/micro-influenciadores** de nicho (melhor ROI que tráfego frio para produto físico de ticket médio).

**Mix orgânico/pago defensável no ano 1** `[canal-aquisicao.md]`: M1–3 100% orgânico · M4–6 80% orgânico + 20% retargeting · M7–12 70% orgânico + 20% afiliados + 10% pago experimental.

**Uso dos R$ 5.000:**

| Item | R$ | Nota |
|---|---|---|
| Material / 1º lote | 3.000 | ~54 un (custo teto 4/4 R$ 55; com 2/2 paleta fria R$ 36–47 → ~64–83 un) |
| Conteúdo + amostras + *seeding* | 800 | fotos, brindes a micro-perfis |
| Mídia paga (retargeting, a partir do mês 4) | 800 | **não** tráfego frio |
| Reserva operacional | 400 | embalagem, frete-teste, checkout |
| **Total** | **5.000** | reinveste 100% por 4 meses |

**Métricas e *gates* do teste pago (quando ligar retargeting):**

| Métrica | Meta | Gate |
|---|---|---|
| Lista de espera pré-lançamento | ≥ 200–500 | < 100 → adiar impressão, focar conteúdo |
| CTR (retargeting) | ≥ 1% | < 0,7% → trocar criativo |
| CAC realizado | ≤ R$ 45 | > R$ 60 consistente → **pausar pago, focar orgânico** |
| ROAS na janela | ≥ 2,5× | < 2× → reavaliar oferta |

---

## 7. Operações & fornecimento (resumo — detalhe na consultoria de sourcing)

- **Veículo legal:** **MEI** na Fase 1 (DAS ~R$ 81/mês `[a confirmar 2026 com contador]`; venda doméstica sem ICMS/II por unidade). Teto ~R$ 81 mil/ano: o SOM do ano 1 (R$ 40–130 mil) pode encostar no teto no cenário otimista → **migrar para ME/Simples** ao se aproximar. Atenção: como MEI o ICMS de importação **não é creditável** (piora a conta da China).
- **Produção Fase 1:** **gráfica nacional** (MOQ baixo, prazo 6–8 semanas, sem fricção de importação). Custo/un micro-lote estimado: **4/4 R$ 43–55 · 2/2 (paleta fria Y=0) R$ 36–47** `[estimativa triangulada · 21/jun/2026]`; reposição (300 un) estimada ~R$ 36–45/un conforme palette. A confirmar por 3 orçamentos reais `[a confirmar, sourcing-tributos.md]`.
- **Produção Fase 2:** **China**, mas **só a partir de ~3.000–5.000 un** (conforme o tier de gráfica BR — premium vs. offset) — é onde o landed cost (com AFRMM 8% e ICMS por dentro) finalmente bate a gráfica BR. Abaixo disso, BR ganha ou empata. Exige CNPJ + Radar/Siscomex + despachante.
- **Fulfillment:** expedição própria via Correios/Melhor Envio; **cliente paga o frete** no canal direto (premissa do modelo; *free shipping* opcional testável na aba Sensibilidade).
- **Fluxo:** audiência → golden sample → Gate A (lista ≥ 200–500) → micro-lote → abertura de vendas → expedição → feedback → reposição *make-to-demand*.

---

## 8. Plano financeiro (resumo do modelo `viabilidade-planners-v2.xlsx`)

**Unit economics (preço médio R$ 114, custo reposição R$ 45):**

| | Direto | Merc. Livre | Shopee | Blended (90/10) |
|---|---|---|---|---|
| Margem de contribuição/un | **R$ 57,59** | R$ 26,48 | R$ 6,48 | **R$ 54,48** |
| Margem (%) | 50% | 23% | 6% | 48% |

> *Composição por canal (por un, a R$ 114): **direto** deduz ~R$ 11 (pagamento 2,5% + embalagem R$ 4 + devoluções 4%); **Mercado Livre** soma comissão ~14% + frete ~R$ 18; **Shopee** ainda inclui taxa fixa de R$ 20 — por isso sua MC cai a R$ 6,48.*

**Recorrência (o que muda o jogo):** o produto é consumível — o concurseiro recompra **3–4×/ano**. Isso eleva o **LTV** para **~R$ 374–397 de margem por cliente** (LTV/CAC ~7–8× no orgânico) e faz da recompra o motor de receita a partir do ano 2. Em fluxo, o mercado é de **~2,3 M un/ano** (ver estudo de mercado §4.5 e aba `LTV & Recorrência`).

**Cenários (ano 1, R$ 5.000) — com dupla linha de resultado:**

> **DESATUALIZADO / a recalcular pós-cotação @ R$ 129 [21/jun/2026].** Tabela calculada a preço médio R$ 109–119 (pré-pivô). Com Concurseiro F1 a R$ 129 e custo triangulado 4/4 R$ 43–55 / 2/2 R$ 36–47, todos os cenários e o ROI (94% / 325% / 762%) precisam ser recalculados. Mantidos como referência histórica — não usar como fechados.

| | Conservador | Base | Otimista |
|---|---|---|---|
| Unidades no ano / preço médio / custo | 180 / R$ 109 / R$ 52 | 360 / R$ 114 / R$ 45 | 650 / R$ 119 / R$ 40 |
| % direto | 80% | 90% | 95% |
| **Caixa gerado ANTES do pró-labore** | **+R$ 4,7k** | **+R$ 16,2k** | **+R$ 38,1k** |
| ROI do capital (antes / s/ R$ 5k) | 94% | **325%** | 762% |
| (−) Pró-labore — **Estratégia A** (8 meses × R$ 2k) | −R$ 16k | −R$ 16k | −R$ 16k |
| **Resultado DEPOIS do pró-labore** | **−R$ 11,3k** | **+R$ 0,2k** | **+R$ 22,1k** |

> **Como ler as duas linhas.** "Antes do pró-labore" = o caixa que o **negócio** gera (recupera os R$ 5 k com folga já no base). "Depois do pró-labore" = se o negócio **banca os dois sócios** (Estratégia A, R$ 2 k/mês a partir do mês 5). O Conservador (volume baixo + custo alto + venda fraca) consome a reserva: o antídoto é a disciplina de aquisição.

### 8.1 Estratégia de pró-labore: A (antecipada) × B (otimizadora) — recomendamos a B

Quanto e **quando** os sócios retiram pró-labore quase não mexe na margem, mas muda muito a **velocidade de capitalização** no ano mais frágil. Duas estratégias (aba `Pró-labore (AxB)`, com a **mesma** trajetória de vendas nas duas):

- **A — antecipada:** R$ 2.000/mês (R$ 1.000 por sócio) desde o mês 5. Dá renda cedo, mas deixa só ~R$ 1,2 mil no negócio no ano 1.
- **B — otimizadora (recomendada):** **ano 1 reinveste 100%** (pró-labore zero); no **ano 2** a retirada sobe de **R$ 500 → R$ 2.000 por sócio**; no **ano 3**, um pró-labore maior porém calibrado (≈ R$ 3.000 por sócio), preservando caixa para a escala (lote China).

| Indicador (3 anos, base) | Estratégia A | Estratégia B |
|---|---|---|
| Sócios começam a receber | mês 5 | **ano 2 (mês 13)** |
| Pró-labore no ano 1 | R$ 16 mil | **R$ 0** |
| **Caixa reinvestido no negócio — ano 1** | R$ 1,2 mil | **R$ 17,2 mil** |
| Pró-labore acumulado aos sócios — 3 anos | R$ 64 mil | **R$ 102 mil** |
| Caixa do negócio acumulado — 3 anos | R$ 211 mil | R$ 174 mil |

**Por que a B é melhor para "construir para escalar":** mantém **14× mais caixa no negócio no ano 1** — quando o capital constrói audiência, financia lotes maiores e aproxima o limiar da China (≥ 3.000 un) — e **ainda paga mais aos sócios em 3 anos**, porque deixa o negócio compor antes de remunerar. O preço da B é a disciplina: **renda zero para os sócios no ano 1** (exige outra fonte de renda nesse período). Se isso não couber no orçamento pessoal, a **A** é o fallback — paga cedo, ao custo de um crescimento mais lento. *(A trajetória é mantida igual nas duas; o reinvestimento extra da B tende a elevar ainda mais o crescimento — ou seja, a comparação é conservadora a favor da B.)*

**Projeção 12 meses (base, sob a Estratégia A):** ramp do zero (M1–2 sem venda, lançamento no M3), **387 un no ano**; o negócio passa a **cobrir o pró-labore por volta do mês 9–10**; resultado acumulado após pró-labore cruza zero ao fim do ano (+R$ 1,0k) e o **caixa operacional antes do pró-labore soma ~R$ 17 k** (recupera o investimento com folga). *(Ajuste "Unidades" e "Marketing" na aba "Projeção 12M".)*

**Onde o lucro escala:** a **recompra** (cada cliente retido gera ~3 vendas/ano sem novo CAC), a reposição com margem cheia, a **migração para a China na Fase 2** (≥ 3.000–5.000 un) e o **vento de cauda do ciclo de concursos em 2027**.

**Premissas-chave e fontes (datadas, jun/2026):** câmbio ≈ R$ 5,18 (Investing.com, 17/jun); concorrência Juspodivm R$ 85–120 / importados R$ 130–200 (Amazon); taxas ML 11–19% sem fixa ≥R$79 e Shopee 14% + R$ 4–26 fixos (XP, Tributei, E-commerce Brasil); Meta Ads CPC R$ 0,80–5, conversão 1,2–2,2%, +12,15% tributos (Trafius, aintegrare, E-Dialog); mercado (Censo dos Concursos 2025; HFA/Panorama Fitness 2025). Detalhe em `research/evidence/`.

---

## 9. Riscos & mitigações

| Risco | Sev. | Mitigação |
|---|---|---|
| **Distribuição/aquisição nos nichos** (risco nº 1) | Média | **Conteúdo orgânico — forte da sócia (viralização comprovada)**; lista própria pré-lançamento; recompra eleva o LTV (CAC pago cabe na escala); afiliados de nicho |
| **Custo real da gráfica acima do previsto** | Alta | **3 orçamentos reais antes de comprometer capital**; se micro-lote > R$ 60/un, recuar para Tier B ou ajustar preço/tamanho do lote |
| Dependência de plataforma de mídia social (algoritmo/ban) | Média-Alta | Diversificar (Instagram + TikTok) e **construir lista de e-mail própria** — o ativo que a plataforma não tira |
| Sell-through baixo → encalhe | Alta | **Micro-lote pequeno (~54 un) como controle de risco**; perpétuo (estoque não "vence"); abrir vendas só após Gate A (≥ 200–500 na lista) |
| Capacidade de execução (2 pessoas, sem força em mídia/ops) | Média | Calendário de conteúdo enxuto e reaproveitável; terceirizar/aprender ops e tráfego só quando houver caixa |
| Marketplace corrói margem | Média | Vender direto na Fase 1; marketplace só p/ descoberta, a ≥ R$ 129 |
| Frete grátis corrói margem | Média | Cliente paga o frete por padrão; se ofertar frete grátis, **embutir no preço** (senão a MC/un cai de R$ 57 para ~R$ 22–37) |
| Qualidade da gráfica | Média | **Golden sample** aprovado por escrito + prova física antes do lote |
| Teto MEI / tributário | Média | Contador; **gate numérico: ao atingir ~R$ 68 mil de receita acumulada, iniciar migração a ME/Simples** (teto ~R$ 81 mil/ano) |
| Câmbio/qualidade na escala (China) | Média | Só após validação, ≥ 3.000 un; travar câmbio; despachante; inspeção pré-embarque |
| Concorrência reage (Juspodivm/novos) | Baixa-Média | Diferenciação por método + perpétuo + estética; Treino é *whitespace*; marca dos fundadores |

---

## 10. Roadmap & decision gates

- **Fase 0 — Construção (meses 1–3):** conteúdo orgânico (foco no Concurseiro, F1) → lista de espera → golden sample → **abertura de vendas após Gate A** (sem pré-venda).
  - **Gate A:** ≥ 200–500 inscritos na lista de espera **e** engajamento ativo (DMs, comentários pedindo compra) **e** 3 orçamentos de gráfica fechados (custo/un confirmado) **e** golden sample aprovado → imprimir o micro-lote e abrir vendas imediatamente.
- **Fase 1 — Validação (meses 4–12):** vender ~387 un **direto**; ligar retargeting (mês 4+); medir sell-through, CAC, recompra/indicação. **Estratégia B: pró-labore zero no ano 1** (reinveste 100%).
  - **Gate B:** sell-through ≥ 75% **e** CAC ≤ R$ 45 → reordenar lote maior no Brasil (300–500 un), ampliar conteúdo e **iniciar o pró-labore no ano 2** (R$ 500 → R$ 2.000 por sócio).
- **Fase 2 — Escala autofinanciada (a partir de ~2027, com capital + dados):** surfar a **retomada do ciclo de concursos**; escalar em **lotes BR (offset) crescentes, pagos pela receita** (já ~R$ 18–32/un no volume); **importar da China só ao cruzar o gatilho de capitalização** — caixa acumulado ≥ custo do lote + colchão de 3 meses (100% próprio, ~R$ 135 mil; fim do ano 3/ano 4), **sem pré-venda e sem empréstimo**; abrir CNPJ + Radar quando importar; marketplace como canal de volume (preço de regime); **ampliar o pró-labore no ano 3** (≈ R$ 3.000 por sócio); avaliar 3º SKU.
  - **Gate C (capitalização):** comprometer lote de importação **somente** com caixa ≥ lote + colchão **e** volume sustentado ≥ ~5.000 un/ano (onde a China vence claramente). Até lá, BR offset autofinanciado.

---

## 11. KPIs a acompanhar

Lista de espera (pré-lançamento) · sell-through % do lote · **unidades/mês vs. break-even de pró-labore (39)** · CAC e ROAS realizados · margem de contribuição realizada por canal · taxa de recompra/indicação · % vendas diretas vs. marketplace · caixa operacional acumulado · seguidores e engajamento orgânico por nicho.

---

*Documento interno de apoio à decisão dos sócios. Custos de produção a confirmar por orçamento de gráfica; tributos/MEI por contador; alíquotas de importação por despachante. Números do cenário-base correspondem a `models/viabilidade-planners-v2.xlsx`. Não constitui recomendação financeira. Metodologia e fontes datadas em `research/evidence/` e `docs/methodology.md`.*
