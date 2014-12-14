#!/bin/bash

if [ "$(uname)" == "Linux" ]; then
    alias ports="netstat -tulpn"
fi

if [ "$(uname)" == "Darwin" ]; then
    alias grep="grep --color=auto"
    alias ll="ls -alG"
fi

alias ..="cd .."
alias vrun="vagrant up && vagrant ssh"
alias wcl="wc -l"


mkcd() {
    mkdir -p $1
    cd $1
}
