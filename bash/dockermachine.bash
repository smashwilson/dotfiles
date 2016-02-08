# Automatically shellinit docker-machine if it's up.

# Use a named docker-machine VirtualBox VM, optionally creating or starting it if necessary.
# Automatically source the connection environment variables into the current shell and add or
# modify /etc/hosts to include an entry pointing to it.
#
# Usage: machineme <machine-name> [create] [quiet]
function machineme() {
  local MACHINENAME=$1
  local CREATE=${2:-}
  local QUIET=${3:-}

  local CONFIG="$(docker-machine env ${MACHINENAME} 2>/dev/null)"

  if [ -n "${CONFIG}" ]; then
    eval "${CONFIG}"

    local ETCHOSTNAME="docker${MACHINENAME}"
    local MACHINEIP=$(docker-machine ip ${MACHINENAME})

    add-etc-host "${ETCHOSTNAME}" "${MACHINEIP}"
    [ "$?" = "2" ] && {
      echo "dmachine: adding /etc/hosts entry ${ETCHOSTNAME} -> ${MACHINEIP}"
      sudo add-etc-host "${ETCHOSTNAME}" "${MACHINEIP}"
    }
    return 0
  else
    if [ -n "${CREATE}" ]; then
      local STATUS="$(docker-machine status ${MACHINENAME} 2>/dev/null)"

      case "${STATUS}" in
        Stopped)
          [ -z "${QUIET}" ] && echo "dmachine: starting machine ${MACHINENAME}."

          docker-machine start ${MACHINENAME}
          ;;
        "")
          [ -z "${QUIET}" ] && echo "dmachine: creating machine ${MACHINENAME}."

          docker-machine create -d virtualbox ${MACHINENAME}
          ;;
        *)
          echo "dmachine: unfamiliar machine status '${STATUS}' for ${MACHINENAME}." >&2
          return 1
          ;;
      esac

      dmachine "${MACHINENAME}" "" "${QUIET}"
    else
      [ -z "${QUIET}" ] && echo "dmachine: ${MACHINENAME} is not started or does not exist." >&2
      return 1
    fi
  fi
}

# If docker-machine is running a box called "dev", exec its environment setup.
function devmachine() {
  ORIGINAL_CONFIG=$(readlink ${HOME}/.ssh/config)
  setup-offvpn 1>/dev/null

  machineme dev "" quiet

  ln -f -s ${ORIGINAL_CONFIG} ${HOME}/.ssh/config
}

which docker-machine 1>/dev/null 2>&1 && devmachine
