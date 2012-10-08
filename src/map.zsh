mapl () {
  (($#<1)) && {
    print -- "usage: mapl lambda-function [list]"
    print
    print -- 'example:'
    print -- "    > mapl 'echo \"x: \$1\"' a b c d"
    print -- '    x: a'
    print -- '    x: b'
    print -- '    x: c'
    print -- '    x: d'
    return 1
  }
  typeset f="echo $1"; shift
  eachl $f $@
}

mapa () {
  (($#<1)) && {
    print -- "usage: mapa lambda-arithmetic [list]"
    print -- "       (shorthand for mapl '$[ f ]' [list])"
    print
    print -- 'example:'
    print -- "    > mapa '\$1+5' {1..3}"
    print -- '    6'
    print -- '    7'
    print -- '    8'
    return 1
  }
  typeset f="echo \$[ $1 ]"; shift
  eachl $f $@
}
