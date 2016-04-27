# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import string
from os.path import basename, splitext
from datetime import datetime
from decimal import Decimal, InvalidOperation
import yaml
from lxml import objectify
import isbnlib
from onixcheck.models import OnixFile, Message


class OnixFix(object):
    """
    Validates Onix xml against custom yaml based subspecifications and
    provides usefull error and warning messages.

    :param onixfile: File obj with onix data or path to onix file
    :type onixfile: file or str
    :param profile: Path to yaml profile
    :type profile: str
    """

    def __init__(self, onixfile, profile):
        if hasattr(onixfile, 'name'):
            self.basename = basename(onixfile.name)
        else:
            self.basename = basename(onixfile)

        if hasattr(onixfile, 'seek'):
            onixfile.seek(0)

        self._onix_file = OnixFile(onixfile)
        self.onix = self._onix_file.xml_tree().getroot()

        # Get rid of namespaces for easier xpath search
        for elem in self.onix.getiterator():
            if not hasattr(elem.tag, 'find'):
                continue
            i = elem.tag.find('}')
            if i >= 0:
                elem.tag = elem.tag[i + 1:]
        objectify.deannotate(self.onix, cleanup_namespaces=True)

        self.spec = yaml.load(open(profile, 'rb'))

        name, ext = splitext(basename(profile))
        self.name = name.upper()
        self.urls_checked = set()
        self.errors = []
        self.warnings = []

    @property
    def messages(self):
        return self.errors + self.warnings

    def add_message(self, message, path, el=None, level='ERROR'):

        assert level in ('ERROR', 'WARNING',)

        if el is not None and el.sourceline is not None:
            location = '%s' % el.sourceline
        else:
            location = path

        location = '%s:%s' % (self.basename, location)

        msg = Message(
            level=level,
            validator=self.name,
            location=location,
            message=message,
            error_type='SPECIFICATION ERROR'
        )
        if level == 'ERROR':
            self.errors.append(msg)
        elif level == 'WARNING':
            self.warnings.append(msg)

    def validate(self):
        """
        Validate Onix agianst Specfile

        :return list[Message]: list of error messages if any else empty list.
        """

        for path_or_keyword in self.spec:
            if path_or_keyword.startswith('/'):
                path = path_or_keyword.lstrip('/')
                specnode = self.spec[path_or_keyword]
                xmlnode = self.onix
                self.validate_block(path, specnode, xmlnode)
        return self.errors

    def validate_block(self, path, specnode, xmlnode):
        for pok in specnode:
            if pok in ('description', 'example'):
                continue
            elif pok in ('required', 'mulitple', 'recommended'):
                func = getattr(self, 'handle_' + pok)
                func(path, xmlnode, specnode.get(pok))
            elif pok.startswith('/'):
                sub_path = pok.lstrip('/')
                for node in xmlnode.xpath(path):
                    self.validate_block(sub_path, specnode[pok], node)
            else:
                func = getattr(self, 'handle_' + pok)
                value = specnode.get(pok)
                for element in xmlnode.xpath(path):
                    func(path, element, value)

    def handle_required(self, path, el, val):
        if val:
            result = el.xpath(path)
            if len(result) == 0:
                msg = 'Missing element %s within %s' % (path, el.tag)
                self.add_message(msg, path, el)

    def handle_requires_one_of(self, path, el, val):
        if val:
            results = []
            for elname in val:
                result = el.xpath(elname)
                if len(result) == 1:
                    results.append(result)
            if len(results) != 1:
                msg = 'Exactly one of %s must be within %s' % (val, el.tag)
                self.add_message(msg, path)

    def handle_recommended(self, path, el, val):
        if val:
            result = el.xpath(path)
            if len(result) == 0:
                msg = 'Missing recommended element %s within %s' % (path, el.tag)
                self.add_message(msg, path, level='WARNING')

    def handle_multiple(self, path, el, val):
        if not val:
            result = el.getparent().xpath(path)
            if len(result) > 1:
                msg = 'Only one "%s" allowed per "%s" found %s' % (path, el.getparent().tag, len(result))
                self.add_message(msg, path)

    def handle_content(self, path, el, val):
        if el.text != val:
            msg = 'Expected content "%s" does not match "%s"' % (val, el.text)
            self.add_message(msg, path, el)

    def handle_length(self, path, el, val):
        if len(el.text) != val:
            msg = 'Expected %s characters for "%s"' % (val, el.text)
            self.add_message(msg, path, el)

    def handle_choice(self, path, el, val):
        if el.text not in val:
            msg = '"%s" not one of "%s"' % (el.text, val)
            self.add_message(msg, path, el)

    def handle_dateformat(self, path, el, val):
        try:
            datetime.strptime(el.text, val).date()
        except ValueError as e:
            self.add_message(e.message, path, el)

    def handle_range(self, path, el, val):
        if not int(el.text) in range(*val):
            msg = '"%s" out of range' % el.text
            self.add_message(msg, path, el)

    def handle_type(self, path, el, val):
        assert val in ('int', 'isbn13', 'isbn', 'decimal')
        getattr(self, 'check_' + val)(path, el)

    def check_int(self, path, el):
        invalid = [c for c in el.text if c not in string.digits]
        if invalid:
            msg = 'Not an Integer. Invalid chars %s.' % invalid
            self.add_message(msg, path, el)

    def check_isbn13(self, path, el):
        if not isbnlib.is_isbn13(el.text):
            msg = 'Invalid ISBN13: %s' % el.text
            self.add_message(msg, path, el)

    def check_isbn(self, path, el):
        if not isbnlib.is_isbn13(el.text) and not isbnlib.is_isbn10(el.text):
            msg = 'Invalid ISBN: %s' % el.text
            self.add_message(msg, path, el)

    def check_decimal(self, path, el):
        try:
            Decimal(el.text)
        except InvalidOperation:
            msg = 'Invalid decimal value %s' % el.text
            self.add_message(msg, path, el)

if __name__ == '__main__':
    from onixcheck import profiles, data

    of = OnixFix(data.VALID_GOOGLE_ONIX_30_SAMPLE, profiles.GOOGLE_ONIX_30)
    of.validate()

    for message in of.messages:
        print(message.short)
