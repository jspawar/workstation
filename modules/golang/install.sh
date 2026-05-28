#!/bin/bash
set -eu

echo "Installing golang utilities..."

set -x
go install -v golang.org/x/tools/gopls@latest                               # LSP
go install -v github.com/go-delve/delve/cmd/dlv@latest                      # Debugger
go install -v golang.org/x/tools/cmd/goimports@latest                       # Formatter
go install -v github.com/nametake/golangci-lint-langserver@latest           # Linter
go install -v github.com/golangci/golangci-lint/v2/cmd/golangci-lint@latest # Linter cli

# prompt
go install -v github.com/justjanne/powerline-go@latest
