#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# =================================================

info 'Setting up /usr/local/src...'

if [[ ! -d /usr/local/src ]]; then
  sudo mkdir -p /usr/local/src
fi

# =================================================

info 'Setting up /usr/local/bin...'

if [[ ! -d /usr/local/bin ]]; then
  sudo mkdir -p /usr/local/bin
fi
