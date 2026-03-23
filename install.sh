#!/usr/bin/env bash
# ============================================================
# Marcelo Costa — Claude Code Agent System
# Instalador: clona o repo e cria symlinks em ~/.claude/
# Uso: curl -fsSL https://raw.githubusercontent.com/marrelocosta93/marcelo-costa-claude/main/install.sh | bash
# ============================================================
set -euo pipefail

REPO_URL="https://github.com/marrelocosta93/marcelo-costa-claude.git"
CLONE_DIR="$HOME/.marcelo-claude"
DEST="${DEST:-$HOME/.claude}"
AUTO_UPDATE=true

# ─── flags ────────────────────────────────────────────────
for arg in "$@"; do
  case $arg in
    --no-auto-update) AUTO_UPDATE=false ;;
    --dest=*)         DEST="${arg#*=}" ;;
    --uninstall)      UNINSTALL=true ;;
    --help)
      echo "Uso: bash install.sh [--no-auto-update] [--dest DIR] [--uninstall]"
      exit 0 ;;
  esac
done

# ─── cores ────────────────────────────────────────────────
GREEN='\033[0;32m'; YELLOW='\033[1;33m'; RED='\033[0;31m'; NC='\033[0m'
ok()   { echo -e "${GREEN}✓${NC} $*"; }
warn() { echo -e "${YELLOW}⚠${NC} $*"; }
err()  { echo -e "${RED}✗${NC} $*"; exit 1; }

# ─── uninstall ────────────────────────────────────────────
if [[ "${UNINSTALL:-false}" == "true" ]]; then
  echo "Desinstalando marcelo-costa-claude..."
  for dir in agents skills rules Playbooks lib hooks shared scripts .agents .templates; do
    target="$DEST/$dir"
    [[ -L "$target" ]] && rm "$target" && ok "Removido symlink: $target"
  done
  [[ -d "$CLONE_DIR" ]] && rm -rf "$CLONE_DIR" && ok "Removido: $CLONE_DIR"
  ok "Desinstalação completa."
  exit 0
fi

# ─── clonar ou atualizar ───────────────────────────────────
echo ""
echo "══════════════════════════════════════════"
echo "  Marcelo Costa — Claude Code Agent System"
echo "══════════════════════════════════════════"
echo ""

if [[ -d "$CLONE_DIR/.git" ]]; then
  echo "Atualizando repositório em $CLONE_DIR..."
  git -C "$CLONE_DIR" pull --ff-only origin main && ok "Repositório atualizado."
else
  echo "Clonando repositório..."
  git clone "$REPO_URL" "$CLONE_DIR" && ok "Clonado em $CLONE_DIR"
fi

# ─── criar dest se necessário ─────────────────────────────
mkdir -p "$DEST"

# ─── criar symlinks ───────────────────────────────────────
echo ""
echo "Criando symlinks em $DEST..."

DIRS=("agents" "skills" "rules" "Playbooks" "lib" "hooks" "shared" "scripts" ".agents" ".templates")
for dir in "${DIRS[@]}"; do
  src="$CLONE_DIR/$dir"
  target="$DEST/$dir"

  [[ ! -d "$src" ]] && continue

  if [[ -L "$target" ]]; then
    rm "$target"
    ln -s "$src" "$target"
    ok "Symlink atualizado: $dir"
  elif [[ -d "$target" ]]; then
    warn "Diretório real encontrado em $target — não sobrescrito."
    warn "  Renomeie para ${target}.bak se quiser usar a versão do repo."
  else
    ln -s "$src" "$target"
    ok "Symlink criado: $dir"
  fi
done

# ─── settings.json: só copia se não existir ───────────────
if [[ ! -f "$DEST/settings.json" ]]; then
  cp "$CLONE_DIR/settings.json" "$DEST/settings.json"
  ok "settings.json copiado (não existia)."
else
  warn "settings.json já existe — não sobrescrito. Verifique manualmente se precisa atualizar."
fi

# ─── CLAUDE.md: só copia se não existir ───────────────────
if [[ ! -f "$HOME/CLAUDE.md" ]]; then
  cp "$CLONE_DIR/CLAUDE.md" "$HOME/CLAUDE.md"
  ok "CLAUDE.md copiado para $HOME/"
else
  warn "CLAUDE.md já existe em $HOME/ — não sobrescrito."
fi

# ─── auto-update hook ─────────────────────────────────────
if [[ "$AUTO_UPDATE" == "true" ]]; then
  UPDATE_SCRIPT="$CLONE_DIR/scripts/auto-update.sh"
  cat > "$UPDATE_SCRIPT" << 'AUTOUPDATE'
#!/usr/bin/env bash
# Auto-update: só puxa se passou mais de 1h desde o último pull
CLONE_DIR="$HOME/.marcelo-claude"
STAMP="$CLONE_DIR/.last_update"
NOW=$(date +%s)
LAST=$(cat "$STAMP" 2>/dev/null || echo 0)
DIFF=$((NOW - LAST))
if [[ $DIFF -gt 3600 ]]; then
  git -C "$CLONE_DIR" pull --ff-only origin main --quiet 2>/dev/null && echo $NOW > "$STAMP"
fi
AUTOUPDATE
  chmod +x "$UPDATE_SCRIPT"
  ok "Script de auto-update criado em $UPDATE_SCRIPT"
  echo ""
  warn "Para ativar auto-update, adicione ao seu settings.json (SessionStart):"
  echo "  bash $UPDATE_SCRIPT"
fi

# ─── done ─────────────────────────────────────────────────
echo ""
echo -e "${GREEN}══════════════════════════════════════════${NC}"
echo -e "${GREEN}  Instalação concluída!${NC}"
echo -e "${GREEN}══════════════════════════════════════════${NC}"
echo ""
echo "Diretório do repo : $CLONE_DIR"
echo "Symlinks em       : $DEST"
echo ""
echo "Reinicie o Claude Code para ativar os agents e skills."
echo ""
