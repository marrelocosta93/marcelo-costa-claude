#!/bin/bash
# PostToolUse: lembretes a cada 5 e 10 edições

COUNTER_FILE="/tmp/claude-edit-counter-$$"
COUNT=1
[ -f "$COUNTER_FILE" ] && COUNT=$(($(cat "$COUNTER_FILE") + 1))
echo "$COUNT" > "$COUNTER_FILE"

[ $((COUNT % 5)) -eq 0 ] && echo "📝 $COUNT edições. Atualize session-state.json." >&2
[ $((COUNT % 10)) -eq 0 ] && echo "🔄 $COUNT edições. Re-leia task_plan.md." >&2
exit 0
