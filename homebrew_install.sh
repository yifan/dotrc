#!/bin/bash

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"


brew install ack autojump colordiff curl git openssl tmux wget git-extras
brew install --cask font-fontawesome font-awesome-terminal-fonts font-iosevka

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

sudo scutil --set HostName MagicalStaff
