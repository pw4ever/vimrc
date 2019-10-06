#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

rm -rf ~/.SpaceVim{,.d} ~/.config/nvim{,-qt}
rm -rf ~/.vim{,rc}
