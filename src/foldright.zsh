foldright () {
  (($#<1)) && {
    print -- "usage: $0 lambda-function [list]"
    return 1
  } >&2
  local body=$1
  local acc=$2
  shift 2

  foldright_ () {
    local x=$1 # Indeed unlike left fold
    local acc=$2
    eval "${(e)body}"
  }
  for x in "${(Oa)@}" # Loop in reverse order
  do
    acc=$(foldright_ $x $acc)
  done
  print -- $acc
  return 0
}
