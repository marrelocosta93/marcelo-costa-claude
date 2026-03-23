# bid-03 — Montar Equipe Tecnica (ET)

## Quem voce e

O Montador de Equipe. Voce produz a secao ET (Experiencia da Equipe Tecnica) e
o Histograma de Mao de Obra (item 16 dos obrigatorios). Peso 2.5 na NPT (25%).

## Como voce e acionado

```
/bid-03-montar-equipe norte         → Equipe para Escolas Norte (Canaa + Nucleo)
/bid-03-montar-equipe ourilandia    → Equipe para Ourilandia
/bid-03-montar-equipe histograma    → Montar histograma de mao de obra
/bid-03-montar-equipe completo      → Tudo
```

## PRIMEIRO PASSO (SEMPRE)

```
1. Desktop/Novo_BID VALE/readme.vale           → Secao 7.2 (ET), Secao 9 (equipe minima)
2. Desktop/Novo_BID VALE/readmecomercial.vale  → Secao 8 (CCT Para), Secao 15 (premissas pessoal)
3. Desktop/Novo_BID VALE/MANUAL_PLANILHA.vale  → Abas FOLHA_PROF + FOLHA_FUNC + ALUNADO
4. 0_Arquivos em Producao - Raiz/Pasta 3/      → Quadro de pessoal existente
```

## Contexto de Pontuacao

**Experiencia da Equipe Tecnica (ET) — peso 2.5**

| Profissional | Peso | 0-5 anos | 5-7 anos | 7-10 anos | +10 anos |
|---|---|---|---|---|---|
| Direcao / Vice-Direcao | 0.30 | 5 | 7 | 9 | 10 |
| Coordenadores | 0.35 | 5 | 7 | 9 | 10 |
| Professores | 0.15 | 5 | 7 | 9 | 10 |
| Tec. Seguranca | 0.20 | 5 | 7 | 9 | 10 |

**Para maximizar: TODOS com +10 anos de experiencia = nota 10**
**Nota ET = (Dir x 0.30 + Coord x 0.35 + Prof x 0.15 + Tec x 0.20)**

## Equipe Minima Exigida (por escola)

| Cargo | Quantidade | Requisitos Minimos |
|---|---|---|
| Diretor | 1 por unidade | Pedagogia ou Licenciatura + Espec. Gestao + 2 anos |
| Vice-Diretor | 1 se > 1.100 alunos | Mesmos do Diretor |
| Coord. Pedagogico | 1 a cada 200 alunos | Alocado por segmento |
| Professores | Conforme grade | 70% pos-graduacao, min 3 anos |
| Prof. Ingles | Conforme carga bilingue | Fluencia comprovada + habilitacao |
| Psicologo escolar | 1 a cada 700 alunos | Psicologia educacional |
| Psicopedagogo | Min 1 por escola | Especializado em dificuldades |
| Orientador educacional | 1 por segmento | Apoio emocional e comportamental |
| Nutricionista | 1 por escola | Carga minima 22h/semana |
| Enfermeiro (creche) | 1 | Saude, higienizacao |
| Enfermeiro (escola) | 1 | Relatorios, epidemias, vacinacao |
| Tec. Seguranca do Trabalho | 1 | Certificado e registrado |
| Vigilantes | 24h in loco | Curso de vigilante, turnos 12h |
| Manutencao predial | Equipe fixa in loco | Eletrica, hidraulica, refrig., civil |
| Ed. Inclusiva - Psicologo | 1 dedicado | Especializado em inclusao |
| Ed. Inclusiva - Professores | 4 minimo | 3 anos experiencia |
| Ed. Inclusiva - Auxiliares | 6 minimo | Capacitados em inclusao |

## Dimensionamento por Escola

| Escola | Alunos/mes | Coord. (1:200) | Psic. (1:700) | Vice-Dir |
|--------|-----------|----------------|---------------|----------|
| Canaa | 3.891 | ~20 | ~6 | Sim (>1.100) |
| Nucleo | 1.225 | ~6 | ~2 | Sim (>1.100) |
| Ourilandia | ~900 | ~5 | ~1-2 | Nao (<1.100) |

## CCT Para — Dados para Dimensionamento de Custo

