#!/bin/bash
set -eu

echo "Installing golang utilities..."

set -x
# doom-emacs support
go get -v golang.org/x/tools/gopls@latest
go get -v github.com/motemen/gore/cmd/gore
go get -v github.com/stamblerre/gocode
go get -v golang.org/x/tools/cmd/godoc
go get -v golang.org/x/tools/cmd/goimports
go get -v golang.org/x/tools/cmd/gorename
go get -v golang.org/x/tools/cmd/guru
go get -v github.com/cweill/gotests/...
go get -v github.com/fatih/gomodifytags
