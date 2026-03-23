# Protocol — Handoff

Como transferir controle entre skills de forma controlada.

## Quando Fazer Handoff

Uma skill faz handoff quando:

1. Completou sua tarefa com sucesso
2. Nao e a skill adequada para o proximo passo
3. O workflow define a proxima skill
4. Encontrou um erro fora de seu escopo

## Como Fazer Handoff

### 1. Atualizar Session State

```json
{
  "status": "handoff",
  "currentSkill": "construir",
  "nextSuggested": "testar",
  "completedSteps": ["projetar", "planejar", "construir"],
  "handoffContext": "Codigo implementado em src/features/auth/. Falta testar.",
  "lastUpdate": "2026-02-19T10:30:00Z"
}
```

### 2. Documentar o que Foi Feito

No `notes` do session-state ou em `findings.md`, registrar:

- O que foi criado/modificado
- Arquivos tocados
- Decisoes tomadas e justificativas
- Pontos de atencao para a proxima skill

### 3. Nao Duplicar Trabalho

A proxima skill deve:

- Ler o session state antes de comecar (pre-flight)
- Nao refazer o que ja foi feito
- Construir sobre o trabalho anterior

## Handoff de Erro

Quando uma skill encontra um problema fora de seu escopo:

```json
{
  "status": "handoff",
  "currentSkill": "construir",
  "nextSuggested": "depurar",
  "handoffContext": "Erro de runtime em auth.service.ts. Stack trace em errors-log.",
  "handoffReason": "error"
}
```

## Regras

1. **Sempre atualizar session-state** antes de encerrar
2. **Contexto suficiente** para a proxima skill nao precisar perguntar
3. **Nao pular skills** do workflow sem motivo documentado
4. **Falha 2x no mesmo passo = escalar** para o usuario
5. **Nunca perder trabalho** — salvar progresso antes de transicionar

