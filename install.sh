#!/bin/bash -

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

if hash rsync 2>/dev/null; then
  cmd="rsync -av"
else
  cmd="cp -rv"
fi

curl -sLf https://spacevim.org/install.sh | bash

eval $cmd \"$_rootdir\"/.SpaceVim.d \"$HOME\"

nvim '+SPUpdate' '+VimProcInstall' '+qall'
vim '+SPUpdate' '+VimProcInstall' '+qall'
