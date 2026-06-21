# Síntese de Design Refinada — Planner Concurseiro A5

> Direção consolidada após análise de 5 famílias de referência.
> Base para o skill `planner-designer`. Idioma de trabalho: pt-BR.

---

## ⭐ 2.0 PRO — atualização (20/jun/2026) · onde houver conflito, vale ESTA seção

O protótipo foi elevado ao nível "capricho" JP/KR. Deltas que **superam** o texto antigo abaixo:

- **Título de página:** Lato **Black 18pt em azul-ardósia (`title-c`)** + "tab" de acento + eyebrow mutado — não "Regular 22–26pt". É o momento cromático, com propósito. **Diário:** sem título grande, só eyebrow "DIÁRIO · FOCO DO DIA" + tab.
- **Hierarquia:** em página **sem título grande** (Diário), o cabeçalho de seção é **discreto** (`softhead`, 8.5pt ink-2) — não pode dominar.
- **Cantos:** **TUDO RETO** (células, quadrados, chips, checkboxes e **faixas sombreadas**). Só círculos redondos. (Substitui a regra antiga de "chip/container arredondados".)
- **Listas de escrita:** estilo **INDIGO** — coluna de matéria (sigla) │ **divisória vertical** │ tarefa na pauta │ ○ (helper `studyrows`). **Abandonados:** chip-box (tamanho não batia com células/dots) e dot-grid substrato (desalinhava elementos + duplicava a grade).
- **Alinhamento:** divisórias de seções irmãs **alinham** (faixa do Revisar = largura cheia, sem recuo); linhas de preenchimento na **base do texto** (`align: bottom`).
- **Cor mais quieta** (`grid-c` = cmyk 16/7/0/5) + **hierarquia de fios** no time-log (`grid-h` hora 0.5pt vs `grid-c` 10-min 0.3pt) + **figuras tabulares** (Lato `number-width: "tabular"`) em tudo.

> Fonte de verdade do 2.0 = arquivos em `../planner-v1/typst/` + skills `planner-designer` e `typst-planner`.

---

## 1. Princípio central

O produto é um **campo em branco com andaimes invisíveis.**
A impressão existe para organizar o olho; a cor vem do marca-texto do aluno.
Qualquer elemento impresso que chame mais atenção que a caligrafia é ruído.

---

## 2. Sistema tipográfico

### Família e pesos
**Lato** (instalada, pesos estáticos). Um único slide scale com 3 pesos funcionais:

| Nível | Peso | Tamanho | Tracking | Uso |
|---|---|---|---|---|
| Título de página | Black 900 | 18pt | -0.1pt | Nome da seção em azul-ardósia (`title-c`) — Diário usa só eyebrow (sem título grande) |
| Label primário de seção | Bold 700 | 8–9pt | +0.2pt | "Estudar", "Revisar", "Mapa do Edital" |
| Label de campo | Regular | 7–8pt | +0.3pt | "Data", "Matéria", "D-prova" |
| Dica / instrução | Regular itálico | 6.5–7pt | 0 | hints e instruções in-page |
| Hora / micro | Regular | 6–6.5pt | 0 | Números de hora no time-log |

_(Linha "Título de página" supercede o valor Regular 22–26pt pré-2.0 PRO, revogado em 20/jun/2026.)_

**Regra:** nunca bold em dicas. Nunca itálico em labels de campo. Caixa alta + tracking no lugar de bold para labels secondários.

### Kicker (acima do título)
Lato Regular 7pt, caixa alta, tracking 1.2pt, cor `ink-3`. Posição: canto superior direito, alinhado à baseline do título.

### Hierarquia máxima por página
3 níveis, nunca 4. O quarto nível é ruído.

---

## 3. Grid e baseline

### Módulo base: 4.5 mm
Todo espaçamento vertical é múltiplo de 4.5 mm. Consistência que o olho sente mas não identifica.

