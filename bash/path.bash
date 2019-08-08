#!/bin/bash

export PATH="./bin:$HOME/bin:/usr/local/bin:/usr/local/sbin:$DOT/bin:$PATH"

lspath() {
  echo "${PATH}" | tr ':' '\n'
}
