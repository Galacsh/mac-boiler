#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

info "Remapping 'right command' to 'F18'."
./install.sh remap-right-cmd-to-f18.sh
info 'Done.'
