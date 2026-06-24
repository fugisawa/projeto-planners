# Análise comparativa — linha INDIGO Study Planner

**Síntese dos 5 teardowns** (`teardown-*.md`) **+ pesquisa de reviews** (`../pesquisa/fontes/reviews-uso-estudantes.md`).
**19/jun/2026.** Fonte primária: infográficos oficiais indigostory.co.kr (ver `../pesquisa/fontes/indigo_manifest.json`).

> **Status:** Pesquisa de base concluída. Implicações incorporadas em [direcao-de-design-concurseiro.md](direcao-de-design-concurseiro.md) e [wireframes-planner-v1.md](wireframes-planner-v1.md). Este doc é read-only — não editar.

---

## TL;DR
- A INDIGO tem **uma escada de 5 produtos** com **um DNA comum** (timetable de 10 min + D-day +
  tracker de aulas online + mensal/diário + **perpétuo** + **papel 120 g**) e **diferenciais por modelo**.
- A mecânica-núcleo — **"colorir o tempo de estudo" em blocos de 10 min** — é o que vicia, gera
  conteúdo orgânico no *studygram* e justifica a recompra. **É obrigatória no Concurseiro.**
- O flagship **772 "Meta"** evoluiu para um **sistema metacognitivo** (entendi/confuso/não-entendi).
- **Lacunas claras para o concurseiro BR:** sem **revisão espaçada**, sem **tracker de
  questões/simulados**, sem **ciclo de matérias** semanal, e layout que **pressupõe estudante
  full-time** (culpa para quem trabalha). É exatamente o espaço do Concurseiro.

---

## 1) Matriz comparativa

| | **1492 Mensal** | **584 Básico** | **1752 Foco-Tempo** | **1753 Foco-Matéria** | **772 Meta** ★ |
|---|---|---|---|---|---|
| Duração | 1 mês | 4 meses | 3 meses | 3 meses | **6 meses** |
| Tamanho (mm) | 124×188×4 | 135×190×17 | 135×190×14 | 135×190×14 | **165×215×22** |
| Páginas | 40 | 160 | 112 | 112 | **208** |
| Encadernação | **grampo** (lay-flat) | wire-o | twin-ring | espiral duplo | wire-o |
| Papel | offset 120 g | 120 g creme | 120 g | 120 g | 120 g |
| Capa | 250 g matte | **300 g + UV** | — | — | — |
| Cores | 4 | 5 | — | — | 3 (Gray/Ivory/Mint) |
| Preço | **3.500₩** (~R$13) | 7.800₩ (~R$30) | 7.800₩ (~R$30) | 7.800₩ (~R$30) | **9.800₩** (~R$38) |
| Eixo | entrada/sprint | custo-eficiente | **TEMPO** | **MATÉRIA** | **METACOGNIÇÃO** |

> Preço por duração: **1 mês 3.500₩ → 3–4 meses 7.800₩ → 6 meses 9.800₩**. O **584 (4 m, 160 p)**
> é o melhor "valor por página" no mesmo preço dos 3-meses especializados (112 p). Câmbio
> estimado ¥/₩→BRL `[a confirmar]`.

## 2) O DNA comum da linha (o que TODOS têm)
1. **Timetable de 10 minutos** na página diária — pintar com marcador por matéria (o coração).
2. **Contador D-** (D-day) no cabeçalho do dia — ancora à prova-alvo.
3. **Tracker de aulas online (인강)** — grades numeradas por curso (vídeo-aulas) — **análogo direto
   aos cursinhos online de concurso (Gran, Estratégia, etc.).**
4. **Cascata Mensal → Diário** + **soma de horas** estudadas.
5. **Perpétuo / sem datas** (começa quando quiser) → elimina culpa de páginas em branco + recompra.
6. **Papel 120 g** (anunciado como *feature*, não só spec) — essencial p/ marcador não traspassar.
7. **Foco exclusivo em estudo** (não é agenda de vida).

## 3) A escada de produtos (lógica de portfólio)
- **1492 (entrada, R$13):** grampo, 4 mm, sprint/adesão — "porta de entrada" de baixo risco.
- **584 (base, R$30):** wire-o, capa premium UV, 4 meses — validado por **공시생 (concurseiros)** como o mais custo-eficiente.
- **1752 / 1753 (especializados, R$30):** mesmo corpo (112 p), dois eixos — **tempo** vs **matéria**.
- **772 Meta (topo, R$38):** maior (A5-ish), 208 p, sistema metacognitivo completo.

**Padrão de encadernação por faixa:** grampo (mais barato/fino, lay-flat) → twin-ring/espiral → wire-o (mais grosso/premium).

