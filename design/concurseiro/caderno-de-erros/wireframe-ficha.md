# Caderno de Erros — wireframe da ficha (v0)

Estrutural (ASCII), derivado de [`spec.md`](spec.md) + os 3 benchmarks. **19/jun/2026 · validado no conceito (Mayara).**
Aqui está a **ficha completa** (módulo standalone, **Fase 2**). A versão lite para o Planner v1 foi **descartada** [Daniel · 21/jun/2026] — o v1 tem apenas ponteiro "→ Caderno de Erros".

## A — Ficha completa (1 questão por ficha) — formato 2 colunas

```
+-----------------------------------------------------------------+
| FICHA DE ERRO     Data __/__/__    Matéria [▮ cor]              |
| Fonte: banca / ano / assunto _______  Confiança no erro: 1 2 3 4 5 |
| Triagem — só registrar se:  [ ] ponto-cego  [ ] armadilha  [ ] questão-modelo |
+-------------------------------+---------------------------------+
| TIPO DE ERRO (K/M/R/S/T)      |  REFIZ FECHADO (re-teste)       |
|  [ ] K conhecimento/conceito  |   data __/__  o acertei  o errei|
|  [ ] M método / confusão      |   [ ] dominado                  |
|  [ ] R leitura do enunciado   +---------------------------------+
|  [ ] S execução / cálculo     |  PONTE:  -> card no Anki [ ]    |
|  [ ] T estratégia / tempo     +---------------------------------+
|  [ ] pegadinha de banca       |  QUESTÃO ANÁLOGA  ref:__ [ ] ok |
+-------------------------------+---------------------------------+
| O QUE EU ESTAVA PENSANDO  (raciocínio errado — ANTES da solução)|
|  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  |
|  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  |
|  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  |
+-----------------------------------------------------------------+
| SOLUÇÃO / RACIOCÍNIO CORRETO                                     |
|  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  |
|  . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .  |
+-----------------------------------------------------------------+
| GATILHO -> AÇÃO:  quando eu vir ______ -> faço ______ / cuidado: ____ |
+-----------------------------------------------------------------+
```

**Por que cada região (origem no benchmark + evidência):**
- **Triagem** no topo → CN (错题本): só ponto-cego/armadilha/modelo entram (caderno ativo, não depósito).
- **Confiança no erro (1–5)** → **hipercorreção** (Butterfield&Metcalfe 2001): o erro cometido com alta confiança é o mais corrigível — vira prioridade. `[D3 · 23/jun/2026]`
- **Tipo de erro K/M/R/S/T + cor** → taxonomia do 错题본 (estudo de evidência) + "pegadinha de banca" (BR); os códigos habilitam a estatística mensal. `[D2 · 23/jun/2026]`
- **"O que eu estava pensando" ANTES da solução** → universal nos 3 (o diferencial do método).
- **Gatilho → Ação** → KR 행동강령 / CN "gatilho de aplicação" (*implementation intention*, Gollwitzer d≈0,65).
- **Refiz fechado (re-teste)** → Metcalfe 2014: re-testar de cabeça fechada **bloqueia o retorno** do erro. A temporização (D+3/D+7/D+15) é executada pelo **Anki/FSRS** — o papel não agenda. `[D1 · 23/jun/2026]`
- **Questão análoga** → lacuna apontada em JP/CN (refazer num problema parecido fecha o loop).

## B — Variante frente/verso (*testing effect*, do Japão)
Mesma ficha, mas **enunciado + "raciocínio errado" na frente** e **solução + gatilho no verso** —
força recordar antes de virar a página. Indicada para exatas/raciocínio.

## C — Log de baixo atrito ("오답 로그", da Coreia) — para reta final
Uma linha sob a questão no próprio material:
```
[matéria] q.__  tipo:[ ]K [ ]M [ ]R [ ]S [ ]T  conf:_  errei pq: ________  -> Anki [ ]
```

> Decisões a validar: nº de fichas por caderno · taxonomia final · tamanho do campo "raciocínio
> errado" · B5 apaisado × A5 retrato · folha solta (活页) × costurado. Custo via `sourcing-analyst`.
