# Benchmark — Caderno de Erros Japão
**Data:** 19 jun 2026  
**Escopo:** produtos e métodos japoneses de registro e resolução de erros em estudo (解き直しノート / 間違いノート / やり直しノート / 復習ノート)  
**Pesquisador:** Claude Sonnet 4.6 via pesquisa web (Exa, Tavily, WebSearch + WebFetch)  
**Pasta de imagens:** `design/concurseiro/caderno-de-erros/referencias/japao/`

---

## 1. Conclusão central: método, não produto

**No Japão, o caderno de erro é predominantemente um MÉTODO, não um produto vendido pronto.**

Ao contrário da Coreia (onde existem produtos impressos com campos fixos pré-formatados, ex.: "오답노트" vendido em livrarias físicas) e da China (onde há cadernos dedicados com estruturas impressas por matéria), o Japão resolve o problema de forma DIY: o estudante pega um caderno de linhas genérico (normalmente Kokuyo Campus), monta o layout à mão ou com cola+recorte, e adapta livremente.

Isso não significa que o mercado é pobre — há inovação, mas ela está nos **suportes** (binder Kokuyo, ルーズリーフ/loose-leaf A4, GoodNotes no iPad) e nos **livros-guia** de método, não nos cadernos pré-impressos.

---

## 2. Terminologia japonesa (traduzida)

| Termo | Leitura (romaji) | Tradução literal | Uso predominante |
|---|---|---|---|
| 解き直しノート | toki-naoshi nōto | "caderno de resolver de novo" | Mais comum; foco em refazer o problema |
| 間違いノート | machigai nōto | "caderno de erros" | Ênfase em registrar e analisar o erro |
| やり直しノート | yari-naoshi nōto | "caderno de refazer" | Variante informal, mesmo conceito |
| 復習ノート | fukushū nōto | "caderno de revisão" | Mais amplo; pode incluir também pontos certos |
| 間違い直しノート | machigai-naoshi nōto | "caderno de corrigir erros" | Usado por cram schools (塾) |
| テスト直しノート | tesuto naoshi nōto | "caderno de revisão de teste" | Foco em provas específicas |

Todos convergem para a mesma prática. A distinção real não é de nome, é de protocolo:

- **解き直し** → ênfase em resolver novamente (ação)
- **間違い** → ênfase em registrar o erro e sua causa (diagnóstico)
- **復習** → mais abrangente, pode incluir tudo

---

## 3. Estrutura de layout — padrões dominantes

### 3.1 Layout frente/verso (表/裏 — omote/ura) — O mais sofisticado

**Página da frente (表):** problema errado + resposta errada do aluno  
**Página do verso (裏):** resposta correta + explicação + ponto-chave (ポイント)

Lógica: ao abrir na frente, o aluno tenta recordar a resposta antes de virar. Isso ativa o "efeito de teste" (*testing effect* / テスト効果) — recordação ativa, não releitura passiva.

Foto de referência: `02_machigai-note_hashimoto_layout.jpg` e `03_machigai-note_combined_layout.jpg`

**Campos observados na frente:**
- Cabeçalho: matéria / fonte do problema (ex.: "化粧品成分検定 3級") + número do problema
- Enunciado completo (copiado à mão ou colado)
- Alternativas (A, B, C...)
- Resposta errada do aluno circulada em azul/preto

**Campos observados no verso:**
- 正解: (resposta correta, em vermelho/laranja)
- 解説: (explicação — geralmente 3–5 linhas em tinta azul)
- ポイント: (ponto-chave em destaque, frequentemente sublinhado ou em caixa vermelha)
- Relacionamentos entre alternativas (ex.: "A. 水にも油にも溶けない → シリコーン" = "A. Não se dissolve em água nem óleo → Silicone")

### 3.2 Layout em grade comparativa (複数問/ページ) — "Planilha de erros"

Visto em `06_note_zeropapa_fukushu_formats_grid.png`:

6 variações de grade, todas com a mesma estrutura básica:

