#!/bin/bash
set -euo pipefail

# bash
test -f "${HOME}/.bashrc"
test -f "${HOME}/.bash_profile"
test -f "${HOME}/.inputrc"
test -d "${HOME}/.config/bash"

# git
test -f "${HOME}/.gitconfig"
test "$(git config --get alias.br)" = "branch"

# ruby
test -f "${HOME}/.ruby-version"
test "${RUBY_ROOT}" = "${HOME}/.rubies/$(cat "${HOME}/.ruby-version")"
