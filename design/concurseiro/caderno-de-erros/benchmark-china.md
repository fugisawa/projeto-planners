# Benchmark Visual: 错题本 — Caderno de Erros Chinês

**Data:** 19 jun. 2026
**Autor:** Claude Code (pesquisa + teardown)
**Escopo:** Produtos físicos, templates e metodologias do mercado chinês (China continental + Taiwan/Hong Kong)
**Pasta de referências:** `design/concurseiro/caderno-de-erros/referencias/china/`

---

## 1. Fontes e Metodologia

| Fonte | Tipo | Confiança |
|---|---|---|
| JD.com (京东) — produto Kokuyo Campus 错题学习本 WCN-CNBE13319 | produto físico / imagens reais internas | [confirmado] |
| JD.com — CRHMMFLF, CLCEY, 晨光 M&G, 得力 Deli, 万唯 | produtos físicos | [confirmado] |
| 好奇AI (haoqiai.cn) — 错题本模板, 2025-06 | template digital detalhado | [confirmado] |
| InsightCrunch "高考错题本完全指南" (2023-03-10) | metodologia avançada / Gaokao | [confirmado] |
| 学好网 (asxue.cn) — "错题本怎么做" | metodologia / 4 passos padrão | [confirmado] |
| 奥数世界 (aoshu.world) — "2026年小学数学错题本模板" | template imprimível A4 com Ebbinghaus | [confirmado] |
| 腾讯文库 (wenku.docs.qq.com) — "错题本模板 Word版" | template físico bifurcado 2 colunas | [confirmado] |
| 查字典高中网 (gaozhong.chazidian.com) — metodologia 3 colunas | metodologia / layout 3 colunas | [confirmado] |
| 人人文库 (renrendoc.com) — "错题本格式模板.docx" | template acadêmico completo | [confirmado] |
| 学霸教学网 (jiaoxuewang.cn) — "6 templates Ebbinghaus" | coleção 6 versões com imagem de template | [confirmado] |
| 淘宝 (Taobao) — listagens de busca | catálogo / preços / especificações | [estimativa triangulada] |
| CSDN Blog — "高中数学错题本5层深度分析法" | metodologia avançada 5 camadas | [confirmado] |
| 淘宝逛一逛 (guangtao.taobao.com) | catálogo e nichos (公考/考研) | [estimativa triangulada] |

**Imagens baixadas:** 9 arquivos em `referencias/china/` (ver Seção 7)

---

## 2. Panorama do Mercado

### 2.1 Marcas e posicionamento

| Marca | Posição | Produto típico | Preço aprox. |
|---|---|---|---|
| **国誉 Kokuyo** (日本品牌) | premium / confiança japonesa | Campus 错题学习本 B5/30f, 错题贴线 | ¥7–15/un |
| **晨光 M&G** | massa/acessível | B5 横线 错题本, 活页 | ¥5–12 |
| **得力 Deli** | massa/competitivo | B5 活页错题本, 透明壳 1壳+2芯 | ¥8–18 |
| **猫太子** | infantil/K12 básico | M3085A/M4035C — simples, brochura | ¥3–8 |
| **万唯定制** | estudo específico/branding | 2本装空白大学生 | ¥10–25 |
| **CRHMMFLF / CLCEY** | nichado/Ebbinghaus | 活页 B5, 3 ciências, 艾宾浩斯法 | ¥15–35 |
| **真彩 (ZC)** | multidisciplinar | B5 分科6本装, escola | ¥15–30 |

**Observação [confirmado]:** Kokuyo é a referência de qualidade de papel e estrutura — "不易渗墨，180度平摊，不易掉页". Domina os rankings de "好评" em JD.com para o segmento premium.

### 2.2 Ecossistema digital paralelo

O mercado chinês de 错题本 é fortemente digital:

