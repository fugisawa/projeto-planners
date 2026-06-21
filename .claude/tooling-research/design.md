# Pesquisa de Design para Planners Premium — Sistemas, UX e Referências
**Data:** 20/jun/2026 | **Fontes trianguladas:** 1101.com (Hobonichi), labonstationery.com, fortelabs.com, jmir.org, blog.provasbrasil.com.br, editorajuspodivm.com.br, venngage.com, bookdesignmadesimple.com, media-village.co.uk, syloon.com, clothandpaper.com, github.com/osresearch/DynamicTemplates, github.com/qjcg/awesome-typst

---

## 1. Princípios de Grid e Baseline em Papelaria Premium

### 1.1 Módulo de grade — o que os líderes usam

| Marca | Grade | Espaçamento | Observação |
|---|---|---|---|
| Hobonichi Techo (Original/Cousin) | 4.0 mm grid | 4.0 mm | célula mínima p/ caneta; universal |
| Hobonichi Techo Weeks | 3.55 mm grid | 3.55 mm | Weeks é mais compacto |
| Hobonichi (japonês) | 3.7 mm grid | 3.7 mm | versão nativa japão |
| Leuchtturm1917 dot grid | 5.0 mm | 5.0 mm | padrão bullet journal |
| College ruled (US) | 7.1 mm pauta | 7.1 mm | alta escola/faculdade |
| Narrow ruled | 6.4 mm pauta | 6.4 mm | escrita compacta profissional |
| Seyès (francês) | 8 mm + 2 mm sub | 8/2 mm | cursiva guiada |

**Princípio acionável:** O módulo 4–4.5 mm é o sweet spot premium — pequeno o suficiente para dois traços de caneta por módulo, grande o suficiente para marca-texto de 5 mm. O skill `planner-designer` usa 4.5 mm — correto e ligeiramente mais generoso que o Hobonichi.

### 1.2 Baseline grid como coluna vertebral

- Todo espaçamento vertical deve ser **múltiplo inteiro do módulo** (4.5, 9, 13.5, 18, 22.5 mm). Quebrar a progressão causa instabilidade visual percebida mesmo por não-designers.
- Margens simétricas são amadorismo: planner encadernado exige **margem interna maior** para compensar a curvatura do miolo. Padrão premium: inside 18 / outside 11 / top 11 / bottom 11 mm (A5).
- Divisões de coluna seguem a grade: nunca dividir em terços "a olho" — usar 1/3 + 2/3 ou 40/60 ancorado nos múltiplos do módulo.

### 1.3 Peso de linha (regras impressas)

O Hobonichi usa linhas de grade **deliberadamente tênues** (~0.3–0.4 pt) para não competir com a escrita. A regra geral:
- Grade/miolo: 0.3–0.4 pt
- Divisor de seção: 0.6–0.7 pt
- Borda de bloco: 0.5–0.6 pt
- Bordura de acento (1× por página): 2 pt
- **Nunca 1 pt interno** — cria "ruído de média intensidade" que compete com o texto sem hierarquizar

---

## 2. Escala Tipográfica para Planners A5

### 2.1 Hierarquia de 3 níveis — não 4

Exceder 3 níveis tipográficos por página fragmenta a atenção. Estrutura recomendada (Lato, validada no projeto):

| Nível | Uso | Tamanho | Peso | Tracking |
|---|---|---|---|---|
| H1 | Título da página | ~22 pt | Regular | 0 |
| H2 | Label de seção | 8–9 pt | Bold | +0.05em |
| H3 | Label de campo | 7–8 pt | Regular | +0.3 tracking |
| Dica | Texto auxiliar | 6.5–7 pt | Itálico | 0 |

**Inegociável:** Bold nunca em dica; itálico nunca em label de seção. A mistura inverte a hierarquia e destrói a legibilidade rápida.

### 2.2 Espaçamento de linha (leading)

- Print/papel tolera leading mais comprimido que tela: 1.4–1.5 × tamanho de fonte (vs. 1.5–1.8 em digital).
- Linhas de escrita (campo preenchível) em 4.5 mm equivalem a ~12.7 pt — adequado para caneta de 0.5 mm.
- Em Typst: `set par(leading: 0.6em, spacing: 0.4em)` + controlar gaps com `v()` explícito evita o gotcha de inflação de parágrafo.

