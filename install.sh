#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "DIR=$DIR"

. ./funcs.sh

create_links "$DIR"

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  sudo apt-get install -y xsel
elif [[ "$OSTYPE" == "darwin"* ]]; then
  brew install reattach-to-user-namespace
fi

eval "$DIR/git/install.sh"

eval "$DIR/vim/install.sh"

eval "$DIR/prezto/install.zsh"

echo "DONE!"

