---
name: planner-designer
description: |
  Sistema de design para planners de estudo A5 premium (Concurseiro/Treino): princípios tipográficos,
  grid de baseline 4.5 mm, paleta frio-monocromática contida, mecânica da grade de pintura (time-log
  10 min), o que copiar de cada referência premium (INDIGO, Hobonichi, Kokuyo, BuJo) e os inegociáveis
  de capricho. Use when designing, critiquing, or generating a new planner page layout; when reviewing
  a Typst file for grid/color/type violations; or when deciding which reference to copy for a specific
  spread. Invoke before editing any .typ page file. Pairs with skill typst-planner (execution).
  Full detail: design/concurseiro/conceitos/sintese-design-refinada.md.
---

# Designer de planner de estudo (capricho)

Planner A5 premium, amigável (estilo coreano) e refinado.
**Detalhe completo:** `design/concurseiro/conceitos/sintese-design-refinada.md`

---

## Princípio central

> **Campo em branco com andaimes invisíveis.**
> A impressão organiza o olho; **a cor vem do marca-texto do aluno.**
> Qualquer elemento impresso que chame mais atenção que a caligrafia é ruído.

---

## Sistema tipográfico

**Família:** Lato — 1 família, 3 pesos. Hierarquia de **3 níveis por página, nunca 4**.

| Nível | Tamanho | Peso | Tracking | Regra |
|---|---|---|---|---|
| Título de página | 22–26 pt | Regular | 0 | Nome da seção |
| Label de seção | 8–9 pt | Bold 700 | +0.2 pt | ALL CAPS p/ label secundário |
| Label de campo | 7–8 pt | Regular | +0.3 pt | — |
| Dica / instrução | 6.5–7 pt | Itálico | 0 | Nunca bold |
| Micro (hora, n°) | 6–6.5 pt | Regular | 0 | Time-log |

**Inegociável:** bold nunca em dica; itálico nunca em label de seção. Quatro níveis = ruído.

---

## Grid e baseline

- **Módulo:** 4.5 mm. Todo espaçamento vertical é múltiplo inteiro de 4.5 mm.
- **Margens A5 (148 × 210 mm):** inside 18 / outside 11 / top 11 / bottom 11 → área útil 119 × 188 mm.
- **Time-log (grade de pintura):** células 4.5 mm × ~5–6 mm; fio interno 0.3–0.4 pt `grid-c`; sem gutter (`inset: 0`). 4.5 mm é o mínimo para highlighter físico; abaixo disso não coloriza.
- **Grade livre:** quadriculado 4 mm a ~25–30 % de opacidade. Nunca pauta simples em zonas de diagnóstico — grade acomoda esquemas e tabelas improvisadas.
- **Separação entre seções:** 4.5 mm (1 módulo) ou 9 mm (2 módulos). Nunca fio duplo ou ornamento — só espaço.

---

## Paleta (tokens de cor — CMYK, frio-monocromático)

Tokens reais do `config.typ` (nunca usar hex/luma direto nas páginas):

```typst
#let ink    = cmyk(0%,  0%,  0%, 88%)   // texto principal (preto suave; nunca K100)
#let ink-2  = cmyk(32%, 16%, 0%, 56%)   // rótulos de campo / labels de seção
#let ink-3  = cmyk(28%, 12%, 0%, 40%)   // dicas, instruções, horas
#let accent = cmyk(52%, 22%, 0%,  4%)   // azul suave — bordura editorial, D-day ○
#let grid-c = cmyk(24%, 10%, 0%,  8%)   // grade e time-log
#let hair   = cmyk(22%,  9%, 0%, 24%)   // fios de seção, bordas de campo
#let band   = cmyk(12%,  5%, 0%,  4%)   // faixa de destaque (Revisar, Ajuste de Rota)
```

**Regras:**
- 1 acento cromático estrutural (`accent`) por página — máximo 1 posição.
- `fill: none` em todas as zonas de time-log e checklist. O papel creme é a terceira cor.
- Não adicionar novas cores ao sistema. Fundo de cor em time-log = erro grave.
- Texto principal **K88 puro** (não rich black). Preto rico só em áreas grandes: `cmyk(60%,40%,40%,100%)`.

---

## Espessuras de fio

| Função | Espessura | Token |
|---|---|---|
| Grade interna (time-log, quadriculado) | 0.3–0.4 pt | `wt.grid` |
| Linha de escrita pontilhada | 0.3 pt tracejado | `wt.hair` |
| Linha de escrita sólida | 0.4 pt | `wt.hair` |
| Divisor de seção horizontal | 0.6–0.7 pt | `wt.rule` |
| Borda de bloco (softband, ficha) | 0.5–0.6 pt | `wt.box` |
| Bordura editorial lateral (accent) | 2 pt | 1 × por página |

**Nunca 1 pt interno.** O 1 pt cria "ruído de média intensidade" sem hierarquizar.

---

## Cantos arredondados

- Chip de cor: `radius: 1 mm` — **chip calibrado para 8 mm de largura** (9 mm pesa a linha)
- Softband / faixa: `radius: 2 mm`
- Ficha de erro: `radius: 1.2 pt` — **deliberadamente quase reto** (ficha é técnica, não infantil)
- Checkbox: `radius: 0.6 mm`

