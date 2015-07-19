# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from os.path import basename
from onixcheck.models import OnixFile, Message


def validate(infile):
    """Validatate python file

    :return list: List Message objs (invalid onix) or empty list (valid onix)
    """
    onix_file = OnixFile(infile)
    validator = onix_file.get_validator()
    validator(onix_file.xml_tree())
    errors = validator.error_log
    msg = Message.from_logentry
    return [msg(e, basename(infile)) for e in errors]
