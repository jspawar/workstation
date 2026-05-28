#!/bin/bash
set -euxo pipefail

# TODO: update for zsh?
# bash
test -f "${HOME}/.bashrc"
test -f "${HOME}/.bash_profile"
test -f "${HOME}/.inputrc"
test -d "${HOME}/.config/bash"

# git
test -f "${HOME}/.gitconfig"
test "$(git config --get alias.br)" = "branch"
# TODO: move this into a `work` branch?
test "$(git config --get credential.helper)" = "osxkeychain"
