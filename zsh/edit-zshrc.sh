#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

zshrc_file=${1:-${HOME}/.zshrc}

# ===============================================

apply_awk() {
  local -r target=$1
  local -r temp_awk=$(mktemp)

  cat >"${temp_awk}"
  awk -f "${temp_awk}" "${target}" >"${target}.tmp"
  mv "${target}.tmp" "${target}"

  rm "${temp_awk}"
}

# ===============================================

log "Changing theme to 'agnoster'..."
apply_awk "${zshrc_file}" <<'EOF'
  {
    if ($0 ~ /^ZSH_THEME/) {
      print "ZSH_THEME='agnoster'"
      next
    }

    print $0
  }
EOF

# shellcheck disable=SC2016
highlight <<'EOF'
Go and edit agnoster theme.

  prompt_context() {
    - if [[ "$user" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    + if [[ -n "$SSH_CLIENT" ]]; then

  ...

  prompt_dir() {
    - prompt_segment blue $CURRENT_FG '%~'
    + prompt_segment blue $CURRENT_FG '%(5~|.../%4~|%~)'
  }
EOF

log 'Editing aliases...'
apply_awk "${zshrc_file}" <<'EOF'
  {
    if ($0 ~ /^alias/) next
    print $0

    if ($0 ~ /^# alias ohmyzsh/) {
      print "alias nv=\"nvim\""
      print "alias cd=\"z\""
    }
  }
EOF

log 'Editing history timestamp format...'
apply_awk "${zshrc_file}" <<'EOF'
  {
    if ($0 ~ /^# HIST_STAMPS=/) {
      print "HIST_STAMPS='yyyy-mm-dd'"
    } else {
      print $0
    }
  }
EOF

log 'Editing plugins...'
plugins='plugins=( '
while read -r line; do
  plugins+="${line} "
done < <(valid_lines_of plugins.txt)
plugins+=')'

apply_awk "${zshrc_file}" <<EOF
  {
    if (\$0 ~ /^plugins/) {
      print "${plugins}"
    } else {
      print \$0
    }
  }
EOF

log 'Editing variables...'
apply_awk "${zshrc_file}" <<'EOF'
  {
    if ($0 ~ /^export MANPAGER/) next
    if ($0 ~ /^ZSH_DISABLE_COMPFIX/) next

    if ($0 ~ /^source.*oh-my-zsh\.sh$/) {
     print "export MANPAGER='col -b | nvim -MR -'"
     print "ZSH_DISABLE_COMPFIX=true"
    }
    print $0
  }
EOF

log "Exporting 'LANG'..."
apply_awk "${zshrc_file}" <<'EOF'
  {
    if ($0 ~ /export LANG/) print "export LANG=en_US.UTF-8"
    else print $0
  }
EOF
