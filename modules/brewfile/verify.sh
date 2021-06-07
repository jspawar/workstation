#!/bin/bash
set -eux

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

brew bundle check --file="${SCRIPT_DIR}/Brewfile"
