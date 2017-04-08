#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "bash DIR=$DIR"

function create_link {
  source="$1"
  target="$2"

  printf "linking %s to %s..." $source $target

  if [ -e $target ]; then
    printf "moving already existing %s to %s.bak..." $target $target
    mv "$target" "${target}.bak"
  fi

  ln -s $source $target
  printf "DONE!\n"
}

for i in "${DIR}"/_*
do
  base=$(basename "$i")
  create_link "$i" "${HOME}/${base/_/.}"
done

