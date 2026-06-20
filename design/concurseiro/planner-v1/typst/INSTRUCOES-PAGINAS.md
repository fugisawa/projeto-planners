# Briefing por Página — Planner Concurseiro v1

> Instruções concretas de layout, campos e execução Typst para cada página A5.
> Cada página deve caber em 1 folha A5 (148 × 210 mm). Compilar com `render.py`
> e inspecionar o PNG antes de qualquer ajuste de spacing.

---

## Convenções compartilhadas (aplicar em TODAS as páginas)

### Margem
```typst
margin: (left: 18mm, right: 11mm, top: 11mm, bottom: 11mm)
```

### Tokens obrigatórios
Importar sempre `config.typ` + `estilos.typ`. Não redefinir localmente nenhum token de cor, fonte ou raio.

### Par/spacing global
```typst
set par(leading: 0.6em, spacing: 0.4em)
```
Nas páginas que usam listas longas (Diário, Semanal), usar `spacing: 0pt` e controlar gaps com `v()` explícito para evitar overflow.

### Fios
- Grade interna / pontilhado de escrita: `0.3–0.4 pt`, cor `hair` ou `grid-c`
- Divisor de seção: `0.6–0.7 pt`, cor `hair`
- Borda de bloco (card, softband): `0.5–0.6 pt`, cor `hair`
- Bordura editorial accent (uso pontual, 1× por página): `2 pt`, cor `accent`

### Chips de matéria
`width: 8mm` (reduzir de 9 mm — chip mais estreito alivia a linha). `radius: 1mm`. Borda `0.5 pt`, cor `hair`.

### Rótulos de campo
7–8 pt, `ink-2`, tracking `+0.3 pt`. Labels de seção primária: 8–9 pt, bold, `ink-2`.

### Números de hora
Sempre com zero à esquerda: "05", "06"... Já implementado em `timeblock()`.

### Itens que saem do corpo e vão para a contracapa interna (implementar 1× no miolo)
Key de símbolos BuJo: `• tarefa · – nota · ○ evento · ✕ feito · → migrado · * prioridade` — 7 pt, 2 colunas, `ink-3`.

---

## Página 1 — Diário

### Objetivo
Unidade atômica de estudo. Ritual de entrada (time-log) → execução (Estudar) → revisão espaçada (Revisar) → fechamento numérico + reflexão.

### Estrutura (topo → base)

#### Cabeçalho (altura total ~9–10 mm)
3 campos em grid `(1fr, 22mm, 30mm)`:

1. **Data** — `fieldcol("Data")`: rótulo micro + linha sólida.
2. **D-prova** — centralizado, círculo `radius: 5mm`, stroke `accent 0.9pt`, rótulo "D-prova" em micro acima. Manter o círculo — ele é o âncora motivacional.
3. **Tempo** — `fieldcol("Tempo de estudo")`: rótulo micro + linha sólida.

Separar do time-log com `v(3.5mm)`.

#### Time-log (Manhã / Tarde / Noite)
Grid 3 colunas iguais, `column-gutter: 5mm`.

Cada bloco via `timeblock()`:
- Título: 7 pt bold `ink-2`
- Células: **4.5 mm de altura** (subir de 4 mm — acomoda highlighter com conforto)
- 8 horas por bloco (Manhã 05–12, Tarde 13–20, Noite 21–04)
- Fio: `grid-c 0.4 pt`

**A instrução "cada quadradinho = 10 min · pinte com a cor da matéria" DEVE SAIR DO CORPO DA PÁGINA.**
Mover para a **margem esquerda** (rotacionada 90°, 6 pt, `ink-3`) ou para a página de onboarding.
No corpo, deixar apenas o time-log limpo.

Separar com `v(2mm)`.

#### Seção Estudar
`sechead("Estudar", hint: "matéria · tarefa · quanto")` — atualizar o hint para incluir "quanto" (reforça planejamento por quantidade, não só tempo).

**7 linhas** de `subjrow` com `v(1.2mm)` entre elas. (Reduzir de 8 para 7 — libera espaço para o campo de reflexão no rodapé sem apertar.)

Separar com `v(2mm)`.

#### Seção Revisar (softband)
`softband` com `sechead("Revisar", hint: "espaçada · D+1 · D+7 · D+15")`.
**4 linhas** de `subjrow` — manter como está.

Separar com `v(2.5mm)`.

