# Automatically source a swarm from ${SWARM_ROOT} and then "dvm use" to sync docker client versions.
function swarmme() {
  local SWARMNAME=${1}
  local ACCOUNTNAME=${CARINA_USERNAME:-}

  if [ -z "${ACCOUNTNAME}" ]; then
    local ACCOUNTS=$(ls ${HOME}/.carina/clusters)
    if echo ${ACCOUNTS} | grep -q ' ' ; then
      echo "swarmme: Please specify an account as \$CARINA_USERNAME." >&2
      echo "Accounts available:" >&2
      echo ${ACCOUNTS} >&2
      return 1
    else
      ACCOUNTNAME=${ACCOUNTS}
    fi
  fi

  local L_SWARM_ROOT=${SWARM_ROOT:-${HOME}/.carina/clusters/${ACCOUNTNAME}}

  [ -z "${SWARMNAME}" ] && {
    echo "Swarms available:"
    ls ${L_SWARM_ROOT}
    return 0
  }

  local SWARM_DIR="${L_SWARM_ROOT}/${SWARMNAME}"

  [ ! -d "${SWARM_DIR}" ] || [ ! -f "${SWARM_DIR}/docker.env" ] && {
    echo "swarmme: Unrecognized swarm ${SWARMNAME}." >&2
    echo "Swarms available:" >&2
    ls ${L_SWARM_ROOT} >&2
    return 1
  }

  source ${SWARM_DIR}/docker.env
  echo "swarmme: Using swarm ${SWARMNAME}."
  dvm use
  unset DOCKER_MACHINE_NAME
  export DOCKER_SWARM_NAME="${SWARMNAME}"
}
