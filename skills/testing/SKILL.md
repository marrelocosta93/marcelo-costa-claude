---
description: "Criar testes unitários e de integração provando que código funciona E falha corretamente. NÃO para E2E — use e2e-testing."
---

# Skill: Testing (Unit + Integration)

## TDD com AI
1. Escrever testes ANTES da implementação
2. Confirmar que testes FALHAM
3. Commitar testes separadamente
4. Implementar até passarem
5. NUNCA modificar testes durante implementação

## O Que Testar
- Happy path | Error path | Edge cases | Integration (componentes juntos, DB real)

## NÃO testar: condições do type checker, getters triviais, libs de terceiros, E2E com browser

## Checklist por Teste
- Inputs parametrizados (sem magic numbers)
- Descrição coincide com asserção expect
- Asserções fortes (`toEqual` não `toBeGreaterThanOrEqual`)
- Edge cases: strings vazias, arrays vazios, limites

## Organização
- Unit: `*.spec.ts` no mesmo diretório
- Integration: `*.integration.ts` separado (não mocka DB)
- Property-based: `fast-check` para invariantes

## ★ Registrar falhas em `docs/ai-state/errors-log.md`
