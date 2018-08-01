#!/bin/bash
set -e
set -x
set -u

declare THIS_SCRIPT_DIR="$(readlink -f $( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd ) )"

declare FONTS_SRC_DIR="$(readlink -e "${THIS_SCRIPT_DIR}/../fonts")"
if [[ ! -d "${FONTS_SRC_DIR}" ]]; then
    echo "Can't find FONTS_SRC_DIR '${FONTS_SRC_DIR}'" >&2
    exit 1
fi

declare FONTS_DEST_DIR="${HOME}/.fonts"
mkdir -p "${FONTS_DEST_DIR}"
unzip ${FONTS_SRC_DIR}/*.zip -d "${FONTS_DEST_DIR}"
sudo fc-cache -f -v


