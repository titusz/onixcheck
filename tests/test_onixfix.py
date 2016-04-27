# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from onixcheck import data, schema
from onixcheck.onixfix import OnixFix

v = OnixFix(data.INVALID_GOOGLE_ONIX_30_SAMPLE, schema.GOOGLE_O30_YML_REFERENCE)
v.validate()


def text_in_errors(text):
    for m in v.errors:
        if text in m.short:
            return True
    return False


def text_in_warnings(text):
    for m in v.warnings:
        if text in m.short:
            return True
    return False


def test_required():
    assert text_in_errors("Missing element SenderName within Sender")


def test_requires_one_of():
    assert text_in_errors("Exactly one of [")


def test_recommended():
    assert text_in_warnings('Missing recommended element ContactName')


def test_multiple():
    assert text_in_errors('Only one')


def test_content():
    assert text_in_errors('Expected content "03"')


def test_length():
    assert text_in_errors('Expected 3 characters')


def test_choice():
    assert text_in_errors('"04" not one of')
