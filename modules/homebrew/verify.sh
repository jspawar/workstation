#!/bin/bash
set -eux

# Need to do this on fresh install
eval "$(/opt/homebrew/bin/brew shellenv zsh)"

command -v brew
