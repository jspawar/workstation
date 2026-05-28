#!/bin/bash
set -eu

echo "Installing tmux plugins..."

mkdir -p "${HOME}/.tmux/plugins"

if [[ ! -d ~/.tmux/plugins/tpm ]]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi

"${HOME}"/.tmux/plugins/tpm/bin/install_plugins
"${HOME}"/.tmux/plugins/tpm/bin/update_plugins all
"${HOME}"/.tmux/plugins/tpm/bin/clean_plugins
