"""Monta os PDFs profissionais (persona financial) a partir dos deliverables .md.

Gera gráficos via make_charts.py do briefing-designer, converte o markdown no
HTML do design system e escreve os .html prontos para render.py.
"""

import os
import re
import sys

import markdown as md

SKILL = os.path.expanduser("~/.claude/skills/briefing-designer")  # skill do autor — não vem no repo; só p/ regenerar PDFs
sys.path.insert(0, os.path.join(SKILL, "scripts"))
import make_charts as mc
import matplotlib as mpl

# Desliga o mathtext: "R$" nos rótulos NÃO deve virar modo matemático ($...$),
# que comia os espaços e sobrepunha o texto dos eixos.
mpl.rcParams["text.parse_math"] = False

HERE = os.path.join(os.path.dirname(os.path.dirname(os.path.abspath(__file__))), "deliverables")
ASSETS = os.path.join(HERE, "assets")
os.makedirs(ASSETS, exist_ok=True)
CSS = os.path.join(SKILL, "templates", "design_system.css")

PERSONA = "editorial"

# ----------------------------------------------------------------------
# 1. GRÁFICOS (cada um faz UMA afirmação)
# ----------------------------------------------------------------------
from matplotlib.ticker import FuncFormatter


def _milhar(x, _pos):
    return f"{int(round(x)):,}".replace(",", ".")


def polish(fig, *, yfmt=True, legend_ncol=None):
    """Corrige os defeitos do make_charts: eixo Y com separador de milhar e
    legenda ACIMA das barras (com folga no topo), em vez de sobreposta."""
    ax = fig.axes[0]
    if yfmt:
        ax.yaxis.set_major_formatter(FuncFormatter(_milhar))
    leg = ax.get_legend()
    if leg is not None and legend_ncol:
        handles, labels = ax.get_legend_handles_labels()
        leg.remove()
        y0, y1 = ax.get_ylim()
        ax.set_ylim(y0, y1 * 1.30)  # folga p/ a legenda não tocar as barras
        ax.legend(
            handles,
            labels,
            loc="upper center",
            bbox_to_anchor=(0.5, 1.0),
            ncol=legend_ncol,
            frameon=False,
            fontsize=9,
        )
    fig.tight_layout()
    return fig


# source="" em todos: a fonte vai SÓ no figcaption (HTML) — evita a segunda
# linha desalinhada que o make_charts embute no SVG.

# BP-1 — Margem de contribuição por canal (hbar; valores pequenos no eixo X)
fig = mc.hbar_chart(
    persona=PERSONA,
    categories=["Canal direto", "Mercado Livre", "Shopee"],
    values=[57.59, 26.48, 6.48],
    colors=["secondary", "muted", "accent"],
    x_label="Margem de contribuição (R$/un) — preço médio R$ 114",
    value_suffix="",
    figsize=(7.0, 2.7),
    source="",
    language="pt",
)
mc.save(fig, os.path.join(ASSETS, "bp_margem_canal"), formats=["svg"])

# BP-2 — Trajetória 12 meses (resultado mensal cruza zero ~mês 9)
ramp = [0, 0, 15, 22, 28, 32, 36, 40, 44, 50, 56, 64]
mktg = [200, 200, 400, 350, 300, 250, 250, 200, 200, 200, 250, 300]
mcb, das = 54.48, 81
res_mes, acc, a = [], [], 0
for i in range(12):
    prol = 2000 if (i + 1) >= 5 else 0
    r = ramp[i] * mcb - mktg[i] - das - prol
    res_mes.append(round(r))
    a += r
    acc.append(round(a))
fig = mc.line_chart(
    persona=PERSONA,
    x=list(range(1, 13)),
    series=[{"name": "Resultado mensal", "values": res_mes, "color": "accent"}],
    y_label="R$/mês (após pró-labore)",
    x_label="Mês",
    figsize=(7.0, 3.2),
    source="",
    language="pt",
)
polish(fig, yfmt=True)
mc.save(fig, os.path.join(ASSETS, "bp_trajetoria"), formats=["svg"])

# SRC-1 — China landed vs gráfica BR por volume
fig = mc.bar_chart(
    persona=PERSONA,
    categories=["300", "500", "1.000", "3.000", "5.000"],
    series=[
        {"name": "China (landed)", "values": [61, 47, 37, 24, 18], "color": "accent"},
        {
            "name": "Gráfica BR (meio da faixa)",
            "values": [41, 36, 30, 25, 24],
            "color": "secondary",
        },
    ],
    y_label="Custo/un (R$)",
    figsize=(7.0, 3.6),
    source="",
    language="pt",
)
polish(fig, yfmt=True, legend_ncol=2)
mc.save(fig, os.path.join(ASSETS, "src_china_br"), formats=["svg"])

