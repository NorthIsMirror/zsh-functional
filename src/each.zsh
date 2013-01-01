each() {
  (($#<1)) && {
    print -- "usage: $0 lambda-function [list]"
    print
    print -- 'example:'
    print -- "    > $0 'sudo kill \$1' \$(pidof multi-pid-app-u-hate)"
    return 1
  } >&2
  typeset f="$1"; shift
  typeset x
  typeset result=0
  each_() {
    local x=$1
    eval $f
  }
  for x; each_ "$x" || result=$?
  return $result
}

eachf() {
  (($#<1)) && {
    print -- "usage: $0 funcname [list]"
    print
    print -- 'example:'
    print -- '    > foo(){print "x: $1"}'
    print -- "    > $0 foo a b c d"
    print -- '    x: a'
    print -- '    x: b'
    print -- '    x: c'
    print -- '    x: d'
    return 1
  } >&2
  typeset f="$1 \"\$1\""; shift
  each "$f" "$@"
}

