# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from click.testing import CliRunner
from onixcheck.__main__ import main
from onixcheck import data


def test_main_o3_ref_valid():
    runner = CliRunner()
    result = runner.invoke(main, [data.VALID_ONIX3_REF])
    assert 'VALID' in result.output
    assert 'INVALID' not in result.output
    assert result.exit_code == 0


def test_main_o2_ref_valid():
    runner = CliRunner()
    result = runner.invoke(main, [data.VALID_ONIX2_REF])
    assert 'VALID' in result.output
    assert 'INVALID' not in result.output
    assert result.exit_code == 0


def test_main_has_ns_valid():
    runner = CliRunner()
    result = runner.invoke(main, [data.VALID_ONIX3_REF_NS])
    assert 'VALID' in result.output
    assert 'INVALID' not in result.output
    assert result.exit_code == 0


def test_main_plain_invalid():
    runner = CliRunner()
    result = runner.invoke(main, [data.INVALID_ONIX3_REF])
    assert 'INVALID' in result.output
    assert result.exit_code == 1


def test_main_debug():
    runner = CliRunner()
    result = runner.invoke(main, [data.VALID_ONIX3_REF, '-d'])
    assert 'DEBUG' in result.output
    assert result.exit_code == 0
