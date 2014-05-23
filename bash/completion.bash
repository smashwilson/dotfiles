case "${OSTYPE}" in
  darwin*)
    # On a Mac, we need to enable tab-completion for SSH hosts manually.
    # Credit to: https://gist.github.com/aliang/1024466

    _complete_ssh_hosts ()
    {
            COMPREPLY=()
            cur="${COMP_WORDS[COMP_CWORD]}"
            comp_ssh_hosts=`cat ~/.ssh/known_hosts | \
                            cut -f 1 -d ' ' | \
                            sed -e s/,.*//g | \
                            grep -v ^# | \
                            uniq | \
                            grep -v "\[" ;
                            cat ~/.ssh/config | \
                            grep "^Host " | \
                            awk '{print $2}'
                            `
            COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
            return 0
    }
    complete -F _complete_ssh_hosts ssh

    # We also need to set up git autocompletion by hand.
    for FILE in `brew --prefix`/etc/bash_completion.d/*; do
      source $FILE
    done
    ;;
esac
