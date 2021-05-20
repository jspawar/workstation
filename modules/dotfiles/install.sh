#!/bin/bash
set -eu

echo "Linking various dotfiles..."

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Bash
stow -d "${SCRIPT_DIR}" -t "${HOME}" bash