```
+----------+-----------+
| 問題      | 答え       |
| (enunciado)| (resposta)|
+----------+-----------+
| 解答スペース (espaço para resolver de novo)  |
+------------------------------------------+
```

Variações: 1 problema por página / 2 por página / 4 por página (com ou sem ○ de registro de tentativas ao lado).

### 3.3 Layout binder com divisórias por matéria

Visto em `05_tokinaoshi-note_real_with_dividers.jpg` (Kokuyo Campus Binder com dividers 国語/理科/社会/算数/英語):

- A4 ルーズリーフ (folhas removíveis)
- Problema colado na frente da folha
- Verso: campos manuscritos — 出典 (fonte), 日付 (data), 問題番号 (número), 式＋筆算＋答え (fórmula + cálculo + resposta)
- Após dominar o problema: a folha é retirada do binder

### 3.4 Layout matemática — 1 problema por folha dupla (frente/verso)

Visto em `08_chugakujuken_math_triangles_real.jpg` (math — triângulos, 最難関 cram school):

- Folha 1 (表): problema colado, espaço em branco abaixo para tentar resolver sem ver a resposta
- Folha 2 (裏): mesma folha, mas com o raciocínio completo escrito (途中式 — passos intermediários), diagrama redrawado pelo aluno, e resposta final
- Cabeçalho: nome do teste / data / contador de tempo (△ = tempo de leitura, O = tempo de resolução)

Este é o formato mais próximo do "Caderno de Erros" coreano em nível de profundidade — mas ainda é 100% manual.

### 3.5 Template Benesse (暗記系 — memorização)

Visto em `04_benesse_fukushu-note_template.jpg`:

Layout visual para **memorização** (não raciocínio):
- Variante 1 (一問一答 — pergunta/resposta): 2 colunas — "problema errado" | "resposta"
- Variante 2 (英単語 — vocabulário): 3 colunas — "palavra a memorizar" | "significado" | "uso/exemplo"

Este é o único caso de template pré-desenhado (publicado pela Benesse), mas é uma ilustração educativa, não um produto físico.

---

## 4. Campos recorrentes no método japonês

Consolidando todas as fontes, os campos que aparecem em 3+ variantes:

| Campo | Japonês | Função |
|---|---|---|
| Fonte/data | 出典・日付 (shutten / hizuke) | Rastreabilidade |
| Enunciado do problema | 問題 (mondai) | Conteúdo |
| Resposta errada do aluno | 自分の解答 (jibun no kaitō) | Auto-observação do erro |
| Tipo de erro | 間違えた理由 (machigaeta riyū) | Diagnóstico causal |
| Resposta correta | 正解・正しい解き方 (seikai) | Referência |
| Ponto-chave | ポイント・教訓 (pōinto / kyōkun) | Generalização para evitar repetição |
| Espaço para retentar | 解答スペース / 再チャレンジ欄 | Reforço ativo |
| Registro de tentativas | ○×欄 (maru batsu ran) | Spaced repetition manual |

---

## 5. Produtos e suportes identificados no mercado

### 5.1 Kokuyo Campus (コクヨ キャンパス) — suporte universal

Não existe um "Campus 解き直しノート" específico com layout impresso pré-formatado. O que existe:

- **Campus ノビ (Nobi)** — B5 levemente maior que o padrão, permite colar cópia B5 sem dobrar. Usado explicitamente para colar problemas de teste. Preço: ≈ ¥250/cad ou ¥1.100/5 cadernos.
- **Campus フラットが気持ちいいノート** (Flat Feel Good) — abertura 180° plana; útil para scan com celular. Tem campo de timer para 勉強時間 (tempo de estudo).
- **Campus バインダー (Binder) 2 argolas** — sistema de ルーズリーフ removível; problema dominado = folha retirada.
- **Campus ドット入り文系線** — pontilhado que ajuda a alinhar figuras e colar papéis.

Nenhum tem impressão de campos "日付 / 間違えた理由 / ポイント" como produto padrão.

