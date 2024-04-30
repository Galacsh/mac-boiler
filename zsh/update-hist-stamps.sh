#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

zshrc_file=$1

info "Updating history timestamp format..."

replace_this='#?[[:blank:]]*HIST_STAMPS=.*'
hist_stamps='HIST_STAMPS="yyyy-mm-dd"'

sed -E -i '' "s/^${replace_this}/${hist_stamps}/" "${zshrc_file}"