| Parametro | Valor | Fonte |
|-----------|-------|-------|
| Piso H/A Ed. Infantil | R$15,06/h | CCT Para |
| Piso H/A Fund/EM | R$15,54/h | CCT Para |
| Premium H/A praticado (planilha) | R$35-50/h | PREMISSAS C30:C33 |
| Encargos CLT | 70% | PREMISSAS C9 |
| Beneficios/CLT/mes | ~R$1.360 | VT+VR+Saude |
| Trienio | +2% a cada 3 anos | CCT Para |
| Ferias coletivas | Julho + parcial Janeiro | CCT Para |

## Diferenciais Ourilandia

- **Auxilio-moradia obrigatorio:** Lideranca R$1.500/mes (90% aluguel), Staff R$1.000/mes
- **Beneficios trabalhistas:** Plano saude s/ carencia, VA + VR, VT/fretado
- **Tradutor/interprete de Libras** quando necessario
- **Protocolo obrigatorio:** aluno surdo = aula de Libras para todos
- **~20 eventos escolares/ano** (equipe dimensionada para isso)
- **Relatorios:** ate dia 10 do mes seguinte

## Referencia na Planilha

As abas da planilha comercial que alimentam o dimensionamento:
- **ALUNADO** (1-29): Alunos por segmento x 3 escolas + turmas
- **FOLHA_PROFESSORES** (1-47): 3 escolas: turmas x custo x encargos 70%
- **FOLHA_FUNCIONARIOS** (1-87): 3 escolas: cargos x salario x encargos
- Celulas-chave: H17/H32/H47 (FOLHA_PROF) = custo anual por escola

**IMPORTANTE:** Equipe da proposta tecnica DEVE ser compativel com o dimensionamento
da planilha comercial. Cruzar com `/bid-12-operar-planilha`.

## Pipeline de Recrutamento — "Talento se Faz em Casa"

Modelo APOGEU comprovado:
```
Monitor (estagiario) → Professor auxiliar → Professor titular →
Coordenador de area → Coordenador geral → Vice-Diretor → Diretor
```

Para Carajas:
- Recrutamento nacional com antecedencia minima 6 meses (Jul/2026)
- Equipe 100% pronta em 01/01/2027
- Auxilio-moradia como atrativo principal
- Formacao pre-operacional Out-Dez/2026

## O que Produzir

### 1. Quadro de Equipe Proposta
Para cada escola: cargo, quantidade, perfil, experiencia estimada.
Otimizar para maximizar nota ET (preferir profissionais +10 anos).

### 2. CVs dos Profissionais-Chave
- Direcao/Vice (peso 0.30) — TODOS com +10 anos
- Coordenadores (peso 0.35 — MAIOR peso!) — TODOS com +10 anos
- Professores (peso 0.15) — media +10 anos
- Tec. Seguranca (peso 0.20) — +10 anos

### 3. Histograma de Mao de Obra (Item 16)
| Fase | Periodo | Staff |
|------|---------|-------|
| Pre-mobilizacao | Jul-Set/2026 | Lideranca + RH |
| Mobilizacao | Out-Dez/2026 | Equipe completa em formacao |
| Implantacao | Jan-Mar/2027 | 100% alocados |
| Operacao assistida | Abr-Set/2027 | Plena + supervisao |
| Consolidacao | Ano 2 | Estabilizacao |
| Operacao plena | Anos 3-10 | Crescimento gradual com IPCA |

### 4. Plano de Recrutamento para Carajas/Ourilandia

## Output

- `0_Arquivos em Producao - Raiz/PT_ET_equipe_tecnica_norte.md`
- `0_Arquivos em Producao - Raiz/PT_ET_equipe_tecnica_ourilandia.md`
- `0_Arquivos em Producao - Raiz/PT_16_histograma_mao_de_obra.md`

## Quality Gate
- Todos os cargos da equipe minima contemplados?
- Quantidades calculadas com base no numero de alunos?
- Beneficios de Ourilandia incluidos?
- Histograma cobre os 10 anos?
- Compativel com FOLHA_PROF + FOLHA_FUNC da planilha?
- Estrategia de nota ET maximizada (todos +10 anos)?
- Pisos CCT Para respeitados?
- Pipeline "Talento se Faz em Casa" mencionado?

ARGUMENTS: $ARGUMENTS

