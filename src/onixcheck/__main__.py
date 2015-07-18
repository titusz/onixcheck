# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys
import logging
import click
from lxml import etree
from onixcheck.models import OnixMeta, OnixFile

log = logging.getLogger('onixcheck')

SHORT = 'ONIXmessage'
REF = 'ONIXMessage'
NAMEPACES = {
    '3.0': {None: 'http://ns.editeur.org/onix/3.0/reference'}
}


def add_namespace(infile):
    """Add namespaces to xml and return an xml tree"""
    tree = etree.parse(infile)
    root = tree.getroot()
    ns_root = etree.Element(
        tree.docinfo.root_name,
        root.attrib,
        nsmap={None: 'http://ns.editeur.org/onix/3.0/reference'}
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


@click.command()
@click.argument('infile', type=click.File('rb'))
@click.option('--debug', '-d', is_flag=True, help='Show debug information')
@click.version_option(prog_name='Onixcheck')
def main(infile, debug):

    if debug:
        logging.basicConfig(
            level=logging.DEBUG,
            format='%(asctime)s - %(levelname)s - %(name)s - %(message)s'
        )
        click.echo('DEBUG logging enabled')

    click.echo('Validating: %s' % infile.name)

    onix_file = OnixFile(infile)
    log.debug(onix_file.meta)

    validator = onix_file.get_validator()
    result = validator(onix_file.xml_tree())
    click.echo('Valid: %s' % result)
    for err in validator.error_log:
        click.echo('Error: %s' % err)

    if validator.error_log:
        sys.exit(1)
    else:
        sys.exit(0)
