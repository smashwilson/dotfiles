#!/usr/bin/env bash

function fixture() {
  if [ -z "${1:-}" ]; then
    printf "Usage: fixture name\n" >&2
    return 1
  fi

  local NEW=""
  if [ ! -d "${HOME}/fixtures/${1}" ]; then
    NEW=" (new)"
    mkdir -p "${HOME}/fixtures/${1}"
  fi
  clear
  printf "${GREEN}==>${RESET} fixture ${1}${NEW}\n"
  cd "${HOME}/fixtures/${1}"
  title "fixture ${1}"
}

# Completion

function _fixture_completion() {
  if [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi

  local DIRS=($(compgen -d -S " " "${HOME}/fixtures/${COMP_WORDS[1]}"))
  for I in ${!DIRS[@]}; do
    COMPREPLY[$I]="${DIRS[$I]##${HOME}/fixtures/}"
  done
}

complete -F _fixture_completion fixture
