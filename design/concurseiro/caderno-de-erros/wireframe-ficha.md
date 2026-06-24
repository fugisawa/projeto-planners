# Caderno de Erros — wireframe da ficha (v0)

> **✅ Reconciliado e aplicado `[23/jun/2026]`** — taxonomia **K/M/R/S/T + flag ⚑banca**, campo
> **confiança 1–5** e revisão por **status `refiz/acertou/dominado` + `→ Anki`** (timing do FSRS) já no
> wireframe abaixo. Fonte: [`../conceitos/reconciliacao-estudo-asia.md`](../conceitos/reconciliacao-estudo-asia.md).

Estrutural (ASCII), derivado de [`spec.md`](spec.md) + os 3 benchmarks. **19/jun/2026 · validado no conceito (Mayara).**
Aqui está a **ficha completa** (módulo standalone, **Fase 2**). A versão lite para o Planner v1 foi **descartada** [Daniel · 21/jun/2026] — o v1 tem apenas ponteiro "→ Caderno de Erros".

## A — Ficha completa (1 questão por ficha) — formato 2 colunas

```
+-----------------------------------------------------------------+
| FICHA DE ERRO     Data __/__/__    Matéria [▮ cor]     D-___    |
| Fonte: banca / ano / assunto ________________________________   |
| Triagem — só registrar se:  [ ] ponto-cego  [ ] armadilha  [ ] questão-modelo |
| Confiança no erro:  |1 |2 |3 |4 |5|  (⃝ no nº — erro confiante = prioridade)  |
+-------------------------------+---------------------------------+
| TIPO (marque + cor) ⚑=banca   |  CICLO DE REVISÃO (status)      |
|  [ ] K conhecimento           |   refiz fechado __  [ ] acertou |
|  [ ] M método / confusão      |   [ ] dominado (acertou 2×)     |
|  [ ] R raciocínio do enunc.   |   → Anki [ ] (agendado · FSRS)  |
|  [ ] S execução (diga onde)   +---------------------------------+
|  [ ] T estratégia  [ ] ⚑banca |  QUESTÃO ANÁLOGA (refazer)      |
|                               |   ref: __________   [ ] acertei |
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

**Por que cada região (origem no benchmark):**
- **Triagem** no topo → CN (错题本): só ponto-cego/armadilha/modelo entram (caderno ativo, não depósito).
- **Causa + cor** → KR (오답노트, 5 códigos) + CN (6 categorias) + JP (4 tipos), convergidas em 5 + "pegadinha de banca" (específica de concurso).
- **"O que eu estava pensando" ANTES da solução** → universal nos 3 (o diferencial do método).
- **Gatilho → Ação** → KR 행동강령 / CN "gatilho de aplicação" (*implementation intention*, Gollwitzer d≈0,65).
- **Revisão espaçada embutida** (D+1/7/15/30) → Ebbinghaus, presente em 100% dos templates estruturados — sem depender de app.
- **Questão análoga** → lacuna apontada em JP/CN (refazer num problema parecido fecha o loop).

## B — Variante frente/verso (*testing effect*, do Japão)
Mesma ficha, mas **enunciado + "raciocínio errado" na frente** e **solução + gatilho no verso** —
força recordar antes de virar a página. Indicada para exatas/raciocínio.

## C — Log de baixo atrito ("오답 로그", da Coreia) — para reta final
Uma linha sob a questão no próprio material:
```
[matéria] q.__  causa:[ ]C [ ]I [ ]A [ ]D [ ]B   errei pq: __________  rev: [ ][ ][ ]
```

> Decisões a validar: nº de fichas por caderno · taxonomia final · tamanho do campo "raciocínio
> errado" · B5 apaisado × A5 retrato · folha solta (活页) × costurado. Custo via `sourcing-analyst`.
