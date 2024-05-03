#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ================================================

go_link='https://go.dev'
download_link="${go_link}/dl/"
arch='Apple macOS (ARM64)'
downloads_dir=${HOME}/Downloads

# ================================================

go_pkg_link() {
  curl -sL "${download_link}" |
    grep "${arch}" -B 2 |
    grep -o '<a .*href=.*>' |
    sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d'
}

download() {
  curl --output-dir "${downloads_dir}" --output "$1" --progress-bar -L "$2"
  echo ~/Downloads/"$1"
}

install_go() {
  pkg_link="${go_link}$(go_pkg_link)"

  if [[ ! "${pkg_link}" =~ \.pkg$ ]]; then
    open "${download_link}"
    error 'Cannot find download link. Install manually.'
    exit 1
  fi

  log 'Found download link.'
  download 'go.pkg' "${pkg_link}" | xargs open
}

# =========================================

if has_cmd 'go'; then
  log "'go' things are already installed."
  exit
fi

install_go

highlight 'After installation, close and reopen your terminal.'
exit 1
