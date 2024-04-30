#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# =========================================

# Install brew if not installed.
# The script will return 1 if brew is installed.
# So we should catch and exit quietly.
./install-brew.sh || exit 0

# =========================================

info "Brew update..."
brew update

# =========================================

# Install packages specified in 'packages.txt' file.
./install-packages.sh

# =========================================

info "Brew upgrade..."
brew upgrade
