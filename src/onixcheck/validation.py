# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from os.path import basename
from lxml.etree import XMLSyntaxError
from onixcheck.exeptions import OnixError
from onixcheck.models import OnixFile, Message


def validate(infile):
    """Validatate python file

    :param file or path infile: File Obj or path to file
    :return list: List Message objs (invalid onix) or empty list (valid onix)
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

    return [msg(err, filename)for err in errors]
