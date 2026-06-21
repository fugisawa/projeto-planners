# Evidência: Economia de Canal e Aquisição
**Pergunta:** Qual a economia real de canal (taxas ML/Shopee) e o realismo de aquisição (Meta Ads, CAC, audiência do zero) para um planner de ticket R$ 110–119?
**Pesquisador:** market-researcher (claude-sonnet-4-6)
**Data:** 19 jun 2026
**Método:** WebSearch + WebFetch em 14 fontes; triangulação cruzada; confiança marcada por afirmação.

> **Atualização 21/jun/2026:** As simulações neste documento usam ticket R$ 119 (Conc) e custo/un R$ 45 — premissas pré-pivô de 19/jun. O ticket de lançamento do Concurseiro foi revisado para **R$ 129**; o custo blended triangulado é **R$ 43–55 (4/4) / R$ 36–47 (2/2)** [estimativa triangulada · Daniel · 21/jun/2026]. A conclusão qualitativa sobre inviabilidade do tráfego pago frio permanece válida; os números de MC e CAC de ruptura mudam com o novo preço e devem ser recalculados. A evidência de canal (taxas ML/Shopee, CPM, conversão) não é afetada — são fatos de mercado datados.

---

## 1. Taxas de Marketplace — Mercado Livre 2026

### Estrutura de comissão (vigência: 2026)

| Modalidade | Comissão % | Parcelamento | Prioridade algoritmo |
|------------|------------|--------------|----------------------|
| Clássico   | 11–14%     | Até 6x com juros | Menor |
| Premium    | 15–19%     | Até 12x sem juros | Maior |

**Categoria papelaria/agendas:** A plataforma não publica categoria isolada "agendas". As fontes convergem em dois proxies:
- "Livros e revistas": Clássico 10%, Premium 15% [estimativa triangulada — precisaofinanceira.com.br, abr/2026; a categoria real pode diferir; confirmar no Seller Center com NCM 4820.10.00]
- "Artigos de escritório" / categorias similares: Clássico 11–14%, Premium 16–19% [estimativa — gestorshop.com.br, mai/2026; ecommercenapratica.com, abr/2026]

**Recomendação operacional:** Cadastrar o planner como "Artigos de Papelaria e Escritório" e verificar a comissão exata antes de precificar via Central do Vendedor. Usar 14%/19% como pior caso prudente.

### Taxa fixa por item (custo fixo)
Aplicável apenas para produtos **abaixo de R$ 79**:

| Faixa de preço | Taxa fixa |
|----------------|-----------|
| R$ 12,50–R$ 29 | R$ 6,25  |
| R$ 29–R$ 50    | R$ 6,50  |
| R$ 50–R$ 78,99 | R$ 6,75  |
| Acima de R$ 79 | **Sem taxa fixa** |

[confirmado — ecommercenapratica.com, atualização abr/2026; gestorshop.com.br, mai/2026]

**Para o ticket de R$ 109–119: sem taxa fixa por item.** Apenas a comissão percentual.

### Frete grátis
A plataforma **incentiva** frete grátis via desconto de frete (até 70%) mas **não obriga** [confirmado — ecommercenapratica.com, abr/2026]. Custo de frete no canal Mercado Livre deve ser embutido no preço ou absorvido pelo vendedor caso opte por oferecer.

### Simulação de margem no ticket R$ 119 (Clássico 14%)
```
Receita bruta:          R$ 119,00
(-) Comissão ML 14%:    R$ -16,66
(-) Frete estimado:     R$ -18,00 (brasília → SP, pac ~400g)
(=) Receita líquida:    R$ 84,34
(-) Custo produto:      R$ -45,00
(-) ICMS/PIS/COFINS:    (depende do regime — MEI isento de IRPJ/CSLL, mas ICMS/ISS a verificar)
(=) Margem bruta aprox: R$ ~39,34 (~33% da receita)
```
[estimativa — método: premissas do CLAUDE.md cruzadas com taxas confirmadas]

---

## 2. Taxas de Marketplace — Shopee 2026

### Estrutura de comissão (vigência: 1º mar 2026)

| Faixa de preço      | Comissão % | Taxa fixa por item |
|---------------------|------------|-------------------|
| Abaixo de R$ 8      | 50%        | —                 |
| R$ 8–R$ 79,99       | 20%        | R$ 4,00           |
| R$ 80–R$ 99,99      | 14%        | R$ 16,00          |
| **R$ 100–R$ 199,99**| **14%**    | **R$ 20,00**      |
| R$ 200+             | 14%        | R$ 26,00          |

