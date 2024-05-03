#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

config_file=${HOME}/.ssh/config
identity_file=${HOME}/.ssh/identity

# ===============================================

if exists "${identity_file}"; then
  log "'SSH' things are already configured."
fi

read -r -p "Comment for the SSH key: " comment

ssh-keygen -t ed25519 -f "${identity_file}" -C "${comment}"

cat <<EOF > "${config_file}"
Host github.com
  AddKeysToAgent yes
  UseKeychain yes
  IdentityFile ${identity_file}
EOF

eval "$(ssh-agent -s)"
ssh-add --apple-use-keychain "${identity_file}"
