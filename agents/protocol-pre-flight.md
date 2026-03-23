# Protocol — Pre-Flight

Checklist obrigatorio antes de executar qualquer skill.

## Passos

### 1. Verificar Session State

```
.agents/.context/session-state.json existe?
├── SIM → Ler e avaliar status
│   ├── "in_progress" → Trabalho em andamento, perguntar se retoma
│   ├── "handoff"     → Ultima skill terminou, proxima sugerida
│   ├── "completed"   → Sessao encerrada, pode comecar nova
│   └── "blocked"     → Precisa de acao externa, verificar motivo
└── NAO → Sem historico, prosseguir normalmente
```

### 2. Verificar Logs de Erro

Se `.agents/.context/errors-log.md` existir:

- Ler erros recentes (ultimas 48h)
- Evitar repetir os mesmos erros
- Considerar solucoes ja tentadas
- Se o mesmo erro aparece 2+ vezes sem solucao → escalar para usuario

### 3. Verificar Findings

Se `.agents/.context/findings.md` existir:

- Ler pesquisas/descobertas anteriores
- Nao repetir trabalho ja feito
- Usar contexto acumulado para decisoes

### 4. Confirmar Objetivo e Escopo

- O objetivo esta claro? Se nao, perguntar ao usuario
- O escopo esta definido? (quais arquivos, quais modulos)
- A skill correta foi selecionada para a tarefa?
- O workflow do orquestrador foi seguido?

### 5. Verificar Ambiente

- O projeto tem `package.json` / `requirements.txt`?
- Dependencias estao instaladas?
- Variaveis de ambiente necessarias existem?

## Quando Abreviar

O pre-flight pode ser abreviado quando:

- O usuario chamou a skill diretamente (sabe o que quer)
- A tarefa e trivial (< 5 min)
- E uma continuacao imediata (mesma sessao, mesmo contexto)
- O usuario explicitamente pediu para pular