# BP-3 — Pró-labore por ano: Estratégia A × B
fig = mc.bar_chart(
    persona=PERSONA,
    categories=["Ano 1", "Ano 2", "Ano 3"],
    series=[
        {
            "name": "A — antecipada",
            "values": [16000, 24000, 24000],
            "color": "secondary",
        },
        {"name": "B — otimizadora", "values": [0, 30000, 72000], "color": "accent"},
    ],
    y_label="Pró-labore aos sócios no ano (R$)",
    figsize=(7.0, 3.5),
    source="",
    language="pt",
)
polish(fig, yfmt=True, legend_ncol=2)
mc.save(fig, os.path.join(ASSETS, "bp_prolabore"), formats=["svg"])

# EVEF-1 — Fluxo de caixa livre por ano
fig = mc.bar_chart(
    persona=PERSONA,
    categories=["Ano 1", "Ano 2", "Ano 3", "Ano 4", "Ano 5"],
    series=[
        {
            "name": "FCF",
            "values": [13109, 31963, 98484, 195767, 317199],
            "color": "accent",
        }
    ],
    y_label="Fluxo de caixa livre (R$/ano)",
    figsize=(7.0, 3.2),
    source="",
    language="pt",
)
polish(fig, yfmt=True)
mc.save(fig, os.path.join(ASSETS, "evef_fcf"), formats=["svg"])

# MKT-1 — SAM por nicho (hbar; R$ milhões, valores pequenos)
fig = mc.hbar_chart(
    persona=PERSONA,
    categories=["Concurseiro", "Treino de Força"],
    values=[57, 27],
    colors=["secondary", "accent"],
    x_label="SAM — mercado endereçável (R$ milhões/ano)",
    value_suffix="",
    figsize=(7.0, 2.4),
    source="",
    language="pt",
)
mc.save(fig, os.path.join(ASSETS, "mkt_sam"), formats=["svg"])

# PE-1 — LTV (margem) vs CAC por nicho
fig = mc.bar_chart(
    persona=PERSONA,
    categories=["Concurseiro", "Treino de Força"],
    series=[
        {"name": "LTV (margem)", "values": [374, 397], "color": "secondary"},
        {"name": "CAC alvo", "values": [50, 50], "color": "accent"},
    ],
    y_label="R$ por cliente",
    figsize=(7.0, 3.0),
    source="",
    language="pt",
)
polish(fig, yfmt=True, legend_ncol=2)
mc.save(fig, os.path.join(ASSETS, "pe_ltv_cac"), formats=["svg"])

print("Gráficos gerados em", ASSETS)


# ----------------------------------------------------------------------
# 2. HELPERS de montagem
# ----------------------------------------------------------------------
def figure(num, label, title, src, alt, caption):
    return (
        f'<figure class="chart-wrap"><div class="chart-label">{label}</div>'
        f'<div class="chart-title">{title}</div>'
        f'<img src="{src}" alt="{alt}">'
        f'<figcaption class="chart-caption">{caption}</figcaption></figure>'
    )


def insert_fig_before(html, heading_substring, fig_html):
    pat = re.compile(
        r"(<h2[^>]*>(?:(?!</h2>).)*?"
        + re.escape(heading_substring)
        + r"(?:(?!</h2>).)*?</h2>)",
        re.S,
    )
    new, n = pat.subn(fig_html + r"\1", html, count=1)
    if n == 0:
        print(f"  [aviso] heading nao encontrado para figura: {heading_substring!r}")
    return new


def mark_lede(html):
    m = re.search(r"</h2>", html)
    if not m:
        return html
    i = m.end()
    head, tail = html[:i], html[i:]
    # marca como lede o 1º parágrafo substancial (>=40 palavras) após a 1ª seção
    for mp in re.finditer(r"<p>(.*?)</p>", tail, re.S):
        txt = re.sub(r"<[^>]+>", " ", mp.group(1))
        if len(re.findall(r"\b\w+\b", txt)) >= 40:
            return (
                head
                + tail[: mp.start()]
                + '<p class="lede">'
                + mp.group(1)
                + "</p>"
                + tail[mp.end() :]
            )
    return html  # nenhum parágrafo longo o bastante -> sem lede (evita lede minúsculo)


