# -*- coding: utf-8 -*-
"""Paths to bundled Schema files"""
import sys
import os

if getattr(sys, 'frozen', False):
    # we are running in a |PyInstaller| bundle
    basedir = sys._MEIPASS
else:
    # we are running in a normal Python environment
    basedir = os.path.dirname(__file__)

O21_XSD_SHORT = os.path.join(basedir, 'xsd2.1', 'ONIX_BookProduct_Release2.1_short.xsd')
O21_XSD_REFERENCE = os.path.join(basedir, 'xsd2.1', 'ONIX_BookProduct_Release2.1_reference.xsd')

O30_XSD_SHORT = os.path.join(basedir, 'xsd3.0', 'ONIX_BookProduct_3.0_short.xsd')
O30_XSD_REFERENCE = os.path.join(basedir, 'xsd3.0', 'ONIX_BookProduct_3.0_reference.xsd')

O30_RNG_SHORT = os.path.join(basedir, 'rng3.0', 'ONIX_BookProduct_3.0_short.rng')
O30_RNG_REFERENCE = os.path.join(basedir, 'rng3.0', 'ONIX_BookProduct_3.0_reference.rng')

GOOGLE_O30_YML_REFERENCE = os.path.join(basedir, 'google', 'google_onix_30.yaml')

BIBLON_O30_YML_REFERENCE = os.path.join(basedir, 'biblon', 'biblon_onix_30.yaml')
