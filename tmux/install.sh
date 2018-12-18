#!/usr/bin/env bash

set -e

TMUX="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "TMUX=$TMUX"

. $ROOT/funcs.sh

create_links "$TMUX"

