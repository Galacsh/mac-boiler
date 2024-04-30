#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# ==================================

after_neovim_installation() {
  echo '
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
  '
}

# ==================================

info "Installing 'Neovim'..."

if no_cmd 'nvim'; then
sudo su << EOF
  cd /usr/local/src || exit
  git clone --depth 1 https://github.com/neovim/neovim
  cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
  make install
EOF
else
  info "'Neovim' is already installed."
fi

after_neovim_installation
info "Done."

# ==================================

info "Installing 'Alacritty'..."

if [[ ! -d /Applications/Alacritty.app ]]; then
sudo su << EOF
  cd /usr/local/src || exit
  git clone --depth 1 https://github.com/alacritty/alacritty.git
  cd alacritty || exit
  rustup override set stable
  rustup update stable
  make app
  cp -r target/release/osx/Alacritty.app /Applications/
EOF
else
  info "'Alacritty' is already installed."
fi

info "Done."
