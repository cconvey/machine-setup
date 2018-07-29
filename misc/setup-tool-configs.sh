#!/bin/bash
set -x
set -e

export REPO_NAME=cconvey/tool-configs
export REPO_DIR=~/r/${REPO_NAME}
export REPO_URL="git@github.com:${REPO_NAME}.git"
export BRANCH=master

mkdir -p "${REPO_DIR}"
cd "${REPO_DIR}"
if [[ -d "${BRANCH}" ]]; then
	pushd "${BRANCH}"
	git pull
	popd
else
	git clone "${REPO_URL}" "${BRANCH}"
fi

if [[ -f ~/.bashrc ]]; then
	cp ~/.bashrc ~/.bashrc.old
fi

declare MHD=${REPO_DIR}/${BRANCH}/my-home-dir

# TODO: refactor so that this is definitely the first fragment to customize .bashrc
cp "${MHD}/bashrc_common.sh" ~/.bashrc

for F in \
	ctags \
	gdbinit \
	gitconfig \
	gitignore_global \
	screenrc \
	vimrc
do 
	cp "${MHD}/${F}" "${HOME}/.${F}"
done

cp -r "${MHD}/dot-config" "${HOME}/.config"

# TODO: refactor so vim-related stuff is in a vim-specified setup script
cp -r "${MHD}/dot-vim" "${HOME}/.vim"


