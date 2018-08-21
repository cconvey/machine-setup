#!/bin/bash
set -e
set -u

declare THIS_SCRIPT_DIR="$(readlink -e "$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )" )"

function die {
    declare LINE
    for LINE in "${*}"; do
        echo "${LINE}" >&2
    done
    exit 1
}

function is_empty_dir {
    if [[ ${#} -ne 1 ]]; then
        die "is_empty_dir takes 1 argument"
    fi

    local DIR_NAME="${1}"
    if [ -n "$(find "${DIR_NAME}" -maxdepth 0 -type d -empty 2>/dev/null)" ]; then
        return 0
    else
        return 1
    fi
}

if [[ ${#} -ne 2 ]]; then
    die "USAGE: $(basename "${0}") <tool-configs-repo-dir> <dest-dir>"
fi

declare DEST_DIR="${2}"

declare TOOL_CONFIGS_REPO_DIR
if ! TOOL_CONFIGS_REPO_DIR="$(readlink -e "${1}")"; then
    die "ERROR: tool-configs-repo-dir doesn't exist."
fi

declare DEST_DIR="$(readlink -f "${2}")"
if ! is_empty_dir "${DEST_DIR}"; then
    die "ERROR: dest-dir isn't an empty directory"
fi

