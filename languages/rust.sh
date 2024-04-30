#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# =========================================

info 'Installing rust things...'

if no_cmd 'rustc'; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  info 'After installation, close and reopen your terminal.'
  exit 1
else
  echo "'rust' things are already installed."
fi
