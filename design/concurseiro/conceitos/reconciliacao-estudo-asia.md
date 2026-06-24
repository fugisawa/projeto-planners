# Reconciliação — estudo asiático × specs da v3/Caderno de Erros (23/jun/2026)

> Saída do passo **planner-designer DECIDE** (Workflow 3 · `docs/orquestracao.md`). O `typst-planner`
> executa depois. Funda-se em `research/evidence/aprendizagem-papelaria-asia.md` (estudo graduado por
> evidência) + protótipo `design/concurseiro/referencias/kit-analogico-prototipo-v2.pdf` + specs
> existentes. **Esta é a fonte canônica das decisões T2–T5**; os specs antigos passam a apontar para cá.
> Idioma: pt-BR. Pendente: **business-validator (VAP)** antes de "pronto".

## Decisão-âncora T1 `[Daniel · 23/jun/2026]`
**Manter o roadmap faseado.** O "Kit analógico" é **referência de design + evidência**, não um produto.
- **planner-v3 (F1)** ganha **uma** página nova: **Ficha C — Integração (mapa conceitual)**. Passa de 6 → **7 páginas**.
- **Registro de Erro (Ficha B)** continua **F2 standalone** (Caderno de Erros). Não entra no F1.
- **Custo/un do F1:** +1 tipo de página no rodízio → impacto marginal; sinalizar ao `financial-modeler` (não bloqueia).

---

## T2 — Taxonomia de erro canônica `[decidido]`

**Conflito:** estudo/kit usam **K/M/R/S/T**; a spec do Caderno usava **Conceito·Interpretação·Aplicação·Desatenção·Pegadinha**.

**Decisão — espinha K/M/R/S/T (do estudo) + flag transversal de banca (do projeto):**

| Código | Causa | Absorve do projeto | Nota de evidência |
|---|---|---|---|
| **K** | **Conhecimento** — lacuna conceitual, não sabia | "Conceito/lacuna" | hipercorreção é mais forte em K confiante |
| **M** | **Método** — confundi institutos / abordagem errada (discriminação) | (novo; é o nó das pegadinhas) | intercalação discriminativa (Little 2025) |
| **R** | **Raciocínio do enunciado** — li/interpretei errado | "Interpretação do enunciado" | — |
| **S** | **Execução** — aplicação/cálculo/passo (exige dizer **onde** travou) | "Aplicação/cálculo" + "Desatenção" | — |
| **T** | **esTratégia** — tempo/ordem/chute/gestão de prova | (novo) | reps de qualidade > horas `[Raciocínio]` (extrapola Macnamara 2014) |
| **⚑ banca** | **flag transversal** (não é 6ª causa): "a questão tinha armadilha FGV/CEBRASPE" | "Pegadinha de banca" | preserva o diferencial concurso |

**Racional:**
1. A espinha **K/M/R/S/T** é codificada → permite a **estatística mensal** ("onde mais caio?"), alinhada ao 错题本. O projeto não tinha códigos.
2. **"Desatenção" deixa de ser categoria** — o estudo é enfático (`[Forte]`): "desatenção" é um **não-diagnóstico**. Seus casos vão para **S**, mas obrigando o aluno a dizer **onde** (ex.: "troquei sinal", "pulei a negativa do enunciado").
3. **"Pegadinha de banca"** vira **flag ⚑ ortogonal**, não causa — porque uma pegadinha *causa* erro M, R ou S. Cruzar a flag com a causa é exatamente o padrão de banca que interessa ao concurseiro BR.

**Migração:** `caderno-de-erros/spec.md §5` e `wireframe-ficha.md` **passam a adotar** K/M/R/S/T + ⚑ via `doc-updater` (ambos **ainda na taxonomia antiga** no estado atual — não tratar como feito). O kit-protótipo (K/M/R/S/T puro) fica como referência; se virar produto, regenera com a flag.

---

## T3 — Escala de confiança 1–5 (hipercorreção) `[decidido: incorporar]`

