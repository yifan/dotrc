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

# tmux start
function tmuxdev {
  SESSION="dev"
  tmux -2 new-session -d -s $SESSION
  tmux rename-window -t $SESSION:1 vim
  tmux split-window -h
  tmux select-pane -t 0
  tmux resize-pane -R 30
  tmux new-window -t $SESSION -a -n cmd
}

function azureip {
  if [[ $# -lt 2 ]]; then
    echo 'azureip group vm'
  else
    VMIP=$(azure vm show $1 $2 | grep 'Public IP' | awk '{print $NF}' | sed 's/://g')
    echo $VMIP
  fi
}
  
function azuressh {
  if [[ $# -lt 2 ]]; then
    echo 'sshazure group vm'
  else
    VMIP=$(azure vm show $1 $2 | grep 'Public IP' | awk '{print $NF}' | sed 's/://g')
    ssh $VMIP
  fi
}

function archive {
  if [[ ! -d "archive" ]]; then
    echo "archive directory not found"
  else
    tar -cvzf $1.tar.gz --exclude=".git" $1
    mv $1.tar.gz archive
  fi
}
