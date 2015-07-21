# -*- coding: utf-8 -*-
"""Generic or common utility functions"""
from __future__ import print_function, unicode_literals
from os.path import splitext, join

has_scandir = True

try:
    from scandir import scandir, walk
except ImportError:
    from os import walk
    from os import listdir as scandir
    from os.path import isdir
    has_scandir = False


def iter_files(root, exts=None, recursive=False):
    """
    Iterate over file paths within root filtered by specified extensions.

    :param str or unicode root: Root folder to start collecting files
    :param iterable exts: Restrict results to given file extensions
    :param bool recursive: Wether to walk the complete directory tree
    :return iterable: Generator of absolute file paths with given extensions
    """

    if exts is not None:
        exts = set((x.lower() for x in exts))

    matches = lambda e: (e in exts) or (exts is None)

    if recursive is False:
        for entry in scandir(root):
            if has_scandir:
                ext = splitext(entry.name)[-1].lstrip('.').lower()
                if entry.is_file() and matches(ext):
                    yield entry.path
            else:
                ext = splitext(entry)[-1].lstrip('.').lower()
                if not isdir(entry) and matches(ext):
                    yield join(root, entry)
    else:
        for root, folders, files in walk(root):
            for f in files:
                ext = splitext(f)[-1].lstrip('.').lower()
                if matches(ext):
                    yield join(root, f)
