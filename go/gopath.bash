# gvm config
[ -s "$HOME/.gvm/scripts/gvm" ] && source "$HOME/.gvm/scripts/gvm"

export GOPATH=${HOME}/go
export GOROOT=`go env GOROOT`

# add the ${GOPATH} binary directory to the path.
export PATH=${PATH}:${GOPATH}/bin

# add the ${GOROOT} binary directory to the path.
export PATH=${PATH}:${GOROOT}/bin
