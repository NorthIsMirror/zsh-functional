foldl () {
  if (($#<2)) {
    {
    print -- 'Warning, l is not for left! Its for lambda style expression!'
    print -- 'Though this is left fold still :)'
    } >&2
    return 1
  } else {
    local body=$1
    local acc=$2
    shift 2
    folde_ () {
      local acc=$1
      local x=$2
      local body=$3
      eval "${(e)body}"
    }
    for x
    do
      acc=$(folde_ $acc $x $body)
    done
    print -- $acc
    return 0
  }
}

fold () {
  typeset f="echo \$($1 \$acc \$x)"; shift
  foldl "$f" "$@"
}

folda () {
  typeset f="echo \$[ $1 ]"; shift
  foldl "$f" "$@"
}
