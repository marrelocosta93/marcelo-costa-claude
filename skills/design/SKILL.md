---
description: "Especificar solução técnica e criar plano de execução. Transformar requisitos em spec técnica e quebrar em tarefas. Interfaces, fluxos, schemas, edge cases, task_plan.md."
---

# Skill: Design (Especificar + Planejar)

## Quando Ativar
- Antes de implementar feature não-trivial
- Quando pedido para "planejar", "especificar", "projetar"

## Fase 1: Especificação

### Entrevista (features maiores)
Antes de especificar, entrevistar o usuário sobre: implementação técnica, UX, edge cases, tradeoffs.

### Componentes da Spec
1. Interface do componente (inputs, outputs, comportamento)
2. Fluxos de usuário (happy path + error paths)
3. Estrutura de dados (schemas, tipos)
4. Edge cases (lista explícita com tratamento)
5. Escopo (DENTRO e FORA)
6. Dependências (o que precisa existir antes)

### Usar Ralph Loop (max 3 iterações)

## Fase 2: Plano de Execução → task_plan.md

```markdown
# Task Plan: [Nome da Feature]

## Objetivo
[Uma frase clara]

## Tarefas

### Fase 1: [Nome] (estimativa: Xmin)
- [ ] 1.1 [Tarefa atômica] → arquivo(s)
- [ ] 1.2 [Tarefa atômica] → arquivo(s)
- [ ] Checkpoint: [verificação]

### Fase 2: [Nome] (estimativa: Xmin)
- [ ] 2.1 [Tarefa atômica] → arquivo(s)
- [ ] Checkpoint: [verificação]

## Critérios de Done
- [ ] Todos os checkpoints passam
- [ ] Testes existem e passam
- [ ] Sem stubs/TODOs | Lint/typecheck limpos

## Riscos
- [Risco]: [mitigação]
```

### Regras do Plano
- Tarefas atômicas (cada uma compila)
- Checkpoints verificáveis por fase
- Mais arriscado primeiro (fail fast)
- Plano é living document — atualize durante implementação
