#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source ../utils.sh

# =========================================

info 'Loading packages to install...'

packages=()

while read -r line; do
  packages+=("$line")
done < <(valid_lines_of packages.txt)

# =========================================

info 'Fetching installed packages...'

installed="$(brew list)"

# =========================================

brew_install() {
  pkg_name=$(echo "$1" | awk '{print $NF}')
  if echo "${installed}" | contains "${pkg_name}"; then
    echo "'${pkg_name}' is already installed."
  else
    brew install $1
  fi
}

info 'Installing packages...'

for package in "${packages[@]}"; do
  brew_install "${package}"
done
