#!/bin/bash
set -e
set -u

echo "Make sure you've created your ssh key"
echo "Make sure you've uploaded your public key to github"
echo "Make sure you've symlinked your public/private keys to 'id_dsa.pub' and 'id_dsa', so they're found by default"
echo "Make sure Github is happy: ssh -T git@github.com"

#TODO: have this set up ssh-agent as well


if [[ ! -d "${HOME}/.ssh" ]]; then
    declare OLD_UMASK="$(umask -S)"
    umask -S u=rwx,g=,o=
    mkdir -p "${HOME}/.ssh"
    unask -S "${OLD_UMASK}"
fi

CF="${HOME}/.ssh/config"
if [[ ! -f "${CF}" ]]; then
    declare OLD_UMASK="$(umask -S)"
    umask -S u=rwx,g=r,o=r
    touch "${CF}"
    unask -S "${OLD_UMASK}"
fi

declare COMMON_CF_LINK="${HOME}/.ssh/config-common"
if [[ -f "${COMMON_CF_LINK}" ]]; then
    cp "${COMMON_CF_LINK}" "${COMMON_CF_LINK}.bak"
    rm "${COMMON_CF_LINK}"
fi
declare COMMON_CF_IN_REPO="${HOME}/r/cconvey/tools-configs/master/my-home-dir/ssh-config"
ln -s "${COMMON_CF_IN_REPO}" "${COMMON_CF_LINK}"

echo "" >> "${CF}"
echo "Include ${COMMON_CF_LINK}" >> "${CF}"
echo "" >> "${CF}"