- **Apps dedicados:** 小牛错题本 (¥19/mês), 橙果错题本 (4.8★, 1.2万 avaliações), 伴印 ("拍照-识别-打印-粘贴"), 菁优网
- **Templates digitais:** Notion (pimia, 4.95★, 9 avaliações), GoodNotes PDF (台湾 良辰笔记, 16 templates)
- **Plataformas de conteúdo:** Bilibili (vídeos "手把手教你做错题本"), 知乎, 小红书
- **Função "去手写" (remoção de caligrafia):** recurso-chave que restaura o enunciado limpo para colar no caderno físico

---

## 3. Teardown de Layouts

### 3.1 LAYOUT A — Bifurcado 2 colunas (modelo mais recorrente)

**Referência:** Template Tencent文库 Word版 (`tencent_cuoti_template.jpeg`) + 查字典高中网 3-colunas adaptado

```
┌────────────────────────────────────────────────────────┐
│ COLUNA ESQUERDA (~1/3 largura) │ COLUNA DIREITA (~2/3) │
├──────────────────────────┬─────┴───────────────────────┤
│ 日期: __年__月__日       │ 题目及错解（可粘粘）        │
│ 题源: _______________    │                             │
│                          │  [área para colar/copiar    │
│ 所属知识点:              │   o enunciado + solução     │
│ ___________________      │   errada original]          │
│                          │                             │
│ 错因分析:                ├─────────────────────────────┤
│ □ 概念模糊 ( )          │ 正解及同类题型              │
│ □ 思路错误 ( )          │                             │
│ □ 运算错误 ( )          │  [solução correta +         │
│ □ 审题错误 ( )          │   variantes do mesmo tipo]  │
│ □ 粗心大意 ( )          │                             │
│ □ 答题不完整 ( )        ├─────────────────────────────┤
│ □ 其他原因: ____        │ 要点反思                    │
│                          │                             │
│ 知识点总结:              │  [síntese / lição]          │
│ ___________________      │                             │
│                          │        老师评价:            │
│                          │   （优、良、达标、待达标）  │
└──────────────────────────┴─────────────────────────────┘
```

**Campos identificados:**

| Campo (CN) | Tradução | Função |
|---|---|---|
| 日期 / 题源 | Data / Fonte | rastreabilidade; cabeçalho |
| 所属知识点 | Ponto de conhecimento | taxonomia por conteúdo |
| 错因分析 (6 checkboxes) | Análise da causa do erro | categorização da falha |
| 题目及错解 | Enunciado + solução errada | preservar raciocínio original |
| 正解及同类题型 | Solução correta + variantes | resolução + generalização |
| 要点反思 | Reflexão sobre pontos-chave | síntese metacognitiva |
| 老师评价 | Avaliação do professor | feedback externo |

**Destaques do layout:** coluna esquerda = metadados + diagnóstico; coluna direita = conteúdo de estudo. Sistema de checkboxes físicos força o aluno a classificar explicitamente antes de escrever a análise.

---

### 3.2 LAYOUT B — Ebbinghaus com rastreador de revisões (sidebar vertical)

**Referência:** Template visual `ebbinghaus_banner.png` (学霸教学网) — **imagem obtida**

```
┌──────────────────┬───────────────────────────────────┐
│ SIDEBAR ESQUERDA │ CORPO PRINCIPAL                   │
│ (cronograma)     │                                   │
├──────────────────┤                                   │
│ 错题日期: __/__  │  错题错解:                        │
│                  │                                   │
│ 1天后:  __/__    │  [área grande — solução errada]   │
│ 2天后:  __/__    │                                   │
│ 4天后:  __/__    │                                   │
│ 7天后:  __/__    │                                   │
│ 15天后: __/__    ├───────────────────────────────────┤
│ 考试前: __/__    │  错题分析:                        │
│                  │                                   │
│ 掌握程度: ☆☆☆☆☆ │  [análise da causa]               │
│ 重要程度: ☆☆☆☆☆ │                                   │
│                  ├───────────────────────────────────┤
│ 错题来源: ____   │  正解:                            │
│                  │                                   │
│ 原因分析:        │  [solução correta]                │
│ 1.审题不清 □□□□ │                                   │
│ 2.概念模糊 □□□□ │                                   │
│ 3.思路错误 □□□□ │                                   │
│ 4.题目超纲 □□□□ │                                   │
│ 5.粗心大意 □□□□ │                                   │
│ 6.运算错误 □□□□ │                                   │
│ 7.其他原因 ___  │                                   │
│                  │                                   │
│ 知识点总结:      │                                   │
│ _____________    │                                   │
└──────────────────┴───────────────────────────────────┘
```

