#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "bash DIR=$DIR"

. ../funcs.sh

create_links "$DIR"

