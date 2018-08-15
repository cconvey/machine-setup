#!/bin/bash
set -e
set -u
set -x

declare SRC_ROOT=~/r/cconvey/tools-configs/master/my-home-dir

cp    "${SRC_ROOT}/ctags"            ~/.ctags
cp -r "${SRC_ROOT}/dot-config"       ~/.config
cp -r "${SRC_ROOT}/dot-vim"          ~/.vim
cp    "${SRC_ROOT}/gdbinit"          ~/.gdbinit
cp    "${SRC_ROOT}/gitconfig"        ~/.gitconfig
cp    "${SRC_ROOT}/gitignore_global" ~/.gitignore_global
ln -s "${SRC_ROOT}/vimrc"            ~/.vimrc
ln -s "${SRC_ROOT}/bashrc_common.sh" ~/.bashrc_common

mkdir -p ~/bin
cp "${SRC_ROOT}/bin/v" ~/bin/
cp "${SRC_ROOT}/bin/upd" ~/bin/

