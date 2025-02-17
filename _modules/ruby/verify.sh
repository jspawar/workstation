#!/bin/bash
set -euxo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}"/find_latest_ruby_version.sh
readonly latest_ruby2_version="$(find_latest_ruby2_version)"

# verify latest Ruby 2.x is installed
test -d "${HOME}/.rubies/ruby-${latest_ruby2_version}"

# verify default chruby-selected Ruby version is latest 2.x
test "$(cat "${HOME}/.ruby-version")" = "ruby-${latest_ruby2_version}"

# verify chruby is using latest installed Ruby 2.x
test "${RUBY_ROOT}" = "${HOME}/.rubies/$(cat "${HOME}/.ruby-version")"

# verify various utilities are installed
command -v solargraph
