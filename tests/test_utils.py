# -*- coding: utf-8 -*-
from __future__ import print_function
import types
from onixcheck import utils
from os.path import abspath, dirname


TEST_DIR = abspath(dirname(utils.__file__))


def test_iter_files_simple():
    gen = utils.iter_files(TEST_DIR, ['py'])
    assert isinstance(gen, types.GeneratorType)
    assert len(list(gen)) > 5


def test_iter_files_no_matches():
    gen = utils.iter_files(TEST_DIR, ['noext'])
    assert len(list(gen)) == 0


def test_iter_files_flat():
    gen = utils.iter_files(TEST_DIR, ['xsd'])
    assert len(list(gen)) == 0
    gen = utils.iter_files(TEST_DIR, ['PY'])
    assert len(list(gen)) > 5


def test_iter_files_recursive():
    gen = utils.iter_files(TEST_DIR, ['xsd'], recursive=True)
    assert len(list(gen)) > 5

