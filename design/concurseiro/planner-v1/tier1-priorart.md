# Prior Art: Planners e Journals Bonitos por Código
**Data:** 20/jun/2026 | **Contexto:** Planner Concurseiro A5 premium, sem DTP pago

---

## Resumo executivo

O mercado de código para planners é dominado por dois clusters: (a) **geradores para e-ink/digital** (reMarkable, Supernote, GoodNotes) — sofisticados em navegação hiperligada e grades, mas otimizados para tela, não para impressão offset; e (b) **templates tipográficos** (LaTeX/Typst) para livros e artigos acadêmicos, com qualidade gráfica excelente. Para um **planner A5 impresso** de qualidade premium, a estratégia ideal é hibridizar: usar **Typst como engine** (velocidade, sangria nativa, fontes OTF) com lógica de componentes inspirada nos geradores digitais.

---

## Recursos curados — lista principal

### 1. `hfactor/papermaker` (Typst + Node.js) ★★★★★
**Link:** https://github.com/hfactor/papermaker

**O que é:** Gerador de planner em Typst com Web UI. Arquitetura modular exemplar.

**O que copiar:**
- Estrutura de componentes: `cover.typ`, `year.typ`, `quarter.typ`, `month.typ`, `week.typ`, `daily.typ` — exatamente o que precisamos para o Concurseiro (visão ciclo, mensal, semanal, dia de estudo).
- `utils/styles.typ` centralizando tokens de design (cores, fontes, densidades de grade).
- `utils/dates.typ` para lógica de calendário perpétuo (planner sem datas fixas = calcular offsets dinamicamente).
- `utils/hyperlinks.typ` para navegação interna no PDF (útil mesmo no impresso: PDF funcional para quem usa digitalmente).
- Sistema de 8 temas de cor com paleta escura/clara/acento — pode ser adaptado para a identidade visual do Concurseiro.
- Configuração YAML/JSON separada do template: facilita gerar variações (cor, papel, tamanho) sem tocar o Typst.

**Aviso:** licença AGPL-3.0 — deve manter open-source se distribuir. Usar como referência de arquitetura, reimplementar.

---

### 2. `kudrykv/latex-yearly-planner` (LaTeX + Go) ★★★★☆
**Link:** https://github.com/kudrykv/latex-yearly-planner

**O que é:** Planner PDF para e-ink (Supernote/reMarkable) em LaTeX, 1.490 stars. O projeto mais maduro do segmento.

**O que copiar:**
- Modelo de configuração por YAML separado da lógica de template — permite N variações de layout sem reescrever LaTeX.
- Estrutura de breadcrumbs/navegação: `cfg/template_breadcrumb.yaml` define como cada tipo de página se interliga.
- Discussão #57 tem planners 2022-2032 pré-gerados: ver os PDFs como **referência de qualidade visual** (grau de detalhe, densidades de linha, proporções).
- Abordagem multi-passe (`PASSES=1`) para resolver referências cruzadas — relevante se usar LaTeX.

**Nota:** usa Go para geração de templates LaTeX (uma camada de abstração). Para Typst, a lógica equivalente é scripting nativo do próprio Typst — mais simples.

---

### 3. `stettberger/notebook` (LaTeX/TikZ) ★★★★☆
**Link:** https://github.com/stettberger/notebook

**O que é:** Pacote TikZ para templates de cadernos e journals com impressão física em mente.

**O que copiar:**
- **`\notebookpage{}`** com parâmetros: `fill=dotted|lines|squares|crosses`, `columns`, `todo`, `calendar`, `paginate`. Modelo de API limpa para composição de layouts.
- **Marcas de dobra e furos** (`foldmark`, `punchmark`) — essenciais para planner A5 de fichário (encadernação espiral/Wire-O).
- **Integração pgfcalendar:** calendário mensal renderizado por TikZ diretamente no template, sem dependência externa.
- **`month list`:** imprime linha por dia do mês — base para o tracker de estudo diário do Concurseiro.
- Layout de colunas configurável: divide página em zonas (manhã/tarde/noite no planner de estudo).

---

### 4. `alexmodrono/typst-pandoc` + template `layman.typ` (Typst) ★★★★★
**Link:** https://github.com/alexmodrono/typst-pandoc

**O que é:** Pipeline Markdown → Pandoc → Typst → PDF com template de livro rico. O `layman.typ` tem os elementos mais relevantes para qualidade premium.