### Time-log (grade de pintura)
- Células: **4.5 mm de altura × coluna automática** (1fr por célula). Largura das colunas ≈ 5–6 mm dado o espaço disponível em A5.
- Fio interno: 0.3–0.4 pt, `grid-c` (azul-claro atual).
- Fio externo de bloco: ausente — o fio já delimita visualmente.
- Regra confirmada pelo uso real: 4 mm é o mínimo para highlighter; 4.5 mm é o conforto.

### Grade livre (páginas de escrita aberta)
Quadriculado 4 mm, cor `grid-c` a ~25–30% opacidade. Nunca pauta horizontal simples em zonas de diagnóstico — a grade acomoda esquemas, árvores e tabelas improvisadas.

### Margens A5 (148 × 210 mm)
```
inside (wire-o): 18 mm
outside:         11 mm
top:             11 mm
bottom:          11 mm
```
Área útil resultante: 119 × 188 mm.
A margem inside de 18 mm já é a do config.typ — manter.

### Espaçamento entre seções
Mínimo 4.5 mm (1 módulo); seções grandes separadas por 9 mm (2 módulos). Nunca fio duplo ou ornamento para separar — só espaço.

---

## 4. Paleta e uso da cor

### Tokens atuais (2.0 — sincronizados com config.typ)

| Token | CMYK | Uso |
|---|---|---|
| `ink` | C0 M0 Y0 K88 | texto principal |
| `ink-2` | C32 M16 Y0 K56 | rótulos de campo, labels de seção |
| `ink-3` | C28 M12 Y0 K40 | dicas, instruções, horas |
| `title-c` | C68 M44 Y0 K48 | azul-ardósia — títulos de página (Lato Black) |
| `accent` | C52 M22 Y0 K4 | azul suave — tab, círculo D-prova, setas (1 posição/página) |
| `grid-c` | C16 M7 Y0 K5 | grade do time-log / divisões de 10 min (quieta) |
| `grid-h` | C22 M10 Y0 K15 | linha de hora no time-log (hierarquia) |
| `hair` | C20 M9 Y0 K20 | fios de seção, bordas de campo |
| `band` | C9 M4 Y0 K3 | faixa sombreada (Revisar / Ajuste de Rota) |

**Não adicionar novas cores ao sistema.** Apenas **1 acento (azul)** por página — não há mais dourado/cobre; o acento do 2.0 é o azul-suave (`accent`).

### Regra de contenção (Hobonichi + INDIGO)
- 1 acento cromático estrutural (`accent` azul) para bordas e destaques funcionais.
- 1 tom neutro quente (`band`/`tint`) para faixas de destaque.
- O terceiro acento é o marca-texto do aluno — o design não compete com ele.
- Fundo de página: sempre `fill: none` (papel creme vem do substrato). Nunca imprimir fundo de cor em zonas de time-log ou checklist.

---

## 5. Espessuras de fio

| Função | Espessura | Token |
|---|---|---|
| Grade interna (time-log, quadriculado) | 0.3–0.4 pt | `wt.grid` / `wt.hair` |
| Linha de escrita pontilhada | 0.4 pt tracejado | `hair` |
| Linha de escrita sólida | 0.4 pt | `hair` |
| Divisor de seção horizontal | 0.6–0.7 pt | `wt.rule` |
| Borda de bloco (softband, ficha) | 0.5–0.6 pt | `wt.box` |
| Bordura editorial lateral (accent) | 2 pt | uso pontual, 1 vez por página |

Nunca 1 pt em fios internos de tabela. O 1 pt surge apenas em bordas externas de tabelas funcionais isoladas.

---

## 6. Cantos (RETO — 2.0 PRO)

Todos os elementos internos (chips, softband, checkboxes, faixas sombreadas, células) têm cantos **RETOS** — sem radius. Só círculos são redondos (donecirc, radio do helper studyrows). Regra antiga de radius revogada em 20/jun/2026 pela decisão 2.0 PRO. Confirmar em estilos.typ: `chip=box()`, `softband=block()`, `checkbox=rect()`.

_(Supercede o valor pré-2.0 PRO: chips 1 mm · softband 2 mm · ficha 1.2 pt · checkboxes 0.6 mm — revogados.)_

