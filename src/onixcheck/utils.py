# -*- coding: utf-8 -*-
"""Generic or common utility functions"""
from __future__ import print_function, unicode_literals
from os.path import splitext, join
from scandir import scandir, walk

DEFAULT_EXTENSIONS = ('xml', 'onx', 'onix')


def iter_files(root, exts=None, recursive=False):
    """
    Iterate over file paths that match the given extensions within root.

    :param str or unicode root: Root folder to start collecting files
    :param iterable exts: file extensions to include
    :param bool recursive: Wether to walk the complete directory tree
    :return iterable: Generator of absolute file paths with given extensions
    """

    if exts is None:
        exts = DEFAULT_EXTENSIONS

    exts = set((x.lower() for x in exts))

    if recursive is False:
        for entry in scandir(root):
            ext = splitext(entry.name)[-1].lstrip('.').lower()
            if entry.is_file() and ext in exts:
                yield entry.path
    else:
        for root, folders, files in walk(root):
            for f in files:
                if splitext(f)[-1].lstrip('.').lower() in exts:
                    yield join(root, f)
