# From http://dotfiles.org/~_why/.zshrc
# Sets the window title nicely no matter where you are
function title() {
  local TITLE=${1:-$(basename $(pwd))}

  case $TERM in
  screen)
    echo -en "\ek$a:${TITLE}\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    echo -en "\033]0;${TITLE}\007" # plain xterm title ($3 for pwd)
    ;;
  esac
}
