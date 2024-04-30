#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

if no_cmd 'brew'; then
  info 'Installing brew...'
  /usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  info 'Run again with a new session.'
  exit 1
else
  info "'brew' is already installed."
  exit 0
fi
