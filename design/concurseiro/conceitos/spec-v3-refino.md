# Spec de refino v3 — elevar ao "caprichoso JP/KR" (21/jun/2026)

> Saída do passo **planner-designer DECIDE** (Workflow 3 · orquestracao.md). O typst-planner executa.
> Fundamento: `pesquisa-v3-sintese.md` (método, já sólido) + pesquisa estética nova (exa/tavily) +
> crítica adversarial independente. Idioma: pt-BR.

## Diagnóstico (1 frase)
O método da v3 está sólido; o **acabamento** não. A v3 parece uma **planilha fria competente** — falta o
"caprichoso/delicado" JP/KR: respiro, fio leve que **some ao escrever**, e **coesão de sistema**.

## Princípios estéticos a aplicar (pesquisa exa/tavily)
1. **"Página que você quer abrir amanhã"** — convidativa, não punitiva. Planilha pura é abandonada na quarta. `[planner-apps · KR]`
2. **Fio JP mais leve que o ocidental** — a grade guia sem dominar; some quando a caligrafia entra. `[Kokuyo/Kleid]`
3. **Respiro com propósito** — espaço em branco é editorial, não abandono de página.
4. **Calor vem do papel creme + refinamento**, nunca de cor impressa (paleta segue fria + 1 acento).
5. **Coesão de sistema** — numeração de página, navegação, mini-calendário, coerência entre páginas (Jibun/Hobonichi).

## Correções priorizadas (crítica adversarial · aceitas)

### CRÍTICO
- **Sessão · cabeçalho:** D-prova flutua solto no canto → **faixa horizontal integrada** `Data (1fr) · D-prova (centro, círculo) · Horas líquidas (dir.)` ~16mm. Proporção INDIGO real (DATE 50 / D-DAY 25 / TIME 25).
- **Sessão · time-log:** 05–04h (24h) → **06–23h**. Corta 14h de células vazias impressas em ~100 cópias; menos mecânico; libera linhas p/ "Estudar".
- **Bússola · vazio + incompleta:** ~40% de página morta. Adicionar **Meu stack** (Anki/QConcursos/cursinho/outro) + **3 matérias críticas da fase**. Vira mapa pessoal, não frontmatter técnico.
- **Bússola · chip do Registro:** `colorsq` 4mm some ao pintar → **chip 8mm** (é o dicionário de cor, elemento de longa duração).

### ALTO
- **Sessão · "Estudar" (planorows):** sem coluna de cor → adicionar **chip de cor** (conecta plano → time-log → cor da matéria; unifica o sistema "cor = matéria").
- **Sessão · "Amanhã":** 1 linha quase invisível → **2 linhas + rótulo leve** (é a transição D→D+1, criação de hábito).
- **Semanal · duplicação:** `calibtable` + `weekhours` = duas tabelas empilhadas (ar de planilha; ambas listam matérias). → **fundir numa só**: `cor · matéria · horas · prevejo% · obtive%`. *(NB: NÃO reintroduzir paintchart semanal — o diário já pinta as horas; pintar 2× foi reprovado pelo dono.)*
- **Guia · "Cores":** redundante com o Registro → trocar por **mini-exemplo preenchido** (1 linha mostrando o sistema em ação).
- **Semanal · fios das células:** internos a 0.6pt dominam vazios → **0.3pt** (some ao pintar).

### MÉDIO
- **Sistema · numeração de página:** ausente → **nº no canto externo inferior, 7pt ink-3** (navegação do miolo wire-o).
- **Ciclo · "Como rodar":** `seclbl` (bold 9.5) inverte hierarquia dentro do `band` → **7.5pt ink-2** (regra softhead).
- **Ciclo · "Duração":** dica longa na mesma linha domina o campo → **dica em linha abaixo, 6pt recuada**.
- **Bússola · calendário:** inset comprime escrita → `rows: 6.5mm, inset y:0`.
- **Guia · título 22pt** quebra o sistema (h1=18pt) → **18–20pt + subtítulo + régua de acento** (diferencia o Guia pelo tratamento, não pelo tamanho gritante).

## Página a página (conjunto de 6 — confirmar Pontes)
1. **Guia** — título distinto por tratamento; sistema em 5 módulos; ○△→×; mini-exemplo de cor; revisar/praticar amplo (Anki+questões+discursiva+lei seca). nº de página.
2. **Bússola** — alvo + porquê (4) + fase + **3 matérias críticas** + **meu stack** + Registro de Matérias (chip 8mm) + calendário (6.5mm).
3. **Ciclo** — fila de blocos (mantida); "Como rodar" suavizado; "Duração" reorganizado.
4. **Sessão (HERO)** — faixa Data·D-prova·Horas; intenção; Estudar (com chip de cor); time-log 06–23 pintável; output (questões/acerto + foco 1–5); Revisar/praticar; Amanhã (2 linhas).
5. **Semanal** — tabela única por matéria (horas + calibração prevejo/obtive); reflexão fechada; → Migrar.
6. **Pontes** — *ritual de ponte por ferramenta* (sinal→decisão de Anki/QConcursos/cursinho/simulados) — distinto do Semanal (que analisa MEUS dados). **[a confirmar: manter separada vs. fundir no Semanal]**

## Ordem de execução (hero-first · Workflow 3)
Sessão (hero) → **olhar PNG + validar com dono** → Bússola → Semanal → Ciclo → Guia → Pontes → merge CMYK + nº de página + `pdffonts`/`inkcov`. Cada página: render → olhar PNG → corrigir.
