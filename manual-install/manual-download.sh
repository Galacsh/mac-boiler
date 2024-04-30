#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# ==================================

installed_applications=$(ls /Applications)
nothing_happened='true'

open_mark() {
  nothing_happened='false'
  open "$@"
}

check_and_open_download_link() {
  app_name=$1
  download_link=$2
  info "Checking if '${app_name}' is installed..."

  if echo "${installed_applications}" | contains "${app_name}"; then
    echo "'${app_name}' is already installed."
  else
    printf "\e[0;33m'%s'\e[0m is not installed yet.\n" "${app_name}"
    open_mark "${download_link}"
  fi
}

# ==================================

while IFS='|' read -r name url; do
  name=$(trim "${name}")
  url=$(trim "${url}")
  check_and_open_download_link "${name}" "${url}"
done < <(valid_lines_of download-links.txt)

# ==================================

if [[ ${nothing_happened} = 'true' ]]; then
  exit 0
else
  info 'Run again after installation is complete.'
  exit 1
fi
