#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source ../utils.sh

# =========================================

./defaults-write.sh

# =========================================

./git-config.sh
