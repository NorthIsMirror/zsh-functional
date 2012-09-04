filter can remove odd numbers

  $ divisible_by_two () { (( $1%2 == 0 )) }
  $ filter divisible_by_two {0..4}
  0
  2
  4

filterl can grep out words

  $ filterl 'echo $1 | grep a --silent' ab bc ac
  ab
  ac

filtera can remove odd numbers

  $ filtera '$1%2 == 0' {0..4}
  0
  2
  4
