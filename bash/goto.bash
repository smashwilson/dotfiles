#!/usr/bin/env bash

function goto() {
  if [ -z "${1:-}" ]; then
    printf "Usage: goto org/repo\n" >&2
    return 1
  fi

  ORG=$(cut -d '/' -f 1 <<< "${1}")
  REPO=$(cut -d '/' -f 2 <<< "${1}")

  if [ ! -d "${ATOM_REPOS_HOME}/${ORG}/${REPO}" ]; then
    mkdir -p "${ATOM_REPOS_HOME}/${ORG}"
    cd "${ATOM_REPOS_HOME}/${ORG}"

    git clone git@github.com:${ORG}/${REPO}.git || return 1
  fi

  printf "${GREEN}==>${RESET} ${ATOM_REPOS_HOME%%/}/${ORG}/${REPO}\n"
  cd "${ATOM_REPOS_HOME}/${ORG}/${REPO}"
  title "${ORG}/${REPO}"
}

# Completion

function _goto_completion() {
  if [ "${#COMP_WORDS[@]}" != "2" ]; then
    return
  fi

  local DIRS
  case "${COMP_WORDS[1]}" in
    */*)
      DIRS=($(compgen -d -S " " "${HOME}/src/${COMP_WORDS[1]}"))
      ;;
    *)
      DIRS=($(compgen -d -S / "${HOME}/src/${COMP_WORDS[1]}"))
      ;;
  esac

  for I in ${!DIRS[@]}; do
    COMPREPLY[$I]="${DIRS[$I]##${HOME}/src/}"
  done
}

complete -o nospace -F _goto_completion goto
