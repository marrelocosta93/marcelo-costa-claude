# Marcelo Costa — Claude Code Agent System

Sistema completo de agentes, skills e governança para Claude Code.
Construído sobre a base do [a-gusman-claude](https://github.com/andregusman-raiz/a-gusman-claude), com extensões exclusivas para geração de documentos Office, licitações e automação educacional.

---

## Instalação

```bash
curl -fsSL https://raw.githubusercontent.com/marrelocosta93/marcelo-costa-claude/main/install.sh | bash
```

Ou manualmente:

```bash
git clone https://github.com/marrelocosta93/marcelo-costa-claude.git ~/.marcelo-claude
bash ~/.marcelo-claude/install.sh
```

O instalador clona o repositório, cria symlinks em `~/.claude/` e preserva seus arquivos existentes (`settings.json`, `memory/`, `projects/`).

---

## O que está incluído

### Agentes (67)

Organizados por categoria:

| Categoria | Prefixo | Função |
|-----------|---------|--------|
| Planning | `ag-P-*` | Iniciar, explorar, especificar, planejar |
| Building | `ag-B-*` | Construir, depurar, refatorar, otimizar |
| Quality | `ag-Q-*` | Validar, testar, revisar, auditar, QAT |
| Deploy | `ag-D-*` | Migrar, versionar, publicar, monitorar |
| Writing | `ag-W-*` | Documentar, gerar docs Office, organizar |
| Integration | `ag-I-*` | Due diligence, mapear, incorporar |
| Management | `ag-M-*` | Orquestrar, health check, criar agente |
| BID | `bid-*` | Pipeline completo de licitações |
| Protocols | `protocol-*` | Pre-flight, handoff |

### Skills (60+)

- Todas as skills de workflow (ag-00 a ag-38)
- `ui-ux-pro-max` — 67 estilos, 96 paletas, 57 tipografias
- `ag_skill-creator` — criação e avaliação de skills com evals
- Skills de padrões: Next.js, Supabase, TypeScript, Python

### Rules (40+)

Governança completa incluindo:
- `pptx-generation.md` — 13 regras OOXML para geração de apresentações
- `pptx-mckinsey-standard.md` — Padrão McKinsey com variety calendar
- `office-design-system.md` — Design system para documentos Office
- `xlsx-generation.md` — Geração de planilhas
- Todas as regras de workflow, segurança e qualidade

### Playbooks (11)

1. Spec Driven Development
2. Checklist de Projeto
3. Database First
4. Segurança By Design
5. Otimização de Custos IA
6. Desenvolvimento Paralelo
7. Quality Assurance
8. Gestão de Memória e Contexto
9. Integração de MCPs
10. Automação de Workflows
11. Incorporação de Software

### Library Python (`lib/`)

- `pptx_components.py` — Componentes reutilizáveis para PowerPoint (cards, badges, tabelas, timelines, etc.)
- `xlsx_components.py` — Componentes para planilhas Excel

### Hooks de Segurança (14)

Proteções automáticas: force push, --no-verify, config overwrite, secrets scan, branch guard, TDD guard, theatrical test detection, pre-build safety, deploy preflight.

---

## Diferenciais em relação ao a-gusman-claude

| Feature | a-gusman-claude | marcelo-costa-claude |
|---------|-----------------|---------------------|
| PPTX generation (13 regras OOXML) | — | ✅ |
| Padrão McKinsey para apresentações | — | ✅ |
| `pptx_components.py` (library) | — | ✅ |
| `xlsx_components.py` (library) | — | ✅ |
| Pipeline de licitações (BID) | — | ✅ |
| Agente analisar-reunião | — | ✅ |
| `ui-ux-pro-max` com CSVs completos | Parcial | ✅ |
| `ag_skill-creator` com eval system | — | ✅ |
| Hooks de segurança | 7 | 14 |

---

## Estrutura

```
marcelo-costa-claude/
├── README.md
├── CLAUDE.md           # Config global do workspace
├── install.sh          # Instalador via symlinks
├── settings.json       # Template de permissões e hooks
├── agents/             # 67 slash commands (/ag00, /bid-*, etc.)
├── skills/             # Skills com SKILL.md
├── rules/              # 40+ regras de governança
├── Playbooks/          # 11 playbooks estratégicos
├── lib/                # Python: pptx_components.py, xlsx_components.py
├── hooks/              # 14 hooks de segurança
├── shared/             # Recursos compartilhados
├── scripts/            # Utilitários
├── docs/               # Documentação
└── assets/             # Design system e assets
```

---

## Atualização

```bash
cd ~/.marcelo-claude && git pull
```

Ou reinstale — o script preserva seus arquivos locais.

---

## Desinstalar

```bash
bash ~/.marcelo-claude/install.sh --uninstall
```

---

## Licença

MIT — baseado no trabalho de [André Gusman](https://github.com/andregusman-raiz/a-gusman-claude).
