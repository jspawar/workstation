#!/bin/bash
set -euxo pipefail

# TODO: install:
# bat
# coreutils?
# direnv
# docker
# fd
# htop
# jq
# pstree
# ripgrep
# rust-analyzer
# stow
# tldr
# tmux
# tree
# watch?
# z
sudo apt install -y \
  bat \
  direnv \
  

# TODO: install:
# shellcheck

# TODO: install:
# emacs?
# hx

# install gitstatus for prompt
git clone --depth=1 https://github.com/romkatv/gitstatus.git ~/gitstatus
# echo 'source ~/gitstatus/gitstatus.prompt.zsh' >>! ~/.zshrc

# TODO: install freetype font?
