#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

if hash rsync 2>/dev/null; then
  cmd="rsync -rvhtW --no-compress --progress"
else
  cmd="cp -rv"
fi

# source helper functions
script="$_rootdir/.SpaceVim/docs/install.sh"
tmp=$(mktemp)
sed -n '1,/^main/{/^main/b;p}' "$script" > "$tmp"
source "$tmp"
unset script tmp

check_requirements
install_package_manager
install_fonts

eval $cmd \"$_rootdir\"/.SpaceVim{,.d} \"$HOME\"

mkdir -p "$HOME/.config"
for i in "$HOME/.config/nvim"; do
  ln -sf "$HOME/.SpaceVim" "$i"
done
