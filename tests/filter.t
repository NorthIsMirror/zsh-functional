can remove odd numbers

  $ divisible_by_two () { (( $1%2 == 0 )) }
  $ filterf divisible_by_two {0..4}
  0
  2
  4

can grep out words

  $ filter 'echo $1 | grep a --silent' ab bc ac
  ab
  ac

can remove odd numbers

  $ filtera '$1%2 == 0' {0..4}
  0
  2
  4

filter can read from stdin

  $ print "ab\nbc\nac" | filter 'echo $1 | grep a --silent'
  ab
  ac
