extract () {
    if [ -f "$1" ]; then
        case "$1" in
            *.tar.bz2)   tar xjf $1     ;;
            *.tar.gz)    tar xzf $1     ;;
            *.tar.xz)    tar -xf $1     ;;
            *.bz2)       bunzip2 $1     ;;
            *.rar)       unrar e $1     ;;
            *.gz)        gunzip $1      ;;
            *.tar)       tar xf $1      ;;
            *.tbz2)      tar xjf $1     ;;
            *.tgz)       tar xzf $1     ;;
            *.zip)       unzip $1       ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
         esac
    else
        echo "'$1' is not a valid file"
    fi
}

mkcd() {
    mkdir -p $1 && cd $1
}

tab_name() {
    # Set current tab name to a custom string or to the working dir (default)
    if [ "$1" ]; then
        printf "\e]1;$1\a"
    else
        printf "\e]1;${PWD##*/}\a"
    fi
}

window_name() {
    # Set window name to a custom string
    printf "\e]2;$1\a"
}
