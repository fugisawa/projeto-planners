# Stack Digital do Concurseiro Brasileiro: O Que Já É Digital × Onde o Papel Agrega

**Data:** 19 de junho de 2026
**Escopo:** Mapeamento do ecossistema digital de preparação para concursos públicos no Brasil, com foco em identificar o que o planner físico NÃO deve replicar.
**Metodologia:** Pesquisa web via Exa e Tavily; fontes trianguladas (sites oficiais de cursinhos, páginas de produtos, blogs especializados, PDFs de metodologia, lojas de apps).

---

## 1. VERTICALIZAR O EDITAL — origem, significado e automação

### O que é e de onde veio

"Edital verticalizado" (também chamado "edital esquematizado" ou "edital personalizado") é a reorganização do conteúdo programático do concurso em **planilha-checklist hierarquizada**, com colunas para: status de estudo (não iniciado / em andamento / concluído), quantidade de revisões, desempenho em questões por tópico, datas, e observações. O objetivo é transformar um PDF burocrático de dezenas de páginas em um **mapa de estudo controlável, tópico a tópico**.

O conceito nasceu de forma orgânica na comunidade concurseira como prática empírica no Excel/Word, popularizado em blogs especializados (VoceConcursado, IAP Cursos, MapasPro) entre 2015–2020, e foi amplamente adotado. Não tem um criador único; surgiu como variante natural do "cronograma de estudos" quando os concurseiros perceberam que precisavam **granularidade por assunto, não só por disciplina**. [estimativa triangulada]

### Como a comunidade faz

Passo a passo clássico (manual):
1. Copiar o conteúdo programático do edital (PDF)
2. Colar numa planilha Excel/Google Sheets e separar por disciplina → tópico → subtópico
3. Adicionar colunas: Estudo (✓/data), Revisões (R1/R2/R3/data), Questões (acertos/total), Observações
4. Usar cores para indicar domínio (vermelho = não dominado, verde = dominado)
5. Atualizar progressivamente ao longo da preparação

Ferramentas usadas: Excel, Google Sheets, Notion, Obsidian. Até caneta e caderno em abordagens mais simples. [confirmado]

### Quem já entrega pronto

Isso é o mais crítico para o planner: **o edital verticalizado já é um commodity digital entregue automaticamente** pelos principais players:

| Quem entrega | O que oferece | Custo |
|---|---|---|
| **QConcursos** | "Guia de Estudos" = edital esquematizado + vídeoaulas + questões por tópico + tracker de progresso com probabilidade de aprovação | Incluso na assinatura (~R$ 19,99/mês) |
| **Gran Cursos Online** | Editais verticalizados prontos em Excel para download gratuito + cronograma automático de estudos individualizado por IA | Gratuito (download) / assinatura ilimitada |
| **Estratégia Concursos** | "Trilha Estratégica" = roteiro semana a semana de O QUE estudar, QUAIS questões resolver e O QUE revisar, com análise estatística de incidência por banca | Incluso na assinatura Premium |
| **Meu Organizado** | Verticalizador automático: cola o texto do edital, gera a planilha | Gratuito/freemium |
| **Guia do Concurseiro** | Ferramenta online: cola o conteúdo programático → gera tabela exportável para Excel/Sheets | Gratuito |
| **Estudaqui** | Edital verticalizado integrado ao ciclo de estudos automático; +900 provas cadastradas | Incluso no app |
| **Deltinha** | Edital verticalizado + cronograma de estudos + estatísticas + revisões programadas | 100% gratuito |

**Conclusão sobre automação:** O ato de "criar o edital verticalizado" manualmente em planilha está se tornando obsoleto para quem usa qualquer plataforma de questões ou cursinho. O tracker de tópicos, a marcação de revisões e o controle de % de acerto por assunto são **funcionalidades nativas de todas as plataformas principais**. O concurseiro que ainda faz isso manualmente é exceção, não regra. [confirmado]

---

## 2. BANCOS DE QUESTÕES — QConcursos e TEC Concursos

