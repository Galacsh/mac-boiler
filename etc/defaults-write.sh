#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

log 'Force chrome incognito mode.'
defaults write com.google.chrome IncognitoModeAvailability -integer 2

# ==================================

log 'Repeat keys instead of showing an accent menu.'
defaults write -g ApplePressAndHoldEnabled -bool false
