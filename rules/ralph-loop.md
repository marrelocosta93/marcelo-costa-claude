---
description: "Protocolo de refinamento iterativo para convergência de qualidade"
paths:
  - "docs/**/*"
  - "specs/**/*"
  - "**/*.spec.*"
  - "**/*.test.*"
---

# Protocolo Ralph Loop

## Ciclo CREATE → EVALUATE → REFINE (max 3 iterações)
1. **CREATE**: Produza primeira versão
2. **EVALUATE**: Avalie contra critérios definidos
3. **REFINE**: Melhore baseado na avaliação

## Regras
- **Track best, not latest** — se v3 piorou vs v2, use v2
- **Promessa de completude** — declare O QUE entrega, COMO avalia, QUANDO está pronto
- **Verification-first** — reproduza o problema ANTES de corrigir. Meça ANTES de otimizar
