#!/usr/bin/env bash
# -*- coding: utf-8 -*-

INPUT=$(basename -- "$1")
EXT="${INPUT##*.}"
FILENAME="${INPUT%.*}"
OUTFILE="$FILENAME.mp4"

ffmpeg -i "$INPUT" -vf scale=-1:720 "$OUTFILE"