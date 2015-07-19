# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import os
from atom.atom import Atom
from atom.enum import Enum
from atom.list import List
from atom.scalars import Unicode
from os.path import join
from onixcheck.exeptions import OnixError
from lxml import etree
import logging

log = logging.getLogger('__name__')


class OnixVersion(Enum):
    o21 = '2.1'
    o30 = '3.0'


class OnixStyle(Enum):
    short = 'short'
    reference = 'reference'


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


class OnixMeta(Atom):
    """A simple class representing low level onix file meta data."""

    xml_version = Unicode()
    xml_encoding = Unicode()
    onix_version = Unicode()
    onix_style = Unicode()
    namespaces = List()

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
            onix_style = 'short'
        elif root.tag.endswith('ONIXMessage'):
            onix_style = 'reference'
        else:
            raise OnixError('Bad root element: %s' % root.tag)

        namespaces = list(root.nsmap.values())
        return cls(
            xml_version=tree.docinfo.xml_version,
            xml_encoding=tree.docinfo.encoding,
            onix_version=root.attrib.get('release'),
            onix_style=onix_style,
            namespaces=namespaces
        )

    @classmethod
    def from_file(cls, infile):
        tree = etree.parse(infile)
        return cls.from_tree(tree)

    def get_ns_string(self):
        if self.onix_version == OnixVersion.o21:
            tpl = 'http://www.editeur.org/onix/2.1/%s'
        elif self.onix_version == OnixVersion.o30:
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
