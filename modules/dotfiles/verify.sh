#!/bin/bash
set -euo pipefail

# Bash
test -f "${HOME}/.bashrc"
test -f "${HOME}/.bash_profile"
test -d "${HOME}/.config/bash"
