#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

if has_cmd 'rustc'; then
  log "'rust' things are already installed."
  exit
fi

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

highlight 'After installation, close and reopen your terminal.'
exit 1
