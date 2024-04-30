#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# =========================================

./usr-local.sh

# =========================================

./manual-download.sh || exit 0

# =========================================

./intellij-cli.sh

# =========================================

./install-with-git.sh
