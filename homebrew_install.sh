#!/bin/bash

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"

brew install caskroom/cask/brew-cask

brew install ack autojump colordiff curl git openssl tmux wget

brew install pipenv

brew cask install atom
brew cask install anvil
brew cask install google-chrome
brew cask install afred
brew cask install macvim
brew cask install sidestep
brew cask install iterm2
brew cask install vagrant virtualbox
brew cask install steam
brew cask install sequel-pro
brew cask install cheatsheet
brew cask install appcleaner
brew cask install ungoogled-chrome
brew install TomAnthony/brews/itermocil


#dotrc

sudo scutil --set HostName yifan-rmbp
