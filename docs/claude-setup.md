# Configuração do Claude Code — para render como o do Daniel

Guia para o Claude Code da **Mayara** (ou de qualquer pessoa que abrir este projeto) ter o mesmo
bom desempenho do setup original. Boa parte já **vem no repositório e funciona sozinha**; o resto
são ativações na conta + alguns hábitos de uso.

> Pré-requisito: ter o **Claude Code instalado** e uma **conta paga (Pro/Max)** — ver o passo a passo
> no `README.md` (seção "Para a Mayara").

---

## 🔧 Instalar as dependências — o seu Claude baixa tudo (no SEU computador)

> Para a **Mayara**: você **não precisa saber programar nem instalar nada à mão** — o seu próprio
> Claude faz. Tudo é instalado **só no seu computador** (não afeta a máquina do Daniel).

Depois de instalar o Claude Code e abrir o projeto com `claude`, **cole este pedido**:

```
Quero rodar este projeto no meu computador e não sei programar. Detecte meu sistema operacional e
instale o que for necessário para os scripts funcionarem:
1) o "uv" (gerenciador que cuida do Python e das bibliotecas automaticamente);
2) o Node.js (para os MCPs do .mcp.json).
Rode os instaladores certos para o meu sistema, peça minha permissão antes de cada comando, e no
fim confirme com "uv --version" e "node --version".
```

O Claude roda os instaladores certos e **pede sua confirmação antes de cada passo** — é só aprovar.

**O que ele instala (e por quê):**
- **`uv`** — a peça principal. Os scripts rodam com `uv run --with <biblioteca>`, e o uv **baixa o
  Python e cada biblioteca (openpyxl, matplotlib, weasyprint…) sozinho, na hora**. Você nunca
  instala pacote à mão.
- **Node.js** *(opcional)* — só para os 2 MCPs do projeto (`sequential-thinking`, `memory`). Sem
  ele, todo o resto funciona normalmente.

**Comando manual do `uv`** (caso prefira, ou se o Claude pedir):
- **Windows (PowerShell):** `powershell -c "irm https://astral.sh/uv/install.ps1 | iex"`
- **Mac:** `curl -LsSf https://astral.sh/uv/install.sh | sh`
- **Node.js:** instalador **LTS** em `nodejs.org` (Next, Next… padrão).

> **Só para LER os documentos, nada disso é necessário** — abra os PDFs em `deliverables/`. O
> `uv`/Node só importam se você quiser que o Claude **gere ou atualize** planilhas/documentos.
> *(Regenerar os PDFs do zero usa a skill personalizada `briefing-designer`, do Daniel, que o seu
> Claude não baixa sozinho — peça a ele se precisar. Ler os PDFs prontos não exige isso.)*

---

## 1. O que JÁ vem no repositório (funciona ao abrir o projeto)

Ao rodar `claude` dentro da pasta do projeto, isto já está ativo automaticamente:

- **`CLAUDE.md`** — o contexto e as convenções do projeto. O Claude lê sozinho e passa a "conhecer"
  o negócio (fatos-âncora, regras, onde está cada coisa). **É a maior alavanca de desempenho.**
- **`.claude/agents/`** — 5 **agentes especialistas** do projeto (rodam quando a tarefa pede, ou se
  você citar o nome):

  | Agente | Para que serve |
  |---|---|
  | `market-researcher` | dimensionar mercado, concorrência, demanda |
  | `pricing-strategist` | preço e posicionamento |
  | `sourcing-analyst` | fornecedor (gráfica/China), custos, impostos |
  | `financial-modeler` | margens, viabilidade, planilha |
  | `business-validator` | revisar/criticar um material antes de "fechar" |

- **`.claude/settings.json`** — liga o **raciocínio alto** (`effort high`), roda **subagentes no modelo
  econômico** (Sonnet) e pré-aprova alguns comandos seguros (menos confirmações).
