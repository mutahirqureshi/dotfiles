#!/usr/bin/env bash

set -e

KITTY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "KITTY=$KITTY"

. $KITTY/../funcs.sh

create_link "$KITTY/kitty" "$HOME/.config/kitty"
