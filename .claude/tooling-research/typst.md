# Maestria em Typst para Planners e Livros Print-Ready

**Data:** 20/jun/2026
**Escopo:** Referência de apoio ao skill `typst-planner` — boas práticas, packages, repos, padrões de impressão e armadilhas comuns.
**Fontes trianguladas:** docs oficiais typst.app, Typst Universe, GitHub repos, forum.typst.app, issues do repositório principal.

---

## 1. Princípios e Boas Práticas Acionáveis

### 1.1 Configuração de Página (fundação do layout)

**Regra de ouro:** coloque todos os `set page(...)` no início do documento ou no template principal. Cada mudança em `set page` força a inserção de uma página em branco conforme — se usada no meio do documento cria gaps indesejados.

```typst
// Padrão recomendado para planner A5 print-ready
#set page(
  paper: "a5",          // ou width: 148mm, height: 210mm
  margin: (
    top: 15mm,
    bottom: 12mm,
    inside: 18mm,       // encadernação
    outside: 12mm,
  ),
  // bleed: 3mm,        // disponível no Typst ≥ 0.14 (PR #6357 em revisão final)
)
```

Margens para livro encadernado: interna maior que externa. Regra tipográfica: 45–75 caracteres por linha para legibilidade ideal; as margens controlam isso.

### 1.2 Grid vs Table: semântica importa

O Typst diferencia `grid` (layout visual/apresentação) de `table` (dados tabulares/semânticos). Regras de show em um **não** afetam o outro.

| Usar `grid` | Usar `table` |
|---|---|
| Layouts de página (semanas, células de escrita) | Tabelas de dados (cargas, RPE, frequência) |
| Spreads diários/semanais | Grades de questões respondidas |
| Composição visual livre | Headers repetíveis em múltiplas páginas |

**Tip prático para planner:** células de escrita → `grid` com `fill`, `stroke` e `inset`. Headers de seção → `table` com `table.header()` que repete automaticamente ao paginar.

```typst
// Célula de escrita típica para planner
#grid(
  columns: (1fr,),
  rows: (8mm,) * 12,   // 12 linhas de 8mm para escrita à mão
  stroke: (top: 0.5pt + luma(180)),
  inset: (left: 4pt, top: 2pt),
  ..range(12).map(_ => []),
)
```

Precedência de stroke: `hline`/`vline` > `cell` > `grid`. Use funções `(x, y) =>` para controle granular sem conhecer dimensões do grid.

### 1.3 Tipografia para impressão

**Tamanho de corpo:** 9–11pt para planner (texto de apoio); 7–8pt para microtexto (labels). Nunca abaixo de 6pt em offset.

**Fontes recomendadas open-license para impressão:**
- Serifa corpo: **TeX Gyre Pagella** (clone Palatino), **Source Serif 4**, **Libertinus Serif**
- Sans títulos/labels: **TeX Gyre Heros** (clone Helvetica), **Source Sans 3**, **Atkinson Hyperlegible**
- Monospace (tracker numérico): **Iosevka**, **JetBrains Mono**

**Embedding:** Typst embute fontes por padrão no PDF — não tente desativar (viola licenças e quebra reprodutibilidade). Use fontes com licença OFL ou similar.

**Pair clássico para planner premium:**
```typst
#set text(font: "TeX Gyre Pagella", size: 10pt, lang: "pt")
// Títulos de seção
#show heading.where(level: 1): set text(font: "Source Sans 3", weight: "bold")
```

### 1.4 Show Rules e Set Rules: padrão correto

- **`show elem: set elem(...)`** — preferido; resolve estaticamente, evita duplicação no outline.
- **`show elem: it => { set ...; it }`** — usar somente como último recurso; reconstrói o elemento e pode causar duplicação em TOC.
- **`show:` (sem seletor)** — aplica ao bloco restante do documento; use em templates para envolver o documento inteiro.

```typst
// CORRETO: estilizar h1 sem reconstruir
#show heading.where(level: 1): set text(size: 14pt, weight: "bold", fill: rgb("#1a1a2e"))

// EVITAR: reconstrução desnecessária
#show heading.where(level: 1): it => text(size: 14pt, weight: "bold")[#it.body]
```

### 1.5 Estado e Counters (múltiplas passagens)

