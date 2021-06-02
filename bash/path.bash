#!/bin/bash

export PATH="./bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$DOTFILES/bin:$PATH"

lspath() {
  echo "${PATH}" | tr ':' '\n'
}
