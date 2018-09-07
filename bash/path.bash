#!/bin/bash

export PATH="$HOME/bin:/usr/local/bin:/usr/local/sbin:$DOT/bin:$PATH"

lspath() {
  echo "${PATH}" | tr ':' '\n'
}
