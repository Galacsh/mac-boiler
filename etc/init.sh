#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

info "Setting some default..."
./defaults-write.sh
info 'Done.'

# =========================

info "Configuring 'git'..."
./git-config.sh
info 'Done.'

# =========================

info "Enabling 'Intellij IDEA CLI'..."
./intellij-cli.sh
info 'Done.'
