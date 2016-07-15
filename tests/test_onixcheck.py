# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from onixcheck.__main__ import main
from onixcheck import data


def test_main_o3_ref_valid(capsys):
    argv = [data.VALID_ONIX2_REF]
    exit_code = main(argv)
    out, err = capsys.readouterr()
    assert 'VALID' in out
    assert 'INVALID' not in err
    assert exit_code == 0


def test_main_o2_ref_valid(capsys):
    argv = [data.VALID_ONIX2_REF]
    exit_code = main(argv)
    out, err = capsys.readouterr()
    assert 'VALID' in out
    assert 'INVALID' not in err
    assert exit_code == 0


def test_main_has_ns_valid(capsys):
    argv = [data.VALID_ONIX3_REF_NS]
    exit_code = main(argv)
    out, err = capsys.readouterr()
    assert 'VALID' in out
    assert 'INVALID' not in err
    assert exit_code == 0


def test_main_plain_invalid(capsys):
    argv = [data.INVALID_ONIX3_REF]
    exit_code = main(argv)
    out, err = capsys.readouterr()
    assert 'INVALID' in err
    assert exit_code == 1


def test_main_debug(capsys):
    argv = [data.VALID_ONIX3_REF, '-d']
    exit_code = main(argv)
    out, err = capsys.readouterr()
    assert 'DEBUG' in out
    assert exit_code == 0


def test_console_ouptup_encoding(capsys):
    argv = [data.WIN_CONSOLE_ISSUE]
    exit_code = main(argv)
    assert exit_code == 1
    out, err = capsys.readouterr()
    assert 'UnicodeEncodeError' not in out
    assert 'UnicodeEncodeError' not in err
