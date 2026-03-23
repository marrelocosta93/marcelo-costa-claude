---
description: "Explorar e analisar codebase existente. Mapear arquitetura, detectar stack, identificar padrões, dívida técnica e riscos. Usar quando precisar entender um projeto antes de modificá-lo."
---

# Skill: Discovery (Explorar + Analisar)

## Quando Ativar
- Primeiro contato com codebase desconhecido
- Antes de feature grande em área não-familiar
- Quando pedido para "entender", "mapear", "analisar" código

## Processo

### 1. Detecção de Stack
Verificar: package.json → Node.js | requirements.txt/pyproject.toml → Python | Cargo.toml → Rust | go.mod → Go | pom.xml/build.gradle → Java | docker-compose.yml → containers

### 2. Mapeamento de Estrutura
```bash
find . -maxdepth 2 -type d -not -path '*/node_modules/*' -not -path '*/.git/*' | head -50
find . -name "index.*" -o -name "main.*" -o -name "app.*" -o -name "server.*" | head -20
find . -name "*.config.*" -o -name ".*rc" -o -name "tsconfig*" | head -20
```

### 3. Análise de Padrões
Para cada área: consistência de padrões, dívida técnica (TODOs, FIXMEs, `any`, magic numbers), riscos arquiteturais (acoplamento, single points of failure), cobertura de testes, segurança superficial.

### 4. Output Incremental
★ **2-Action Rule**: a cada 2 arquivos/diretórios lidos, salvar em `docs/ai-state/findings.md`.

### 5. Produtos Finais
- `docs/ai-state/project-profile.json` — Stack, versões, dependências
- `docs/ai-state/codebase-map.md` — Mapa da arquitetura
- `docs/ai-state/findings.md` — Descobertas detalhadas

### Formato project-profile.json
```json
{
  "stack": {
    "language": "TypeScript",
    "runtime": "Node.js 20",
    "framework": "Next.js 14",
    "database": "PostgreSQL + Prisma",
    "testing": "Jest + Playwright",
    "ci": "GitHub Actions"
  },
  "conventions": {
    "style": "ESLint + Prettier",
    "commits": "Conventional Commits",
    "branching": "trunk-based"
  },
  "entry_points": ["src/app/layout.tsx", "src/app/api/"],
  "key_directories": {
    "src/components": "UI components",
    "src/lib": "Shared utilities",
    "src/app/api": "API routes"
  },
  "detected_issues": ["3 TODOs em auth module", "Sem testes em src/lib/utils"]
}
```
