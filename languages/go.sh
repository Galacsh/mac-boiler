#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# =========================================

download_link='https://go.dev/dl/'
arch='Apple macOS (ARM64)'

go_pkg_link() {
  curl -sL "${download_link}" |
    grep "${arch}" -B 2 |
    grep -o '<a .*href=.*>' |
    sed -e 's/<a .*href=['"'"'"]//' -e 's/["'"'"'].*$//' -e '/^$/ d' |
    awk '{ print "https://go.dev"$0 }'
}

install_go() {
  pkg_link=$(go_pkg_link)
  output_file=~/Downloads/go.pkg

  if [[ "${pkg_link}" =~ \.pkg$ ]]; then
    info 'Found download link.'
    curl --output-dir ~/Downloads --output 'go.pkg' --progress-bar -L "${pkg_link}"
    open "${output_file}"
  else
    open "${download_link}"
    err 'Cannot find download link. Install manually.'
  fi
}

# =========================================

info "Installing 'go' things..."

if no_cmd 'go'; then
  install_go
  info 'After installation, close and reopen your terminal.'
  exit 1
else
  echo "'go' things are already installed."
  exit 0
fi
