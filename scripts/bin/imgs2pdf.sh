#!/usr/bin/env bash
# -*- coding: utf-8 -*-

TODAY="$(date "+%Y-%m-%d")"
OUTFILE="${1}/${TODAY}_output.pdf"

FILES="$1/*.png"

for F in $FILES
do
    convert "$F" "$F.pdf"
done

pdfunite $1/*.png.pdf $OUTFILE

rm $1/*.png.pdf





