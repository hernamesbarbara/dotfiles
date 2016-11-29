#!/usr/bin/env bash
# -*- coding: utf-8 -*- 
# sym link a bunch of stuff

# usage
####    the for loop will print the sym link statements for all files in this folder

for f in $(ls); do
  echo "ln -sv \"$(pwd -P)/$f\" ~/.$f"
done

echo "done"
