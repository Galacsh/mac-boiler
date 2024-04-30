#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

zshrc_file=$1

# ======================================

info 'Editing aliases...'

sed -E '/^alias.*/d' "${zshrc_file}" | awk '{
  print $0

  if ($0 ~ /^# alias ohmyzsh/) {
    print "alias nv=\"nvim\""
    print "alias cd=\"z\""
  }
}' > "${zshrc_file}.tmp"

mv "${zshrc_file}.tmp" "${zshrc_file}"

info 'Done'
