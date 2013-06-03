# if [[ -z $docsRecursionLevel ]]
# then
#   echo setting to zero
# fi

if [[ $docsRecursionLevel > 5 ]]
then
  echo "ERROR: docs module might loop indefinetly"
  docsRecursionLevel=0
  return 1
fi

docsRecursionLevel=$[ docsRecursionLevel + 1 ]

function_name=$0
function_params=$@
function_num_params=$#
did_fail=0
docs_var=""

docs () {
  docs_var+="$@\n"
}

fail () {
  did_fail=1
}

usage() {
  # params=$@
  # for param in ${=params}
  # do
  #   # stuff
  # done
  docs "usage: $function_name $@"
  docs
  if [[ $function_num_params < 1 ]]
  then
    fail
  fi
}

example() {
  docs "example:"
  docs
  docs "$ $function_name $@"
  result=$(eval "$function_name $@")
  #echo $function_name $@
  docs "$result"
}
