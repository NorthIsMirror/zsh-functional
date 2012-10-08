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

  $ foldl 'echo $2$1$2' MIDDLE - O o .
  .oO-MIDDLE-Oo.

folda can sum numbers

  $ folda '$1+$2' 0 {1..5}
  15

folda can sum numbers using mnemonic names

  $ folda '$x+$acc' 0 {1..5}
  15


Can define sum easily, but you must use positionally expanding arguments
syntax

  $ sum() { folda '$1+$2' 0 "$@" }
  $ sum {0..10}
  55
  $ sum
  0

This is left fold, in haskell notation obeying
foldl f z [x1, x2, ..., xn] == (...((z `f` x1) `f` x2) `f`...) `f` xn

  $ foldl 'echo "($acc <--> $x)"' z x1 x2
  ((z <--> x1) <--> x2)

Acc is $1 and x is $2

  $ foldl 'echo "($1 <--> $2)"' z x1 x2
  ((z <--> x1) <--> x2)
