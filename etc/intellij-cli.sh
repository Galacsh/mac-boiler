#!/usr/bin/env bash

cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" || exit
source ../utils.sh

# ==================================

info 'Enabling IntelliJ IDEA CLI...'

cat << EOF | sudo tee /usr/local/bin/idea > /dev/null
#!/bin/sh

open -na "IntelliJ IDEA.app" --args "$@"
EOF

sudo chmod +x /usr/local/bin/idea
