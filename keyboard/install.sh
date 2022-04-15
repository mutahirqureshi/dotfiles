#!/usr/bin/env bash

set -e

export KEYBOARD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "KEYBOARD=$KEYBOARD"

if [[ "$OSTYPE" == "darwin"* ]]; then
  make -C "$KEYBOARD/macos/Capslock/mac_v3" install
fi

