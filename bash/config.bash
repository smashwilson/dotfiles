if [[ -n $SSH_CONNECTION ]]; then
  export PS1='%m:%3~$(git_info_for_prompt)%# '
else
  export PS1='%3~$(git_info_for_prompt)%# '
fi

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

if [ "${CODESPACES:-}" = "true" ]; then
  export EDITOR=code
else
  export EDITOR=vim
fi
