# don't put duplicate lines or lines starting with a space in the history.
HISTCONTROL=ignoreboth

shopt -s histappend
HISTSIZE=10000
SAVEHIST=10000

case "$OSTYPE" in
  linux*)
    shopt -s checkwinsize
    shopt -u direxpand
esac

