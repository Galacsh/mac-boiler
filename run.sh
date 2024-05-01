#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source utils.sh

init() {
  printf "\n=========== %s ===========\n" "$(uppercase "$1")"
  "$1"/run.sh
  info 'Finished.'
}

init brew
init zsh
init launch-agent
init languages
init etc
