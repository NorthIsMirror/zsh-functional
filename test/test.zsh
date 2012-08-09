#!/usr/bin/env zsh

. "$(dirname $0)/../functional.plugin.zsh" # load the functions

# TEST - run a unit test
#
# $1: Test description
# $2: String to eval
# $3: Expected result
TEST() {
  desc=$1
  code=$2
  expected="$3 "
  result=$(eval $code 2>&1 | tr "\n" " ")
  if [[ $result == $expected ]]; then;
    echo "SUCCESS: Test '$desc' passed"
  else
    echo "FAIL: Test '$desc' yielded $result, expected $expected" | head -1
  fi
}

if [[ $debug == 1 ]] ; then;
  echo "First test the \"test framework\""

  TEST "THIS SHOULD SUCCESS" "echo 4" "4"
  TEST "THIS SHOULD FAIL" "echo 3" "4"

  echo "ok, now lets test what we should test"
  echo "\n\n"
fi

echo "Starting tests of zsh higher order functions"

plus_one () { echo $(($1+1)) }
divisible_by_two () { (( $1%2 == 0 )) }
addition () { echo $(($1 + $2)) }
ignore_acc () { echo $2 }

TEST "map can (+1) numbers           "  "map plus_one {0..5}                           "  "1 2 3 4 5 6"
TEST "mapl echo append               "  "mapl 'echo \$1 day' good bad                  "  "good day bad day"
TEST "mapa can (+1)                  "  "mapa '\$1 + 5' {1..3}                         "  "6 7 8"
TEST "filter can remove odd numbers  "  "filter divisible_by_two {0..4}                "  "0 2 4"
TEST "filterl can grep out words     "  "filterl 'echo \$1 | grep a --silent' ab bc ac "  "ab ac"
TEST "filtera can remove odd numbers "  "filtera '\$1%2 == 0' {0..4}                   "  "0 2 4"
TEST "fold can sum numbers           "  "fold addition 0 {1..5}                        "  "15"
TEST "fold is not commutative        "  "fold ignore_acc a b c d                       "  "d"
TEST "foldl palin                    "  "foldl 'echo \$1\$acc\$1' MIDDLE - O o .       "  ".oO-MIDDLE-Oo."
TEST "foldl palin2                   "  "foldl 'echo \$1\$2\$1' MIDDLE - O o .         "  ".oO-MIDDLE-Oo."
TEST "folda can sum numbers          "  "folda '\$1+\$2' 0 {1..5}                      "  "15"
TEST "each can only append           "  "each 'echo young' boy girl                    "  "young boy young girl"
TEST "eachl can prepend              "  "eachl 'echo \$1 day' good bad                 "  "good day bad day"