#### Fechamento (linha de métricas)
Grid `(auto, 20mm, auto, 16mm, auto, 18mm, auto, 1fr)`:
```
Questões [linha] Acertos [linha] % [linha] Sessões [linha]
```
Adicionar o campo **"Sessões ___"** após o "%" — evidência de uso real mostra que concurseiros pensam em sessões de 45 min, não em horas brutas.

Separar com `v(2.5mm)`.

#### Campo de reflexão — NOVO (ausente no v1)
Fio horizontal `0.3 pt`, `hair`.
Label: `"Hoje ·"` em 6.5 pt, caixa alta, tracking `+1 pt`, `ink-3`.
2 linhas pontilhadas (`dot()`) com `v(1.6mm)` entre elas.
Altura total do bloco: ~11 mm.

Este campo fecha o loop ritual do dia. Sem prompt elaborado — o ponto no rótulo é intencional (lacônico).

### Execução Typst — pontos críticos
- `set par(spacing: 0pt)` + `v()` explícitos em cada gap para controle preciso.
- Aumentar `rows: 4.5mm` no `table()` do `timeblock()` em `estilos.typ` **sem quebrar as outras páginas** — o `timeblock` é usado só no Diário, então a mudança é segura.
- Verificar overflow: 7 linhas Estudar + 4 Revisar + cabeçalho + time-log + fechamento + reflexão = ~188 mm úteis. Apertar `v()` entre seções se necessário (aceitar 1.5 mm onde hoje há 2 mm).
- A legenda do time-log pode ser `place(left + horizon, rotate(-90deg, [...]))` na margem ou removida para onboarding.

---

## Página 2 — Semanal

### Objetivo
Visão de ciclo semanal: metas por matéria + grade de rotação + reflexão + migração para próxima semana.

### Estrutura (topo → base)

#### Cabeçalho
`masthead("Semanal", kicker: "Ciclo de Matérias")` — já existente.
Linha de `Semana ___ a ___ · D-prova ___ · Prova ___` — manter.

#### Seção Metas da Semana — Rotação & Volume
Tabela com colunas `(1fr, 18mm, 16mm, 14mm, 10mm)`:
`MATÉRIA | QUEST. | PÁGS/AULAS | HRS-ALVO | FEITO?`

**Adicionar coluna de chip de cor** à esquerda da matéria: `(5mm, 1fr, 18mm, 16mm, 14mm, 10mm)`.
O chip 5 × 5 mm (quadrado, sem raio) é o ponto de definição do color-coding que percorre todo o planner. Essencial para o sistema funcionar.

8 linhas de matéria. Linha de totais abaixo: `Previsto ___ h · Real ___ h · Questões ___ · % Acerto ___`.

#### Seção Rotação da Semana
Grid de 4 slots (M1–M4) × 7 dias.
Manter estrutura atual — está correta e funcional.
Labels M1–M4 em `accent` (dourado/cobre) — coerente com o tema.

#### Seção Ajuste & Reflexão Semanal
4 linhas pontilhadas (manter).

#### Campo "Migrar para próxima semana" — NOVO
Logo abaixo de Ajuste & Reflexão:
`lbl("→ Migrar")` em 7 pt, `ink-2`.
2 linhas pontilhadas.
Implementa a Migration BuJo sem overhead. Reduz abandono em cascata.

### Execução Typst — pontos críticos
- A coluna de chip na tabela de metas requer ajuste de larguras. Testar: `(5mm, 1fr, 18mm, 16mm, 14mm, 8mm)` para não apertar na coluna FEITO?.
- O chip na tabela não precisa de `subjrow` — usar `rect(width: 4mm, height: 4mm, stroke: ..., fill: none)` inline na célula.
- O campo "Migrar" cabe dentro do softband existente de Ajuste & Reflexão, ou como bloco separado abaixo dele (preferir separado para distinção visual).

---

## Página 3 — Bússola da Jornada

### Objetivo
Frontmatter de orientação estratégica. Preenchido uma vez (ou ao iniciar novo planner). Mapa do edital + Stack digital + Calendário de provas + Balanço mensal.

### Problemas do v1 a corrigir

#### Problema 1: "Por que quero isso?" com 1 linha
**Causa:** 1 pontilhado é insuficiente para uma resposta que ancora motivação por meses.
**Correção:** Ampliar para **4 linhas pontilhadas** com `v(1.6mm)` entre elas. Reduzir o `v(6mm)` após o bloco objetivo/por-que para `v(4mm)` e compensar.

