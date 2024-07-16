#!/usr/bin/env bash
#
# Install bash tab completions.

if [ "${CODESPACES:-}" = "true" ]; then
  for COMPLETION_FILE in /usr/share/bash-completion/completions/*; do
    if [ -f "${COMPLETION_FILE}" ] &&
        [[ "${COMPLETION_FILE}" =~ \/docker$ ]] &&
        [[ "${COMPLETION_FILE}" =~ \/debconf$ ]] &&
        [[ "${COMPLETION_FILE}" =~ \/debconf-show$ ]] &&
        [[ "${COMPLETION_FILE}" =~ \/systemd-cgls$ ]]; then
      source $COMPLETION_FILE
    fi
  done
fi
