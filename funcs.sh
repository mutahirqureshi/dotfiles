
function timestamp {
  date +"%Y-%m-%d_%H-%M-%S"
}

function backup {
  file="$1"
  if [ -e "$file" ]; then
    ts=$(timestamp)
    printf "moving already existing %s to %s.%s.bak..." $file $file $ts
    mv "$file" "${file}.${ts}.bak"
  fi

}

function create_link {
  source="$1"
  target="$2"

  printf "linking %s to %s..." $source $target

  backup "$target"

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
