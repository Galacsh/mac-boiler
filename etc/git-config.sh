#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# ==================================

configure_git() {
  read -r -p "Git user name: " user_name
  read -r -p "Git user email: " user_email

  git config --global user.name "${user_name}"
  git config --global user.email "${user_email}"
  git config --global core.editor "nvim"
  git config --global init.defaultBranch "main"
  git config --global credential.helper "osxkeychain"
}

# ==================================

info "Configuring 'git'..."
configure_git
