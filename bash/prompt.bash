# show the current git branch on the prompt.

if [ -f /usr/lib/git-core/git-sh-prompt ]; then
  source /usr/lib/git-core/git-sh-prompt
fi

export GIT_PS1_SHOWDIRTYSTATE="1"
export GIT_PS1_SHOWUNTRACKEDFILES="1"
export GIT_PS1_SHOWUPSTREAM="auto"

__last_exit()
{
  if [ $PS1_EXITCODE -eq 0 ]; then
    echo -n "${PS1_LT_GRAY} "
  else
    echo -n "${PS1_RED} [$?] "
  fi
}

if [ "${CODESPACES:-}" = "true" ]; then
  __set_prompt()
  {
    PS1_EXITCODE=$?

    PS1="⛅️ "
    PS1="${PS1}${PS1_CYAN}\w"
    PS1="${PS1}${PS1_YELLOW}$(__git_ps1)"
    PS1="${PS1}$(__last_exit)"
    PS1="${PS1}\n\$${PS1_RESET} "
  }
else
  __set_prompt()
  {
    PS1_EXITCODE=$?

    PS1=""

    [ -z "${PS1_NOWHO}" ] && PS1="${PS1}${PS1_GREEN}\u ${PS1_RESET}"
    [ -z "${PS1_NOHOST}" ] && PS1="${PS1}${PS1_GREEN}@ \h ${PS1_RESET}"

    PS1="${PS1}${PS1_CYAN}\w"
    PS1="${PS1}${PS1_YELLOW}$(__git_ps1)"
    PS1="${PS1}$(__last_exit)"
    PS1="${PS1}\n\$${PS1_RESET} "
  }
fi

export PROMPT_COMMAND=__set_prompt
