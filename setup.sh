#!/bin/bash

for dotfile in .emacs.d .screenrc .zshrc
do
  rm -fr ~/$dotfile
  ln -vnfs $PWD/$dotfile ~/$dotfile
done
