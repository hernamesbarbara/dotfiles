#!/usr/bin/env bash
# -*- coding: utf-8 -*- 
# ~/.bash_profile

for file in ~/.{bashrc,bash_prompt,privaterc,aliases,zrc}; do
    [[ -r "$file" ]] && [[ -f "$file" ]] && source "$file"
done
