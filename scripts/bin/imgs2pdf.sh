#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# Check for dependencies
if ! command -v convert &> /dev/null || ! command -v pdfunite &> /dev/null || ! command -v qpdf &> /dev/null; then
    echo "Error: This script requires 'convert', 'pdfunite', and 'qpdf'. Please install them first."
    exit 1
fi

# Check for input directory
if [ -z "$1" ]; then
    echo "Usage: $0 /path/to/directory"
    exit 1
fi

# Resolve the full path and get the directory name
IN_DIR_FULLPATH="$(realpath "$1")"
if [ ! -d "$IN_DIR_FULLPATH" ]; then
    echo "Error: Directory $IN_DIR_FULLPATH does not exist."
    exit 1
fi

IN_DIRNAME="$(basename "$1")"
TODAY="$(date "+%Y-%m-%d")"
OUTFILE="${IN_DIR_FULLPATH}/${TODAY} - ${IN_DIRNAME}.pdf"

# Create a temporary directory for the individual .pdf files
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

# Check for .png files
shopt -s nullglob
FILES=("$1"/*.png)
if [ ${#FILES[@]} -eq 0 ]; then
    echo "Error: No PNG files found in $1."
    exit 1
fi

# Convert each .png to .pdf and save it in the temporary directory
for F in "${FILES[@]}"; do
    BASENAME=$(basename "$F")
    convert "$F" "${TMPDIR}/${BASENAME}.pdf"
done

# Merge all the .pdf files into a single .pdf file
pdfunite "${TMPDIR}"/*.pdf "$OUTFILE"

# Optimize PDF using Ghostscript
OPTIMIZED_OUTFILE="${IN_DIR_FULLPATH}/${TODAY} - ${IN_DIRNAME}_optimized.pdf"

gs \
    -sDEVICE=pdfwrite \
    -dCompatibilityLevel=1.4 \
    -dPDFSETTINGS=/ebook \
    -dNOPAUSE \
    -dQUIET \
    -dBATCH \
    -sOutputFile="$OPTIMIZED_OUTFILE" \
    "$OUTFILE"

echo "Saved optimized PDF as ${OPTIMIZED_OUTFILE}"