[confirmado — precisaofinanceira.com.br, abr/2026; calcularte.com.br, mar/2026]

**Teto de comissão:** Removido. Não há mais limite máximo de R$ 100 na comissão. [confirmado — calcularte.com.br, mar/2026]

**Frete grátis:** Compulsório desde março/2026 para todos os vendedores (o custo já está embutido na nova estrutura, sem cobrança separada dos 6% anteriores). [confirmado — precisaofinanceira.com.br, abr/2026]

**CPF alto volume:** Sellers CPF com >450 pedidos/90 dias pagam R$ 3,00 adicional por item. [confirmado — precisaofinanceira.com.br, abr/2026]

### Simulação de margem no ticket R$ 115 (Shopee, faixa R$ 100–199,99)
```
Receita bruta:               R$ 115,00
(-) Comissão 14%:            R$ -16,10
(-) Taxa fixa por item:      R$ -20,00
(=) Receita líquida:         R$ 78,90
(-) Custo produto:           R$ -45,00
(=) Margem bruta aprox:      R$ 33,90 (~29% da receita)
```
[estimativa — método: taxas confirmadas × premissas do CLAUDE.md]

**Nota crítica:** A taxa fixa de R$ 20,00/item na faixa R$ 100–199,99 é devastadora para produtos de baixo custo. Equivale a 17% adicionais sobre R$ 115, elevando o custo efetivo total de canal para ~31% da receita bruta antes de frete e impostos.

### Comparativo de canal para R$ 115

| Canal         | Custo efetivo de canal | Receita líquida estimada | Margem bruta aprox |
|---------------|------------------------|--------------------------|-------------------|
| Direto (D2C)  | ~0% comissão + gateway ~3% | R$ 111,55          | ~R$ 66,55 (58%)   |
| ML Clássico 14% + frete | ~14% + frete | R$ 84,34          | ~R$ 39,34 (34%)   |
| Shopee (14%+R$20) | ~31% | R$ 78,90                | ~R$ 33,90 (29%)   |

[estimativa triangulada — método declarado acima; frete D2C omitido; impostos não deduzidos]

> **Atualização 21/jun/2026:** Simulações acima calculadas para ticket R$ 115–119 (pré-pivô). Com ticket de lançamento Concurseiro R$ 129, os valores de receita líquida e margem bruta mudam (ex.: D2C a R$ 129 → receita líquida ~R$ 125,13, margem bruta ~R$ 70–82 dependendo do custo blended). A conclusão qualitativa — D2C muito superior aos marketplaces — permanece. Recalcular na próxima revisão do modelo com o custo real pós-cotação [a recalcular pós-cotação].

---

## 3. Meta Ads Brasil 2026 — Parâmetros

### Tributos sobre anúncios (desde jan/2026)
Meta passou a repassar PIS/COFINS (9,25%) + ISS (2,9%) = **~12,15% sobre o valor de mídia** aos anunciantes brasileiros. Efeito prático: R$ 1.000 investido entrega ~R$ 891,50 em mídia efetiva; para manter R$ 1.000 em mídia real é necessário investir ~R$ 1.121,50. [confirmado — edialog.com.br, dez/2025; upsendbrasil.com.br, jan/2026]

### CPM por formato (Brasil, 2026)

| Formato            | CPM (R$)   | Observação |
|--------------------|------------|------------|
| Feed Instagram     | R$ 18–35   | Conversão eleva para R$ 20–45 |
| Feed Facebook      | R$ 14–28   | |
| Stories            | R$ 8–18    | |
| Reels              | R$ 10–22   | |
| Education/Cursos   | R$ 18–32   | Proxy mais próximo para nicho concurso |

[estimativa triangulada — trafius.com.br, abr/2026; aintegrare.com.br, fev/2026]

### CPC e taxa de conversão

| Parâmetro | Valor Brasil 2026 | Fonte |
|-----------|-------------------|-------|
| CPC médio e-commerce geral | R$ 0,80–R$ 3,00 | aintegrare.com.br, fev/2026 |
| CPC nicho educação/fitness | R$ 1,50–R$ 5,00 | aintegrare.com.br, fev/2026 |
| Taxa de conversão e-commerce BR geral | 1,17%–1,65% | babitonhela.com 2026; NuvemCommerce 2026 |
| Taxa de conversão esportes/lazer | 1,8%–2,2% | babitonhela.com 2026 |
| Taxa conversão tráfego frio (pior caso) | 0,5%–1,0% | [estimativa — padrão conservador de mercado] |