### O que oferecem (mapeamento completo de funcionalidades)

**QConcursos** (~maior base de usuários):
- Mais de 9.000 cursos e banco de questões ilimitadas
- **Raio-X do edital**: analisa provas anteriores e mostra os assuntos mais cobrados pela banca do concurso específico
- **Estatísticas de desempenho**: acertos totais, por período, por disciplina, por assunto, por banca
- **"Termômetro da aprovação"**: compara desempenho do aluno com a concorrência em tempo real
- **Resumão semanal**: análise automática do desempenho a cada 6–7 dias, com recomendações personalizadas
- **Caderno de erros**: geração automática de caderno com questões erradas, filtrado por período/matéria/assunto
- **Simulados por disciplina** (no estilo da banca) + provas anteriores completas
- **Treinador com "chances reais de aprovação"** baseado em comparação com aprovados anteriores
- Preço: a partir de R$ 19,99/mês [confirmado, fonte: QConcursos individual page, 2026]

**TEC Concursos** (foco em concurseiros mais avançados):
- **Caderno de Erros** dinâmico: gera automaticamente caderno apenas com questões erradas, filtrado por matéria, banca, dificuldade, período (tutorial oficial, março 2026)
- **Estatísticas avançadas por assunto**: desempenho por tópico com comparação com a média da comunidade
- **Dificuldade média do caderno**: índice de dificuldade ponderado das questões estudadas
- **Modo Curso**: integra teoria (texto/vídeo) + questões num fluxo único, com índice de tópicos estudados
- **Comparação com outros alunos**: benchmark de desempenho versus a comunidade TEC (plano avançado)
- Comentários de professores considerados mais técnicos e detalhados que os concorrentes
- Preço: a partir de R$ 39,99/mês [confirmado, fonte: TEC Concursos assinar page]

### Isso torna redundante um tracker manual de questões no papel?

**Sim, para acompanhamento de desempenho numérico.** As plataformas entregam automaticamente o que qualquer tabela manual de "questões certas/erradas por tópico" tentaria fazer, com precisão muito maior, granularidade por assunto/banca/dificuldade, evolução histórica, e benchmarks comparativos. Registrar manualmente no papel "acertei 7 de 10 de Dir. Administrativo – Atos Administrativos" é retrabalho quando o TEC ou QC já fazem isso automaticamente.

**Onde o papel ainda agrega:** revisar ERROS de forma analítica (entender POR QUÊ errou, ananotar raciocínio alternativo, criar mnemônico) — isso é reflexão qualitativa, não quantitativa. [confirmado]

---

## 3. ANKI PARA CONCURSOS — adoção e o que substitui

### Adoção e maturidade

O Anki é amplamente adotado pela comunidade concurseira brasileira como ferramenta de repetição espaçada. A versão desktop é gratuita; iOS tem custo (~US$ 29,99); Android gratuito. Existe ecossistema ativo de decks prontos no GitHub (ex: `LipeDevN/AnkiConcursoCards` com Direito Constitucional, Língua Portuguesa, Engenharia de Software) e no Ankiweb. [confirmado]

Configurações recomendadas pela comunidade em 2026:
- 20–40 novos cards/dia
- Algoritmo FSRS (mais inteligente que SM-2, recomendado pela comunidade desde 2025)
- Retenção alvo: ~90%
- Intervalo máximo: 60–90 dias (mantém conteúdo "fresco" para prova)
- Integração com AnkiWeb para sincronização entre dispositivos [confirmado]

### O que o Anki substitui no papel

| Atividade analógica | Substituído pelo Anki? |
|---|---|
| Flashcards físicos (cartões de papel) | **Sim, completamente** — e com vantagem (algoritmo automático, sem perder cartas, sem desgaste) |
| Revisão espaçada "manual" (caderninho de revisões R1/R2/R3) | **Sim, substancialmente** — o algoritmo calcula o intervalo ideal por item, não por data fixa |
| Lista de "coisas a revisar hoje" | **Sim** — o app gera a fila diária automaticamente |
| Marcação de dificuldade por conteúdo | **Sim** — o usuário avalia Fácil/Difícil/Bom a cada card |

