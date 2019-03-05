#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# java path enables some shitty r packages
export JAVA_HOME="$(/usr/libexec/java_home)"

# https://github.com/daleroberts/itermplot
export MPLBACKEND="module://itermplot"
export ITERMPLOT=rv

# I don't know what this does
export CLICOLOR=1
