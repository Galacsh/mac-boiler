# Generalized function for color output
pretty_print() {
  local color_code="$1"
  shift
  printf "\e[${color_code}m%s\e[0m\n" "$*"
}

# Using color_print in specific color functions
green() {
  pretty_print 32 "$@"
}

red() {
  pretty_print 31 "$@"
}

yellow() {
  pretty_print 33 "$@"
}

bold() {
  pretty_print 1 "$@"
}

info() {
  prefix="$(bold "$(green '[INFO]')")"
  printf "%s %s\n" "${prefix}" "$*"
}

error() {
  prefix="$(bold "$(red '[ERROR]')")"
  printf "%s %s\n" "${prefix}" "$*" >&2
}

highlight() {
  yellow "$*"
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
  local patterns=()

  for expr in "$@"; do
    patterns+=("-e" "$expr")
  done

  grep -q "${patterns[@]}"
}

contains_v() {
  compare_this="$1"
  shift
  echo "${compare_this}" | contains "$@"
}

uppercase() {
  tr '[:lower:]' '[:upper:]'
}

uppercase_v() {
  echo "$*" | uppercase
}

valid_lines_of() {
  awk '{
    if (NF > 0 && $1 !~ /^#/) {
      print $0
    }
  }' "$*"
}

trim() {
  var=$(</dev/stdin)

  # remove leading whitespace characters
  var="${var#"${var%%[![:space:]]*}"}"

  # remove trailing whitespace characters
  var="${var%"${var##*[![:space:]]}"}"

  printf '%s\n' "$var"
}

trim_v() {
  echo "$*" | trim
}
