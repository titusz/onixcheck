# Onixcheck - Book Trade Metadata Validation

[![PyPI Package](http://img.shields.io/pypi/v/onixcheck.svg?style=flat-square)](https://pypi.python.org/pypi/onixcheck)
[![PyPI Downloads](http://img.shields.io/pypi/dm/onixcheck.svg?style=flat-square)](https://pypi.python.org/pypi/onixcheck)

## Introduction

[ONIX for Books](http://www.editeur.org/11/Books/) is an international XML standard for the publishing and book
trade industry.

`onixcheck` is a Python library and command line tool for validating ONIX metadata. It allows you to validate
ONIX versions 2.1, 3.0, and 3.1 against the official XML Schema.

- Free software: Apache License 2.0

## Installation

### Using uv (Recommended)

For the fastest and most reliable installation, we recommend using the
[uv tool](https://docs.astral.sh/uv/getting-started/installation/):

```bash
uv tool install onixcheck
```

### Using pip

If you have Python or PyPy installed on your system:

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

Enable debug information (more detailed error output):

```bash
onixcheck myonixfile.xml --debug
```

Show help:

```bash
onixcheck -h
```

### Using onixcheck as a Python library

Simple usage with `onixcheck.validate`:

```python
import onixcheck
errors = onixcheck.validate('src/onixcheck/data/invalid_onix3_ref.xml')
print(errors[0].short)
```

```bash
ERROR - SCHEMASV - invalid_onix3_ref.xml:4:0 - Element 'SentDateTime': This element is not expected. Expected is ( Sender ).
```

`errors` is either a list of `Message` objects (INVALID file) or an empty list (VALID file)

### Custom schema validation

You can specify custom schema types for validation:

```python
import onixcheck
errors = onixcheck.validate('myfile.xml', schemas=('xsd', 'rng', 'google'))
```

Contributions and suggestions are welcome. Please feel free to open issues or pull requests on GitHub.
