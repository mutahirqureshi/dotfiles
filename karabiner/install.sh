#!/usr/bin/env bash

set -e

KARABINER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "KARABINER=$KARABINER"

. $KARABINER/../funcs.sh

create_link "$KARABINER/assets" "$HOME/.config/karabiner/assets"