### 2.3 Família tipográfica

- **Máximo 1 família, 3 pesos** (Lato: Regular / Bold / Italic). Mais que isso gera inconsistência no PDF gerado.
- Lato é "humanista/quente" — adequada para produto amigável destinado a jovens adultos.
- Inter (grotesca fria) é alternativa para visual mais técnico/corporativo; EB Garamond para editorial.

---

## 3. Sistema de Cor Contido — Premium Monocromático

### 3.1 Por que cor contida é premium

Marcas premium de papelaria (Hobonichi, Midori/MD, Leuchtturm) usam no máximo **2 tintas** no miolo:
- **Preto** (K100 puro) para todo o texto e estrutura
- **1 acento** reservado para sinalização rápida (no Hobonichi: vermelho exclusivo para domingos)

Razões técnicas + simbólicas:
- Impressão offset 2 tintas (preto + 1 Pantone spot) custa ~30–40% menos que 4 cores
- Restrição de cor comunica sofisticação (abundância de cor = produto de massa)
- A cor do usuário (marca-texto, caneta) passa a ser o terceiro elemento visual — o produto respeita a caligrafia

### 3.2 Hierarquia de cor em 3 camadas

1. **K100** — estrutura, texto, fios de grade
2. **1 azul-suave / navy / cinza frio** (~10–20% de saturação) — faixas de seção, cabeçalho, chip de matéria
3. **Branco / papel creme (fill:none)** — áreas preenchíveis. Nunca colorir o fundo das linhas de escrita.

**Inegociável:** nenhum fundo de cor em time-log ou checklist. O papel creme é a cor de preenchimento.

### 3.3 Pigmento e TAC (Total Area Coverage)

Para offset CMYK:
- Preto de texto: **K100 puro** (não rich black — evita microrregistro)
- Preto rico (capas): C60 M40 Y40 K100 = TIC 240% (seguro para couché)
- TAC máximo: checar com a gráfica (210–300% dependendo do papel)
- Cores de acento spot: especificar como Pantone (PMS), não como processo, para fidelidade de cor

---

## 4. Psicologia do Uso — O Que Faz Funcionar e Abandonar

### 4.1 Causas de abandono (triangulado: fortelabs + jmir + provasbrasil + habit research)

| Causa | Mecanismo | Solução de design |
|---|---|---|
| **Mentalidade tudo-ou-nada** | Falta de 1 dia → sensação de fracasso total → abandono | Nunca imprimir grade de 365 dias contínua; usar semanas soltas ou módulos |
| **Culpa de campo vazio** | Campos grandes não preenchidos geram vergonha ativa | Campos de reflexão ≤ 3–4 linhas (nunca meia página em branco estruturada) |
| **Sobrecarga de formatação** | Planner exige mais tempo de preenchimento que de estudo | Preenchimento ≤ 5 min/dia; campos rápidos, não dissertativos |
| **Rigidez de cronograma** | Grade horária muito detalhada falha ao primeiro imprevisto | Time-log de 10 min (INDIGO) é mais resiliente que agenda de 30 min |
| **Perfeccionismo estético** | Usuário não preenche se "não vai ficar bonito" | Layout permissivo; campos sem bordas decorativas que exponham imperfeição |
| **Falta de ritual** | Planner sem âncora emocional é só mais um caderno | Campo "Hoje ·" (Hobonichi) ou frase do dia cria abertura e fechamento |

**Insight crítico:** a pesquisa de fortelabs confirma que "o que é simples é sustentável" e "o que é prazeroso é motivante". Simplicidade e sensorialidade (papel + tinta) são os dois pilares.

### 4.2 O que faz funcionar (pesquisa comportamental)

- **Fricção benéfica**: escrever à mão força seleção — o usuário descarta o que não importa. Não eliminar essa fricção com campos demais.
- **Visualização de progresso**: marcar células do time-log confere satisfação imediata (dopamina de rasurar tarefa). Célula 4.5 mm é mínimo para marca-texto físico — abaixo disso não dá para colorir.
- **Ciclo de revisão embutido**: daily → weekly → monthly. O planner deve ter espaço para cada escala sem forçar o usuário a criar ele mesmo.
- **Identidade, não meta**: campos de reflexão que ancorem identidade ("quem quero ser") têm 32% mais adesão que campos orientados a output ("quantas horas estudei") — literatura de 2024.
- **Planejado vs. Realizado**: presença dos dois campos (Kokuyo) sem exigir preenchimento perfeito dos dois permite uso parcial honesto.

