# This is a very hackish way to get a decently clean syntax for looping through
# either the remaining arguments ($@) or if they don't exist (no arguments)
# then start looping through stdin.
#
# Please see the other files for how to use this monster.

initGo="
  local loopword
  local myarray
  myarray=()
  if ((\$#>1))
  then
    loopword='for x in \$myarray'
    for x; myarray+=\$x
  else
    loopword='while read x'
  fi
  go () {
    eval \$loopword \"; do; \$@ \\\$x; done\"
  }"
loopNow="$initGo; go"
