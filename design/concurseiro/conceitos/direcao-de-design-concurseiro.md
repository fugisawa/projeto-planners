# Direção de design — Planner Concurseiro

**Síntese final** de toda a pesquisa de design (INDIGO ×5, Kokuyo, Hobonichi, reviews/uso).
**19/jun/2026.** Insumos: `teardown-*.md`, `analise-comparativa-indigo.md`,
`../pesquisa/fontes/concorrentes-japao.md`, `../pesquisa/fontes/reviews-uso-estudantes.md`.
Status: **direção** (não spec final) — alimenta protótipo, sourcing e modelo financeiro.

> ⚠️ **REFINADO em 19/jun/2026 — ver [`metodo-hub-analogico.md`](metodo-hub-analogico.md).**
> A pesquisa de comunidades (Anki/med-EUA, China/Coreia, JetPens, stack digital BR) ajustou a tese:
> o planner é um **hub analógico harmônico, NÃO um one-stop-shop**. **Correções a este documento:**
> o **Princípio 2** e a **tabela do §3** abaixo ficam **revistos** — **revisão espaçada e tracker de
> questões NÃO são replicados no papel** (são commodities digitais: Anki/FSRS, QConcursos/TEC); em seu
> lugar entram **diagnóstico de erro (错题본), síntese à mão e foco sem celular**. O **sistema de
> páginas vigente** é o da **§10 de `metodo-hub-analogico.md`**.

---

## 1) Posicionamento (a tese de produto)

> **"A qualidade de objeto de um Hobonichi, com o sistema de estudo que ele se recusa a montar —
> desenhado para o concurseiro brasileiro."**

O mercado tem dois polos e um vazio:

| Polo | Exemplos | Preço | O que falta |
|---|---|---|---|
| Funcional barato | Kokuyo (¥350–594), INDIGO (₩3,5–9,8 mil) | R$ 12–38 | objeto premium; método de concurso |
| Premium lifestyle | Hobonichi | R$ 80–300+ | **qualquer** sistema de estudo |
| **VAZIO → Concurseiro** | — | **R$ 119** | — |

O **método** (edital + ciclo + revisão espaçada + questões) é o valor — não só o objeto. Isso
justifica R$ 119 (acima do funcional, abaixo de um Hobonichi completo) e sustenta a **recompra
3–4×/ano** (LTV ~R$ 374–397) já no dossiê.

## 2) Sete princípios de design (derivados da pesquisa)

1. **Tornar o tempo visível** — time-log de 10–15 min, pintável por cor/matéria. É o núcleo
   emocional e o que vira post espontâneo no studygram (validado em Kokuyo + INDIGO + reviews).
2. **Método embutido no layout** — o diferencial: ciclo de matérias, **revisão espaçada** e
   **questões/simulados** impressos na estrutura (nenhum concorrente faz; é o que o concurseiro compra).
3. **Anti-culpa / flexível** — não pressupor estudo full-time (timetable vazio = abandono em
   4–8 sem para quem trabalha — principal queixa dos reviews). Layout que acolhe janelas de 30–40 min.
4. **Objeto premium como _threshold_** — papel ≥120 g anti-traspasse, **lay-flat**, capa boa.
   Não é luxo; é pré-requisito de credibilidade (Hobonichi) e de funcionar com marcador.
5. **Perpétuo (sem datas)** — elimina culpa de página em branco e habilita recompra (todos os
   asiáticos fazem; o líder BR Juspodivm é datado — fraqueza a explorar).
6. **Vínculo afetivo / conteúdo curado** — citação/conteúdo no rodapé diário (Hobonichi), aqui
   adaptado: **lei seca, súmulas, história, "pílulas de banca", frases de aprovados**. Barato e gera recompra.
7. **Foco exclusivo em concurso** — não é agenda de vida; é "espaço de performance" (reviews).

## 3) Sistema de páginas proposto (o miolo)

| Bloco | Página | Função | Origem |
|---|---|---|---|
| **Frontmatter (×1)** | Identidade + meta-objetivo | cargo-alvo, meta, "porquê" | INDIGO (MY GOAL) |
| | **Mapa do edital** | conteúdo programático → % progresso por tópico | **GAP BR (novo)** |
| | Diagnóstico por matéria | matérias, peso na prova, nível atual | INDIGO Subjects |
| | Calendário de provas + D-day | provas-alvo e contagem regressiva | INDIGO D-day |
| **Ciclo (repete)** | Mensal | calendário perpétuo + metas do mês | INDIGO/Kokuyo |
| | Semanal — **ciclo de matérias** | rotação de disciplinas + metas + horas-alvo | **GAP BR** + Kokuyo weekly |
| | **Diário** | time-log 10–15 min + tarefas por matéria + **metacognição** (entendi/confuso/não) + D-day | Kokuyo + INDIGO Meta |
| | **Revisão espaçada** | tracker D+1/3/7/15/30 por tópico | **GAP BR (núcleo)** |
| | **Questões & simulados** | resolvidas, % de acerto por matéria | **GAP BR (núcleo)** |
| | Avaliação mensal | GOOD/BAD por matéria, horas, reflexão | INDIGO eval |
| **Endmatter (×1)** | Registro de simulados | data, banca, nota, %, evolução | **GAP BR** |
| | Notas livres (quadriculado) | anotações | todos |
| | Conteúdo curado | rodapés + páginas de "pílulas" jurídicas | Hobonichi quotes |