**Nota:** Para loja nova sem histórico de pixel e sem audiência, trabalhar com 0,5%–1,0% de conversão é mais realista no tráfego frio do que o benchmark geral de 1,5%. [estimativa — a confirmar com testes reais]

---

## 4. Estimativa de CAC — Método Explícito

### Derivação CPC × Conversão (tráfego frio, Meta Ads)

**Cenário conservador** (nicho educação/fitness, tráfego frio, loja sem histórico):
- CPC: R$ 2,50 (médio entre R$ 1,50–R$ 5,00, ponderado para frio)
- Taxa de conversão: 0,75% (entre 0,5% e 1,0% para loja nova)
- CAC = CPC ÷ taxa de conversão = R$ 2,50 ÷ 0,0075 = **R$ 333/venda**

**Cenário médio** (pixel amadurecido, criativo testado, ~3–6 meses):
- CPC: R$ 1,80
- Taxa de conversão: 1,5%
- CAC = R$ 1,80 ÷ 0,015 = **R$ 120/venda**

**Cenário otimista** (público quente, retargeting, página validada):
- CPC: R$ 1,20
- Taxa de conversão: 2,0%
- CAC = R$ 1,20 ÷ 0,020 = **R$ 60/venda**

[estimativa — todos os valores derivados de CPC e conversão citados acima; marcados como estimativa]

### Comparação CAC vs margem de contribuição

| Canal | Margem contrib. (R$/un) | CAC pago conservador | Resultado |
|-------|------------------------|---------------------|-----------|
| D2C (direto) | ~R$ 62 | R$ 333 (tráfego frio) | **prejuízo de R$ 271/venda** |
| D2C (direto) | ~R$ 62 | R$ 120 (médio) | **prejuízo de R$ 58/venda** |
| D2C (direto) | ~R$ 62 | R$ 60 (otimista) | **empate — margem nula** |

**Conclusão:** O tráfego pago frio é inviável economicamente no ticket de R$ 110–119 com custo/un de R$ 45. A margem de contribuição de ~R$ 62 suporta no máximo CAC de ~R$ 50–60, atingível **somente** com retargeting de audiência quente, not with cold traffic. Em tráfego frio realista (CAC R$ 150–333), **cada venda via Meta Ads queima caixa**.

> **Atualização 21/jun/2026:** Com ticket de lançamento R$ 129 (Concurseiro), a MC direta sobe para ~R$ 72–86/un (custo R$ 43–57 blended 4/4) — a conclusão qualitativa de inviabilidade do tráfego frio permanece, mas o CAC de ruptura melhora. Os valores exatos de MC e CAC máximo devem ser recalculados pós-cotação real [a recalcular pós-cotação · Daniel · 21/jun/2026].

Adicionar 12,15% de tributos Meta eleva ainda mais o CAC efetivo. Exemplo: se o CAC de mídia é R$ 120, o custo real para o caixa é R$ 134,60. [confirmado — método: tributos edialog.com.br × CAC estimado acima]

---

## 5. Construção de Audiência do Zero — Benchmarks

### Taxa de crescimento orgânico Instagram 2025

| Tamanho da conta | Taxa de crescimento anual |
|------------------|--------------------------|
| 1–5K seguidores  | ~22%/ano                 |
| 5–10K seguidores | ~20%/ano                 |

[confirmado — socialinsider.io, análise jan–dez 2025, publicado fev/2026; amostra 35M posts / 447K perfis]

**Implicação matemática:**
- Começando do zero, crescendo 22%/mês (otimista, orgânico intenso com Reels diários):
  - Mês 3: ~100–300 seguidores
  - Mês 6: ~500–800 seguidores
  - Mês 9–12: ~1.000–2.000 seguidores
- Taxa de 22% **anual** (não mensal) sugere crescimento muito mais lento: da conta em 100 seguidores → 122 em 12 meses sem intervenção ativa.
- **Na prática**, com produção consistente de Reels (1/dia ou 5–7/semana) e nicho bem definido, criadores com forte estratégia de conteúdo educativo reportam 3–6 meses para os primeiros 1K, e 12–18 meses para 10K. [estimativa triangulada — sebraepr.com.br abr/2026; startdigital7.com 2026; padrão de mercado]

### Engajamento por formato (2025)

| Formato   | Taxa de engajamento média |
|-----------|--------------------------|
| Carrossel | 0,55%                    |
| Reels     | 0,52%                    |
| Imagem    | 0,37%                    |

