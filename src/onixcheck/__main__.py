# -*- coding: utf-8 -*-
from __future__ import unicode_literals, print_function
import os
import sys
import logging
from argparse import ArgumentParser, FileType
from onixcheck import validate, __version__
from onixcheck.exeptions import get_logger
from onixcheck.utils import iter_files


DEFAULT_EXTENSIONS = ('xml', 'onx', 'onix')
log = get_logger()


def create_parser():
    """Create a custom commandline parser.
    :rtype ArgumentParser:
    """
    parser = ArgumentParser(
        prog='onixcheck',
        description="Onixcheck v%s - Validate your metadata" % __version__
    )

    # Arguments
    parser.add_argument('infile', nargs='?', type=FileType(mode='rb'), help="Path to Onix file to validate")

    # Options
    parser.add_argument('-p', '--path', help="Path to folder with ONIX files for batch validation")
    parser.add_argument('-s', '--schemas', nargs='*', help="Custom validation schemas")
    parser.add_argument('-e', '--ext', nargs='*', help="File Extensions to validate. Default: xml onx onix")
    parser.add_argument('-r', '--recursive', action='store_true', help='Recurse into subfolders')
    parser.add_argument('-d', '--debug', action="store_true", help='Show debug information')

    # Defaults
    parser.set_defaults(ext=DEFAULT_EXTENSIONS)
    return parser


def main(argv=None):
    """Command line app main function.

    :param list | None argv: Overrides command options (for libuse or testing)
    """
    parser = create_parser()

    args = parser.parse_args() if argv is None else parser.parse_args(argv)

    schemas = ('xsd',) if not args.schemas else tuple(args.schemas)

    if args.debug:
        logging.basicConfig(
            level=logging.DEBUG,
            format='%(asctime)s - %(levelname)s - %(name)s - %(message)s'
        )
        print('DEBUG logging enabled.')

    log.debug('TYPE of path: %s' % type(args.path))
    # validate current working dir
    if not args.infile and not args.path:
        args.path = os.getcwdu()
        log.debug('NEW TYPE of path: %s' % type(args.path))

    all_valid = True

    if args.infile:
        log.debug('TYPE of infile.name: %s' % type(args.infile.name))
        print('Validating: %s' % args.infile.name)
        messages = validate(args.infile, schemas)
        is_valid = messages == []
        if is_valid:
            print('VALID - No errors found')
        else:
            print('INVALID - errors found:', file=sys.stderr)
            all_valid = False
            for msg in messages:
                if args.debug:
                    print(msg, file=sys.stderr)
                else:
                    print(msg.short, file=sys.stderr)

    if args.path:
        tree_or_dir = 'tree' if args.recursive else 'dir'
        print()
        print('Validating all files in %s %s' % (tree_or_dir, args.path))

        for onix_file_path in iter_files(args.path, args.ext, args.recursive):
            print()
            print('Validating: %s' % onix_file_path)
            with open(onix_file_path, 'rb') as onix_file:
                messages = validate(onix_file, schemas)
                is_valid = messages == []

            if is_valid:
                print('VALID - No errors found')
            else:
                print('INVALID - errors found:', file=sys.stderr)
                all_valid = False
                for msg in messages:
                    if args.debug:
                        print(msg.short, file=sys.stderr)
                    else:
                        print(msg, file=sys.stderr)
    if all_valid:
        return 0
    else:
        return 1


if __name__ == '__main__':
    sys.exit(main())
