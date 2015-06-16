# Automatically shellinit docker-machine if it's up.

# If docker-machine is running a box called "dev", exec its environment setup.
function machineme() {
  ORIGINAL_CONFIG=$(readlink ${HOME}/.ssh/config)
  setup-offvpn 1>/dev/null

  eval "$(docker-machine env dev)"

  ln -f -s ${ORIGINAL_CONFIG} ${HOME}/.ssh/config
}

which docker-machine 1>/dev/null 2>&1 && machineme
