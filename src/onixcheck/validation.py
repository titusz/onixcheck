# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from os.path import basename
from lxml.etree import XMLSyntaxError
from onixcheck.exeptions import OnixError
from onixcheck.models import OnixFile, Message
from onixcheck.onixfix import OnixFix


def validate(infile, profiles=tuple()):
    """Validate an ONIX file.

    :param infile: File or path to file
    :type infile: file or str
    :param profiles: Iterable with paths to custom valdation profiles
    :type  profiles: collections.Iterable[str]
    :return: List of `Message` objects (invalid ONIX) or empty list (valid ONIX)
    :rtype: list[Message]
    """
    if hasattr(infile, 'name'):
        filename = basename(infile.name)
    else:
        filename = basename(infile)

    try:
        onix_file = OnixFile(infile)
    except (OnixError, XMLSyntaxError) as e:
        return [Message.from_exception(e, filename)]

    validator = onix_file.get_validator()
    validator(onix_file.xml_tree())
    errors = validator.error_log
    msg = Message.from_logentry

    messages = [msg(err, filename) for err in errors]

    for profile in profiles:
        profile_validator = OnixFix(infile, profile)
        profile_validator.validate()
        messages.extend(profile_validator.errors)

    return messages
