function execSilent() {
  "$@" > /dev/null
}

function execVerySilent() {
  "$@" > /dev/null 2>&1
}

function passwordgen() {
  l=$1
  [ "$l" == "" ] && l=16
  tr -dc A-Za-z0-9 < /dev/urandom | head -c ${l} | xargs
}