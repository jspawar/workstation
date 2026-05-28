#!/bin/bash
set -eux

# TODO: need to source latest shell on fresh installs

# Editor support
command -v gopls
command -v dlv
command -v goimports
command -v golangci-lint-langserver
command -v golangci-lint
