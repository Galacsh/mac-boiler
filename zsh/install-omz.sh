#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

info "Installing 'oh-my-zsh'..."

if [[ -z ${ZSH} ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  log 'Run again with a new session.'
  exit 1
else
  echo "'oh-my-zsh' already installed."
  exit 0
fi
