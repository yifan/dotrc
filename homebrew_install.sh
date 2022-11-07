#!/bin/bash

which brew
if [[ $? == 1 ]]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install ack autojump colordiff curl git openssl tmux wget git-extras svn

brew tap homebrew/cask-fonts
brew install font-fontawesome font-awesome-terminal-fonts font-iosevka
brew install font-source-code-pro font-source-code-pro-for-powerline

#brew cask install google-chrome
brew install --cask visual-studio-code microsoft-edge
brew install --cask macvim iterm2 rectangle
#brew install --cask mattr-slate
#brew cask install sidestep
#brew cask install vagrant virtualbox
#brew cask install steam
#brew cask install sequel-pro
#brew cask install cheatsheet
#brew cask install appcleaner
#brew cask install ungoogled-chrome
#brew install TomAnthony/brews/itermocil
#brew install neovim
#brew install tldr
brew install ripgrep tree bat httpie glab
#brew install lazydocker


#dotrc

brew install notion