---

## Chip-dicionário de cor

O chip (8 × 5 mm) à esquerda das linhas de matéria é o **dicionário de cores** que ancora o color-coding em todo o planner. Regras:

1. **Ponto de definição obrigatório:** coluna "COR" no Mapa do Edital (Bússola) + tabela de matérias no Semanal. O usuário atribui a cor nesses dois pontos; todos os outros spreads referenciam.
2. **Chips coloríveis, não coloridos:** o aluno escolhe — personalização gera ownership.
3. **Legenda fora do corpo:** nunca repetir a legenda de cores dentro de cada página. Ela fica na contracapa interna (1 impressão, 7 pt, 2 colunas, cinza `ink-3`). Repetir por página = ruído e infantiliza o produto.

---

## O que copiar de cada referência

| Referência | Extrair | Não copiar |
|---|---|---|
| **INDIGO** | Time-log 10 min contíguo (núcleo emocional); chip colorível; D-day ○; 1 acento + preto | Datas pré-impressas; logotipos ilustrativos na capa |
| **Hobonichi** | Grade 4 mm p/ escrita livre; 85–90 % de área livre; cabeçalho mínimo (~9 mm); rodapé editorial "Hoje ·" (2 linhas, 10–12 mm) | Grade 3.7 mm (pequena demais p/ caligrafia BR); tipografia bilíngue |
| **Kokuyo** | Planejado vs. realizado (`Sessões ___ × ___ min`); TOTAL h no rodapé; visual monocromático com acento único | Soft-ring; células de 30 min |
| **Premium ocidental / BuJo** | Key de símbolos 1 × na contracapa; campo "→ Migrar"; fio tracejado p/ escrita livre; n° de página canto externo 7 pt | Dot grid em páginas funcionais; bold em labels > 2 palavras |
| **3TIMES** | Cabeçalho DATA 50 % / D-DAY ○ 25 % / TEMPO 25 %; numeração com zero à esquerda; bordura accent em instrução in-page | Twin-wire navy; grid 3 colunas em inglês |

---

## Lições do uso real (JTBD)

**"Campo grande gera culpa."** Campos de reflexão com ≥ 5 linhas que ficam vazios expõem o não-uso, geram vergonha e precipitam abandono. Máximo 3–4 linhas por campo.

**Ordem invertida na ficha de erro:** o campo **"MEU RACIOCÍNIO ANTES DE ERRAR"** vem _antes_ da solução correta. Reconhecer o erro sem punição é o núcleo pedagógico; mostrar a resposta primeiro anula esse efeito.

**"Por que quero isso?"** → 4 linhas de espaço (alta relevância emocional).

**Calendário de Provas** → linhas de 5–6 mm (atual v1 tem ~3 mm — apertado demais p/ escrita manual).

**Anti-culpa explícito:** adicionar `± ok` (6.5 pt itálico) abaixo do campo "realizado" — sinal de que desvio é esperado, não falha.

---

## Inegociáveis (checklist antes de declarar pronto)

- [ ] Módulo vertical: todos os espaços múltiplos de 4.5 mm
- [ ] Hierarquia tipográfica: ≤ 3 tamanhos de tipo no corpo da página
- [ ] Cor: apenas K88 + `cor-acento` (1 posição por página); `fill: none` nas zonas preenchíveis
- [ ] Fios: nenhum fio interno de 1 pt
- [ ] Campos de reflexão: ≤ 4 linhas cada
- [ ] Chip: 8 mm de largura; legenda de cor fora do corpo (contracapa interna)
- [ ] Ficha de erro: raciocínio errado ANTES da solução
- [ ] Sem fundo de cor em time-log ou checklist
- [ ] Sem ornamento / emoji / borda dupla
- [ ] PNG gerado e inspecionado lado a lado com a versão de referência

---

## Toolchain (ponteiros)

- **Execução:** skill `typst-planner` — compilar `.typ` → PNG → inspecionar.
- **Tokens de cor:** definidos em `config.typ` (ver acima). Nunca usar hex/luma direto nas páginas.
- **Ideias futuras (não implementadas):** checker de módulo 4.5 mm via script; flag "modo-prova" em `config.typ` p/ marcas de corte/sangria. Avaliar quando houver volume de páginas.
- **Gotchas Typst:** `set par(leading: 0.6em, spacing: 0.4em)` + `v()` explícito para controlar gaps; sem isso há inflação de parágrafo que quebra o módulo. Detalhe em `design/concurseiro/conceitos/sintese-design-refinada.md` §3.

---

## Referências de detalhe

| Tópico | Onde |
|---|---|
| Especificação completa de cada referência premium | `sintese-design-refinada.md` §7 |
| Tokens CMYK e TAC para produção offset | `design.md` §3 + `sintese-design-refinada.md` §4 |
| Acabamento físico (papel, wire-o, abas, fitas) | `sintese-design-refinada.md` §9 |
| Causas de abandono e psicologia de uso | `design.md` §4 |
| Repositórios Typst (awesome-typst, october) | `design.md` §8 |
