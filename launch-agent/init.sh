#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

info "Remapping keys..."
./install.sh remap-keys.sh
info 'Done.'