**Incorporar ao Caderno de Erros (F2).** Campo **"confiança no erro 1–5"** no cabeçalho da entrada.
- **Evidência:** erro cometido com **alta confiança** é o mais corrigível após feedback (Butterfield & Metcalfe 2001 `[Forte]`). → **prioridade de revisita = confiança alta.**
- **Complementa, não substitui, a triagem de entrada** existente (ponto-cego / armadilha / questão-modelo; descuido puro não entra):
  - **Triagem** = *porteiro* (decide **se** o erro entra).
  - **Confiança 1–5** = *priorizador* (decide **o que revisar primeiro** entre os que entraram).
  - Mantida a regra do kit: **erro que cai 2×+ = prioridade máxima.**
- **Design (2.0 PRO):** marcador de 5 traços `||||| ` com o nº circulável (círculo = único redondo permitido); tabular; cor quieta; sem `fill`.

---

## T4 — Ficha C · Integração (mapa conceitual) — spec da nova página v3 `[decidido]`

**Para que serve:** sair de "reconhecer" para "**relacionar e explicar**" — a transformação que constrói
entendimento. Construir o mapa (g≈0,72) supera olhar um pronto (0,43); **setas rotuladas** forçam nomear
a relação, não só os conceitos (Schroeder 2018 · Nesbit & Adesope 2006 `[Forte]`).
*(NB do VAP: Bisra 2018 = autoexplicação e Wammes = efeito-desenho — princípios afins, mas não sustentam
"mapa conceitual" diretamente; o `[Forte]` vem de Schroeder + Nesbit & Adesope.)*

**Cadência:** página **periódica** (como Ciclo/Sessão), usada ao integrar um **nó confundível**
(controle de constitucionalidade, espécies normativas, competências das Casas…). Posição no miolo:
**após a Semanal** (a Semanal já manda "construir um mapa de um nó confundível").

**Layout (estilo 2.0 PRO — `planner-designer`):**
- **Título de página** (não é a diária repetida → leva título cheio): **Lato Black 18pt `title-c`** + tab de acento 2pt + eyebrow `INTEGRAÇÃO · MAPA`.
- **Cabeçalho de modo** (1 linha): `▭ mapa de setas rotuladas  ▭ explicar (Feynman)  ▭ desenhar procedimento` — checkboxes **retos**; o aluno escolhe conforme o conteúdo.
- **Tópico** (linha INDIGO: coluna curta + divisória + pauta) · **Data** (à direita, `align: bottom`).
- **Canvas de construção:** área aberta grande com **dot-grid quietíssimo** (`grid-c` 0.3pt).
  - *Exceção justificada à regra "sem dot-grid substrato":* a skill abandonou o dot-grid nas **listas de escrita** (studyrows) porque chip/○ caíam entre os dots e duplicavam o time-log. Aqui o objeto é um **canvas livre de mapa/desenho** — os dots **auxiliam** o traçado (padrão JP/KR de página de desenho) e não competem com nenhuma grade. Tom no nível mais quieto da paleta.
- **Rodapé de evidência:** microcopy 6.5pt itálico `ink-3`: "construir > olhar pronto (g 0,72 vs 0,43); setas rotuladas nomeiam a relação. Schroeder 2018 · Nesbit & Adesope 2006."
- **Cor impressa:** **1 acento** (azul) só no tab + eventuais guias; as setas/caixas são **do aluno** (marca-texto) — a página impressa fica quieta (≠ exemplo preenchido do kit, que mostra a caligrafia em azul/vermelho).
- **Cantos retos**; figuras tabulares; sem fio 1pt; `fill:none`.

**Impacto:** v3 vai a **7 páginas** (Guia · Bússola · Ciclo · Sessão · Semanal · **Integração** · Pontes).

---

## T5 — Cadência de revisão `[decidido: papel = status; Anki/FSRS = tempo]`

**Conflito:** havia 3 escadas de intervalo divergentes nos docs (D+1/3/7/15/30 · D+3/14/30) **e** a decisão
"pré-imprimir 4–5 marcos" na `pesquisa-v3-sintese §1`. O estudo dá a resposta principista `[Forte/Raciocínio]`:
o intervalo ótimo **cresce com o horizonte da prova**, e o **FSRS/Anki agenda melhor que qualquer escada
fixa em papel**; não duplicar no papel o que o algoritmo faz melhor.

