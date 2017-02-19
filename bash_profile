PS1='\[\e[0;33m\]\h:\W \u\$\[\e[m\] '

export CLICOLOR=1
export EDITOR=vim
export BLOCKSIZE=1k

export HOMEBREW_GITHUB_API_TOKEN="a2f1d26006ed85c09602564bce5328dab704cc6d"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias g="grep"
alias gc="grep --color"
alias lh="ls -lh"

alias brewupdate="brew update && brew upgrade && brew cleanup && brew doctor"