---

## 7. O que copiar de cada referência — e por quê

### INDIGO Study Planner (5 modelos coreanos)
**Copiar:**
- Sistema de uma cor de acento + preto. Nossa paleta já respeita isso — manter.
- Time-log de 10 min como núcleo emocional. Já implementado e correto.
- Grade interna com fios contíguos, sem gutter (já implementado via `table` com `inset: 0`).
- Chip colorível à esquerda de cada linha de tarefa — mantido. Calibrar para **8 mm de largura** (reduzir de 9 mm; chips largos demais pesam a linha).
- 3 ícones de compreensão na Ficha de Erro: adaptar como checkboxes ○ △ × (já implementado como Ponto-cego / Armadilha / Questão-modelo).
- Campo D-day como círculo vazio de preenchimento manual — mantido, é o elemento correto.

**Não copiar:**
- Datas pré-impressas (nosso produto é perpétuo).
- Logotipos ilustrativos na capa (nossa capa é tipográfica pura).

### Hobonichi Cousin A5
**Copiar:**
- Grade 4 mm como campo universal de escrita livre (para Ficha de Erro e zonas abertas). Quadriculado acomoda diagramas; pauta horizontal não.
- Hierarquia em 2 pesos tipográficos por página (label leve + corpo regular), sem bold decorativo.
- 85–90% de área livre no spread diário — no nosso Diário, a legenda "cada quadradinho = 10 min" deve sair do corpo e ir para margem ou página de instruções.
- Abas de seção em papel opaco de cor (implementar na produção física — fora do scope Typst).
- Cabeçalho mínimo de ~9 mm de altura contendo 4–5 informações — mantido.
- Rodapé editorial de 10–12 mm com texto 6–7 pt — adicionar ao Diário (campo "Hoje ·" de 2 linhas).

**Não copiar:**
- Tipografia bilíngue japonês/latim (não aplicável).
- Grade 3.7 mm (pequena demais para caligrafia BR — usar 4–4.5 mm).

### Kokuyo Campus Study Planner
**Copiar:**
- Time-log por matéria pintado em cores como peça visual âncora — já implementado.
- Separação clara entre tempo planejado e realizado: no Diário, o campo "Tempo de estudo" deve ter dois subcampos: `Sessões ___ × ___ min`.
- Colunas de time-log com campo "TOTAL h" no rodapé — adicionar ao Diário (já existe "Questões / Acertos / %", expandir com "h líquidas").
- Visual quase monocromático com acento único — já implementado.

**Não copiar:**
- Soft-ring (decisão de produção, não de layout).
- Resolução de 30 min por célula (10 min é o correto para nosso produto).

### Premium ocidental + Bullet Journal (Rhodia, Leuchtturm, Moleskine, BuJo)
**Copiar:**
- Key de símbolos na contracapa interna — imprimir 1 vez, 7 pt, 2 colunas, cinza: `• tarefa · – nota · ○ evento · ✕ feito · → migrado · * prioridade`.
- Campo "Hoje ·" de 2 linhas no rodapé do Diário (implementar — ausente no v1).
- Seção "Migrar para próxima semana" de 1–2 linhas no Semanal após Ajuste & Reflexão.
- Fio tracejado para campos de escrita livre (sinaliza "escreva aqui" sem rigidez de fio sólido).
- Caixinha de matéria (chip) **com borda de 0.5 pt, canto reto** — chips com canto muito arredondado remetem a caderno infantil; o chip da Ficha de Erro deve ter canto mais reto.
- Espaçamento entre seções via espaço vazio, nunca via fio duplo.
- Número de página no canto inferior externo, 7 pt, cinza `ink-3`.

**Não copiar:**
- Dot grid nas páginas funcionais (só em páginas livres e Ficha de Erro).
- Bold em labels de seção de mais de 2 palavras — soa pesado.

