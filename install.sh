#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

if hash rsync 2>/dev/null; then
  cmd="rsync -rvhtW --no-compress --progress"
else
  cmd="cp -rv"
fi

curl -sLf https://spacevim.org/install.sh | bash

eval $cmd \"$_rootdir\"/.SpaceVim.d \"$HOME\"
