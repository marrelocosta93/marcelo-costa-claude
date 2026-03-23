---
description: "Deploy controlado com smoke test e rollback. Pré-condições, build, deploy, verificação, monitoring pós-deploy."
---

# Skill: Deploy + Monitoring

## Pré-condições (TODAS obrigatórias)
- Testes passam | Audit sem críticos | Código versionado | Migrações prontas | Env vars configuradas

## Fluxo: Verificar → Build → Deploy staging → Smoke test → Deploy prod → Smoke test → Monitoring
Se smoke test falha → rollback automático.

## Monitoring Pós-Deploy (2h)
Error rate | Latência P50/P95/P99 | Logs (novos padrões?) | Recursos (CPU/mem/disk) | Health endpoints