### Onde NÃO substitui

- Síntese e elaboração: escrever o card **força elaboração** (gerar/reformular) — o ganho é a elaboração, não a caligrafia `[revisto 23/jun/2026 — "à mão grava mais" é fraca/contestada: g≈0,14–0,25, Morehead 2019]`
- Criação de mapas mentais e conexões entre conceitos (Anki é atômico — um conceito por card)
- Leitura analítica de lei seca com marcações e anotações no papel
- O Anki é ferramenta de **revisão** (pressupõe aprendizado inicial feito por outro meio) [confirmado]

---

## 4. CICLO DE ESTUDOS — metodologia BR, apps e planilhas

### Origem e criador

O "Ciclo de Estudos" como metodologia estruturada foi sistematizado por **Alexandre Meirelles** (aprovado em 1º lugar no concurso de AFRFB 2005) e popularizado pelo livro *Como Estudar Para Concursos* (Editora Juspodivm). A metodologia consiste em organizar todas as disciplinas do edital em **blocos de tempo proporcionais ao peso de cada matéria**, estudando-as de forma **rotativa e contínua** — sem fixar disciplinas em dias fixos da semana. Quando o ciclo completa, reinicia. [confirmado, fonte: PDF Manual do Concurseiro 9ª ed.; blog Estudaqui]

### Quem digitalizou e automatizou

| App/Plataforma | O que faz |
|---|---|
| **Estudaqui** (app, 550k+ downloads) | Única ferramenta endossada por Alexandre Meirelles; cria ciclo de estudos **automaticamente** em 1 clique a partir do concurso selecionado; considera pesos, incidência histórica, dificuldades pessoais, alternância raciocínio/memorização; 900+ provas cadastradas; gerencia revisões com lembretes; gratuito com plano premium |
| **Aprovado** (app, desde 2012) | Cronômetro de horas por matéria, gráficos, histórico, alarmes; foco em registro de tempo; gratuito (funcionalidades premium sem assinatura — pagamento único) |
| **Deltinha** (web/app) | Timer de horas líquidas + cronograma + banco de questões + revisões programadas + ranking anônimo vs. outros concurseiros; 100% gratuito |
| **Planilha de Ciclo de Estudos** (Google Sheets/Excel) | Versão analógica/digital híbrida; múltiplos templates gratuitos distribuídos por blogs e criadores |
| **Gran Cursos** | Cronograma automático de estudos individualizado com IA (incluso na assinatura ilimitada) |

**Conclusão:** O ciclo de estudos como conceito é **totalmente digital e automatizado** pelo Estudaqui. Montar um ciclo manualmente em papel ou planilha é fazer o que o app faz em 1 clique — mas com muito mais trabalho e sem os dados históricos de incidência por banca. [confirmado]

---

## 5. O QUE OS CURSINHOS JÁ INCLUEM NO PACOTE

### Estratégia Concursos (Assinatura Premium, ~R$ 29,90–59,90/mês)

Inclui nativamente, sem custo adicional:
- **PDF Regular + Videoaulas**: teoria completa por disciplina
- **Livro Digital Interativo**: anotações e marcações digitais
- **Trilha Estratégica**: roteiro semana a semana dizendo exatamente O QUE estudar → substituição digital do planejamento macro
- **Passo Estratégico**: revisão por banca com análise estatística de incidência, questões estratégicas selecionadas, checklist, questionário de autoexplicação, simulados inéditos → substituição da "revisão de véspera" e do tracker de conteúdo prioritário
- **Sistema de Questões** (maior do mercado): filtros por banca/órgão/ano/dificuldade/artigo de lei
- **Simulados com ranking** comparativo
- **Estratégia Cast**: aulas em áudio (estudo no transporte/academia)
- **Monitor de Performance**: dashboard de desempenho
- **Mapas Mentais** prontos por disciplina

