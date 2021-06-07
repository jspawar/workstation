#!/usr/bin/env bash
set -euo pipefail

# TODO: add some backoff retrying if getting rate-limited?
# print out latest Ruby 2.x version
function find_latest_ruby2_version() {
    local ruby_versions_file_url="https://raw.githubusercontent.com/postmodern/ruby-versions/master/ruby/stable.txt"

    curl "${ruby_versions_file_url}" 2>/dev/null | rg -v "^3\..*$" | sort --version-sort --reverse | head -n 1
}
