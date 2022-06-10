#!/usr/bin/env bash
# -*- coding: utf-8 -*-

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    -F|--from)
      FROM="$2"
      shift # past argument
      shift # past value
      ;;
    -T|--to)
      TO="$2"
      shift # past argument
      shift # past value
      ;;
    -O|--outfile)
      OUTFILE="$2"
      shift # past argument
      shift # past value
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1") # save positional arg
      shift # past argument
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}" # restore positional parameters

if [[ -n $1 ]]; then
    INFILE=$(basename -- "$1")
    EXT="${INFILE##*.}"
    FILENAME="${INFILE%.*}"
    if [ -z "$OUTFILE" ]; then
        OUTFILE="$FILENAME.mp4"
    fi
fi

if [[ -n $FROM ]] || [[ -n $TO ]]; then
    if [ -z "$FROM" ] || [ -z "$TO" ]; then
      echo >&2 'if you pass FROM you must also pass TO'
        exit 1
    fi
    ffmpeg -i "$INFILE" -vf scale=-1:720 -ss "$FROM" -to "$TO" "$OUTFILE"
    exit 1
fi

ffmpeg -i "$INFILE" -vf scale=-1:720 "$OUTFILE"