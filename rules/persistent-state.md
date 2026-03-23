---
description: "Regras de persistência de estado em disco durante trabalho"
paths:
  - "**/*"
---

# Protocolo de Estado Persistente

## Princípio Manus
Context Window = RAM (volátil). Filesystem = Disco (persistente).
Tudo importante vai pro disco DURANTE o trabalho, não no final.

## Regra dos 5 Actions
A cada 5 tool calls (edições, leituras, comandos), PARE e:
1. Atualize `docs/ai-state/session-state.json` com progresso atual
2. Se fez pesquisa/leitura → atualize `docs/ai-state/findings.md`
3. Se encontrou erro → atualize `docs/ai-state/errors-log.md`
4. Se completou item do plano → marque no task_plan.md

## Regra de Re-Leitura
A cada 10 tool calls, PARE e:
1. Re-leia o plano sendo seguido (task_plan.md ou SPEC.md)
2. Pergunte: "O que falta fazer?"
3. Se desviou do plano → corrija o curso
4. Se o plano precisa mudar → atualize o plano primeiro, depois continue

## Formato session-state.json
```json
{
  "last_updated": "ISO-8601",
  "agent_active": "ag-03-construir-codigo",
  "task_description": "O que está sendo feito",
  "progress": {
    "completed": ["item 1", "item 2"],
    "in_progress": "item atual",
    "remaining": ["item 3", "item 4"]
  },
  "files_modified": ["path/to/file1.ts"],
  "context_tokens_at_save": 45000,
  "notes": "Contexto importante para próxima sessão"
}
```

## Recuperação de Sessão
Quando detectar sessão anterior (session-state.json existe e tem dados recentes):
1. Ler session-state.json → entender onde parou
2. Ler errors-log.md → saber o que já falhou
3. Ler findings.md → ter contexto sem refazer pesquisa
4. Verificar `git log --oneline -10` → o que mudou desde último estado
5. Oferecer: "Encontrei sessão anterior. [resumo]. Retomar?"

## Context Reset Protocol
Quando contexto atingir ~60k tokens:
1. Salvar estado completo em session-state.json
2. Registrar `context_tokens_at_save`
3. Sugerir `/clear` ao usuário
4. Após clear, ler estado salvo e continuar de onde parou
