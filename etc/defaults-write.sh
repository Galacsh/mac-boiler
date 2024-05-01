#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source ../utils.sh

# ==================================

info 'Force chrome incognito mode.'
defaults write com.google.chrome IncognitoModeAvailability -integer 2

# ==================================

info 'Repeat keys instead of showing an accent menu.'
defaults write -g ApplePressAndHoldEnabled -bool false
