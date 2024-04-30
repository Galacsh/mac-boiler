#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

info "Checking if it's Darwin..."

if [[ ! "$(uname -s)" = 'Darwin' ]]; then
  err "This script is for 'Darwin'."
fi
