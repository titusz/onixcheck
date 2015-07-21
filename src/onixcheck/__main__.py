# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import os
import sys
import click
import logging
from onixcheck import validate
from onixcheck.exeptions import get_logger
from onixcheck.utils import iter_files


DEFAULT_EXTENSIONS = ('xml', 'onx', 'onix')
log = get_logger()


@click.command()
@click.argument('infile', type=click.File('rb'), required=False)
@click.option('--path', '-p', type=click.Path(exists=True, resolve_path=True), help='Validate all files in path')
@click.option('--ext', '-e', multiple=True, help='Extension to check (default: xml, onx, onix)')
@click.option('--recursive', '-r', default=False, is_flag=True, help='Scan subdirectories in path')
@click.option('--debug', '-d', is_flag=True, help='Show debug information')
@click.version_option(prog_name='Onixcheck')
def main(infile, path, ext, recursive, debug):

    if debug:
        logging.basicConfig(
            level=logging.DEBUG,
            format='%(asctime)s - %(levelname)s - %(name)s - %(message)s'
        )
        click.echo('DEBUG logging enabled')

    # validate current working dir
    if not infile and not path:
        path = os.getcwdu()

    ext = ext or DEFAULT_EXTENSIONS

    all_valid = True

    if infile:
        click.echo('Validating: %s' % click.format_filename(infile.name))
        messages = validate(infile)
        is_valid = messages == []
        if is_valid:
            click.echo('VALID - No errors found')
        else:
            click.echo('INVALID - errors found:')
            all_valid = False
            for msg in messages:
                    click.echo(msg)

    if path:
        tree_or_dir = 'tree' if recursive else 'dir'
        click.echo()
        click.echo('Validating all files in %s %s' % (tree_or_dir, path))

        for onix_file_path in iter_files(path, ext, recursive):
            click.echo()
            click.echo('Validating: %s' % click.format_filename(onix_file_path))
            with open(onix_file_path, 'rb') as onix_file:
                messages = validate(onix_file)
                is_valid = messages == []

            if is_valid:
                click.echo('VALID - No errors found')
            else:
                click.echo('INVALID - errors found:')
                all_valid = False
                for msg in messages:
                    click.echo(msg)
    if all_valid:
        sys.exit(0)
    else:
        sys.exit(1)


if __name__ == '__main__':
    main()
