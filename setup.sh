#!/bin/bash

for dotfile in .emacs .screenrc .zshrc .screen
do
  rm -fr ~/$dotfile
  ln -vnfs $PWD/$dotfile ~/$dotfile
done