#!/bin/bash
set -eu

echo "Installing Ruby(s) and related utilities..."

if [ ! -d "${HOME}"/.rubies/ruby-2.7.* ]; then
    echo "Installing latest Ruby 2.7.x"
    ruby-install ruby 2.7
fi

if [ ! -d "${HOME}"/.rubies/ruby-3.* ]; then
    echo "Installing latest Ruby"
    ruby-install --latest ruby
fi

# TODO: ensure ~/.ruby-version contains latest Ruby version as its contents

# TODO: install system-wide gems (e.g. solargraph)
# gem install solargraph
