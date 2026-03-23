#!/bin/bash
# PreToolUse: bloqueia commit se testes falham

if [ -f "package.json" ]; then
  HAS_TEST=$(node -e "const p=require('./package.json'); console.log(p.scripts&&p.scripts.test?'yes':'no')" 2>/dev/null)
  if [ "$HAS_TEST" = "yes" ]; then
    npm test --silent 2>/dev/null
    [ $? -ne 0 ] && echo "❌ BLOQUEADO: Testes falhando." >&2 && exit 2
  fi
elif [ -f "pytest.ini" ] || [ -f "pyproject.toml" ]; then
  python -m pytest --quiet 2>/dev/null
  [ $? -ne 0 ] && echo "❌ BLOQUEADO: Testes falhando." >&2 && exit 2
fi
exit 0