**Campos identificados:**

| Campo (CN) | Tradução | Função |
|---|---|---|
| Cronograma 1/2/4/7/15 dias + 考试前 | Revisão espaçada 6 rounds | controle de repetição espaçada |
| 掌握程度 ☆☆☆☆☆ | Grau de domínio | auto-avaliação 1-5 estrelas |
| 重要程度 ☆☆☆☆☆ | Importância | priorização de revisão |
| 错题来源 | Fonte da questão | rastreabilidade |
| 7 原因分析 com 4 checkboxes cada | 7 categorias de erro com 4 tentativas | rastreamento de recorrência por tipo |
| 知识点总结 | Síntese do ponto de conhecimento | consolidação conceitual |

**Diferencial:** os 4 checkboxes por categoria de erro não são de múltipla escolha — são para marcar quantas vezes o mesmo tipo de erro foi cometido na mesma questão (recorrência intra-questão). Altamente diagnóstico.

---

### 3.3 LAYOUT C — Template acadêmico A4 completo (6 zonas)

**Referência:** 奥数世界 2026 + 好奇AI 2025-06 + renrendoc.com

**Estrutura de 4 zonas verticais por página A4:**

```
┌────────────────────────────────────────────────────────────┐
│ ZONA 1: ARQUIVO BASE                                       │
│ Nome | Data | Série | Origem □校内 □作业 □奥数 □杯赛       │
│ Ponto de conhecimento | Tempo | Tipo □calc □conceito...   │
│ Indicador de cor: Vermelho/Azul/Preto | Número: No.___    │
├────────────────────────────────────────────────────────────┤
│ ZONA 2: NÚCLEO DO ERRO                                     │
│ 1. 原题呈现 — colar/imprimir (NÃO copiar manualmente)     │
│ 2. 我的错误解法 — em CANETA VERMELHA, raciocínio errado   │
│ 3. 深度归因 — 5 "buracos negros": cálculo / compreensão   │
│    lógica / hábito / lacuna de conhecimento               │
│ 4. 正确解法 + "题眼" — solução padrão + frase-chave      │
│ 5. 变式训练 — questão modificada + resolução              │
│ 6. 费曼输出 — gravação de áudio (□gravado __seg) +        │
│    resumo em linguagem simples                            │
├────────────────────────────────────────────────────────────┤
│ ZONA 3: TABELA EBBINGHAUS                                  │
│ 1ª rodada: mesmo dia | 2ª: 3 dias | 3ª: 1 semana         │
│ 4ª: 1 mês | 5ª: antes da prova                           │
├────────────────────────────────────────────────────────────┤
│ ZONA 4: FEEDBACK ESCOLA-CASA                               │
│ Assinatura/comentário dos pais (não apenas "revisado")    │
│ Autoavaliação do aluno: sentimento □fácil □difícil        │
└────────────────────────────────────────────────────────────┘
```

**Inovação notável:** a zona "费曼输出" (saída Feynman) — o aluno grava um áudio explicando a questão com suas próprias palavras, como se fosse um professor. Representa a camada mais profunda de processamento.

---

### 3.4 LAYOUT D — Kokuyo Campus 错题学习本 (produto físico B5)

**Referência:** Imagens reais do produto `kokuyo_cuoti_01/02/03/04.jpg` — **imagens obtidas**

**Especificações físicas:**
- Tamanho: B5 (252 × 179 mm), orientação horizontal (apaisado)
- 30 páginas, encadernação sem costura (180° plano)
- Sistema: **错题贴线** (linhas específicas para colar questões recortadas)
- Papel japonês de plantação sustentável, brancura 83%, não sangra tinta
- Divisão visual: 2–3 colunas via linhas ponilhadas verticais pré-impressas

