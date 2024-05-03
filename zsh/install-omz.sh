#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

if is_not_empty "${ZSH}"; then
  log "'oh-my-zsh' is already installed."
  exit
fi

log "'oh-my-zsh' is not installed."
/usr/bin/env bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
highlight 'Run again with a new session.'
exit 1
