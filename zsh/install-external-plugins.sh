#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

plugins_dir=${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/plugins
syntax_highlighting_dir=${plugins_dir}/zsh-syntax-highlighting
autosuggestions_dir=${plugins_dir}/zsh-autosuggestions

# ===============================================

# zsh-syntax-highlighting
if not_exists "${syntax_highlighting_dir}"; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${syntax_highlighting_dir}"
else
  log "'zsh-syntax-highlighting' already installed."
fi

# zsh-autosuggestions
if not_exists "${autosuggestions_dir}"; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "${autosuggestions_dir}"
else
  log "'zsh-autosuggestions' already installed."
fi
