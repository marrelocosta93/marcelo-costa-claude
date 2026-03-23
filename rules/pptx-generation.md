# PPTX Generation — 13 Regras OOXML

## Regras Inviolaveis (cada uma causou bug real)

### 1. solidFill ANTES de latin/cs
```python
# CORRETO: insert(0, ...) garante posicao correta
rPr.insert(0, solidFill_element)

# ERRADO: SubElement coloca no final — PowerPoint ignora, texto fica PRETO
etree.SubElement(rPr, solidFill)
```

### 2. Background em cSld, NUNCA em sld
Background de slide deve ser inserido no elemento `cSld`, nao no `sld` raiz.

### 3. Fonte explicita em TODOS os runs
Todo run de texto DEVE ter fonte com `latin` E `cs` explícitos.
Fontes recomendadas para PT-BR (suporte completo a acentos):
- **Calibri** (padrão corporativo brasileiro, excelente suporte PT-BR)
- **Montserrat** (moderna, muito usada em apresentações profissionais BR)
- **Open Sans** (leitura fácil, boa em projeções)
- Arial como fallback apenas se necessário

### 4. Ghost text = " " (espaco), NUNCA string vazia
Placeholders que devem ficar vazios: setar texto como `" "` (um espaco).
String vazia faz o PowerPoint mostrar "Clique para editar...".

### 5. Text ANTES de reorder, design DEPOIS
Ao reconstruir slides composicionais:
1. Inserir todo o texto/conteudo primeiro
2. Aplicar reorder (z-order) depois
3. Aplicar design visual (sombras, gradientes) por ultimo

### 6. extract_slide_texts() ANTES de clear_slide_shapes()
Ao refazer slide existente, SEMPRE extrair texto antes de limpar shapes.

### 7. NUNCA deletar image placeholder
Mover off-screen (x=-10000, y=-10000). Deletar causa erro de reparo.

### 8. Subtitle em placeholder idx=10: max 9pt
Fontes maiores causam sobreposicao com titulo.

### 9. force_font_on_all_runs como final pass
Antes de salvar, iterar TODOS os slides/shapes/paragraphs/runs e garantir fonte explicita.

### 10. NUNCA truncar titulos
Se titulo e longo, reduzir tamanho da fonte (min 14pt). NUNCA cortar o texto.

### 11. Contraste minimo
Texto escuro em fundo escuro = invisivel. Verificar combinacoes.

### 12. Margins e padding consistentes
Cards: margin 12pt. Textboxes: min 0.5" das bordas do slide.

### 13. Diagnostico do template (para PPTX existente)
Antes de editar, mapear TODOS os layouts e placeholders.

### 14. lang="pt-BR" em TODOS os runs (CRÍTICO para acentos)
Sem o atributo `lang`, o PowerPoint não sabe o idioma e pode corromper acentos.

```python
def force_ptbr_on_all_runs(prs):
    """SEMPRE chamar antes de prs.save(). Garante PT-BR em toda a apresentação."""
    from lxml import etree
    for slide in prs.slides:
        for shape in slide.shapes:
            if shape.has_text_frame:
                for para in shape.text_frame.paragraphs:
                    for run in para.runs:
                        rPr = run._r.get_or_add_rPr()
                        rPr.set('lang', 'pt-BR')
                        rPr.set('altLang', 'en-US')

# Uso obrigatório antes de salvar:
force_ptbr_on_all_runs(prs)
prs.save('arquivo.pptx')
```

### 15. Fonte com suporte PT-BR completo
Preferência de fontes (melhor suporte a acentos PT-BR):
1. **Calibri** — padrão Microsoft, excelente PT-BR
2. **Montserrat** — moderna, muito usada em corporativo BR
3. **Open Sans** — leitura fácil em projeções
4. Arial — fallback aceitável

```python
# Correto: sempre definir latin + cs com typeface explícito
def set_run_font_ptbr(run, font_name='Calibri', size_pt=16):
    from pptx.util import Pt
    from lxml import etree
    rPr = run._r.get_or_add_rPr()
    rPr.set('lang', 'pt-BR')
    rPr.set('altLang', 'en-US')
    # latin (script latino — cobre PT-BR)
    latin = etree.SubElement(rPr, '{http://schemas.openxmlformats.org/drawingml/2006/main}latin')
    latin.set('typeface', font_name)
    # cs (complex script — fallback)
    cs = etree.SubElement(rPr, '{http://schemas.openxmlformats.org/drawingml/2006/main}cs')
    cs.set('typeface', font_name)
    run.font.size = Pt(size_pt)
```

### 16. Formatação numérica PT-BR
- Moeda: `R$ 1.234,56` (ponto milhar, vírgula decimal)
- Data: `DD/MM/AAAA` (nunca MM/DD/YYYY)
- Percentual: `12,5%` (vírgula decimal)

```python
def fmt_moeda(v): return f"R$ {v:,.2f}".replace(",","X").replace(".",",").replace("X",".")
def fmt_data(dt): return dt.strftime("%d/%m/%Y")
def fmt_pct(v):   return f"{v:.1f}%".replace(".", ",")
```

## Library de Componentes

Usar `~/.claude/lib/pptx_components.py`:
```python
import sys, os
sys.path.insert(0, os.path.expanduser('~/.claude/lib'))
from pptx_components import (
    add_badge, add_card, add_banner, add_quote_box,
    add_hline, add_vbar, add_textbox_styled, add_accent_underline,
    add_numbered_item, add_section_divider, add_section_divider_rich,
    add_card_grid_2x2, add_column_cards, add_footer_bar,
    add_table_styled, add_two_column_compare, add_timeline,
    extract_slide_texts, clear_slide_shapes,
    validate_variety, check_overlap, check_accents
)
```
