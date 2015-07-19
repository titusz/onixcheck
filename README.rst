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

ONIX validation library and commandline tool

* Free software: BSD license

Installation
============

::

    pip install onixcheck

Quickstart
==========

Command line usage::

    onixcheck myonixfile.xml

Libary usage::

    import onixcheck

    errors = onixcheck.validate('/somedir/onixfile.xml')

Documentation
=============

https://onixcheck.readthedocs.org/

Development
===========

To run the all tests run::

    tox