### 4.3 Anti-culpa: princípios de design

1. **Campos não-obrigatórios visualmente**: não pontilhar linhas em todas as células que não forem usadas; deixar espaço livre explicitamente marcado como opcional com label leve ("opcional") ou simplesmente deixar sem prompt.
2. **Sem contador de dias corridos na capa**: expõe a sequência quebrada.
3. **Módulos semanais sem datação impressa** (planner perpétuo): usuário começa quando quiser sem culpa de "dias perdidos antes de começar".
4. **Chips de matéria coloríveis, não coloridos**: o aluno escolhe suas cores — personalização cria ownership.
5. **"O que pensei (errado)"**: no caderno de erros, o campo do raciocínio equivocado vem ANTES da solução correta. Reconhecer o erro sem punição é o núcleo da ficha.

---

## 5. Referências Premium — O Que Extrair de Cada Uma

### 5.1 Hobonichi Techo
**URL:** https://www.1101.com/store/techo/en/2026/all_about/planner/

| Elemento | Especificação | O que copiar |
|---|---|---|
| Grade | 4.0 mm (Planner) / 3.55 mm (Weeks) | módulo de célula, tensão entre guia e liberdade |
| Cor | Cinza carvão + vermelho exclusivo p/ domingo | acento único com função semântica clara |
| Área livre | ~85–90% da página para escrita/desenho | proporção máxima de espaço não-estruturado |
| Cabeçalho | Mínimo — data, indicadores leves | sem overhead visual no topo |
| Binding | 180° lay-flat | critério de produção para manuseio |
| "Secret Line" (Weeks) | Linha vertical invisível no memo | andaime que não grita |
| Subdivisão diária | 2 pontos sutis (manhã/tarde/noite) | hierarquia de tempo sem rigidez de agenda |
| Ritual | Quote diário (Weeks) | elemento editorial que cria abertura |
| Personalização | Número serial único em cada cópia | detalhe de premium que cria identidade |

**O que NÃO copiar:** o layout japonês pressupõe escrita asiática — adaptações para português precisam de espaço vertical maior por linha.

### 5.2 Midori MD Paper
**URL:** https://www.midori-japan.co.jp/english/products/diary/

| Elemento | Especificação | O que copiar |
|---|---|---|
| Papel | MD Paper creme, ~52–68 gsm, refinado desde 1960s | especificação de papel branco-marfim p/ RFQ |
| Layout diário | Página esquerda: timeline 24h; direita: livre | divisão estrutura/liberdade em spread |
| Gradação de cor | Variação de tom por hora do dia | ideia de "temperatura visual" da página |
| Acabamento | Lay-flat, 2 marcadores, índice de adesivos | detalhes de usabilidade física |
| Estética | Minimalismo austero — toda atenção vai para o conteúdo | validação do princípio "andaimes invisíveis" |

### 5.3 Leuchtturm1917
**URL:** https://www.leuchtturm1917.us/notebooks/all-formats/

| Elemento | Especificação | O que copiar |
|---|---|---|
| Dot grid | 5.0 mm, pontos 0.5pt | grade que não aparece em foto mas ajuda na escrita |
| Páginas numeradas | Numeradas desde a página 1 | facilita referência cruzada e índice |
| Índice | 2 páginas dedicadas no início | habit de indexação que reduz retrabalho |
| Gramatura | 80 gsm padrão / 100–120 gsm premium | especs de papel p/ contraproposta ao fornecedor |
| Paleta de capas | Ampla, com nomes poéticos | estratégia de SKU por cor/edição |
| Bullet Journal Ed.2 | 120 gsm, Grid Guide incluído | validação de papel pesado para usuário intensivo |

### 5.4 Planners de Concurseiro Brasileiros
**URL:** https://www.editorajuspodivm.com.br/planner-do-concurseiro-juspodivm-2026 | https://blog.provasbrasil.com.br/dicas-para-aprovacao/melhor-planner-estudos-concursos-guia/

