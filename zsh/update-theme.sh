#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

info "Updating 'theme'..."

zshrc_file=$1

# ======================================

theme='agnoster'

# ======================================

sed -E -i '' "s/^ZSH_THEME=.*/ZSH_THEME=\"${theme}\"/" "${zshrc_file}"

info 'Now, go and edit agnoster theme.'

echo '
  prompt_context() {
    - if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    + if [[ -n "$SSH_CLIENT" ]]; then

  ...

  prompt_dir() {
    - prompt_segment blue $CURRENT_FG '"'"'%~'"'"'
    + prompt_segment blue $CURRENT_FG '"'"'%(5~|.../%4~|%~)'"'"'
  }
'
