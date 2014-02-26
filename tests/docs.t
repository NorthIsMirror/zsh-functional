The documentation works for one of the functions at least

  $ map
  usage: map <lambda-function> [<item>...]
  
  example:
  ? map '<--- $1 --->' a b c d (glob)
  <--- a --->
  <--- b --->
  <--- c --->
  <--- d --->
  
  
  [1]

Actually it prints a '$' and not a '?', but cram thinks that it actually
should run the command if it's a $. sigh...
