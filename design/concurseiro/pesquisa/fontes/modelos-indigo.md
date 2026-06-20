# INDIGO — linha de Study Planners (pesquisa)

**Fonte:** loja oficial **indigostory.co.kr**, categoria **스터디플래너 / Study Planner**
(`cate_no=89`). **Coletado em 19/jun/2026** via Playwright. Fabricante: INDIGO (인디고
디자인문구), design de Eunkyung Jung, *Made in Korea* — ver [`../../referencias/fontes.md`](../../referencias/fontes.md).

> Câmbio: preços oficiais em **₩ (KRW)**. Conversão p/ BRL é **estimativa** a confirmar
> (assumido ~**R$ 0,0038/₩**, jun/2026) — `[a confirmar câmbio KRW/BRL]`.

## Os 5 modelos da categoria

| nº | Nome (KO) | Tradução / foco | Duração | Preço | ≈ BRL |
|---|---|---|---|---|---|
| **772** | 혼자공부 메타 스터디플래너 | "Meta" (metacognição/abrangente) | **6 meses** | 9.800₩ | ~R$ 37 |
| **584** | 기본 스터디 플래너 | "Básico" | **4 meses** | 7.800₩ | ~R$ 30 |
| **1752** | 혼자공부 집공시간 스터디 플래너 | foco em **tempo de estudo** | **3 meses** | 7.800₩ | ~R$ 30 |
| **1753** | 혼자공부 집중과목 스터디 플래너 | foco em **matéria-alvo** | **3 meses** | 7.800₩ | ~R$ 30 |
| **1492** | 월간공부 스터디 플래너 | "Mensal" | **1 mês** | 3.500₩ | ~R$ 13 |

> **Ponte com o exemplar do Daniel:** a capa dele diz *"3 TIMES — One Day Study Planner / 3months"*
> (Produced by INDIGO). Não está mais no catálogo com esse nome; o **메타 (772)** é o parente
> direto (mesma lógica, versão 6 meses), e os **3-meses atuais** são o 1752/1753. `[a confirmar]`

## Spec-âncora confirmada
- **772:** *"월-일 (31일)이 6개월 동안 반복되는 만년형 플래너"* = planner **perpétuo (sem datas)**
  com **Mês-Dia (31 dias) repetindo por 6 meses**. Confirma a lógica modular ×N meses. `[confirmado: site]`
- **Preço por duração:** 1 mês 3.500₩ · 3–4 meses 7.800₩ · 6 meses 9.800₩ (≈ +₩ por mês adicional cai → economia de escala no miolo).

## Imagens baixadas (em `../capturas/<modelo>/`)
Cada modelo tem `detail/` (tiras-infográfico verticais, 900px largura, com legendas em coreano —
mostram cada tipo de página) e `gallery/` (fotos do produto 640px). Proveniência completa
(URL → arquivo) em [`indigo_manifest.json`](indigo_manifest.json).

| Modelo | detail/ | gallery/ |
|---|---|---|
| 772-meta-6meses | ~10 | ~6 |
| 584-basico-4meses | ~6 | ~5 |
| 1752-tempo-3meses | ~11 | ~9 |
| 1753-materia-3meses | ~10 | ~9 |
| 1492-mensal-1mes | ~11 | ~10 |

> Contagens confirmadas após o download (ver `indigo_manifest.json`). As tiras `detail/`
> incluem, em alguns modelos, 1 banner de título e 1 foto de review de cliente.

## Próximo passo
Interpretar as tiras `detail/` (traduzir KO → PT, mapear tipos de página, specs físicas:
tamanho, nº de páginas, gramatura, encadernação) — um teardown por modelo + comparativo,
alimentando [`../../conceitos/`](../../conceitos/).
