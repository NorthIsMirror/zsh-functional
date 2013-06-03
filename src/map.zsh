map () {
  eval $initDocs
  usage "<lambda-function> list..."
  example "'<--- \$1 --->'" a b c d
  eval $doneDocs
  typeset f="$1"; shift
  map_() {
    echo ${(e)f}
  }
  eval $loopNow map_
}

# map () {
#   (($#<1)) && {
#     print -- "usage: $0 lambda-function [list]"
#     print
#     print -- 'example:'
#     print -- "    > $0 'echo \"x: \$1\"' a b c d"
#     print -- '    x: a'
#     print -- '    x: b'
#     print -- '    x: c'
#     print -- '    x: d'
#     return 1
#   } >&2
#   typeset f="$1"; shift
#   map_() {
#     echo ${(e)f}
#   }
#   eval $loopNow map_
# }

mapa () {
  (($#<1)) && {
    print -- "usage: $0 lambda-arithmetic [list]"
    print
    print -- 'example:'
    print -- "    > $0 '\$1+5' {1..3}"
    print -- '    6'
    print -- '    7'
    print -- '    8'
    return 1
  } >&2
  typeset f="\$[ $1 ]"; shift
  map $f $@
}
