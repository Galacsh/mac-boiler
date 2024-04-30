#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# =========================================

./usr-local-bin.sh

# =========================================

./download.sh || exit 0

# =========================================

./intellij-cli.sh

# =========================================

./defaults-write.sh
