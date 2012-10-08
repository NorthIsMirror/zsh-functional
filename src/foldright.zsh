. $(dirname $0)/fold.zsh

foldright () {
  if (($#<2)) {
    {
    print -- 'usage: foldright lambda list'
    print 
    print -- 'example:'
    print -- "    > foldright 'echo \$[ \$x+\$acc ]' 0 1 2 3 4 5"
    print -- '    15'
    } >&2
    return 1
  } else {
    local body=$1
    local acc=$2
    shift 2
    for x in "${(Oa)@}" # Loop in reverse order
    do
      acc=$(foldrighte_ $x $acc $body)
    done
    print -- $acc
    return 0
  }
}

foldrighte_ () {
  local x=$1 # Indeed unlike left fold
  local acc=$2
  local body=$3
  eval "${(e)body}"
}
