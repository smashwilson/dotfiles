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

has()
{
  which $1 >/dev/null 2>&1
}

hasfunc()
{
  type -t $1 >/dev/null 2>&1
}
