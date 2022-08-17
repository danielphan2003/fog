function fg_blue() {
  echo -n '{{ Foreground "#4688c4" "'"$@"'" }}'
}

function fg_green() {
  echo -n '{{ Foreground "#41a25e" "'"$@"'" }}'
}

function fg_red() {
  echo -n '{{ Foreground "#ff0000" "'"$@"'" }}'
}

function fg_yellow() {
  echo -n '{{ Foreground "#ffff00" "'"$@"'" }}'
}

function bold() {
  echo -n '{{ Bold "'"$@"'" }}'
}

function debug_type() {
  echo -n "$1: $2: ${@: 3}" | gum format -t template
}

function error() {
  debug_type "$(fg_red "error")" "$1" "${@: 2}"
}

function trace() {
  debug_type "$(fg_blue "trace")" "$1" "${@: 2}"
}

function warn() {
  debug_type "$(fg_yellow "warn")" "$1" "${@: 2}"
}
