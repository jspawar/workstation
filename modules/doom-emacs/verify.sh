#!/bin/bash
set -eu

# verify doom-emacs is cloned and `doom` CLI is available on path
test -x "${HOME}/.emacs.d/bin/doom"
command -v doom

# verify doom-emacs is up-to-date
pushd "${HOME}/.emacs.d" > /dev/null
    git fetch
    test "$(git rev-parse HEAD)" = "$(git rev-parse origin/develop)"
popd > /dev/null

# verify doom-emacs config is cloned
test -d "${HOME}/.doom.d"
# rspec-mode is not installed with default config, but is installed with my config
test -d "${HOME}"/.emacs.d/.local/straight/repos/rspec-mode

# verify doom-emacs config is unmodified and up-to-date
pushd "${HOME}/.doom.d" > /dev/null
    # fail verification if config is dirty
    test -z "$(git status -s)"

    git fetch
    # TODO: switch default branch to `main`
    test "$(git rev-parse HEAD)" = "$(git rev-parse origin/master)"
popd > /dev/null

# run doctor to confirm installation is healthy
doom doctor