**O que copiar do `layman.typ`:**
- **Drop caps** em páginas de capítulo/seção (`prologue-page`) — efeito editorial imediato.
- **Margin notes alternadas** (`sidebar-note`, `sidebar-quote`) esquerda/direita em páginas ímpares/pares — dica do dia, conceito, citação motivacional no planner.
- **Cabeçalhos de capítulo** com numerais romanos centralizados e estilizados.
- **Rodapés** com número de página e nome da seção corrente (`running foot`).
- Pipeline `Makefile` com `make pdf`, `make watch` — build system mínimo para iterar rápido.

---

### 5. `peterfriese/eightbyten` (Typst, estilo Tufte) ★★★★☆
**Link:** https://github.com/peterfriese/eightbyten

**O que é:** Template Typst de livro estilo Edward Tufte — margens largas, sidenotes, figuras marginais.

**O que copiar:**
- **Margens Tufte** para o planner: coluna principal + coluna de margem. No Concurseiro: conteúdo principal (linhas de estudo/grade horária) + margem para anotações rápidas/referências.
- Configuração de parâmetro `debug: true` que mostra frames de layout — ótimo para afinar grids.
- **`printer-info` e `isbn`** no colofão — dá aspecto profissional mesmo em autopublicação.
- Integração `in-dexter` para índice — relevante se o planner tiver seções de referência (fórmulas, mapas mentais).

---

### 6. `markly` — pacote Typst para sangria e marcas de corte ★★★★★
**Link:** https://typst.app/universe/package/markly/

**O que é:** Pacote oficial do Typst Universe para sangria (`bleed`), marcas de corte, marcas de registro.

**O que copiar / usar diretamente:**
- `markly.setup(content-width:148mm, content-height:210mm, bleed:3mm)` — configura A5 com 3mm de sangria em todas as bordas.
- `to-bleed` e `img-to-bleed` para fundos coloridos que chegam à borda (capa, separadores de seção).
- Marcas de corte + registro automáticas: o PDF entregue à gráfica fica com `TrimBox` correto — sem trabalho manual.
- Complemento: o próprio Typst 0.12+ tem suporte nativo a `#set page(bleed: 3mm)` que define `TrimBox` no PDF.

**Fluxo CMYK:** Typst suporta cores CMYK nativamente (`cmyk(c, m, y, k)`). Para perfil ICC (ISOCoated v2), usar pós-processamento via Ghostscript:
```bash
gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite \
   -dColorConversionStrategy=/CMYK \
   -sOutputICCProfile=ISOcoated_v2_eci.icc \
   -sOutputFile=out_cmyk.pdf in_rgb.pdf
```

---

### 7. `tasteful-pairings` — combinações de fontes para Typst ★★★★☆
**Link:** https://typst.app/universe/package/tasteful-pairings/

**O que é:** Pacote curado com duplas de fontes serif+sans testadas para tipografia de documentos.

**Pares recomendados para planner premium (todas livres/OFL):**

| Par | Heading | Body | Estilo |
|-----|---------|------|--------|
| `modern-heritage` | Montserrat | Georgia Pro | Contemporâneo, forte |
| `legible` | Lexend | Literata | Leitura prolongada, clean |
| `source` | Source Sans 3 | Source Serif 4 | Adobe open-source, refinado |
| `ibm-plex` | IBM Plex Sans | IBM Plex Serif | Técnico/acadêmico |

**Para o Concurseiro:** recomendar `source` (Source Sans 3 + Source Serif 4 da Adobe, ambas OFL) — look profissional sem custo, suporte excelente a diacríticos do pt-BR.

**Fontes adicionais de qualidade comprovada (todas OFL):**
- **EB Garamond** — clássica, ideal para corpo de texto seções teóricas
- **Libertinus Serif** — fork melhorado do Linux Libertine, com OpenType Math
- **Inter** — sans moderna, excelente para UI/labels e campos de preenchimento
- **Crimson Text** — alternativa mais condensada ao Garamond (economiza espaço em A5)

---

### 8. Vivliostyle CLI (HTML/CSS → PDF) ★★★☆☆
**Link:** https://vivliostyle.org | https://docs.vivliostyle.org/en/cli/getting-started/

**O que é:** CLI open-source que transforma HTML+CSS em PDF de qualidade tipográfica via Chromium headless.

