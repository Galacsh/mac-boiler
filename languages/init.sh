#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

info "Installing 'rust'..."
./rust.sh || exit
info 'Done.'

info "Installing 'go'..."
./go.sh || exit
info 'Done.'

info "Installing 'pnpm'..."
./pnpm.sh || exit
info 'Done.'

info "Installing 'sdkman'..."
./sdkman.sh || exit
info 'Done.'