#### Problema 2: Calendário de Provas com linhas apertadas (~3 mm)
**Causa:** `cal-row` usa `v(1.2mm)` acima e abaixo — cada linha total tem ~3.4 mm. Difícil escrever à mão.
**Correção:** Aumentar `v(1.2mm)` para `v(2.2mm)` em `cal-row`. Altura resultante por linha ≈ 5.4 mm. Reduzir de 5 para **4 linhas** no Calendário de Provas para compensar o espaço.

#### Problema 3: Ausência de campo de cor no Mapa do Edital
**Causa:** `mapa-row` não tem coluna de chip colorível.
**Correção:** Adicionar coluna `5mm` à esquerda do nome da matéria:
```typst
columns: (5mm, 1fr, 13mm, auto)
```
O chip quadrado `rect(4mm × 3.5mm, fill: none, stroke: hair 0.5pt)` é o "dicionário de cores" do planner — sem ele, o color-coding do time-log não tem ponto de definição.

#### Problema 4: Balanço Mensal com muito espaço vazio no rodapé
**Causa:** após os blocos "O que foi bem / O que precisa mudar", sobram ~30% de página em branco sem estrutura.
**Correção:** Adicionar campo de **"Matéria foco do próximo ciclo"** com 2–3 linhas pontilhadas. Isso fecha o loop mensal e impede o espaço vazio de sinalizar "incompleto".

### Execução Typst — pontos críticos
- A mudança em `mapa-row` é local à `bussola.typ` — não afeta estilos.typ.
- Testar se 14 linhas no Mapa do Edital ainda cabem após adicionar a coluna de chip e as 4 linhas de "Por que". Se não couber, reduzir para 12 linhas (ainda suficiente para a maioria dos editais da Câmara).
- O `cal-row` é definido localmente em `bussola.typ` — alterar `v(1.2mm)` → `v(2.2mm)` e `range(5)` → `range(4)`.

---

## Página 4 — Pontes Digitais

### Objetivo
Sincronização semanal ou quinzenal: dados do digital (Anki, QConcursos, cursinho) transferidos para o papel. Fecha o loop papel ↔ app.

### Problemas do v1 a corrigir

#### Problema 1: "REFLEXÃO INTEGRADA" é nome vago
**Correção:** Renomear para **"AJUSTE DE ROTA"**. Fraseado orientado à ação gera mais preenchimento que fraseado reflexivo genérico (confirmado por fontes coreanas).

#### Problema 2: Prompt "O que o digital mostra que o papel não captura?" é longo e filosófico
**Correção:** Substituir por **"O que o dado revela · o que farei diferente"** — 2 campos separados de 1 linha cada, com labels diretos. Mantém a função sem o overhead filosófico.

#### Problema 3: Seção Simulados com apenas 1 linha de dado
**Causa:** só há espaço para 1 entrada.
**Correção:** Ampliar para **2 linhas** de dados. Adicionar campo `Data` antes de `Nota`:
```
CONCURSO/BANCA | DATA | NOTA | META | PONTO MAIS FRACO
```

### Estrutura mantida
- Banco de Questões (Acerto geral / Melhor matéria / Pior matéria / Total questões) — manter.
- Anki / Revisão Espaçada — manter.
- Aulas / Cursinho com checkboxes de ritmo — manter.
- Simulados — expandir para 2 linhas.
- Ajuste de Rota (renomeado) — revisar prompt.

### Execução Typst — pontos críticos
- A renomeação da seção é mudança de string — trivial.
- Expandir Simulados para 2 linhas pode apertar a página. Verificar overflow após o rename e a expansão dos Simulados. Se necessário, reduzir `v(6mm)` após o masthead para `v(4mm)`.
- O bloco "Ajuste de Rota" pode usar `softband` com borda `accent` lateral em vez do box com borda quadrada atual — harmoniza com o estilo da Ficha de Erro.

---

## Página 5 — Ficha de Diagnóstico de Erro

### Problema principal: bug de render no v1
A ficha exibe código Typst em vez do layout porque `ficha-card` e `masthead` não estavam resolvidos no momento do render.
**O código em `ficha.typ` está correto** — o bug era de importação/escopo em versões anteriores. Verificar que `masthead`, `sqr`, `lbl`, `dot` estão todos definidos em `estilos.typ` antes de compilar.

### Problemas de design a corrigir

