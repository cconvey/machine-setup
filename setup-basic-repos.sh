#!/bin/bash
set -x

declare D
declare R
declare B

D=~/r/cconvey/tools-configs
R="git@github.com:cconvey/tool-configs.git"
B="master"

mkdir -p "${D}"
cd "${D}"
git clone "${R}" "${B}"
popd

D=~/r/cconvey/dfg-me
R="git@github.com:cconvey/tool-configs.git"
B="master"

mkdir -p "${D}"
cd "${D}"
git clone "${R}" "${B}"