## 4) Evolução da linha & o exemplar do Daniel
- O exemplar físico do Daniel — **"3 TIMES / One Day Study Planner / 3months"** — tem
  *Subjects Plan → Mensal → Semanal (5 sem) → 31 Diários → Avaliação → Notas*, repetindo. Isso
  bate com a **geração antiga / estilo 584** (que mantém Mensal+**Semanal**+Diário+Avaliação).
- O **772 "Meta" atual largou o Semanal** e migrou para um **frontmatter analítico** (MY GOAL,
  STUDY PLAN by subject, ONLINE CHECK, EXAM RESULT, 6-MONTHS PLAN) + repetição enxuta
  **[Mensal 1 p + Diário 31 p] ×6** + memo/dados. → a linha foi de "calendário+timetable" para
  **"sistema metacognitivo"**. `[confirmado pelos teardowns]`
- Isto **responde** parte das perguntas em `estrutura-produto-referencia.md`: no Meta, o
  *Subjects Plan* é **frontmatter (×1)**, não por mês.

## 5) O que a INDIGO faz BEM (forças a herdar)
- Mecânica visual de tempo (10 min) com **color-coding por matéria** — vício + conteúdo social.
- **Metacognição** (772): avaliar *compreensão* (entendi/confuso/não-entendi), não só "feito".
- **Loop de feedback** multicamada (tarefa → dia → curso → prova) no Meta.
- **Perpétuo** + **escada de preços** por duração + **papel 120 g** comunicado como diferencial.
- Páginas de **avaliação/reflexão** (GOOD/BAD por matéria) — fecham o ciclo.

## 6) LACUNAS (o espaço do Concurseiro BR) — cruzando teardowns + reviews
| Lacuna na INDIGO | Por que importa p/ concurseiro | Fonte |
|---|---|---|
| **Sem revisão espaçada** | central no concurso — mas no **nosso produto fica no Anki/FSRS**, não no papel `[D1 · 23/jun/2026]` | teardowns 1752/1753; reviews |
| **Sem tracker de questões/simulados** (% acerto) | métrica-rainha do concurso | teardowns |
| **Sem ciclo de matérias semanal** ("ciclo de estudos") | organização típica BR | teardowns; reviews |
| **Layout pressupõe full-time** (timetable vazio = culpa) | concurseiro trabalha; abandono em 4–8 sem | reviews `[confirmado]` |
| Tracker de curso é genérico (인강) | adaptar a cursinhos + **lei seca + PDFs** BR | teardowns |
| Sem mapa do **edital/conteúdo programático** | concurso é orientado a edital | análise |

## 7) Cruzamento com reviews (manter × corrigir)
- **Manter:** time-log colorido (o "driver emocional"); perpétuo/ciclo; **papel ≥100 g** (mín. de mercado); foco em estudo; **lay-flat** (espiral lateral machuca a mão em sessões longas).
- **Corrigir/melhorar:** **espaço diário** maior (queixa do A6 Hobonichi ~10 cm); **anti-culpa**
  para quem estuda em janelas curtas; **traspasse** (papel fino sangra — Hobonichi 52 g é o vilão citado).
- **Mercado BR:** líder **Juspodivm é datado** (608 p/ano) e **não informa gramatura**; **Thalyta
  Stamp** é sem-data mas **sem metodologia de ciclo**. → espaço para "**perpétuo + método codificado no layout**".

## 8) Implicações de design para o Concurseiro (aplicadas ao design v1 — ver [direcao-de-design-concurseiro.md](direcao-de-design-concurseiro.md))
1. **Timetable de 10–15 min + color-coding por matéria** — inegociável (núcleo emocional/viral).
2. **Revisão espaçada delegada ao Anki/FSRS** (papel decide *o quê* ankificar; o digital agenda *quando* — `[D1 · 23/jun/2026]`). O diferencial do papel passa a ser o **sistema de geração** (recordação livre + caderno de erros + mapa de setas), não replicar o espaçamento que o algoritmo faz melhor.
3. **Tracker de questões/simulados** (resolvidas, % acerto, por matéria) — métrica do concurso.
4. **Ciclo de matérias** semanal (rotação de disciplinas) — organização que o concurseiro já usa.
5. **Mapa do edital** (conteúdo programático → progresso) no frontmatter.
6. **Anti-culpa / flexível** para quem trabalha (não assumir 20 h/dia de timetable).
7. **Papel ≥ 120 g comunicado no marketing**; **lay-flat** (espiral topo ou costura).
8. **Metacognição** (entendi/confuso/não-entendi) — herdar do Meta, é barato e poderoso.
9. **Reflexão/avaliação** mensal por matéria.

> Esta análise alimentou o documento de direção de design — ver [direcao-de-design-concurseiro.md](direcao-de-design-concurseiro.md) (concluído em 19/jun/2026). Posicionamento: R$ 129 de lançamento `[Daniel · 21/jun/2026]`.
