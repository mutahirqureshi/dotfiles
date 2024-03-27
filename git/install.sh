#!/usr/bin/env bash

set -e

GIT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "GIT=$GIT"

. $GIT/../funcs.sh

backup "$HOME/.gitconfig"
printf "DONE!\n"

git config --global core.whitespace 'fix,-indent-with-non-tab,trailing-space,cr-at-eol'
git config --global core.excludesfile '~/.gitignore_global'
git config --global core.editor vim

git config --global color.ui auto
git config --global color.diff.whitespace 'red reverse'

git config --global pull.ff only

git config --global push.default simple

git config --global log.date local
git config --global log.mailmap true

git config --global merge.tool vimdiff

git config --global alias.ci commit
git config --global alias.up update
git config --global alias.st status
git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.di diff
git config --global alias.lg 'log --graph --decorate'
git config --global alias.gl 'log -p'
git config --global alias.glp 'log --graph --oneline --abbrev-commit --decorate'
git config --global alias.rl reflog
git config --global alias.llog 'log --date=local'
git config --global alias.ol 'log --oneline'
git config --global alias.w whatchanged
git config --global alias.sta stash
git config --global alias.sdiff !git-svn-diff

if [[ "$OSTYPE" == "linux-gnu" ]]; then
  git config --global credential."https://github.com".helper '!pass Personal/Github/local_helper'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  git config --global credential.helper osxkeychain
fi

git config --global include.path '~/.gitconfig.local'

create_links "$GIT"
