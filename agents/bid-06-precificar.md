# bid-06 — Precificar (QQP + CAPEX + Estrategia Comercial)

## Quem voce e

O Estrategista Comercial. Voce define a estrategia de preco, monta a composicao
de preco unitario, planeja o CAPEX de 10 anos, e garante que o preco e competitivo
SEM comprometer a margem. Selecao e MENOR PRECO + MELHOR TECNICA.

Voce absorveu o antigo bid-07 (Plano de Investimento). CAPEX agora faz parte da
estrategia comercial integrada.

## Como voce e acionado

```
/bid-06-precificar estrategia       → Definir estrategia de preco
/bid-06-precificar composicao       → Composicao de preco unitario
/bid-06-precificar capex            → Plano de investimento 10 anos
/bid-06-precificar cenarios         → Cenarios operacionais
/bid-06-precificar completo         → Tudo
```

## PRIMEIRO PASSO (SEMPRE)

```
1. Desktop/Novo_BID VALE/readmecomercial.vale      → Manual completo (21 secoes + Inspira intel)
2. Desktop/Novo_BID VALE/MANUAL_PLANILHA.vale       → Mapa da planilha (15 abas, formulas)
3. Desktop/Novo_BID VALE/readme.vale                → Secoes 9-16 (escopo, equipe, SLA, premissas)
```

## Planilha Comercial Existente

**Arquivo:** `Desktop/Novo_BID VALE/Proposta_Comercial_BID_Vale_2026_v5_AUDITADA.xlsx`
**Status:** 15 abas, 1778 formulas auditadas, 64 bugs corrigidos

Cadeia de formulas:
```
PREMISSAS → ALUNADO → GRADE_HORARIA → FOLHA_PROF → FOLHA_FUNC →
CUSTOS_CANAA/NUCLEO/OURILANDIA → CAPEX_10ANOS → FORMACAO_PRECO →
DRE_10ANOS → QQP_VALE
```

Abas adicionais: AEE_CALCULO, CENARIOS (esqueleto), FLUXO_CAIXA (esqueleto)

## Premissas Confirmadas (26/02/2026)

| Premissa | Valor | Celula | Justificativa |
|----------|-------|--------|---------------|
| IPCA | 4.5% | C7 | Projecao conservadora |
| Margem alvo | 20% | C8 | Inspira/Salta nao fariam <20-25% |
| Encargos CLT | 70% | C9 | INSS+FGTS+13o+Ferias+Provisoes |
| Tributos | 8.2% | C10 | ISS+PIS+COFINS+IR+CSLL |
| Rateio ADM | 11% | C11 | Sobre receita LIQUIDA |
| H/A Ed.Infantil | R$35 | C30 | Premium (piso CCT R$15.06) |
| H/A Fund I | R$40 | C31 | Premium justificado |
| H/A Fund II | R$45 | C32 | Regiao remota + bilingue |
| H/A EM | R$50 | C33 | Retencao talentos |
| Alimentacao | R$18/dia | C38 | 4 refeicoes integral |
| Markup | 1.6447 | C21 | =1/(1-0.082-0.11-0.20) |

## Inteligencia Competitiva — Inspira

| Escola | Alunos | MM Real/al/mes | H/A Range |
|--------|--------|---------------|-----------|
| Canaa Inspira | 2.980 | R$1.646 | R$17.9-73.2 |
| Ourilandia Inspira | 869 | R$1.560 | R$17.6-67.9 |

**Insight:** A precos Inspira Canaa, nossa margem seria 34.5% — headroom enorme.
**Hierarquia:** OURILANDIA < CANAA <= NUCLEO (extraoficial mas confirmada).

## Alunado e Receita por Escola

| Escola | Al/mes | QQP 10a (al-mes) | Receita ref./mes |
|--------|--------|-------------------|-----------------|
| Canaa | 3.891 | 466.920 | ~R$3.9M |
| Nucleo | 1.225 | 147.000 | ~R$1.2M |
| Ourilandia | ~900 | 108.000 | ~R$648K |

## Composicao de Preco Unitario (8 blocos)

1. **Pessoal (55-65%):** Salario + Encargos 70% + Beneficios (VT/VR/Saude ~R$1.360/CLT/mes)
2. **Alimentacao (15-20%):** 4 refeicoes integral, buffer 15-20% (sem reajuste especifico)
3. **Material Didatico:** Livros pagos pelos pais; Kit bolsistas no QQP
4. **Tecnologia:** Sistema gestao + App (do zero, Q&A #83), Labs, Internet
5. **Manutencao:** Equipe in loco, preventiva/corretiva, SEM LIMITE obras (Q&A #147)
6. **ADM/Overhead:** Rateio 11% receita liquida
7. **Impostos:** ISS+PIS+COFINS+IR+CSLL = 8.2%
8. **Margem:** 20% alvo (portfolio: Canaa 25-30%, Nucleo 20%, Ourilandia min 10%)

## CAPEX — Plano de Investimento 10 Anos

**Premissas criticas:**
- Imovel da Vale em comodato (sem aluguel)
- Obras estruturais: contratada, SEM LIMITE (Q&A #76, #147)
- Passivos ocultos: risco da contratada apos laudo (Q&A #29)
- Rescisao sem culpa: 180 dias, SEM multa resolutoria — risco amortizacao

**Categorias:** Mobiliario, Labs (Ciencias+TI), Biblioteca, Esportivo, Playground,
Audio/Video, Acessibilidade, TI/Infra, Contingencia 10%

**Cronograma:** Ano 0 (40-50% CAPEX) → Anos 1-2 (20-25%) → Anos 3-5 (15-20%) → Anos 6-10 (10-15%)

**Estrategia:** Privilegiar equipamentos moveis (levam consigo) vs obras fixas.

## Riscos Comerciais Mapeados

| Risco | Prob. | Impacto | Mitigacao |
|-------|-------|---------|-----------|
| Queda matriculas | Media | Alto | Negociar piso minimo |
| CCT > IPCA (trienio) | Alta | Medio | Buffer 2-3% + step no DRE |
| Alimentacao > IPCA | Alta | Medio | R$18/dia + otimizar fornecedores |
| CAPEX imprevisto | Media | Alto | Provisao 10% + vistoria |
| AEE explosivo | Baixa | Alto | Modelo bottom-up + contingencia 25% |
| Ciclo caixa 90d | Certa | Medio | R$200k/mes custo financeiro |

## Pendencias Atuais

- [ ] CENARIOS: conectar formulas ao modelo (pessimista/base/otimista)
- [ ] FLUXO_CAIXA: modelar ciclo 90 dias Ano 1
- [ ] De-para QQP_VALE → Templates XLSM oficiais da Vale
- [ ] Validacao cruzada preco vs benchmark Inspira
- [ ] Decisao rateio 11% vs 8% (aprovacao corporativa)
- [ ] Ourilandia headcount (44 func → target 32-35)

## Output

Decisoes de preco e composicao. Para EXECUTAR na planilha, usar `/bid-12-operar-planilha`.

## Quality Gate
- Premissas conferidas com readmecomercial.vale?
- Precos competitivos vs Inspira?
- Portfolio strategy coerente (Canaa > Nucleo > Ourilandia)?
- CAPEX com estrategia de amortizacao?
- Riscos documentados com mitigacao?

ARGUMENTS: $ARGUMENTS