> **Os 3 itens "GAP BR" (edital, revisão espaçada, questões) são o coração competitivo** — o que
> nenhum asiático nem o Juspodivm/Thalyta entregam de forma integrada.

## 4) Especificações físicas (recomendação inicial)

| Spec | Recomendação | Racional |
|---|---|---|
| Formato | **A5 (148×210 mm)** | espaço de escrita (queixa do A6 Hobonichi); padrão Meta/Cousin |
| Encadernação | **lay-flat**: wire-o topo **ou** costura premium | reviews: espiral lateral machuca; lay-flat = threshold premium — **decisão a testar** |
| Papel | **≥120 g**, anti-traspasse, **comunicado no marketing** | mín. de mercado; marcadores; Juspodivm não informa gramatura |
| Duração/páginas | perpétuo, **~100–130 pp (≈3–4 meses)** como SKU principal | "enche em ~3 meses" → recompra (dossiê); escada por duração depois |
| Capa | 300 g + acabamento (UV/soft-touch); ecossistema futuro | INDIGO 584; capas/colabs (Hobonichi) = retenção |
| Cor | sistema de **color-coding por matéria** (marcadores) | Kokuyo/INDIGO; vira identidade visual |

> ⚙️ **Liga ao sourcing/financeiro:** nº de páginas + gramatura + encadernação definem o **custo/un**
> (dossiê: micro-lote R$ 55 → reposição R$ 45). Antes de fechar, rodar **sourcing-analyst** (gráfica BR,
> NCM 4820.10.00) e **financial-modeler** (margem a R$ 119). Lay-flat costurado encarece vs. wire-o.

## 5) Marca & estética
- **Tom:** sério-aspiracional (concurso é projeto de vida), mas leve o suficiente para o studygram.
- **Tipografia:** títulos com presença (INDIGO usa retrô-bold); corpo legível; hierarquia clara.
- **Sistema de cores por matéria** como assinatura visual (e funcional com marcadores).
- **Conteúdo curado** = diferencial barato: rodapés com súmulas/lei seca/história/frases de aprovados.
- **Ecossistema futuro:** capas/adesivos/marcadores próprios (lock-in elegante do Kokuyo; colabs do Hobonichi) — encaixa no motor de conteúdo da Mayara.

## 6) O que herdar de cada referência

| Referência | Herdar | Evitar |
|---|---|---|
| **INDIGO (Coreia)** | time-log 10 min; D-day; metacognição; avaliação; escada de duração; 120 g | pressupor full-time; tracker preso a "인강" |
| **Kokuyo (Japão)** | time-log color-coded; soft-ring lay-flat; perpétuo; preço de entrada | rasura de método (só registra tempo) |
| **Hobonichi (Japão)** | papel premium; lay-flat costurado; citação diária; ecossistema de capas | ausência de sistema; datado; diário pequeno (A6) |
| **Mercado BR (Juspodivm/Thalyta)** | — (aprender com as falhas) | datado; sem método de ciclo; não informa gramatura |

## 7) Riscos & decisões em aberto
1. **Encadernação:** wire-o topo (barato, prático) × costura lay-flat (premium, caro). → testar amostras + custo.
2. **Formato/nº de páginas exatos** — equilíbrio espaço × peso × custo.
3. **Papel/fornecedor** — gramatura e anti-traspasse reais (amostras de gráfica).
4. **Quanto "guiar" vs. "dar liberdade"** — método forte sem virar rígido (a queixa nº1).
5. Reconciliar a **estrutura do exemplar do Daniel** (confirmar fisicamente as perguntas em `estrutura-produto-referencia.md`).

## 8) Próximos passos
1. **Wireframes** das páginas-chave (diário, semanal-ciclo, revisão espaçada, questões, mapa do edital).
2. **Validar com concurseiros** (entrevistas/enquete — usar a audiência da Mayara).
3. **Sourcing + custo** (sourcing-analyst / financial-modeler) para travar specs viáveis a R$ 119.
4. **Protótipo físico** (1 ciclo) para teste de uso real.
