# Show the current git branch in the prompt.

export PS1='\[\033[01;32m\]\u@\h\[\033[01;36m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;36m\] \$\[\033[00m\] '
export GIT_PS1_SHOWDIRTYSTATE=1
