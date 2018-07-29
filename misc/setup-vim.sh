#!/bin/bash
set -e
set -x
set -u

sudo apt install \
    exuberant-ctags \
    fonts-powerline

if [[ -d ~/.vim/bundle/Vundle.vim ]]; then
    cd ~/.vim/bundle/Vundle.vim
    git pull
else
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

vim +PluginInstall +qall

