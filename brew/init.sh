#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ========================================

info "Installing brew if not installed..."
./install-brew.sh || exit
info 'Done.'

# =================================

info 'Brew update...'
brew update
info 'Done.'

# ===================================

info 'Installing packages...'
./install-packages.sh
info 'Done.'

# ===================================

info 'Brew upgrade...'
brew upgrade
info 'Done.'
