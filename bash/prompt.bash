# show the current git branch on the prompt.

export GIT_PS1_SHOWDIRTYSTATE="1"
export GIT_PS1_SHOWUNTRACKEDFILES="1"
export GIT_PS1_SHOWUPSTREAM="auto"

__last_exit()
{
  if [ $PS1_EXITCODE -eq 0 ]; then
    echo -n "${LT_GRAY} "
  else
    echo -n "${RED} [$?] "
  fi
}

__docker()
{
  if [ -n "${DOCKER_MACHINE_NAME}" ]; then
    echo -n " docker:${DOCKER_MACHINE_NAME}"
  elif [ -n "${DOCKER_SWARM_NAME}" ]; then
    echo -n " carina:${DOCKER_SWARM_NAME}"
  fi
}

__venv()
{
  if [ -n "${VIRTUAL_ENV}" ]; then
    echo -n " venv:$(basename ${VIRTUAL_ENV})"
  fi
}

__kubectl()
{
  if which kubectl >/dev/null 2>&1 ; then
    local CONTEXT=$(kubectl config current-context)
    local NS=$(kubectl config view -o "jsonpath={.contexts[?(@.name==\"${CONTEXT}\")].context.namespace}")
    [ -n "${NS}" ] && NS="(${NS})"

    echo -n " k8s:${CONTEXT}${NS}"
  fi
}

__set_prompt()
{
  PS1_EXITCODE=$?

  PS1=""

  [ -z "${PS1_NOWHO}" ] && PS1="${PS1}${GREEN}\u ${RESET}"
  [ -z "${PS1_NOHOST}" ] && PS1="${PS1}${GREEN}@ \h ${RESET}"

  PS1="${PS1}${CYAN}\w"
  PS1="${PS1}${PURPLE}$(__docker)"
  PS1="${PS1}$(__kubectl)"
  PS1="${PS1}$(__venv)"
  PS1="${PS1}${YELLOW}$(__git_ps1)"
  PS1="${PS1}$(__last_exit)"
  PS1="${PS1}\n\$${RESET} "
}

export PROMPT_COMMAND=__set_prompt
