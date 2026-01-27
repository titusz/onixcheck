# -*- coding: utf-8 -*-
from io import BytesIO
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
    with open(data.VALID_ONIX3_REF, "rb") as infile:
        ofile = OnixFile(infile)
        assert isinstance(ofile.xml_tree(), etree._ElementTree)
    assert isinstance(ofile, OnixFile)


def test_onix_meta_reference():
    meta = OnixMeta.from_file(data.VALID_ONIX3_REF)
    assert meta.xml_version == "1.0"
    assert meta.xml_encoding == "utf-8"
    assert meta.onix_version == OnixMeta.V30
    assert meta.onix_style == OnixMeta.REFERENCE


def test_onix_meta_short():
    meta = OnixMeta.from_file(data.VALID_ONIX3_SHORT)
    assert meta.xml_version == "1.0"
    assert meta.xml_encoding == "utf-8"
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


def test_onix_meta_31_reference():
    meta = OnixMeta.from_file(data.VALID_ONIX31_REF)
    assert meta.xml_version == "1.0"
    assert meta.xml_encoding == "utf-8"
    assert meta.onix_version == OnixMeta.V31
    assert meta.onix_style == OnixMeta.REFERENCE


def test_onix_meta_31_short():
    meta = OnixMeta.from_file(data.VALID_ONIX31_SHORT)
    assert meta.xml_version == "1.0"
    assert meta.xml_encoding == "utf-8"
    assert meta.onix_version == OnixMeta.V31
    assert meta.onix_style == OnixMeta.SHORT


def test_get_ns_string_31():
    """Test that get_ns_string() works for ONIX 3.1 without UnboundLocalError"""
    meta = OnixMeta.from_file(data.VALID_ONIX31_REF)
    ns_string = meta.get_ns_string()
    assert ns_string == "http://ns.editeur.org/onix/3.1/reference"

    meta_short = OnixMeta.from_file(data.VALID_ONIX31_SHORT)
    ns_string_short = meta_short.get_ns_string()
    assert ns_string_short == "http://ns.editeur.org/onix/3.1/short"


def test_get_validator_o31():
    """Test that validators work for ONIX 3.1"""
    o31_ref = OnixFile(data.VALID_ONIX31_REF)
    validator = o31_ref.get_validator()
    assert isinstance(validator, etree.XMLSchema)

    o31_short = OnixFile(data.VALID_ONIX31_SHORT)
    validator = o31_short.get_validator()
    assert isinstance(validator, etree.XMLSchema)


def test_message_str():
    """Test Message.__str__ method"""
    msg = Message(
        level="ERROR",
        validator="XSD",
        location="test.xml:10:5",
        message="Test error",
        error_type="SCHEMA_ERROR",
    )
    result = str(msg)
    assert "ERROR" in result
    assert "XSD" in result
    assert "test.xml:10:5" in result
    assert "Test error" in result


def test_message_from_exception():
    """Test Message.from_exception method"""
    exc = OnixError("Test exception message")
    msg = Message.from_exception(exc, "test.xml")
    assert msg.level == "CRITICAL"
    assert msg.validator == "ONIXCHECK"
    assert msg.location == "test.xml"
    assert msg.message == "Test exception message"
    assert msg.error_type == "EXCEPTION"


def test_onix_meta_v30_from_namespace():
    """Test detecting ONIX 3.0 version from namespace when no release attribute"""
    xml_content = b"""<?xml version="1.0" encoding="utf-8"?>
<ONIXMessage xmlns="http://ns.editeur.org/onix/3.0/reference">
  <Header><Sender><SenderName>Test</SenderName></Sender></Header>
</ONIXMessage>"""
    tree = etree.parse(BytesIO(xml_content))
    meta = OnixMeta.from_tree(tree)
    assert meta.onix_version == OnixMeta.V30


def test_onix_meta_no_release_no_namespace():
    """Test error when no release attribute and no namespace"""
    xml_content = b"""<?xml version="1.0" encoding="utf-8"?>
<ONIXMessage>
  <Header><Sender><SenderName>Test</SenderName></Sender></Header>
</ONIXMessage>"""
    tree = etree.parse(BytesIO(xml_content))
    with pytest.raises(OnixError, match="No release attribute and no Namespace"):
        OnixMeta.from_tree(tree)


def test_onix_meta_unknown_version_namespace():
    """Test error when namespace doesn't match known ONIX versions"""
    xml_content = b"""<?xml version="1.0" encoding="utf-8"?>
<ONIXMessage xmlns="http://ns.editeur.org/onix/9.9/reference">
  <Header><Sender><SenderName>Test</SenderName></Sender></Header>
</ONIXMessage>"""
    tree = etree.parse(BytesIO(xml_content))
    with pytest.raises(OnixError, match="Could not determin ONIX version"):
        OnixMeta.from_tree(tree)