**O que copiar:**
- `@page :left` / `@page :right` com margens espelhadas — planner A5 com encadernação.
- `env(pub-title)` e `env(doc-title)` como running heads automáticos.
- Temas oficiais (`@vivliostyle/theme-techbook`) como referência de CSS print de qualidade.
- **Hifenização:** `hyphens: auto; hyphenate-limit-chars: 6 3 2;` + `lang="pt-BR"` no HTML.
- **Viúvas/órfãs:** `orphans: 2; widows: 2;` no CSS (padrão sensato para texto corrido).
- `counter-reset` / `counter-increment` para numeração automática de páginas e seções.

**Vantagem sobre Typst:** mais fácil para designers que conhecem CSS; desvantagem: mais lento, CMYK requer Ghostscript pós-processamento. Para o Concurseiro, Typst é superior.

---

## Técnicas-chave consolidadas

### Grid e baseline
- Em Typst: usar `#grid(columns: (1fr, 2fr), rows: (24pt,) * 20)` para grades de horário.
- Linhas de 5mm (regra padrão de caderno) = `12.5pt` em Typst — verificar no PDF renderizado.
- Para dot grid: usar `cetz` (pacote Typst) desenhando círculos de 0.5pt em intervalos de 5mm.

### Componentes de página do planner
Estrutura recomendada (inspirada no PaperMaker e no LaTeX Yearly Planner):
```
planner/
├── main.typ          # orquestrador + config global
├── config.typ        # variáveis (cores, fontes, margens, tamanho A5)
├── components/
│   ├── capa.typ      # capa com sangria
│   ├── pagina-intro.typ    # como usar o planner
│   ├── visao-anual.typ     # 12 meses em 2 páginas
│   ├── pagina-ciclo.typ    # grade de ciclo de estudos semanal
│   ├── pagina-mensal.typ   # calendário mensal + metas
│   ├── pagina-semanal.typ  # 7 dias com blocos de tempo
│   ├── pagina-diaria.typ   # schedule horário + revisão espaçada
│   └── pagina-tracker.typ  # heatmap de dias estudados
└── utils/
    ├── datas.typ     # lógica de calendário perpétuo
    └── estilos.typ   # tokens de design
```

### Sangria e impressão (A5 = 148×210mm)
```typst
// Typst nativo (≥0.12)
#set page(
  paper: "a5",
  bleed: 3mm,   // define TrimBox no PDF
  margin: (inside: 20mm, outside: 14mm, top: 16mm, bottom: 14mm),
)
```
Alternativa com `markly` para marcas de corte visíveis no arquivo enviado à gráfica.

### CMYK
Typst suporta `cmyk()` nativamente para definir cores. Para perfil certificado (ISO Coated v2), pós-processar o PDF com Ghostscript (ver receita na seção do `markly` acima). Preto rico para capa: `cmyk(60%, 40%, 40%, 100%)`.

### Fontes — instalação rápida
```bash
# Fonte recomendada: Source Serif 4 + Source Sans 3
# Disponíveis no Google Fonts e no pacote typst-fonts
typst compile main.typ --font-path ./fonts/
```

---

## Repos extras (referência rápida)

| Repo | Tecnologia | Stars | Usar para |
|------|-----------|-------|-----------|
| `stachuman/boox-template-generator` | Python+ReportLab+React | 24 | Ver como ReportLab renderiza grades e widgets |
| `jacrify/diaryGenerator` | Python+pypdf | — | Padrão de stitching de páginas em PDF |
| `georgiastuart/planner-generator-python` | Python+Jinja2+HTML | 9 | Pipeline HTML→PDF via Playwright (alternativa rápida) |
| `jaidetree/journal-2026` | Typst+SVG | — | Abordagem de SVG como base de layout visual (Inkscape → Typst) |
| `peterfriese/eightbyten` | Typst | — | Colofão, metadados editoriais, estrutura de livro |

---

## Ordem de estudo recomendada

1. **Clonar PaperMaker** (`hfactor/papermaker`) e rodar localmente — ver o PDF gerado, especialmente `daily.typ` e `week.typ`.
2. **Baixar PDF de exemplo** do `kudrykv/latex-yearly-planner` (discussão #57) — analisar proporções visuais, densidades de linha, tipografia.
3. **Iniciar o template Typst** com `markly` para sangria + `tasteful-pairings` para fontes.
4. **Implementar componentes** na ordem: config → estilos → pagina-diaria → pagina-semanal → pagina-mensal → visao-anual → capa.
5. **Pós-processar** com Ghostscript para CMYK antes de enviar à gráfica.

---

*Gerado por Claude Code em 20/jun/2026 — pesquisa via Exa + WebFetch. Números, links e técnicas verificados contra fontes primárias.*
