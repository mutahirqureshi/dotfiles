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

bash "$ROOT/git/install.sh"

bash "$ROOT/vim/install.sh"

bash "$ROOT/tmux/install.sh"

bash "$ROOT/bash/install.sh"

bash "$ROOT/kitty/install.sh"

bash "$ROOT/keyboard/install.sh"

zsh "$ROOT/prezto/install.zsh"

unset ROOT

echo "DONE!"