[confirmado — socialinsider.io, fev/2026]

**Frequência recomendada 2026:** Reels diários (ou mínimo 5/semana) para capturar a mudança do algoritmo que prioriza publicações do mesmo dia (+50% de distribuição para posts recentes). [confirmado — sebraepr.com.br, abr/2026]

### Nichos concurso e força — contexto específico

**Nicho concurso público:**
- Comunidade altamente engajada, com perfis de estudo no Instagram (ex: @estrategiaconcursos, @grancursosonline) com centenas de milhares de seguidores.
- Criadores individuais com conteúdo de método/estudo (comparáveis ao posicionamento dos sócios) levam tipicamente 12–24 meses para chegar a 10K orgânico sem impulsionamento.
- O nicho reage bem a carrosséis educativos ("como montar seu ciclo de estudos"), checklists e templates compartilháveis.
- [estimativa — análise de perfis de nicho; a confirmar com análise competitiva dedicada]

**Nicho treino de força:**
- Nicho saturado em número de criadores (bodybuilders, coaches, personal trainers), mas com lacuna de conteúdo de periodização analítica/científica para praticantes avançados.
- Reels de demonstração (técnica + carga + RPE) e carrosséis de programação de mesociclo têm alto potencial de salvamento (save = sinal forte do algoritmo).
- Microinfluenciadores de treino de força (5K–50K) têm alta taxa de engajamento em comparação a fitness geral.
- [estimativa triangulada — socialinsider.io fev/2026; análise de nicho]

### Pré-venda sem audiência: o que esperar

> **Atualização 21/jun/2026:** A estratégia atual NÃO inclui pré-venda (âncora CLAUDE.md — "sem pré-venda, sem empréstimo"). Esta seção documenta benchmarks de mercado para fins de referência, não uma estratégia adotada. A ação defensável adotada é construção de lista de espera (landing page + conteúdo orgânico), não abertura de pré-venda antes de ter estoque. [Daniel · 21/jun/2026]

- Com 0 seguidores e 0 lista de email: pré-venda realista = R$ 0–500 em receita na abertura [estimativa — padrão de mercado para produto novo sem audiência; a confirmar].
- Com 500–1.000 seguidores engajados (nicho): pré-venda pode render 2%–5% de conversão da audiência = 10–50 unidades [estimativa triangulada].
- Nenhuma evidência encontrada de pré-venda física bem-sucedida com audiência zero em nicho de papelaria BR sem tráfego pago.
- **Ação defensável:** construir lista de espera (landing page + conteúdo orgânico) por 60–90 dias antes do lançamento; mirar 200–500 pessoas na lista antes de abrir vendas.

---

## 6. Mix Orgânico/Pago — Recomendação para Ano 1

### Dado o perfil dos sócios (forte em conteúdo+design, fraco em mídia paga, sem audiência):

**Meses 1–3 (construção de base):**
- 100% orgânico: Reels educativos diários (nicho concurso: método de estudo; nicho força: periodização), carrosséis de templates compartilháveis, stories de bastidores de produção do planner.
- Objetivo: chegar a 500–1.000 seguidores qualificados antes de qualquer venda.
- Custo: zero financeiro, alto custo de tempo (2–3h/dia de produção de conteúdo).
- Landing page de lista de espera ativa desde o dia 1.

**Meses 4–6 (lançamento com tráfego misto):**
- 80% orgânico + 20% pago (retargeting de visitantes da landing page e seguidores).
- Tráfego pago **somente** como amplificador de audiência quente (não para tráfego frio — inviável economicamente).
- Budget sugerido: R$ 300–500/mês focado em retargeting (CAC potencial R$ 40–80, dentro da margem).
- Nunca tráfego frio em escala sem pixel maduro (mínimo 1.000 eventos de compra rastreados).

**Meses 7–12 (crescimento):**
- Parcerias com microinfluenciadores de nicho (permuta ou comissão): mais eficiente que tráfego frio para produto físico de ticket médio.
- Programa de indicação/afiliados: ex-compradores indicam com link trackável e recebem desconto ou comissão.
- Tráfego pago pode escalar quando ROAS ≥ 4 (o que requer CAC ≤ R$ 30, só atingível com lookalike de compradores comprovados).

**Mix defensável Ano 1:** 70% orgânico · 20% retargeting/afiliados · 10% tráfego frio experimental [estimativa — baseado em perfil de competências e estrutura de margem analisados acima]

---

## 7. Tabela de Fontes

