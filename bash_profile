PS1='\[\e[0;33m\]\h:\W \u\$\[\e[m\] '

export CLICOLOR=1
export EDITOR=vim
export BLOCKSIZE=1k

export HOMEBREW_GITHUB_API_TOKEN="a2f1d26006ed85c09602564bce5328dab704cc6d"

if [ -f ~/.aliases ]; then
  . ~/.aliases
fi

function _update_ps1() {
    PS1="$($GOPATH/bin/powerline-go -error $? -jobs $(jobs -p | wc -l))"

    # Uncomment the following line to automatically clear errors after showing
    # them once. This not only clears the error for powerline-go, but also for
    # everything else you run in that shell. Don't enable this if you're not
    # sure this is what you want.
    
    #set "?"
}

if [ "$TERM" != "linux" ] && [ -f "$GOPATH/bin/powerline-go" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

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

function archive {
  if [[ ! -d "archive" ]]; then
    echo "archive directory not found"
  else
    tar -cvzf $1.tar.gz --exclude=".git" $1
    mv $1.tar.gz archive
  fi
}

[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh


function azip {
  if [[ $# -lt 2 ]]; then
    echo 'azip group vm'
  else
    VMIP=$(az vm show -d -o tsv -g $1 -n $2 --output json | grep "publicIps" | cut -d'"' -f4)
    echo $VMIP
  fi
}

function azssh {
  if [[ $# -lt 2 ]]; then
    echo 'azssh group vm'
  else
    VMIP=$(az vm show -d -o tsv -g $1 -n $2 --output json | grep "publicIps" | cut -d'"' -f4)
    ssh $VMIP
  fi
}

function convwav {
  ORGNAME=$1
  WAVNAME=$(basename "$ORGNAME")
  ffmpeg -i "$ORGNAME" -ar 16000 -ac 1 -f wav "${WAVNAME%.*}".wav
}

function dockerpush {
  NAME=$1
  docker tag $NAME meganews.azurecr.io/meganews/$NAME
  docker push meganews.azurecr.io/meganews/$NAME
}

source $(dirname $(gem which colorls))/tab_complete.sh

export LIBRARY_PATH=$LIBRARY_PATH:/usr/local/opt/openssl/lib/
export PATH="/usr/local/sbin:$PATH"
export PATH="${PATH}:${HOME}/.krew/bin"
export PATH=$HOME/.poetry/bin:$(pyenv root)/shims:$PATH

# Created by `userpath` on 2021-01-28 07:23:59
export PATH="$PATH:/Users/yifan/.local/bin"
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
source "$HOME/.cargo/env"
