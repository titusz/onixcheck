# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import sys
import click
import logging
from onixcheck import validate
from onixcheck.exeptions import get_logger

log = get_logger()


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

    click.echo('Validating: %s' % click.format_filename(infile.name))

    messages = validate(infile)
    is_valid = messages == []

    if is_valid:
        click.echo('VALID - No errors found')
        sys.exit(0)
    else:
        click.echo('INVALID - errors found:')
        for msg in messages:
            click.echo(msg)
        sys.exit(1)
