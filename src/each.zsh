eachl() {
  typeset f="$1"; shift
  typeset x
  typeset result=0
  each_() {
    local x=$1
    local f=$2
    eval $f
  }
  for x; each_ "$x" "$f" || result=$?
  return $result
}

each() {
  typeset f="$1 \"\$1\""; shift
  eachl "$f" "$@"
}

