#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

"$_rootdir/uninstall.sh"

rm -rf ~/.cache/vimfiles/repos
rm -rf ~/.cache/SpaceVim