**Layout visual (da imagem kokuyo_cuoti_03):**
- Coluna esquerda (~40%): enunciado colado + solução errada manuscrita em azul, com retângulo vermelho destacando "错因: xx" e seta para "正因: yy"
- Coluna direita (~60%): desenvolvimento da solução correta + diagrama/figura
- Notas em caneta rosa/vermelha na margem inferior esquerda: resumo do ponto de conhecimento, causa e referência bibliográfica

**Layout visual (da imagem kokuyo_cuoti_04):**
- Questão colada via post-it (小纸条) sobre a coluna esquerda do caderno
- Coluna direita com solução desenvolvida em duas subcolunas verticais pontilhadas
- Sistema permite remover o post-it para retentar a questão sem ver a resposta

**Insight de produto:** o Kokuyo não imprime um formulário rígido — entrega infraestrutura neutra (linhas, colunas, papel premium) e deixa o aluno criar seu próprio sistema. É a filosofia japonesa de minimalismo funcional.

---

### 3.5 LAYOUT E — Sistema 5 camadas (高分学生法)

**Referência:** CSDN blog / InsightCrunch (metodologia avançada para Gaokao/concurso)

```
CAMADA 1: Informação básica
→ Fonte, data, tipo de erro (código K/C/M/S/R), resposta errada

CAMADA 2: Decomposição da causa raiz
→ Causa raiz específica (não "distração" — "auditor pulou condição X")
→ Lacuna de conhecimento associada (citar capítulo do livro)

CAMADA 3: Resolução correta reescrita
→ Em linguagem própria, NÃO copiar gabarito
→ Incluir passos-chave e pontos de atenção

CAMADA 4: Correção do padrão mental
→ Checklist de verificação para esse tipo de questão
→ Método alternativo (se existir mais rápido)

CAMADA 5: Treinamento variativo
→ Questão modificada (alterar um parâmetro)
→ "Trigger card": "quando ver X → aplicar Y"
```

**Sistema de codes de erro (InsightCrunch/高考):**

| Código | Tipo (CN) | Tipo (PT) |
|---|---|---|
| K | 知识性缺陷 | Lacuna de conhecimento (não aprendeu) |
| C | 概念混淆 | Confusão conceitual (aprendeu errado) |
| M | 方法未掌握 | Método não dominado (sabe teoria, não aplica) |
| S | 粗心失误 | Erro de descuido (cálculo, leitura) |
| R | 审题错误 | Erro de interpretação (ignorou condição) |

**Sistema semáforo para revisão:**
- Vermelho: errado recentemente → revisar a cada 3–5 dias
- Amarelo: correto mas instável → revisar quinzenalmente
- Verde: dominado → revisar mensalmente ou arquivar

---

## 4. Taxonomia Unificada de Causas do Erro (Síntese)

A partir de todos os layouts analisados, emerge uma taxonomia consolidada:

| Nível | Categoria | Subtipos frequentes |
|---|---|---|
| **A** | 知识性错误 (Conhecimento) | conceito errado, fórmula memorizada incorretamente, ponto não aprendido |
| **B** | 方法性错误 (Método) | método errado escolhido, passos omitidos, cálculo incorreto |
| **C** | 审题性错误 (Interpretação) | condição ignorada, palavra-chave perdida, enunciado mal lido |
| **D** | 习惯性错误 (Hábito) | letra ilegível, resposta incompleta, pulou etapa, sem verificação |
| **E** | 思维性错误 (Raciocínio) | lógica incorreta, viés de confirmação, não testou casos limite |
| **F** | 熟悉度不足 (Familiaridade) | tipo de questão desconhecido, falta de prática |

**Diferença conceitual importante:** os chineses distinguem rigorosamente "conceito errado" (C — aprendeu errado) de "lacuna" (K/A — nunca aprendeu). A intervenção é diferente: para C, comparar com o conceito correto; para A/K, rever o capítulo do livro.

