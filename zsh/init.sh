#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================

info "Installing 'oh-my-zsh'..."
./install-omz.sh || exit
info 'Done.'

info "Installing plugins..."
./install-external-plugins.sh
info 'Done.'

info "Editing '.zshrc' file..."
./edit-zshrc.sh
info 'Done.'
