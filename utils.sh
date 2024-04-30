info() {
  printf "\e[1;32m[INFO]\e[0m %s\n" "$1"
}

err() {
  printf "\e[1;31m[ERROR]\e[0m %s\n" "$1" >&2
  exit 1
}

has_cmd() {
  command -v "$1" > /dev/null 2>&1
}

no_cmd() {
  ! has_cmd "$1"
}

need_cmd() {
  if ! has_cmd "$1"; then
    err "'$1' command not found."
  fi
}

is_empty() {
  test -z "$1"
}

is_not_empty() {
  ! is_empty "$1"
}

contains() {
  grep -q "$1"
}

uppercase() {
  echo "$1" | awk '{ print toupper($0) }'
}

valid_lines_of() {
  awk '{ if (NF > 0 && $1 !~ /^#/) { print $0 } }' $1
}

trim() {
    local var="$*"
    # remove leading whitespace characters
    var="${var#"${var%%[![:space:]]*}"}"
    # remove trailing whitespace characters
    var="${var%"${var##*[![:space:]]}"}"
    printf '%s' "$var"
}