---

## 5. Padrões Recorrentes Identificados

### 5.1 Estrutura de colunas

O formato **2 colunas verticais** é dominante:
- Coluna esquerda estreita (1/3): metadados, diagnóstico, categorização
- Coluna direita larga (2/3): conteúdo de estudo (enunciado, erro, solução)

Variante avançada: **3 colunas** (esq. = erro + fonte / centro = análise / dir. = solução correta + regra)

### 5.2 Rastreamento de revisão integrado

**100% dos layouts estruturados** incluem algum mecanismo de revisão espaçada. Os intervalos mais comuns:
- Padrão simples: 1-2-4-7 dias
- Padrão completo (Ebbinghaus): 1 dia / 2 dias / 4 dias / 7 dias / 15 dias / antes da prova
- Padrão "12730": 1 dia / 2 dias / 7 dias / 30 dias

### 5.3 Sistema de 3 canetas (obrigatório)

| Caneta | Uso |
|---|---|
| Preta | enunciado, conteúdo base |
| Azul | solução correta, passos corretos |
| Vermelha | causas do erro, pontos críticos, armadilhas |

### 5.4 "Preservar o erro" é princípio central

Diferentemente do caderno de anotações comum, o 错题本 preserva a solução errada original antes de mostrar a correta. Essa sequência — errado → causa → correto — é considerada inegociável pelos educadores chineses.

### 5.5 Formato físico preferido

- **B5 apaisado (horizontal)** para cadernos com questões de ciências/matemática (mais espaço para diagramas)
- **A4 retrato** para templates imprimíveis
- **Atividade (活页)** é praticamente padrão na faixa ¥15+: permite remover, reordenar e descartar folhas dominadas

### 5.6 Integração físico-digital

O fluxo dominante (2024-2026):
1. Foto da questão errada via app
2. App remove caligrafia automaticamente (去手写)
3. Imprime em impressora portátil (喵喵机 ¥19/mês / 伴印)
4. Cola no caderno físico
5. Escreve análise manualmente (processamento ativo)

---

## 6. Três Ideias Acionáveis para a Nossa Ficha

### IDEIA 1 — Sidebar de Revisão com Código de Status

Incorporar na margem esquerda da ficha um rastreador compacto com:
- 5 datas de revisão previstas (D1 / D3 / D7 / D15 / Prova)
- Escala de domínio visual: 3 círculos (○ = não feito / ◑ = refeito com dúvida / ● = dominado)
- Um campo de "código de erro" com checkbox de uma letra (K / M / C / S / H) — força o concurseiro a nomear a falha antes de corrigir

**Por quê funciona:** o sidebar cria um painel de controle por ficha, eliminando cadernos separados de controle de revisão.

### IDEIA 2 — Campo "Raciocínio Errado" Obrigatório (antes da solução)

Reservar um bloco explícito para o aluno escrever/colar exatamente o que escreveu de errado, com espaço para uma seta → "Por que estava errado:". A posição física deve ser ANTES da solução correta.

**Por quê funciona:** a pesquisa chinesa (InsightCrunch, renrendoc) aponta que analisar o caminho errado tem mais valor pedagógico do que apenas ver o gabarito. O concurseiro deve "confrontar o raciocínio errado" ativamente, não apenas apagar e sobrescrever.

### IDEIA 3 — "Gatilho de Aplicação" (Trigger Card) em Campo Destacado

No rodapé da ficha, um campo obrigatório de síntese de 1–2 linhas no formato:
> "Quando ver [CONDIÇÃO X] → aplicar [MÉTODO Y] / cuidado com [ARMADILHA Z]"

**Por quê funciona:** é o diferencial da metodologia 高分学生 — transforma cada erro num padrão de reconhecimento reutilizável. Para concursos (onde questões repetem padrões), esse gatilho é direto ao processo cognitivo de recuperação em prova.

---

## 7. Imagens Coletadas