O Estratégia literalmente descreve a Trilha Estratégica como **"o Waze do concurseiro"**: você não precisa decidir o que estudar amanhã — o sistema decide. [confirmado, fonte: estrategiaconcursos.com.br/assinaturas, 2026]

### Gran Cursos Online (Assinatura Ilimitada)

Inclui nativamente:
- +3 milhões de questões
- **Cronograma automático de estudos individualizado** por IA
- **Cursos recomendados por IA** ("Dá para Conciliar?" — analisa sua disponibilidade)
- **Dashboard de performance**
- **Raio-X dos temas mais recorrentes** nas bancas
- **PDF Sintético** para revisões rápidas
- **Resumo, Transcrição e Revisão** de aulas gerados automaticamente
- **Correção inteligente de discursivas** por IA
- **Salas de Mentoria** ao vivo
- **Editais verticalizados** prontos para download
- Legislação Comentada; Simulados inéditos com ranking
- Acesso multiplataforma (web, app desktop, mobile, TV)

[confirmado, fonte: grancursosonline.com.br/assinatura-ilimitada, 2026]

**Síntese crítica:** Um aluno com assinatura Estratégia Premium ou Gran Ilimitada recebe automaticamente: edital verticalizado, trilha de estudos, revisões priorizadas por banca, banco de questões com estatísticas, simulados, dashboards de desempenho, e até mapas mentais. O cursinho virou um **sistema operacional de estudos**, não apenas um fornecedor de conteúdo. O preço (~R$ 30–60/mês) é irrisório frente ao que oferece. [confirmado]

---

## 6. ONDE O PAPEL AINDA AGREGA × ONDE O DIGITAL É IMBATÍVEL

### O digital é imbatível em:

| Função | Por quê o digital vence |
|---|---|
| **Tracker de questões por tópico** | QC/TEC atualizam automaticamente; precisão por assunto/banca/dificuldade; evolução histórica |
| **Ciclo de estudos automatizado** | Estudaqui/Gran calculam proporção, incidência histórica, alternância raciocínio/memorização — impossível replicar manualmente com a mesma precisão |
| **Edital verticalizado** | Gran/Estratégia/QC entregam pronto; ferramentas online geram em segundos colando o texto |
| **Revisão espaçada algorítmica** | Anki (FSRS) calcula intervalos ideais por item; inviável fazer manualmente para 500+ cards |
| **Agenda de revisões futura** | Estudaqui agenda automaticamente R1/R2/R3 com lembretes push; papel não manda notificação |
| **Análise estatística de banca** | Raio-X (QC), Passo Estratégico (Estratégia), análise de incidência — dados que o papel não consegue processar |
| **Benchmark vs. concorrência** | "Termômetro" QC, rankings TEC/Deltinha — posição relativa em tempo real |
| **Conteúdo atualizado** | Alterações legislativas, jurisprudência STF/STJ — cursinhos atualizam automaticamente |
| **Portabilidade** | Estuda no celular no ônibus, tablet em casa, computador no trabalho |

### O papel ainda agrega (genuinamente):

