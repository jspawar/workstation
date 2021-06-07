#!/bin/bash
set -euxo pipefail

# bash
test -f "${HOME}/.bashrc"
test -f "${HOME}/.bash_profile"
test -f "${HOME}/.inputrc"
test -d "${HOME}/.config/bash"

# git
test -f "${HOME}/.gitconfig"
test "$(git config --get alias.br)" = "branch"

# chruby
test -f "${HOME}/.ruby-version"
