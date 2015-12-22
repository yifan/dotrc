#!/bin/bash -e
test -e "$HOME/.vim/bundle/Vundle.vim" ||  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
test -d ~/.vim/colors || mkdir -p ~/.vim/colors
test -e ~/.vim/colors/distinguished.vim || curl -o ~/.vim/colors/distinguished.vim https://github.com/Lokaltog/vim-distinguished/raw/develop/colors/distinguished.vim
test -e ~/.vimrc || ln -s ~/dotrc/vimrc ~/.vimrc
test -e ~/.gitconfig || ln -s ~/dotrc/gitconfig ~/.gitconfig
test -e ~/.slate || ln -s ~/dotrc/slate ~/.slate
test -e ~/.bash_profile || ln -s ~/dotrc/bash_profile ~/.bash_profile