### 3TIMES One Day Study Planner
**Copiar:**
- Cabeçalho diário com proporção DATE (50%) / D-DAY com círculo (25%) / TEMPO (25%). Nossa versão atual tem a hierarquia invertida (D-day centrado no topo sozinho) — reorganizar: data à esquerda grande, D-day ao centro com círculo, tempo à direita.
- Numeração com zero à esquerda nos rótulos de hora: "05", "06"... já implementado.
- Slot de 22–25 mm à esquerda das linhas de tarefa para tag colorida — nosso chip de 9 mm é menor; considerar que 9 mm é suficiente para sigla + tinta.
- Status circle à direita da linha: círculo vazio 4–5 mm, apenas o anel impresso. O usuário decide o sistema (cheio = feito, seta = migrado). Nosso `donecirc` já faz isso — manter.
- Labels em ALL CAPS com tracking para rótulos secundários (já implementado no Semanal e Bússola).
- Mensagem de instrução com bordura editorial lateral (accent 2 pt) — já na Ficha de Erro. Replicar no Diário se houver instrução de uso in-page.

**Não copiar:**
- Twin-wire navy (decisão de produção).
- Grid de 3 colunas Morning/Afternoon/Night com rótulos em inglês — já adaptamos para Manhã/Tarde/Noite.

### Comportamento real de uso (JTBD, queixas)
**Copiar:**
- Ampliar células do time-log de ~3.5 mm para **4.5 mm** de altura (confirmado como necessário para highlighter).
- Legenda "cada quadradinho = 10 min" deve migrar para **margem lateral** ou página de instruções — não aparece no corpo da página.
- Coluna "COR" de 8 × 8 mm ao lado de cada linha do Mapa do Edital na Bússola — o color-coding que perpassa todos os spreads precisa ter ponto de definição.
- Campo "Sessões" ao lado de "Horas" no fechamento diário e no Balanço Mensal.
- "Por que quero isso?" precisa de **4 linhas de espaço** (alta relevância emocional + evidência de abandono quando limitado a 1 linha).
- Calendário de Provas com linhas de **5–6 mm de altura** para escrita manual confortável (atual tem ~3 mm — muito apertado).
- Campo "MEU RACIOCÍNIO ANTES DE ERRAR" vem **antes** da solução correta na Ficha de Erro — a inversão é o achado mais importante da pesquisa coreana.

---

## 8. O que NÃO fazer (inegociável)

- Não imprimir fundo de cor em área de time-log ou checklist.
- Não usar mais de 3 tamanhos de tipo no corpo funcional de uma página.
- Não usar fio de 1 pt em nenhum elemento interno de tabela ou campo.
- Não usar mais de 2 tintas no interior além de preto (ink) e azul-suave (accent/ink-2/grid-c fazem parte do mesmo sistema monocromático frio).
- Não criar campos de reflexão grandes — campo grande gera culpa por ficar vazio. Máximo 3–4 linhas.
- Não repetir a legenda de símbolos em cada página — imprimir uma vez na contracapa interna.
- Não usar bold em dicas ou instruções in-page.
- Não colocar ornamento geométrico, ícone de emoji ou borda dupla em nenhuma seção.

---

## 9. Acabamento físico (fora do Typst, para produção)

| Item | Especificação |
|---|---|
| Papel miolo | Pólen Bold 90g creme (Tier A candidato) ou offset creme 90g (Tier B) — [a confirmar pós-RFQ gráfica BR; 120g é mínimo de mercado para marcador] — ver financeiro-planner-v1.md para análise de margem por tier |
| Opacidade mínima | 88% (evita ghosting de highlighter) |
| Capa | 300 g/m², plastificação fosca (não brilhante) |
| Cantos (borda física do caderno) | Arredondados r = 3 mm no corte/trim — NÃO confundir com elementos internos (cantos retos per 2.0 PRO) |
| Encadernação | Wire-o preto ou gunmetal (não prata, não plástico colorido) |
| Abas de seção | Papel 200 g cor sólida, 5 mm de saliência, sem texto — a cor é o código |
| Fitas marcadoras | 2 × 7 mm costuradas na lombada, cores distintas (1 neutra + 1 de acento) |
| Comunicação de spec | "120 g" como feature explícita de marketing — é argumento de compra |
