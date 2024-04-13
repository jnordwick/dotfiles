#!/bin/bash

cd ~/dotfiles

cp ~/.bashrc bashrc
pushd bash.d
for f in *; do
  cp ~/.bash.d/$f .
done
popd

files=bashrc clang-format vimrc xbindkeysrc
for f in $files; do
  cp .${f} ${f}
done

