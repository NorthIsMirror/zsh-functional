filter() {
  (($#<1)) && {
    print -- "usage: $0 lambda-function [list]"
    return 1
  } >&2
  typeset f="$1"; shift
  filter_() {
    local x=$1
    eval "$f" && print -- "$x"
  }
  for x; filter_ "$x"
  return 0
}

filterf() {
  (($#<1)) && {
    print -- "usage: $0 function [list]"
    print
    print -- "example:"
    print -- '    > baz(){print "$*" | grep baz}'
    print -- "    > $0 baz titi bazaar biz"
    print -- '    bazaar'
    return 1
  } >&2
  typeset f="$1 \"\$x\""; shift
  filter "$f" "$@"
}

filtera() {
  (($#<1)) && {
    print -- "usage: $0 lambda-arithmetic [list]"
    return 1
  } >&2
  typeset f="(( $1 ))"; shift
  filter "$f" "$@"
}
