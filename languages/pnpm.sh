#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

if has_cmd 'pnpm'; then
  log "'pnpm' things are already installed."
  exit
fi

curl -fsSL https://get.pnpm.io/install.sh | sh -

highlight <<EOF
Close and reopen your terminal.
Then, install any version you want.

e.g.
  pnpm env list --remote
  pnpm env use --global lts
EOF
exit 1
