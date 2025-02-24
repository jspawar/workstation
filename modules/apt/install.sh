#!/bin/bash
set -euo pipefail

echo "Updating package lists..."
sudo apt-get update

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
echo "Installing packages..."
sudo apt-get install -y \
  aspnetcore-runtime-8.0 \
  bat \
  direnv \
  dotnet-sdk-8.0 \
  fd-find \
  htop \
  jq \
  psmisc \
  ripgrep \
  stow \
  tmux \
  tree \
  zoxide
  
# TODO: install:
# shellcheck

# TODO: install:
# emacs?
# hx

# TODO: install gitstatus for prompt elsewhere

# TODO: install freetype font?