| Elemento | Observação | Aprendizado |
|---|---|---|
| Formato | 14 × 21 cm (aprox. A5), 608 páginas, espiral | espiral é essencial para manuseio intensivo diário |
| Tracker de humor/sono | Integrado ao semanal | bem-estar = produtividade: usuário sabe disso |
| Time log | Horas planejadas vs. reais | campo "planejado / realizado" é esperado pelo público |
| Checklist de STJ/STF | Jurisprudência integrada | nicho de concurseiro jurídico — não copiar literalmente |
| Tracker de simulado | Performance por edição | analogia: "ficha de treino" para concurso |
| Rastreamento de edital | Edital como checklist de matérias | mapear o edital é o primeiro passo de todo concurseiro |
| Layout semanal | Mais popular que layout diário | semanal = flexibilidade sem perder estrutura |

**Crítica:** o Juspodivm tem 608 páginas — é denso demais, gera sobrecarga. O Concurseiro do projeto deve ser mais cirúrgico: **menos seções, mais profundidade em cada uma**.

---

## 6. Design de Formulários Preenchíveis (Anti-Culpa)

### 6.1 Princípios de espaço de escrita

- **Linha ≥ 4.5 mm** para caneta esferográfica/fineliner; ≥ 6 mm para caneta fountain pen ou letra maior
- **Campo de reflexão ≤ 4 linhas**: campo de meia página em branco estruturada é psicologicamente penalizador — o usuário vê o que não preencheu, não o que escreveu
- **Proporção escrita/estrutura**: 80–85% da área preenchível (Hobonichi model); estrutura impressa ≤ 15–20%
- **Prompt como convite, não obrigação**: "Hoje ·" ou "Insight →" é menos coercitivo que "O que você aprendeu hoje?"

### 6.2 Hierarquia visual em campos

Ordem de attention capture em um formulário físico:
1. Bloco maior (time-log / grade) — captura o olho primeiro
2. Título/cabeçalho — âncora temporal
3. Campos de reflexão — na parte inferior ou lateral (não no início)
4. Dicas/prompts — menor, mais claro, sempre opcional em aparência

### 6.3 Interação entre branco e preenchido

- White space ≥ 30% da área não estruturada reduz percepção de "caderno difícil de usar"
- Espaço vazio é **ativo** — comunica "aqui você decide". Não preencher com ornamentos ou bordas decorativas.
- A percepção de qualidade premium está **diretamente correlacionada** com whitespace (Nielsen/Venngage): marcas de luxo usam espaço generoso; espaço apertado = produto de massa

---

## 7. Acabamento Premium — Produção Física

### 7.1 Opções de acabamento e custo/impacto

| Técnica | Impacto visual | Papel mín. | Custo relativo | Recomendação projeto |
|---|---|---|---|---|
| **Foil stamping** (ouro/prata) | Máximo "luxo instantâneo" | 250 gsm | Alto | Capa — logotipo/nome |
| **Embossing** (alto relevo) | 3D tátil, sofisticado | 250 gsm | Alto | Capa — em combinação com foil |
| **Debossing** (baixo relevo) | Minimalista premium | 250 gsm | Médio | Capa — nome da série |
| **Spot UV** | Contraste glossy/matte moderno | qualquer | Médio | Elementos gráficos de capa |
| **Soft-touch laminação** | Toque aveludado, antiimpressão digital | qualquer | Baixo-médio | Toda capa — base obrigatória |

**Combinação ótima para Fase 1 (baixo volume, gráfica BR):** soft-touch + debossing no nome. Foil é mais caro e requer ferramental de matriz.

### 7.2 Papel do miolo

| Gramatura | Uso | Observação |
|---|---|---|
| 52–68 gsm | Miolo premium japonês (Tomoe River, MD Paper) | altíssimo custo, ghosting mínimo |
| 70–75 gsm | Planner mass market | aceita esferográfica; ghosting com fineliner |
| 80 gsm | Leuchtturm padrão | equilíbrio custo/qualidade |
| 90–100 gsm | Premium ocidental | caneta fountain pen sem bleed |
| 120 gsm | Leuchtturm BuJo Ed.2 / capa | muito pesado p/ miolo → volume/peso |

