#!/bin/bash -e
if [[ ! -e "$HOME/.vim/bundle/Vundle.vim" ]];
then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
curl -O https://github.com/mbadolato/iTerm2-Color-Schemes/raw/master/schemes/Cobalt2.itermcolors
ln -s ~/dotrc/vimrc ~/.vimrc
ln -s ~/dotrc/gitconfig ~/.gitconfig
