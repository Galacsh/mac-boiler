#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ========================================

if has_cmd 'brew'; then
  log "'brew' is already installed."
  exit
fi

log "'brew' is not installed."
/usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
highlight 'Run again with a new session.'
exit 1
