
function timestamp {
  date +"%Y-%m-%d_%H-%M-%S"
}

function create_link {
  source="$1"
  target="$2"
  ts=$(timestamp)

  printf "linking %s to %s..." $source $target

  if [ -e $target ]; then
    printf "moving already existing %s to %s.%s.bak..." $target $target $ts
    mv "$target" "${target}.${ts}.bak"
  fi

  ln -s $source $target
  printf "DONE!\n"
}

function create_links {
  for i in "${1}"/_*
  do
    base=$(basename "$i")
    create_link "$i" "${HOME}/${base/_/.}"
  done
}
