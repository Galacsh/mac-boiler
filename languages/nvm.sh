#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

nvm_dir=${HOME}/.nvm
nvm_version='v0.39.7'

# ================================================

if exists "${nvm_dir}"; then
  log "'nvm' is already installed."
  exit
fi

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/${nvm_version}/install.sh | bash

highlight <<EOF
Close and reopen your terminal.
Then, install any version you want.

e.g.
  nvm install --lts
  nvm use --lts
EOF
exit 1
