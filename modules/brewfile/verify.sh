#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

brew bundle check --file="${SCRIPT_DIR}/Brewfile"
