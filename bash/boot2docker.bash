# Automatically shellinit boot2docker if it's up.

which boot2docker 1>/dev/null 2>&1 && {
  case $(boot2docker status 2>/dev/null) in
    running)
      ORIGINAL_CONFIG=$(readlink ${HOME}/.ssh/config)
      setup-offvpn 1>/dev/null

      $(boot2docker shellinit 2>/dev/null)

      ln -f -s ${ORIGINAL_CONFIG} ${HOME}/.ssh/config
      ;;
  esac
}
