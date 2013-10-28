# Show the current git branch in the prompt.
# show the current git branch on the prompt.
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1="${GREEN}\u@\h${CYAN} \w${YELLOW}\$(__git_ps1)${CYAN} \$${RESET} "
