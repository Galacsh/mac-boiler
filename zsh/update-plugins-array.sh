#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source ../utils.sh

info "Updating 'plugins' array..."

zshrc_file=$1

# =========================================

info "Loading plugins to substitute..."

zsh_plugins=()

while read -r line; do
  zsh_plugins+=("${line}")
done < <(valid_lines_of plugins.txt)

# =========================================

plugins="plugins=\( "
for plugin in "${zsh_plugins[@]}"; do
  plugins+="$plugin "
done
plugins+="\)"

sed -E -i '' "s/^plugins=.*/${plugins}/" "${zshrc_file}"
