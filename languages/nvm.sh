#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# =========================================

after_installation() {
  echo 'e.g.
  nvm install --lts
  nvm use --lts
  '
}

# =========================================

info "Installing 'nvm'..."

if [[ ! -d "${HOME}/.nvm" ]]; then
  # curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
  info 'Close and reopen your terminal.'
  info 'Then, install any version you want.'
  after_installation
  exit 1
else
  echo "'nvm' is already installed."
fi
