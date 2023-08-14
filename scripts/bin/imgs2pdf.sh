#!/usr/bin/env bash
# -*- coding: utf-8 -*-

TODAY="$(date "+%Y-%m-%d")"
IN_DIR_FULLPATH="$(realpath $1)"
IN_DIRNAME="$(basename $1)"
OUTFILE="${IN_DIR_FULLPATH}/${TODAY} - ${IN_DIRNAME}.pdf"

FILES="$1/*.png"

for F in $FILES
do
    convert "$F" "$F.pdf"
done

pdfunite $1/*.png.pdf "$OUTFILE"

rm $1/*.png.pdf

echo "Saved ${OUTFILE}"