=========
onixcheck
=========

.. list-table::
    :stub-columns: 1

    * - docs
      - |docs|
    * - tests
      - | |travis| |appveyor|
        |
    * - package
      - |version| |downloads|

.. |docs| image:: https://readthedocs.org/projects/onixcheck/badge/?style=flat-square
    :target: https://readthedocs.org/projects/onixcheck
    :alt: Documentation Status

.. |travis| image:: http://img.shields.io/travis/titusz/onixcheck/master.svg?style=flat-square&label=Travis
    :alt: Travis-CI Build Status
    :target: https://travis-ci.org/titusz/onixcheck

.. |appveyor| image:: https://img.shields.io/appveyor/ci/titusz/onixcheck/master.svg?style=flat-square&label=AppVeyor
    :alt: AppVeyor Build Status
    :target: https://ci.appveyor.com/project/titusz/onixcheck

.. |version| image:: http://img.shields.io/pypi/v/onixcheck.svg?style=flat-square
    :alt: PyPI Package latest release
    :target: https://pypi.python.org/pypi/onixcheck

.. |downloads| image:: http://img.shields.io/pypi/dm/onixcheck.svg?style=flat-square
    :alt: PyPI Package monthly downloads
    :target: https://pypi.python.org/pypi/onixcheck

ONIX validation library and command line tool
=============================================

`ONIX for Books <http://www.editeur.org/11/Books/>`_ is an international XML
standard for the publishing and book trade industry. Onixcheck allows you
to validate ONIX versions 2.1 and 3.0 against the official XML Schema.


* Free software: BSD license

Installation
============

On Windows you can download the standalone binary command line tool:
`onixcheck-0.8.0_win.zip <https://github.com/titusz/onixcheck/releases/download/v0.8.0/onixcheck-0.8.0_win.zip>`_

If you have Python or PyPy installed on your system you can do the usual::

    pip install onixcheck


Quickstart
==========

Command line usage examples
---------------------------

Validate all .xml, .onx, .onix files in current directory::

    onixcheck


Validate a single onix file::

    onixcheck myonixfile.xml


Validate all .xml files in /onixdata and its subdirectories::

    onixcheck --path /onixdata --ext xml --recursive


Show help::

    onixcheck -h


Using onixcheck as a python lib
-------------------------------

Simple usage with `onixcheck.validate`::

    import onixcheck
    errors = onixcheck.validate('/somedir/onixfile.xml')

`errors` is either a list of `Message` objects
(INVALID file) or an empty list (VALID file)

Documentation
=============

https://onixcheck.readthedocs.org/

Development
===========

To run the all tests run::

    tox

