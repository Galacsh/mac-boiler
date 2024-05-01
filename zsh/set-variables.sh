#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source ../utils.sh

zshrc_file=$1

# ======================================

info 'Removing preconfigured variables...'

sed -E -i '' '/^ZSH_DISABLE_COMPFIX.*/d' "${zshrc_file}"

# ======================================

info 'Adding some variables...'

awk '{
  if ($0 ~ /^source.*oh-my-zsh\.sh$/) {
    print "ZSH_DISABLE_COMPFIX=true"
  }
  print $0
}' "${zshrc_file}" >"${zshrc_file}.tmp"

mv "${zshrc_file}.tmp" "${zshrc_file}"
