# show the current git branch on the prompt.

export GIT_PS1_SHOWDIRTYSTATE="1"
export GIT_PS1_SHOWUNTRACKEDFILES="1"
export GIT_PS1_SHOWUPSTREAM="auto"

__last_exit()
{
  if [ $PS1_EXITCODE -eq 0 ]; then
    echo -n "${GREEN} "
  else
    echo -n "${RED} [$?] "
  fi
}

__set_prompt()
{
  PS1_EXITCODE=$?

  PS1=""

  [ -z "${PS1_NOWHO}" ] && PS1="${PS1}${GREEN}\u "

  PS1="${PS1}${CYAN}\w"
  PS1="${PS1}${YELLOW}$(__git_ps1)"
  PS1="${PS1}$(__last_exit)\$"
  PS1="${PS1}${RESET} "
}

export PROMPT_COMMAND=__set_prompt