- **`.mcp.json`** — dois "plugins" (MCP) úteis: **sequential-thinking** (raciocínio passo a passo) e
  **memory** (memória entre sessões). Na 1ª vez, o Claude pede para **autorizar** — é só aceitar.
  (Precisam de Node.js; se não tiver, ignore — o resto funciona.)

## 2. O que ATIVAR na conta (não vem no repo)

### Skills (habilidades extras)
As skills ficam na **sua conta** (globais), não no projeto. As mais úteis aqui:

| Skill | Para que serve |
|---|---|
| `deep-research` | pesquisa de mercado a fundo (Exa/Tavily) |
| `data-analyst` / `senior-data-scientist` | analisar dados, gráficos, estatística |
| `briefing-designer` | gerar **PDFs profissionais** (foi o que criou os documentos daqui) |
| `xlsx` / `docx` / `pptx` | criar/editar planilhas, Word, apresentações |
| `seo-optimizer` / `repercussao-midiatica` | conteúdo, SEO, análise de repercussão (úteis p/ a Mayara) |
| `anki-concursos` / `discursivas-concursos` | conteúdo de estudo (útil p/ o **produto** Concurseiro) |

**Como obter:** skills públicas entram por *marketplace de plugins* (digite `/plugin` no Claude Code).
As **personalizadas** (ex.: `briefing-designer`, `deep-research`) são do Daniel — ele pode copiá-las
para `~/.claude/skills/` da Mayara, ou para a pasta `.claude/skills/` do projeto. *(Sem elas, os
agentes ainda funcionam: caem para a busca web normal.)*

### MCPs de pesquisa (via claude.ai)
Para pesquisa de mercado forte, conecte na conta (claude.ai → **Settings → Connectors**):
**Exa** e **Tavily** (busca na web) e **Context7** (documentação técnica atualizada). Depois de
conectados, ficam disponíveis também no Claude Code.

## 3. Como obter BOM DESEMPENHO (os hábitos que fazem diferença)

1. **Profundidade sob demanda.** O projeto já vem em `effort high`. Para algo difícil, digite
   **`/effort max`**; para um empurrão pontual de raciocínio, escreva **`ultrathink`** no meio do
   pedido (ex.: *"ultrathink: qual a melhor estratégia de lançamento?"*).
2. **Peça um plano antes de tarefas grandes.** *"Antes de mexer nos arquivos, me mostre um plano."*
   Evita retrabalho.
3. **Delegue aos agentes.** Para trabalho grande ou paralelo, peça: *"use o market-researcher para
   dimensionar o mercado de X"*. O Claude também escolhe o agente certo sozinho.
4. **Dê contexto + objetivo + critério.** Quanto mais claro o pedido (o que quer, para quê, e o que
   é "bom"), melhor o resultado. Aponte o documento de referência: *"com base no plano-de-gestao, …"*.
5. **`/compact` ao trocar de assunto** — limpa o contexto sem perder o fio. E **não troque de modelo
   no meio** de uma tarefa (fica mais lento e caro).
6. **Revise antes de aceitar.** O Claude sempre pede confirmação antes de alterar arquivos — leia o
   que ele propõe.
7. **Use o `business-validator`** antes de dar um material por pronto: *"valide isto com o
   business-validator"*.

## 4. Cola rápida

| Quero… | Faço… |
|---|---|
| Entender o projeto | abrir `claude` na pasta e perguntar *"o que esse projeto faz?"* |
| Raciocínio máximo | `/effort max` ou escrever `ultrathink` no pedido |
| Limpar o contexto ao mudar de tema | `/compact` |
| Pesquisa de mercado | pedir e citar o `market-researcher` (+ skill `deep-research`) |
| Gerar um PDF profissional | skill `briefing-designer` |
| Checar um material | `business-validator` |
| Sair | `/exit` |

---

*Skills e MCPs personalizados são do Daniel; alguns exigem ferramentas instaladas (Node.js, etc.).
Planos/preços da Anthropic podem mudar — confira em claude.ai. Em caso de dúvida sobre o Claude Code,
a doc oficial é code.claude.com/docs.*
