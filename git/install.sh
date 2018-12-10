#!/usr/bin/env bash

git config --global include.path '~/.gitconfig.local'

git config --global user.name 'Muhammad Qureshi'
git config --global user.email mutahirqureshi@gmail.com

git config --global core.whitespace 'fix,-indent-with-non-tab,trailing-space,cr-at-eol'
git config --global core.excludesfile '~/.gitignore_global'
git config --global core.editor vim

git config --global color.ui auto
git config --global color.diff.whitespace 'red reverse'

git config --global push.default simple

git config --global log.date local

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
  git config --global credential.helper '!pass-git-helper $@'
elif [[ "$OSTYPE" == "darwin"* ]]; then
  git config --global credential.helper osxkeychain
fi

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "git DIR=$DIR"

function create_link {
  source="$1"
  target="$2"

  printf "linking %s to %s..." $source $target

  if [ -e $target ]; then
    printf "moving already existing %s to %s.bak..." $target $target
    mv "$target" "${target}.bak"
  fi

  ln -s $source $target
  printf "DONE!\n"
}

for i in "${DIR}"/_*
do
  base=$(basename "$i")
  create_link "$i" "${HOME}/${base/_/.}"
done

