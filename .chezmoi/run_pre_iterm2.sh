#!/usr/bin/env bash
set -e
if [[ "$OSTYPE" == "darwin"* ]]; then
  ITerm2ThemesDir="${HOME}/Library/Application Support/iTerm2/Color Schemes"
  mkdir -p "${ITerm2ThemesDir}"
  cp -f "${HOME}/dotfiles/iterm2/Solarized-Black.itermcolors" "${ITerm2ThemesDir}/Solarized-Black.itermcolors"
  printf "iTerm2 Solarized-Black theme imported.\n"
fi
