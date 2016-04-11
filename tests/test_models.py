# -*- coding: utf-8 -*-
from onixcheck import data
from onixcheck.exeptions import OnixError
from onixcheck.models import OnixMeta, OnixFile, Message
from lxml import etree
import pytest


def test_onix_file_with_path():
    ofile = OnixFile(data.VALID_ONIX3_REF)
    assert isinstance(ofile, OnixFile)
    assert isinstance(ofile.xml_tree(), etree._ElementTree)


def test_onix_file_with_file_obj():
    with open(data.VALID_ONIX3_REF, 'rb') as infile:
        ofile = OnixFile(infile)
        assert isinstance(ofile.xml_tree(), etree._ElementTree)
    assert isinstance(ofile, OnixFile)


def test_onix_meta_reference():
    meta = OnixMeta.from_file(data.VALID_ONIX3_REF)
    assert meta.xml_version == '1.0'
    assert meta.xml_encoding == 'utf-8'
    assert meta.onix_version == OnixMeta.V30
    assert meta.onix_style == OnixMeta.REFERENCE


def test_onix_meta_short():
    meta = OnixMeta.from_file(data.VALID_ONIX3_SHORT)
    assert meta.xml_version == '1.0'
    assert meta.xml_encoding == 'utf-8'
    assert meta.onix_version == OnixMeta.V30
    assert meta.onix_style == OnixMeta.SHORT


def test_onix_root_invalid():
    with pytest.raises(OnixError):
        OnixMeta.from_file(data.INVALID_ONIX_ROOT)


def test_get_validator_o3():

    o3_ref = OnixFile(data.VALID_ONIX3_REF)
    validator = o3_ref.get_validator()
    assert isinstance(validator, etree.XMLSchema)

    o3_short = OnixFile(data.VALID_ONIX3_SHORT)
    validator = o3_short.get_validator()
    assert isinstance(validator, etree.XMLSchema)


def test_get_validator_o2():
    o2_ref = OnixFile(data.VALID_ONIX2_REF)
    validator = o2_ref.get_validator()
    assert isinstance(validator, etree.XMLSchema)


def test_message_from_logentry():
    onix_file = OnixFile(data.INVALID_ONIX3_REF)
    validator = onix_file.get_validator()
    validator(onix_file.xml_tree())
    msg = Message.from_logentry(validator.error_log[0])
    assert isinstance(msg, Message)


def test_onix_meta_from_tree_no_release():
    tree = etree.parse(data.VALID_GOOGLE_SAMPLE)
    meta = OnixMeta.from_tree(tree)
    assert meta.onix_version == OnixMeta.V21
