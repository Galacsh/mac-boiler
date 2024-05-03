#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

log "Installing 'Alacritty'..."

if exists /Applications/Alacritty.app; then
  log "'Alacritty' is already installed."
  exit
fi

sudo su <<EOF
cd /usr/local/src || exit
git clone --depth 1 https://github.com/alacritty/alacritty.git
cd alacritty || exit
rustup override set stable
rustup update stable
make app
cp -r target/release/osx/Alacritty.app /Applications/
EOF