Typst resolve estado em múltiplas passagens (até 5). Armadilha crítica: **nunca use `state.get()` dentro de `state.update()`** — causa cascata de não-convergência e aviso "layout did not converge within 5 attempts".

```typst
// ERRADO: gera cascata
#context state-x.update(state-x.get() + 1)

// CORRETO: forma funcional converge em 1–2 passagens
#state-x.update(v => v + 1)
```

Para numeração de páginas em header/footer com contexto:

```typst
#set page(header: context {
  if counter(page).get().first() > 1 [
    #h(1fr)
    #counter(page).display("1 / 1", both: true)
  ]
})
```

### 1.6 Pagebreaks e Controle de Fluxo

```typst
// Página ímpar (capa sempre recto)
#pagebreak(to: "odd")

// Pagebreak fraco: não quebra se página já está vazia
#pagebreak(weak: true)
```

Para separar seções do planner (ex.: meses), use `pagebreak(to: "odd")` para garantir que cada mês começa na página direita em encadernação.

### 1.7 Absolute Placement para Elementos de Planner

Use `place(dx, dy, ...)` para posicionar elementos fora do fluxo normal (linhas decorativas, logotipos de rodapé, marcadores de progresso):

```typst
// Linha decorativa no canto — não afeta layout do conteúdo
#place(top + right, dx: -5mm, dy: 5mm,
  rect(width: 2pt, height: 30mm, fill: rgb("#e63946"))
)
```

Para grid de posicionamento fino durante desenvolvimento: package `fancy-layout` ou `rule-grid` (layout-ltd).

---

## 2. Packages do Typst Universe — Quando Usar Cada Um

### 2.1 Tabelas e Grid Avançados

