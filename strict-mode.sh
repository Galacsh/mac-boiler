#!/usr/bin/env bash

set -eou pipefail >/dev/null

export verbose_mode=${verbose_mode:-false}
export debug_mode=${debug_mode:-false}

# Read options
while getopts ':dv' opt; do
  case ${opt} in
  'd') debug_mode=true ;;
  'v') verbose_mode=true ;;
  '?') printf "\e[31mUnknown option '-%s'.\e[m\n" "${OPTARG}" && exit 1 ;;
  '*') printf "\e[31mUnexpected error while processing options.\e[m\n" && exit 1 ;;
  esac
done

if ${debug_mode}; then set -x; fi

# Remove options from args
shift $((OPTIND - 1))