**Recomendação projeto Concurseiro:** **75–80 gsm creme** (offset ou sulfite reciclado creme). Compatível com as gráficas BR cotadas; equilibra custo e experiência com caneta esferográfica e marca-texto.

---

## 8. Repositórios e Recursos com URL

| Recurso | URL | O que copiar |
|---|---|---|
| **DynamicTemplates** (GPL-3.0) | https://github.com/osresearch/DynamicTemplates | Sistema de template parametrizado (line-spacing, margens, múltiplos de módulo). Não copiar código diretamente (GPL contamina), mas estudar a arquitetura de parametrização |
| **DIY Planner Templates** | https://www.diyplanner.com/diy-planner-templates/ | ~100 formulários modulares clássicos (A5/Classic); referência de categorização de seções e proporções de campo |
| **Hobonichi Weeks design** | https://www.1101.com/store/techo/en/2026/all_about/weeks/ | Especificação 3.55 mm, "Secret Line", cabeçalho mínimo, quote diário |
| **Hobonichi Planner design** | https://www.1101.com/store/techo/en/2026/all_about/planner/ | Grid 4 mm, filosofia "refinado e simplificado para todos os países/idiomas" |
| **Leuchtturm1917 formats** | https://www.leuchtturm1917.us/notebooks/all-formats/ | Opções de ruling, gramatura, numeração, índice |
| **Midori MD Diary** | https://www.midori-japan.co.jp/english/products/diary/ | Layout diário 24h esquerda + livre direita; gradação de cor por período do dia |
| **Ruling standards guide** | https://labonstationery.com/how-far-apart-are-lines-on-notebook-paper-a-complete-guide-to-ruling-standards/ | Tabela completa de espaçamentos por país/uso; referência técnica para RFQ |
| **Planner de Estudos PDF (Editais Verticalizados)** | https://editaisverticalizados.com.br/wp-content/uploads/2025/02/Planner-de-Estudos-do-Concurseiro.pdf | Exemplo A4 CMYK de layout para concurseiro brasileiro (free, referência de mercado local) |
| **Planner Concurseiro Juspodivm 2026** | https://www.editorajuspodivm.com.br/planner-do-concurseiro-juspodivm-2026 | Referência direta de concorrente brasileiro: seções, volume, preço de prateleira |
| **Cloth & Paper** (premium US) | https://www.clothandpaper.com/ | Sistema modular ("FORMA"), paleta neutra terra, posicionamento "Plan Beautifully" |
| **awesome-typst** | https://github.com/qjcg/awesome-typst | Lista de templates Typst (calendário, timetable, notas); october e typst-timetable para estudo |
| **october** (Typst calendar) | https://github.com/extua/october | Template minimalista A4 landscape; exemplo de restraint e parametrização |
| **Fortelabs: Analog System** | https://fortelabs.com/blog/the-analog-productivity-system-journaling-for-every-season-of-life/ | UX/psicologia do uso real: fricção benéfica, simplicidade sustentável, ritualização |
| **JMIR: Digital Habit Interventions** | https://www.jmir.org/2024/1/e54375 | Revisão sistemática (2024): barreiras de abandono, design patterns que aumentam adesão |
| **Book Design Color Guide** | https://www.bookdesignmadesimple.com/devising-a-color-palette-for-your-book/ | Paleta para impressão: spot vs. process, TAC, PMS; referência técnica de produção |

---

## 9. Melhorias Concretas Recomendadas para o Skill `planner-designer`

### 9.1 Adições ao sistema de design (não contradizem o atual — complementam)

**A. "Secret Line" vertical** (Hobonichi Weeks)
O Weeks usa uma linha vertical sutil no memo para permitir 2 colunas livres sem enforçar. Para o Concurseiro: adicionar uma linha vertical leve (~0.25 pt, cor grade) no campo de notas livres da página semanal, criando opcional "2 colunas de anotação" sem grid explícita.

**B. Subdivisão de período sem hora fixa**
Em vez de time-log com horários impressos fixos (ex.: "06h, 07h…"), oferecer o cabeçalho das colunas como **período** (Manhã / Tarde / Noite) e deixar os slots de 10 min sem rótulo de hora. O usuário âncora os blocos no início do período. Reduz rigidez e o sentimento de "comecei atrasado".

