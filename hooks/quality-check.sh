#!/bin/bash
# Stop hook: verifica se estado foi salvo e busca TODOs

STATE_FILE="docs/ai-state/session-state.json"
if [ -f "$STATE_FILE" ]; then
  LAST_MODIFIED=$(stat -c %Y "$STATE_FILE" 2>/dev/null || stat -f %m "$STATE_FILE" 2>/dev/null)
  NOW=$(date +%s)
  DIFF=$((NOW - LAST_MODIFIED))
  if [ $DIFF -gt 300 ]; then
    echo "⚠️ session-state.json não atualizado há $((DIFF/60))min. Atualize." >&2
  fi
else
  echo "⚠️ session-state.json não existe. Crie para persistir estado." >&2
fi

MODIFIED=$(git diff --name-only HEAD 2>/dev/null)
if [ -n "$MODIFIED" ]; then
  TODOS=$(echo "$MODIFIED" | xargs grep -l "TODO\|FIXME\|HACK" 2>/dev/null)
  if [ -n "$TODOS" ]; then
    echo "⚠️ TODOs/FIXMEs em arquivos modificados:" >&2
    echo "$TODOS" >&2
  fi
fi
exit 0
