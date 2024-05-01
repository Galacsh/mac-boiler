#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source ../utils.sh

zshrc_file=$1

info "Explicitly exporting 'LANG'..."

export_lang='export LANG=en_US\.UTF-8'
replace_this="#?[[:blank:]]*${export_lang}"

sed -E -i '' "s/^${replace_this}/${export_lang}/" "${zshrc_file}"
