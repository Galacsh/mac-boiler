#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

installed_applications=$(ls /Applications)
have_to_stop=false

# ========================================

check_and_open_download_link() {
  app_name=$1
  download_link=$2
  log "Checking if '${app_name}' is installed..."

  if echo "${installed_applications}" | contains "${app_name}"; then
    log "'${app_name}' is already installed."
  else
    log "'${app_name}' is not installed yet."
    have_to_stop=true
    open "${download_link}"
  fi
}

# ==================================

while IFS='|' read -r name url; do
  name=$(trim "${name}")
  url=$(trim "${url}")
  check_and_open_download_link "${name}" "${url}"
done < <(valid_lines_of download-links.txt)

if ${have_to_stop}; then
  highlight 'Run again after installation is complete.'
  exit 1
fi
