#!/usr/bin/env zsh

set -e

PREZTO="${HOME}/.zprezto"

if [[ ! -d "${PREZTO}/runcoms" ]]; then
  printf "prezto not found at %s\n" "${PREZTO}"
  printf "chezmoi external may not have been cloned yet; skipping\n"
  exit 0
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
