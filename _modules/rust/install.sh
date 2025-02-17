#!/bin/bash
set -eu

echo "Installing Rust and supporting utilities..."


if [ -z "$(command -v rustup)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path
elif [ -s "$(rustup check | grep "Update available")" ]; then
    echo "Update for Rust is available, updating..."
    rustup update
fi

# reload current bash session so that verification correctly finds Rust utilities in path
source "${HOME}"/.bashrc