### 5.2 Gakken — "1問ずつ切り取って、まちがいノートをつくれる問題集"

**Lançamento: set 2025** — o produto mais próximo de "caderno de erro estruturado" que encontramos.

- Problema com **perfuração por corte (ミシン目)**: o aluno destaca o problema errado da apostila com os dedos
- Cola em caderno auxiliar incluso na caixa
- Campos no caderno incluso: espaço livre para escrever o raciocínio + resposta
- Versões: Inglês e Matemática (高校入試 — vestibular médio)
- Preço: ¥1.485 (aprox. R$40–50)
- **Limitação:** o formato é um livro-exercício com caderno auxiliar, não um caderno autônomo de erro

### 5.3 QuizKnock×Gakken — B5 ルーズリーフ 誤答・記述

Produto colaborativo com criadores de conteúdo educacional (伊沢拓司,東大卒 / ex-aluno de Tóquio):

- Folha loose-leaf com layout pré-impresso para **problemas de resposta dissertativa** e **matemática**
- Campos: espaço para o problema (grande) + linha para "なぜ間違えたか" (por que errei) + espaço de resolução
- B5 / 30 folhas / vendido em papelaria
- **Este é o produto mais estruturado encontrado** — mas ainda é folha avulsa, não caderno completo

### 5.4 赤本ノートプラス (Akahon Note Plus) — Kyogakusha

Para simulados de vestibular (共通テスト):
- Layout impresso: gabarito de múltipla escolha (60 questões/página) + bloco de análise abaixo
- Análise: tipo de erro + ToDo para corrigi-lo
- Preço: ¥363
- Foco muito específico em provas padronizadas de opção múltipla

---

## 6. Categorização do erro no método japonês

As cram schools (塾) que mais sistemizaram o método (栄光ゼミナール, 駿台, 河合塾, 英才個別学院) ensinam a classificar o erro em 4 categorias antes de registrar:

| Categoria | Japonês | Descrição |
|---|---|---|
| Falta de conhecimento | 知識不足 | Não sabia o conteúdo; precisava memorizar |
| Leitura errada | 読み違い | Entendeu mal o enunciado, leu rápido |
| Erro de descuido | ケアレスミス | Sabia, mas errou por distração (sinal, unidade, etc.) |
| Falta de compreensão do método | 解き方の理解不足 | Não entendeu como resolver esse tipo de problema |

Essa taxonomia de 4 tipos é ensinada por tutores, não vem impressa no caderno — é um protocolo verbal, não visual.

---

## 7. Revisão espaçada no método japonês

O padrão de repetição recomendado (todos os métodos convergem):

- **1ª resolução:** no dia seguinte ao erro
- **2ª resolução:** 1 semana depois (ou antes da próxima prova)
- **3ª resolução:** 1 mês depois (ou na virada do semestre)

O registro de tentativas é feito com ○×欄 (coluna de certo/errado): mínimo de 3 caixas por problema, marcadas conforme cada tentativa. Se na 3ª ainda errar → estuda mais antes de tentar de novo.

---

## 8. Tendência digital

Parcela significativa dos usuários migrou para GoodNotes 5/6 no iPad:
- Fotografa o problema → recorta digitalmente → cola na página digital
- Vantagem: elimina o trabalho de xerox e cola física
- Ainda é DIY: o app não tem template de "caderno de erro" — o usuário cria o template manualmente

---

## 9. Pontos fortes do método japonês

1. **Profundidade do diagnóstico causal:** insiste em escrever *por que* errou (間違えた理由), não só *o que* errou
2. **Estrutura frente/verso para testing effect:** muito bem resolvida — ativa recordação antes de ver a resposta
3. **Modularidade:** o sistema de ルーズリーフ + binder permite remover o que já foi dominado, reduzindo ansiedade
4. **Taxonomia de 4 tipos de erro:** clara e acionável; facilita a tomada de decisão pós-erro

---

## 10. Pontos fracos / lacunas