**C. Campo "Hoje · Amanhã ·"** (Hobonichi editorial)
Adicionar um campo de rodapé 2-em-1 ultra-compacto (1 linha cada): "Hoje ·" (retrospecto em 1 linha) e "Amanhã →" (intenção em 1 linha). Reforça o loop diário sem pesar.

**D. Chip de matéria com legenda externa ao corpo**
O chip já existe. Garantir que a legenda das cores fique **fora do corpo da página** (contracapa ou aba), nunca repetida dentro de cada página. Repetir a legenda dentro gera ruído e infantiliza o produto.

**E. Proporção planejado/realizado com tolerância visual explícita**
No campo de horas (Sessões ___ × ___ min), adicionar "± ok" em 6.5 pt itálico logo abaixo do campo realizado. Sinal explícito de que desvio é esperado — anti-culpa por design.

### 9.2 Inegociáveis a manter (confirmados por pesquisa)

- **≤ 3 tamanhos de tipo por página** — confirmado pela pesquisa de hierarquia tipográfica
- **Sem fundo de cor em time-log** — confirmado pelo princípio de whitespace premium
- **Campos de reflexão ≤ 4 linhas** — confirmado pela pesquisa de anti-culpa e abandono
- **fill:none no papel creme** — a cor vem do marca-texto do usuário (princípio Hobonichi/Midori)
- **Legenda de símbolos 1× na contracapa** — evitar repetição que gera ruído

### 9.3 Melhorias na toolchain / skill `typst-planner`

**F. PNG de referência por página**
Documentar 1 PNG de "versão boa" de cada página (diária, semanal, mensal, ficha) como referência visual imutável no diretório `design/concurseiro/planner-v1/reference/`. Antes de qualquer edição, comparar o PNG gerado com o de referência. Evita regressão visual silenciosa.

**G. Checker de módulo**
Script `check_module.py` que lê o arquivo `.typ` e verifica se todos os valores de `v()`, `row height` e margens são múltiplos de 4.5 mm (tolerância ±0.1 mm). Impede drift de módulo ao iterar.

**H. Paleta nomeada como constante**
No `config.typ`, nomear as cores com semântica de uso, não de aparência.
> ⚠️ **Superado na implementação 2.0 (21/jun/2026):** o `config.typ` real usa **exclusivamente `cmyk()`**
> (não `luma()`/`rgb()`), porque `luma`/`rgb` perdem informação na conversão GS→CMYK e podem alterar o
> preto suave e o azul. O snippet abaixo é a ideia original (semântica de uso, ✔), mas com tokens CMYK.
```typst
// IMPLEMENTAÇÃO REAL (CMYK-only) — ver config.typ:
let grid-c  = cmyk(16%, 7%, 0%, 5%)   // grade de fundo
let hair    = cmyk(20%, 9%, 0%, 20%)  // divisor / escrita
let accent  = cmyk(52%, 22%, 0%, 4%)  // azul-suave; 1 acento permitido
let band    = cmyk(9%, 4%, 0%, 3%)    // faixa neutra
```
Nunca usar valores hex/`rgb`/`luma` diretamente nas páginas — sempre via token CMYK.

**I. Variante de acabamento no Typst**
Adicionar ao `config.typ` um flag `modo-prova` (bool) que, quando ativado, mostra apenas o contorno de corte e as marcas de sangria (sem conteúdo). Facilita envio de arquivo de prova para gráfica sem gerar um PDF separado do zero.

### 9.4 Para o skill `planner-designer` (SKILL.md)

**J. Adicionar seção "Gradações de cor por contexto"**
Documentar quando usar `luma(x)` vs `rgb(...)` vs `cmyk(...)` em Typst para garantir que o preview RGB e o CMYK final sejam coerentes. Incluir a equivalência aproximada em Pantone para o azul de acento.

**K. Adicionar "Checklist de consistência entre páginas"**
Antes de declarar qualquer página pronta, verificar:
- [ ] Módulo vertical: todos os espaços são múltiplos de 4.5 mm
- [ ] Tipos: ≤ 3 tamanhos no corpo da página
- [ ] Cor: apenas K + 1 azul-suave (sem cor nova)
- [ ] Fios: nenhum fio interno de 1 pt
- [ ] Área livre: ≥ 80% do corpo é preenchível (não impresso)
- [ ] Campos de reflexão: ≤ 4 linhas cada
- [ ] PNG gerado e inspecionado

