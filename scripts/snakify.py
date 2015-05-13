#!/usr/bin/env python
# -*- coding: utf-8 -*- 
"""snakify.py
"""
from string import punctuation
import sys

FILETYPES = (".txt", ".csv", ".xlsx", ".xls", ".pdf", ".png", ".jpg", ".jpeg", ".docx", ".doc", ".py", ".r")

def rm_non_ascii(s):
    """
    remove any non ascii characters
    """
    if not isinstance(s, basestring):
            return u""
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

def snakify(txt):
    """
    downcases and swap spaces for underscore.
    """
    if not isinstance(txt, basestring):
        txt = str(txt)
    if txt.endswith(FILETYPES):
        txt, file_extension = txt.rsplit(".", 1)
    else:
        file_extension = ""
    s = rm_punct(txt)
    s = '_'.join(s.split()).lower()
    if file_extension:
        s += ".{}".format(file_extension)
    return s

if __name__ == "__main__":
    txt = " ".join(sys.argv[1:])
    print >> sys.stdout, "".join(snakify(txt))