| Função | Por quê o papel vence |
|---|---|
| **Foco sem distração** | Celular/tablet = fonte de notificações, redes sociais, WhatsApp. O caderno físico não interrompe. É o único ambiente de estudo 100% silencioso. [confirmado, citado em múltiplas fontes de bullet journal para concursos] |
| **Escrita à mão = foco + elaboração** (não "memoriza mais") | O ganho de memória da caligrafia por si é **pequeno e contestado** (g≈0,14–0,25; some sem revisão — Morehead 2019; Flanigan 2024). O que vale é **foco sem tela** + **síntese ativa** (gerar) — úteis p/ lei seca/conceitos via reformulação, não pelo ato motor. `[revisto 23/jun/2026 — ver revisao-evidencia-2026-06.md]` |
| **Síntese ativa e personalizada** | Fazer resumo/esquema no papel FORÇA processamento profundo do conteúdo — diferente de ler PDF ou assistir aula. É uma técnica de aprendizagem (elaboração), não de registro. [confirmado] |
| **Reflexão e planejamento macro** | Visão de semana/mês em papel: o concurseiro vê "de um olhar" onde está na jornada. Apps fragmentam em telas; o papel dá perspectiva. [estimativa triangulada] |
| **Ritual de abertura/fechamento do estudo** | O ato físico de abrir o planner, registrar a sessão, marcar o progresso cria um ritual cognitivo de transição (modo "trabalho" → modo "estudo"). Notificações no app não têm o mesmo efeito. [estimativa triangulada] |
| **Personalização irrestrita** | O papel não tem template fixo — o concurseiro adapta o layout à sua rotina, ao concurso, à fase da preparação. Nenhum app cobre todos os casos de uso individuais. [confirmado] |
| **Planejamento semanal de intenções** | "Esta semana quero avançar em X, resolver Y questões de Z" — planejamento de intenções em linguagem natural, não em formulário digital. |
| **Anotação rápida lateral** | Insight durante a aula, dúvida para pesquisar depois, conexão entre assuntos — captura imediata sem sair da tela/app. |
| **Saúde digital / descanso visual** | Após horas de tela, o papel descansa os olhos. Múltiplos relatos em fóruns de concurseiros. [estimativa triangulada] |

---

## SEÇÃO FINAL — IMPLICAÇÕES PARA O PLANNER

### O que o planner NÃO deve replicar (já é digital e digital é imbatível)

1. **Tracker de questões por tópico** — não incluir colunas de "acertos/erros por matéria". QC e TEC fazem isso com precisão algorítmica, por banca e por dificuldade. Papel aqui é retrabalho e inferioridade.

2. **Ciclo de estudos (blocos de tempo por disciplina)** — não incluir grade de alocação de horas por disciplina. O Estudaqui (Alexander Meirelles endossado) e o Gran fazem isso em 1 clique com dados históricos de 900+ provas. Papel não compete.

3. **Edital verticalizado como checklist de tópicos** — não incluir páginas de "lista de tópicos do edital para marcar". Gran/Estratégia/QC entregam pronto, atualizado, em Excel. Repetir isso em papel é o que tornaria o planner "pesado" e levaria o concurseiro ao digital.

4. **Agenda de revisões com datas futuras (R1/R2/R3)** — não incluir sistema de revisão espaçada com calendário de datas. Estudaqui agenda automaticamente com lembretes push. Papel não manda notificação.

5. **Controle granular de horas por matéria** — não incluir tabelas de "horas gastas por disciplina hoje". Aprovado, Deltinha, Estudaqui fazem isso com cronômetro automático e gráficos históricos.

6. **Análise de bancas e incidência de assuntos** — não incluir percentuais de cobranças por assunto. Raio-X (QC), Passo Estratégico (Estratégia) fazem isso com dados reais de centenas de provas.

7. **Flashcards/fichas de revisão de conteúdo** — não incluir espaço para "fichas de memorização" do conteúdo das matérias. O Anki + decks prontos fazem melhor, com algoritmo. O papel só vale aqui para a *criação* dos cards (escrever o card = **gerar/elaborar**; o ganho é a geração, não a caligrafia per se `[revisto 23/jun/2026]`), não para a *revisão*.

### Onde o planner AGREGA como hub analógico harmônico

1. **Espaço de foco total** — ambiente sem tela, sem notificação, sem distração. A função mais valiosa e insubstituível. O planner É o ambiente de foco.

2. **Síntese semanal escrita à mão** — "O que aprendi esta semana? Quais foram meus pontos cegos? O que preciso ajustar?" — reflexão metacognitiva que nenhum app força o concurseiro a fazer.

3. **Planejamento de intenções** (não de tarefas) — "Esta semana meu foco é X; minha meta de qualidade é Y" — diferente do cronograma automático. É o PORQUÊ do estudo, não o O QUÊ.

4. **Registro de sessão e ritual** — abertura e fechamento de cada sessão de estudo; hora de início/fim; matéria estudada; como foi a energia/concentração. Cria consciência sobre a própria rotina.

