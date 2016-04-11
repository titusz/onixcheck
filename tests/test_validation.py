# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import onixcheck
from onixcheck import data, profiles


def test_validation_with_file_path():
    errors = onixcheck.validate(data.VALID_ONIX2_REF)
    assert errors == []


def test_validation_with_file_obj():
    with open(data.VALID_ONIX3_REF, 'rb') as onix_file:
        errors = onixcheck.validate(onix_file)
    assert not errors


def test_validation_with_file_path_and_profile():
    errors = onixcheck.validate(
        data.VALID_GOOGLE_ONIX_30_SAMPLE,
        profiles=(profiles.GOOGLE_ONIX_30,)
    )
    assert len(errors) == 3


def test_validation_with_file_obj_and_profile():
    with open(data.VALID_GOOGLE_ONIX_30_SAMPLE, 'rb') as ofile:
        errors = onixcheck.validate(
            ofile,
            profiles=(profiles.GOOGLE_ONIX_30,)
        )
    assert len(errors) == 3
