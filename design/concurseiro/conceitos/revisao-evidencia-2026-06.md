# Revisão à luz da evidência — o que o "Kit analógico / Estudo de papelaria" obriga a rever

> **Ata de decisão · 23/jun/2026.** Saída da análise dos dois artefatos recebidos
> (`~/Downloads/estudo-papelaria-analogica-concursos.md` e `kit-analogico-estudo-completo.pdf`,
> jun/2026), cruzada com o dossiê do projeto e com **verificação científica independente** das
> claims que contradizem o que o projeto afirma hoje. Idioma: pt-BR. **Status: martelo batido
> (Daniel + Mayara · 23/jun/2026) — todas as recomendações aceitas (§6) e #1–#5 EXECUTADAS.
> Validado pelo business-validator (`research/validation/validation-2026-06-23.md`): veredito
> PRONTO após correções.**

## Como ler
Selos de confiança, herdados do estudo: **[Forte]** (meta-análise/replicações convergem) ·
**[Moderada]** (sólida, com heterogeneidade) · **[Indício]** (emergente/contestada) ·
**[Raciocínio]** (inferência transparente, não testada). Tamanhos de efeito: *g*/*d* (≈0,2 pequeno;
≈0,5 médio; ≈0,8 grande).

---

## 1. Validação dos artefatos

**Estudo (`.md`) — confiável, com uma ressalva estrutural.** Rigoroso, auto-cético, bem
referenciado. As 3 claims-pivô que **contradizem** o projeto foram reverificadas de forma
independente (academic-researcher · 23/jun/2026):

| Claim do estudo | Veredito independente | Tamanho de efeito |
|---|---|---|
| Escrever à mão **não** memoriza muito mais | **Confirmado** — Mueller&Oppenheimer (2014) não replicou (Morehead 2019; Urry 2021); o EEG de Van der Meer 2024 **não mediu aprendizagem** (crítica Pinet&Longcamp 2025) | *g* ≈ 0,14–0,25; **some sem revisão** (meta-análise Flanigan 2024) |
| Horas brutas explicam pouco | **Confirmado [Forte]** — Macnamara 2014 (88 estudos) | *R²* ≈ 4–5% (educação) |
| Hipercorreção + re-teste bloqueia o erro | **Confirmado [Forte]** — o efeito mais sólido dos três (Butterfield&Metcalfe 2001; Metcalfe 2014) | robusto; sem re-teste o erro volta (Butler 2011) |

> **Ressalva única:** quase toda a literatura mede estudantes em tarefas curtas, **não adultos em
> preparação intensiva**. As *direções* dos efeitos transferem; as *magnitudes*, não. Usar como
> direção, não como promessa. `[Raciocínio]`

**Kit (`.pdf`) — excelente como conteúdo e protótipo; a *forma* não se importa cega.** A tradução
dos mecanismos em 4 fichas (A·recordação livre · B·registro de erro 错题本 · C·mapa de setas ·
D·condução) e os exemplos preenchidos (controle de constitucionalidade) são prova de conceito
forte. Mas 3 escolhas de design **conflitam com decisões já validadas da v3** e não devem ser
importadas sem filtro: **dot-grid** (abandonado na v3 para listas — só vale em área de geração
livre/mapa); **3 cores** preto/azul/vermelho (no kit é a convenção do 错题本 = camadas de raciocínio;
na v3 a cor = matéria do aluno — só coexistem se separadas por artefato); **A4 imprimível** (vs. o
A5 wire-o premium do produto).

---

## 2. O que se CONFIRMA (não mexer — o núcleo resiste)
- **Hub analógico / divisão papel-digital** → [Forte]: papel captura+transforma; Anki/FSRS agenda.
  (`metodo-hub-analogico.md:47`, `direcao-de-design-concurseiro.md`)
- **Caderno de erros como feature-âncora** → confirmado e reforçado (hipercorreção é o efeito mais
  sólido). O projeto **já** adota a convenção de 3 cores (`caderno-de-erros/spec.md:14`).
- **Intenção pré-sessão se-então** → [Forte] (`pesquisa-v3-sintese.md:49`).
- **Estética sóbria anti-studygram** → [Indício] (`metodo-hub-analogico.md:121`).

---

## 3. O que OBRIGA a rever (dos estudos ao design)

### Camada A — Correção factual (URGENTE · risco reputacional)
O dossiê usa **"escrever à mão → memoriza mais"** como pilar científico — e **não se sustenta**.

| Arquivo:linha | Texto atual | Correção |
|---|---|---|
| `metodo-hub-analogico.md:23` | "Síntese à mão (**escrever = memorizar**)" | "Síntese à mão (**gerar/transformar = aprender**)" |
| `metodo-hub-analogico.md:37–39` | "Escrever à mão ativa mais o cérebro… +ativação do hipocampo" (apoiado em EEG que não mediu memória) | remover o argumento de **memória**; manter conectividade neural + **afeto/foco/adesão** |
| `metodo-hub-analogico.md:56` | "Síntese à mão… (**handwriting → retenção**)" | "(**handwriting → elaboração/foco**)" |
| `definicao-do-produto.md:32` | "fixação (**handwriting→memória**)" | "processamento (**gerar → aprender**)" |

**Formulação correta** (não jogar o papel fora): *o ganho de memória da caligrafia por si é pequeno
e condicional; o valor do papel é **foco sem tela + geração/elaboração + adesão pelo afeto**.*
`[Moderada]`

### Camada B — Método/conteúdo (inconsistências internas + lacunas)
1. **Ciclo de revisão divergente em 3 documentos** (iria à gráfica com 3 versões):
   `metodo-hub-analogico.md:80` = **D+3/D+14/D+30** · `caderno-de-erros/spec.md:30` =
   **D+1/D+7/D+15/D+30** · `guia.typ:104` = **D+1/D+3/D+7/D+15/D+30**. → Escolher **um**
   (recomendo **D+3 · D+7 · D+15**, alinhado ao 错题本 canônico e ao estudo) e propagar.
2. **Contradição com a própria fronteira digital:** `caderno-de-erros/spec.md:30` imprime
   checkboxes `D+1 □ D+7 □ D+15 □ D+30 □` — uma **caixa de Leitner manual**, justo o que o projeto
   diz delegar ao Anki (`metodo-hub-analogico.md:47`). → Trocar por `→ card no Anki ☐`.
3. **Taxonomia de erro** (`caderno-de-erros/spec.md:36`): falta o tipo **T (estratégia/tempo)** —
   relevante p/ FGV/CEBRASPE. Reconciliar com K/M/R/S/T do estudo (mantendo "pegadinha de banca"
   como adaptação BR). Conferir também o mapeamento de cor (projeto: preto=enunciado; 错题本
   canônico: preto=pergunta).
4. **Campo "confiança no erro (1–5)" AUSENTE** — é o gatilho da **hipercorreção** (priorizar o erro
   confiante). Nenhuma ficha tem hoje. `[Forte]`
5. **"se-então" sem antecipação do obstáculo** ("se abrir Instagram → então…") — componente que
   maximiza o *d* ≈ 0,65. `[Forte]`
6. **Intercalação sem a nuance "bloco primeiro":** `pesquisa-v3-sintese.md:32` diz "nunca 1
   matéria/dia" — perigoso para tema novo (bloco p/ aprender; intercalar p/ discriminar). `[Moderada]`

### Camada C — Planejamento / produto / roadmap
O sistema fiel à evidência tem **4 mecanismos generativos**; o projeto só instrumenta 2 bem
(condução/D e erro/B). **Lacunas de produto:**

| Lacuna | Evidência | Onde encaixar |
|---|---|---|
| **Recordação livre (A)** — "escreva de memória antes de abrir" | [Forte] | instrução no Guia + gatilho no "fechar o dia" da Sessão |
| **Mapa conceitual de setas (C)** — *construído* pelo aluno | **g ≈ 0,72** (o maior efeito) | Guia (F1) + páginas do Caderno de Síntese (F2) |
| **Confiança no erro (1–5)** | [Forte] | cabeçalho da ficha de erro |

**Recalibração de métrica:** tempo deixa de ser "núcleo emocional / post de studygram"
(`wireframes-planner-v1.md:83`) e passa a ser **calibração honesta** (planejado vs. real); o peso
vai para **reps de qualidade** (questões sob tempo + erros logados e re-testados). Valida o ajuste
já feito na Sessão v3 (`fiz/corr.`) e pede para ir além.

### Camada D — Design dos artefatos (v3)
- **Reposicionar o time-log:** mesma instrumentação, narrativa de **calibração**; questões/erros
  com peso visual igual ao tempo (não rodapé).
- **Adicionar confiança-no-erro** no Caderno de Erros; **mapa de setas** como módulo.
- **Dot-grid:** só em área de **geração livre** (recordação livre, mapa) — nunca em lista (regra v3
  segue válida).
- **3 cores:** só no Caderno de Erros (F2); o Planner (F1) mantém **cor = matéria**.
- **Go-to-market:** o próprio kit A4 imprimível é um **lead magnet** natural (amostra grátis que
  aquece para o A5 premium) — conecta ao motor de aquisição da Mayara.

---

## 4. Decisão estratégica de fundo
O eixo conceitual mais fiel à evidência desloca-se de **"planner = auditoria de tempo/agenda"**
para **"sistema de geração"** (capturar → transformar → recuperar → conduzir). Não é fatal nem
destrói o existente — é **recalibração de ênfase**: o planner segue como hub de condução, mas dá
mais palco aos mecanismos generativos (recordação livre, mapa, erro-com-confiança) e trata o tempo
como **calibração**, não como troféu. Afeta posicionamento, roadmap (F1/F2) e design.

---

## 5. Plano priorizado
1. ~~**Correção factual** (handwriting) — Camada A~~ ✅ **FEITO 23/jun/2026** (Daniel aprovou): 5
   trechos em `metodo-hub-analogico.md` (23, 37–39, 56), `definicao-do-produto.md:32` e
   `personas-user-stories.md:45`. Claim de caligrafia→memória rebaixado; pilar passa a ser o
   **efeito de geração**; afeto/foco/adesão mantidos como munição. Grep confirma 0 resíduos.
2. ✅ **FEITO** — ciclo D+ → **D+3/D+7/D+15**; checkboxes manuais → `→ card no Anki` (D1).
   Propagado: `metodo-hub`, `caderno-de-erros/spec.md`+`wireframe-ficha.md`+`user-stories.md`,
   `guia.typ`, `pesquisa-v3-sintese`, `analise-comparativa-indigo`.
3. ✅ **FEITO** — Caderno de Erros: **confiança-no-erro (1–5)** (D3) + taxonomia **K/M/R/S/T** (D2)
   + **refiz fechado** (re-teste); cor canônica **preto=pergunta · azul=solução · vermelho=causa**.
4. ✅ **FEITO** — Sessão v3: **recordação livre** no "fechar o dia" (D4) + **se→então com obstáculo**
   (D6) — renderizado + QA visual do PNG.
5. ✅ **FEITO** — **A (recordação)** e **C (mapa de setas)** no Guia F1 (`guia.typ`) e registrados p/
   Caderno de Síntese F2 (D4, D5); eixo **tempo→calibração** (D7); **kit A4 como lead magnet** no
   roadmap (D8). *(Design físico das páginas F2 = backlog da Fase 2.)*

---

## 6. Decisões batidas — Daniel + Mayara · 23/jun/2026
Todas as recomendações da análise foram **aceitas**. Registro nominal:

| # | Decisão | Martelo |
|---|---|---|
| D0 | Correção factual do claim de handwriting | ✅ aprovada **e já aplicada** (§5.1) |
| **D1** | Ciclo de revisão único = **D+3 · D+7 · D+15**; checkboxes manuais → `→ card no Anki ☐` (papel não agenda) | ✅ |
| **D2** | Taxonomia **K/M/R/S/T** (acrescenta T = estratégia/tempo) + "pegadinha de banca"; cor canônica **preto=pergunta · azul=solução · vermelho=causa** | ✅ |
| **D3** | Campo **confiança no erro (1–5)** na ficha (gatilho da hipercorreção) | ✅ |
| **D4** | **Recordação livre (A)** — gatilho leve no "fechar o dia" da Sessão (F1) + páginas no Caderno de Síntese (F2) | ✅ |
| **D5** | **Mapa de setas (C, g≈0,72)** — instrução no Guia (F1) **e** páginas no Caderno de Síntese (F2) | ✅ |
| **D6** | **se→então com antecipação de obstáculo** (`se ___ → então ___`) na Sessão | ✅ |
| **D7** | **Reposicionar o eixo**: tempo = calibração (não troféu); questões/erros com **peso visual igual** ao time-log (mantém a pintura de tempo) | ✅ |
| **D8** | **Kit A4 como lead magnet, agora** (isca grátis → lista → A5 premium) — Mayara/aquisição | ✅ |

> Próximo: executar #2–#5 (§5) na ordem, propagar com `doc-updater` e validar com `business-validator`
> antes de dar por pronto. Mudanças de design (Sessão/ficha) passam por QA visual do PNG.

---

## Referências verificadas (23/jun/2026)
- Flanigan et al. (2024), *Educational Psychology Review* — meta-análise manuscrito×digitado
  (g≈0,248; some sem revisão).
- Morehead, Dunlosky & Rawson (2019) — replicação de Mueller&Oppenheimer (2014): não significativo.
- Van der Meer & Van der Weel (2024) + **comentário Pinet&Longcamp (2025)**: EEG não mediu memória.
- Macnamara, Hambrick & Oswald (2014), *Psychological Science* — prática deliberada ~4–5% (educação).
- Butterfield & Metcalfe (2001); Metcalfe (2014); Butler, Fazio & Marsh (2011) — hipercorreção + re-teste.
- Estudo-base completo: `~/Downloads/estudo-papelaria-analogica-concursos.md` (referências §8).
