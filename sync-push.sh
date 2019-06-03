#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

rm -rf "$HOME"/.SpaceVim{,.d} "$HOME"/.config/nvim
"$_rootdir/push.sh"
