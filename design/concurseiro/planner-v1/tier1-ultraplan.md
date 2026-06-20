# Ultraplan — Tier-1 sem software pro (Planner v1)

**20/jun/2026.** Como chegar o mais perto de um freelancer **Tier-1 profissional** produzindo o planner
**por código** (in-house, iterável, custo zero), **sem InDesign/Affinity**. Plano vivo — a escolha de
**toolchain finaliza** quando voltarem [`tier1-toolchain.md`](tier1-toolchain.md) e
[`tier1-priorart.md`](tier1-priorart.md) (2 agentes Opus rodando). Estruturado via sequential-thinking.

## Objetivo
Elevar o planner de "rascunho limpo" (v3) a **quase-Tier-1**, de modo que o freelancer vire
**polimento/validação** (ou opcional no v1). Saída: **PDF A5 print-ready** (sangria 3 mm · marcas · CMYK · PDF/X · 300 dpi).

## As 5 dimensões de qualidade Tier-1
1. **Print-correctness** — sangria · marcas de corte · CMYK+ICC · PDF/X · 300 dpi · fontes embutidas.
2. **Tipografia** — escala modular · grid de baseline · entrelinha · kerning/ligaduras · **figuras tabulares** nas grades · margens ópticas · viúvas/órfãs.
3. **Grid/layout** — colunas/margens consistentes · time-log matematicamente exato · alinhamento · ritmo vertical.
4. **Design/gosto** — contenção editorial · hierarquia · paleta · capa · "sentir premium" (a mais difícil).
5. **Método iterativo** — gerar → renderizar → criticar → refinar.
> 1–3 são técnicas (toolchain resolve); **4 é o calcanhar de Aquiles** sem designer.

## Como atacar o GOSTO sem designer (5 alavancas)
- **Design por referência:** extrair *design tokens* das referências capturadas (Hobonichi/Leuchtturm/MD/Rhodia/Kokuyo/INDIGO) — margens, escala, fios, densidade, paleta, pareamento de fontes. Portar proporções comprovadas. ("Tier-1" = bons defaults + contenção + consistência → codificável.)
- **Sistema de tokens rígido:** espaçamento (4/8 pt), escala tipográfica, baseline, cores, fios num só lugar → consistência automática.
- **Fontes premium livres (OFL/SIL):** ~50% da sensação (serifa editorial + grotesca de qualidade — definir com a pesquisa).
- **Painel de crítica adversarial:** agentes-lente (**tipógrafo · prepress · diretor de arte · usuário "Rafael"**) pontuam cada página vs. a rubrica; síntese dirige o refino; **loop até a nota parar de subir**.
- **Rubrica objetiva** (abaixo).

## Fases
- **P0** pesquisa toolchain + prior-art — *rodando*.
- **P1** decidir toolchain · construir o **sistema de tokens** (de referência) · escolher fontes livres.
- **P2** reconstruir as 5 páginas no toolchain — **começar pelo time-log do Diário** (o mais difícil).
- **P3** pipeline print-correctness (sangria/marcas/CMYK via **Ghostscript+ICC** / PDF/X) + **preflight** (veraPDF/Acrobat).
- **P4** **loop de crítica adversarial** (painel multi-lente) → refina → repete até convergir.
- **P5** validar (preflight + teste de impressão real) + handoff.

## Agentes/skills
Pesquisa (P0 ✓) · **extração de tokens** (minerar capturas) · build por página · **painel de crítica**
(3–4 lentes + síntese, em loop) · **prepress check** (Ghostscript + verificar PDF/X). Sem skill de design
dedicada → **o painel de crítica é o substituto do designer**.

## Rubrica Tier-1 (pontuar 1–5 por página, no loop de crítica)
- **Alinhamento & grid** — tudo no grid; nada "quase alinhado".
- **Hierarquia** — o olho sabe aonde ir.
- **Tipografia** — escala coerente · figuras tabulares · sem viúvas/órfãs · tracking de caixa-alta.
- **Densidade & respiro** — nem sufocado nem vazio; ritmo consistente.
- **Cor** — contida; acento com intenção; deixa espaço p/ o marca-texto do aluno.
- **Detalhe** — fios de espessura única; cantos; consistência entre páginas.
- **Print-correctness** — sangria/marcas/CMYK/PDF-X ok no preflight.
- **"Premium feel"** — passaria por produto de prateleira? (o teste final.)

## Riscos & mitigação
- CMYK/PDF-X do toolchain → **Ghostscript + ICC**.
- **Teto de gosto** (code-gen < designer) → colar nas estruturas Tier-1 comprovadas; freelancer vira **polimento**, não criação.
- Over-engineering/tempo → **timebox** + loop até retorno decrescente.
- Licença de fonte (comercial) → só **OFL/SIL**.

## Decisão (toolchain travado — 20/jun/2026, pós-pesquisa)
**Typst + Ghostscript.** Detalhe em [`tier1-toolchain.md`](tier1-toolchain.md) e [`tier1-priorart.md`](tier1-priorart.md).
- **Typst** p/ a composição: **CMYK nativo** (`cmyk()`), **margens ópticas + hz-expansion** (jan/2026),
  pacote **`markly`** (sangria 3 mm + marcas de corte + TrimBox correto), compilação em ms.
- **Ghostscript** p/ **PDF/X-1a + ICC FOGRA39** (Typst ainda não faz PDF/X — issue #6012). Receita GS RGB→PDF/X no relatório.
- Plano B (teto máximo): **LuaLaTeX + microtype + TikZ + pdfx**. **PrinceXML eliminado** (pago, US$ 495–3.800).
- **Fontes (OFL):** **Source Serif 4 + Source Sans 3** (ótimo pt-BR); alt.: EB Garamond / Libertinus / Inter.
- **Arquitetura a copiar:** `hfactor/papermaker` (`config.typ → estilos.typ → componentes de página`).
  Refs visuais: `kudrykv/latex-yearly-planner`; foldmark/punchmark p/ fichário A5: `stettberger/notebook`.
- **Print-correctness:** FOGRA39 (couché) · **rich black C60 M40 Y40 K100** (TIC 240%) · texto = **K100 puro**.
- **Executável aqui:** Typst via `uv run --with typst` (pip) + Ghostscript — sem instalar nada pesado.

## Execução (a partir daqui)
**P1** Typst + portar a arquitetura PaperMaker + **sistema de tokens** (extraído das referências) + fontes.
**P2** páginas (começar pelo **time-log do Diário**). **P3** Ghostscript PDF/X-1a+FOGRA39 + preflight.
**P4** **loop de crítica multi-lente** (tipógrafo · prepress · diretor de arte · usuário) até convergir.
**P5** validar + (opcional) teste de impressão.
