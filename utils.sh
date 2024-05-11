#!/usr/bin/env bash

verbose_mode=${verbose_mode:-false}

show_if_verbose() {
  if ${verbose_mode}; then
    cat
  else
    cat >/dev/null
  fi
}

has_cmd() {
  command -v "$*" >/dev/null 2>&1
}

no_cmd() {
  ! has_cmd "$*"
}

exists() {
  test -e "$*"
}

not_exists() {
  ! exists "$*"
}

has_app() {
  exists "$(realpath /Applications/"$*")"
}

no_app() {
  ! has_app "$*"
}

is_empty() {
  test -z "$*"
}

is_not_empty() {
  test -n "$*"
}

contains() {
  local compare_this
  if [[ $# -gt 1 ]]; then
    compare_this=$1
    shift
  else
    compare_this=$(</dev/stdin)
  fi

  local patterns=()

  for expr in "$@"; do
    patterns+=("-e" "$expr")
  done

  echo "$compare_this" | grep -q "${patterns[@]}"
}

uppercase() {
  if (($#)); then
    echo "$@" | tr '[:lower:]' '[:upper:]'
  else
    tr '[:lower:]' '[:upper:]'
  fi
}

asdfasdf

asdf

lowercase() {
  if (($#)); then
    echo "$@" | tr '[:upper:]' '[:lower:]'
  else
    tr '[:upper:]' '[:lower:]'
  fi
}

valid_lines_of() {
  awk '{
    if (NF > 0 && $1 !~ /^#/) {
      print $0
    }
  }' "$*"
}

trim() {
  local var
  if (($#)); then
    var="$*"
  else
    var=$(</dev/stdin)
  fi

  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"

  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"

  printf "%s" "${var}"
}

pretty_print() {
  local -r code="$1" && shift
  if (($#)); then
    printf "\e[${code}m%s\e[0m\n" "$@"
  else
    printf "\e[${code}m%s\e[0m\n" "$(</dev/stdin)"
  fi
}

# shellcheck disable=SC2120
green() {
  pretty_print 32 "$@"
}

# shellcheck disable=SC2120
red() {
  pretty_print 31 "$@"
}

# shellcheck disable=SC2120
yellow() {
  pretty_print 33 "$@"
}

# shellcheck disable=SC2120
bold() {
  pretty_print 1 "$@"
}

# shellcheck disable=SC2120
info() {
  if (($#)); then
    printf '%s' '[INFO]' | bold | green |
      xargs -I @ printf '%s %s\n' @ "$@"
  else
    printf '%s' '[INFO]' | bold | green |
      xargs -I @ printf '%s %s\n' @ "$(</dev/stdin)"
  fi
}

# shellcheck disable=SC2120
error() {
  if (($#)); then
    printf '%s' '[ERROR]' | bold | red |
      xargs -I @ printf '%s %s\n' @ "$@" >&2
  else
    printf '%s' '[ERROR]' | bold | red |
      xargs -I @ printf '%s %s\n' @ "$(</dev/stdin)" >&2
  fi
}

# shellcheck disable=SC2145
highlight() {
  if (($#)); then
    echo "👉 $@" | yellow
  else
    echo "👉 $(</dev/stdin)" | yellow
  fi
}

log() {
  if ${verbose_mode}; then
    if (($#)); then
      echo "$@"
    else
      echo "$(</dev/stdin)"
    fi
  else
    if (($#)); then
      echo "$@" >/dev/null
    else
      echo "$(</dev/stdin)" >/dev/null
    fi
  fi
}

export -f show_if_verbose
export -f has_cmd
export -f no_cmd
export -f exists
export -f not_exists
export -f has_app
export -f no_app
export -f is_empty
export -f is_not_empty
export -f contains
export -f uppercase
export -f lowercase
export -f valid_lines_of
export -f trim
export -f pretty_print
export -f green
export -f red
export -f yellow
export -f bold
export -f info
export -f error
export -f highlight
export -f log
