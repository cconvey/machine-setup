#!/bin/bash
set -x
set -e
set -u

echo "WARNING: THIS IS PROBABLY HANDLED BY ANOTHER OF MY SCRIPTS" >&2

export REPO_NAME=cconvey/dfg-me
export REPO_DIR=~/r/${REPO_NAME}
export REPO_URL="git@github.com:${REPO_NAME}.git"
export BRANCH=master

mkdir -p "${REPO_DIR}"
cd "${REPO_DIR}"
git clone "${REPO_URL}" "${BRANCH}"
