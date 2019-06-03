#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

rm -rf "$_rootdir"/.SpaceVim.d
"$_rootdir/pull.sh"
