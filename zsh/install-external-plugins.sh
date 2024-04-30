#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

info "Installing external zsh plugins..."

plugins_dir=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins

# zsh-syntax-highlighting
plugin_dir=${plugins_dir}/zsh-syntax-highlighting
if [[ ! -d ${plugin_dir} ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${plugin_dir}"
else
  echo "'zsh-syntax-highlighting' already installed."
fi

# zsh-autosuggestions
plugin_dir=${plugins_dir}/zsh-autosuggestions
if [[ ! -d ${plugin_dir} ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions "${plugin_dir}"
else
  echo "'zsh-autosuggestions' already installed."
fi
