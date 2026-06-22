# Consultoria de Sourcing & Desenvolvimento de Produto — Projeto Planners
### Concurseiro (F1) e Treino de Força (F2) — sourcing, RFQ e ficha técnica por fase

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

**Escopo:** decisão de fornecimento, economia de importação, RFQ, controle de qualidade e arquivos print-ready.
**Local:** Brasília/DF · **Data:** 19/jun/2026 · **Câmbio de planejamento:** USD/BRL ≈ R$ 5,20.
**Base de evidências:** `research/evidence/sourcing-tributos.md` (alíquotas e custos datados, jun/2026).

> **Aviso tributário decisivo.** Planner/agenda **não** tem a imunidade de livro (CF art. 150). Classifica-se como "agendas e artigos semelhantes" — **NCM 4820.10.00**, produto **tributado** na importação. Toda a conta da rota China parte daí. Marcações: `[confirmado]` · `[estimativa]` · `[a confirmar com despachante]`.

---

## 1. Resumo executivo (decisão final)

**Parâmetros:** orçamento ~R$ 3 mil/SKU no 1º lote · prazo 30–60 dias · formato **perpétuo (sem datas)**.

### Veredito: **Brasil na Fase 1. China só na Fase 2 — e a partir de ~3.000–5.000 un, não 1.000.**

Dois motivos eliminatórios para a China no início:

1. **O orçamento não alcança o MOQ chinês com vantagem.** Abaixo de ~500 un, a China cai no **regime de remessa** (II de 60%), que inviabiliza revenda. E mesmo em 1.000 un, o landed cost real **empata** com a gráfica BR (ver §4–5).
2. **O prazo não comporta frete marítimo.** Produção China 30–60 dias **+** navio 30–45 dias = 60–105 dias só de logística. A **gráfica BR fecha em 6–8 semanas com folga.**

> **⚠️ Correção vs. rascunho original.** O rascunho colocava o ponto de virada da China em ~1.000 un. Com a conta refeita (AFRMM correto de **8%**, não 25%; frete LCL real; ICMS-DF "por dentro"; e **ICMS não creditável no MEI/Simples**), o **crossover real é ~3.000–5.000 un** (conforme o tier de gráfica BR: ~3.000 contra gráfica premium; ~5.000+ contra offset de baixo custo) `[sourcing-tributos.md]`. Isso reforça: **ficar no Brasil por mais tempo.**

**Perpétuo** é a decisão certa: estoque nunca "vence", então micro-lotes pequenos são viáveis sem risco de encalhe. **Decisão travada: sem pré-venda na Fase 1.** `[Daniel · 21/jun/2026]`

### Plano em fases (risco assimétrico)

| Fase | O quê | Volume | Rota | Capital |
|---|---|---|---|---|
| **0 — Validação** | Lista de espera + golden sample + abertura de vendas pós-lote | — | Gráfica BR (POD) | mínimo |
| **1 — 1º lote comercial** | Micro-lote + reposição *make-to-demand* | ~54 → 300–500 un | **Gráfica BR** | ≤ R$ 3k/SKU |
| **2 — Escala** | Reposição com margem maior | **~3.000–5.000 un** (varia por tier de gráfica BR) | **China (importação formal)** | CNPJ + Radar + capital |

> O 1º lote **não é o negócio** — é experimento pago para **provar demanda, gerar conteúdo de unboxing e financiar a Fase 1**.

---

## 2. Quanto R$ 3k compram no Brasil (A5 wire-o capa dura, perpétuo, ~190 pp)

| Tier | Especificação | Custo/un¹ | Unidades por R$ 3k | Preço de venda sugerido |
|---|---|---|---|---|
| **A — Premium** | Capa dura + wire-o + soft-touch + hot stamping + elástico | R$ 50–60 | **~50–60** | R$ 120–150 |
| **B — Intermediário** | Capa dura + wire-o + laminação fosca, sem hot stamping/elástico | R$ 40–52 | **~58–75** | R$ 95–120 |
| **C — Enxuto** | Capa flexível premium (300 g + lam.) + espiral, miolo 90 g | R$ 18–30 | **~100–160** | R$ 70–95 |