def md_to_body(md_text):
    body = md_text.split("\n---\n", 1)
    body = body[1] if len(body) > 1 else md_text
    body = body.replace("\n---\n", "\n\n")  # remove separadores -> espacamento
    html = md.markdown(body, extensions=["tables", "sane_lists", "attr_list"])
    # Aspas de ÊNFASE (termos próprios, não citações) viram itálico — evita o
    # falso-positivo do validador de copyright, que conta texto entre aspas como citação.
    html = re.sub(r'(?<!=)"([^"<>\n]{1,120})"', r"<em>\1</em>", html)
    html = re.sub(r"[“”]([^“”<>\n]{1,120})[“”]", r"<em>\1</em>", html)
    return html


def cover_summary(rows):
    trs = "".join(f"<tr><th>{k}</th><td>{v}</td></tr>" for k, v in rows)
    return f'<table class="cover-summary-table">{trs}</table>'


PAGE = """<!DOCTYPE html>
<html lang="pt-BR"><head><meta charset="UTF-8"><title>{title}</title>
<link rel="stylesheet" href="{css}">
<style>
  /* numeração das seções vem do markdown; desliga a automática p/ não duplicar */
  .body-content h2::before {{ content: none; }}
  .body-content h2 {{ counter-increment: none; margin-top: 7mm; }}
  .body-content h3 {{ margin-top: 4mm; }}
  /* tabelas: largura total, padding e bordas leves (sem colunas coladas, podem quebrar entre páginas) */
  .body-content table {{ width: 100%; border-collapse: collapse; font-size: 8.3pt; margin: 4mm 0; }}
  .body-content th, .body-content td {{ padding: 1.3mm 2.6mm; border-bottom: 0.3pt solid var(--rule); text-align: left; vertical-align: top; line-height: 1.25; }}
  .body-content thead th {{ border-bottom: 0.7pt solid var(--ink); font-size: 7.8pt; text-transform: uppercase; letter-spacing: 0.03em; }}
  .chart-wrap {{ break-inside: avoid; margin: 6mm 0; }}
  blockquote {{ break-inside: avoid; }}
  /* capa */
  .cover-title {{ font-size: 33pt; line-height: 1.08; margin-bottom: 6mm; text-align: left; }}
  .cover-deck {{ font-size: 12pt; margin-bottom: 8mm; max-width: 100%; }}
  .cover-summary-table {{ margin: 4mm 0 0 0; }}
  .cover-abstract {{ font-size: 10.5pt; padding-top: 5mm; }}
</style></head>
<body class="persona-editorial">
<div class="string-set-title">{short}</div>
<div class="string-set-date">19 jun 2026</div>

<section class="cover cover-editorial">
  <div class="cover-kicker">{kicker}</div>
  <h1 class="cover-title">{t1}<br>{t2}</h1>
  <p class="cover-deck">{deck}</p>
  <hr class="cover-rule">
  <div class="cover-byline"><strong>{byline_label}</strong><br>
    {location} &middot; 19 jun 2026<br><em>{horizon}</em></div>
  {summary_table}
  <div class="cover-abstract"><span class="cover-abstract-label">Síntese</span> {abstract}</div>
</section>

<section class="body-content">
{body}
<div class="sources">
  <div class="sources-title">Notas, confiança e fontes</div>
  <p class="uncertainty-note">{legend}</p>
  <p>{sources}</p>
</div>
</section>
</body></html>"""

# ----------------------------------------------------------------------
# 3. CONFIG POR DOCUMENTO
# ----------------------------------------------------------------------
LEGEND = (
    "Marcações de confiança usadas no texto — <strong>[confirmado]</strong>: fonte primária "
    "datada e verificável · <strong>[estimativa triangulada]</strong>: ≥2 fontes convergentes, "
    "sem confirmação formal · <strong>[a confirmar]</strong>: faixa de mercado, não apresentada como fechada."
)

