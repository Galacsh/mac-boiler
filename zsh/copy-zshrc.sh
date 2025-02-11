#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

zshrc_file=${1:-${HOME}/.zshrc}
template_file="zshrc.zsh-template"

# ===============================================

if [[ -e "${zshrc_file}" ]]; then
  log "'.zshrc' already exists."
  highlight "You need to manually copy the contents of the '~/zshrc.template' file to '~/.zshrc'."
  (cp -v -n "${template_file}" "${HOME}/${template_file}" 2>&1 | log) \
    || highlight "Maybe 'zshrc.zsh-template' already exists?"
else
  cp -v -n "${template_file}" "${zshrc_file}" 2>&1 | highlight
fi
