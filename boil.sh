#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ./strict-mode.sh
source ./utils.sh

init() {
  local -r init_type=$1
  padding=$(((32 - ${#init_type}) / 2))

  for ((i = 0; i < padding; i++)); do printf ' '; done
  echo "--- ${init_type} ---" | yellow | bold

  log "'$1/init.sh' will be executed."
  "$1"/init.sh
  echo
}

init brew
init zsh
init launch-agent
init languages
init self-install
init etc

