#!/bin/bash -e
if [[ ! -d "$HOME/.vim/bundle/Vundle.vim" ]];
then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
ln -s ~/dotrc/vimrc ~/.vimrc
