#!/bin/bash
set -euo pipefail

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "${SCRIPT_DIR}"/find_latest_ruby_version.sh
readonly latest_ruby2_version="$(find_latest_ruby2_version)"

echo "Installing Ruby and Ruby utilities..."

# install latest Ruby 2.x as needed
if [ ! -d "${HOME}"/.rubies/ruby-"${latest_ruby2_version}" ]; then
    echo "Installing latest Ruby 2.x..."
    ruby-install ruby "${latest_ruby2_version}"
fi

# TODO: install absolute latest version of Ruby

# ensure default chruby version is latest Ruby 2.x
echo "ruby-${latest_ruby2_version}" > "${HOME}"/.ruby-version

# install various Ruby utilities
echo "Ensuring Ruby environment is setup correctly..."
test "$(which gem)" = "${HOME}/.rubies/ruby-${latest_ruby2_version}/bin/gem"

echo "Installing various Ruby utilities..."
# TODO: replace with a Gemfile?
gem install solargraph
