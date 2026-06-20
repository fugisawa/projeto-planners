---
name: planner-designer
description: Sistema e princípios de design para planners de estudo A5 premium (Concurseiro/Treino), destilados de INDIGO, Hobonichi, Kokuyo, bullet-journal e premium ocidental. Use ao desenhar ou criticar páginas de planner — escala tipográfica, grid de baseline 4.5mm, paleta frio-monocromática contida, a mecânica da grade de pintura, o que copiar de cada referência e os inegociáveis ("capricho"). Par com o skill typst-planner (execução). Detalhe completo em design/concurseiro/conceitos/sintese-design-refinada.md.
---

# Designer de planner de estudo (capricho)

Planner A5 premium, amigável (estilo coreano) e refinado. Detalhe: `design/concurseiro/conceitos/sintese-design-refinada.md`.

## Princípio central
Um **campo em branco com andaimes invisíveis**. A impressão organiza o olho; **a cor vem do marca-texto do aluno**. Qualquer elemento impresso que chame mais atenção que a caligrafia é ruído.

## Sistema (resumo)
- **Tipo:** Lato (1 família, 3 pesos). Hierarquia de **3 níveis por página, nunca 4**. Título ~22pt Regular; label de seção 8–9pt Bold; label de campo 7–8pt Regular (+0.3 tracking); dica 6.5–7pt itálico. Nunca bold em dica; nunca itálico em label.
- **Grid/baseline:** módulo **4.5 mm** (todo espaçamento vertical é múltiplo). Célula de time-log **4.5 mm** (mínimo p/ highlighter). Margens A5: inside 18 / outside 11 / top 11 / bottom 11.
- **Cor (frio-monocromático):** preto suave + 1 azul-suave de acento + faixa neutra `band`. **Nada de fundo de cor em time-log/checklist.** `fill: none` (papel creme). Não adicionar cores novas.
- **Fios:** grade 0.3–0.4pt; divisor 0.6–0.7pt; borda de bloco 0.5–0.6pt; bordura accent 2pt (1× por página). Nunca 1pt interno.
- **Cantos:** chip 1mm; softband 2mm; ficha ~1.2pt (mais técnica, canto reto). 
- **Chip de cor** (8×5mm) à esquerda das linhas de matéria — é o **dicionário de cores** que ancora o color-coding; precisa de ponto de definição (Mapa do Edital + tabela Semanal).

## O que copiar de cada referência
- **INDIGO:** time-log de 10 min contíguo (núcleo emocional); chip colorível; D-day círculo; 1 acento + preto.
- **Hobonichi:** grade 4mm p/ escrita livre (não pauta); 85–90% de área livre; cabeçalho mínimo; rodapé editorial (campo "Hoje ·").
- **Kokuyo:** planejado vs. realizado (Sessões ___ × ___ min; total h); âncora visual monocromática.
- **Premium ocidental/BuJo:** key de símbolos 1× na contracapa; campo "→ Migrar"; fio tracejado p/ escrita livre; chip de canto mais reto na ficha (canto muito arredondado = infantil); separar por espaço, nunca fio duplo; nº de página no canto externo.
- **3TIMES:** cabeçalho diário Data(50%) / D-day ○ (25%) / Tempo(25%).
- **Uso real (JTBD):** célula 4.5mm; legenda fora do corpo; "Por que quero isso?" 4 linhas; calendário de provas linhas 5–6mm; na ficha, **"o que pensei (errado)" ANTES da solução**.

## Inegociáveis
- Sem fundo de cor em time-log/checklist; ≤3 tamanhos de tipo no corpo; sem fio 1pt interno; campos de reflexão ≤3–4 linhas (campo grande gera culpa); sem ornamento/emoji/borda dupla; legenda de símbolos só 1× (contracapa); bold nunca em dica.
- **Sempre compilar e OLHAR o PNG** (skill `typst-planner`); consistência entre páginas é checklist.
