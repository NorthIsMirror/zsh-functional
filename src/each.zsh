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
  (($#<1)) && {
    print -- "usage: map funcname [list]"
    print
    print -- 'example:'
    print -- '    > foo(){print "x: $1"}'
    print -- '    > map foo a b c d'
    print -- '    x: a'
    print -- '    x: b'
    print -- '    x: c'
    print -- '    x: d'
    return 1
  }
  typeset f="$1 \"\$1\""; shift
  eachl "$f" "$@"
}

