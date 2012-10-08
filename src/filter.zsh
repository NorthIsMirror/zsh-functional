filterl() {
  typeset f="$1"; shift
  filter_() {
    local x=$1
    local f=$2
    eval "$f" && print -- "$x"
  }
  for x; filter_ "$x" "$f"
  return 0
}

filter() {
  (($#<1)) && {
    {
      print -- "usage: filter func list"
      print
      print -- "example:"
      print -- '    > baz(){print "$*" | grep baz}'
      print -- '    > filter baz titi bazaar biz'
      print -- '    bazaar'
    } >&2
    return 1
  }
  typeset f="$1 \"\$x\""; shift
  filterl "$f" "$@"
}

filtera() {
  typeset f="(( $1 ))"; shift
  filterl "$f" "$@"
}
