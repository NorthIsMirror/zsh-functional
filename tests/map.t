map can add numbers

  $ plus_one () { echo $(($1+1)) }
  $ map plus_one {0..5}
  1
  2
  3
  4
  5
  6

mapl can echo-append

  $ mapl 'echo $1 day' good bad
  good day
  bad day

mapa does arithmetic

  $ mapa '$1 + 5' {1..3}
  6
  7
  8