| Arquivo | Conteúdo | Marca/Fonte |
|---|---|---|
| `kokuyo_cuoti_01_cover.jpg` | Capa do produto Campus 错题学习本 B5 horizontal — marca clara "Study Notebook 错题贴" | Kokuyo / ey100.com |
| `kokuyo_cuoti_02_layout.jpg` | Embalagem mostrando a divisão interna do caderno em 3 colunas ponilhadas + barra superior marrom | Kokuyo / ey100.com |
| `kokuyo_cuoti_03_detail.jpg` | **Layout em uso real:** 2 colunas; esq. = enunciado de física + solução errada em azul + caixa vermelha com 错因/正因; dir. = diagrama de forças + solução correta | Kokuyo / ey100.com |
| `kokuyo_cuoti_04_back.jpg` | **Sistema post-it:** questão de geometria colada em papel destacável sobre col. esq.; col. dir. com resolução em 2 subcolunas | Kokuyo / ey100.com |
| `ebbinghaus_banner.png` | **Template visual completo:** sidebar com cronograma 1/2/4/7/15 dias + campos 掌握程度/重要程度 (estrelas) + 7 categorias de erro com 4 checkboxes cada + campos 错题错解/错题分析/正解 | 学霸教学网 / jiaoxuewang.cn |
| `tencent_cuoti_template.jpeg` | **Template Word imprimível:** layout 2 colunas — col. esq. = data/fonte/知识点/6 categorias de erro checkbox; col. dir. dividida em 3 zonas: 题目及错解 / 正解及同类题型 / 要点反思 + avaliação do professor | 腾讯文库 |
| `asxue_template_01.jpg` | Imagem ilustrativa (stock) — sem layout de template | asxue.cn |
| `gaoding_template_01.jpg` | Post de marketing "初中数学提分 — 01基础/02题型/03应试" — não é template de ficha | Gaoding |
| `gaoding_template_02.jpg` | Post de marketing "语文差？先补阅读！" — não é template de ficha | Gaoding |

**Imagens com maior valor para design:** `ebbinghaus_banner.png`, `tencent_cuoti_template.jpeg`, `kokuyo_cuoti_03/04.jpg`

---

## 8. URLs de Referência

- Metodologia 4 passos padrão: https://www.asxue.cn/xuexi/343637.html
- Guia Gaokao completo (K/C/M/S/R + semáforo): https://insightcrunch.com/2023/03/10/gaokao-error-notebook/
- Template A4 completo 2026 (6 zonas + Feynman): https://www.aoshu.world/?p=2145
- Template 好奇AI (tabela registro + ABCDE + 3 revisões): https://www.haoqiai.cn/book/605.html
- Template Tencent文库 Word (imagem visual): https://wenku.docs.qq.com/detail?docId=vAr5E7EKyx
- 6 templates Ebbinghaus (com imagem sidebar): https://www.jiaoxuewang.cn/14774.html
- 5 camadas avançadas (CSDN): https://blog.csdn.net/weixin_39501680/article/details/147605151
- 3 colunas / tabela estatística de erro: https://gaozhong.chazidian.com/mingshizhidao/4122/
- Template docx formato completo: https://www.renrendoc.com/paper/521506413.html
- Produto Kokuyo Campus 错题贴 B5: https://vipssl.ey100.com/Goods/ItemDetail_9800-1489_1.htm
- JD ranking 数学错题本: https://www.jd.com/phb/key_67058073b408afdd989.html
- Listagem Taobao 错题本: https://guangtao.taobao.com/topic-198292195
- App 小牛错题本: https://apps.apple.com/cn/app/小牛错题本/id6474232623
- App 橙果错题本 (4.8★): https://apps.apple.com/cn/app/橙果错题本/id1240025662
- Template Notion 错题本 (台湾 pimia, 4.95★): https://www.notion.com/zh-cn/templates/problems-collection-notebook

---

*Pesquisa realizada em 19/jun/2026. Preços e disponibilidade de produtos sujeitos a alteração. Tributação de importação China→BR: NCM 4820.10.00 (confirm. com despachante antes de escalar).*
