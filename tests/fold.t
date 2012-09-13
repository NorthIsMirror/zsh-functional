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
