#!/bin/bash -e
test -d ~/.vim/colors || mkdir -p ~/.vim/colors
test -e ~/.vim/colors/distinguished.vim || curl -o ~/.vim/colors/distinguished.vim -L https://github.com/Lokaltog/vim-distinguished/raw/develop/colors/distinguished.vim
test -e ~/.vimrc || ln -s ~/dotrc/vimrc ~/.vimrc
test -e ~/.gitconfig || ln -s ~/dotrc/gitconfig ~/.gitconfig
test -e ~/.slate || ln -s ~/dotrc/slate ~/.slate
test -e ~/.bash_profile || ln -s ~/dotrc/bash_profile ~/.bash_profile
test -e ~/.aliases || ln -s ~/dotrc/aliases ~/.aliases
test -e ~/.gitignore || ln -s ~/dotrc/gitignore ~/.gitignore

# setting up vim
git clone https://github.com/VundleVim/Vundle.vim.git /.vim/bundle/vundle.vim
vim +BundleInstall +qall
