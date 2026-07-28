#!/usr/bin/env bash
set -e
if [[ "$OSTYPE" == "darwin"* ]]; then
  RECTANGLE_DIR="${HOME}/Library/Application Support/Rectangle"
  mkdir -p "${RECTANGLE_DIR}"
  cp -f "${HOME}/dotfiles/rectangle/RectangleConfig.json" "${RECTANGLE_DIR}/RectangleConfig.json"
  printf "Rectangle config installed.\n"
fi
