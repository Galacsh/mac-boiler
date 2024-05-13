#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ========================================

log 'Fetching installed packages...'
installed="$(brew list)"

echo "${installed[*]}" | awk '
  BEGIN { i=0 }
  {
    printf "\t%-24s", $0
    i=i+1
    if (i == 3) {
      i=0
      printf "\n"
    }
  }
' | log

log 'Load packages and install...'
while IFS='|' read -r opt pkg_name; do
  # trim each text
  opt=$(trim "${opt}")
  pkg_name=$(trim "${pkg_name}")

  # skip if installed
  if echo "${installed}" | contains "${pkg_name}"; then
    log "'${pkg_name}'(${opt}) is already installed."
  # install with brew
  else
    log "'${pkg_name}'(${opt}) is not installed."
    echo "${opt} ${pkg_name}" |
      awk '{ print "--"$1" "$2 }' |
      xargs brew install
  fi
done < <(valid_lines_of packages.txt)

