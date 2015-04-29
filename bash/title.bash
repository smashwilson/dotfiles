# From http://dotfiles.org/~_why/.zshrc
# Sets the window title nicely no matter where you are
function title() {
  case $TERM in
  screen)
    echo -en "\ek$a:$1\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    echo -en "\033]0;$@\007" # plain xterm title ($3 for pwd)
    ;;
  esac
}
