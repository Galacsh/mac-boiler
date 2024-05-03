#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source ../utils.sh

# =================================================

log 'Setting up /usr/local/src...'

if not_exists /usr/local/src; then
  sudo mkdir -p /usr/local/src
else
  log "'/usr/local/src' already exists."
fi

# =================================================

log 'Setting up /usr/local/bin...'

if not_exists /usr/local/bin; then
  sudo mkdir -p /usr/local/bin
else
  log "'/usr/local/bin' already exists."
fi