**Decisão única — eliminar as escadas fixas impressas:**
- **planner-v3 (F1):** **não** pré-imprimir marcos D+x de revisão de conteúdo. "Revisar" = **decisão do que vira card** (o Anki agenda). Corrige a linha "pré-imprimir 4–5 marcos" da `pesquisa-v3-sintese §1`. O princípio do espaçamento entra como **copy do Guia** ("revise espaçado — quem agenda é o Anki"), não como grade.
- **Caderno de Erros (F2):** a entrada rastreia **status**, não tempo: `refiz fechado · ✓ acertou · ▭ dominado` + `→ Anki ✓ (agendado)`. Substitui as escadas `D+1/7/15/30` e `D+3/14/30`. O **re-fazer de cabeça fechada** (discursiva/cálculo) é analógico por natureza; seu **disparo** ainda pode vir do Anki.
- **Net:** **papel = captura + decisão + status; Anki/FSRS = timing.** Uma posição canônica; zero escadas fixas impressas.

**Patches decorrentes (para `doc-updater`, após sua revisão):**
- `pesquisa-v3-sintese.md §1` — trocar "pré-imprimir 4–5 marcos de revisão" → "papel decide o que ankificar; Anki agenda" (citar este doc).
- `metodo-hub-analogico.md §6` e `caderno-de-erros/spec.md §3/§2` — remover escadas D+x; adotar status `refiz/acertou/dominado` + `→ Anki`.

---

## Síntese das decisões

| Tensão | Decisão | Onde aplica | Evidência |
|---|---|---|---|
| **T1** Arquitetura | Faseado; Ficha C entra na v3; Erro fica F2 | roadmap · v3 | — `[Daniel]` |
| **T2** Taxonomia | **K/M/R/S/T + flag ⚑banca**; "desatenção" deixa de ser categoria | Caderno F2 | Metcalfe; Little 2025 |
| **T3** Confiança | Incorporar **1–5** como priorizador (complementa triagem) | Caderno F2 | Butterfield & Metcalfe 2001 |
| **T4** Ficha C | Nova **página periódica** da v3 (mapa de setas rotuladas), 2.0 PRO | v3 (7 pp) | Schroeder 2018; Nesbit & Adesope 2006 |
| **T5** Cadência | **Papel = status; Anki/FSRS = tempo**; zero escada fixa impressa | v3 + Caderno F2 | Cepeda; Kim 2019 |

## Próximos passos (encadeamento) — sequência de remediação pós-VAP `[business-validator · 23/jun/2026: "precisa de correções"]`
Laudo completo: `research/validation/validation-2026-06-23-reconciliacao-asia.md`.

**GATE BLOQUEANTE de build (CRÍTICO #1):** `planner-v3/typst/guia.typ:104` ainda imprime a grade
`D+1·D+3·D+7·D+15·D+30` — contradiz o T5. **Remover antes de qualquer build** (substituir por copy
"revise espaçado — quem agenda é o Anki"); render → QA do PNG. Sem isso, NÃO acionar `typst-planner`.

1. ✅ Correções na própria reconciliação (VAP #3 citações · #4 ordem das páginas · #7 selo `[Raciocínio]` em T).
2. **doc-updater** (diff p/ revisão) — aplicar T2/T5 em `spec.md` · `wireframe-ficha.md` · `user-stories.md` ·
   `metodo-hub-analogico.md §6`; atualizar contagem **6→7 páginas** em `definicao-do-produto.md` + `roadmap-faseado.md`;
   notas em `analise-comparativa-indigo.md` + `personas-user-stories.md` (D+x revertido). *(Avisos de pendência já postos nos 3 specs principais.)*
3. **financial-modeler** — especificar **nº de cópias de Ficha C** no miolo (~112 pp) e obter o **delta de custo/un**
   (5 cópias ≈ +4,5%; 15 ≈ +13,4% — "~inalterado" só vale se poucas cópias). Atualizar a âncora "~112 pp". Encaixa na recalibração EVEF @ R$129.
4. **typst-planner** — só após o GATE acima e itens 1–2: implementar a **Ficha C** no estilo v3 → render → **QA do PNG** → `finalize.py`.
5. **conteudo-mayara** — usar os *effect sizes* do estudo como munição de copy ("papelaria que funciona — porque obriga a gerar").
</content>
</invoke>
