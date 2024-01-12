#!/usr/bin/env bash
#
# Configure git within codespaces.

if [ "${CODESPACES:-}" = "true" ]; then
  git config --global core.pager "less -F"
fi
