#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

info "Remapping 'Fn' to 'F16'..."
./install.sh remap-fn-to-f16.sh
info 'Done.'

# ================================================

info "Remapping 'right command' to 'F17'..."
./install.sh remap-right-cmd-to-f17.sh
info 'Done.'

# ================================================

info "Remapping 'right option' to 'F18'..."
./install.sh remap-right-opt-to-f18.sh
info 'Done.'
