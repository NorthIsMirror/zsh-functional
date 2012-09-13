fold can sum numbers

  $ addition () { echo $(($1 + $2)) }
  $ fold addition 0 {1..5}
  15

fold is not commutative

  $ ignore_acc () { echo $2 }
  $ fold ignore_acc a b c d
  d

foldl palin

  $ foldl 'echo $x$acc$x' MIDDLE - O o .
  .oO-MIDDLE-Oo.

foldl palin2

  $ foldl 'echo $1$2$1' MIDDLE - O o .
  .oO-MIDDLE-Oo.

folda can sum numbers

  $ folda '$1+$2' 0 {1..5}
  15

Can define sum easily, but you must use positionally expanding arguments
syntax

  $ sum() { folda '$1+$2' 0 "$@" }
  $ sum {0..100}
  5050
  $ sum
  0
