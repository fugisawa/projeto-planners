# Projeto Planners

Dossiê de uma micro-venture D2C: uma linha de **dois planners perpétuos premium** (cadernos-método,
sem datas) para nichos brasileiros de alto engajamento.

| Produto | O que é | Preço de lançamento |
|---|---|---|
| **Concurseiro** | sistema de estudo para concursos (não "agenda") | R$ 119 |
| **Treino de Força** | diário de periodização (não "caderno") | R$ 109 |

> ## ▶ Comece por aqui
> **`deliverables/guia-do-negocio.pdf`** — o plano todo em **português claro, sem "economês"**
> (com glossário de CAC, LTV, TAM/SAM/SOM, DAS, MEI…). É o melhor ponto de partida — basta abrir o PDF.

---

## 👋 Para a Mayara — como abrir tudo isso (passo a passo)

**Só quer LER os documentos?** Você não precisa de nada técnico: depois de baixar o projeto, é só
**abrir os PDFs** na pasta `deliverables/` (comece pelo `guia-do-negocio.pdf`). Pronto.

**Quer também CONVERSAR com a inteligência artificial sobre o projeto** (tirar dúvidas, pedir
mudanças, gerar coisas novas)? Aí siga os 3 passos abaixo para instalar o **Claude Code**.

### Passo 1 — Baixar o projeto (clonar)

