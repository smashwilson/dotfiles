#!/bin/bash

export PATH="./bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$DOTFILES/bin:$PATH"

if has go && [ "${CODESPACES:-}" = "true" ]; then
  export PATH="${PATH}:$(go env GOPATH)/bin"
fi

lspath() {
  echo "${PATH}" | tr ':' '\n'
}
