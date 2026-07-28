#!/usr/bin/env bash
set -e
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  KEYD_CONF="/etc/keyd/default.conf"
  SOURCE_DIR="${CHEZMOI_SOURCEDIR:-${HOME}/dotfiles}"
  if [[ ! -f "$KEYD_CONF" ]] || ! diff -q "${SOURCE_DIR}/keyd/default.conf" "$KEYD_CONF" > /dev/null 2>&1; then
    sudo cp -f "${SOURCE_DIR}/keyd/default.conf" "$KEYD_CONF"
    printf "keyd config installed at %s\n" "$KEYD_CONF"
  fi
fi
