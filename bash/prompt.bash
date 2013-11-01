# show the current git branch on the prompt.

export GIT_PS1_SHOWDIRTYSTATE="1"
export GIT_PS1_SHOWUNTRACKEDFILES="1"
export GIT_PS1_SHOWUPSTREAM="auto"

export PS1="${GREEN}\u@\h${CYAN} \w${YELLOW}\$(__git_ps1)${CYAN} \$${RESET} "