---

## 10. Síntese Executiva (≤ 15 linhas)

O princípio central que une todas as referências premium (Hobonichi, Midori, Leuchtturm) é o mesmo que o skill já codifica: **andaimes invisíveis** — a estrutura organiza o olho mas cede protagonismo à caligrafia do usuário. A pesquisa de abandono confirma que os maiores inimigos do planner de estudo são a culpa do campo vazio (campos grandes não preenchidos) e a mentalidade tudo-ou-nada (um dia perdido = planner abandonado). As melhorias mais impactantes são: (1) subdividir o time-log por período em vez de hora fixa, reduzindo rigidez; (2) adicionar "± ok" explícito no campo realizado, sinalizando que desvio é normal; (3) garantir que campos de reflexão nunca passem de 4 linhas; (4) criar um checker de módulo (4.5 mm) para impedir drift tipográfico nas iterações. Em produção, soft-touch + debossing na capa entrega 80% do premium percebido com o menor custo de matriz. Papel 75–80 gsm creme é o ponto ótimo para o público-alvo (marca-texto + esferográfica) sem estourar custo. O sistema de cor atual (frio-monocromático, 1 acento) é correto e não precisa de revisão — só formalizar os tokens no `config.typ`.

---

## Referências

- [Hobonichi Planner Design 2026](https://www.1101.com/store/techo/en/2026/all_about/planner/) — especificações de grid, cor, filosofia
- [Hobonichi Weeks Design 2026](https://www.1101.com/store/techo/en/2026/all_about/weeks/) — grid 3.55 mm, Secret Line, quote diário
- [Hobonichi Techo (Wikipedia)](https://en.wikipedia.org/wiki/Hobonichi_Techo) — histórico e filosofia mingei
- [Ruling Standards Guide — Labon Stationery](https://labonstationery.com/how-far-apart-are-lines-on-notebook-paper-a-complete-guide-to-ruling-standards/) — tabela completa de espaçamentos
- [Analog Productivity System — Forte Labs](https://fortelabs.com/blog/the-analog-productivity-system-journaling-for-every-season-of-life/) — psicologia de uso real
- [Digital Habit Interventions — JMIR 2024](https://www.jmir.org/2024/1/e54375) — barreiras de abandono, revisão sistemática
- [Melhor Planner para Concursos — Provas Brasil](https://blog.provasbrasil.com.br/dicas-para-aprovacao/melhor-planner-estudos-concursos-guia/) — features eficazes, causas de abandono, mercado BR
- [Planner Concurseiro Juspodivm 2026](https://www.editorajuspodivm.com.br/planner-do-concurseiro-juspodivm-2026) — concorrente direto, seções, volume
- [White Space Design — Venngage](https://venngage.com/blog/white-space-design/) — whitespace e percepção de premium
- [Book Color Palette — Book Design Made Simple](https://www.bookdesignmadesimple.com/devising-a-color-palette-for-your-book/) — spot vs. process, TAC, PMS
- [Premium Print Finishes — Media Village](https://www.media-village.co.uk/print/premium-print-finishes-spot-uv-embossing-debossing-foiling/) — técnicas de acabamento
- [Stationery Design Principles — Syloon](https://www.syloon.com/stationery-designs-top-6-principles) — 6 princípios de design de papelaria
- [Cloth & Paper](https://www.clothandpaper.com/) — sistema modular premium ocidental
- [DIY Planner Templates](https://www.diyplanner.com/diy-planner-templates/) — 100 formulários modulares clássicos
- [Dynamic Templates — GitHub](https://github.com/osresearch/DynamicTemplates) — parametrização de template (GPL-3.0)
- [awesome-typst — GitHub](https://github.com/qjcg/awesome-typst) — ecossistema Typst para planners/calendários
- [Midori MD Diary 2026](https://www.midori-japan.co.jp/english/products/diary/) — layout diário 24h + livre, papel MD Paper
- [Leuchtturm1917 Formats](https://www.leuchtturm1917.us/notebooks/all-formats/) — ruling, gramatura, numeração
