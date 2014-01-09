# Set up a persistent, cross-session ssh-agent.
#
# http://superuser.com/questions/141044/sharing-the-same-ssh-agent-among-multiple-login-sessions

check_ssh_agent() {
    [ -S "$SSH_AUTH_SOCK" ] && { ssh-add -l >& /dev/null || [ $? -ne 2 ]; }
}

if [ -n "$SSH_AUTH_SOCK" ]; then
  # attempt to connect to a running agent
  check_ssh_agent || export SSH_AUTH_SOCK="$(< ~/.tmp/ssh-agent.env)"

  # if agent.env data is invalid, start a new one
  check_ssh_agent || {
      eval "$(ssh-agent -s)" > /dev/null
      echo "$SSH_AUTH_SOCK" > ~/.tmp/ssh-agent.env
  }
else
  echo "SSH agent not forwarded."
fi