#### Problema 1: "O que eu pensei" vem depois do cabeçalho de triagem
**Causa:** a ordem atual coloca Triagem → Causa → O que eu pensei → Raciocínio correto.
**Correção (confirmada pela pesquisa coreana):** Mover "O que eu pensei (errado — antes da solução)" para **imediatamente após o cabeçalho de matéria/origem**, antes de Triagem e Causa. A sequência correta:
1. Cabeçalho (Matéria + Origem + D-)
2. **O que eu pensei** (campo aberto, 3 linhas)
3. Triagem + Causa (em bloco compacto)
4. **Raciocínio correto** (3 linhas)
5. Quando vir → Faço
6. Revisão (D+1 · D+7 · D+15 · D+30)

A inversão é o achado mais importante: capturar o raciocínio errado **antes** de ver a solução é o que transforma o erro em aprendizado.

#### Problema 2: Borda da ficha-card desalinhada com o tema
**Causa:** a ficha usa `stroke: (paint: hair, thickness: wt.box)` em toda a borda — funcional mas sem distinção visual.
**Correção:** Adotar o mesmo padrão da instrução de uso: `stroke: (left: (paint: accent, thickness: 2pt))` para a borda esquerda da ficha-card, e `stroke: (paint: hair, thickness: wt.box)` nas demais bordas.
Ou: usar `softband` (fundo `band`) como container da ficha, com radius 2mm — harmoniza com o Revisar do Diário e com o Ajuste de Rota das Pontes.

#### Problema 3: Apenas 2 fichas por página
**Resultado atual:** 2 fichas/página é correto dado o espaço. Não tentar colocar 3 — a densidade mataria a legibilidade. Manter 2 fichas com `v(2mm)` entre elas.

#### Problema 4: Campo "Quando vir → Faço" com apenas 1 linha cada
**Correção:** Adicionar **1 linha extra** ao campo "Faço" (a ação é mais longa que o gatilho):
```typst
lbl("Quando vir", size: fs.label); h(1.5mm); dot()
v(1.2mm)
arrow; h(1mm); lbl("Faço", size: fs.label); h(1.5mm); dot()
v(1.2mm)
dot()  // linha extra para o "Faço"
```

### Execução Typst — pontos críticos
- Reordenar os blocos dentro de `ficha-card` conforme sequência acima (1–6).
- Testar que 2 fichas ainda cabem após a reordenação. A nova ordem é mais espaçada (O que eu pensei sobe, mas o campo compacto de Triagem/Causa ainda está presente) — verificar altura total da ficha com `render.py`.
- O `softband` como container da ficha-card é a mudança mais impactante visualmente: unifica o tema visual das páginas. Implementar e comparar com PNG.
- Garantir que `ficha-card` seja uma variável `let` (não `let ficha-card(...)` — sem parênteses — como está no código atual). O bug de render era de escopo, não de lógica.

---

## Checklist de consistência visual entre páginas

Antes de considerar qualquer página pronta:

- [ ] Título da página em `masthead()` ou equivalente (EB Garamond ou Lato Regular ~22pt)
- [ ] Kicker no canto superior direito em caixa alta 7pt `ink-3`
- [ ] Fios de seção: somente `0.4–0.7 pt`, cor `hair` ou `grid-c`
- [ ] Chips de matéria: `8mm × 5mm`, `radius: 1mm`, `stroke: hair 0.5pt`
- [ ] Nenhum fundo de cor impresso em zona de time-log ou checklist
- [ ] Nenhuma instrução de uso dentro do corpo principal da página (→ margem ou onboarding)
- [ ] Campo de chip de cor presente nas seções que têm matéria
- [ ] Número de página no rodapé externo inferior (7pt, `ink-3`)
- [ ] Compilar e inspecionar PNG — confirmar 1 página A5

---

## Ordem de implementação sugerida

1. **Diário** — ampliar células time-log para 4.5mm + remover legenda do corpo + adicionar campo "Hoje ·" no rodapé + adicionar "Sessões" ao fechamento.
2. **Bússola** — corrigir "Por que quero isso?" (4 linhas) + Calendário de Provas (linhas maiores) + chip de cor no Mapa do Edital.
3. **Ficha de Erro** — corrigir bug de render + reordenar campos + ajustar estilo de borda.
4. **Pontes Digitais** — renomear "Reflexão Integrada" → "Ajuste de Rota" + expandir Simulados.
5. **Semanal** — adicionar chip de cor na tabela de metas + campo "→ Migrar".