¹ Faixa de mercado **a confirmar nas 3 cotações** — micro-lote (<100 un) sai no topo da faixa; cai com volume `[a confirmar, sourcing-tributos.md]`.

**Recomendação: Tier A ou B.** Os nichos pagam premium e valoram acabamento; produto bonito gera conteúdo, que é o que vende (o conteúdo orgânico é o motor de aquisição — ver business plan §6). O Tier C maximiza unidades, mas dilui o posicionamento. **Modelo financeiro usa custo micro-lote R$ 55 (Tier A/B), caindo a R$ 45 na reposição.**

**F1:** orçamento ~R$ 3–5k para o Concurseiro (lote inicial). **F2:** ao ativar o Treino (pós-gatilho ~R$ 135k ou caixa gerado), padronizar formato/papel/encadernação com o Concurseiro reduz MOQ e custo (compra conjunta de insumos).

---

## 3. Fichas técnicas (proposta — ajuste o que divergir)

Padrão de mercado premium, ambos **perpétuos**. Para F2 (quando Treino for ativado): padronizar formato/papel/encadernação com o Concurseiro reduzirá MOQ e custo (compra conjunta de insumos).

### Planner 1 — Concurseiro

| Item | Especificação | Trade-off |
|---|---|---|
| Formato | A5 (148×210 mm) | Padrão premium e barato de enviar; menor aperta a grade de estudo |
| Encadernação | **Wire-o**, capa dura | Abre 180°/*lay-flat* (essencial p/ escrever); espiral é mais barata e menos premium |
| Miolo | ~112 pp, **Polen Bold 90g creme** | 90 g evita transparência da caneta; 75 g "vaza". Polen Bold é linha Suzano — confirmar disponibilidade e preço na gráfica escolhida. |
| Capa | Cartão empastado + **soft-touch** + **hot stamping** | Soft-touch escurece a cor → peça prova física; verniz localizado é alternativa mais barata |
| Acabamentos | Elástico + marcador de fita + cantos arredondados | Cada acabamento sobe custo e MOQ na China |
| Conteúdo | Grade de ciclo (não cronograma fixo) · registro diário (tópico, tempo, nº questões, % acerto) · **ponteiros para sistema de revisão** (→ Anki / QConcursos) · registro simplificado de questões (tracker completo fica no digital) · visão semanal/mensal · página de constância | — |

### Planner 2 — Treino de Força

| Item | Especificação | Trade-off |
|---|---|---|
| Formato | A5 (148×210) **ou** 17×24 cm | 17×24 dá mais espaço de tabela de cargas, mas encarece e pesa no frete |
| Encadernação | **Wire-o**, capa dura | *Lay-flat* inegociável na academia; durabilidade importa mais aqui |
| Capa | Cartão + **soft-touch** (ou PU) resistente | Ambiente de academia → priorize resistência a suor/atrito |
| Miolo | ~160–200 pp, **offset 90 g** | Igual ao P1 para ganho de escala na compra de papel |
| Conteúdo | Perfil/1RM e metas · **periodização** (mesociclo/semana/foco) · template de sessão (exercício, séries×reps, **carga, RPE/RIR**, descanso, notas) · registro de PRs · tonelagem/volume · marcadores de *deload* · métricas corporais · calendário semanal/mensal · páginas de protocolo (ladders/EMOM) | — |

---

## 4. Decisão de fornecimento — Gráfica BR × China

### 4.1 Comparativo nas 4 dimensões (nota 1–5)

| Dimensão | Gráfica BR | China | Vencedor |
|---|---|---|---|
| **(a) Fidelidade ao que peço** | 4/5 — acompanhamento próximo, português, revisão de prova rápida | 3/5 — ODM excelente, mas exige *dieline*, prova física e gestão de cor à distância | **BR** (no início) |
| **(b) Praticidade** | 5/5 — sem importação/despachante, MOQ de 1–100 un, pix | 2/5 — Alibaba, amostra, Incoterm, despachante, Radar/Siscomex, lead 30–60 dias | **BR** |
| **(c) Preço (landed cost)** | 3/5 — caro em volume baixo, melhora pouco na escala | 5/5 — domina **só a partir de ~3.000 un** | **China** (na escala) |
| **(d) Risco** | 5/5 — sem risco cambial/aduaneiro/lead; pouco capital em jogo | 2/5 — câmbio, qualidade à distância, desembaraço, lote grande imobilizado | **BR** |

### 4.2 Custo unitário — China landed × Gráfica BR por volume `[estimativa triangulada; BR a confirmar por orçamento]`

| Volume | China — regime | China FOB US$/un | **China landed R$/un¹** | **Gráfica BR R$/un²** | Vencedor |
|---|---|---|---|---|---|
| 50–100 (piloto) | Remessa/courier | 3,50–4,50 | ~48–53 (II 60%) | R$ 40–65 | **BR (claro)** |
| 300 | Formal | 3,50 | **~R$ 61** | R$ 32–50 | **BR** |
| 500 | Formal | 3,20 | **~R$ 47** | R$ 28–45 | **Empate** |
| 1.000 | Formal | 3,00 | **~R$ 37** | R$ 22–38 | **Disputado** |
| 3.000 | Formal | 2,30 | **~R$ 24** | R$ 18–32 | **China** |
| 5.000+ | Formal | 1,80 | **~R$ 18** | R$ 18–30 | **Empate/China** |

¹ **Importação formal**, câmbio R$ 5,20, com a conta de §5. Em 300 un o landed sobe (R$ 61) porque o frete LCL e o despachante se diluem em poucas unidades. ² Faixa de gráfica digital/POD em volume baixo; offset a partir de 500 un.

**Leitura central:** o FOB chinês *parece* 3–4× mais barato, mas a carga de importação (≈ **2,0–2,4× o FOB**, e **2,5–2,7× como MEI** por o ICMS não ser creditável) faz o **landed convergir com a gráfica BR até ~1.000 un**. A China só abre vantagem clara **a partir de ~3.000 un**. Abaixo de ~500 un, a China força o regime de remessa com **II de 60%** — inviável para revenda.

---

## 5. A conta do landed cost (importação formal — 1.000 un, FOB US$ 3,00) `[sourcing-tributos.md]`

| Componente | R$/un | Base |
|---|---|---|
| FOB | 15,60 | — |
| Frete marítimo LCL | 4,16 | rateio do contêiner |
| **CIF (base de cálculo)** | **19,81** | FOB + frete + seguro |
| (+) II 14,4% | 2,85 | × CIF |
| (+) IPI 9,75% | 2,21 | × (CIF + II) |
| (+) PIS/COFINS-Imp 11,75% | 2,33 | × CIF |
| (+) **ICMS-DF 20% "por dentro"** | **7,30** | maior componente `[conferir alíquota vigente — Sefaz-DF/despachante]` |
| (+) AFRMM 8% | 0,33 | × frete marítimo |
| (+) Despachante + armazenagem | 2,00 | rateio |
| **= Landed/un** | **36,83** | **≈ 2,36× o FOB** |

**Alíquotas vigentes (confirmadas jun/2026)** `[confirmado]`: II **14,4%** · IPI **9,75%** · PIS-Imp **2,10%** + COFINS-Imp **9,65%** (= 11,75%) · ICMS-DF **20%** por dentro · AFRMM **8%** sobre o frete marítimo (Lei 14.301/2022 — **não 25%**, como dizia o rascunho).

- **Gecex 852/2026** (fev–mar/2026) elevou o II de 1.000+ NCMs, mas **nos capítulos 84–90** (máquinas/eletrônica) — **o capítulo 48 (NCM 4820.10.00) não foi alterado**; II permanece 14,4% `[confirmado]`.
- **Regime de remessa (courier):** até US$ 50 → **II 20%** + ICMS; US$ 50,01–3.000 → **II 60% (−US$ 20)** + ICMS (PL 3.261/2025, que restauraria isenção de US$ 50, **não aprovado** até jun/2026) `[confirmado]`.
- **Regra de bolso:** landed ≈ **2,0–2,4× o FOB** (importação formal, Lucro Real); **2,5–2,7×** no MEI/Simples (ICMS não creditável). Confirme a alíquota final no **Siscomex Classif / simulador da Receita** e com **despachante** `[a confirmar com despachante]`.
- *Nota metodológica:* a base do ICMS "por dentro" acima inclui o despachante (premissa conservadora — eleva o custo em ~R$ 0,50/un); a composição exata da base deve ser confirmada com o despachante.

**Dados China (MOQ/FOB/lead)** `[estimativa, a confirmar por RFQ]`: FOB planner A5 wire-o capa dura soft-touch custom US$ 1,80–3,99/un · MOQ 300–1.000 un (premium/custom 1.000–3.000) · lead 30–60 dias · amostra US$ 50–150 + frete aéreo (geralmente reembolsável) · frete LCL China→Santos US$ 700–900/embarque.

---

## 6. Playbook de sourcing (passo a passo)

1. **F1: Feche ficha técnica e conteúdo do Concurseiro** antes de cotar — cotação sem spec fechada gera preço inútil. **F2 (futuro):** feche também a spec do Treino de Força quando F2 for ativado — a spec do Treino (§3.2) é preparatória.
2. **Habilite o CNPJ** (MEI já serve para vender na Fase 1; para importação formal na Fase 2, **Radar/Habilitação no Siscomex**, modalidade Expressa cobre importadores pequenos).
3. **Cote no Brasil (3 gráficas)** especializadas em agenda/planner wire-o capa dura. Peça preço para **100 / 300 / 500 / 1.000 un**, prazo e **prova física** (não só PDF). Termos usuais: 50% sinal / 50% na entrega.
4. **Cote na China em paralelo** (Alibaba + Made-in-China) já mirando a Fase 2 (~3.000–5.000 un). Filtre por **Trade Assurance**, anos de operação, fábrica vs. trading. Mesmo RFQ para **5–8 fornecedores**.
5. **No RFQ peça:** FOB **e** CIF (Santos/Itajaí/Paranaguá), MOQ real, preço escalonado (500/1k/3k/5k), lead time, **custo de amostra** e Incoterm.
6. **Incoterm:** comece em **FOB** (você controla frete e desembaraço com despachante) ou peça **DDP** só para enxergar o teto de custo "na porta". Evite EXW no início.
7. **Pagamento:** **T/T 30% sinal / 70% antes do embarque**; prefira **Trade Assurance** ou L/C no 1º pedido. Evite Western Union/PayPal para valores altos.
8. **Amostra/protótipo:** exija **golden sample aprovado por escrito** (cor, gramatura, wire-o, hot stamping) — vira o padrão de aceite do lote.
9. **Inspeção de qualidade (checklist):** cor vs. prova aprovada · gramatura do miolo · alinhamento/firmeza do wire-o · adesão da laminação · hot stamping sem falha · cantos · elástico/fita · esquadro · embalagem individual + master carton. Contrate **inspeção pré-embarque** no 1º pedido China.
10. **Importação (Fase 2):** contrate **despachante aduaneiro** (DUIMP, tributos, **AFRMM 8%** sobre frete marítimo, armazenagem). Some ao landed cost.
11. **Armadilhas comuns:** preço "bom demais" de trading sem fábrica · MOQ que sobe após a amostra · cor que muda com soft-touch (sempre prova física) · lombada/*dieline* errada · câmbio entre cotação e pagamento (trave ou orce com folga) · esquecer AFRMM e despachante na conta.

---

## 7. Preparação de arquivos print-ready

### Checklist de arquivo
- **Sangria (bleed):** 3 mm em todos os lados (confirme — algumas gráficas BR pedem 5 mm).
- **Cor:** **CMYK** (nunca RGB). Pretos de texto em 100% K; Pantone/PMS convertidos ou especificados.
- **Resolução:** imagens a **300 dpi** no tamanho final.
- **PDF:** **PDF/X-1a:2001** ou **PDF/X-4** (pergunte qual o fornecedor prefere). **Fontes incorporadas ou em curvas.**
- **Perfil ICC:** Coated FOGRA39 ou o do fornecedor — peça o perfil deles.
- **Arquivos separados:** **miolo** (páginas individuais, em ordem, não em *spreads*) + **capa** (frente + lombada + verso num só, com a **largura da lombada calculada pelo nº de páginas** — fórmula vem do fornecedor) + **guarda** (se capa dura).
- **Gabarito/dieline:** **peça o *dieline* da capa wire-o capa dura ao fornecedor** antes de fechar a arte — o empaste com cartão tem medidas próprias.
- **Marcas:** corte e registro; prova de cor, idealmente **física** (soft-touch escurece a cor).

### Anexo — Ficha técnica (RFQ) para enviar ao fornecedor
```
PRODUTO: Planner [Concurseiro / Treino] — perpétuo (undated)
FORMATO: A5 148×210 mm (final, fechado)
ENCADERNAÇÃO: Wire-o, capa dura (lay-flat 180°)
MIOLO: ~112 pp | Polen Bold 90g creme | OPÇÃO A: 2/2 cores (preto K + Índigo, paleta fria Y=0) | OPÇÃO B: 4/4 CMYK — cotar ambas para comparar
CAPA: cartão empastado | laminação soft-touch | hot stamping [cor]
ACABAMENTOS: elástico + marcador de fita + cantos arredondados
EMBALAGEM: 1 un shrink + master carton (informar pç/caixa)
ARTE: PDF/X-__ CMYK, 300 dpi, sangria 3 mm, fontes em curva
QUANTIDADES P/ COTAR: 100 / 300 / 500 / 1.000 / 3.000
PREÇO: FOB ___ e CIF [Santos/Itajaí] ___ | MOQ real ___
AMOSTRA: custo + prazo | LEAD TIME bulk: ___ dias
INCOTERM/PAGAMENTO: FOB | T/T 30/70 via Trade Assurance
```

---

## 8. Cronograma de execução (alinhado ao go-to-market)

| Semana | Ação |
|---|---|
| 1–4 | **Construir audiência/lista de espera** (conteúdo orgânico) + fechar **conteúdo/miolo** dos SKUs + pedir **golden sample** em 2–3 gráficas |
| 5–6 | Aprovar sample por escrito; fechar **arquivos print-ready** (PDF/X, sangria 3 mm, **dieline da capa** que a gráfica fornece) |
| 7–8 | Receber lote; fotografar para conteúdo; **abrir vendas diretas** (canal próprio). *Opção avançada: pré-venda só se a audiência já estiver construída e os sócios decidirem conjuntamente — não é o plano padrão.* |
| 9–12 | Rodar a tiragem; expedir; coletar feedback; decidir reposição |

> A audiência pré-construída é essencial para o lançamento (ver business plan §6) — por isso as semanas 1–4 priorizam **conteúdo**, não só produto. **Decisão travada: SEM pré-venda** `[Daniel · 21/jun/2026]` — imprime-se o micro-lote após o Gate A (lista ≥ 200–500) e abre-se a venda a partir do estoque pronto.

---

## 9. Fontes & datas (números-chave, jun/2026)

- **Câmbio USD/BRL:** ≈ R$ 5,18 em 17/jun/2026 (Investing.com).
- **NCM 4820.10.00:** II 14,4% · IPI 9,75% · PIS 2,10% · COFINS 9,65% (FazComex/TIPI ADE COANA 001/2026). **Gecex 852/2026 não alterou o cap. 48** `[confirmado]`.
- **AFRMM:** **8%** sobre frete de longo curso (Lei 14.301/2022) — correção do rascunho (que usava 25%).
- **ICMS-DF:** **20%** "por dentro" (Lei DF 1.254/96); **não creditável** no MEI/Simples.
- **Regime de remessa (RTS):** até US$ 50 → II 20% + ICMS; US$ 50,01–3.000 → II 60% (−US$ 20) + ICMS (Receita/Correios).
- **China (planners custom):** MOQ 300–1.000 un (premium 1.000–3.000) · FOB ~US$ 1,80–3,99/un · lead 30–60 dias · amostra US$ 50–150 (Alibaba, Made-in-China, Anniorpastin — jun/2026).

*Custos unitários e landed costs marcados como estimativa são faixas de mercado para dimensionar a decisão; devem ser confirmados por cotação formal (gráficas BR) e por despachante (importação China). Não constituem orçamento fechado. Detalhe e tabela de fontes em `research/evidence/sourcing-tributos.md`.*
