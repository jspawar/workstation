#!/bin/bash
set -euo pipefail

echo "Cloning gitstatus..."
mkdir -p "${HOME}/.config/gitstatus"
git clone --depth=1 https://github.com/romkatv/gitstatus "${HOME}/.config/gitstatus"
