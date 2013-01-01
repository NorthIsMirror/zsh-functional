can echo-append

  $ map '$1 day' good bad
  good day
  bad day

does arithmetic

  $ mapa '$1 + 5' {1..3}
  6
  7
  8

map can read from stdin

  $ print "good\nbad\ngood bad" | map '$1 day'
  good day
  bad day
  good bad day

mapa can read from stdin

  $ print "1\n2\n3" | mapa '$1 + 5'
  6
  7
  8
