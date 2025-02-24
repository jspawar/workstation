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

# systemd
if [ -n "$WSL_DISTRO_NAME" ]; then
  stat "${HOME}/.config/systemd/user/ssh-agent.service"
fi
