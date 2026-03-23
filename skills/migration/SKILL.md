---
description: "Migração de dados e schema sem perder dados e sem downtime. Gerar migrações no ORM do projeto, validar reversibilidade."
---

# Skill: Migration

## Workflow: Planejar → Gerar (no ORM) → Validar (DOWN funciona?) → Testar em DB teste

## Zero-Downtime Pattern
1. Coluna nullable → 2. Backfill dados → 3. Set NOT NULL

## BLOQUEAR
| Operação | Solução |
|---|---|
| DROP COLUMN sem backup | Soft delete primeiro |
| ALTER TYPE com dados | Nova coluna → backfill → swap → drop |
| NOT NULL sem default em tabela populada | Nullable → backfill → alter |
| RENAME COLUMN em prod | Nova coluna → dual write → migrate reads → drop |
