#!/bin/bash
#
# Load nvm into the shell.

case "${OSTYPE}" in
  darwin*)
    has brew && [ -d $(brew --prefix nvm) ] && {
      export NVM_DIR=${HOME}/.nvm
      source $(brew --prefix nvm)/nvm.sh
    }
    ;;
  linux*)
    [ -f ${HOME}/.nvm/nvm.sh ] && {
      source ${HOME}/.nvm/nvm.sh
    }
    ;;
esac
