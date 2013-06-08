fold () {
  (($#<2)) && {
    print -- "usage: $0 lambda-function acc [list]"
    return 1
  } >&2
  local body=$1
  local acc=$2
  shift 2
  fold_ () {
    local acc=$1
    local x=$2
    eval "${(e)body}"
  }
  helper_ () {
    acc=$(fold_ $acc $1)
  }
  eval $loopNow helper_
  print -- $acc
}

foldf () {
  (($#<2)) && {
    print -- "usage: $0 funcname acc [list]"
    return 1
  } >&2
  typeset f="echo \$($1 \$acc \$x)"; shift
  fold "$f" "$@"
}

folda () {
  (($#<2)) && {
    print -- "usage: $0 lambda-arithmetic acc [list]"
    return 1
  } >&2
  typeset f="echo \$[ $1 ]"; shift
  fold "$f" "$@"
}
