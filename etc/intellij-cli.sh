#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

if exists /usr/local/bin/idea; then
  log "'IntelliJ IDEA CLI' is already enabled."
  exit
fi

sudo su <<SUDO_EOF
cat << EOF > /usr/local/bin/idea
#!/usr/bin/env bash

open -na "IntelliJ IDEA.app" --args "$@"
EOF

chmod +x /usr/local/bin/idea
SUDO_EOF
