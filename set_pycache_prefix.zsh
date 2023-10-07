#!/usr/bin/env zsh
# set python cache folder for .pyc files:
#   https://stackoverflow.com/a/57415054
case "${OSTYPE}" in
    darwin*)
        folder="${HOME}/Library/Caches/Python"
        if [[ ! -d "${folder}" ]]; then mkdir -p "${folder}"; fi
        export PYTHONPYCACHEPREFIX="${folder}"
        ;;
    linux-*)
        folder="${HOME}/.cache/Python"
        if [[ ! -d "${folder}" ]]; then mkdir -p "${folder}"; fi
        export PYTHONPYCACHEPREFIX="${folder}"
        ;;
    *)
        printf "WARNING: unsupported operating system '%s'; "`
              `'not setting PYTHONPYCACHEPREFIX' "${OSTYPE}" >&2
        return 1
        ;;
esac