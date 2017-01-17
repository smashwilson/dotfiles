#!/bin/sh
#
# This file is sourced by .bashrc before any of the other .bash files.

export BLACK="\033[0;30m"
export BLUE="\033[0;34m"
export GREEN="\033[0;32m"
export CYAN="\033[0;36m"
export RED="\033[0;31m"
export PURPLE="\033[0;35m"
export BROWN="\033[0;33m"
export LT_GRAY="\033[0;37m"
export DK_GRAY="\033[1;30m"
export LT_BLUE="\033[1;34m"
export LT_GREEN="\033[1;32m"
export LT_CYAN="\033[1;36m"
export LT_RED="\033[1;31m"
export LT_PURPLE="\033[1;35m"
export YELLOW="\033[1;33m"
export WHITE="\033[1;37m"
export RESET="\033[0m"

bracketed()
{
  printf "\[%s\]" $1
}

export PS1_BLACK=$(bracketed ${BLACK})
export PS1_BLUE=$(bracketed ${BLUE})
export PS1_GREEN=$(bracketed ${GREEN})
export PS1_CYAN=$(bracketed ${CYAN})
export PS1_RED=$(bracketed ${RED})
export PS1_PURPLE=$(bracketed ${PURPLE})
export PS1_BROWN=$(bracketed ${BROWN})
export PS1_LT_GRAY=$(bracketed ${LT_GRAY})
export PS1_DK_GRAY=$(bracketed ${DK_GRAY})
export PS1_LT_BLUE=$(bracketed ${LT_BLUE})
export PS1_LT_GREEN=$(bracketed ${LT_GREEN})
export PS1_LT_CYAN=$(bracketed ${LT_CYAN})
export PS1_LT_RED=$(bracketed ${LT_RED})
export PS1_LT_PURPLE=$(bracketed ${LT_PURPLE})
export PS1_YELLOW=$(bracketed ${YELLOW})
export PS1_WHITE=$(bracketed ${WHITE})
export PS1_RESET=$(bracketed ${RESET})

has()
{
  which $1 >/dev/null 2>&1
}

hasfunc()
{
  type -t $1 >/dev/null 2>&1
}