**`tablex` (0.0.9)** — [typst.app/universe/package/tablex](https://typst.app/universe/package/tablex/)
- **Status:** DEPRECATED para maioria dos casos. Desde Typst 0.11, o `table` nativo absorveu todas as features (colspan, rowspan, hline/vline, headers repetíveis, fill por função).
- **Quando ainda usar:** projetos legados em Typst < 0.11.
- **Conclusão:** use `table` nativo.

**`booktabs` (0.0.4)** — [typst.app/universe/package/booktabs](https://typst.app/universe/package/booktabs/)
- Estilo LaTeX booktabs: linhas horizontais finas/grossas, sem linhas verticais.
- Ideal para tabelas de dados no Treino (cargas, volumes, progressão).
- ```typst
  #import "@preview/booktabs:0.0.4": *
  #booktable(
    columns: 4,
    toprule: 1.5pt, midrule: 0.8pt, bottomrule: 1.5pt,
    table.header[Exercício][Séries][Reps][Carga],
    [Agachamento], [4], [5], [100 kg],
  )
  ```

### 2.2 Caixas e Destaques

**`showybox` (2.0.4)** — [typst.app/universe/package/showybox](https://typst.app/universe/package/showybox/)
- Caixas coloridas com título, footer, sombra, bordas customizáveis, breakable entre páginas.
- Ideal para: alertas ("Revise hoje!"), blocos de dica no planner de estudo.
- ```typst
  #import "@preview/showybox:2.0.4": showybox
  #showybox(title: "Revisão Pendente", frame: (border-color: rgb("#e63946")),
    breakable: true)[Matérias a revisar...]
  ```

### 2.3 Desenho e Gráficos

**`cetz` (0.5.2)** — [typst.app/universe/package/cetz](https://typst.app/universe/package/cetz/)
- Biblioteca de desenho tipo TikZ/Processing.
- Para planner: gráficos de progresso (barras de carga, curvas RPE), círculos de hábito, diagramas de periodização.
- Biblioteca filha `cetz-plot` para gráficos de linha/barra.

```typst
#import "@preview/cetz:0.5.2"
#cetz.canvas({
  import cetz.draw: *
  // Barra de progresso de carga
  rect((0,0), (8, 0.5), fill: rgb("#e63946").lighten(60%))
  rect((0,0), (6, 0.5), fill: rgb("#e63946"))
  content((4, 0.25), text(white, "75%"))
})
```

### 2.4 Calendário e Datas

**`calendaring` (0.1.0)** — [typst.app/universe/package/calendaring](https://typst.app/universe/package/calendaring/)
- Gerador de grid mensal para escrita manual — exatamente o caso de uso do planner.
- `month-grid(year, month, cell-content: date => [...])` com callback por data.
- Suporte a semana ISO, destaques de dia, localization, rotação para paisagem.
- `year-grid(year)` — visão anual em uma página.
- **Uso direto no Planner Concurseiro/Treino** para seção de calendário mensal.

```typst
#import "@preview/calendaring:0.1.0": month-grid
#month-grid(2026, 8,
  weekday-names: ("seg", "ter", "qua", "qui", "sex", "sáb", "dom"),
  cell-width: 1fr,
  cell-height: 3cm,
)
```

**`cineca`** — Para calendário com eventos renderizados (uso diferente do `calendaring`).

### 2.5 Tipografia Avançada

**`droplet` (0.3.1)** — [typst.app/universe/package/droplet](https://typst.app/universe/package/droplet/)
- Capitulares/dropped capitals com controle fino.
- Para capas e páginas de seção com caráter editorial.

**`easy-typography`** — Sets sensible typography defaults (kerning, ligatures, spacing).

**`tasteful-pairings`** — Coleção curada de pares de fontes com foco em legibilidade tipográfica. Boa referência para escolha de fontes.

### 2.6 Marcas de Impressão (Bleed/Corte)

**`markly`** — [typst.app/universe/package/markly](https://typst.app/universe/package/markly/)
- Adiciona marcas de corte, bleed e registro a documentos Typst.
- Usa CeTZ para desenhar as marcas.
- API: `markly.setup(content-width, content-height, bleed: 3mm)` + `markly.marks(...)`.
- **Workaround atual** enquanto suporte nativo a bleed (`page.bleed`) ainda não chegou ao main (PR #6357 em revisão final por laurmaedje, jun/2026).

```typst
#import "@preview/markly:0.1.0" as markly
#let ctx = markly.setup(
  content-width: 148mm,   // A5 largura
  content-height: 210mm,  // A5 altura
  bleed: 3mm,
)
// Envolver cada página:
#markly.page(ctx, ...conteúdo...)
```

### 2.7 Layout de Livro/Estrutura

**`bookly` (4.0.0)** — [typst.app/universe/package/bookly](https://typst.app/universe/package/bookly/)
- Templates de livro com temas (classic, modern, fancy), layout Tufte (marginalia), suporte pt-BR.
- Usa internamente: `marginalia`, `hydra`, `showybox`, `subpar`.
- Para planner premium com notas marginais (conceito editorial avançado).

**`min-book` (1.5.0)** — [typst.app/universe/package/min-book](https://typst.app/universe/package/min-book/)
- Livro completo sem nova sintaxe, só Typst nativo. Temas: Stylish, Coffee, Elegance.
- Boa base para o documento principal do planner com estrutura de partes/capítulos.

**`ilm` (2.1.1)** — [typst.app/universe/package/ilm](https://typst.app/universe/package/ilm/)
- Template minimal para cadernos, relatórios e livros de não-ficção.
- TOC automático, índices de figuras/tabelas/código.

**`bookletic` (0.3.2)** — [github.com/harrellbm/Bookletic](https://github.com/harrellbm/Bookletic)
- Organiza páginas em formato de livreto/caderno para impressão e encadernação.
- Reordena automaticamente as páginas para impressão frente-e-verso.

**`marginalia` (0.3.1)** — Notas marginais (Tufte style). Útil para glosas e dicas no planner de estudo.

---

## 3. Repos e Templates — O que Copiar de Cada

### 3.1 hfactor/papermaker
**URL:** https://github.com/hfactor/papermaker
**Estrelas:** 6 | **Licença:** AGPL-3.0 | **Criado:** dez/2025

**O que é:** Gerador de planner PDF com UI web (Node.js/Express) + Typst. Voltado para GoodNotes/Notability (digital), não impressão física.

**Estrutura de templates a copiar:**
```
templates/
├── main.typ           # orquestrador principal
├── components/
│   ├── cover.typ      # capa
│   ├── year.typ       # visão anual
│   ├── quarter.typ    # trimestre
│   ├── month.typ      # mês
│   ├── week.typ       # semana
│   └── daily.typ      # diário
└── utils/
    ├── dates.typ      # cálculos de data
    ├── hyperlinks.typ # navegação por links (digital)
    └── styles.typ     # tokens de design centralizados
```

**O que copiar:** a arquitetura modular por componente de página + separação de `utils/dates.typ` para cálculos de data em Typst. Para versão impressa, ignorar `hyperlinks.typ`.

**8 temas visuais** (Dracula, Nord, Gruvbox, Catppuccin, etc.) como referência de paleta.

### 3.2 andreasKroepelin/typst-notebook
**URL:** https://github.com/andreasKroepelin/typst-notebook

**O que é:** Template de caderno com página única crescente (`height: auto`), TODOs automáticos, tags com cores, links cruzados.

**O que copiar:** padrão de `state` + `query` para rastrear estado através do documento; sistema de tags; TOC automático de notas. Relevante para o módulo de caderno de erros do Planner Concurseiro.

### 3.3 InScight-Magazine/Print-Templates
**URL:** https://github.com/InScight-Magazine/Print-Templates

**O que é:** Sistema modular completo de revista científica em Typst. Arquitetura de produção real.

**O que copiar:**
- `constants.typ` — centralização de tokens de design (cores, margens, fontes) em um único arquivo de configuração.
- `helpers.typ` — funções utilitárias reutilizáveis (imagens com caption, links, helpers matemáticos).
- `layouts.typ` — layouts de página estruturais separados do conteúdo.
- Padrão: nunca modificar o template master diretamente; sobrescrever via `constants.typ`.

**Fontes usadas:** Merriweather (corpo), Neuton (títulos), Barlow (outline), Bitter (captions). Combinação editorial de referência.

### 3.4 qjcg/awesome-typst
**URL:** https://github.com/qjcg/awesome-typst
**Estrelas:** 3.483 | Última atualização: abr/2026

Lista curada de recursos Typst. **Como usar:** referência de descoberta de novos packages e templates; verificar a seção "Books and reports" para templates de livro; seção "Calendar and time" para componentes de data.

### 3.5 EmileVezinaCoulombe/Planner
**URL:** https://github.com/EmileVezinaCoulombe/Planner

Planner escolar simples com páginas diária e semanal. Código Typst puro, referência de implementação direta.

---

## 4. Padrões de Impressão (Print-Ready)

### 4.1 Estado atual do suporte a impressão no Typst

| Feature | Status (jun/2026) |
|---|---|
| PDF/X (PDF/X-1a, X-3, X-4) | Não suportado — issue #6012 aberta. Workaround: Ghostscript pós-processamento. |
| PDF/A (arquivo) | Suportado: `--pdf-standard a-2b`, `a-3b`, etc. |
| CMYK nativo | Sintaxe `cmyk(c, m, y, k)` disponível; embedding de perfil ICC ainda em desenvolvimento (issue #3143). |
| Bleed nativo | PR #6357 em revisão final (jun/2026). Workaround: `markly` package. |
| Fontes embarcadas | Sim, automático e obrigatório. |
| Marca d'água/crop marks | Via `markly` + CeTZ (workaround). |

### 4.2 Workflow recomendado para gráfica BR (sem PDF/X nativo)

```bash
# 1. Compilar com Typst → PDF 1.7
typst compile planner.typ planner.pdf --pdf-standard 1.7

# 2. Converter para PDF/X-1a via Ghostscript (gráficas BR aceitam)
gs -dBATCH -dNOPAUSE -dNOSAFER \
   -sDEVICE=pdfwrite \
   -dPDFSETTINGS=/prepress \
   -dProcessColorModel=/DeviceCMYK \
   -sColorConversionStrategy=CMYK \
   -sOutputFile=planner-cmyk.pdf \
   planner.pdf

# 3. Verificar com pdfinfo ou preflight da gráfica
```

**Atenção:** Typst usa sRGB internamente. A conversão Ghostscript para CMYK pode alterar cores vivas (especialmente azuis e vermelhos). Teste sempre um protótipo físico antes da tiragem final.

### 4.3 Sangria (bleed) na prática atual

Sem `page.bleed` nativo, expandir o tamanho da página manualmente:

```typst
#let bleed = 3mm
#set page(
  width: 148mm + 2 * bleed,    // A5 + sangria bilateral
  height: 210mm + 2 * bleed,
  margin: (
    top: 15mm + bleed,
    bottom: 12mm + bleed,
    inside: 18mm + bleed,
    outside: 12mm + bleed,
  ),
)
// Usar markly para marcas de corte
```

Ou usar `markly` que encapsula essa lógica.

### 4.4 Cores seguras para offset

```typst
// Cores definidas em CMYK para consistência
#let cor-destaque = cmyk(0%, 85%, 95%, 0%)   // laranja-vermelho
#let cor-texto    = cmyk(0%, 0%, 0%, 90%)     // preto rico (evitar 100K em áreas grandes)
#let cor-fundo    = cmyk(0%, 0%, 8%, 0%)      // off-white levíssimo
```

Evitar 4-color black (`C:100 M:100 Y:100 K:100`) em texto — causa halo e registro impreciso. Usar K: 80–90% no máximo.

### 4.5 Fontes: embedding e licença

- Typst embute **todas** as fontes usadas no PDF por padrão — sem opção de desativar (issue #6466 fechada como wontfix).
- Usar fontes com licença OFL (SIL Open Font License) ou similar que permite embedding.
- Evitar fontes Adobe/Monotype sem licença de embedding em PDF.
- **Fallback seguro:** TeX Gyre family (Pagella, Heros, Cursor, Chorus) — clones de alta qualidade das fontes Adobe clássicas, licença GUST Font License (open).

---

## 5. Armadilhas Comuns

### 5.1 `set page` no meio do documento
Cada `set page` insere uma página em branco imediatamente após. Colocar **sempre** no início do template ou usar escopo local (`{ set page(...); conteudo }`) para páginas one-off.

### 5.2 `show heading` que reconstrói o elemento
Reconstruir um `heading` numa show rule duplica a entrada no TOC. Usar `show-set` em vez de `show: it => heading(...)`.

### 5.3 State não convergindo
Aviso "layout did not converge within 5 attempts" quase sempre indica `state.get()` dentro de `state.update()`. Usar sempre a forma funcional `state.update(v => v + 1)`.

### 5.4 Grid vs Table confundidos
Show rules de `table` não afetam `grid` e vice-versa. Se o visual não aplica, verificar se está usando o elemento certo.

### 5.5 `columns` dentro de containers aninhados
`set page(columns: 2)` no level de página funciona bem (integra com floats e footnotes). `columns()` dentro de `rect` ou `block` tem comportamento limitado — preferir `grid` para layout multi-coluna em containers.

### 5.6 Contexto fora de show rules
`context { ... }` é opaco — não se pode acessar seu valor diretamente no código. Todo processamento dependente de posição/estado deve acontecer **dentro** do bloco context. Resultado é content, não valor.

### 5.7 `pagebreak` dentro de containers
`pagebreak()` não pode ser usado dentro de `box`, `rect`, `grid.cell`, etc. — causa erro em tempo de compilação. Deve estar no fluxo principal da página.

### 5.8 Debugging
```typst
// Ver campos de qualquer elemento
#repr(meu-elemento.fields())

// Forçar erro com mensagem formatada (útil para context)
#context { assert(false, message: repr(query(heading))) }

// Limitar iterações para diagnosticar não-convergência
#import "@preview/layout-ltd:0.1.0": layout-limiter
#show: layout-limiter.with(max-iterations: 2)
```

---

## 6. Melhorias Concretas Recomendadas para o Skill `typst-planner`

### P1 — Alta prioridade (impacto direto na qualidade do output)

1. **Adotar `calendaring` para grids de datas** — substituir qualquer grid de calendário feito à mão pelo `@preview/calendaring:0.1.0`. O package já trata offset de dias, número de semanas, highlight, localização e callback por célula. Evita centenas de linhas de código de data.

2. **Centralizar tokens de design em `constants.typ`** — seguindo o padrão InScight. Um único arquivo com todas as cores (em `cmyk()`), fontes, tamanhos de margem e medidas de célula. Mudança de cor/fonte nunca exige tocar os layouts.

3. **Usar `set table(stroke: (x, y) => ...)` com função** — em vez de definir strokes célula a célula. Permite estilo booktabs sem o package (só linhas horizontais, peso variável por linha):
   ```typst
   #set table(stroke: (_, y) => if y == 0 { (bottom: 1pt) } else { (top: 0.4pt + luma(200)) })
   ```

4. **Arquitetura modular: um arquivo por tipo de página** — inspirado no papermaker. `components/semana.typ`, `components/mes.typ`, `components/tracker.typ`. O `main.typ` só orquestra a sequência.

### P2 — Média prioridade (qualidade tipográfica e robustez)

5. **Par tipográfico TeX Gyre Pagella + Source Sans 3** — fontes open-license, alta qualidade, embedding legal. Pagella tem serifas elegantes para corpo; Source Sans 3 é limpa para labels/headers.

6. **Usar `state` com forma funcional** (`update(v => ...)`) para qualquer counter customizado (número de matérias revisadas, total de sessões). Nunca usar `get()` dentro de `update()`.

7. **`pagebreak(to: "odd")` em todas as aberturas de seção** — garante que capas de mês/módulo sempre caiam na página direita (recto) em impressão frente-e-verso.

8. **`showybox` para blocos de instrução/dica** — caixas com título colorido e breakable são mais robustas que `rect` manual para conteúdo que pode vazar entre páginas.

### P3 — Impressão física (quando for para gráfica)

9. **Pipeline Ghostscript para CMYK** — adicionar script `build_print.sh` com o comando gs de conversão para CMYK. Definir todas as cores de design em `cmyk()` desde o início para evitar surpresas de gamut.

10. **`markly` para sangria** — até o PR #6357 chegar ao main, usar `@preview/markly` para adicionar marcas de corte. Sangria padrão: 3mm. Zona de segurança (safe area): mínimo 5mm das bordas de corte para texto/logotipos.

11. **Verificar preflight da gráfica antes da tiragem** — gráficas BR como Gráfica Bandeirante e LF Gráfica aceitam PDF 1.4–1.7 (não exigem PDF/X rigoroso). Confirmar sempre antes de usar Ghostscript.

---

## 7. Recursos e URLs de Referência

| Recurso | URL | O que contém |
|---|---|---|
| Docs oficiais Typst | https://typst.app/docs/ | Referência completa de todas as funções |
| Guia de tabelas | https://typst.app/docs/guides/tables | Tutorial completo de tabelas e grids |
| Guia de page setup | https://typst.app/docs/guides/page-setup | Margens, colunas, headers, footers |
| Typst Universe | https://typst.app/universe/ | Catálogo de todos os packages |
| calendaring | https://typst.app/universe/package/calendaring/ | Grid de calendário para planner |
| markly | https://typst.app/universe/package/markly/ | Marcas de corte/bleed |
| showybox | https://typst.app/universe/package/showybox/ | Caixas estilizadas |
| cetz | https://typst.app/universe/package/cetz/ | Desenho/gráficos |
| booktabs | https://typst.app/universe/package/booktabs/ | Tabelas estilo acadêmico |
| bookly | https://typst.app/universe/package/bookly/ | Template de livro completo |
| min-book | https://typst.app/universe/package/min-book/ | Livro minimal |
| Typst Examples Book | https://sitandr.github.io/typst-examples-book/ | Exemplos práticos avançados |
| awesome-typst | https://github.com/qjcg/awesome-typst | Lista curada de recursos |
| papermaker | https://github.com/hfactor/papermaker | Planner modular em Typst |
| InScight Templates | https://github.com/InScight-Magazine/Print-Templates | Arquitetura modular de revista |
| typst-notebook | https://github.com/andreasKroepelin/typst-notebook | Caderno com state/query |
| Bookletic | https://github.com/harrellbm/Bookletic | Layout de livreto para encadernação |
| Issue bleed nativo | https://github.com/typst/typst/issues/3131 | Tracking de `page.bleed` |
| PR bleed nativo | https://github.com/typst/typst/pull/6357 | Implementação em revisão |
| Issue PDF/X | https://github.com/typst/typst/issues/6012 | Status PDF/X (não suportado) |
| Issue CMYK ICC | https://github.com/typst/typst/issues/3143 | Perfis ICC/CMYK |
| Forum debugging | https://forum.typst.app/t/tips-on-debugging-typst-code-including-the-dark-magic/6753 | Debug avançado |
| Forum state | https://forum.typst.app/t/bleed-trim-slug-crop-marks-for-printing/123 | Bleed workarounds |