5. **Mapa macro da jornada** — visão do mês/fase de preparação; marcos importantes (data do edital, data da prova, fases); perspectiva de longo prazo que as telas fragmentam.

6. **Espaço de escrita de síntese** — uma ou duas frases sobre o conteúdo mais importante estudado hoje. **Ajuda a processar** (o ganho é a síntese ativa/**geração**, não a caligrafia per se `[revisto 23/jun/2026]`). É a "ponte" entre o conteúdo digital e o cérebro.

7. **Hub de integração com o stack digital** — espaço físico que APONTA para o digital (não replica): "hoje no Anki: 30 cards de Dir. Const.; no TEC: caderno de erros de Adm.". O planner é o centro nervoso, não o banco de dados.

8. **Controle emocional da jornada** — espaço para registro de humor, nível de confiança, motivação. O concurseiro passa meses ou anos em preparação; a dimensão emocional é real e os apps ignoram.

---

## Fontes consultadas

- QConcursos individual page: individual.qconcursos.com (2026)
- TEC Concursos — planos e funcionalidades: tecconcursos.com.br/assinar
- TEC Concursos — tutorial caderno de erros: youtube.com/watch?v=g0_gSuuq9zY (mar/2026)
- Gran Cursos Online — assinatura ilimitada: grancursosonline.com.br/assinatura-ilimitada (2026)
- Gran Cursos Online — edital verticalizado: blog.grancursosonline.com.br/edital-verticalizado
- Estratégia Concursos — assinaturas: estrategiaconcursos.com.br/assinaturas (2026)
- Estratégia Concursos — ferramentas de estudo: estrategiaconcursos.com.br/blog/ferramentas-de-estudo-do-estrategia (2022)
- Estudaqui — site oficial: estudaqui.com (2026); App Store; Google Play (atualizado abr/2026)
- Alexandre Meirelles — Ciclo de Estudos parte prática: estudaqui.com/blog/ciclo-de-estudos/ciclo-de-estudos-para-concursos-pratica
- Alexander Meirelles — Manual do Concurseiro 9ª ed. (PDF): mentoriaconcursos.com.br
- Aprovado app — Google Play: play.google.com (app desde 2012)
- Deltinha — cronômetro e edital: deltinha.com.br (2026)
- MapasPro — como verticalizar edital: mapaspro.com.br/edital-verticalizado (2021)
- Decorando a Lei Seca — edital verticalizado: blog.decorandoaleiseca.com.br/edital-verticalizado (jul/2025)
- VoceConcursado — edital verticalizado: voceconcursado.com.br/blog/edital-verticalizado (2017)
- Demanda Concursos — TEC vs QC: demandaconcursos.com.br (jul/2025)
- Blog Provas Brasil — Anki para concursos: blog.provasbrasil.com.br/metodos-de-estudo/como-usar-anki-flashcards-concursos (out/2025)
- Blog Provas Brasil — Anki configuração 2026: blog.provasbrasil.com.br/metodos-de-estudo/configuracao-anki-concursos (set/2025)
- ZRMidia — repetição espaçada Anki 2026: zrmidia.com.br/repeticao-espacada-para-concursos-anki (abr/2026)
- GitHub LipeDevN/AnkiConcursoCards: github.com/LipeDevN/AnkiConcursoCards (jul/2025)
- Blog Provas Brasil — bullet journal concurseiros (jan/2026 e mai/2026)
- Pedagogia ao Pé da Letra — planner digital vs impresso: pedagogiaaopedaletra.com (mar/2026)
- Gran Cursos — ciclo de estudos: blog.grancursosonline.com.br/ciclo-de-estudos
- Proximos Concursos — Gran vs Estratégia: proximosconcursos.com/gran-cursos-ou-estrategia-qual-o-melhor
- Wixsite (planilha ciclo de estudos Alexandre Meirelles): brunodantasvs.wixsite.com/solucaoplanilhas

---

*Relatório gerado em 19/jun/2026. Conferência recomendada para preços e funcionalidades sujeitas a mudanças comerciais.*
