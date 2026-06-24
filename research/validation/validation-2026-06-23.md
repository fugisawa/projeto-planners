# Laudo de validação — revisão por evidência (D0–D8) · 23/jun/2026

> **business-validator** (read-only, adversarial) sobre as mudanças decorrentes de
> `design/concurseiro/conceitos/revisao-evidencia-2026-06.md`. Veredito inicial: **precisa de
> correções** (3 ALTO, alguns MÉDIO/BAIXO; **0 CRÍTICO**; sem dano às âncoras de negócio).
> **Após correções (abaixo): pronto.**

## Escopo verificado
Consistência cruzada de: ciclo de revisão (D+3/D+7/D+15), claim de handwriting rebaixado,
taxonomia K/M/R/S/T + cor canônica, fronteira papel/digital (Anki agenda), fidelidade à evidência
(ressalva de transferência lab→concurso), e ausência de dano às âncoras financeiras.

## Achados e tratamento

| Sev. | Achado | Arquivo | Tratamento |
|---|---|---|---|
| ALTO | Ritmo `D+3/14/30` residual (regex sem "+" escapou da 1ª varredura) | `personas-user-stories.md:37` | ✅ → `D+3/D+7/D+15 (no Anki)` |
| ALTO | "escrever à mão para memorizar" sem ressalva | `uso-concurseiro-br-stack-digital.md:216` | ✅ ressalva de geração/elaboração |
| ALTO | "Consolida a memória" sem qualificação | `uso-concurseiro-br-stack-digital.md:230` | ✅ "ajuda a processar (geração, não caligrafia)" |
| MÉDIO | "o analógico processa e retém" | `uso-asia-china-coreia.md:201` | ✅ "processa e registra" + ressalva |
| MÉDIO | Van der Meer §3.1 sem ressalva inline | `uso-papelaria-ocidente.md:98` | ✅ ressalva inline (conectividade ≠ retenção) |
| MÉDIO | D5 (mapa de setas) aprovado mas ausente no `guia.typ` | `planner-v3/typst/guia.typ` | ✅ seção "Síntese: mapa de setas" + recordação livre (render + QA) |
| MÉDIO | g≈0,72 sem ressalva de transferência nos docs de produto | `definicao-do-produto.md:32`, `roadmap-faseado.md` | ✅ "(lab — direção, não magnitude)" |
| BAIXO | "p/ fixar" em user story | `personas-user-stories.md:41` | ✅ "p/ processar e entender" |
| N/A | Âncoras de negócio (preço/custo/mix/NCM) | — | ✅ **nenhum dano colateral** (confirmado) |

## Re-verificação (grep, pós-correção)
- Ciclo divergente vivo (D+14/D+30/`/14/`): **0** (benchmarks de terceiros mantidos — factuais).
- Claim memória sem ressalva: **0** (resta só citação descritiva de protocolo coreano, neutra).
- Mapa de setas no `guia.typ`: presente (D5-F1 executado).

## Veredito final: **PRONTO**
Mudanças D0–D8 consistentes e fiéis à evidência; fronteira papel/digital coerente; âncoras de
negócio intactas. Gates de produção que permanecem (independentes desta revisão): teste de
impressão do v3 · decisão v1×v3 para RFQ · sourcing/custo do Caderno standalone (F2).
