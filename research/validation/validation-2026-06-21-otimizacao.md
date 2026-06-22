# Laudo — otimização do dossiê + ativação da arquitetura (21/jun/2026)

**Data:** 21/jun/2026 · **Método:** `/ultraplan` (sequential-thinking) + auto-orquestração de 4 agentes
em paralelo (business-validator + 2 leitores de deliverables + coerência design↔dossiê) + auditoria de
config + **VAP** (business-validator pós-edição). Complementa `validation-2026-06-21.md`.
**Veredito:** ✅ **fontes corrigidas e consistentes**; 2 pendências externas conhecidas (abaixo).

## 1. Diagnóstico (o que estava quebrado)
O dossiê estava consistente nas **âncoras numéricas** (zero drift dos commits v2/v3), mas havia ~36
problemas de **qualidade/coerência/risco-de-publicação** fixáveis sem dado externo, + **arquitetura
parcialmente não-ativada**.

## 2. Fase 1 — Arquitetura ativada/conectada
- **MCPs:** documentado em `docs/claude-setup.md` + `CLAUDE.md` que `exa`/`tavily`/`context7` estão no
  escopo do usuário (`~/.claude.json`) e são ferramenta-padrão. **Chaves de API NÃO entram no `.mcp.json`
  versionado** (segurança). `.mcp.json` mantém sequential-thinking+memory.
- **Hook Stop** (`.claude/settings.json`): lembra rodar o `business-validator` quando `deliverables/`/`models/`
  têm mudança pendente (Workflow VAP). JSON validado.
- **CLAUDE.md:** tabela de agentes com **encadeamentos**; **comandos de build da v3**; diretriz "usar
  sequential-thinking/exa/tavily + pipeline de design por padrão"; status do **design candidato = v3**.
- **Índice de design:** `design/README.md` atualizado (v1 referência / v2 preterida / **v3 candidato**) +
  novo `design/concurseiro/README.md` (navegação das 3 versões). `roadmap-faseado` gate 2 marcado;
  `definicao-do-produto` §8 (6 páginas reais da v3); banner de status em `planner-v1/README.md`.

## 3. Fase 2 — Correções de qualidade nos deliverables (~36)
Sem inventar número; valores a recalcular ficam marcados `[DESATUALIZADO]`/`[a recalcular]`.

| Sev | Arquivo | Correção |
|---|---|---|
| 🔴 | lgpd-privacidade-termos | tag interna `[decisão…Daniel]` **removida do texto publicável**; cláusula 6 reescrita "Disponibilidade e envio" (sem menção a pré-venda) |
| 🔴 | guia-do-negocio | "Começamos como MEI" → **ME/Ltda** (2 sócios não cabem em MEI); DAS reescrito p/ Simples; "2 SKUs" → "1 SKU em linha (F1)"; "(canal direto)" no custo |
| 🔴 | estudo-de-mercado | §10 conclusão → **sequencial**; §4.5 tabela LTV com banner `[DESATUALIZADO @R$129]`; banner do topo sem VPL/TIR (que não existem no doc); ticket §1 desambiguado F1/F2 |
| 🟠 | plano-de-gestao | RACI **nomeia S1=Daniel/S2=Mayara** + Operação/Fornecedor realinhados a Daniel; **Gate A unificado** (lista+engajamento+3 orçamentos+golden sample); risk register R2/R8 → Daniel; R7 "Teto MEI" → ME/Simples |
| 🟠 | business-plan | Gate A unificado; Concurseiro sem "edital verticalizado/revisão espaçada embutida" → "decisão de revisão (Anki executa)"; data eleição → ~25/jan/2027; custo teto + opção 2/2 |
| 🟠 | estudo-viabilidade | pré-venda removida como alavanca de giro; tributos MEI marcado `[a revisar — 2 sócios]`; trajetória 2 SKUs `[DESATUALIZADO F1=1 SKU]`; **VPL/TIR §1 com nota inline** |
| 🟠 | acordo-de-socios | split 2.1 → "[a definir — proposta 50/50]" (sem ambiguidade); vesting sem "para irmãos" |
| 🟠 | ip-marca-inpi | Classe 35 → **"Essencial para D2C"**; urgência: depositar nome **antes** de divulgar |
| 🟡 | consultoria-sourcing | pré-venda residual → "sem pré-venda"; China "≥3.000"→"~3.000–5.000" (2 ocorrências); ICMS-DF "conferir alíquota"; ficha §3.1 sem "edital verticalizado"; B2B caveat (estratégico) |

**VAP (business-validator pós-edição):** confirmou Gate A idêntico, nenhum número inventado, tags internas
fora do publicável. Pegou **3 resíduos** das minhas edições (EVEF §1 sem nota inline; ficha sourcing com
"edital verticalizado"; R2/R8 com dono desalinhado da RACI) — **todos corrigidos** nesta mesma rodada.

## 4. Pendências (externas — não fabricar)
1. **Regenerar os PDFs** dos deliverables editados: as **fontes** `.md`/`.html` estão corrigidas, mas os
   `.pdf` derivados estão **desatualizados**. A regeneração exige a skill **`briefing-designer`** (não
   instalada nesta máquina) — rodar `scripts/build_pdfs.py` + `build_legal.py` + render quando disponível.
2. **Rebuild financeiro pós-cotação** (Gate A = 3 orçamentos reais): pipeline `financial-modeler →
   business-validator → doc-updater`. Inalterado; segue gated.

## 5. Decisão pendente do Daniel
**v1 × v3 para produção/RFQ** — mantidas ambas com status claro (v1 = referência de estilos; v3 = candidato).
