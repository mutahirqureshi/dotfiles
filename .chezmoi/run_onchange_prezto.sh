#!/usr/bin/env zsh

set -e

PREZTO="${HOME}/.zprezto"

if [[ ! -d "${PREZTO}/runcoms" ]]; then
  printf "prezto submodule not initialized at %s\n" "${PREZTO}"
  printf "run 'git submodule update --init --recursive' first\n"
  return 1 2>/dev/null || exit 1
fi

setopt EXTENDED_GLOB

for rcfile in "${PREZTO}/runcoms/^README.md"(.N); do
  target="${ZDOTDIR:-$HOME}/.${rcfile:t}"
  if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "${rcfile}" ]]; then
    continue
  fi
  if [[ -e "$target" ]]; then
    rm -f "$target"
  fi
  ln -fs "${rcfile}" "${target}"
done

if [[ ! -e "${ZDOTDIR:-$HOME}/.zprezto" ]]; then
  ln -fs "${PREZTO}" "${ZDOTDIR:-$HOME}/.zprezto"
fi

if [[ -z "${VIRTUAL_ENV}" ]] && [[ "${SHELL}" != "$(which zsh)" ]]; then
  printf "changing default shell to zsh...\n"
  chsh -s "$(which zsh)" 2>/dev/null || true
fi
