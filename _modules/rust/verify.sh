#!/bin/bash
set -eux

# verify Rust is installed at all
command -v rustup
command -v rustc
command -v cargo

# verify latest version of Rust toolchain is installed
test -z "$(rustup check | grep "Update available")"

# verify latest version of Rust utilities (e.g. rust-analyzer) are installed
# NOTE: `rust-analyzer` installation is managed by Homebrew, which should take care of updating it to latest
command -v rust-analyzer
