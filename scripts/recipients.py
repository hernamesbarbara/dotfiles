#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""recipients: split list of email recipients and copy output to clipboard

Usage:
    recipients [options] INPUT

Arguments:
    INPUT                   Input text to read and parse recipients.

Options:
    -F --first-name         Include first name.
    -L --last-name          Include last name.
    -E --email              Include email.
    -o --output=OUTPUT      Output file [default: stdout].
    -h --help               Show this message.

Examples:
    recipients "Foo Bar <foo@bar.com>, Baz Foo <baz@foo.vc>"
    recipients -FLE "Foo Bar <foo@bar.com>, Baz Foo <baz@foo.vc>"
"""
import sys
import os
import re
from docopt import docopt

rg_email = re.compile(r'\<.*?\>', re.DOTALL | re.IGNORECASE)

def parse_recipient(doc):
    first, last, email = None, None, None
    matches = rg_email.findall(doc)
    if matches and len(matches) == 1:
        email = matches[0]
    if email:
        names = doc[: doc.index(email)].strip()
        email = email.strip("<>")
    if names:
        names = names.split(' ', 1)
        if len(names) == 1:
            first = names[0]
            last = ""
        else:
            first, last = names[0], names[1]
    return first, last, email


def main():
    args = docopt(__doc__, argv=None, help=True, options_first=False)

    emails = []
    docs = [doc.strip() for doc in args["INPUT"].strip().split(",")]

    for i, doc in enumerate(docs):
        first, last, email = parse_recipient(doc)
        emails.append({'first': first, 'last': last, 'email': email})

    if len(emails):
        import pandas as pd
        df = pd.DataFrame(emails)
        if args['--output'] == 'stdout':
            df.to_csv(sys.stdout, index=False, header=False)
        else:
            df.to_csv(args['--output'], index=False)

if __name__ == "__main__":
    main()