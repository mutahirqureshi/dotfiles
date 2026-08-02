#!/usr/bin/env bash
set -e
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  KEYD_CONF="/etc/keyd/default.conf"
  if [[ ! -d /etc/keyd ]]; then
    printf "keyd not installed (/etc/keyd missing); skipping. Install keyd and run 'chezmoi apply' again.\n"
    exit 0
  fi
  SOURCE_DIR="${CHEZMOI_SOURCEDIR}"
  if [[ ! -f "$KEYD_CONF" ]] || ! diff -q "${SOURCE_DIR}/keyd/default.conf" "$KEYD_CONF" > /dev/null 2>&1; then
    sudo cp -f "${SOURCE_DIR}/keyd/default.conf" "$KEYD_CONF"
    printf "keyd config installed at %s\n" "$KEYD_CONF"
  fi
fi
