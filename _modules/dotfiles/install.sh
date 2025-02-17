#!/bin/bash
set -eu

echo "Linking various dotfiles..."

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for pkg in "${SCRIPT_DIR}"/*/; do
    stow -d "${SCRIPT_DIR}" -t "${HOME}" "$(basename "${pkg}")"
done
