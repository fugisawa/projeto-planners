# Pesquisa v3 — síntese acionável (21/jun/2026)

> Pesquisa "muito melhorada" para o redesign v3 do Planner de Estudo (Concurseiro, F1).
> Três frentes paralelas: **ciência da aprendizagem** (academic-researcher), **workflow real do
> concurseiro BR** (market-researcher), **landscape de design de planners** (search-specialist).
> Onde as três convergem, a decisão é dura. Idioma: pt-BR.

---

## 0. A convergência que decide o v3

As três frentes, independentes, apontaram para **a mesma falha do v1/v2** e a mesma correção:

> **A grade "rotação M1–M4 × 7 dias da semana" está metodologicamente errada.**
> O concurseiro BR estuda por **ciclo de estudos** (sequência de blocos por matéria, ponderada por
> peso no edital + dificuldade), que **avança bloco a bloco, independente do dia**. Quando a vida
> interrompe, o ciclo não "quebra" — só continua de onde parou. Isso **elimina a culpa de cronograma
> quebrado**, que é a causa nº 1 de abandono de planner. `[confirmado · Estratégia/Estudaqui/VocêConcursado · jun/2026]`

O **Cycle Tracker** (blocos numerados, sem dia da semana, sem data) é simultaneamente: (a) fiel ao
método dominante, (b) a defesa contra abandono, e (c) o **diferenciador mais forte** contra todo
planner coreano pesquisado — nenhum implementa isso. É o coração do v3.

---

## 1. Ciência da aprendizagem → decisões de página

| Achado | Força | Decisão de design |
|---|---|---|
| **Spacing effect** (Cepeda 2006/2008; Dunlosky 2013 — utilidade ALTA) | Muito alta | Pré-imprimir 4–5 marcos de revisão por tópico (~D+1·D+3·D+7·D+15·D+30, defensável p/ janela de 30 d). Não deixar o intervalo a cargo do aluno. |
| **Testing effect / recall** (Roediger&Karpicke 2006; Dunlosky — ALTA) | Muito alta | A página diária **nunca** tem "páginas lidas". Centro = questões feitas/acertos/%. Aluno escolhe recall, não releitura. |
| **Interleaving** (Rohrer&Taylor 2007, d=1.34) | Alta | O **ciclo** já é interleaving. Reforçar: nunca 1 matéria/dia inteiro; intercalar naturezas diferentes (lógica ≠ depois de constitucional). |
| **Output + tempo** (Locke&Latham, d=.42–.80; Ariely 2002) | Alta | Slot diário = bloco de tempo (quando) + meta de output (o quê) + acerto real (resultado). Metas proximais (dia/semana) > distais (a prova). |
| **SRL / metacognição** (Zimmerman; Bisra 2018, d=.55) | Alta p/ framework | Reflexão = **4–6 prompts fechados de 1 linha**, nunca caixa em branco grande (gera culpa + fica vazia). |
| **Calibração / ilusão de fluência** (Karpicke 2009; Bjork) | Alta | Campo **"Prevejo ___% / Obtive ___%"** (2 células) antes/depois das questões. Treina autoavaliação. Novo + barato. |
| **Endowed progress / goal-gradient** (Nunes&Drèze 2006; Kivetz 2006) | Alta | Grids **pré-impressos e preenchíveis** (parecem "já começados"). Pintar célula = momentum. Contador de sequência minimalista. |

## 2. Workflow concurseiro BR → fronteira hub-analógico

- **Ciclo ≠ cronograma:** ciclo de 10–30 h, blocos de 1–2h30, avança por bloco concluído. Página de
  ciclo = **slots numerados em branco** (config pelo aluno), não linhas fixas nem dias da semana. `[confirmado]`
- **Métricas que movem:** horas **líquidas** (≠ brutas), evolução do % por matéria, padrões de erro,
  **nº de ciclos completados** (proxy de consistência). Vaidade: horas brutas, nº de aulas, questões totais. `[triangulado]`
- **Fronteira:** o digital é **banco de dados + automação** (QConcursos calcula %, Anki agenda revisão,
  Gran gera edital verticalizado); o papel é **decisão + intenção + síntese + foco anti-celular**.
  → Não duplicar no papel nada que o app já preenche automaticamente. `[confirmado]`
- **Revisar = decisão, não lista:** o Anki já diz *o que* revisar. O papel decide *o que vira card*.
  Renomear "Revisar" → **"O que vira card / o que revisar"** (decisão de ankificar). `[confirmado]`
- **Intenção ANTES (implementation intention, Gollwitzer d≈.65):** campo "esta sessão: matéria/intenção"
  escrito **antes** de começar. A maioria dos planners só tem log de saída — a inversão é diferenciação real.
