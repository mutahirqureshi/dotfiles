#!/usr/bin/env bash

set -e

export ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "ROOT=$ROOT"

. $ROOT/funcs.sh

create_links "$ROOT"

#if [[ "$OSTYPE" == "linux-gnu" ]]; then
#  sudo apt-get install -y xsel
#elif [[ "$OSTYPE" == "darwin"* ]]; then
#  brew install reattach-to-user-namespace
#fi

eval "$ROOT/git/install.sh"

eval "$ROOT/vim/install.sh"

eval "$ROOT/tmux/install.sh"

eval "$ROOT/bash/install.sh"

eval "$ROOT/kitty/install.sh"

eval "$ROOT/prezto/install.zsh"

unset ROOT

echo "DONE!"

