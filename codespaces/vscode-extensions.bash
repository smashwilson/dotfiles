#!/usr/bin/env bash
#
# Install and configure VSCode extensions into a codespace.

if [ "${CODESPACES:-}" = "true" ]; then
  code \
    --install-extension flesler.url-encode \
    >&/dev/null
fi
