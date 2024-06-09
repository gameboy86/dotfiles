#!/bin/sh
# stow -t $HOME .


for dir in $PWD/*
do
  if [ -d "$dir" ]; then
    stow -t $HOME ${dir##*/}
    echo "Stwo: ${dir##*/}"
  fi
done
