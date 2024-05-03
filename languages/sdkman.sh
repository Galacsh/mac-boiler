#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

if exists "${HOME}/.sdkman"; then
  echo "'sdkman' is already installed."
  exit
fi

curl -s "https://get.sdkman.io" | bash

highlight <<EOF
Close and reopen your terminal.
Then, install any version you want.

e.g.
  sdk list java
  sdk install java x.y.z-amzn
EOF
exit 1
