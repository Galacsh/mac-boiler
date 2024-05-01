#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit
source ../utils.sh

# ==================================

info 'Enabling IntelliJ IDEA CLI...'

sudo su <<EOF
cat << BOF > /usr/local/bin/idea
#!/usr/bin/env bash

open -na "IntelliJ IDEA.app" --args "$@"
BOF
EOF

sudo chmod +x /usr/local/bin/idea
