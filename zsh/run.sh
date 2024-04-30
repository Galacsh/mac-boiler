#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

zshrc_file=${HOME}/.zshrc

# ======================================

# Check if it's Darwin.
./is-darwin.sh

# ======================================

# Install 'oh-my-zsh'.
./install-omz.sh || exit 0

# ======================================

./update-hist-stamps.sh "${zshrc_file}"

# ======================================

./explicit-lang.sh "${zshrc_file}"

# ======================================

./install-external-plugins.sh

# ======================================

./update-plugins-array.sh "${zshrc_file}"

# ======================================

./update-theme.sh "${zshrc_file}"

# ======================================

./set-aliases.sh "${zshrc_file}"
