can add numbers

  $ plus_one () { echo $(($1+1)) }
  $ eachf plus_one {0..2}
  1
  2
  3

can only append

  $ eachf 'echo young' boy girl
  young boy
  young girl

can prepend

  $ each 'echo $1 day' good bad
  good day
  bad day

can use $x

  $ each 'echo $x day' good bad
  good day
  bad day
