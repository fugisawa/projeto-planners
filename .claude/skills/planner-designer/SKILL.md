---
name: planner-designer
description: |
  Sistema de design para planners de estudo A5 premium (Concurseiro/Treino) — nível "capricho"
  Coreia/Japão (INDIGO/Hobonichi/Kokuyo). Define título, hierarquia, paleta frio-monocromática
  quieta, grade/baseline 4.5mm, a lista de estudo estilo INDIGO (coluna + divisória), o time-log
  de 10 min com hierarquia de fios, a regra de cantos e os inegociáveis. Use ao desenhar, criticar
  ou gerar uma página de planner; ao revisar um .typ por violações de grid/cor/tipo/alinhamento;
  ou ao decidir o que copiar de cada referência. Invoque ANTES de editar qualquer página .typ.
  Par com o skill typst-planner (execução). Detalhe: design/concurseiro/conceitos/sintese-design-refinada.md.
---

# Designer de planner de estudo — 2.0 PRO (capricho JP/KR)

Blend: **rigor japonês** (grade, hierarquia de fios, cor quieta, alinhamento obsessivo) +
**calor coreano** (Lato humanista, cor amigável). Detalhe completo: `…/conceitos/sintese-design-refinada.md`.

## Princípio central
> **Campo em branco com andaimes invisíveis.** A impressão organiza o olho; **a cor vem do
> marca-texto do aluno.** Qualquer elemento impresso que chame mais atenção que a caligrafia é ruído.

## Tipografia (Lato — 1 família; figuras TABULARES sempre)
| Nível | Tratamento | Onde |
|---|---|---|
| **Título de página** | **Lato Black 18pt, azul-ardósia `title-c`** (tracking −0.1) + "tab" de acento + eyebrow mutado | masthead (Semanal/Bússola/Pontes/Ficha) |
| Cabeçalho de seção — página COM título | Lato Bold 9.5pt `ink` (`sechead`) | sob um masthead |
| Cabeçalho de seção — página SEM título grande | **discreto: 8.5pt `ink-2`** (`softhead`) | Estudar/Revisar no Diário |
| Label de campo | 7–8.5pt `ink-2`/`ink-3` | "Data", "Matéria" |
| Dica / instrução | 6.5–7pt itálico `ink-3` (nunca bold) | hints |
| Micro (hora, nº) | 6–6.5pt | time-log |

**Regra de ouro da hierarquia:** numa página **sem título grande** (Diário), o cabeçalho de seção
tem de ser **discreto** (`softhead`) — senão vira o elemento mais forte da página (erro corrigido
no 2.0: "Estudar/Revisar" estavam dominando). Só **um** nível domina por página. **Figuras
tabulares** (`number-width: "tabular"`) em tudo → números alinham em coluna.

## Título de página (o momento cromático, com propósito)
Lato **Black** em **azul-ardósia** (`title-c` = versão forte do acento → temático + hierárquico),
+ **"tab" de acento** (≈14mm, 2pt) sobre a hairline embaixo (âncora da identidade) + **eyebrow**
no canto. **Diário** (página diária repetida): **sem título grande** — só eyebrow "DIÁRIO · FOCO
DO DIA" + tab.

## Cantos — CONSISTÊNCIA (regra dura)
**Tudo reto.** Células, quadrados, chips, checkboxes e **faixas sombreadas** = canto reto
(`radius 0`). Só **círculos** são redondos (D-prova, "feito"). Misturar arredondado + pontiagudo
é erro de capricho (corrigido no 2.0). O calor KR vem da **fonte + cor**, não de cantos.

