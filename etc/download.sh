#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# ==================================

installed_applications=$(ls /Applications)
nothing_happened='true'

download() {
  curl --output-dir ~/Downloads --output "$1" --progress-bar -L "$2"
  nothing_happened='false'
  echo ~/Downloads/"$1"
}

# ==================================

info "Downloading 'Chrome'..."

if echo "${installed_applications}" | contains 'Google Chrome.app'; then
  echo "'Chrome' is already installed."
else
  downloaded=$(download 'google-chrome.dmg' "https://dl.google.com/chrome/mac/universal/stable/GGRO/googlechrome.dmg")
  open "${downloaded}"
fi

# ==================================

info "Downloading 'Microsoft Edge'..."

if echo "${installed_applications}" | contains 'Microsoft Edge.app'; then
  echo "'Microsoft Edge' is already installed."
else
  downloaded=$(download 'microsoft-edge.pkg' "https://go.microsoft.com/fwlink/?linkid=2093504")
  open "${downloaded}"
fi

# Discord, Slack
# ==================================

info "Downloading 'Discord'..."

if echo "${installed_applications}" | contains 'Discord.app'; then
  echo "'Discord' is already installed."
else
  downloaded=$(download 'discord.dmg' "https://discord.com/api/download/stable?platform=osx")
  open "${downloaded}"
fi

# ==================================

info "Downloading 'Slack'..."

if echo "${installed_applications}" | contains 'Slack.app'; then
  echo "'Slack' is already installed."
else
  downloaded=$(download 'slack.dmg' "https://slack.com/api/desktop.latestRelease?arch=universal&variant=dmg&redirect=true")
  open "${downloaded}"
fi

# ==================================

info "Downloading 'IntelliJ IDEA'..."

if echo "${installed_applications}" | contains 'IntelliJ IDEA.app'; then
  echo "'IntelliJ IDEA' is already installed."
else
  intellij_release_info='https://data.services.jetbrains.com/products/releases?code=IIU&latest=true&type=release'
  intellij_download_url=$( curl "${intellij_release_info}" | jq --raw-output '.IIU[0].downloads.macM1.link' )

  downloaded=$(download 'intellij-idea.dmg' "${intellij_download_url}")
  open "${downloaded}"
fi

# ==================================

info "Downloading 'Visual Studio Code'..."

if echo "${installed_applications}" | contains 'Visual Studio Code.app'; then
  echo "'Visual Studio Code' is already installed."
else
  downloaded=$(download 'vscode.zip' "https://code.visualstudio.com/sha/download?build=stable&os=darwin-universal")
  open "${downloaded}"
fi

# ==================================

if [[ ${nothing_happened} = 'true' ]]; then
  exit 0
else
  info 'Run again after installation is complete.'
  exit 1
fi
