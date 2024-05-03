#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

info "Setting '/usr/local'..."
./usr-local.sh
info 'Done.'

# =============================================================================

info "Checking if there are any packages that need to be installed manually..."
./install-manually.sh || exit
info 'Done.'
