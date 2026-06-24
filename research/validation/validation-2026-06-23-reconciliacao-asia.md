# Laudo VAP — reconciliação estudo-asia × specs v3/Caderno (23/jun/2026)

**Agente:** `business-validator` (read-only) · **Método:** Workflow VAP · **Alvo:** `conceitos/reconciliacao-estudo-asia.md`
+ incorporação de `research/evidence/aprendizagem-papelaria-asia.md` + ponteiros nos specs.
**Veredito:** ⚠ **precisa de correções** (0 CRÍTICO financeiro; 1 CRÍTICO de produto + 4 ALTO). Sem divergência de fatos-âncora.

## Achados e tratamento

| # | Sev | Achado | Tratamento (23/jun) |
|---|---|---|---|
| 1 | 🔴 CRÍTICO | `planner-v3/typst/guia.typ:104` ainda imprime grade `D+1/3/7/15/30` (contradiz T5) | **Registrado como GATE bloqueante de build** na reconciliação; remoção fica para `typst-planner` (Fase 3, com render+QA). NÃO buildar antes. |
| 2 | 🟠 ALTO | `wireframe-ficha.md` ainda na taxonomia antiga (reconciliação dizia "adota") | ✅ Redação corrigida ("passa a adotar via doc-updater") + **aviso de pendência** posto no wireframe. |
| 3 | 🟠 ALTO | T4 inflou `[Forte]` com Bisra 2018 (autoexplicação) e Wammes (desenho) | ✅ Trocado por **Schroeder 2018 · Nesbit & Adesope 2006** (2 ocorrências + tabela-síntese). |
| 4 | 🟠 ALTO | Ordem das 7 páginas contraditória (Integração antes/depois da Semanal) | ✅ Fixado: **… Sessão · Semanal · Integração · Pontes**. |
| 5 | 🟠 ALTO | `user-stories.md` e `metodo-hub §6` com D+x sem aviso | ✅ **Avisos de pendência** postos nos dois. |
| 6 | 🟡 MÉDIO | "Custo/un ~inalterado" sem cálculo (nº de cópias de Ficha C indefinido) | Encaminhado ao `financial-modeler` na sequência (5 cópias ≈ +4,5%; 15 ≈ +13,4%). |
| 7 | 🟡 MÉDIO | Macnamara 2014 como evidência da categoria T | ✅ Reetiquetado **`[Raciocínio]`**. |
| 8 | 🟡 MÉDIO | `definicao-do-produto` + `roadmap-faseado` ainda dizem "6 páginas" | Pendente `doc-updater` (6→7). |
| 9 | 🟡 MÉDIO | Proveniência do estudo sem autor (estilo IA+Consensus) | Cabeçalho de proveniência registra "inbox jun/2026"; refs primárias são reais/verificáveis. Tratar como **síntese fundamentada**, não autoridade externa. |
| 10–12 | ⚪ BAIXO | `analise-comparativa-indigo`, `personas-user-stories`, Yildirim 2026 | Pendente `doc-updater` (notas D+x revertido) + conferir data Yildirim antes de copy. |

## Pendências para liberar execução
- **doc-updater** (diff p/ revisão): propagar T2/T5 + contagem 6→7 nos docs normativos.
- **financial-modeler:** delta de custo/un com Ficha C; atualizar âncora "~112 pp".
- **typst-planner:** só após o GATE do guia.typ (#1) e os patches.

*Correções #2–#5 e #7 aplicadas na reconciliação em 23/jun/2026. Reexecução do VAP recomendada após o `doc-updater`.*
