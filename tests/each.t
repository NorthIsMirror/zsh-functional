each can only append

  $ each 'echo young' boy girl
  young boy
  young girl

eachl can prepend

  $ eachl 'echo $1 day' good bad
  good day
  bad day

eachl can use $x

  $ eachl 'echo $x day' good bad
  good day
  bad day
