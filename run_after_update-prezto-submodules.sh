#!/bin/sh

set -eu

prezto_dir="${ZDOTDIR:-$HOME}/.zprezto"

if [ -d "$prezto_dir/.git" ]; then
    git -C "$prezto_dir" submodule sync --recursive
    git -C "$prezto_dir" submodule update --init --recursive
fi
