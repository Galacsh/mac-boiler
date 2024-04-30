#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

zshrc_file=$1

# ======================================

info 'Removing preconfigured aliases...'

sed -E -i '' '/^alias.*/d' "${zshrc_file}"

# ======================================

info 'Adding some aliases...'

cat << EOF >> "${zshrc_file}"
alias nv="nvim"
alias cd="z"
EOF