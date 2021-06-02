#!/bin/bash
set -euo pipefail

# TODO: also ensure latest Ruby 2.7.x and 3.x is installed?
test -d "${HOME}"/.rubies/ruby-2.7.*
test -d "${HOME}"/.rubies/ruby-3.*

# system-wide Ruby utilities
command -v solargraph
