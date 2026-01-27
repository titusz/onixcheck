# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from lxml import etree
from onixcheck import data, schema
from onixcheck.onixfix import OnixFix

v = OnixFix(data.INVALID_GOOGLE_ONIX_30_SAMPLE, schema.GOOGLE_O30_YML_REFERENCE)
v.validate()


def text_in_messages(text, messages):
    """Helper to check if text is in any message"""
    return any(text in m.short for m in messages)


def test_required():
    assert text_in_messages("Missing element SenderName within Sender", v.errors)


def test_requires_one_of():
    assert text_in_messages("Exactly one of [", v.errors)


def test_recommended():
    assert text_in_messages("Missing recommended element ContactName", v.warnings)


def test_multiple():
    assert text_in_messages("Only one", v.errors)


def test_content():
    assert text_in_messages('Expected content "03"', v.errors)


def test_length():
    assert text_in_messages("Expected 3 characters", v.errors)


def test_choice():
    assert text_in_messages('"04" not one of', v.errors)


def test_messages_property():
    """Test that messages property returns both errors and warnings"""
    messages = v.messages
    assert isinstance(messages, list)
    assert len(messages) == len(v.errors) + len(v.warnings)


def test_text_not_found():
    """Test helper returns False when text not found"""
    assert not text_in_messages("nonexistent error text xyz", v.errors)
    assert not text_in_messages("nonexistent warning text xyz", v.warnings)


def test_handle_dateformat():
    """Test date format validation"""
    fix = OnixFix(data.VALID_GOOGLE_ONIX_30_SAMPLE, schema.GOOGLE_O30_YML_REFERENCE)
    # Create a mock element with invalid date
    el = etree.Element("TestDate")
    el.text = "not-a-date"
    el.sourceline = 1
    fix.handle_dateformat("TestDate", el, "%Y%m%d")
    assert len(fix.errors) == 1


def test_handle_range():
    """Test range validation"""
    fix = OnixFix(data.VALID_GOOGLE_ONIX_30_SAMPLE, schema.GOOGLE_O30_YML_REFERENCE)
    el = etree.Element("TestRange")
    el.text = "100"
    el.sourceline = 1
    fix.handle_range("TestRange", el, [0, 10])
    assert text_in_messages("out of range", fix.errors)


def test_check_int():
    """Test integer validation"""
    fix = OnixFix(data.VALID_GOOGLE_ONIX_30_SAMPLE, schema.GOOGLE_O30_YML_REFERENCE)
    el = etree.Element("TestInt")
    el.text = "12abc34"
    el.sourceline = 1
    fix.check_int("TestInt", el)
    assert text_in_messages("Not an Integer", fix.errors)


def test_check_isbn13():
    """Test ISBN-13 validation"""
    fix = OnixFix(data.VALID_GOOGLE_ONIX_30_SAMPLE, schema.GOOGLE_O30_YML_REFERENCE)
    el = etree.Element("ISBN")
    el.text = "1234567890123"
    el.sourceline = 1
    fix.check_isbn13("ISBN", el)
    assert text_in_messages("Invalid ISBN13", fix.errors)


def test_check_isbn():
    """Test ISBN validation (both 10 and 13)"""
    fix = OnixFix(data.VALID_GOOGLE_ONIX_30_SAMPLE, schema.GOOGLE_O30_YML_REFERENCE)
    el = etree.Element("ISBN")
    el.text = "invalid-isbn"
    el.sourceline = 1
    fix.check_isbn("ISBN", el)
    assert text_in_messages("Invalid ISBN", fix.errors)


def test_check_decimal():
    """Test decimal validation"""
    fix = OnixFix(data.VALID_GOOGLE_ONIX_30_SAMPLE, schema.GOOGLE_O30_YML_REFERENCE)
    el = etree.Element("Price")
    el.text = "not.adecimal"
    el.sourceline = 1
    fix.check_decimal("Price", el)
    assert text_in_messages("Invalid decimal", fix.errors)
