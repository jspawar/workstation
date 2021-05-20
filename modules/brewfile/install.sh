#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Installing various utilities via homebrew..."
brew bundle install --file="${SCRIPT_DIR}/Brewfile"
