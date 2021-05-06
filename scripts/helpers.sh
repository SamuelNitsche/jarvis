function execSilent() {
  "$@" > /dev/null
}

function execVerySilent() {
  "$@" > /dev/null 2>&1
}