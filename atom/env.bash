#!/bin/bash

export ATOM_REPOS_HOME=${HOME}/src/
export ATOM_SRC=${HOME}/src/atom/

atomlive() {
  export ATOM_DEV_RESOURCE_PATH=${ATOM_SRC}
  printf "Atom dev mode will load source from %b%s%b.\n" "${CYAN}" "${ATOM_SRC}" "${RESET}"
}

atomunlive() {
  unset ATOM_DEV_RESOURCE_PATH
  printf "Atom dev mode will load shipped source.\n"
}
