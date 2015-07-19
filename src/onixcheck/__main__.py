# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys
import logging
import click
from lxml import etree
from onixcheck import validate

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

    messages = validate(infile)
    is_valid = not messages

    if is_valid:
        click.echo('VALID - No errors found')
    else:
        for msg in messages:
            click.echo(msg)

    if is_valid:
        sys.exit(0)
    else:
        sys.exit(1)