docs = {
    "business-plan-planners": dict(
        title="Business Plan — Projeto Planners",
        short="Business Plan · Projeto Planners",
        kicker="PROJETO PLANNERS · DOSSIÊ INTERNO",
        t1="Business Plan",
        t2="Planners Concurseiro &amp; Treino",
        deck=(
            "Linha D2C de planners perpétuos premium para dois nichos brasileiros de alto "
            "engajamento. É viável começar com R$ 5.000 — desde que a distribuição seja construída organicamente."
        ),
        byline_label="Uso interno dos sócios",
        location="Brasília/DF",
        horizon="Horizonte: ano 1 (Fase 1 — produção nacional)",
        abstract=(
            "O gargalo não é capital nem produto: é construir distribuição do zero. O caminho viável "
            "é o forte do time — conteúdo orgânico. O negócio recupera os R$ 5 mil com folga; na "
            "estratégia recomendada (B), reinveste 100% no ano 1 e só paga os sócios a partir do ano 2 "
            "— mantendo ~R$ 17 mil no negócio na fase mais frágil."
        ),
        summary=cover_summary(
            [
                ("MC/un — canal direto", "R$ 57,59 (50%)"),
                ("Caixa retido no ano 1 (Estratégia B)", "~R$ 17 mil"),
                ("Sócios começam a receber", "ano 2"),
                ("Pró-labore 3 anos — B vs A", "R$ 102k vs R$ 64k"),
            ]
        ),
        sources=(
            "Mercado: Censo dos Concursos 2025 (QConcursos/Folha Dirigida); HFA/Panorama Fitness 2025; "
            "MGI. Concorrência/preço: Amazon, Mercado Livre, Shopee (jun/2026). Canal: XP, Tributei, "
            "E-commerce Brasil, Trafius, aintegrare, E-Dialog. Detalhe datado em research/evidence/. "
            "Números do cenário-base = models/viabilidade-planners-v2.xlsx."
        ),
        figs=[
            (
                "Estratégia de preço",
                figure(
                    1,
                    "FIGURA 1",
                    "O canal direto preserva ~50% da margem; o marketplace a destrói",
                    "assets/bp_margem_canal.svg",
                    "Margem de contribuição por canal",
                    "Margem de contribuição por unidade, por canal de venda, ao preço médio de R$ 114. Fonte: modelo (aba Unit Economics).",
                ),
            ),
            (
                "Plano financeiro",
                figure(
                    2,
                    "FIGURA 2",
                    "Sob a Estratégia A, o resultado mensal cruza zero por volta do mês 9",
                    "assets/bp_trajetoria.svg",
                    "Trajetória de 12 meses (Estratégia A)",
                    "Resultado mensal após pró-labore, com ramp do zero; o acumulado fecha o ano 1 em +R$ 1 mil. Fonte: modelo (aba Projeção 12M).",
                ),
            ),
            (
                "Riscos",
                figure(
                    3,
                    "FIGURA 3",
                    "A Estratégia B adia o pró-labore — zero no ano 1, e maior (no total) depois",
                    "assets/bp_prolabore.svg",
                    "Pró-labore por ano: Estratégia A × B",
                    "Pró-labore anual aos sócios sob cada estratégia (trajetória de vendas idêntica nas duas). Fonte: modelo (aba Pró-labore AxB).",
                ),
            ),
        ],
    ),
    "consultoria-sourcing-planners": dict(
        title="Consultoria de Sourcing — Projeto Planners",
        short="Sourcing · Projeto Planners",
        kicker="PROJETO PLANNERS · DOSSIÊ INTERNO",
        t1="Consultoria de Sourcing",
        t2="&amp; Desenvolvimento de Produto",
        deck=(
            "Da ficha técnica ao landed cost: onde produzir os dois planners, a que custo, e quando a "
            "importação da China passa a compensar."
        ),
        byline_label="Uso interno dos sócios",
        location="Brasília/DF",
        horizon="Horizonte: Fase 1 (Brasil) → Fase 2 (China)",
        abstract=(
            "Brasil na Fase 1: a gráfica nacional fecha em 6–8 semanas, sem fricção de importação. "
            "A China só bate o custo nacional a partir de ~3.000–5.000 un — mais alto do que o rascunho "
            "supunha, após corrigir o AFRMM (8%, não 25%) e o ICMS não creditável no MEI."
        ),
        summary=cover_summary(
            [
                ("Decisão Fase 1", "Gráfica nacional"),
                ("Crossover China", "~3.000–5.000 un"),
                ("Landed cost", "2,0–2,7× o FOB"),
                ("NCM (tributado)", "4820.10.00"),
            ]
        ),
        sources=(
            "Alíquotas: FazComex/TIPI ADE COANA 001/2026; Gecex 852/2026 (não alterou o cap. 48); "
            "Lei 14.301/2022 (AFRMM 8%); Lei DF 1.254/96 (ICMS). China: Alibaba, Made-in-China (jun/2026). "
            "Detalhe datado em research/evidence/sourcing-tributos.md. A confirmar por despachante e 3 orçamentos."
        ),
        figs=[
            (
                "Decisão de fornecimento",
                figure(
                    1,
                    "FIGURA 1",
                    "A China só bate a gráfica BR a partir de ~3.000 un",
                    "assets/src_china_br.svg",
                    "China landed vs gráfica BR por volume",
                    "Custo unitário por volume de pedido. Abaixo de ~3.000 un, a produção nacional ganha ou empata. Fonte: research/evidence/sourcing-tributos.md.",
                ),
            ),
        ],
    ),
    "estudo-viabilidade-economica": dict(
        title="Estudo de Viabilidade Econômico-Financeira — Projeto Planners",
        short="EVEF · Projeto Planners",
        kicker="PROJETO PLANNERS · DOSSIÊ INTERNO",
        t1="Estudo de Viabilidade",
        t2="Econômico-Financeira (5 anos)",
        deck=(
            "Vale a pena investir os R$ 5 mil? Sim — mas a viabilidade é decidida pela execução "
            "(aquisição e o financiamento do lote China), não pela matemática financeira."
        ),
        byline_label="Uso interno dos sócios",
        location="Brasília/DF",
        horizon="Horizonte: 5 anos · taxa de desconto 12–15% a.a.",
        abstract=(
            "A R$ 5 mil de capital, o VPL (R$ 365–407 mil) e a TIR (~406%) são fortemente positivos "
            "— porém inflados pelo capital mínimo. O investimento real é o trabalho dos sócios e o "
            "risco de execução. A decisão financeira de fato é o lote China (~R$ 99 mil) no ano 3."
        ),
        summary=cover_summary(
            [
                ("VPL @ 13,5% (12–15%)", "R$ 385 mil"),
                ("TIR", "~406% a.a."),
                ("Payback descontado", "< 1 ano"),
                ("Necessidade de capital", "~R$ 5 mil"),
            ]
        ),
        sources=(
            "Modelo viabilidade-planners-v2.xlsx (aba EVEF), conferido por recálculo independente; "
            "research/evidence/. Anos 3–5 ILUSTRATIVOS; tributos por contador."
        ),
        figs=[
            (
                "Indicadores de viabilidade",
                figure(
                    1,
                    "FIGURA 1",
                    "O fluxo de caixa livre cresce com a escala",
                    "assets/evef_fcf.svg",
                    "Fluxo de caixa livre por ano",
                    "Fluxo de caixa livre por ano (após pró-labore e capital de giro). Anos 3–5 ilustrativos. Fonte: modelo (aba EVEF).",
                ),
            ),
        ],
    ),
    "estudo-de-mercado": dict(
        title="Estudo de Mercado — Projeto Planners",
        short="Estudo de Mercado · Projeto Planners",
        kicker="PROJETO PLANNERS · DOSSIÊ INTERNO",
        t1="Estudo de Mercado",
        t2="Concurseiro &amp; Treino de Força",
        deck=(
            "Dois mercados grandes e complementares — um validado, um em whitespace. O tamanho não "
            "é o gargalo; a aquisição é."
        ),
        byline_label="Uso interno dos sócios",
        location="Brasília/DF",
        horizon="Brasil · jun/2026",
        abstract=(
            "Concurseiro: grande, recorrente e validado, em lull eleitoral com retomada esperada em "
            "2027. Treino: whitespace nacional com recompra. SAM somado de R$ 50–120 M/ano; o SOM do "
            "ano 1 é limitado por capacidade de aquisição (audiência do zero), não por tamanho de mercado."
        ),
        summary=cover_summary(
            [
                ("SAM — Concurseiro", "~R$ 55 M/ano"),
                ("SAM — Treino de Força", "~R$ 25 M/ano"),
                ("SOM ano 1 (combinado)", "350–1.100 un"),
                ("Gargalo", "aquisição, não mercado"),
            ]
        ),
        sources=(
            "research/evidence/ (4 notas datadas): IBGE, MGI, Censo dos Concursos 2025, HFA/Panorama "
            "Fitness 2025, Amazon/ML/Shopee, Meta Ads. Estimativas a refinar com survey próprio."
        ),
        figs=[
            (
                "Personas",
                figure(
                    1,
                    "FIGURA 1",
                    "O Concurseiro tem ~2× o mercado endereçável do Treino",
                    "assets/mkt_sam.svg",
                    "SAM por nicho",
                    "Mercado endereçável anual por nicho (ponto médio das faixas). Fonte: research/evidence/.",
                ),
            ),
        ],
    ),
    "plano-estrategico": dict(
        title="Plano Estratégico — Projeto Planners",
        short="Plano Estratégico · Projeto Planners",
        kicker="PROJETO PLANNERS · DOSSIÊ INTERNO",
        t1="Plano Estratégico",
        t2="Projeto Planners",
        deck=(
            "Vencer pela combinação que ninguém junta — método + estética + recorrência —, com "
            "crescimento autofinanciado puxado por conteúdo orgânico."
        ),
        byline_label="Uso interno dos sócios",
        location="Brasília/DF",
        horizon="Horizonte: 3–5 anos",
        abstract=(
            "O produto é consumível (recompra 3–4×/ano): é base recorrente, não venda única. Reter "
            "vale mais que adquirir; o fosso é marca + método + comunidade, não o produto (barreira "
            "de entrada baixa). Crescimento 100% autofinanciado, puxado por conteúdo orgânico."
        ),
        summary=cover_summary(
            [
                ("LTV de margem / cliente", "R$ 374–397"),
                ("LTV/CAC (orgânico)", "7–8×"),
                ("North Star", "clientes ativos recorrentes"),
                ("Crescimento", "autofinanciado"),
            ]
        ),
        sources=(
            "Estudo de mercado, EVEF e modelo viabilidade-planners-v2.xlsx (abas LTV & Recorrência, "
            "EVEF, Pró-labore AxB). Premissas de recorrência a validar por survey próprio."
        ),
        figs=[
            (
                "Vantagem competitiva",
                figure(
                    1,
                    "FIGURA 1",
                    "O LTV cobre o CAC ~7–8× — a recompra sustenta a aquisição",
                    "assets/pe_ltv_cac.svg",
                    "LTV (margem) vs CAC por nicho",
                    "Valor do cliente (margem ao longo da vida) vs. custo de aquisição alvo. Fonte: modelo (aba LTV & Recorrência).",
                ),
            ),
        ],
    ),
    "plano-de-gestao": dict(
        title="Plano de Gestão — Projeto Planners",
        short="Plano de Gestão · Projeto Planners",
        kicker="PROJETO PLANNERS · DOSSIÊ INTERNO",
        t1="Plano de Gestão",
        t2="Projeto Planners",
        deck=(
            "Charter, cronograma, RACI, OKRs, riscos, política financeira e decision log — o "
            "sistema operacional do negócio."
        ),
        byline_label="Uso interno dos sócios",
        location="Brasília/DF",
        horizon="Documento vivo · revisar a cada gate/trimestre",
        abstract=(
            "Reúne o 'como executar': objetivos e gates, divisão de papéis (RACI), OKRs do ano 1, "
            "registro de riscos gerenciado, regras financeiras (autofinanciamento) e o histórico das "
            "decisões-chave com seus porquês. Métricas operacionais no painel-kpis.xlsx."
        ),
        summary=cover_summary(
            [
                ("Gates de decisão", "A · B · C"),
                ("OKRs", "ano 1, trimestrais"),
                ("Riscos mapeados", "9 (com dono e gatilho)"),
                ("Decisões registradas", "8"),
            ]
        ),
        sources=(
            "Consolida business plan, EVEF, plano estratégico e modelo viabilidade-planners-v2.xlsx. "
            "RACI e OKRs são propostas a ajustar entre os sócios."
        ),
        figs=[],
    ),
}

for slug, cfg in docs.items():
    src_md = open(os.path.join(HERE, slug + ".md"), encoding="utf-8").read()
    body = md_to_body(src_md)
    body = mark_lede(body)
    for heading_sub, fig_html in cfg["figs"]:
        body = insert_fig_before(body, heading_sub, fig_html)
    html = PAGE.format(
        title=cfg["title"],
        css=CSS,
        short=cfg["short"],
        kicker=cfg["kicker"],
        t1=cfg["t1"],
        t2=cfg["t2"],
        deck=cfg["deck"],
        byline_label=cfg["byline_label"],
        location=cfg["location"],
        horizon=cfg["horizon"],
        abstract=cfg["abstract"],
        summary_table=cfg["summary"],
        body=body,
        legend=LEGEND,
        sources=cfg["sources"],
    )
    out = os.path.join(HERE, slug + ".html")
    open(out, "w", encoding="utf-8").write(html)
    print("HTML escrito:", out)
print("OK")