1. **Ausência de produto pré-formatado premium:** sem equivalente ao "오답노트" coreano em formato físico acabado — obriga DIY manual ou digital
2. **Ausência de campo de frequência/padrão:** nenhum produto identifica "quantas vezes errei esse tipo?" de forma sistemática
3. **Sem espaço pré-alocado para "类题" (problemas análogos):** o método coreano/chinês inclui campo para colar um problema similar para praticar o padrão — o japonês deixa isso como ação externa opcional
4. **Sem integração com cronograma de revisão:** a revisão espaçada é recomendada verbalmente, mas não há campo de data de próxima revisão no caderno
5. **Sem categorização visual por nível de urgência:** sem semáforo, cor, ou tag que sinalize "rever com urgência" vs "consolidado"

---

## 11. Comparação sintética com Coreia/China

| Dimensão | Japão | Coreia | China |
|---|---|---|---|
| Forma | MÉTODO + suporte genérico | PRODUTO pré-formatado + método | PRODUTO pré-formatado + método |
| Produto físico dedicado | Ausente (DIY) | Sim, vários SKUs de livraria | Sim, cadernos com campos impressos |
| Campo "tipo de erro" | Sim (protocolo verbal das 塾) | Sim (impresso no produto) | Sim (impresso no produto) |
| Campo "problema análogo" | Não (opcional externo) | Sim | Sim |
| Campo "próxima revisão" | Não (verbal) | Sim (alguns produtos) | Sim (alguns produtos) |
| Revisão espaçada | 3× (D+1, D+7, D+30) | Variável | 3× padrão |
| Integração digital | GoodNotes DIY | Alguns apps nativos | Apps integrados em plataformas |
| Riqueza visual do produto | Baixa (caderno neutro) | Alta | Alta |

**Veredicto:** o Japão é **mais rico em método e protocolo pedagógico**, mas **mais pobre em produto físico**. A curadora da experiência é a 塾 (cram school), não o caderno em si.

---

## 12. Ideias acionáveis para o Caderno de Erros Concurseiro

Com base no benchmark japonês, 3 ideias de maior impacto:

### Ideia 1 — Layout frente/verso com testing effect

Adotar a estrutura omote/ura (表/裏) como padrão do Caderno de Erros:
- **Página da esquerda (abertura):** enunciado + resposta marcada pelo candidato (errada) + campo "por que marquei isso"
- **Página da direita (revelação):** gabarito + fundamentação legal/doutrinária + ponto-chave memorável

Isso transforma cada abertura de página em um mini-teste ativo, não leitura passiva.

### Ideia 2 — Campo "tipo de erro" impresso (taxonomia de 4 categorias adaptada para concursos)

Imprimir no caderno uma taxonomia pré-definida de erro, adaptada ao contexto de concursos públicos:

| Código | Tipo | Descrição |
|---|---|---|
| C1 | Desconhecimento | Nunca vi / não sabia |
| C2 | Confusão conceitual | Sabia, mas confundi com algo similar |
| C3 | Descuido de leitura | Entendi mal o enunciado |
| C4 | Raciocínio incompleto | Sabia o conteúdo, mas não soube aplicar |

O candidato circula o código antes de escrever a análise. Isso permite analisar o padrão de erro por matéria ao longo do tempo.

### Ideia 3 — Campo de "problema análogo" com linha de fonte

Reservar espaço fixo na página para colar/escrever 1 questão similar ao erro cometido, com fonte (ex.: "CESPE 2023 – TCU"). Isso força a generalização do padrão de erro, não só a memorização da questão específica — lacuna identificada tanto no método japonês quanto no coreano/chinês básico.

---

## Fontes e URLs

