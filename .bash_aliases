#!/bin/bash

if [ "$(uname)" == "Linux" ]; then
    alias fix_ipv6_for_ide=""
    alias ports="netstat -tlpn"
fi

if [ "$(uname)" == "Darwin" ]; then
    alias fix_ipv6_for_ide="sudo ifconfig awdl0 down"
    alias grep="grep --color=auto"
    alias ll="ls -alFG"
    alias ls="ls -FG"
    alias ports="lsof -i TCP -n -P"
fi

alias ..="cd .."
alias vagrant_run="vagrant up && vagrant ssh"
