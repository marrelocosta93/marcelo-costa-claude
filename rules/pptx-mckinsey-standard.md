# PPTX McKinsey Standard — Qualidade Visual

## Design System (obrigatorio antes de gerar)

Toda apresentacao DEVE definir paleta + tokens antes de qualquer codigo:
```python
PALETTE = {
    'primary': 'HEXCOR', 'secondary': 'HEXCOR', 'dark': 'HEXCOR',
    'light': 'HEXCOR', 'accent': 'HEXCOR',
    'text_dark': '333333', 'text_mid': '666666', 'text_light': '999999',
    'danger': 'E74C3C', 'success': '27AE60',
}
```
Apresentar ao usuario e esperar aprovacao ANTES de gerar.

## Variety Calendar

### Minimos obrigatorios de tipos de layout
| Total slides | Min tipos |
|-------------|-----------|
| 5-10        | 3         |
| 11-20       | 5         |
| 21-35       | 7         |
| 36-50       | 9         |
| 50+         | 10+       |

### Regra dos 2 consecutivos
NUNCA o mesmo tipo de layout mais que 2 slides seguidos.

### Catalogo de layouts
| ID | Layout | Quando usar |
|----|--------|-------------|
| A  | Capa | Primeiro slide |
| B  | Agenda com badges | Segundo slide |
| C  | Section divider (split rico) | Transicao entre secoes |
| D  | Grid 2x2 com cards | 3-4 pontos paralelos |
| E  | Grid 3x colunas | 3 categorias |
| F  | Numbered list | Processos, steps |
| G  | Tabela styled | Dados tabulares |
| H  | Quote box standalone | Citacao de impacto |
| I  | Two-column compare | Pode/Nao pode, Antes/Depois |
| J  | Timeline/Roadmap | Fases, cronograma |
| K  | Template serie | Slides repetitivos (cargos, produtos) |
| L  | KPI dashboard | Numeros grandes + labels |

## Ratio Composicional
- Minimo 70% dos slides devem usar componentes composicionais
- Validar com `validate_variety(prs)`

## Quote Boxes
- 1 quote a cada 5-7 slides, SEMPRE com atribuicao
- NUNCA no topo do slide, NUNCA 2 consecutivas

## Section Dividers
- SEMPRE usar `add_section_divider_rich()` com conteudo no painel direito
- 3 modos: topics, numbers, context
- NUNCA painel direito vazio

## Contraste e "O QUE NAO FAZ"
Incluir secao negativa em slides de role/feature/conceito.

## Acentuacao PT-BR
Todo texto DEVE usar acentuacao correta. Validar com `check_accents(prs)`.

## Fonte Minima (REGRA PRINCIPAL — Apogeu v3)
- **16pt** e o minimo absoluto para todo conteudo visivel
- Inclui: tabelas, badges, labels, insights, cards, takeaway
- Excecao unica: footer (10pt) — elemento estrutural
- Se o conteudo nao cabe com 16pt, dividir em 2 slides — NUNCA reduzir a fonte

## Footer Simplificado (Apogeu v3)
- Apenas contexto (nome da apresentacao) em 10pt text_light, alinhado a esquerda
- **REMOVIDO**: titulo central "Apogeu Global School"
- **REMOVIDO**: numero de pagina (inconsistente com section dividers)

## Tabelas — Dimensionamento com 16pt
- Cada linha de tabela com fonte 16pt precisa de **0.38-0.40"** de altura
- Formula: altura_tabela = (num_linhas_dados + 1) x 0.40"
- Se mais de 10 linhas: dividir em 2 colunas lado a lado
- Se mais de 16 linhas: dividir em 2 slides

## Checklist Pre-Entrega
- [ ] Design system consistente em TODOS os slides
- [ ] Fonte minima 16pt em todo conteudo (exceto footer)
- [ ] Footer simplificado (apenas contexto, sem titulo central, sem pagina)
- [ ] Variety calendar respeitado
- [ ] Ratio composicional >= 70%
- [ ] Section dividers com conteudo
- [ ] Zero ghost text, zero sobreposicao
- [ ] Fontes explicitas em todos os runs
- [ ] Acentuacao PT-BR correta
- [ ] Tabelas dimensionadas para 16pt (0.40" por linha)
- [ ] Validacao tecnica + McKinsey com 0 erros
