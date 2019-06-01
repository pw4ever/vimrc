#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

if hash rsync 2>/dev/null; then
  cmd="rsync -rvhtW --no-compress --progress"
else
  cmd="cp -rv"
fi

eval $cmd \"$HOME\"/.SpaceVim.d .
