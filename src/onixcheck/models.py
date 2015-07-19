# -*- coding: utf-8 -*-
from __future__ import unicode_literals
from collections import namedtuple
import os
from os.path import join
import re
from onixcheck.exeptions import OnixError, get_logger
from lxml import etree


log = get_logger()


class OnixFile(object):

    def __init__(self, infile):
        self.infile = infile
        self.meta = OnixMeta.from_file(infile)
        if hasattr(infile, 'seek'):
            self.infile.seek(0)

    def xml_tree(self):
        tree = etree.parse(self.infile)

        if self.meta.namespaces:
            return tree

        log.debug('Adding namespaces to xml for validation')
        root = tree.getroot()
        ns_root = etree.Element(
            tree.docinfo.root_name,
            root.attrib,
            nsmap={None: self.meta.get_ns_string()}
        )
        ns_root[:] = root[:]

        # Roundtrip to add namespace
        doc = etree.tostring(
            ns_root,
            encoding=tree.docinfo.encoding,
            xml_declaration=True,
            pretty_print=True
        )
        ns_tree = etree.fromstring(doc)
        return etree.ElementTree(ns_tree)

    def get_validator(self):
        """
        :return etree.XMLSchema:
        """
        return etree.XMLSchema(file=self.meta.get_schema_file())


class OnixMeta(object):
    """A simple class representing low level onix file meta data."""

    V21 = '2.1'
    V30 = '3.0'
    SHORT = 'short'
    REFERENCE = 'reference'

    ONIX_VERSIONS = (V21, V30)
    ONIX_STYLES = (SHORT, REFERENCE)

    def __init__(self, xml_version, xml_encoding, onix_version, onix_style, namespaces):
        self.xml_version = xml_version
        self.xml_encoding = xml_encoding
        self.onix_version = onix_version
        self.onix_style = onix_style
        self.namespaces = namespaces

    def __repr__(self):
        msgs = (
            'XML Version:  %s' % self.xml_version,
            'XML Encoding: %s' % self.xml_encoding,
            'ONIX Version: %s' % self.onix_version,
            'ONIX Style:   %s' % self.onix_style,
            'Namespaces:   %s' % self.namespaces,
        )
        return '\n'.join(msgs)

    @classmethod
    def from_tree(cls, tree):
        root = tree.getroot()

        if root.tag.endswith('ONIXmessage'):
            onix_style = cls.SHORT
        elif root.tag.endswith('ONIXMessage'):
            onix_style = cls.REFERENCE
        else:
            raise OnixError('Bad root element: %s' % root.tag)

        onix_version = root.attrib.get('release')
        if onix_version is None:
            log.warning('No release attribute on root element. Try namespace.')
            try:
                if cls.V21 in list(root.nsmap.values())[0]:
                    onix_version = cls.V21
                elif cls.V30 in list(root.nsmap.values())[0]:
                    onix_version = cls.V30
                else:
                    raise OnixError('Could not determin ONIX version.')
            except IndexError:
                raise OnixError('No release attribute and no Namespace :(')

        namespaces = list(root.nsmap.values())
        return cls(
            xml_version=tree.docinfo.xml_version,
            xml_encoding=tree.docinfo.encoding,
            onix_version=onix_version,
            onix_style=onix_style,
            namespaces=namespaces
        )

    @classmethod
    def from_file(cls, infile):
        tree = etree.parse(infile)
        return cls.from_tree(tree)

    def get_ns_string(self):
        if self.onix_version == self.V21:
            tpl = 'http://www.editeur.org/onix/2.1/%s'
        elif self.onix_version == self.V30:
            tpl = 'http://ns.editeur.org/onix/3.0/%s'
        return tpl % self.onix_style

    def get_schema_file(self):
        curdir = os.path.abspath(os.path.dirname(__file__))
        schema_map = {
            '2.1short': join(
                curdir, 'xsd2.1', 'ONIX_BookProduct_Release2.1_short.xsd'
            ),
            '2.1reference': join(
                curdir, 'xsd2.1', 'ONIX_BookProduct_Release2.1_reference.xsd'
            ),
            '3.0short': join(
                curdir, 'xsd3.0', 'ONIX_BookProduct_3.0_short_strict.xsd'
            ),
            '3.0reference': join(
                curdir, 'xsd3.0', 'ONIX_BookProduct_3.0_reference_strict.xsd'
            )
        }
        return schema_map[self.onix_version + self.onix_style]


_BaseMessage = namedtuple('Message', 'level validator location message error_type')


class Message(_BaseMessage):

    def __str__(self):
        return ' | '.join(self._asdict().values())

    @classmethod
    def from_logentry(cls, logentry, filename=''):
        """Instanciate ValidationError lxml LogEntry object

        :param _LogEntry logentry: Validatation error from LXML
        :param str filename: Optional filename to prefix error location
        :return ValidationError:
        """
        l = logentry
        location = '%s:%s:%s' % (filename, l.line, l.column)
        message = l.message or ''
        message = re.sub('({.*?})', '', message)

        return cls(
            level=l.level_name,
            validator=l.domain_name,
            location=location,
            message=message,
            error_type=l.type_name
        )
