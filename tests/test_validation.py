# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from io import BytesIO
import onixcheck
from onixcheck import data


def test_validation_with_file_path():
    errors = onixcheck.validate(data.VALID_ONIX2_REF)
    assert errors == []


def test_validation_with_file_obj():
    with open(data.VALID_ONIX3_REF, "rb") as onix_file:
        errors = onixcheck.validate(onix_file)
    assert not errors


def test_validation_with_file_path_and_schema_name():
    errors = onixcheck.validate(data.VALID_GOOGLE_ONIX_30_SAMPLE, schemas=("google",))
    assert len(errors) == 2


def test_validation_with_file_obj_and_schema_name():
    with open(data.VALID_GOOGLE_ONIX_30_SAMPLE, "rb") as ofile:
        errors = onixcheck.validate(ofile, schemas=("google",))
    assert len(errors) == 2


def test_validation_xml_syntax_error():
    """Test handling of malformed XML"""
    invalid_xml = BytesIO(b"<not valid xml")
    invalid_xml.name = "invalid.xml"
    errors = onixcheck.validate(invalid_xml)
    assert len(errors) == 1
    assert errors[0].level == "CRITICAL"
    assert errors[0].error_type == "EXCEPTION"


def test_validation_biblon_schema():
    """Test validation with biblon schema"""
    errors = onixcheck.validate(data.VALID_GOOGLE_ONIX_30_SAMPLE, schemas=("biblon",))
    assert isinstance(errors, list)
