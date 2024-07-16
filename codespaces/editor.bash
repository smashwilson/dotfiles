#!/usr/bin/env bash
#
# Identify the correct EDITOR setting for this Codespace.

if [ "${CODESPACES:-}" = "true" ]; then
  if has code; then
    export EDITOR="code --wait"
  fi
  if has code-insiders; then
    export EDITOR="code-insiders --wait"
  fi
fi
