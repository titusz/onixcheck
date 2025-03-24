# Onixcheck - Book Trade Metadata Validation

[![Documentation Status](https://readthedocs.org/projects/onixcheck/badge/?style=flat-square)](https://readthedocs.org/projects/onixcheck)
[![PyPI Package](http://img.shields.io/pypi/v/onixcheck.svg?style=flat-square)](https://pypi.python.org/pypi/onixcheck)
[![PyPI Downloads](http://img.shields.io/pypi/dm/onixcheck.svg?style=flat-square)](https://pypi.python.org/pypi/onixcheck)

## Introduction

[ONIX for Books](http://www.editeur.org/11/Books/) is an international XML standard for the publishing and book
trade industry.

`onixcheck` is a Python library and command line tool for validating ONIX metadata. It allows you to validate
ONIX versions 2.1 and 3.0.8 against the official XML Schema.

- Free software: BSD license

## Installation

On Windows you can download the standalone binary command line tool:
[onixcheck-0.9.7_win.zip](https://github.com/titusz/onixcheck/releases/download/v0.9.7/onixcheck-0.9.7_win.zip)

If you have Python or PyPy installed on your system you can do the usual:

```bash
pip install onixcheck
```

## Quickstart

### Command line usage examples

Validate all .xml, .onx, .onix files in current directory:

```bash
onixcheck
```

Validate a single onix file:

```bash
onixcheck myonixfile.xml
```

Validate all .xml files in /onixdata and its subdirectories:

```bash
onixcheck --path /onixdata --ext xml --recursive
```

Show help:

```bash
onixcheck -h
```

### Using onixcheck as a python lib

Simple usage with `onixcheck.validate`:

```python
>>> import onixcheck
>>> errors = onixcheck.validate('src/onixcheck/data/invalid_onix3_ref.xml')
>>> print(errors[0].short)
ERROR - SCHEMASV - invalid_onix3_ref.xml:4:0 - Element 'SentDateTime': This element is not expected. Expected is ( Sender ).
```

`errors` is either a list of `Message` objects (INVALID file) or an empty list (VALID file)

## Documentation

https://onixcheck.readthedocs.org/

## Development

To run the all tests run:

```bash
tox
```

Contributions/suggestions are welcome.
