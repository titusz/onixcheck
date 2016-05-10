# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from os.path import basename
from lxml.etree import XMLSyntaxError
from onixcheck.exeptions import OnixError
from onixcheck.models import OnixFile, Message
from onixcheck.onixfix import OnixFix
from onixcheck import schema


def validate(infile, schemas=('xsd',)):
    """Validate an ONIX file.

    :param infile: File or path to file
    :type infile: file or str
    :param schemas: Iterable with paths to custom valdation profiles
    :type  schemas: collections.Iterable[str]
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

    messages = []

    for s in schemas:
        if s in ('xsd', 'rng',):
            try:
                validator = onix_file.get_validator(s)
            except OnixError as e:
                messages.append(Message.from_exception(e, filename))
                continue
            validator(onix_file.xml_tree())
            errors = validator.error_log
            msg = Message.from_logentry
            messages.extend([msg(err, filename) for err in errors])

    for s in schemas:
        if s in ('google', 'biblon'):
            if s == 'google':
                profile = schema.GOOGLE_O30_YML_REFERENCE
            elif s == 'biblon':
                profile = schema.BIBLON_O30_YML_REFERENCE

            validator = OnixFix(infile, profile)
            validator.validate()
            messages.extend(validator.errors)

    return messages
