#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

info "Installing 'Neovim'..."
./neovim.sh
info 'Done.'

# ==============================

info "Installing 'alacritty'..."
./alacritty.sh
info 'Done.'
