#!/bin/bash
# =============================================================================
# _env.sh — PATH helper for Claude Code hooks on Windows (nvm-windows)
# Source this at the top of any hook that needs npm/npx/node.
# =============================================================================

# nvm-windows: npm/npx live in the versioned directory
# v20.19.0 has node but no npm; v24.12.0 has npm/npx
NVM_DIR="/c/Users/andre.gusman/AppData/Local/nvm"
NODE_ACTIVE="$NVM_DIR/v20.19.0"
NPM_SOURCE="$NVM_DIR/v24.12.0"

# Add npm/npx source to PATH (before node so npm/npx resolve, but node still uses v20)
if [ -d "$NPM_SOURCE" ] && ! command -v npx &>/dev/null; then
  export PATH="$NPM_SOURCE:$NODE_ACTIVE:$PATH"
fi

# OOM prevention for builds
export NODE_OPTIONS="${NODE_OPTIONS:---max-old-space-size=8192}"
