# Template — Novo Projeto

Use este template para gerar o CLAUDE.md de um novo projeto. Substitua os placeholders `{{...}}` pelos valores reais.

## CLAUDE.md Template

```markdown
# CLAUDE.md — {{PROJECT_NAME}}

> Este arquivo e carregado automaticamente pelo Claude Code.

---

## Visao Geral

**{{PROJECT_NAME}}** — {{PROJECT_DESCRIPTION}}

### Stack

| Camada | Tecnologia | Versao |
|--------|-----------|--------|
| {{STACK_LAYER_1}} | {{TECH_1}} | {{VERSION_1}} |
| {{STACK_LAYER_2}} | {{TECH_2}} | {{VERSION_2}} |
| {{STACK_LAYER_3}} | {{TECH_3}} | {{VERSION_3}} |

---

## Comandos Essenciais

# Desenvolvimento
{{DEV_COMMAND}}

# Build
{{BUILD_COMMAND}}

# Testes
{{TEST_COMMAND}}

# Lint
{{LINT_COMMAND}}

# TypeCheck (se aplicavel)
{{TYPECHECK_COMMAND}}

---

## Estrutura do Projeto

{{PROJECT_STRUCTURE}}

---

## Convencoes

### Naming
- {{NAMING_CONVENTION_1}}
- {{NAMING_CONVENTION_2}}
- {{NAMING_CONVENTION_3}}

### Padroes
- {{PATTERN_1}}
- {{PATTERN_2}}
- {{PATTERN_3}}

---

## Modulos

| Modulo | Descricao | Caminho |
|--------|-----------|---------|
| {{MODULE_1}} | {{DESC_1}} | {{PATH_1}} |
| {{MODULE_2}} | {{DESC_2}} | {{PATH_2}} |

---

## Banco de Dados

- **Engine**: {{DB_ENGINE}}
- **ORM/Client**: {{DB_CLIENT}}
- **Migrations**: {{MIGRATION_PATH}}
- **RLS**: Ativo em todas as tabelas

### Tabelas Principais
| Tabela | Descricao |
|--------|-----------|
| {{TABLE_1}} | {{TABLE_DESC_1}} |
| {{TABLE_2}} | {{TABLE_DESC_2}} |

---

## Variaveis de Ambiente

| Variavel | Obrigatoria | Descricao |
|----------|-------------|-----------|
| {{ENV_1}} | {{REQUIRED}} | {{ENV_DESC_1}} |
| {{ENV_2}} | {{REQUIRED}} | {{ENV_DESC_2}} |

---

## Quality Gates

| Gate | Criterio | Comando |
|------|----------|---------|
| Build | Sem erros | {{BUILD_COMMAND}} |
| TypeCheck | 0 erros | {{TYPECHECK_COMMAND}} |
| Lint | 0 erros | {{LINT_COMMAND}} |
| Tests | 0 falhas | {{TEST_COMMAND}} |

---

## Decisoes Arquiteturais

1. {{DECISION_1}}
2. {{DECISION_2}}
3. {{DECISION_3}}

---

## Gotchas

- {{GOTCHA_1}}
- {{GOTCHA_2}}
- {{GOTCHA_3}}

---

## Documentacao Relacionada

| Documento | Caminho |
|-----------|---------|
| PRD | docs/PRD.md |
| Arquitetura | docs/ARCHITECTURE.md |
| Changelog | CHANGELOG.md |
```

## Instrucoes

Ao usar `/template-novo-projeto`:
1. Pergunte ao usuario o nome e descricao do projeto
2. Pergunte a stack (frontend, backend, banco)
3. Preencha os placeholders com as respostas
4. Gere o CLAUDE.md na raiz do projeto
5. Ajuste os comandos e convencoes para a stack escolhida

