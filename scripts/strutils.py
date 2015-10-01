#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""strutils - helpers for working with strings
"""
from string import punctuation
import sys
import os
import sys
import re

FILETYPES = (".txt", ".csv", ".xlsx", ".xls", ".pdf", ".png", ".jpg", ".jpeg", ".docx", ".doc", ".py", ".r")

def try_convert_str(s):
    """
    convert input to a unicode string if you can otherwise return empty string
    """
    if s is None:
        s = u""
    try:
        return unicode(s)
    except:
        return u""

def rm_non_ascii(s):
    """
    remove any non ascii characters
    """

    s = s.strip()
    try:
        return u''.join(filter(lambda x: ord(x)<128, s))
    except:
        print >> sys.stderr, err
        return s

def rm_punct(txt):
    """
    remove all punctuation except for underscore.
    """
    txt = txt.strip().replace('\n', ' ')
    txt = rm_non_ascii(txt).strip()
    exclude = ''.join(ch for ch in punctuation if ch != '_')
    s = ''.join([c for c in txt if c not in exclude])
    return s