A forma **mais fácil** (sem terminal) é o **GitHub Desktop**:
1. Baixe em **[desktop.github.com](https://desktop.github.com/)** e instale.
2. Abra, faça login no GitHub.
3. **File → Clone Repository →** cole: `https://github.com/fugisawa/projeto-planners`
4. Escolha uma pasta no seu computador e clique em **Clone**.

*(Alternativa rápida sem instalar nada: baixar o `.zip` em
`https://github.com/fugisawa/projeto-planners/archive/refs/heads/main.zip` e descompactar.)*

### Passo 2 — Instalar o Claude Code

> Precisa de uma **conta Claude paga** (plano **Pro**, ~US$ 20/mês — o grátis não inclui o Claude Code).

Abra o terminal do seu sistema e cole **um** comando:

- **Windows** — abra o **PowerShell** (menu Iniciar → "PowerShell") e cole:
  ```
  irm https://claude.ai/install.ps1 | iex
  ```
- **Mac** — abra o **Terminal** (Cmd+Espaço → "Terminal") e cole:
  ```
  curl -fsSL https://claude.ai/install.sh | bash
  ```

Para conferir se deu certo, digite `claude --version` (deve aparecer um número de versão).

### Passo 3 — Abrir o Claude Code dentro do projeto

1. Abra o terminal **na pasta do projeto**:
   - **GitHub Desktop:** menu **Repository → Open in Terminal** (abre já na pasta certa).
   - Ou manualmente: `cd caminho/da/pasta/projeto-planners`
2. Digite:
   ```
   claude
   ```
3. Na **primeira vez**, ele abre o navegador para você fazer login na sua conta Claude. Depois disso,
   é só usar.
4. Agora é só **conversar em português**. Experimente:
   > *o que esse projeto faz?* · *me explique o guia do negócio* · *quais são os próximos passos?*

O Claude lê os arquivos da pasta sozinho e **sempre pede sua confirmação antes de mudar qualquer coisa**.
Para sair: `/exit`.

### Passo 4 — Deixe o Claude instalar as dependências (só na 1ª vez)

Você **não precisa instalar Python nem nada à mão**. Na primeira vez, peça ao seu Claude:

> *"Instale tudo o que este projeto precisa para rodar no meu computador — não sei programar."*

Ele detecta o seu sistema e instala o **`uv`** (que cuida de Python e das bibliotecas sozinho) e o
**Node.js**, pedindo sua permissão antes de cada passo. Detalhes em **`docs/claude-setup.md`**.
*(Só para **ler** os PDFs em `deliverables/`, nada disso é preciso.)*

> 💡 **Para o Claude render bem (como o do Daniel):** veja **`docs/claude-setup.md`** — explica os
> agentes e configurações que já vêm no projeto, quais skills/MCPs ativar, e os hábitos de uso que
> fazem diferença (effort, `ultrathink`, delegar a agentes, `/compact`).

---

## Quem somos (e quem faz o quê)

Sociedade entre dois irmãos, com forças **complementares**:

- **Daniel** — economista e oficial de inteligência → **estratégia, finanças, pesquisa, fornecedor
  e operação** (a máquina por trás).
- **Mayara** — criadora de conteúdo (contas de **milhões de visualizações no TikTok**) → **redes
  sociais, conteúdo e marca**, o **motor de aquisição** do negócio.

Isso resolve o maior risco de um D2C: *construir audiência*. A habilidade que faz conteúdo
performar já está dentro de casa.

## A ideia central

- **Negócio recorrente:** o planner de estudo "enche" em ~3 meses → o cliente recompra **3–4×/ano**
  (LTV ~R$ 374–397 por cliente). A **retenção** é o motor.
- **Vender direto** (Instagram/site + pix): preserva ~50% de margem; marketplace destrói.
- **Aquisição orgânica primeiro** (o forte da casa).
- **Crescimento 100% autofinanciado:** sem empréstimo, sem aporte que descapitalize.

## Estrutura do projeto

```
projeto-planners/
├── README.md                     ← você está aqui
├── CLAUDE.md                     instruções para a IA (Claude Code)
├── .mcp.json                     MCP servers do projeto (sequential-thinking, memory)
├── deliverables/                 documentos finais (.pdf) + fontes (.md)
│   ├── guia-do-negocio.pdf       ← COMECE AQUI (linguagem simples)
│   ├── business-plan-planners.pdf
│   ├── estudo-de-mercado.pdf
│   ├── estudo-viabilidade-economica.pdf
│   ├── plano-estrategico.pdf
│   ├── plano-de-gestao.pdf
│   ├── consultoria-sourcing-planners.pdf
│   ├── acordo-de-socios-minuta.pdf
│   ├── ip-marca-inpi.pdf
│   └── lgpd-privacidade-termos.pdf
├── models/                       planilhas
│   ├── viabilidade-planners-v2.xlsx   (modelo financeiro, 10 abas)
│   └── painel-kpis.xlsx               (rastreador mensal de metas)
├── research/                     pesquisa de mercado (evidence/) + laudos (validation/)
├── docs/                         metodologia, premissas e claude-setup.md (config da IA)
├── sources/                      rascunhos originais (o "antes", preservado)
├── scripts/                      ferramentas que geram o modelo e os PDFs (uso do autor)
└── .claude/                      config da IA: agents/ (agentes) + settings.json
```

## Índice dos documentos

| Documento | Para quê |
|---|---|
| **guia-do-negocio** | visão geral em linguagem simples (comece aqui) |
| **business-plan-planners** | plano de negócio completo |
| **estudo-de-mercado** | tamanho do mercado, personas, concorrência, recorrência/LTV |
| **estudo-viabilidade-economica** | os números: VPL, TIR, payback, fluxo de caixa (5 anos) |
| **plano-estrategico** | vantagem competitiva, cenários, Business Model Canvas |
| **plano-de-gestao** | cronograma, papéis (RACI), metas (OKRs), riscos, decisões |
| **consultoria-sourcing-planners** | onde produzir (gráfica BR × China), custos, impostos |
| **acordo-de-socios-minuta** | minuta de sociedade (revisar com advogado) |
| **ip-marca-inpi** | como registrar a marca |
| **lgpd-privacidade-termos** | textos legais do site (privacidade e termos) |

> Material de apoio à decisão dos sócios. Custos de produção a confirmar por orçamento de gráfica;
> tributos por contador; minuta de acordo de sócios por advogado. Não constitui recomendação financeira.
