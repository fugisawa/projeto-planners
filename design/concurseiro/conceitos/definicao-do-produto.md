# Definição do produto — o sistema de estudo do Concurseiro

**Decisões travadas com o Daniel em 19/jun/2026.** Refina `direcao-de-design-concurseiro.md` e
`metodo-hub-analogico.md`. Persona alinhada à **P1** de `../../../deliverables/estudo-de-mercado.md` (§5).

## 1. Categoria
**Não é agenda** (datada) **nem caderno em branco.** É um **sistema de estudo materializado** — o
**hub analógico** (foco + síntese + diagnóstico de erro + navegação), **harmônico** com o stack digital.

## 2. Arquitetura: ecossistema modular (decisão)
**Módulos independentes entre si, porém complementares**, combinando sob uma **capa/sistema** (à la
Hobonichi/Traveler's). Cada módulo **se sustenta sozinho** (pode ser comprado e usado isolado); juntos
formam o sistema. Implica: **SKUs à la carte + capa unificadora + recompra de refis (LTV) + ecossistema
de capas/colabs** (motor de conteúdo da Mayara).

> ⚠️ Reler: as "seções" de `direcao-de-design §3` e `metodo-hub-analogico §10` passam a ser **módulos
> independentes**, não capítulos de um livro único.

## 3. Restrição de não-colisão (CRÍTICA)
O planejamento **não compete** com os portais (Gran/Estratégia/QConcursos), que já entregam **edital
verticalizado, cronograma e trilha** de forma **barata, automática e bem-feita**. No papel, planejar =
**comprometer, adaptar, executar e refletir** sobre o plano vindo do digital — **nunca gerá-lo**.
(É o princípio "adaptar, não substituir", aplicado ao módulo mais arriscado.)

## 4. Os módulos (validado no conceito · Mayara 19/jun; conjunto exato a refinar no protótipo)
Cada um **independente + complementar**:

| Módulo | O que é (standalone) | Lacuna que preenche | Relação com o digital |
|---|---|---|---|
| **Caderno de Erros** ⭐ (错题본/오답노트) | diagnóstico do *porquê* do erro + gatilho→ação + padrões | o maior gap | complementa QConcursos/Anki (eles dizem *o quê*) |
| **Diário de Foco** | sessão sem celular: time-log 10–15 min + síntese + reflexão do dia | foco anti-celular + processamento | não duplica timer-app/Notion |
| **Caderno de Síntese** | resumos/mapas à mão de aula/lei seca | fixação (handwriting→memória) | complementa vídeo-aula/PDF |
| **Bússola da Jornada** (leve) | commit semanal + reflexão mensal + visão macro + "meu stack" | navegação/constância | **deferente** ao cronograma do cursinho |

> **v1 = o Planner de Estudo** (módulo-âncora: Diário de Foco + ciclo leve + **diagnóstico de erro
> *lite***). O **Caderno de Erros completo** é módulo **standalone na Fase 2**. (Decisão de 19/jun/2026.)

## 5. Fill / Replace / Adapt
Recap (detalhe em `metodo-hub-analogico.md`): **preencher** foco/erros/síntese/macro; **substituir**
planner datado, caderno solto e o celular-de-mesa; **adaptar** a Anki/QConcursos/cursinho/foto→app.

## 6. Persona v1
**Dedicação exclusiva (full-time)** — recorte de alta intensidade da **P1**. Ver `personas-user-stories.md`.

## 7. Decisões pendentes
- **Quais módulos no v1** (depende da validação).
- **Capa/sistema de união:** formato + encadernação que permita módulos avulsos (liga ao **sourcing** —
  multi-SKU + capa encarece; rodar `sourcing-analyst`/`financial-modeler`).
- **Validar** o conjunto de módulos e a tese (anti-celular, caderno de erros, modularidade) com a Mayara.
