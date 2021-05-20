#!/bin/bash
set -eu

echo "Linking various dotfiles..."

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# TODO: have it just loop over all directories here
# Bash
stow -d "${SCRIPT_DIR}" -t "${HOME}" bash
