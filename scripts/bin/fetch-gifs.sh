#!/usr/bin/env bash
# -*- coding: utf-8 -*-

INFILE=~/Desktop/gif-urls.txt

for line in $(cat "$INFILE");
do
    IFS=$','; URL_NAME=($line); unset IFS;
    curl "${URL_NAME[0]}" > "${URL_NAME[1]}"
    echo "${URL_NAME[0]} saved to ${URL_NAME[1]}"
done