if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

fpath=($ZSH/functions $fpath)

autoload -U $ZSH/functions/*(:t)

# don't put duplicate lines or lines starting with a space in the history.
HISTCONTROL=ignoreboth

shopt -s histappend

HISTSIZE=10000
SAVEHIST=10000

shopt -s checkwinsize

export EDITOR=vim

# don't expand aliases _before_ completion has finished
#   like: git comm-[tab]
setopt complete_aliases

