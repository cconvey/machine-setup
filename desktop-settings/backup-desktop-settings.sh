#!/bin/bash
set -e
set -u

declare THIS_SCRIPT_DIR="$(readlink -f $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) )"

declare F="${THIS_SCRIPT_DIR}/org.gnome.terminal.dump"
dconf dump /org/gnome/terminal/ > "${F}"