| # | Fonte | URL | Data acesso |
|---|---|---|---|
| 1 | StudyHacker — 間違いノートのつくり方 (método de 2 variantes, fotos reais) | https://studyhacker.net/machigai-notebook | 19 jun 2026 |
| 2 | Eikoh Seminar — 解き直しノートの作り方 | https://www.eikoh.co.jp/chugakujuken/column/c1020/ | 19 jun 2026 |
| 3 | Sundai Yobikou — 模試の復習ノートの作り方 | https://www2.sundai.ac.jp/column/moshi/moshi-note/ | 19 jun 2026 |
| 4 | An-English — やり直しノートの作り方 (tabela com campos) | https://an-english.com/2025/07/9778/ | 19 jun 2026 |
| 5 | Sakuragakusha — 解き直しノートの作り方 (taxonomia de 4 erros) | https://sakuragakusha.com/0705_tokinaoshi/ | 19 jun 2026 |
| 6 | Manavis (Kawai) — 模試の復習ノートの作り方 | https://www.manavis.com/mana_magazine/reviewing-mock-exams | 19 jun 2026 |
| 7 | Pocchitama — 解き直しノートの作り方 (foto real Kokuyo binder) | https://wolf1000.com/tokinaoshi_note | 19 jun 2026 |
| 8 | Chujudays — レイアウト foto real com dividers por matéria | https://chujudays.com/ | 19 jun 2026 |
| 9 | Note.com Zeropapa — grid de 6 formatos de layout | https://note.com/zeropapa_juken/n/ne11e0547194a | 19 jun 2026 |
| 10 | Gakken — 1問ずつ切り取って、まちがいノートをつくれる問題集 | https://gkp-koushiki.gakken.jp/2025/09/25/88569/ | 19 jun 2026 |
| 11 | Rakuten — QuizKnock×Gakken ルーズリーフ 誤答・記述 | https://item.rakuten.co.jp/gakkensf/d03459/ | 19 jun 2026 |
| 12 | Kokuyo — Campus ノビ produto | https://www.kokuyo.com/stationery/lp/campus/ | 19 jun 2026 |
| 13 | Kyogakusha — 赤本ノートプラス | https://akahon.net/book/detail/9001000 | 19 jun 2026 |
| 14 | Eisai Kobestu — 間違い直しノート戦略的3ステップ | https://www.eisai.org/sengokuekimae/blogs/97271 | 19 jun 2026 |
| 15 | Benesse — 問題復習ノートのテンプレート (imagem) | https://benesse.jp/kyouiku/202006/img/KJ_20200617_02_02.jpg | 19 jun 2026 |

---

## Imagens coletadas

| Arquivo | Descrição |
|---|---|
| `01_machigai-note_ishikawa_layout.jpg` | Método Ishikawa: frente da página — enunciado + resposta errada do aluno (loose-leaf pautada, forma rápida) |
| `02_machigai-note_hashimoto_layout.jpg` | Método Hashimoto: par frente/verso — frente com erro, verso com gabarito+ポイント em 2 cores (azul/vermelho) |
| `03_machigai-note_combined_layout.jpg` | Variante combinada (visão geral): par frente/verso com ポイント mais detalhado e relações entre alternativas |
| `04_benesse_fukushu-note_template.jpg` | Template Benesse: diagrama esquemático de 2 variantes de layout (一問一答 e 暗記/vocabulário) |
| `05_tokinaoshi-note_real_with_dividers.jpg` | Foto real: Kokuyo Campus Binder com dividers por matéria (国語/理科/社会/算数/英語); campos manuscritos 出典/日付/式/答え |
| `06_note_zeropapa_fukushu_formats_grid.png` | Grade comparativa de 6 variantes de layout (問題/答え/解答スペース), incluindo versões com ○ de tentativas |
| `07_eikoh_tokinaoshi_sample.jpg` | Imagem genérica do site Eikoh Seminar (cram school) |
| `08_chugakujuken_math_triangles_real.jpg` | Foto real: par frente/verso para matemática (geometria de triângulos); inclui contador de tempo △/O no cabeçalho |

---

## Tags

`#benchmark` `#japao` `#caderno-de-erros` `#machigai-note` `#tokinaoshi` `#metodo` `#layout` `#kokuyo` `#gakken` `#revisao-espacada` `#testing-effect` `#DIY` `#produto-vs-metodo`
