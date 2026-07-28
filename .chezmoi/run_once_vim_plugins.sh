#!/usr/bin/env bash

set -e

vim -E -c PlugUpgrade -c PlugClean! -c PlugUpdate -c qa || true
