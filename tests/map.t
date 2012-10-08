mapl can echo-append

  $ mapl '$1 day' good bad
  good day
  bad day

mapa does arithmetic

  $ mapa '$1 + 5' {1..3}
  6
  7
  8
