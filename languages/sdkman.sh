#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# =========================================

after_installation() {
  echo 'e.g.
  sdk list java
  sdk install java x.y.z-amzn
'
}

# =========================================

info "Installing 'sdkman'..."

if [[ ! -d "${HOME}/.sdkman" ]]; then
  curl -s "https://get.sdkman.io" | bash
  info 'Close and reopen your terminal.'
  info 'Then, install any version you want.'
  after_installation
  exit 1
else
  echo "'nvm' is already installed."
fi