| # | Nome / Título | URL | Data | Confiança | Trecho-chave |
|---|--------------|-----|------|-----------|--------------|
| 1 | Precisão Financeira — Comissões ML 2026 | https://www.precisaofinanceira.com.br/blog/mercado-livre-comissoes-por-categoria-2026 | abr/2026 | [confirmado] | Livros: Clássico 10%, Premium 15% |
| 2 | E-commerce na Prática — Taxas ML | https://ecommercenapratica.com/blog/comissao-mercado-livre/ | abr/2026 | [confirmado] | Taxa fixa por faixa; frete grátis incentivado |
| 3 | Gestor Shop — Comissões ML | https://www.gestorshop.com.br/blog/comissoes-mercado-livre-2026-tabela | mai/2026 | [confirmado] | Estrutura geral: Clássico 11–14%, Premium 16–19% |
| 4 | Marketize Sales — Comissões ML | https://www.marketizesales.com.br/comissoes/mercado-livre | 2026 | [confirmado] | Taxa fixa R$ 6,50 abaixo de R$ 79 |
| 5 | Precisão Financeira — Shopee 2026 | https://www.precisaofinanceira.com.br/blog/taxas-shopee-2026-comissao-frete | abr/2026 | [confirmado] | Tabela completa por faixa; teto removido |
| 6 | Calcularte — Taxas Shopee 2026 | https://blog.calcularte.com.br/index.php/2026/03/06/taxas-comissoes-shopee-2026/ | mar/2026 | [confirmado] | Faixa R$100–199,99: 14% + R$20/item; vigência mar/2026 |
| 7 | eDialog — Meta Ads 2026 novas regras | https://www.edialog.com.br/meta-ads-2026-novas-regras/ | dez/2025 | [confirmado] | PIS/COFINS 9,25% + ISS 2,9% = 12,15% sobre mídia |
| 8 | Upsend Brasil — Custo Meta Ads 2026 | https://upsendbrasil.com.br/blog/aumento-custo-meta-ads-2026/ | jan/2026 | [confirmado] | Confirmação 12,5% de aumento |
| 9 | Trafius — CPM Meta Ads Brasil | https://trafius.com.br/blog/cpm-medio-facebook-ads-brasil-2026 | abr/2026 | [estimativa triangulada] | CPM Feed IG: R$ 18–35; Education: R$ 18–32 |
| 10 | Aintegrare — Custos tráfego pago 2026 | https://aintegrare.com.br/quanto-custa-trafego-pago | fev/2026 | [estimativa triangulada] | CPC e-commerce R$ 0,80–3,00; educação/fitness R$ 1,50–5,00; conv. 1–3% |
| 11 | Babitonhela — Taxa conversão e-commerce | https://babitonhela.com/blog/taxa-conversao-ecommerce/ | 2026 | [confirmado] | Média BR: 1,17%–1,65%; esportes: 1,8%–2,2% |
| 12 | SocialInsider — Instagram Benchmarks 2025 | https://www.socialinsider.io/pt/social-media-benchmarks/instagram | fev/2026 | [confirmado] | 35M posts; contas 1–5K crescem 22%/ano; Reels engaj. 0,52% |
| 13 | Sebrae PR — Crescimento orgânico IG 2026 | https://sebraepr.com.br/comunidade/artigo/estrategia-de-crescimento-organico-no-instagram-o-guia-de-2026 | abr/2026 | [confirmado] | Algoritmo prioriza posts recentes (+50% Reels do dia) |
| 14 | Nexus Growth — Meta Ads custo 2026 | https://blog.nexusgrowth.com.br/blog/meta-ads/meta-ads-custo-2026 | 2026 | [confirmado] | R$1k investido → R$891,50 em mídia efetiva |

---

## 8. Lacunas e Próximos Passos

1. **[A confirmar]** Comissão exata de "Agendas/Planners" no Seller Center ML — verificar ao cadastrar o produto com NCM 4820.10.00.
2. **[A confirmar]** Custo real de frete (gráfica Brasília → destinos) para incluir na simulação de margem ML com frete grátis.
3. **[A confirmar]** Taxa de conversão de audiência orgânica para compra (seguidores → compradores) — testar no lançamento.
4. **[A confirmar]** Benchmarks de pré-venda para planners físicos brasileiros D2C — busca especializada em grupos de empreendedorismo/papelaria.
5. **[A confirmar]** Custo real de gateway de pagamento D2C (Hotmart Checkout, PagSeguro, Kiwify) para completar a simulação do canal direto.
