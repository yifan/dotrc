#!/bin/bash

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"


brew install ack autojump colordiff curl git openssl tmux wget git-extras

brew cask install google-chrome
brew cask install alfred
brew cask install macvim
brew cask install mattr-slate
brew cask install sidestep
brew cask install iterm2
#brew cask install vagrant virtualbox
#brew cask install steam
#brew cask install sequel-pro
#brew cask install cheatsheet
#brew cask install appcleaner
#brew cask install ungoogled-chrome
#brew install TomAnthony/brews/itermocil
brew install neovim
brew install httpie
brew install tldr
brew install ripgrep tree bat
brew install lazydocker
brew install glab
brew cask install font-fontawesome font-awesome-terminal-fonts
brew cask install font-iosevka


#dotrc

sudo scutil --set HostName MagicalStaff
