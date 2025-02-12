#!/usr/bin/env bash

cd -- "$(dirname -- "${BASH_SOURCE[0]}")" || exit

source ../strict-mode.sh
source ../utils.sh

# ===============================================

themes_dir=${ZSH_CUSTOM:-${HOME}/.oh-my-zsh/custom}/themes
pretty_robbyrussell=pretty-robbyrussell.zsh-theme

# ===============================================

# Pretty robbyrussell
if not_exists "${themes_dir}/${pretty_robbyrussell}"; then
  cp "${pretty_robbyrussell}" "${themes_dir}/${pretty_robbyrussell}"
else
  log "'pretty-robbyrussell.zsh-theme' already installed."
fi