- **Macro = mapa da jornada pessoal, não edital:** concurso-alvo + fase atual (conteúdo→questões→reta
  final) + 3 matérias críticas + meu stack. Nunca um edital verticalizado (colisão com Gran/Estratégia). `[confirmado]`
- **Abandono:** rigidez de data → culpa → loop. Perpétuo + dateless + ciclo + prompts fechados resolve.
  Cortar tracker de sono/humor/hidratação (persona dedicação exclusiva quer alto desempenho, não lifestyle). `[confirmado]`
- **Competidor Juspodivm 2026:** 608 pp, 97% 5★ (n=179), mas é lifestyle journal datado — **sem ciclo,
  sem calibração, sem síntese**. Nossa profundidade metodológica é o fosso. `[confirmado]`

## 3. Landscape de design → mecânicas para roubar

| Mecânica | Fonte | Veredito |
|---|---|---|
| Spread de abertura "meta + timetable" (contrato consigo) | Ardium Color Point | **Roubar** — funciona perpétuo |
| **Subject Progress Ledger** (por matéria: swatch de cor + meta de horas + grid 10×10 de 100 h + PR) | síntese nova (BuJo 100h + studygram) | **NOVO — incluir.** Vira o **dicionário de cor** do planner inteiro + prova de progresso de longo prazo |
| **Cycle Tracker** (blocos numerados, sem dia/data) | síntese nova | **NOVO — incluir. Diferenciador nº 1** |
| Time-chart semanal 7 linhas × horas (pintar com marca-texto) | Kokuyo Weekly Visualized | **Roubar** — spread "herói", fotogênico cheio, invisível vazio |
| Plano vs. real no time-log (lápis = plano, marca-texto = real) | Plepic Alarm + Kokuyo TIMELOG | **Roubar** — calibração de tempo embutida |
| Daily Big 3 (3 prioridades no topo, antes da grade) | Full Focus | **Roubar** — 3 linhas |
| Ritual semanal trás/frente (o que funcionou / 3 prioridades) | Full Focus | **Roubar** — só a estrutura |
| Autoavaliação 1–5 do dia (círculo, lápis) | Intelligent Change | **Roubar** — sem journaling verbal |
| Contador de sequência "Dia ___" | studygram | **Roubar** — minimalista, perpétuo |
| Sticker color-coding · QR/app · pixel-grid 365 · gratidão · delegar tarefa · visão 20 anos | Iconic/Panda/CleverFox | **Evitar** — consumível, anti-celular, persona errada, date-dependent |

---

## 4. Conjunto de páginas v3 (decisão)

1. **Guia** — masthead; sistema em 4 módulos; legenda dos símbolos ○△→×; revisão espaçada; **como montar o ciclo**.
2. **Bússola da Jornada** (frontmatter) — alvo + porquê (4 linhas) + **fase atual** + 3 matérias
   críticas + meu stack + **Registro de Matérias** (o ledger: swatch-cor + meta-h + grid 100 h + PR).
3. **Ciclo** (novo, recorrente) — **grade de blocos numerados** (matéria · carga · ○ concluído),
   sem dia da semana; registro "ciclo nº / início / fim / duração em dias"; alerta de intercalar naturezas.
4. **Sessão** (diário) — eyebrow; data · D-prova · **Dia ___ (sequência)**; **intenção pré-sessão**;
   **Daily Big 3**; time-log líquido (plano vs. real); blocos de foco (matéria·objetivo·tempo·○△→×);
   **Revisar = o que vira card**; fechamento (questões/acertos/% + autoavaliação 1–5); **Amanhã**.
5. **Semanal** — eyebrow; **calibração por matéria** (prevejo/obtive %); **time-chart 7 linhas** (pintável);
   ritual fechado (4–6 prompts de 1 linha); **padrão de erro da semana**; → Migrar.
6. **Pontes Digitais** — sinal do app → **decisão** (não transcrição); Anki/questões/aulas/simulados; ajuste de rota.

> Mantido do que funcionou no v1/v2: paleta CMYK fria, Lato, cantos retos, eyebrow/masthead,
> time-log 10-min, seletor ○△→× (genuinamente inédito), helpers Typst. **Tudo o resto é novo.**

## 5. Fontes
academic: Cepeda 2006/2008 · Dunlosky 2013 · Roediger&Karpicke 2006 · Rohrer&Taylor 2007 · Locke&Latham
2002 · Bisra 2018 · Nunes&Drèze 2006 · Karpicke 2009 · Zimmerman 2002 · Bjork 2011.
market BR: Estratégia/Estudaqui/VocêConcursado (ciclo) · Gran (horas líquidas) · Decorando a Lei Seca
(padrões de erro) · Método 4.2/Folha Dirigida (culpa/abandono) · Juspodivm 2026 (competidor) · jun/2026.
landscape: Ardium · Kokuyo Campus · Plepic · Full Focus · Intelligent Change · BuJo · studygram · 2024–2026.
