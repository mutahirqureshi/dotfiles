#!/usr/bin/env bash

set -e

BASH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "BASH=$BASH"

. $BASH/../funcs.sh

create_links "$BASH"

