# -*- coding: utf-8 -*-
import onixcheck
from onixcheck import data


def test_validation_02_ref_valid():
    errors = onixcheck.validate(data.VALID_ONIX2_REF)
    assert errors == []
