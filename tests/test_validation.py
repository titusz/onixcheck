# -*- coding: utf-8 -*-
import onixcheck
from onixcheck import data


def test_validation_with_file_path():
    errors = onixcheck.validate(data.VALID_ONIX2_REF)
    assert errors == []


def test_validation_with_file_obj():
    with open(data.VALID_ONIX3_REF, 'rb') as onix_file:
        errors = onixcheck.validate(onix_file)
    assert not errors

