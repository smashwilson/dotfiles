#!/bin/bash
#
# Load nvm into the shell.

case "${OSTYPE}" in
  darwin*)
    export NVM_DIR=${HOME}/.nvm
    source $(brew --prefix nvm)/nvm.sh
    ;;
  linux*)
    source ${HOME}/.nvm/nvm.sh
    ;;
esac
