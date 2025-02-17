#!/bin/bash
set -eux

# verify tmux is actually installed
command -v tmux

# verify config exists on filesystem
test -d "${HOME}/.config/tmux"
test -d "${HOME}/.tmux/plugins/tpm"

# verify plugins have been installed (using random one as a canary)
test -d "${HOME}/.config/tmux/plugins/tmux-yank"
