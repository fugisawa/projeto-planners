# Toolchain Tier-1 para Planner Premium A5 — Relatório Técnico

**Data:** 20/jun/2026  
**Contexto:** Planner Concurseiro A5, preço R$ 119, produção in-house sem designer, sem software proprietário. Referência atual: HTML/CSS → WeasyPrint (RGB, qualidade de rascunho).  
**Objetivo:** Avaliar toolchains livres/abertos capazes de PDF print-ready com tipografia editorial, time-log em grade, CMYK/PDF-X, sangria 3 mm e marcas de corte.

---

## 1. Tabela comparativa — visão geral

| Critério | WeasyPrint (atual) | Paged.js + Chromium | **Typst** | **LaTeX (LuaLaTeX)** | PrinceXML | Scribus + Python | ReportLab/SVG |
|---|---|---|---|---|---|---|---|
| **Custo** | Gratuito | Gratuito | Gratuito | Gratuito | $3.800 server / free c/ marca | Gratuito | Gratuito (BSD) |
| **Teto tipográfico** | Baixo (sem microtypografia) | Médio (kerning via HarfBuzz, sem protrusion) | **Alto** (kerning, ligatures, hz-expansion, optical margins em PR ativo) | **Máximo** (microtype: protrusion + expansion + kerning em LuaLaTeX) | Muito alto | Médio | Baixo (sem hifenação avançada) |
| **Grades/tabelas vetoriais** | HTML `<table>` (limitado) | HTML/CSS | `#table`, `cetz` (TikZ-like) | **TikZ nativo** (precisa máximo) | HTML/CSS | Python Scripter | API vetorial nativa |
| **CMYK nativo** | Não (RGB) | Não | Sim (`cmyk()` no código) | Sim (`xcolor`, `CMYK`) | Sim | Sim | Sim (`CMYKColor`) |
| **PDF/X** | Não | Não | **Não ainda** (issue #6012 aberto; esperado 2025–2026) | Sim (`pdfx` package, LuaLaTeX+XeLaTeX) | Sim (nativo) | Sim (PDFfile.version=11 para X-1a) | Parcial (sem metadados XMP nativos) |
| **Sangria + marcas de corte** | Hack frágil (margem negativa) | Sim (paged-page webcomp, crop+cross) | Sim (`markly` package; PR #6357 de bleed nativo em revisão) | Sim (`geometry`+`crop` packages) | Sim (nativo) | Sim (nativo DTP) | Manual (draws) |
| **Fontes embutidas** | Sim | Sim (via Chromium) | Sim | Sim | Sim | Sim | Sim |
| **Scriptabilidade** | Alta (Python/HTML) | Média (Node + CLI pagedjs-cli) | **Alta** (`.typ` puro texto, CI-friendly) | Média (`.tex`, buildable via Make/latexmk) | Alta (HTML input) | Média (Scribus `-g -py`) | **Alta** (Python puro) |
| **Iteração/preview** | Lenta (regenerar PDF) | Média (browser preview) | **Rápida** (ms, watch mode) | Lenta (segundos–minutos) | Média | Lenta (GUI obrigatório para design) | Muito rápida |
| **Curva de aprendizado** | Baixa (HTML/CSS) | Baixa-média | **Baixa** (sintaxe limpa) | Alta (LaTeX clássico) | Baixa (HTML) | Alta (GUI + Python Scripter) | Média (API imperativa) |
| **Maturidade print** | Produção (mas RGB) | Produção parcial | **Alta** para tipografia; print-correctness em evolução | **Máxima** (40 anos) | Máxima | Alta (DTP profissional) | Alta (financeiro/relatórios) |

---

## 2. Análise individual

### 2.1 Melhorar o atual: HTML/CSS + Paged.js via Chromium headless

**O que muda em relação ao WeasyPrint:** Paged.js é um polyfill JS do W3C CSS Paged Media que roda sobre Chromium, adicionando suporte real a:
- `@page` com `marks: crop cross` e `bleed: 3mm`
- running headers dinâmicos (`string-set`)
- footnotes, cross-references com número de página

**Prós:**
- Mantém HTML/CSS existente — menor refatoração
- Chromium renderiza fontes via HarfBuzz com kerning e ligatures adequados
- `pagedjs-cli index.html -o out.pdf` — scriptável
- Webcomponent `<paged-page bleed="3mm" marks="crop cross">` para layout preciso
- Chrome 131 (nov/2024) passou a suportar `@page` margin boxes nativamente, reduzindo dependência do polyfill

**Contras:**
- **Zero CMYK nativo** — todo output é RGB (sRGB via Chromium)
- **Sem PDF/X** nativo — requer pós-processamento via Ghostscript
- Tipografia limitada a CSS: sem protrusion/expansion real, sem optical margin alignment maduro (PR Paged.js aberta)
- Headless Chromium tem bug: ignora `url()` em `@page` CSS; workaround necessário (base64 inline)
- Chrome 131+ causa conflito com Paged.js (ghost pages em margin boxes) — requer patch manual no `baseStyles`

**Teto de qualidade:** Bom para livros com layout HTML-driven; insuficiente para tipografia editorial de ponta em texto corrido.

---

### 2.2 Typst

**Estado atual (jun/2026):**
- CMYK: `cmyk(0%, 0%, 0%, 100%)` nativo no código; cores preservadas no PDF — [confirmado PR #8149](https://github.com/typst/typst/pull/8149)
- ICC profile embed: issue #3143 aberta (em discussão ativa, não implementado)
- PDF/X: issue #6012 aberta — **ainda não implementado**; workaround: pós-processar com Ghostscript
- Sangria: pacote `markly` (bleed + crop + registration marks via CeTZ); PR #6357 de bleed nativo em revisão final pelo mantenedor
- Optical margin alignment (protrusion): PR #7782 adicionou protrusion configurável para ambas as margens (merged jan/2026)
- Grade/tabelas: `#table` nativo + `cetz` (equivalente a TikZ) — adequado para time-log

**Prós:**
- Compilação em milissegundos — iteração rápida
- Sintaxe limpa, versionável em git, CI-friendly
- Tipografia quase equiparável ao LaTeX (Knuth-Plass paragraph breaking + kerning + ligatures + optical margin)
- Pacotes existentes para planners: `calendaring` (grids de treino/hábito), `markly` (bleed/marcas)
- Comunidade ativa; planner PDF já produzidos com Typst ([hfactor/papermaker](https://github.com/hfactor/papermaker), kudrykv usando Typst na branch `rubify2`)
- Fontes embutidas por padrão

**Contras:**
- PDF/X **não disponível** nativamente em jun/2026 — requer pós-processamento Ghostscript obrigatório
- ICC profile embed ainda não implementado — afeta colour management rigoroso
- Ecosistema menor que LaTeX (TikZ tem 20 anos de templates; CeTZ ainda amadurecendo)

**Receita print-correctness para Typst:**
```typst
// 1. Definir cores em CMYK nativo
#let preto-texto = cmyk(0%, 0%, 0%, 100%)
#let rich-black  = cmyk(60%, 40%, 40%, 100%)  // TIC 240%

// 2. Configurar página A5 com sangria via markly
#import "@preview/markly:0.2.0": *
#let ctx = markly.setup(
  content-width:  148mm,
  content-height: 210mm,
  bleed:          3mm,
  cut-marks:      true,
  registration-marks: true,
)

// 3. Pós-processar PDF com Ghostscript (ver seção 4)
```

---

### 2.3 LaTeX (LuaLaTeX + microtype + TikZ + pdfx)

**Estado atual:** Toolchain mais madura e comprovada para PDF print-ready profissional.

**Prós:**
- `microtype` com LuaLaTeX: protrusion + expansion (font hz) — **máximo teto tipográfico disponível em software livre**
- `pdfx` package: gera PDF/X-1a, X-3, X-4 com ICC profile embed nativo e metadados XMP
- `xcolor` com opção `cmyk`: cores CMYK nativas em todo o documento
- `TikZ`: grade de time-log vetorial com precisão milimétrica (tabelas `tikzpicture`, `pgfcalendar`)
- `geometry` + `crop`: sangria e marcas de corte configuráveis
- Templates LaTeX para planners existentes e comprovados (TeXalendar, latex-yearly-planner, kjodle/planner-in-latex)
- LuaLaTeX: suporte a fontes OpenType/TTF/OTF sem reprocessamento

**Contras:**
- Curva de aprendizado alta — sintaxe complexa, erros crípticos
- Compilação lenta (segundos a minutos para documentos longos)
- TikZ para grade de time-log requer conhecimento intermediário a avançado
- Debugar layout é trabalhoso sem preview interativo
- Latexmk resolve compilação incremental, mas não elimina lentidão

**Receita completa LuaLaTeX print-ready:**
```latex
% Preâmbulo mínimo para planner A5 print-ready
\documentclass[a5paper, 10pt]{article}

% PDF/X-1a com perfil FOGRA39
\usepackage[x-1a]{pdfx}
\setCMYKcolorprofile{CoatedFOGRA39.icc}{ISO Coated v2 (ECI)}{coated}{url}

% Tipografia máxima
\usepackage{fontspec}          % LuaLaTeX: fontes OpenType
\setmainfont{EB Garamond}[Ligatures=TeX, Numbers=OldStyle]
\usepackage[
  protrusion=true,
  expansion=true,
  tracking=true
]{microtype}

% Cores CMYK
\usepackage[cmyk]{xcolor}
\definecolor{preto-texto}{cmyk}{0,0,0,1}
\definecolor{rich-black}{cmyk}{0.6,0.4,0.4,1}  % TIC 240%

% Sangria 3mm e marcas de corte
\usepackage[
  a5paper,
  includeheadfoot,
  margin=15mm
]{geometry}
\usepackage[cam, a5, center]{crop}

% Grade de time-log via TikZ
\usepackage{tikz}
\usetikzlibrary{calendar, matrix}
```

---

### 2.4 PrinceXML

**Custo real:**
- Desktop license (uso individual): **USD $495** (one-time, inclui 12 meses suporte)
- Server license: **USD $3.800/server** (one-time)
- Non-commercial: **gratuito com watermark** + logo na primeira página + obrigação de link ao site — **incompatível com produto comercial**

**Conclusão:** Inviável para nosso caso. O planner é vendido a R$ 119 — uso comercial imediato. Custo de USD $495 (desktop) ou $3.800 (server) é desproporcional para Fase 1. Eliminar.

---

### 2.5 Scribus + scripting Python

**Estado atual:**
- Scribus roda headless: `scribus -g -py script.py -- arquivo.sla`
- PDFfile API: `pdf.version = 11` (X-1a), `pdf.version = 12` (X-3), `pdf.version = 10` (X-4)
- CMYK nativo — é um DTP profissional
- Pacote `scribus-mcp` v1.3.1 permite que Claude dirija o Scribus via MCP (headless + interativo)
- Já existe `planner_creator.py` no Codeberg para planners página-por-dia em Scribus

**Prós:**
- CMYK + PDF/X nativos sem pós-processamento
- Layout visual em GUI para design inicial; automação via Python para variações
- `ScribusGenerator` para data-merge (variar conteúdo por CSV)

**Contras:**
- Workflow de dois estágios: design em GUI → exportar SLA → automatizar via script (iteração lenta)
- Difícil versionar layout `.sla` (XML binário complexo)
- Headless em servidor Linux precisa de Xvfb (virtual framebuffer)
- Não é "código-first" — modificar layout requer abrir GUI

**Teto de qualidade:** Alto para DTP; tipografia inferior ao LaTeX/Typst (sem microtype).

---

### 2.6 ReportLab / SVG gerado por código

**Prós:**
- API Python pura — máxima scriptabilidade
- CMYK nativo (`CMYKColor`, `enforceColorSpace=CMYK`)
- Precisão vetorial para grades (time-log) — cada linha desenhada programaticamente
- `canvas.saveState()` / `canvas.restoreState()` para reuso de elementos

**Contras:**
- **Sem tipografia editorial** — sem hifenação avançada, sem protrusion, sem optical margins
- PDF/X requer metadados XMP manuais (não há suporte nativo automatizado)
- Layouts complexos exigem coordenadas absolutas — manutenção difícil
- Texto corrido (parágrafos) é inferior a qualquer sistema de typesetting

**Uso ideal:** Gerar _apenas_ as grades de time-log/tracker como SVG vetorial para importar no Typst ou LaTeX — não como solução completa.

---

## 3. Receita de print-correctness (CMYK / PDF-X / sangria)

### 3.1 Perfis ICC — qual usar?

| Situação | Perfil recomendado | Fonte |
|---|---|---|
| Offset coated paper (couchê) — padrão europeu | **FOGRA39** (ISOcoated v2) | [ECI.org](http://www.eci.org/) |
| Offset coated paper — padrão norte-americano | **GRACoL 2006** | IDEAlliance |
| Offset uncoated (papel offset comum) | **FOGRA47** (ISOuncoated) | ECI.org |
| Digital printing (impressão digital) | perguntar à gráfica | tipicamente 260–280% TIC |
| **Recomendação para planner A5** (papel offset 90g couchê fosco, gráfica BR) | **FOGRA39** como OutputIntent; confirmar com gráfica | [estimativa triangulada] |

Baixar ICC profiles: [ECI.org profiles](http://www.eci.org/en/downloads) (gratuitos) — `ISOcoated_v2_300_eci.icc`.

### 3.2 Total Ink Coverage (TIC) — limites

| Substrato | TIC máximo | Fórmula rich black segura |
|---|---|---|
| Offset coated (couchê) — FOGRA39 | **300–340%** | C60 M40 Y40 K100 = **240%** |
| Offset uncoated (offset) | 260–280% | C30 M20 Y20 K100 = 170% |
| Digital printing (toner) | 260–280% | C40 M30 Y30 K100 = 200% |
| IngramSpark/KDP coated | 280% | C60 M40 Y40 K100 = 240% |

**Regras de ouro:**
- Texto corrido → `K:100% C:0 M:0 Y:0` (100% TIC) — evita ghosting por misregistro
- Grandes áreas pretas → `C60 M40 Y40 K100` (240% TIC) — rich black seguro
- NUNCA usar registration black `C100 M100 Y100 K100` (400% TIC) em artwork

### 3.3 Ghostscript: receita RGB→CMYK + PDF/X-1a

```bash
# Pré-requisito: baixar ISOcoated_v2_300_eci.icc em /usr/share/color/icc/
# Download: http://www.eci.org/en/downloads

# Converter PDF RGB → PDF/X-1a com FOGRA39
gs \
  -dBATCH \
  -dNOPAUSE \
  -dNOOUTERSAVE \
  -sDEVICE=pdfwrite \
  -dPDFX \
  -dPDFXCompatibilityPolicy=1 \
  -sColorConversionStrategy=CMYK \
  -sDefaultRGBProfile=/usr/share/color/icc/sRGB.icc \
  -sOutputICCProfile=/usr/share/color/icc/ISOcoated_v2_300_eci.icc \
  -sOutputFile=planner-pdfx1a.pdf \
  planner-source.pdf

# Nota 1: o arquivo PDFX_def.ps DEVE ser editado com caminho do ICC antes de usar.
# Nota 2: Ghostscript não produz PDF/X-4 completo com transparência — usar Typst/LaTeX
#         com ICC embed nativo se precisar de X-4.
# Nota 3: verificar conformidade com: verapdf --flavour 1a planner-pdfx1a.pdf
```

**Limitação importante:** Ghostscript v9.x/10.x converte RGB→CMYK de forma aceitável mas não ideal para halftones de fotos. Para o planner (majoritariamente tipografia + grades vetoriais), o resultado é adequado.

### 3.4 Checklist sangria e marcas de corte

```
Tamanho final A5:       148 × 210 mm (TrimBox)
Sangria:                +3 mm em cada lado → arquivo: 154 × 216 mm (BleedBox)
Área segura (safe zone): -3 mm = 142 × 204 mm (texto/logos dentro desta área)
Marcas de corte:        fora do BleedBox, na área de slug
Fontes:                 100% embutidas (verificar com pdffonts ou preflight)
Imagens:                300 dpi mínimo (planner sem fotos = vetorial puro ✓)
Transparência (X-1a):   proibida — evitar sombras/gradientes com alpha
```

---

## 4. Recomendação final — as 2 melhores opções para o caso Planners

### Opção A (recomendada imediata): **Typst + pós-processamento Ghostscript**

**Por quê:** Melhor equilíbrio scriptabilidade × qualidade tipográfica × velocidade de iteração. CMYK nativo no código. Sangria via `markly`. Compilação em milissegundos — ideal para ajustes finos de layout. Ecossistema com pacotes específicos para planners e calendários (`calendaring`, `markly`). Typst é o único sistema onde tipografia editorial de ponta + scriptabilidade total + velocidade coexistem.

**Fluxo de trabalho:**
```
fonte.typ (CMYK, markly bleed, cetz grades)
  → typst compile fonte.typ -o planner-rgb.pdf   # milissegundos
  → Ghostscript (receita seção 3.3)              # converte RGB→CMYK + PDF/X-1a
  → verapdf validate                              # verificação conformidade
  → planner-print-ready.pdf
```

**Gap atual a monitorar:** PDF/X nativo (issue #6012) e ICC embed (issue #3143) — ambos em roadmap ativo. Quando implementados, o passo Ghostscript torna-se opcional.

### Opção B (teto máximo): **LuaLaTeX + microtype + TikZ + pdfx**

**Por quê:** Qualidade tipográfica absoluta — nenhum software livre supera microtype+LuaLaTeX. PDF/X-1a com ICC embed nativo sem pós-processamento. TikZ para grade de time-log com precisão vetorial perfeita. Indicado se a diferença de qualidade tipográfica for prioritária sobre velocidade de iteração.

**Fluxo de trabalho:**
```
planner.tex (LuaLaTeX + pdfx + TikZ + CMYK)
  → lualatex planner.tex   # ~10–30s por compilação
  → planner-print-ready.pdf  (PDF/X-1a com ICC FOGRA39 incorporado)
  → verapdf validate
```

**Custo real:** Curva de aprendizado alta; TikZ para grade demanda 1–2 dias de setup inicial. Compilação lenta torna ajustes de design custosos.

### Decisão executiva para Fase 1

Para o planner Concurseiro em produção agora:

1. **Começar com Typst** (Opção A) — menor tempo até PDF de qualidade, iteração rápida, CMYK já funcional no código, `markly` para sangria/marcas.
2. **Pós-processar com Ghostscript** para PDF/X-1a e CMYK com FOGRA39 enquanto o suporte nativo do Typst não chega.
3. **Reservar LaTeX+TikZ** para o time-log em grade se o resultado do CeTZ do Typst for insatisfatório — é possível gerar a grade como PDF vetorial em LaTeX e importar no Typst via `image()`.
4. **Nunca PrinceXML** — licença comercial incompatível com custo zero da Fase 1.
5. **Scribus** apenas se precisar de layout visual DTP com controle pixel-a-pixel — não recomendado para workflow code-first.

---

## 5. Fontes e referências

- Typst CMYK PR #8149: https://github.com/typst/typst/pull/8149
- Typst PDF/X issue #6012: https://github.com/typst/typst/issues/6012
- Typst bleed PR #6357: https://github.com/typst/typst/pull/6357
- Typst optical margins PR #7782: https://github.com/typst/typst/pull/7782
- Typst ICC profile issue #3143: https://github.com/typst/typst/issues/3143
- `markly` package: https://typst.app/universe/package/markly/
- `calendaring` package: https://typst.app/universe/package/calendaring/
- pdfx LaTeX package (CTAN): https://ctan.math.illinois.edu/macros/latex/contrib/pdfx/pdfx.pdf
- microtype package (CTAN): https://ctan.org/pkg/microtype
- LuaLaTeX microtype comparison (2025): https://tug.org/pipermail/texhax/2025-March/026735.html
- LodePublishing LaTeX book template: https://github.com/LodePublishing/How-to-Publish-a-Book-with-LaTeX-PDF-EPUB---Free-Streamlined-Template
- Ghostscript color management: https://ghostscript.readthedocs.io/en/latest/GhostscriptColorManagement.html
- Receita Ghostscript PDF/X: https://www.codegenes.net/blog/how-to-use-ghostscript-to-convert-pdf-to-pdf-a-or-pdf-x/ [2025-12-23]
- Guia PDF/X (FOGRA39/GRACoL): https://kaijuconverter.com/guides/pdf-x-print-standard-complete-guide [2026-04-27]
- TIC limits (FOGRA39/GRACoL/digital): https://www.designyourway.net/blog/ink-coverage-in-cmyk-printing/ [2025-06-11]
- Rich black formula: https://www.designyourway.net/blog/what-is-rich-black-in-cmyk/ [2025-06-04]
- Paged.js vs CSS nativo (Chromium 131): https://doppio.sh/guide/css-paged-media-vs-pagedjs
- PrinceXML licensing: https://www.princexml.com/purchase/
- Scribus headless Python: https://z-uo.medium.com/generate-publishing-by-code-with-scribus-cdebaa96975b [2024-04-01]
- scribus-mcp v1.3.1: https://pypi.org/project/scribus-mcp/1.3.1/
- Typst vs LaTeX tipografia: https://cambric.pub/blog/what-is-typst/
- ReportLab CMYK: https://docs.reportlab.com/reportlab/userguide/ch2_graphics/
- Perfis ICC ECI: http://www.eci.org/en/downloads
- Verificação PDF/X: https://docs.verapdf.org/

---

*Relatório gerado em 20/jun/2026. Atualizar quando issues Typst #6012 e #3143 forem fechadas.*
