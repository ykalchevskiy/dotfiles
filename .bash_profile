# 
export EDITOR=nano
export PS1='[\t] \u in \w\n\$ '

# virtualenvwrapper
export WORKON_HOME=~/.virtualenvs
export PROJECT_HOME=~/Projects
source /usr/local/bin/virtualenvwrapper.sh

# pip bash completion
_pip_completion()
{
    COMPREPLY=( $( COMP_WORDS="${COMP_WORDS[*]}" \
                   COMP_CWORD=$COMP_CWORD \
                   PIP_AUTO_COMPLETE=1 $1 ) )
}
complete -o default -F _pip_completion pip

# ssh bash completion
# http://trickcode.com/ssh-auto-complete-on-mac-os-x/
_ssh_hosts_completion()
{
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    comp_ssh_hosts=`cat ~/.ssh/known_hosts |
                    cut -f 1 -d ' ' |
                    sed -e s/,.*//g |
                    grep -v ^# |
                    uniq |
                    grep -v "\[" ;
                    cat ~/.ssh/config |
                    grep "^Host " |
                    awk '{print $2}'
    `
    COMPREPLY=( $(compgen -W "${comp_ssh_hosts}" -- $cur))
    return 0
}
complete -F _ssh_hosts_completion ssh

# alias
alias vagrant_run='vagrant up && vagrant ssh'
alias ll='ls -lh'

# other
export CLICOLOR=1

if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi
