# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import onixcheck
from onixcheck import data, schema


def test_validation_with_file_path():
    errors = onixcheck.validate(data.VALID_ONIX2_REF)
    assert errors == []


def test_validation_with_file_obj():
    with open(data.VALID_ONIX3_REF, 'rb') as onix_file:
        errors = onixcheck.validate(onix_file)
    assert not errors


def test_validation_with_file_path_and_schema():
    errors = onixcheck.validate(
        data.VALID_GOOGLE_ONIX_30_SAMPLE,
        schemas=(schema.GOOGLE_O30_YML_REFERENCE,)
    )
    assert len(errors) == 2


def test_validation_with_file_obj_and_profile():
    with open(data.VALID_GOOGLE_ONIX_30_SAMPLE, 'rb') as ofile:
        errors = onixcheck.validate(
            ofile,
            schemas=(schema.GOOGLE_O30_YML_REFERENCE,)
        )
    assert len(errors) == 2
