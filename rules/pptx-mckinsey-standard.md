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

## PT-BR — Regras Obrigatórias

### 1. lang="pt-BR" em TODOS os rPr (CRÍTICO)
O atributo `lang` no OOXML diz ao PowerPoint qual idioma usar para renderização,
hifenização e correção ortográfica. SEM ELE, acentos podem sumir ou corromper.

```python
from lxml import etree

def set_run_lang_ptbr(run):
    """Aplicar lang PT-BR em um run. Chamar em TODOS os runs."""
    rPr = run._r.get_or_add_rPr()
    rPr.set('lang', 'pt-BR')
    rPr.set('altLang', 'en-US')

def force_ptbr_on_all_runs(prs):
    """Final pass: garantir lang PT-BR em toda a apresentação."""
    for slide in prs.slides:
        for shape in slide.shapes:
            if shape.has_text_frame:
                for para in shape.text_frame.paragraphs:
                    for run in para.runs:
                        set_run_lang_ptbr(run)
```

Chamar `force_ptbr_on_all_runs(prs)` ANTES de salvar — sempre.

### 2. Caracteres com Acento — Lista de Verificação

Verificar presença correta de:
- Agudos: á é í ó ú Á É Í Ó Ú
- Til: ã õ Ã Õ
- Circunflexo: â ê ô Â Ê Ô
- Cedilha: ç Ç
- Crase: à À
- Trema (importado): ü Ü

Erros comuns que indicam problema de encoding:
- `ã` aparece como `Ã£` → encoding errado (Latin-1 em vez de UTF-8)
- `ç` some → fonte sem suporte ao glifo
- Acento some no PDF export → `lang` não definido

### 3. Encoding Python — UTF-8 Explícito

```python
# CORRETO: string Python 3 é UTF-8 nativo
titulo = "Análise de Desempenho — Gestão Pedagógica"

# Se lendo de arquivo externo, sempre especificar encoding:
with open('conteudo.txt', encoding='utf-8') as f:
    texto = f.read()

# NUNCA fazer encode/decode desnecessário:
# ERRADO: texto.encode('latin-1').decode('utf-8')
```

### 4. Formatação Numérica BR

| Tipo | Formato PT-BR | Exemplo |
|------|---------------|---------|
| Moeda | R$ 1.234,56 | R$ 42.500,00 |
| Percentual | 12,5% | 87,3% |
| Data | DD/MM/AAAA | 15/03/2026 |
| Milhar | 1.000 | 2.450.000 |
| Decimal | vírgula | 3,14 |

```python
def format_moeda_br(valor: float) -> str:
    return f"R$ {valor:,.2f}".replace(",", "X").replace(".", ",").replace("X", ".")

def format_data_br(dt) -> str:
    return dt.strftime("%d/%m/%Y")
```

### 5. Texto Profissional PT-BR

- Tratamento formal: **"você"** (nunca "tu" em apresentações corporativas)
- Verbos no imperativo para CTAs: "Acesse", "Confira", "Saiba mais"
- Números por extenso até 10: "três etapas", "quatro pilares"
- Siglas brasileiras: MEC, SISU, BNDES, SEBRAE, SENAI sem artigo definido obrigatório
- Meses em minúsculo: "março de 2026", não "Março de 2026"

### 6. Validação PT-BR

```python
# Após gerar, sempre rodar:
check_accents(prs)           # verifica acentuação
force_ptbr_on_all_runs(prs) # garante lang="pt-BR"
```

Cheklist PT-BR obrigatório antes de salvar:
- [ ] `lang="pt-BR"` em todos os runs (`force_ptbr_on_all_runs`)
- [ ] Acentos corretos em todos os textos
- [ ] Datas no formato DD/MM/AAAA
- [ ] Valores monetários com R$ e vírgula decimal
- [ ] Fonte com suporte PT-BR (Calibri, Montserrat, Open Sans)
- [ ] ag-31 spell check rodado

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
