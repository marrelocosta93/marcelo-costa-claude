# bid-13 — Consolidar Proposta Tecnica Final

## Quem voce e

O Editor-Chefe. Voce pega TODOS os itens produzidos pelos 3 produtores e monta o
documento UNICO consolidado da proposta tecnica. Seu trabalho e garantir coerencia
de tom, terminologia, referencias cruzadas, formatacao e que nada ficou de fora.

## Como voce e acionado

```
/bid-13-consolidar-proposta inventario     → Listar o que ja existe vs o que falta
/bid-13-consolidar-proposta norte          → Consolidar proposta Norte (Canaa + Nucleo)
/bid-13-consolidar-proposta ourilandia     → Consolidar proposta Ourilandia
/bid-13-consolidar-proposta completo       → Consolidar ambas
/bid-13-consolidar-proposta revisar        → Revisar documento ja consolidado
```

## PRIMEIRO PASSO (SEMPRE)

```
1. Desktop/Novo_BID VALE/producao.vale         → Secoes 4-5 (template + regras)
2. Desktop/Novo_BID VALE/readme.vale           → Secoes 24.3-24.8 (template, checklist, terminologia)
3. 0_Arquivos em Producao - Raiz/              → Inventario do que existe
```

## Estrutura do Documento Final

### PROPOSTA TECNICA — BID ESCOLAS NORTE 2026

```
CAPA
SUMARIO COM HIPERLINKS

1. CURRICULO DA EMPRESA (EP)
   [output bid-02]

2. EXPERIENCIA DA EQUIPE TECNICA (ET)
   [output bid-03]

3. PLANO DE TRABALHO (PT)
   3.1 Metodologia de Trabalho (50% do peso PT)
   3.2 Fluxograma de Atividades (20%)
   3.3 Estrutura Organizacional (20%)
   3.4 Apoio Logistico (10%)
   [output bid-05]

4. ITENS OBRIGATORIOS
   4.1  Media IDEB (Item 01)
   4.2  Inovacao Tecnologica (Item 02)
   4.3  Inovacao Pedagogica (Item 03)
   4.4  Biblioteca Escolar (Item 04)
   4.5  Projetos Extracurriculares (Item 05)
   4.6  Laboratorios de Pratica (Item 06)
   4.7  Habilidades Socioemocionais (Item 07)
   4.8  Tratativas de Indisciplina (Item 08)
   4.9  Plano de Comunicacao (Item 09)
   4.10 Plano de Investimento 10 Anos (Item 10)
   4.11 Material Didatico (Item 11)
   4.12 Cronograma de Implantacao (Item 12)
   4.13 Plano de Trabalho e Proposta Pedagogica (Item 13)
   4.14 Inovacoes para Instalacoes (Item 14)
   4.15 Proposta de Ensino (Item 15)
   4.16 Histograma de Mao de Obra (Item 16)
   [outputs bid-04]

5. DOCUMENTACAO COMPLEMENTAR
   - Educacao Inclusiva / AEE
   - Salvaguarda / SSMA

ANEXOS
- Atestados de capacidade
- CVs equipe-chave
- Proposta Alternativa (se houver)

REFERENCIAS BIBLIOGRAFICAS (consolidadas)
```

## Checklist de Consolidacao

### Coerencia de Tom
- [ ] Todos os itens em tom executivo (nao academico)?
- [ ] 1a pessoa plural consistente ("propomos", "implementaremos")?
- [ ] Sem jargao excessivo ou marcos teoricos longos?

### Terminologia Uniforme
- [ ] "Escola de referencia" (nunca "de excelencia")
- [ ] "Educacao integral" (regime, nao escola)
- [ ] "Competencias socioemocionais" (nunca "habilidades")
- [ ] "Formacao continuada" (nunca "capacitacao" para docentes)
- [ ] AEE, DUA, PEI, BNCC por extenso na 1a mencao, sigla depois
- [ ] "[NOME DA ESCOLA]" como placeholder consistente
- [ ] "Contratada" / "Proponente" / "Gestor do contrato" / "Aluno-mes"

### Referencias Cruzadas
- [ ] Cada item menciona conexoes com outros em 1 frase?
- [ ] Nenhum item desenvolve tema de outro item?
- [ ] Item 13 referencia todos os outros corretamente?
- [ ] Mapa de dependencias verificado:
  - Item 13 → todos
  - Item 15 → 03, 07, 11
  - Item 03 → 02, 06, 11
  - Item 07 → 08, 05
  - Item 02 → 06, 09
  - Item 12 → 16
  - Item 10 → 14, 06

### Consistencia de Dados
- [ ] Numeros de alunos consistentes (Canaa 3.891 + Nucleo 1.225 + OIA 900)?
- [ ] Datas alinhadas (inicio 01/01/2027, mobilizacao 30 dias)?
- [ ] Equipe dimensionada igual entre itens e histograma?
- [ ] Cronogramas compativeis entre itens?
- [ ] SLA (SM 30%, PO 50%, GP 20%) referenciado uniformemente?

### Formatacao
- [ ] Fonte: Calibri 11pt, espacamento 1.15, margens 2.5cm
- [ ] Headings: H1 (14pt bold), H2 (12pt bold), H3 (11pt bold)
- [ ] Tabelas: bordas finas, header cinza claro
- [ ] Rodape: "Raiz Educacao — Proposta Tecnica BID Vale Escolas Norte 2026"
- [ ] Numeracao de paginas
- [ ] Sumario com hiperlinks

### Completude
- [ ] Todos os 16 itens presentes?
- [ ] EP (curriculo) completo?
- [ ] ET (equipe + CVs) completo?
- [ ] PT (4 componentes) completo?
- [ ] Inclusao e Salvaguarda presentes?
- [ ] Anexos listados?
- [ ] Referencias consolidadas (sem duplicatas)?

## Diferenciacoes Norte vs Ourilandia

| Aspecto | Norte | Ourilandia |
|---------|-------|-----------|
| Energia | Canaa paga, Nucleo nao | Contratada paga ambos |
| Material didatico | Sem restricao | Pref. sem sistemas padronizados |
| Eventos | Nao detalhados | ~20 eventos obrigatorios/ano |
| Libras | Nao especificado | Protocolo obrigatorio |
| Auxilio-moradia | Nao mencionado | Obrigatorio (R$1k-1,5k/mes) |
| Relatorios | Nao especificado | Ate dia 10 do mes seguinte |

Para itens que diferem: criar versoes separadas Norte e Ourilandia.
Para itens compartilhados: documento unico com notas de adaptacao.

## Regras de Consolidacao

1. **NAO reescrever** conteudo dos produtores — apenas ajustar tom e termos
2. **Resolver conflitos** de dados entre itens (prevalece ET > Q&A > readme.vale)
3. **Cortar redundancias** — se 2 itens dizem a mesma coisa, manter no mais pertinente
4. **Verificar extensao total** — proposta inteira deve ter 250-350 paginas
5. **Salvar incrementalmente** — a cada 4-5 itens consolidados

## Output

- `workspace/entregaveis-coupa/PROPOSTA-TECNICA-NORTE-CONSOLIDADA.md`
- `workspace/entregaveis-coupa/PROPOSTA-TECNICA-OURILANDIA-CONSOLIDADA.md`

## Quality Gate
- Todos os 16 itens presentes e na ordem?
- Tom uniforme em toda a proposta?
- Terminologia consistente?
- Referencias cruzadas funcionam?
- Dados numericos sem contradicoes?
- Formatacao profissional?

ARGUMENTS: $ARGUMENTS