## Listas de escrita = estilo INDIGO (helper `studyrows`)
Lista matéria+tarefa (Estudar/Revisar): **coluna de matéria (sigla, ~15mm) │ divisória vertical │
tarefa na pauta (fio inferior) │ ○**. O aluno escreve a sigla/palavra curta na coluna (e pinta a
cor ali); a divisória + a pauta alinham tudo.
- **Abandonados (lições do 2.0):** **(a) chip-box** à esquerda — o tamanho nunca batia com as
  células do time-log nem com os dots, e o canto destoava; **(b) dot-grid substrato** (tiling "sob
  tudo" tipo Hobonichi) — pareceu sistemático mas chip/círculo caíam entre os dots e duplicava a
  grade do time-log. O **ruled INDIGO** resolve ambos.

## Alinhamento (capricho = tudo no mesmo eixo)
- **Divisórias de seções irmãs ALINHAM:** a barra vertical do Estudar e do Revisar caem no mesmo
  x → a faixa do Revisar é **largura cheia (sem recuo lateral)**, não recuada.
- **Linhas de preenchimento na BASE do texto** (`align: bottom`) — senão o número escrito fica
  deslocado do rótulo.
- **Tamanhos coerentes:** os elementos de uma zona relacionam-se (não um box 8×5 ao lado de
  células de 4.5mm e dots de outro passo).

## Grade e baseline
- **Módulo 4.5 mm** (vertical). Time-log: células 4.5 mm, **6 por hora (10 min), contíguas**.
- **Hierarquia de fios no time-log:** limite de **hora** = `grid-h` (0.5 pt, mais forte); divisões
  de **10 min** = `grid-c` (0.3 pt, quietas).
- Margens A5: inside 18 / outside 11 / top 11 / bottom 11 → útil 119 × 188 mm.
- Separação de seções: 4.5 ou 9 mm; só espaço (nunca fio duplo/ornamento).

## Paleta (CMYK, frio-monocromático QUIETO)
```typst
#let ink    = cmyk(0%,  0%, 0%, 88%)   // texto (preto suave; nunca K100)
#let ink-2  = cmyk(32%, 16%, 0%, 56%)  // rótulos
#let ink-3  = cmyk(28%, 12%, 0%, 40%)  // dicas / horas
#let title-c= cmyk(68%, 44%, 0%, 48%)  // azul-ardósia — TÍTULOS de página
#let accent = cmyk(52%, 22%, 0%,  4%)  // azul suave — uso pontual (tab, D-prova, setas)
#let grid-c = cmyk(16%,  7%, 0%,  5%)  // grade / divisões de 10 min — QUIETA
#let grid-h = cmyk(22%, 10%, 0%, 15%)  // linha de hora (hierarquia)
#let band   = cmyk( 9%,  4%, 0%,  3%)  // faixa sombreada (Revisar / Ajuste de Rota)
#let hair   = cmyk(20%,  9%, 0%, 20%)  // fios de seção / escrita
```
**Regras:** 1 acento por página; `fill: none` em time-log/checklist (o papel é a 3ª cor); não
somar cores; texto **K88**; preto rico só em área grande `cmyk(60,40,40,100)`.

## Espessuras de fio
10-min `0.3` · linha de hora `0.5` · escrita/hairline `0.4` · divisor de seção `0.6–0.7` ·
"tab" de acento `2pt` (1×/página). **Nunca 1pt interno.**

## Chip-dicionário de cor
A **coluna de matéria** (nas listas) + o `colorsq` (nas tabelas: Mapa do Edital, Semanal) são o
**dicionário de cor** — o aluno pinta uma vez ali e pinta o time-log na mesma cor. Legenda
completa **1× na contracapa** (nunca por página).

## O que copiar de cada referência
- **INDIGO** — time-log 10 min contíguo (núcleo emocional); **lista com coluna+divisória**; D-day ○; 1 acento + preto.
- **Hobonichi** — 85–90% de área livre; cabeçalho mínimo; rodapé editorial ("HOJE ·").
- **Kokuyo** — planejado vs. realizado (`Sessões ___ × ___ min`); monocromático + 1 acento.
- **Premium ocidental / BuJo** — key de símbolos 1×/contracapa; "→ Migrar"; nº de página no canto externo.
- **3TIMES** — cabeçalho Data 50% / D-day ○ 25% / Tempo 25%; numeração com zero à esquerda.

## Lições de uso (JTBD)
campo grande gera culpa (**≤ 4 linhas**); ficha de erro: **"o que pensei (errado)" ANTES** da
solução; "por que quero isso" → **4 linhas**; calendário de provas → linhas **5–6 mm**.

## Inegociáveis (checklist antes de "pronto")
- [ ] Título = Lato Black `title-c` + tab + eyebrow (Diário: só eyebrow)
- [ ] Hierarquia: nada domina sem propósito; **seção discreta** em página sem título
- [ ] **Tudo reto** (cells/chips/boxes/faixas); só círculos redondos
- [ ] Listas de escrita = **INDIGO** (coluna+divisória+pauta+○), não box nem dot-grid
- [ ] **Divisórias de seções irmãs alinhadas**; **linhas na base do texto** (`align: bottom`)
- [ ] Time-log: hierarquia hora/10-min; **figuras tabulares**
- [ ] `fill:none` em time-log/checklist; 1 acento/página; sem fio 1pt; ≤4 linhas de reflexão
- [ ] PNG gerado e inspecionado lado a lado (com `typst-planner`)

## Detalhe
`design/concurseiro/conceitos/sintese-design-refinada.md` (referências, acabamento físico,
psicologia de uso) — onde houver conflito, vale a seção "2.0 PRO" no topo dela.
