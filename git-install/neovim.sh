#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

log "Installing 'Neovim'..."

if has_cmd 'nvim'; then
  log "'Neovim' is already installed."
  exit
fi

sudo su <<EOF
cd /usr/local/src || exit
git clone --depth 1 https://github.com/neovim/neovim
cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
make install
EOF

highlight <<HL_EOF
  Uninstall:
    sudo su << EOF
      cd /opt/neovim
      cmake --build build/ --target uninstall
    EOF

  Update:
    sudo su << EOF
      cd /opt/neovim
      cmake --build build/ --target uninstall
      git pull
      make CMAKE_BUILD_TYPE=RelWithDebInfo
      make install
    EOF
HL_EOF
