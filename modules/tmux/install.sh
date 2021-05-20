#!/bin/bash
set -eu

echo "Installing Luan's tmux config..."

set +e
  test -f "${HOME}/.tmux.conf" && mv -f "${HOME}/.tmux.conf" "${HOME}/.tmux.conf.bak"
  test -d "${HOME}/.tmux" && rm -rf "${HOME}/.tmux.bak" && mv "${HOME}/.tmux" "${HOME}/.tmux.bak"
  test -d "${HOME}/.config/tmux" && rm -rf "${HOME}/.config/tmux.bak" && mv -f "${HOME}/.config/tmux" "${HOME}/.config/tmux.bak"
set -e

git clone https://github.com/luan/tmuxfiles.git "${HOME}/.config/tmux"
"${HOME}/.config/tmux/install"
